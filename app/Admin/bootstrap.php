<?php

/**
 * Laravel-admin - admin builder based on Laravel.
 * @author z-song <https://github.com/z-song>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 * Encore\Admin\Form::forget(['map', 'editor']);
 *
 * Or extend custom form field:
 * Encore\Admin\Form::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */

use App\Admin\Extensions\Displays\CardModal;
use App\Admin\Filters\BetweenDate;
use Encore\Admin\Grid\Column;
use Encore\Admin\Grid\Filter;

//new BetweenDate('123');
Filter::extend('betweenDate' , BetweenDate::class);

Encore\Admin\Form::forget(['map', 'editor']);

Column::extend('cardModal', CardModal::class);
