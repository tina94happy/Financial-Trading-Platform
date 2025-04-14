<template>
    
                                <div class="v-list" v-loading="loading" element-loading-text="加载中">

        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span class="title">
                Reserved List
                </span>

            </div>
                <!-- 搜索 -->
        <div class="form-search">
            <el-form @submit.prevent.stop :inline="true" size="mini">
                                <el-form-item label="Financial Product Number">
                
                    <el-input v-model="search.xianlubianhao"></el-input>
                    
                </el-form-item>                <el-form-item label="Financial Product Name">
                
                    <el-input v-model="search.xianlumingcheng"></el-input>
                    
                </el-form-item>                <el-form-item label="Start Time">
                
                    <el-input v-model="search.tujingdi"></el-input>
                    
                </el-form-item>                <el-form-item>
                    <el-button type="primary" @click="searchSubmit" icon="el-icon-search">Search</el-button>
                </el-form-item>
                            </el-form>
        </div>
        

        <el-table border :data="list" style="width: 100%" highlight-current-row
                    >
            
            <el-table-column type="index" label="#"></el-table-column> <!-- 序号 -->

                        <el-table-column label="Financial Product Number"width="130">
                <template slot-scope="{row}">
                    {{  row.xianlubianhao  }}                </template>
            </el-table-column>
                        <el-table-column label="Financial Product Name">
                <template slot-scope="{row}">
                    {{  row.xianlumingcheng  }}                </template>
            </el-table-column>
                        <el-table-column label="Start Time">
                <template slot-scope="{row}">
                    {{  row.chufadi  }}                </template>
            </el-table-column>
                        <el-table-column label="Estimated Profit">
                <template slot-scope="{row}">
                    {{  row.tujingdi  }}                </template>
            </el-table-column>
                        <el-table-column label="End Time">
                <template slot-scope="{row}">
                    {{  row.zhongdian  }}                </template>
            </el-table-column>
                        <el-table-column label="Real-time Price"width="80">
                <template slot-scope="{row}">
                    {{  row.jiage  }}                </template>
            </el-table-column>
                        <el-table-column label="Reserved Number"width="130">
                <template slot-scope="{row}">
                    {{  row.dingdanhao  }}                </template>
            </el-table-column>
                        <el-table-column label="Reserved Time"width="120">
                <template slot-scope="{row}">
                    {{  row.yudingshijian  }}                </template>
            </el-table-column>
                        <el-table-column label="Reserved Name"width="130">
                <template slot-scope="{row}">
                    {{  row.yudingrenxingming  }}                </template>
            </el-table-column>
                        <el-table-column label="Contact Information"width="130">
                <template slot-scope="{row}">
                    {{  row.lianxifangshi  }}                </template>
            </el-table-column>
                        <el-table-column label="Status"width="130">
                <template slot-scope="{row}">
                    {{  row.zhuangtai  }}                </template>
            </el-table-column>
                        <el-table-column label="Note">
                <template slot-scope="{row}">
                    {{  row.beizhu  }}                </template>
            </el-table-column>
                        <el-table-column label="Reserved People"width="80">
                <template slot-scope="{row}">
                    {{  row.yudingren  }}                </template>
            </el-table-column>
            


                                        <el-table-column label="Whether to pay" width="120">
                    <template slot-scope="{row}">
                        {{  row.iszf  }}
                                            </template>
                </el-table-column>
            
            <el-table-column label="Operation">
                <template slot-scope="{row}">
                    <el-button-group>
                    
                                            <el-tooltip content="Edit" placement="top">
                    <el-button icon="el-icon-edit" @click="$goto({path:'/admin/yudingupdt',query:{id:row.id } })"
                               type="warning" size="mini"></el-button>
                        </el-tooltip>
                        <el-tooltip content="Delete" placement="top">
                    <el-button icon="el-icon-delete" type="danger" size="mini" @click="deleteItem(row)">

                    </el-button>
                        </el-tooltip>
                    </el-button-group>
                </template>
            </el-table-column>
        </el-table>


            
        <div class="e-pages" style="margin-top: 10px;text-align: center">
            <el-pagination
                    @current-change="loadList"
                    :current-page="page"
                    :page-size="pagesize"
                    @size-change="sizeChange"
                    layout="total, sizes, prev, pager, next, jumper"
                    :total="totalCount">
            </el-pagination>
        </div>

                </el-card>
    </div>
</template>
<style type="text/scss" scoped lang="scss">

</style>
<script>
    import api from '@/api';
    import { remove , checkIssh } from '@/utils/utils';
    import { extend } from '@/utils/extend';
    import objectDiff from 'objectdiff';

    
    /**
     * 后台列表页面
     */
    export default {
        data() {
            return {

                loading:false,
                list:[],
                search:{
                    
                                                                xianlubianhao:'',
                    
                                                                xianlumingcheng:'',
                    
                                                                tujingdi:'',
                    
                                    },
                total:{},
                page:1, // 当前页
                pagesize:10, // 页大小
                totalCount:0, // 总行数
            
            
            }
        },
                watch: {},
        computed: {},
        methods: {
            searchSubmit(){
                this.loadList(1);
            },
            
                        sizeChange(e){
                this.pagesize = e;
                this.loadList(1);
            },
                        checkIssh,
            
            loadList( page ){
                // 防止重新点加载列表
                if(this.loading)return;
                this.loading = true;
                this.page = page;
                // 筛选条件
                var filter = extend(true, {}, this.search, {page:page+"", pagesize: this.pagesize+""});
                var diff = objectDiff.diff(filter, this.$route.query);
                if (diff.changed != 'equal') { // 筛选的条件不一致则更新链接
                    this.$router.push({  // 更新query
                        path: this.$route.path,
                        query: filter
                    });
                }
                this.$post(api.yuding.list , filter).then(res=>{
                    this.loading = false;
                    if(res.code == api.code.OK)
                    {
                        extend(this , res.data);
                    }else{
                        this.$message.error(res.msg);
                    }
                }).catch(err=>{
                    this.loading = false;
                    this.$message.error(err.message);
                });
            },
            // 删除某行方法
            deleteItem( row ){
                this.$confirm('Do you wanna delete the data？' , 'Hint',{ // 弹出 确认框提示是否要删除
                    type: 'warning'
                }).then(()=>{// 确定操作

                    this.loading = true; // 滚动条
                    this.$post(api.yuding.delete , {// 提交后台
                        id:row.id
                    }).then(res=>{
                        this.loading = false;
                        if(res.code != api.code.OK){
                            this.$message.error(res.msg);
                        }else{
                            remove(this.list , row);
                        }
                    }).catch(err=>{ // 访问网络错误
                        this.loading = false;
                        this.$message.error(err.message)
                    })
                }).catch(()=>{
                    // 取消操作
                })
            },

                    },
        beforeRouteUpdate(to,form,next){
            extend(this.search , to.query)
            this.loadList(1);
            next();
        },
        created() {
            var search = extend(this.search , this.$route.query)
            if(search.page)
            {
                this.page = Math.floor(this.$route.query.page)
                delete search.page
            }
            if(search.pagesize)
            {
                this.pagesize = Math.floor(this.$route.query.pagesize)
                delete search.pagesize
            }

            this.loadList(1);
                    },
        mounted() {
                    },
        destroyed() {
                    }
    }
</script>
