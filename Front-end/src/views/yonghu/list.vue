<template>
    
                                                <div class="v-list" v-loading="loading" element-loading-text="loading">

        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <span class="title">
                User List
                </span>

            </div>
                <!-- 搜索 -->
        <div class="form-search">
            <el-form @submit.prevent.stop :inline="true" size="mini">
                                <el-form-item label="User Name">
                
                    <el-input v-model="search.yonghuming"></el-input>
                    
                </el-form-item>                <el-form-item label="Name">
                
                    <el-input v-model="search.xingming"></el-input>
                    
                </el-form-item>                <el-form-item label="Gender">
                
                    <el-select v-model="search.xingbie" ><el-option label="Plase select" value=""></el-option><el-option label="Male" value="Male"></el-option>
<el-option label="Female" value="Female"></el-option>
</el-select>
                    
                </el-form-item>                <el-form-item label="Phone Number">
                
                    <el-input v-model="search.shouji"></el-input>
                    
                </el-form-item>                <el-form-item label="ID">
                
                    <el-input v-model="search.shenfenzheng"></el-input>
                    
                </el-form-item>                <el-form-item>
                    <el-button type="primary" @click="searchSubmit" icon="el-icon-search">Search</el-button>
                </el-form-item>
                            </el-form>
        </div>
        

        <el-table border :data="list" style="width: 100%" highlight-current-row
                    >
            
            <el-table-column type="index" label="#"></el-table-column> <!-- 序号 -->

                        <el-table-column label="User Name"width="130">
                <template slot-scope="{row}">
                    {{  row.yonghuming  }}                </template>
            </el-table-column>
                        <el-table-column label="Password">
                <template slot-scope="{row}">
                    {{  row.mima  }}                </template>
            </el-table-column>
                        <el-table-column label="Name"width="130">
                <template slot-scope="{row}">
                    {{  row.xingming  }}                </template>
            </el-table-column>
                        <el-table-column label="Gender"width="80">
                <template slot-scope="{row}">
                    {{  row.xingbie  }}                </template>
            </el-table-column>
                        <el-table-column label="Phone Number"width="130">
                <template slot-scope="{row}">
                    {{  row.shouji  }}                </template>
            </el-table-column>
                        <el-table-column label="Email"width="130">
                <template slot-scope="{row}">
                    {{  row.youxiang  }}                </template>
            </el-table-column>
                        <el-table-column label="ID"width="130">
                <template slot-scope="{row}">
                    {{  row.shenfenzheng  }}                </template>
            </el-table-column>
                        <el-table-column label="Avator"width="100">
                <template slot-scope="{row}">
                    <e-img :src="row.touxiang" style="max-width:120px" />                </template>
            </el-table-column>
            


                        
            <el-table-column label="Operation">
                <template slot-scope="{row}">
                    <el-button-group>
                    
                                            <el-tooltip content="Modify" placement="top">
                    <el-button icon="el-icon-edit" @click="$goto({path:'/admin/yonghuupdt',query:{id:row.id } })"
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
                    
                                                                yonghuming:'',
                    
                                                                xingming:'',
                    
                                                                xingbie:'',
                    
                                                                shouji:'',
                    
                                                                shenfenzheng:'',
                    
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
                this.$post(api.yonghu.list , filter).then(res=>{
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
                this.$confirm('Do you sure to delete this information？' , 'Hint',{ // 弹出 确认框提示是否要删除
                    type: 'warning'
                }).then(()=>{// 确定操作

                    this.loading = true; // 滚动条
                    this.$post(api.yonghu.delete , {// 提交后台
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
