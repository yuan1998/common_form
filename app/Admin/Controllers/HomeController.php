<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->title('仪表盘')
            ->description('数据预览')
            ->row(function (Row $row) {

                $row->column(4, function (Column $column) {
                    $data = [
                        "name"  => '今天的客户健康调研',
                        "count" => 150,
                        "url"   => "/admin/customer-healths",
                        "icon"  => "fa-copy",
                    ];

                    $column->append(view('adminViews.card-box', [
                        'data' => $data
                    ]));
                });
            });
    }
}
