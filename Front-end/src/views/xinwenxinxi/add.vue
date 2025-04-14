<template>
    <div class="xinwenxinxi-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                                <span class="title"> Add News</span>
                            </div>
            <div class="form-database-form">
                

            <el-form :model="form" ref="formModel" label-width="130px" status-icon validate-on-rule-change>
                                <el-form-item label="Title" prop="biaoti" required :rules="[{required:true, message:'Please enter title'}, {validator:rule.checkRemote, message:'Content is repetitive', checktype:'insert', module:'xinwenxinxi', col:'biaoti', trigger:'blur'}]">
                                            <el-input placeholder="Please enter title" style="width:450px;" v-model="form.biaoti" />                                    </el-form-item>

                                <el-form-item label="Category" prop="fenlei" required :rules="[{required:true, message:'Please select category'}]">
                                            <el-select v-model="form.fenlei" >
<el-option v-for="m in xinwenfenleiList" :value="m.id" :label="m.fenleimingcheng"></el-option>
</el-select>                                    </el-form-item>

                                <el-form-item label="Image" prop="tupian">
                                            <e-upload-image v-model="form.tupian"></e-upload-image>                                    </el-form-item>

                                <el-form-item label="Add People" prop="tianjiaren">
                                            <el-input v-model="form.tianjiaren" readonly style="width: 250px;"></el-input>                                    </el-form-item>

                                <el-form-item label="Page Views" prop="dianjilv" :rules="[{validator:rule.checkNumber, message:'Please enter a valid Num'}]">
                                            <el-input placeholder="Please enter innitial page views" style="width:250px;" v-model="form.dianjilv" />                                    </el-form-item>

                                <el-form-item label="Content" prop="neirong">
                                            <e-editor v-model="form.neirong"></e-editor>                                    </el-form-item>

                                <el-form-item v-if="btnText">
                    <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                </el-form-item>
            </el-form>

            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
.xinwenxinxi-add{

}
</style>
<script>
    import api from '@/api'
    import rule from '@/utils/rule'
    import { extend } from '@/utils/extend'

    
    export default {
        name:'xinwenxinxi-add',
        data() {
            return {
                                rule,
                loading:false,
                form:{
                    biaoti:'',
                    fenlei:'',
                    tupian:'',
tianjiaren:this.$store.state.user.session.username,                    dianjilv:'',
                    neirong:'',

                                    
                },

                        xinwenfenleiList:[],
            
            }
        },
                watch: {
                    },
        props: {
            isRead:{
                type:Boolean,
                default:true
            },
            btnText:{
                type:String,
                default:'Submit'
            },
                    },

        computed: {},
        methods: {
            submit(){
                this.$refs.formModel.validate().then(res=>{
                    if(this.loading)return;
                    this.loading = true;
                    var form = this.form;

                    this.$post(api.xinwenxinxi.insert , form).then(res=>{
                        this.loading = false;
                        if(res.code == api.code.OK){
                            this.$message.success('Add successfully');
                            this.$emit('success' , res.data);
                            this.$refs.formModel.resetFields();
                                                        this.loadInfo();
                                                    }else{
                            this.$message.error(res.msg);
                        }
                    }).catch(err=>{
                        this.loading = false;
                        this.$message.error(err.message);
                    })

                }).catch(err=>{
                    console.log(err.message);
                })

            },
            loadInfo(){

                                var form = this.form;
                // 获取模块得数据
                this.loading = true;
                this.$post(api.xinwenxinxi.create , {
                    id:this.$route.query.id
                }).then(res=>{
                    this.loading = false;
                    if(res.code == api.code.OK){
                        extend(this , res.data);
                                            }else{
                        this.$message.error(res.msg);
                        this.$router.go(-1);
                    }
                }).catch(err=>{
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
