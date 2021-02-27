<?php

namespace App\Admin\Controllers;

use App\Models\Questionnaire;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Storage;

class QuestionnaireController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '案例-问卷调查';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Questionnaire);

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('phone', __('Phone'));
        $grid->column('gender', __('Gender'));
        $grid->column('comment', __('Comment'));
        $grid->column('images', __('Images'))
            ->display(function ($val) {
                if (!$val) return '-';

                return collect($val)->filter()->map(function ($path) {
                    return "<img src='$path?size=small' style='max-width:100px;max-height:100px' class='img img-thumbnail' />";
                })->implode('&nbsp;');

            });
        $grid->column('other_question', __('Other question'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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
        $show = new Show(Questionnaire::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('phone', __('Phone'));
        $show->field('gender', __('Gender'));
        $show->field('comment', __('Comment'));
        $show->field('images', __('Images'));
        $show->field('other_question', __('Other question'));
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
        $form = new Form(new Questionnaire);

        $form->text('name', __('Name'));
        $form->mobile('phone', __('Phone'));
        $form->text('gender', __('Gender'));
        $form->text('comment', __('Comment'));
        $form->text('images', __('Images'));
        $form->text('other_question', __('Other question'));

        return $form;
    }
}
