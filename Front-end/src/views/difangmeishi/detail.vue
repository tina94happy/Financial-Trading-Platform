<template>
    
    <div class="difangmeishi-detail" v-loading="loading" ref="print">
        <el-page-header @back="goBack" content="Detail Page"></el-page-header>
        <div class="admin-detail">

                        <div class="detail detail-text">
                <div class="detail-title">
                    Market Number：
                </div>
                <div class="detail-content">
                    {{ map.meishibianhao }}
                </div>
            </div>                        <div class="detail detail-longtext">
                <div class="detail-title">
                    Name：
                </div>
                <div class="detail-content">
                    {{ map.mingcheng }}
                </div>
            </div>                        <div class="detail detail-select">
                <div class="detail-title">
                    Related Recommended Stock：
                </div>
                <div class="detail-content">
                    {{  map.fujinjingdian  }}
                </div>
            </div><div class="detail detail-select">
                <div class="detail-title">
                    Category：
                </div>
                <div class="detail-content">
                     <e-select-view module="meishifenlei" :value="map.fenlei" select="id" show="fenleimingcheng"></e-select-view>
                </div>
            </div>                                                <div class="detail detail-money">
                <div class="detail-title">
                    Real-time Price：
                </div>
                <div class="detail-content">
                    {{ map.jiage }}
                </div>
            </div>                        <div class="detail detail-textarea">
                <div class="detail-title">
                    Market Profile：
                </div>
                <div class="detail-content">
                    {{ map.meishijianjie }}
                </div>
            </div>                        <div class="detail detail-autotime">
                <div class="detail-title">
                    Add Time：
                </div>
                <div class="detail-content">
                    {{ map.addtime }}
                </div>
            </div>            
                        <div class="detail detail-images">
                <div class="detail-title">
                    Image：
                </div>
                <div class="detail-content">
                    <e-images :src="map.tupian" type="detail"></e-images>
                </div>
            </div>                                    
        </div>
        <div class="mt10">
            <el-button type="default" class="hidePrint" @click="$router.go(-1)">
                Back
            </el-button>
            <el-button type="success" class="hidePrint" @click="$print">
                Print this page
            </el-button>
        </div>
    </div>
</template>
<style type="text/scss" scoped lang="scss">
.difangmeishi-detail{
    .admin-detail {
        display: flex;
        flex-wrap: wrap;
        margin-top: 30px;
        .detail {
            width: 50%;
            padding: 5px;
            display: flex;
            margin-bottom: 10px;
            border-bottom: 1px solid #DEDEDE;
            .detail-title {
                width: 120px;
                text-align: right;
              flex-shrink: 0;
            }
            .detail-content {
                flex-grow: 1;
            }
        }
        .detail.detail-images {
            width: 100%;
            flex-wrap: wrap;
            .detail-title {
                display: none;
            }

            .detail-content {
                width: 100%;
                padding: 10px;
            }
        }
        .detail.detail-editor,.detail.detail-dataset  {
            width: 100%;
            flex-wrap: wrap;
            .detail-title {
                width: 100%;
                padding: 10px;
                margin-top: 10px;
                background: #9a0606;
                color: #ffffff;
                text-align: left;
            }
            .detail-content{
                padding: 10px;
            }
        }
    }
}
</style>
<script>
    import api from '@/api';
    import { extend } from '@/utils/extend';

    
    export default {
        data() {
            return {
                loading:false,
                map:{},

                            }
        },
                props:{
            id:{
                type:[String,Number],
                required:true
            },
                    },
        watch: {
            id:{
                handler(){
                    this.loadDetail();
                },
                immediate:true
            }
        },
        computed: {
                    },
        methods: {
            goBack() {
                this.$router.go(-1)
            },
            loadDetail(){
                if(this.loading) return;
                this.loading = true;
                this.$get(api.difangmeishi.detail , {
                    id:this.id
                }).then(res=>{
                    this.loading = false;
                    if(res.code == api.code.OK){
                        extend(this , res.data);
                    }else{
                        this.$message.error(res.msg);
                    }
                }).catch(err=>{
                    this.loading = false;
                    this.$message.error(err.message);
                });
            },
                    },
        created() {
                    },
        mounted() {
                    },
        destroyed() {
                    }
    }
</script>
