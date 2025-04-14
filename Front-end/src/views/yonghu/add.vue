<template>
    <div class="yonghu-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span class="title"> Add User</span>
            </div>
            <div class="form-database-form">


                <el-form :model="form" ref="formModel" label-width="130px" status-icon validate-on-rule-change>
                    <el-form-item label="User Name" prop="yonghuming" required
                                  :rules="[{required:true, message:'Please enter user name'}, {validator:rule.checkRemote, message:'Content is repetitive', checktype:'insert', module:'yonghu', col:'yonghuming', trigger:'blur'}]">
                        <el-input placeholder="Please enter User name" style="width:250px;" v-model="form.yonghuming"/>
                    </el-form-item>

                    <el-form-item label="Password" prop="mima" required :rules="[{required:true, message:'Please enter password'}]">
                        <el-input placeholder="Please enter password" style="width:250px;" v-model="form.mima"/>
                    </el-form-item>

                    <el-form-item label="Name" prop="xingming" required :rules="[{required:true, message:'Please enter name'}]">
                        <el-input placeholder="Please enter name" style="width:250px;" v-model="form.xingming"/>
                    </el-form-item>

                    <el-form-item label="Gender" prop="xingbie">
                        <el-select placeholder="Please select" v-model="form.xingbie">
                            <el-option label="Male" value="Male"></el-option>
                            <el-option label="Female" value="Female"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="Phone Number" prop="shouji" :rules="[{validator:rule.checkPhone, message:'Please enter valid phone number'}]">
                        <el-input placeholder="Please enter valid phone number" style="width:250px;" v-model="form.shouji"/>
                    </el-form-item>

                    <el-form-item label="Email" prop="youxiang" :rules="[{type:'email', message:'Please enter valid email adress'}]">
                        <el-input placeholder="Please enter valid email address" style="width:250px;" v-model="form.youxiang"/>
                    </el-form-item>

                    <el-form-item label="ID" prop="shenfenzheng"
                                  :rules="[{validator:rule.checkCard, message:'Please enter valid ID number'}]">
                        <el-input placeholder="Please enter valid ID number" style="width:250px;" v-model="form.shenfenzheng"/>
                    </el-form-item>

                    <el-form-item label="Avater" prop="touxiang">
                        <e-upload-image v-model="form.touxiang"></e-upload-image>
                    </el-form-item>

                    <el-form-item v-if="btnText">
                        <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                    </el-form-item>
                </el-form>

            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
    .yonghu-add {

    }
</style>
<script>
    import api from '@/api'
    import rule from '@/utils/rule'
    import {extend} from '@/utils/extend'


    export default {
        name: 'yonghu-add',
        data() {
            return {
                rule,
                loading: false,
                form: {
                    yonghuming: '',
                    mima: '',
                    xingming: '',
                    xingbie: '',
                    shouji: '',
                    youxiang: '',
                    shenfenzheng: '',
                    touxiang: '',


                },


            }
        },
        watch: {},
        props: {
            isRead: {
                type: Boolean,
                default: true
            },
            btnText: {
                type: String,
                default: 'Submit'
            },
        },

        computed: {},
        methods: {
            submit() {
                this.$refs.formModel.validate().then(res => {
                    if (this.loading) return;
                    this.loading = true;
                    var form = this.form;

                    this.$post(api.yonghu.insert, form).then(res => {
                        this.loading = false;
                        if (res.code == api.code.OK) {
                            this.$message.success('Add Successfully');
                            this.$emit('success', res.data);
                            this.$refs.formModel.resetFields();
                            this.loadInfo();
                        } else {
                            this.$message.error(res.msg);
                        }
                    }).catch(err => {
                        this.loading = false;
                        this.$message.error(err.message);
                    })

                }).catch(err => {
                    console.log(err.message);
                })

            },
            loadInfo() {

                var form = this.form;
                // 获取模块得数据
                this.loading = true;
                this.$post(api.yonghu.create, {
                    id: this.$route.query.id
                }).then(res => {
                    this.loading = false;
                    if (res.code == api.code.OK) {
                        extend(this, res.data);
                    } else {
                        this.$message.error(res.msg);
                        this.$router.go(-1);
                    }
                }).catch(err => {
                    this.$message.error(err.message);
                    this.$router.go(-1);
                });
            },
        },
        created() {
            this.loadInfo();
        },
        mounted() {
        },
        destroyed() {
        }
    }
</script>
