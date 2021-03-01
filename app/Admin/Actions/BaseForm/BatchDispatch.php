<?php

namespace App\Admin\Actions\BaseForm;

use App\Models\Administrator;
use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class BatchDispatch extends BatchAction
{
    public $name = '分配对话';

    public function handleActionPromise()
    {
        $pre = parent::handleActionPromise();
        return <<<SCIPRT
//<![CDATA[
         $pre
         Swal.fire({
                title            : '',
                html             : '<div class="save_loading"><svg viewBox="0 0 140 140" width="140" height="140"><g class="outline"><path d="m 70 28 a 1 1 0 0 0 0 84 a 1 1 0 0 0 0 -84" stroke="rgba(0,0,0,0.1)" stroke-width="4" fill="none" stroke-linecap="round" stroke-linejoin="round">\<\/path>\<\/g><g class="circle"><path d="m 70 28 a 1 1 0 0 0 0 84 a 1 1 0 0 0 0 -84" stroke="#71BBFF" stroke-width="4" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-dashoffset="200" stroke-dasharray="300">\<\/path>\<\/g>\<\/svg>\<\/div><div><h4>请稍等...\<\/h4>\<\/div>',
                showConfirmButton: false,
                allowOutsideClick: false
            });
   
//]]>

SCIPRT;
    }

    public function handle(Collection $collection, Request $request)
    {
        $userId = $request->get('user_id');
        if (!$userId || !$user = Administrator::find($userId))
            return $this->response()->swal()->error('分配给错误的用户!');

        $user->baseForm()->attach($collection->pluck('id'));

        return $this->response()->swal()->success('分配成功')->refresh();
    }

    public function form()
    {
        $adminUser = Administrator::query()
            ->whereHas('roles', function ($query) {
                $query->where('slug', 'base_form_dispatch');
            })->get()->pluck('username', 'id');

        $this->select('user_id', '用户')->options($adminUser)->required();
    }

}
