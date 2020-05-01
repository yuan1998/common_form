<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\Exports\TTTestFormExport;
use App\Models\TT_TestForm;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TTTestFormController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'App\Models\TT_TestForm';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new TT_TestForm);
        $grid->exporter(new TTTestFormExport());

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


        $grid->column('id', __('Id'));
        $grid->column('name', __('客户姓名'));
        $grid->column('phone', __('客户电话'));
        $grid->column('channel', __('线索渠道'));
        $grid->column('question_data', __('客户问题'));
        $grid->column('created_at', __('提交时间'));

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
        $show = new Show(TT_TestForm::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('phone', __('Phone'));
        $show->field('channel', __('Channel'));
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
        $form = new Form(new TT_TestForm);

        $form->text('name', __('Name'));
        $form->mobile('phone', __('Phone'));
        $form->text('question_data', __('Question data'));

        return $form;
    }
}
