webpackJsonp([35],{"3C9e":function(e,t,s){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var n=s("Dd8w"),a=s.n(n),i=s("mKAx"),l=s("0xDb"),r=s("L6vm"),o=s("NYxO"),m={filters:{statusFilter:function(e){return{published:"success",draft:"gray",deleted:"danger"}[e]}},data:function(){return{itemKey:null,tmpassemblename:null,tmpassembletype:null,enviroment_assembleList:[],assembleypeList:[],listLoading:!1,total:0,listQuery:{page:1,size:10,listLoading:!0,assembletype:""},dialogStatus:"add",dialogFormVisible:!1,textMap:{updateRole:"修改环境组件",update:"修改环境组件",add:"添加环境组件"},btnLoading:!1,diclevelQuery:{page:1,size:100,diccode:"machinedeploy"},tmpenviroment_assemble:{id:"",assemblename:"",assembletype:"",connectstr:"",memo:"",creator:""},search:{page:1,size:10,assembletype:null,assemblename:null}}},computed:a()({},Object(o.b)(["name","sidebar","avatar"])),created:function(){this.getenviroment_assembleList(),this.getdatabydiccodeList()},methods:{unix2CurrentTime:l.b,getdatabydiccodeList:function(){var e=this;Object(r.c)(this.diclevelQuery).then(function(t){e.assembleypeList=t.data.list,e.total=t.data.total}).catch(function(t){e.$message.error("加载组件名字典列表失败")})},getenviroment_assembleList:function(){var e=this;this.listLoading=!0,this.search.assembletype=this.tmpassembletype,this.search.assemblename=this.tmpassemblename,Object(i.d)(this.search).then(function(t){e.enviroment_assembleList=t.data.list,e.total=t.data.total,e.listLoading=!1}).catch(function(t){e.$message.error("加载测试环境列表失败")})},searchBy:function(){var e=this;this.search.page=1,this.listLoading=!0,Object(i.d)(this.search).then(function(t){e.itemKey=Math.random(),e.enviroment_assembleList=t.data.list,e.total=t.data.total}).catch(function(t){e.$message.error("搜索失败")}),this.listLoading=!1,this.btnLoading=!1,this.tmpassembletype=this.search.assembletype,this.tmpassemblename=this.search.assemblename},handleSizeChange:function(e){this.search.page=1,this.search.size=e,this.getenviroment_assembleList()},handleCurrentChange:function(e){this.search.page=e,this.getenviroment_assembleList()},getIndex:function(e){return(this.search.page-1)*this.search.size+e+1},showAddenviroment_assembleDialog:function(){this.dialogFormVisible=!0,this.dialogStatus="add",this.tmpenviroment_assemble.id="",this.tmpenviroment_assemble.assemblename="",this.tmpenviroment_assemble.assembletype="",this.tmpenviroment_assemble.connectstr="",this.tmpenviroment_assemble.memo="",this.tmpenviroment_assemble.creator=this.name},addenviroment_assemble:function(){var e=this;this.$refs.tmpenviroment_assemble.validate(function(t){t&&(e.btnLoading=!0,Object(i.a)(e.tmpenviroment_assemble).then(function(){e.$message.success("添加成功"),e.getenviroment_assembleList(),e.dialogFormVisible=!1,e.btnLoading=!1}).catch(function(t){e.$message.error("添加失败"),e.btnLoading=!1}))})},showUpdateenviroment_assembleDialog:function(e){this.dialogFormVisible=!0,this.dialogStatus="update",this.tmpenviroment_assemble.id=this.enviroment_assembleList[e].id,this.tmpenviroment_assemble.assemblename=this.enviroment_assembleList[e].assemblename,this.tmpenviroment_assemble.assembletype=this.enviroment_assembleList[e].assembletype,this.tmpenviroment_assemble.connectstr=this.enviroment_assembleList[e].connectstr,this.tmpenviroment_assemble.memo=this.enviroment_assembleList[e].memo,this.tmpenviroment_assemble.creator=this.name},updateenviroment_assemble:function(){var e=this;this.$refs.tmpenviroment_assemble.validate(function(t){t&&Object(i.e)(e.tmpenviroment_assemble).then(function(){e.$message.success("更新成功"),e.getenviroment_assembleList(),e.dialogFormVisible=!1}).catch(function(t){e.$message.error("更新失败")})})},removeenviroment_assemble:function(e){var t=this;this.$confirm("删除该测试环境？","警告",{confirmButtonText:"是",cancelButtonText:"否",type:"warning"}).then(function(){var s=t.enviroment_assembleList[e].id;Object(i.c)(s).then(function(){t.$message.success("删除成功"),t.getenviroment_assembleList()})}).catch(function(){t.$message.info("已取消删除")})},isUniqueDetail:function(e){for(var t=0;t<this.enviroment_assembleList.length;t++)if(this.enviroment_assembleList[t].id!==e.id&&this.enviroment_assembleList[t].enviroment_assemblename===e.enviroment_assemblename)return this.$message.error("测试环境名已存在"),!1;return!0}}},c={render:function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"app-container"},[s("div",{staticClass:"filter-container"},[s("el-form",{attrs:{inline:!0}},[s("el-form-item",[e.hasPermission("enviroment_assemble:list")?s("el-button",{attrs:{type:"success",size:"mini",icon:"el-icon-refresh"},nativeOn:{click:function(t){return t.preventDefault(),e.getenviroment_assembleList(t)}}},[e._v("刷新")]):e._e(),e._v(" "),e.hasPermission("enviroment_assemble:add")?s("el-button",{attrs:{type:"primary",size:"mini",icon:"el-icon-plus"},nativeOn:{click:function(t){return t.preventDefault(),e.showAddenviroment_assembleDialog(t)}}},[e._v("添加环境组件")]):e._e()],1),e._v(" "),e.hasPermission("enviroment_assemble:search")?s("span",[s("el-form-item",[s("el-input",{attrs:{clearable:"",maxlength:"40",placeholder:"组件名"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.searchBy(t)}},model:{value:e.search.assemblename,callback:function(t){e.$set(e.search,"assemblename",t)},expression:"search.assemblename"}})],1),e._v(" "),s("el-form-item",{attrs:{label:"组件名",prop:"assembletype"}},[s("el-select",{attrs:{placeholder:"组件名"},model:{value:e.search.assembletype,callback:function(t){e.$set(e.search,"assembletype",t)},expression:"search.assembletype"}},[s("el-option",{staticStyle:{display:"none"},attrs:{label:"请选择",value:"''"}}),e._v(" "),e._l(e.assembleypeList,function(e,t){return s("div",{key:t},[s("el-option",{attrs:{label:e.dicitmevalue,value:e.dicitmevalue}})],1)})],2)],1),e._v(" "),s("el-form-item",[s("el-button",{attrs:{type:"primary",loading:e.btnLoading},on:{click:e.searchBy}},[e._v("查询")])],1)],1):e._e()],1)],1),e._v(" "),s("el-table",{directives:[{name:"loading",rawName:"v-loading.body",value:e.listLoading,expression:"listLoading",modifiers:{body:!0}}],key:e.itemKey,attrs:{data:e.enviroment_assembleList,"element-loading-text":"loading",border:"",fit:"","highlight-current-row":""}},[s("el-table-column",{attrs:{label:"编号",align:"center",width:"60"},scopedSlots:e._u([{key:"default",fn:function(t){return[s("span",{domProps:{textContent:e._s(e.getIndex(t.$index))}})]}}])}),e._v(" "),s("el-table-column",{attrs:{label:"组件名",align:"center",prop:"assemblename",width:"100"}}),e._v(" "),s("el-table-column",{attrs:{label:"组件类型",align:"center",prop:"assembletype",width:"100"}}),e._v(" "),s("el-table-column",{attrs:{label:"连接字",align:"center",prop:"connectstr",width:"250"}}),e._v(" "),s("el-table-column",{attrs:{label:"备注",align:"center",prop:"memo",width:"100"}}),e._v(" "),s("el-table-column",{attrs:{label:"操作人",align:"center",prop:"creator",width:"100"}}),e._v(" "),s("el-table-column",{attrs:{label:"创建时间",align:"center",prop:"createTime",width:"160"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e.unix2CurrentTime(t.row.createTime)))]}}])}),e._v(" "),s("el-table-column",{attrs:{label:"最后修改时间",align:"center",prop:"lastmodifyTime",width:"160"},scopedSlots:e._u([{key:"default",fn:function(t){return[e._v(e._s(e.unix2CurrentTime(t.row.lastmodifyTime))+"\n      ")]}}])}),e._v(" "),e.hasPermission("enviroment_assemble:update")||e.hasPermission("enviroment_assemble:delete")?s("el-table-column",{attrs:{label:"管理",align:"center"},scopedSlots:e._u([{key:"default",fn:function(t){return[e.hasPermission("enviroment_assemble:update")&&t.row.id!==e.id?s("el-button",{attrs:{type:"warning",size:"mini"},nativeOn:{click:function(s){return s.preventDefault(),e.showUpdateenviroment_assembleDialog(t.$index)}}},[e._v("修改")]):e._e(),e._v(" "),e.hasPermission("enviroment_assemble:delete")&&t.row.id!==e.id?s("el-button",{attrs:{type:"danger",size:"mini"},nativeOn:{click:function(s){return s.preventDefault(),e.removeenviroment_assemble(t.$index)}}},[e._v("删除")]):e._e()]}}],null,!1,2163518214)}):e._e()],1),e._v(" "),s("el-pagination",{attrs:{"current-page":e.search.page,"page-size":e.search.size,total:e.total,"page-sizes":[10,20,30,40],layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":e.handleSizeChange,"current-change":e.handleCurrentChange}}),e._v(" "),s("el-dialog",{attrs:{title:e.textMap[e.dialogStatus],visible:e.dialogFormVisible},on:{"update:visible":function(t){e.dialogFormVisible=t}}},[s("el-form",{ref:"tmpenviroment_assemble",staticClass:"small-space",staticStyle:{width:"500px","margin-left":"50px"},attrs:{"status-icon":"","label-position":"left","label-width":"120px",model:e.tmpenviroment_assemble}},[s("el-form-item",{attrs:{label:"组件名",prop:"assemblename",required:""}},[s("el-input",{attrs:{type:"text",maxlength:"100","prefix-icon":"el-icon-message","auto-complete":"off"},model:{value:e.tmpenviroment_assemble.assemblename,callback:function(t){e.$set(e.tmpenviroment_assemble,"assemblename",t)},expression:"tmpenviroment_assemble.assemblename"}})],1),e._v(" "),s("el-form-item",{attrs:{label:"组件类型",prop:"assembletype",required:""}},[s("el-select",{attrs:{placeholder:"组件类型"},model:{value:e.tmpenviroment_assemble.assembletype,callback:function(t){e.$set(e.tmpenviroment_assemble,"assembletype",t)},expression:"tmpenviroment_assemble.assembletype"}},[s("el-option",{staticStyle:{display:"none"},attrs:{label:"请选择",value:"''"}}),e._v(" "),e._l(e.assembleypeList,function(e,t){return s("div",{key:t},[s("el-option",{attrs:{label:e.dicitmevalue,value:e.dicitmevalue,required:""}})],1)})],2)],1),e._v(" "),s("el-form-item",{attrs:{label:"连接字",prop:"connectstr",required:""}},[s("el-input",{attrs:{type:"textarea",maxlength:"60","prefix-icon":"el-icon-message","auto-complete":"off",placeholder:"账号，密码，端口，库名 用英文逗号分开，例子：root,root,3306,admin"},model:{value:e.tmpenviroment_assemble.connectstr,callback:function(t){e.$set(e.tmpenviroment_assemble,"connectstr",t)},expression:"tmpenviroment_assemble.connectstr"}})],1),e._v(" "),s("el-form-item",{attrs:{label:"备注",prop:"memo"}},[s("el-input",{attrs:{type:"text",maxlength:"100","prefix-icon":"el-icon-message","auto-complete":"off"},model:{value:e.tmpenviroment_assemble.memo,callback:function(t){e.$set(e.tmpenviroment_assemble,"memo",t)},expression:"tmpenviroment_assemble.memo"}})],1)],1),e._v(" "),s("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[s("el-button",{nativeOn:{click:function(t){t.preventDefault(),e.dialogFormVisible=!1}}},[e._v("取消")]),e._v(" "),"add"===e.dialogStatus?s("el-button",{attrs:{type:"danger"},nativeOn:{click:function(t){return t.preventDefault(),e.$refs.tmpenviroment_assemble.resetFields()}}},[e._v("重置")]):e._e(),e._v(" "),"add"===e.dialogStatus?s("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(t){return t.preventDefault(),e.addenviroment_assemble(t)}}},[e._v("添加")]):e._e(),e._v(" "),"update"===e.dialogStatus?s("el-button",{attrs:{type:"success",loading:e.btnLoading},nativeOn:{click:function(t){return t.preventDefault(),e.updateenviroment_assemble(t)}}},[e._v("修改")]):e._e()],1)],1)],1)},staticRenderFns:[]},b=s("VU/8")(m,c,!1,null,null,null);t.default=b.exports}});
//# sourceMappingURL=35.fb07980fe594b65e49da.js.map