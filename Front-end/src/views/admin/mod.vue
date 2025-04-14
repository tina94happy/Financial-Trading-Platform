<template>
    <div class="v-mod" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span> modify password </span>
            </div>
            <div class="">
                <el-form ref="modForm" :model="form" inline-message label-width="240px">
                    <el-form-item label="initial password" prop="oldPassword" required :rules="[{required:true,message:'Please fill in the original password'}]">
                        <el-input style="width:200px" type="password" v-model="form.oldPassword"></el-input>
                    </el-form-item>
                    <el-form-item label="new password" prop="newPwd" required :rules="[{required:true,message:'Please fill in the new password'}]">
                        <el-input style="width:200px" type="password" v-model="form.newPwd"></el-input>
                    </el-form-item>
                    <el-form-item label="confirm password" prop="newPwd2" required
                                  :rules="[{required:true,message:'Please fill in the confirmation password'},
                                  {validator:checkPassword,message:'Inconsistent passwords on two occasions', trigger: 'blur' }]">
                        <el-input style="width:200px" type="password" v-model="form.newPwd2"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button @click="savePassword">Save</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" lang="scss">

</style>
<script>
    import api from '@/api'
    export default {
        name: "v-mod",
        data() {
            return {
                loading:false,
                form:{
                    oldPassword:'',
                    newPwd:'',
                    newPwd2:''
                }
            }
        },
        watch: {},
        computed: {},
        methods: {
            savePassword(){

                this.$refs.modForm.validate().then(()=>{
                    if( this.loading )
                    {
                        return;
                    }
                    this.loading = true;
                    var form = this.form;
                    this.$post(api.editorPassword,form).then(res=>{
                        this.loading = false;
                        if(res.code == api.code.OK)
                        {
                            this.$message.success('Success modify password');
                            this.$refs.modForm.resetFields();
                        }else{
                            this.$message.error(res.msg);
                        }
                    }).catch(err=>{
                        this.loading = false;
                        this.$message.error(err.message);
                    });

                }).catch(()=>{

                })


            },
            checkPassword(rule, value, callback){
                if(value == this.form.newPwd)
                {
                    callback();
                    return;
                }
                callback(new Error('Different password'));
            }
        },
        created() {

        },
        mounted() {
        },
        destroyed() {
        }
    }
</script>
