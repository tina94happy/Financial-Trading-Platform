<template>
    <div class="yuding-add" v-loading="loading">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                                <span class="title"> Add Reservation</span>
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

                                <el-form-item label="Order Number" prop="dingdanhao" :rules="[{required:true, message:'Please enter order number'}]">
                                            <el-input placeholder="Please enter order number" style="width:250px;" v-model="form.dingdanhao" />                                    </el-form-item>

                                <el-form-item label="Reserved Time" prop="yudingshijian" required :rules="[{required:true, message:'Please enter reserved time'}]">
                                            <el-date-picker
          v-model="form.yudingshijian"
          type="datetime"
          :editable="false"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="Select Time">
        </el-date-picker>                                    </el-form-item>

                                <el-form-item label="Name" prop="yudingrenxingming">
                                            <el-input placeholder="Please enter name" style="width:250px;" v-model="form.yudingrenxingming" />                                    </el-form-item>

                                <el-form-item label="Contact Information" prop="lianxifangshi">
                                            <el-input placeholder="Please enter contact information" style="width:250px;" v-model="form.lianxifangshi" />                                    </el-form-item>

                                <el-form-item label="Note" prop="beizhu">
                                            <el-input type="textarea" v-model="form.beizhu"></el-input>                                    </el-form-item>

                                <el-form-item label="Reserved People" prop="yudingren">
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
                                readMap:{},
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
zhuangtai:'Awaiting Payment',
                    beizhu:'',
yudingren:this.$store.state.user.session.username,
            lvyouxianluid:0,
                        iszf:"No"

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

                    this.$post(api.yuding.insert , form).then(res=>{
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

                                var form = this.form;
                // 获取模块得数据
                this.loading = true;
                this.$post(api.yuding.create , {
                    id:this.$route.query.id
                }).then(res=>{
                    this.loading = false;
                    if(res.code == api.code.OK){
                        extend(this , res.data);
                                                var readMap = res.data.readMap;
                        for (var i in form){
                            if(readMap[i] && i != 'id')
                            {
                                form[i] = res.data.readMap[i];
                            }
                        }
                        form.lvyouxianluid = readMap.id;
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
