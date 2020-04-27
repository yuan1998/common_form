;(function () {
    'use strict'

    const app = new Vue({
        el     : '#app',
        data   : {
            hi          : 'Yo.',
            submiting   : false,
            submited    : false,
            baseForm    : {
                name            : '',
                phone           : '',
                sex             : '',
                id_card         : '',
                body_temperature: '',
            },
            questionList: [
                {
                    question: '近两周内是否曾去过湖北、温州或其他有病例报告的社区?',
                    value   : '',
                    type    : 'radio',
                },
                {
                    question: '近两周内是否接触过疫点的发热或有呼吸道症状的患者?',
                    value   : '',
                    type    : 'radio',
                },
                {
                    question: '近两周内是否接触过新冠病毒感染者?',
                    value   : '',
                    type    : 'radio',
                },
                {
                    question: '近两周内是否有出现过发热?',
                    value   : '',
                    type    : 'radio',
                },
                {
                    question: '有无聚集性发病?',
                    value   : '',
                    type    : 'radio',
                },
            ],
        },
        methods: {
            validateIdCard(id) {
                var format = /^(([1][1-5])|([2][1-3])|([3][1-7])|([4][1-6])|([5][0-4])|([6][1-5])|([7][1])|([8][1-2]))\d{4}(([1][9]\d{2})|([2]\d{3}))(([0][1-9])|([1][0-2]))(([0][1-9])|([1-2][0-9])|([3][0-1]))\d{3}[0-9xX]$/;
                //号码规则校验
                if (!format.test(id)) {
                    return false;
                }
                //区位码校验
                //出生年月日校验   前正则限制起始年份为1900;
                let year     = id.substr(6, 4),//身份证年
                    month    = id.substr(10, 2),//身份证月
                    date     = id.substr(12, 2),//身份证日
                    time     = Date.parse(month + '-' + date + '-' + year),//身份证日期时间戳date
                    now_time = Date.parse(new Date()),//当前时间戳
                    dates    = (new Date(year, month, 0)).getDate();//身份证当月天数
                if (time > now_time || date > dates) {
                    return false
                }
                //校验码判断
                let c        = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];   //系数
                let b        = [ '1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2' ];  //校验码对照表
                let id_array = id.split("");
                let sum      = 0;
                for (let k = 0 ; k < 17 ; k++) {
                    sum += parseInt(id_array[ k ]) * parseInt(c[ k ]);
                }
                let result = id_array[ 17 ].toUpperCase() != b[ sum % 11 ].toUpperCase();
                return !result;

            },

            validateQuestions() {
                return this.questionList.findIndex((item) => !item.value) === -1;
            },

            formValidate() {
                let errMsg                                          = '';
                let { name, phone, sex, id_card, body_temperature } = this.baseForm;

                let intTemperature = parseInt(body_temperature);
                console.log('intTemperature :', intTemperature);

                if (!name) {
                    errMsg = '请输入姓名';
                } else if (!phone) {
                    errMsg = '请输入电话';
                } else if (!(/^1([3456789])\d{9}$/.test(phone))) {
                    errMsg = '请输入正确的电话号码';
                } else if (!sex) {
                    errMsg = '请选择你的性别';
                } else if (!id_card) {
                    errMsg = '请输入身份证号码';
                } else if (!this.validateIdCard(id_card)) {
                    errMsg = '请输入正确的身份证号码';
                } else if (!body_temperature) {
                    errMsg = '请输入最近的体温情况';
                } else if (!intTemperature || !(intTemperature > 30 && intTemperature < 44)) {
                    errMsg = '请输入正确的体温情况';
                } else if (!this.validateQuestions()) {
                    errMsg = '请输入仔细回答上方的问题';
                }

                if (errMsg) {
                    Swal.fire(
                        '错误!',
                        errMsg + '!',
                        'error'
                    );
                    return false;
                }

                return {
                    ...this.baseForm,
                    question_data: JSON.stringify(this.questionList),
                };

            },
            async handleSubmit() {
                let data = this.formValidate();


                if (data && !this.submiting) {

                    let test = this.submited ? await Swal.fire({
                        title             : '提示',
                        text              : "你已提交检查数据,是否重新提交?",
                        icon              : 'warning',
                        showCancelButton  : true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor : '#d33',
                        confirmButtonText : '确定提交',
                        cancelButtonText  : '点错了',
                    }) : { value: true };

                    console.log('test :', test);

                    if (test && test.value) {
                        this.submiting = true;
                        swal.fire({
                            title            : '',
                            html             : `
                            <div class="save_loading">
                                <svg viewBox="0 0 140 140" width="140" height="140"><g class="outline"><path d="m 70 28 a 1 1 0 0 0 0 84 a 1 1 0 0 0 0 -84" stroke="rgba(0,0,0,0.1)" stroke-width="4" fill="none" stroke-linecap="round" stroke-linejoin="round"></path></g><g class="circle"><path d="m 70 28 a 1 1 0 0 0 0 84 a 1 1 0 0 0 0 -84" stroke="#71BBFF" stroke-width="4" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-dashoffset="200" stroke-dasharray="300"></path></g></svg>
                            </div>
                            <div>
                                <h4>请稍等...</h4>
                            </div>
                            `,
                            showConfirmButton: false,
                            allowOutsideClick: false
                        });

                        axios.post('/api/customer-health/', data).then((response, b, c) => {
                            this.submiting = false;

                            if (response.status === 200) {
                                this.submited = true;
                                Swal.fire(
                                    '提交成功!',
                                    '我们会尽快核实你的信息!',
                                    'success'
                                );
                            } else {
                                Swal.fire(
                                    '错误!',
                                    '发生错误,请联系管理员!',
                                    'error'
                                );
                            }
                        });
                    }

                }

            }
        }

    })

})();
