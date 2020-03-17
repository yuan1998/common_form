<?php

namespace App\Admin\Extensions\Exports;

use App\Models\CustomerHealth;
use Encore\Admin\Grid\Exporters\ExcelExporter;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithStrictNullComparison;


class CustomerHealthExport extends ExcelExporter implements WithMapping,ShouldAutoSize,WithStrictNullComparison
{

    protected $fileName = '客户健康报告.xlsx';

    protected $columns = [
        'id'               => '编号',
        'name'             => '客户姓名',
        'sex'              => '性别',
        'phone'            => '客户电话',
        'body_temperature' => '体温',
        'question_data'    => '详细问题',
    ];


    public function map($form): array
    {
        $sex = data_get(CustomerHealth::$sexDetailList, $form->sex, '未知');
        return [
            $form->id,
            $form->name,
            $sex,
            $form->phone,
            $form->body_temperature . " ℃ ",
            $form->question_data,
        ];
    }

}
