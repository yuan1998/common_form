<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\Exports\XXlBaseFormExport;
use App\Models\XXlBaseForm;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class XXlBaseFormController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '信息流线索汇总';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new XXlBaseForm);
        $grid->exporter(new XXlBaseFormExport());

        $grid->disableCreateButton();
        $grid->model()->orderBy('created_at', 'DESC');


        $grid->filter(function ($filter) {
            $filter->expand();
            $filter->disableIdFilter();

            $filter->column(1 / 2, function (Grid\Filter $filter) {
                $filter->between('created_at', '时间')
                    ->date();
            });
        });


        if (Admin::user()->isRole('administrator')) {
            $grid->actions(function ($actions) {
                // 去掉编辑
//                $actions->disableEdit();
                // 去掉查看
                $actions->disableView();
            });

        } else {
            $grid->disableActions();
        }
        $grid->disableRowSelector();
        $grid->fixColumns(3);

        $grid->column('created_at', __('时间'));
        $grid->column('name', __('客户姓名'));
        $grid->column('phone', __('客户电话'));
        $grid->column('channel', __('线索渠道'))->display(function ($val) {
            return $val ?? '无渠道';
        });
        $grid->column('url', __('表单链接'))->display(function ($val) {
            return $val ?? '无链接';
        });
        $grid->column('question_data', __('客户问题'));

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
        $show = new Show(XXlBaseForm::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('phone', __('Phone'));
        $show->field('channel', __('Channel'));
        $show->field('question_data', __('Question data'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    public function destroy($id)
    {
        return $this->form()->destroy($id);
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new XXlBaseForm);

        $form->text('name', __('Name'));
        $form->mobile('phone', __('Phone'));
//        $form->text('question_data', __('Question data'));
        $form->text('channel', '渠道');
        $form->text('url', '表单链接');

        return $form;
    }
}
