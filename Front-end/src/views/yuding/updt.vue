<template>
    <div class="yuding-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix updt">
                                    <el-page-header @back="$router.go(-1)" content="Edit Reserved">
                    </el-page-header>
                            </div>
            <div class="form-database-form">
                

            <el-form :model="form" ref="formModel" label-width="130px" status-icon validate-on-rule-change>
                                <el-form-item v-if="isRead" label="Financial Product Number" prop="xianlubianhao">
                                            {{  form.xianlubianhao  }}                                    </el-form-item>

                                <el-form-item v-if="isRead" label="Financial Product Name" prop="xianlumingcheng">
                                            {{  form.xianlumingcheng  }}                                    </el-form-item>

                                <el-form-item v-if="isRead" label="Start Time" prop="chufadi">
                                            {{  form.chufadi  }}                                    </el-form-item>

                                <el-form-item v-if="isRead" label="Estimated Profit" prop="tujingdi">
                                            {{  form.tujingdi  }}                                    </el-form-item>

                                <el-form-item v-if="isRead" label="End Time" prop="zhongdian">
                                            {{  form.zhongdian  }}                                    </el-form-item>

                                <el-form-item v-if="isRead" label="Real-time Price" prop="jiage" :rules="[{validator:rule.checkNumber, message:'Please enter a valid number'}]">
                                            {{  form.jiage  }}                                    </el-form-item>

                                <el-form-item label="Reserved Number" prop="dingdanhao" :rules="[{required:true, message:'Please enter reserved number'}]">
                                            <el-input placeholder="Please enter reserved number" style="width:250px;" v-model="form.dingdanhao" />                                    </el-form-item>

                                <el-form-item label="reserved time" prop="yudingshijian" required :rules="[{required:true, message:'Please enter reserved time'}]">
                                            <el-date-picker
          v-model="form.yudingshijian"
          type="datetime"
          :editable="false"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="Select Time">
        </el-date-picker>                                    </el-form-item>

                                <el-form-item label="Reserved Name" prop="yudingrenxingming">
                                            <el-input placeholder="输入预订人姓名" style="width:250px;" v-model="form.yudingrenxingming" />                                    </el-form-item>

                                <el-form-item label="Contact information" prop="lianxifangshi">
                                            <el-input placeholder="输入联系方式" style="width:250px;" v-model="form.lianxifangshi" />                                    </el-form-item>

                                <el-form-item label="Note" prop="beizhu">
                                            <el-input type="textarea" v-model="form.beizhu"></el-input>                                    </el-form-item>

                                <el-form-item label="Reserved Name" prop="yudingren">
                                            <el-input v-model="form.yudingren" readonly style="width: 250px;"></el-input>                                    </el-form-item>

                                <el-form-item v-if="btnText">
                    <el-button type="primary" @click="submit">{{ btnText }}</el-button>
                </el-form-item>
            </el-form>

            </div>
        </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
.yuding-add{

}
</style>
<script>
    import api from '@/api'
    import rule from '@/utils/rule'
    import { extend } from '@/utils/extend'

    
    export default {
        name:'yuding-add',
        data() {
            return {
                                rule,
                loading:false,
                form:{
                    xianlubianhao:'',
                    xianlumingcheng:'',
                    chufadi:'',
                    tujingdi:'',
                    zhongdian:'',
                    jiage:'',
dingdanhao:rule.getID(),
                    yudingshijian:'',
                    yudingrenxingming:'',
                    lianxifangshi:'',
                    beizhu:'',
yudingren:this.$store.state.user.session.username,
            lvyouxianluid:0,
                        iszf:"否"

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

                    this.$post(api.yuding.update , form).then(res=>{
                        this.loading = false;
                        if(res.code == api.code.OK){
                            this.$message.success('Add successfully');
                            this.$emit('success' , res.data);
                            this.$refs.formModel.resetFields();
                                                        this.$router.go(-1);
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
                this.$post(api.yuding.edit , {
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
