<?php

namespace App\Admin\Extensions\Displays;

use Encore\Admin\Grid\Displayers\AbstractDisplayer;

class CardModal extends AbstractDisplayer
{


    public function makeQuestionModelContent($value)
    {

        if (isJsonArray($value)) {
            $jsonData = json_decode($value, true);
            return $this->mapQuestionsData($jsonData);
        } else {
            return <<<EOT
<div>{$value}</div> 
EOT;

        }


    }


    public function mapQuestionsData($data)
    {
        $resultArray = [];

        foreach ($data as $item) {
            $text   = $item['value'] == "1" ? "是" : "否";
            $string = <<<EOT
<div class="card-item" style="padding-bottom: 15px;">
    <div class="card-label">Q .{$item['question']}</div>
    <div class="card-text">A .$text</div>
</div>
EOT;

            array_push($resultArray, $string);
        }
        $resultString = implode("", $resultArray);

        return <<<EOT
<div class="card-container">$resultString</div>
EOT;
    }

    public function display()
    {
        if (empty($this->value)) {
            return '-无-';
        }
        $id = "yuan-" . random_int(1, 100000);

        $result = $this->makeQuestionModelContent($this->value);
        return <<<EOT
<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#$id">
  查看详细问题
</button>
<div class="modal fade" id="$id" tabindex="-1" role="dialog" aria-labelledby="#$id" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">详细问题</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                $result
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭窗口</button>
            </div>
        </div>
    </div>
</div>

EOT;

    }
}
