<template>
    <div class="jingdianxinxi-detail" v-loading="loading">
        <div>
<e-container>
            <div  style="margin:10px 0 0 0">
<e-module-model-box title="Recommended Stock Detail">
    
<div class="">
    <div class="goods-info clearfix">
        <div class="gallery-list">
            <e-shangpinban :images="map.tupian"></e-shangpinban>
        </div>
        <div class="goods-right-content">
            <h3 class="title" v-text="map.jingdianmingcheng"></h3>
            <div class="descount">
                                    <div>
                        <span class="name">
                            Financial Product Category：
                        </span>
                        <span class="val">
                             <e-select-view module="diqu" :value="map.suoshudiqu" select="id" show="diqumingcheng"></e-select-view>                        </span>
                    </div>
                                    <div>
                        <span class="name">
                            Related Company：
                        </span>
                        <span class="val">
                            {{ map.dizhi }}                        </span>
                    </div>
                                    <div>
                        <span class="name">
                            Real-time：
                        </span>
                        <span class="val">
                            {{ map.kaifangshijian }}                        </span>
                    </div>
                                    <div>
                        <span class="name">
                            Related Market Category：
                        </span>
                        <span class="val">
                            {{  map.fujinmeishi  }}                        </span>
                    </div>
                                    <div>
                        <span class="name">
                            Real-time Price：
                        </span>
                        <span class="val">
                            {{ map.piaojia }}                        </span>
                    </div>
                                    <div>
                        <span class="name">
                            Page Views：
                        </span>
                        <span class="val">
                            {{ map.liulanliang }}                        </span>
                    </div>
                            </div>

            
                            <e-collect v-model="isCollect"
                           module="jingdianxinxi"
                           ziduan="jingdianmingcheng"
                           :id="map.id"></e-collect>
            
        </div>
    </div>
    <div class="goods-content" v-html="map.miaoshu">

    </div>
</div>

</e-module-model-box>

</div>    

</e-container>
</div>    </div>
</template>
<style type="text/scss" scoped lang="scss">
    </style>
<script>
    import api from '@/api';
    import { extend } from '@/utils/extend';
        export default {
        data() {
            return {
                loading:false,   // 加载
                                isCollect:false, // 是否已经收藏
                                map:{
                        jingdianbianhao:'',
                        jingdianmingcheng:'',
                        suoshudiqu:'',
                        tupian:'',
                        kaifangshijian:'',
                        fujinmeishi:'',
                        dizhi:'',
                        piaojia:'',
                        liulanliang:'',
                        miaoshu:'',
                        addtime:'',
                            },
                            }
        },
                props:{
            id:{
                type:[String,Number],
                required:true
            }
        },
        watch: {
            id:{
                handler(){
                    this.loadDetail();
                },
                immediate:true
            },
                    },
        computed: {
                    },
        methods: {
            loadDetail(){
                if(this.loading) return;
                this.loading = true;
                this.$get(api.jingdianxinxi.webdetail , {
                    id:this.id
                }).then(res=>{
                    this.loading = false;
                    if(res.code == api.code.OK){
                        extend(this,res.data);
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
