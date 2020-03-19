<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\CustomerHealth;
use Carbon\Carbon;
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

                    $today = Carbon::today();

                    $counter = CustomerHealth::query()
                        ->whereDate('created_at', $today)
                        ->count();

                    $data = [
                        "name"  => '新的客户健康调研',
                        "count" => $counter,
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
