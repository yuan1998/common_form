<?php

namespace App\Admin\Extensions\Exports;

use App\Models\CustomerHealth;
use Encore\Admin\Grid\Exporters\ExcelExporter;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithStrictNullComparison;


class TTTestFormExport extends ExcelExporter implements WithMapping, ShouldAutoSize, WithStrictNullComparison
{

    protected $fileName = '客户健康报告.xlsx';

    protected $columns = [
        'id'               => '编号',
        'name'             => '客户姓名',
        'phone'            => '客户电话',
        'question_data'    => '详细问题',
    ];


    public function mapQuestionsData($data)
    {
        $resultArray = [];

        foreach ($data as $item) {
            $text   = $item['value'] == "1" ? "是" : "否";
            $string = <<<EOT
            Q .{$item['question']} \n
            A .$text\n
EOT;

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
        $sex = data_get(CustomerHealth::$sexDetailList, $form->sex, '未知');
        return [
            $form->id,
            $form->name,
            $sex,
            $form->phone,
            $form->body_temperature . " ℃ ",
            $this->makeQuestionString($form->question_data),
        ];
    }

}
