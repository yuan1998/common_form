<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\Exports\CustomerHealthExport;
use App\Models\CustomerHealth;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CustomerHealthController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '客户健康调研报告';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CustomerHealth);
        $grid->exporter(new CustomerHealthExport());
        $grid->disableCreateButton();
        $grid->model()->orderBy('created_at', 'DESC');


        if (Admin::user()->isRole('administrator')) {
            $grid->actions(function ($actions) {
                // 去掉编辑
                $actions->disableEdit();
                // 去掉查看
                $actions->disableView();
            });

        } else {
            $grid->disableActions();
        }


        $grid->column('id', __('编号'));
        $grid->column('name', __('客户姓名'));
        $grid->column('phone', __('客户电话'));
        $grid->column('id_card', __('客户身份证'));
        $grid->column('sex', __('性别'))->display(function ($val) {
            return data_get(CustomerHealth::$sexDetailList, $val, '未知');
        });
        $grid->column('body_temperature', __('体温'))->display(function ($val) {
            return $val . " ℃";
        });
        $grid->column('created_at', __('提交日期'));
        $grid->column('question_data', __('其他问题'))->cardModal();

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(CustomerHealth::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('phone', __('Phone'));
        $show->field('id_card', __('Id card'));
        $show->field('sex', __('Sex'));
        $show->field('body_temperature', __('Body temperature'));
        $show->field('question_data', __('Question data'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new CustomerHealth);

        $form->text('name', __('Name'));
        $form->mobile('phone', __('Phone'));
        $form->text('id_card', __('Id card'));
        $form->number('sex', __('Sex'));
        $form->text('body_temperature', __('Body temperature'));
        $form->text('question_data', __('Question data'));

        return $form;
    }
}
