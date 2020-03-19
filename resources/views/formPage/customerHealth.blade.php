<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>客户健康调研</title>
    <link rel="stylesheet" href="{{asset("css/customerHealth/app.min.css")}}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@9.10.2/dist/sweetalert2.min.css">
</head>
<body>

<main id="app" style="display: none;" :style="'display:block;'">
    @verbatim
        <div class="container-rem">
            <header class="headerContent">
                <div class="title">
                    画美客户健康调研
                </div>
                <div class="detailText">
                    为确保大家在防疫期间就诊更加安全高效，请您根据提示如实填写相关信息。
                </div>
                <div class="detailText light">
                    请务必确保信息的准确性。
                </div>
            </header>
            <div class="contentBox">
                <div class="questionForm">
                    <div class="questionItem">
                        <div class="questionTitle">
                            姓名
                        </div>
                        <div class="questionOption">
                            <input v-model="baseForm.name"
                                   type="text"
                                   class="questionInput" name="name" placeholder="请输入真实姓名">
                        </div>

                    </div>
                    <div class="questionItem">
                        <div class="questionTitle">
                            身份证件号码
                        </div>
                        <div class="questionOption">
                            <input v-model="baseForm.id_card" type="text" class="questionInput" name="id_card"
                                   placeholder="请输入证件号码">
                        </div>

                    </div>
                    <div class="questionItem">
                        <div class="questionTitle">
                            性别
                        </div>
                        <div class="questionOption questionRadio">
                            <label class="optionLabel">
                                <input type="radio" v-model="baseForm.sex" name="sex" value="1">
                                <i class="radio-icon"></i>
                                男
                            </label>
                            <label class="optionLabel">
                                <input type="radio" v-model="baseForm.sex" name="sex" value="2">
                                <i class="radio-icon"></i>
                                女
                            </label>

                        </div>
                    </div>
                    <div class="questionItem">
                        <div class="questionTitle">
                            手机号码
                        </div>
                        <div class="questionOption">
                            <input type="text"
                                   v-model="baseForm.phone"
                                   class="questionInput" name="phone" placeholder="请输入手机号码">
                        </div>

                    </div>
                    <div class="questionItem">
                        <div class="questionTitle">
                            体温
                        </div>
                        <div class="questionOption">
                            <input v-model="baseForm.body_temperature"
                                   type="tel" class="questionInput" name="body_temperature" placeholder="请输入现在的体温情况">
                        </div>

                    </div>

                    <div class="questionItem" v-for="(question,index) in questionList">
                        <div class="questionTitle">
                            {{question.question}}
                        </div>
                        <div class="questionOption questionRadio">
                            <label class="optionLabel">
                                <input type="radio" :name="'question' + index" v-model="question.value" value="0">
                                <i class="radio-icon"></i>
                                是
                            </label>
                            <label class="optionLabel">
                                <input type="radio" :name="'question' + index" v-model="question.value" value="1">
                                <i class="radio-icon"></i>
                                否
                            </label>

                        </div>
                    </div>

                </div>

            </div>
            <div class="submitButton" @click="handleSubmit">
                提交
            </div>
        </div>

    @endverbatim
</main>

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.11/dist/vue.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios@0.19.2/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.10.2/dist/sweetalert2.min.js"></script>
<script src="{{asset("js/customerHealth/app.js")}}"></script>
</body>
</html>
