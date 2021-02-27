<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class QuestionStoreRequest extends FormRequest
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
            'phone' =>
                [
                    'required',
                    Rule::unique('questionnaires')->where(function ($query) {
                        $phone    = $this->request->get('phone');
                        $hospital = $this->request->get('hospital', 'xahm');

                        return $query->where('phone', $phone)
                            ->where('hospital', $hospital);
                    }),
                ],

        ];
    }
}
