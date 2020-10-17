<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use \App\Models\BaseCommonForm;

class BaseCommonFormController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '综合表单/问卷数据';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new BaseCommonForm);

        $grid->model()->orderBy('created_at', 'desc');

        $grid->disableActions();

        $grid->column('id', __('编号'));
        $grid->column('title', __('活动类型'));
        $grid->column('name', __('姓名'));
        $grid->column('phone', __('电话'));
        $grid->column('other_data', __('附加内容'));
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
        $show = new Show(BaseCommonForm::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('Title'));
        $show->field('name', __('Name'));
        $show->field('phone', __('Phone'));
        $show->field('other_data', __('Other data'));
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
        $form = new Form(new BaseCommonForm);

        $form->text('title', __('Title'));
        $form->text('name', __('Name'));
        $form->mobile('phone', __('Phone'));
        $form->text('other_data', __('Other data'));

        return $form;
    }
}
