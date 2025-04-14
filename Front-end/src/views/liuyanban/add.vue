<template>
    <div class="liuyanban-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                                <span class="title"> Add Message Board</span>
                            </div>
            <div class="form-database-form">
                

            <el-form :model="form" ref="formModel" label-width="130px" status-icon validate-on-rule-change>
                                <el-form-item label="Name" prop="xingming" required :rules="[{required:true, message:'Please enter name'}]">
                                            <el-input placeholder="Please enter name" style="width:250px;" v-model="form.xingming" />                                    </el-form-item>

                                <el-form-item label="Phone Number" prop="lianxidianhua" required :rules="[{required:true, message:'Please enter phone number'}]">
                                            <el-input placeholder="Please enter phone number" style="width:250px;" v-model="form.lianxidianhua" />                                    </el-form-item>

                                <el-form-item label="Message Content" prop="liuyanneirong" required :rules="[{required:true, message:'Please enter message content'}]">
                                            <el-input type="textarea" v-model="form.liuyanneirong"></el-input>                                    </el-form-item>

                                <el-form-item label="Message Writer" prop="liuyanren">
                                            <el-input v-model="form.liuyanren" readonly style="width: 250px;"></el-input>                                    </el-form-item>

                                <el-form-item v-if="btnText">
                    <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                </el-form-item>
            </el-form>

            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
.liuyanban-add{

}
</style>
<script>
    import api from '@/api'
    import rule from '@/utils/rule'
    import { extend } from '@/utils/extend'

    
    export default {
        name:'liuyanban-add',
        data() {
            return {
                                rule,
                loading:false,
                form:{
                    xingming:'',
                    lianxidianhua:'',
                    liuyanneirong:'',
liuyanren:this.$store.state.user.session.username,
                                    
                },

            
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

                    this.$post(api.liuyanban.insert , form).then(res=>{
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
                this.$post(api.liuyanban.create , {
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
