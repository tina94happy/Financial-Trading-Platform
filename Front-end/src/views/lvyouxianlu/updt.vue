<template>
    <div class="lvyouxianlu-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix updt">
                                    <el-page-header @back="$router.go(-1)" content="Edit Financial Product">
                    </el-page-header>
                            </div>
            <div class="form-database-form">
                

            <el-form :model="form" ref="formModel" label-width="130px" status-icon validate-on-rule-change>
                                <el-form-item label="Financial Product Number" prop="xianlubianhao" :rules="[{required:true, message:'Please enter Financial Product Number'}]">
                                            <el-input placeholder="Please enter Financial Product Number" style="width:250px;" v-model="form.xianlubianhao" />                                    </el-form-item>

                                <el-form-item label="Financial Product Name" prop="xianlumingcheng" required :rules="[{required:true, message:'Please enter Financial Product Name'}]">
                                            <el-input placeholder="Please enter Financial Product Name" style="width:450px;" v-model="form.xianlumingcheng" />                                    </el-form-item>

                                <el-form-item label="Image" prop="tupian">
                                            <e-upload-images v-model="form.tupian"></e-upload-images>                                    </el-form-item>

                                <el-form-item label="Start Time" prop="chufadi">
                                            <el-input placeholder="Please enter Start Time" style="width:450px;" v-model="form.chufadi" />                                    </el-form-item>

                                <el-form-item label="Estimated profit" prop="tujingdi">
                                            <el-input placeholder="Please enter estimated profit" style="width:450px;" v-model="form.tujingdi" />                                    </el-form-item>

                                <el-form-item label="End Time" prop="zhongdian">
                                            <el-input placeholder="Please enter end time" style="width:450px;" v-model="form.zhongdian" />                                    </el-form-item>

                                <el-form-item label="real-time price" prop="jiage" required :rules="[{required:true, message:'Please enter real-time price'}, {validator:rule.checkNumber, message:'输入一个有效数字'}]">
                                            <el-input placeholder="Please enter real-time price" style="width:250px;" v-model="form.jiage" />                                    </el-form-item>

                                <el-form-item label="Advantages" prop="xianlutese">
                                            <e-editor v-model="form.xianlutese"></e-editor>                                    </el-form-item>

                                <el-form-item label="Description" prop="xianlujianjie">
                                            <e-editor v-model="form.xianlujianjie"></e-editor>                                    </el-form-item>

                                <el-form-item v-if="btnText">
                    <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                </el-form-item>
            </el-form>

            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
.lvyouxianlu-add{

}
</style>
<script>
    import api from '@/api'
    import rule from '@/utils/rule'
    import { extend } from '@/utils/extend'

    
    export default {
        name:'lvyouxianlu-add',
        data() {
            return {
                                rule,
                loading:false,
                form:{
xianlubianhao:rule.getID(),
                    xianlumingcheng:'',
                    tupian:'',
                    chufadi:'',
                    tujingdi:'',
                    zhongdian:'',
                    jiage:'',
                    xianlutese:'',
                    xianlujianjie:'',

                                    
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
            isRead:{
                type:Boolean,
                default:true
            },
            btnText:{
                type:String,
                default:'Submit'
            },
                        id: {
                type: [String, Number],
                required: true
            },
                    },

        computed: {},
        methods: {
            submit(){
                this.$refs.formModel.validate().then(res=>{
                    if(this.loading)return;
                    this.loading = true;
                    var form = this.form;

                    this.$post(api.lvyouxianlu.update , form).then(res=>{
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

                                // 更新数据,获取数据
                this.loading = true;
                var form = this.form;
                this.$post(api.lvyouxianlu.edit , {
                    id:this.id
                }).then(res=>{
                    this.loading = false;
                    if(res.code == api.code.OK){
                        extend(this , res.data);
                        this.form = res.data.mmm;

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
