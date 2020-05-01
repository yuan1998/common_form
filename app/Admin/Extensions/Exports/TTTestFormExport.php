<?php

namespace App\Admin\Extensions\Exports;

use App\Models\CustomerHealth;
use App\Models\TT_TestForm;
use Encore\Admin\Grid\Exporters\ExcelExporter;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithStrictNullComparison;


class TTTestFormExport extends ExcelExporter implements WithMapping, ShouldAutoSize, WithStrictNullComparison
{

    protected $fileName = '客户健康报告.xlsx';

    protected $columns = [
        'id'            => '编号',
        'name'          => '客户姓名',
        'phone'         => '客户电话',
        'channel'       => '渠道',
        'question_data' => '详细问题',
    ];


    public function mapQuestionsData($data)
    {
        $resultArray = [];

        foreach ($data as $key => $item) {
            $string = "$key : $item";
            array_push($resultArray, $string);
        }
        return implode("\n", $resultArray);

    }

    public function makeQuestionString($value)
    {


        if (isJsonArray($value)) {
            $jsonData = json_decode($value, true);
            return $this->mapQuestionsData($jsonData);
        } else {
            return $value;
        }
    }


    public function map($form): array
    {
        $channel = data_get(TT_TestForm::$channelList, $form->channel ?? '未知','未知');
        return [
            $form->id,
            $form->name,
            $form->phone,
            $channel,
            $this->makeQuestionString($form->question_data),
        ];
    }

}
