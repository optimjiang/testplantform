<template>
  <div class="app-container">
    <div class="filter-container">
      <el-form :inline="true">
        <el-form-item>
          <el-button
            type="success"
            size="mini"
            icon="el-icon-refresh"
            v-if="hasPermission('condition:list')"
            @click.native.prevent="getconditionList"
          >刷新</el-button>
          <el-button
            type="primary"
            size="mini"
            icon="el-icon-plus"
            v-if="hasPermission('condition:add')"
            @click.native.prevent="showAddconditionDialog"
          >添加条件</el-button>
        </el-form-item>

        <span v-if="hasPermission('condition:search')">
          <el-form-item>
            <el-input clearable v-model="search.conditionname" @keyup.enter.native="searchBy" placeholder="条件名"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="searchBy"  :loading="btnLoading">查询</el-button>
          </el-form-item>
        </span>
      </el-form>
    </div>
    <el-table
      :data="conditionList"
      :key="itemKey"
      v-loading.body="listLoading"
      element-loading-text="loading"
      border
      fit
      highlight-current-row
    >
      <el-table-column label="编号" align="center" width="60">
        <template slot-scope="scope">
          <span v-text="getIndex(scope.$index)"></span>
        </template>
      </el-table-column>

      <el-table-column label="条件名" align="center" prop="conditionname" width="120"/>
      <el-table-column label="目标名" align="center" prop="objectname" width="120"/>
      <el-table-column label="目标类型" align="center" prop="objecttype" width="120"/>
      <el-table-column label="条件类型" align="center" prop="conditiontype" width="120"/>
      <el-table-column label="备注" align="center" prop="memo" width="120"/>
      <el-table-column label="操作人" align="center" prop="creator" width="100"/>
      <el-table-column label="创建时间" align="center" prop="createTime" width="160">
        <template slot-scope="scope">{{ unix2CurrentTime(scope.row.createTime) }}</template>
      </el-table-column>
      <el-table-column label="最后修改时间" align="center" prop="lastmodifyTime" width="160">
        <template slot-scope="scope">{{ unix2CurrentTime(scope.row.lastmodifyTime) }}
        </template>
      </el-table-column>

      <el-table-column label="管理" align="center"
                       v-if="hasPermission('condition:update')  || hasPermission('condition:delete')">
        <template slot-scope="scope">
          <el-button
            type="warning"
            size="mini"
            v-if="hasPermission('condition:update') && scope.row.id !== id"
            @click.native.prevent="showUpdateconditionDialog(scope.$index)"
          >修改</el-button>
          <el-button
            type="danger"
            size="mini"
            v-if="hasPermission('condition:delete') && scope.row.id !== id"
            @click.native.prevent="removecondition(scope.$index)"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="search.page"
      :page-size="search.size"
      :total="total"
      :page-sizes="[10, 20, 30, 40]"
      layout="total, sizes, prev, pager, next, jumper"
    ></el-pagination>
    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form
        status-icon
        class="small-space"
        label-position="left"
        label-width="100px"
        style="width: 300px; margin-left:50px;"
        :model="tmpcondition"
        ref="tmpcondition"
      >
        <el-form-item label="条件名" prop="conditionname" required>
          <el-input
            type="text"
            maxlength="40"
            prefix-icon="el-icon-edit"
            auto-complete="off"
            v-model="tmpcondition.conditionname"
          />
        </el-form-item>

        <el-form-item label="目标类型" prop="objecttype" required >
          <el-select v-model="tmpcondition.objecttype" placeholder="目标类型" @change="targetChanged($event)">
            <el-option label="测试用例" value="测试用例"/>
            <el-option label="执行计划" value="执行计划"></el-option>
          </el-select>
        </el-form-item>

        <div v-if="testcasevisible">
          <el-form-item label="发布单元" prop="deployunitname" required >
            <el-select v-model="tmpcondition.deployunitname" placeholder="发布单元" @change="selectChanged($event)">
              <el-option label="请选择" value="''" style="display: none" />
              <div v-for="(depunitname, index) in deployunitList" :key="index">
                <el-option :label="depunitname.deployunitname" :value="depunitname.deployunitname" required/>
              </div>
            </el-select>
          </el-form-item>
          <el-form-item label="API" prop="apiname" required >
            <el-select v-model="tmpcondition.apiname" placeholder="API"  @change="apiselectChanged($event)">
              <el-option label="请选择" value="''" style="display: none" />
              <div v-for="(apiname, index) in apiList" :key="index">
                <el-option :label="apiname.apiname" :value="apiname.apiname" required/>
              </div>
            </el-select>
          </el-form-item>
          <el-form-item label="用例" prop="objectname" required >
            <el-select v-model="tmpcondition.objectname" placeholder="用例"  @change="testcaseChanged($event)">
              <el-option label="请选择" value="''" style="display: none" />
              <div v-for="(testcase, index) in caseList" :key="index">
                <el-option :label="testcase.casename" :value="testcase.casename" required/>
              </div>
            </el-select>
          </el-form-item>
        </div>

        <div v-if="executeplanVisible">
          <el-form-item label="执行计划" prop="objectname"  required>
            <el-select v-model="tmpcondition.objectname" placeholder="执行计划" @change="execplanChanged($event)">
              <el-option label="请选择" value="''" style="display: none" />
              <div v-for="(plan, index) in execplanList" :key="index">
                <el-option :label="plan.executeplanname" :value="plan.executeplanname" />
              </div>
            </el-select>
          </el-form-item>
        </div>

        <el-form-item label="条件类型" prop="conditiontype" required >
          <el-select v-model="tmpcondition.conditiontype" placeholder="条件类型">
            <el-option label="前置条件" value="前置条件"/>
          </el-select>
        </el-form-item>

        <el-form-item label="备注" prop="memo" >
          <el-input
            type="text"
            maxlength="100"
            prefix-icon="el-icon-message"
            auto-complete="off"
            v-model="tmpcondition.memo"
          />
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click.native.prevent="dialogFormVisible = false">取消</el-button>
        <el-button
          type="danger"
          v-if="dialogStatus === 'add'"
          @click.native.prevent="$refs['tmpcondition'].resetFields()"
        >重置</el-button>
        <el-button
          type="success"
          v-if="dialogStatus === 'add'"
          :loading="btnLoading"
          @click.native.prevent="addcondition"
        >添加</el-button>
        <el-button
          type="success"
          v-if="dialogStatus === 'update'"
          :loading="btnLoading"
          @click.native.prevent="updatecondition"
        >修改</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
  import { search, addcondition, updatecondition, removecondition } from '@/api/condition/condition'
  import { getallexplan as getallexplan } from '@/api/executecenter/executeplan'
  import { findcasesbyname as findcasesbyname } from '@/api/assets/apicases'
  import { getapiListbydeploy as getapiListbydeploy } from '@/api/deployunit/api'
  import { getdepunitList as getdepunitList } from '@/api/deployunit/depunit'
  import { unix2CurrentTime } from '@/utils'
  import { mapGetters } from 'vuex'

  export default {
    filters: {
      statusFilter(status) {
        const statusMap = {
          published: 'success',
          draft: 'gray',
          deleted: 'danger'
        }
        return statusMap[status]
      }
    },
    data() {
      return {
        itemKey: null,
        tmpconditionname: '',
        execplanList: [], // 计划列表
        conditionList: [], // 环境服务器列表
        apiList: [], // api列表
        caseList: [], // 用例列表
        deployunitList: [], // 发布单元列表
        enviromentnameList: [], // 环境列表
        machinenameList: [], // 服务器列表
        testcasevisible: false,
        executeplanVisible: false,
        listLoading: false, // 数据加载等待动画
        total: 0, // 数据总数
        deployunitquery: {
          deployunitname: ''
        },
        apiquery: {
          casedeployunitname: '',
          caseapiname: ''
        },
        listQuery: {
          page: 1, // 页码
          size: 10, // 每页数量
          listLoading: true
        },
        dialogStatus: 'add',
        dialogFormVisible: false,
        textMap: {
          updateRole: '修改条件',
          update: '修改条件',
          add: '添加条件'
        },
        btnLoading: false, // 按钮等待动画
        tmpcondition: {
          id: '',
          conditionname: '',
          objecttype: '',
          objectid: '',
          objectname: '',
          conditiontype: '',
          memo: '',
          creator: '',
          deployunitname: '',
          apiname: ''
        },
        search: {
          page: 1,
          size: 10,
          conditionname: null
        }
      }
    },

    computed: {
      ...mapGetters(['name', 'sidebar', 'avatar'])
    },

    created() {
      this.getconditionList()
      this.getdepunitList()
    },

    methods: {
      unix2CurrentTime,

      /**
       * 条件目标下拉选择  e的值为options的选值
       */
      targetChanged(e) {
        if (e === '执行计划') {
          this.executeplanVisible = true
          this.testcasevisible = false
          this.tmpcondition.objectid = ''
          this.tmpcondition.objectname = ''
          getallexplan().then(response => {
            this.execplanList = response.data
          }).catch(res => {
            this.$message.error('加载执行计划列表失败')
          })
        }
        if (e === '测试用例') {
          this.executeplanVisible = false
          this.testcasevisible = true
          this.tmpcondition.objectid = ''
          this.tmpcondition.objectname = ''
          this.tmpcondition.deployunitname = ''
          this.tmpcondition.deployunitname = ''
          this.tmpcondition.apiname = ''
        }
      },

      /**
       * 发布单元下拉选择事件获取发布单元id  e的值为options的选值
       */
      selectChanged(e) {
        this.tmpcondition.apiname = ''
        this.deployunitquery.deployunitname = e
        this.tmpcondition.apiname = ''
        this.tmpcondition.objectname = ''
        getapiListbydeploy(this.deployunitquery).then(response => {
          this.apiList = response.data
        }).catch(res => {
          this.$message.error('加载api列表失败')
        })
      },

      /**
       * API下拉选择事件获取用例  e的值为options的选值
       */
      apiselectChanged(e) {
        this.apiquery.caseapiname = e
        this.apiquery.casedeployunitname = this.deployunitquery.deployunitname
        findcasesbyname(this.apiquery).then(response => {
          this.caseList = response.data
        }).catch(res => {
          this.$message.error('加载api用例列表失败')
        })
      },

      /**
       * 执行计划下拉选择获取id  e的值为options的选值
       */
      execplanChanged(e) {
        for (let i = 0; i < this.execplanList.length; i++) {
          if (this.execplanList[i].executeplanname === e) {
            this.tmpcondition.objectid = this.execplanList[i].id
            this.tmpcondition.objectname = this.execplanList[i].executeplanname
          }
        }
      },

      /**
       * 用例下拉选择获取id  e的值为options的选值
       */
      testcaseChanged(e) {
        for (let i = 0; i < this.caseList.length; i++) {
          if (this.caseList[i].casename === e) {
            this.tmpcondition.objectid = this.caseList[i].id
          }
        }
      },

      /**
       * 获取发布单元列表
       */
      getdepunitList() {
        this.listLoading = true
        getdepunitList(this.listQuery).then(response => {
          this.deployunitList = response.data.list
          this.listLoading = false
        }).catch(res => {
          this.$message.error('加载发布单元列表失败')
        })
      },

      /**
       * 获取条件列表
       */
      getconditionList() {
        this.listLoading = true
        this.search.enviromentname = this.tmpenviromentname
        search(this.search).then(response => {
          this.conditionList = response.data.list
          this.total = response.data.total
          this.listLoading = false
        }).catch(res => {
          this.$message.error('加载条件列表失败')
        })
      },

      searchBy() {
        this.search.page = 1
        this.listLoading = true
        search(this.search).then(response => {
          this.itemKey = Math.random()
          this.conditionList = response.data.list
          this.total = response.data.total
        }).catch(res => {
          this.$message.error('搜索失败')
        })
        this.tmpconditionname = this.search.conditionname
        this.listLoading = false
        this.btnLoading = false
      },

      /**
       * 改变每页数量
       * @param size 页大小
       */
      handleSizeChange(size) {
        this.search.page = 1
        this.search.size = size
        this.getconditionList()
      },
      /**
       * 改变页码
       * @param page 页号
       */
      handleCurrentChange(page) {
        this.search.page = page
        this.getconditionList()
      },
      /**
       * 表格序号
       * 可参考自定义表格序号
       * http://element-cn.eleme.io/#/zh-CN/component/table#zi-ding-yi-suo-yin
       * @param index 数据下标
       * @returns 表格序号
       */
      getIndex(index) {
        return (this.search.page - 1) * this.search.size + index + 1
      },
      /**
       * 显示添加条件对话框
       */
      showAddconditionDialog() {
        // 显示新增对话框
        this.dialogFormVisible = true
        this.testcasevisible = false
        this.dialogStatus = 'add'
        this.tmpcondition.id = ''
        this.tmpcondition.conditionname = ''
        this.tmpcondition.objectid = ''
        this.tmpcondition.objectname = ''
        this.tmpcondition.objecttype = ''
        this.tmpcondition.conditiontype = ''
        this.tmpcondition.memo = ''
        this.tmpcondition.creator = this.name
      },
      /**
       * 添加条件
       */
      addcondition() {
        this.$refs.tmpcondition.validate(valid => {
          if (valid) {
            this.btnLoading = true
            addcondition(this.tmpcondition).then(() => {
              this.$message.success('添加成功')
              this.getconditionList()
              this.dialogFormVisible = false
              this.btnLoading = false
              this.testcasevisible = false
              this.tmpcondition.id = ''
              this.tmpcondition.conditionname = ''
              this.tmpcondition.objectid = ''
              this.tmpcondition.objectname = ''
              this.tmpcondition.objecttype = ''
              this.tmpcondition.deployunitname = ''
              this.tmpcondition.apiname = ''
              this.tmpcondition.memo = ''
            }).catch(res => {
              this.$message.error('添加失败')
              this.btnLoading = false
            })
          }
        })
      },
      /**
       * 显示修改条件对话框
       * @param index 条件下标
       */
      showUpdateconditionDialog(index) {
        this.dialogFormVisible = true
        this.dialogStatus = 'update'
        if (this.conditionList[index].objecttype === '执行计划') {
          this.executeplanVisible = true
          this.testcasevisible = false
        }
        if (this.conditionList[index].objecttype === '测试用例') {
          this.testcasevisible = true
          this.executeplanVisible = false
        }
        this.tmpcondition.id = this.conditionList[index].id
        this.tmpcondition.objectid = this.conditionList[index].objectid
        this.tmpcondition.conditionname = this.conditionList[index].conditionname
        this.tmpcondition.objectname = this.conditionList[index].objectname
        this.tmpcondition.objecttype = this.conditionList[index].objecttype
        this.tmpcondition.conditiontype = this.conditionList[index].conditiontype
        this.tmpcondition.memo = this.conditionList[index].memo
        this.tmpcondition.creator = this.name
      },
      /**
       * 更新条件
       */
      updatecondition() {
        this.$refs.tmpcondition.validate(valid => {
          if (valid) {
            updatecondition(this.tmpcondition).then(() => {
              this.$message.success('更新成功')
              this.getconditionList()
              this.dialogFormVisible = false
            }).catch(res => {
              this.$message.error('更新失败')
            })
          }
        })
      },

      /**
       * 删除条件
       * @param index 条件下标
       */
      removecondition(index) {
        this.$confirm('删除该条件？', '警告', {
          confirmButtonText: '是',
          cancelButtonText: '否',
          type: 'warning'
        }).then(() => {
          const id = this.conditionList[index].id
          removecondition(id).then(() => {
            this.$message.success('删除成功')
            this.getconditionList()
          })
        }).catch(() => {
          this.$message.info('已取消删除')
        })
      },

      /**
       * 条件是否唯一
       * @param 条件
       */
      isUniqueDetail(condition) {
        for (let i = 0; i < this.conditionList.length; i++) {
          if (this.conditionList[i].id !== condition.id) { // 排除自己
            if (this.conditionList[i].enviromentname === condition.enviromentname) {
              if (this.conditionList[i].machinename === condition.machinename) {
                this.$message.error('条件名已存在')
                return false
              }
            }
          }
        }
        return true
      }
    }
  }
</script>
