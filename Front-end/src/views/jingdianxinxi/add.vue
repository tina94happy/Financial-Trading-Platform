<template>
    <div class="jingdianxinxi-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                                <span class="title"> Add Recommended Stock</span>
                            </div>
            <div class="form-database-form">
                

            <el-form :model="form" ref="formModel" label-width="180px" status-icon validate-on-rule-change>
                                <el-form-item label="Recommended Stock number" prop="jingdianbianhao" :rules="[{required:true, message:'Please enter recommended stock number'}]">
                                            <el-input placeholder="Please enter recommended stock number" style="width:250px;" v-model="form.jingdianbianhao" />                                    </el-form-item>

                                <el-form-item label="Recommended Stock Name" prop="jingdianmingcheng" required :rules="[{required:true, message:'Please enter recommended stock number'}]">
                                            <el-input placeholder="Please enter recommended stock name" style="width:450px;" v-model="form.jingdianmingcheng" />                                    </el-form-item>

                                <el-form-item label="Financial Product Category" prop="suoshudiqu" required :rules="[{required:true, message:'Please enter related financial product'}]">
                                            <el-select v-model="form.suoshudiqu" >
<el-option v-for="m in diquList" :value="m.id" :label="m.diqumingcheng"></el-option>
</el-select>                                    </el-form-item>

                                <el-form-item label="Image" prop="tupian" required :rules="[{required:true, message:'Please select image'}]">
                                            <e-upload-images v-model="form.tupian"></e-upload-images>                                    </el-form-item>

                                <el-form-item label="Real-time" prop="kaifangshijian" required :rules="[{required:true, message:'Please enter real-time'}]">
                                            <el-input placeholder="Please enter real-time" style="width:450px;" v-model="form.kaifangshijian" />                                    </el-form-item>

                                <el-form-item label="Related Market Category" prop="fujinmeishi">
                                            <el-select v-model="form.fujinmeishi"  multiple="multiple" >
<el-option v-for="m in difangmeishiList" :value="m.mingcheng" :label="m.mingcheng"></el-option>
</el-select>                                    </el-form-item>

                                <el-form-item label="Related Company" prop="dizhi" required :rules="[{required:true, message:'Please enter related company'}]">
                                            <el-input placeholder="Please enter related company" style="width:450px;" v-model="form.dizhi" />                                    </el-form-item>

                                <el-form-item label="Real-time Price" prop="piaojia" :rules="[{validator:rule.checkNumber, message:'Please enter a valid number'}]">
                                            <el-input placeholder="Please enter valid real-time price" style="width:250px;" v-model="form.piaojia" />                                    </el-form-item>

                                <el-form-item label="Description" prop="miaoshu" required :rules="[{required:true, message:'Please enter a specific description'}]">
                                            <e-editor v-model="form.miaoshu"></e-editor>                                    </el-form-item>

                                <el-form-item v-if="btnText">
                    <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                </el-form-item>
            </el-form>

            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
.jingdianxinxi-add{

}
</style>
<script>
    import api from '@/api'
    import rule from '@/utils/rule'
    import { extend } from '@/utils/extend'

    
    export default {
        name:'jingdianxinxi-add',
        data() {
            return {
                                rule,
                loading:false,
                form:{
jingdianbianhao:rule.getID(),
                    jingdianmingcheng:'',
                    suoshudiqu:'',
                    tupian:'',
                    kaifangshijian:'',
                    fujinmeishi:'',
                    dizhi:'',
                    piaojia:'',
                    miaoshu:'',

                                    
                },

                        diquList:[],
                        difangmeishiList:[],
            
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

                    this.$post(api.jingdianxinxi.insert , form).then(res=>{
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
                this.$post(api.jingdianxinxi.create , {
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
