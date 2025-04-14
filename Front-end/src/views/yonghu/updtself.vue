<template>
    <div class="yonghu-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix updt">
                <el-page-header @back="$router.go(-1)" content="Modify User">
                </el-page-header>
            </div>
            <div class="form-database-form">


                <el-form :model="form" ref="formModel" label-width="130px" status-icon validate-on-rule-change>
                    <el-form-item label="User Name" prop="yonghuming" required
                                  :rules="[{required:true, message:'Please enter user name'}]">
                        <el-input placeholder="Please enter User Name" style="width:250px;" v-model="form.yonghuming"/>
                    </el-form-item>

                    <el-form-item label="Name" prop="xingming" required :rules="[{required:true, message:'Please enter name'}]">
                        <el-input placeholder="Please enter name" style="width:250px;" v-model="form.xingming"/>
                    </el-form-item>

                    <el-form-item label="Gender" prop="xingbie">
                        <el-select v-model="form.xingbie">
                            <el-option label="Male" value="Male"></el-option>
                            <el-option label="Female" value="Female"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="Phone Number" prop="shouji" :rules="[{validator:rule.checkTel, message:'Plase enter valid phone number'}]">
                        <el-input placeholder="Please enter valid phone number" style="width:250px;" v-model="form.shouji"/>
                    </el-form-item>

                    <el-form-item label="Email" prop="youxiang" :rules="[{type:'email', message:'Please enter valid email address'}]">
                        <el-input placeholder="Please enter valid enmail address" style="width:250px;" v-model="form.youxiang"/>
                    </el-form-item>

                    <el-form-item label="ID" prop="shenfenzheng"
                                  :rules="[{validator:rule.checkCard, message:'Please enter valid ID number'}]">
                        <el-input placeholder="Please enter valid ID number" style="width:250px;" v-model="form.shenfenzheng"/>
                    </el-form-item>

                    <el-form-item label="Avator" prop="touxiang">
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
                    xingming: '',
                    xingbie: '',
                    shouji: '',
                    youxiang: '',
                    shenfenzheng: '',
                    touxiang: '',


                },


            }
        },
        watch: {
            id: {
                handler() {
                    this.loadInfo();
                }
            }
        },
        props: {
            isRead: {
                type: Boolean,
                default: true
            },
            btnText: {
                type: String,
                default: 'Submmit'
            },
            id: {
                type: [String, Number],
                required: true
            },
        },

        computed: {},
        methods: {
            submit() {
                this.$refs.formModel.validate().then(res => {
                    if (this.loading) return;
                    this.loading = true;
                    var form = this.form;

                    this.$post(api.yonghu.update, form).then(res => {
                        this.loading = false;
                        if (res.code == api.code.OK) {
                            this.$message.success('添加成功');
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

                // 更新数据,获取数据
                this.loading = true;
                var form = this.form;
                this.$post(api.yonghu.edit, {
                    id: this.id
                }).then(res => {
                    this.loading = false;
                    if (res.code == api.code.OK) {
                        extend(this, res.data);
                        this.form = res.data.mmm;

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
