<template>
    <div class="difangmeishi-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span class="title"> Add Market Category</span>
            </div>
            <div class="form-database-form">


                <el-form :model="form" ref="formModel" label-width="190px" status-icon validate-on-rule-change>
                    <el-form-item label="Market Number" prop="meishibianhao" :rules="[{required:true, message:'Please enter market number'}]">
                        <el-input placeholder="Please enter market number" style="width:250px;" v-model="form.meishibianhao"/>
                    </el-form-item>

                    <el-form-item label="Name" prop="mingcheng">
                        <el-input placeholder="Please enter name" style="width:450px;" v-model="form.mingcheng"/>
                    </el-form-item>

                    <el-form-item label="Related Recommand Stock" prop="fujinjingdian">
                        <el-select placeholder="Please select" v-model="form.fujinjingdian">
                            <el-option v-for="m in jingdianxinxiList" :value="m.jingdianmingcheng"
                                       :label="m.jingdianmingcheng"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="Category" prop="fenlei">
                        <el-select placeholder="Please select" v-model="form.fenlei">
                            <el-option v-for="m in meishifenleiList" :value="m.id"
                                       :label="m.fenleimingcheng"></el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="Image" prop="tupian">
                        <e-upload-images v-model="form.tupian"></e-upload-images>
                    </el-form-item>

                    <el-form-item label="Real-time Price" prop="jiage" required
                                  :rules="[{required:true, message:'Please enter real-time price'}, {validator:rule.checkNumber, message:'Please enter a valid number'}]">
                        <el-input placeholder="Please enter real-time price" style="width:250px;" v-model="form.jiage"/>
                    </el-form-item>

                    <el-form-item label="Market Profile" prop="meishijianjie">
                        <el-input type="textarea" v-model="form.meishijianjie"></el-input>
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
    .difangmeishi-add {

    }
</style>
<script>
    import api from '@/api'
    import rule from '@/utils/rule'
    import {extend} from '@/utils/extend'


    export default {
        name: 'difangmeishi-add',
        data() {
            return {
                rule,
                loading: false,
                form: {
                    meishibianhao: rule.getID(),
                    mingcheng: '',
                    fujinjingdian: '',
                    fenlei: '',
                    tupian: '',
                    jiage: '',
                    meishijianjie: '',


                },

                jingdianxinxiList: [],
                meishifenleiList: [],

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

                    this.$post(api.difangmeishi.insert, form).then(res => {
                        this.loading = false;
                        if (res.code == api.code.OK) {
                            this.$message.success('Add successfully');
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
                this.$post(api.difangmeishi.create, {
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
