<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CustomerHealthStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'             => 'required|string',
//            'sex'              => 'required|inter',
            'phone'            => 'required|string',
            'id_card'          => 'required|string',
            'body_temperature' => 'required|string',
//            'question_data'    => 'required|json',

        ];
    }
}
