import Vue from 'vue'
import Router from 'vue-router'
// in development env not use Lazy Loading,because Lazy Loading too many pages will cause webpack hot update too slow.so only in production use Lazy Loading

/* layout */
import Layout from '../views/layout/Layout'
import nestedRouter from './modules/nested'

const _import = require('./_import_' + process.env.NODE_ENV)

Vue.use(Router)

/**
 * icon : the icon show in the sidebar
 * hidden : if `hidden:true` will not show in the sidebar
 * redirect : if `redirect:noRedirect` will not redirect in the levelBar
 * noDropDown : if `noDropDown:true` will not has submenu in the sidebar
 * meta : `{ permission: ['a:xx'] }`  will control the page permission
 **/
export const constantRouterMap = [
  { path: '/login', component: _import('login/index'), hidden: true },
  { path: '/404', component: _import('errorPage/404'), hidden: true },
  { path: '/401', component: _import('errorPage/401'), hidden: true },
  // {
  //   path: '/',
  //   component: Layout,
  //   redirect: '/dashboard',
  //   children: [
  //     {
  //       path: 'dashboard', component: () => import('dashboard/index'),
  //       name: 'Dashboard',
  //       meta: { title: 'Dashboard', icon: 'dashboard', affix: true }
  //     }
  //   ]
  // }

  {
    path: '',
    component: Layout,
    name: 'dashboard',
    icon: 'dashboard',
    children: [
      { path: 'dashboard', name: '首页', component: _import('dashboard/index'), meta: { title: '首页', icon: 'dashboard', noCache: true }}
    ]
  }
  // {
  //   path: '',
  //   component: Layout,
  //   redirect: 'dashboard',
  //   icon: 'dashboard',
  //   noDropDown: true,
  //   children: [{
  //     path: 'dashboard',
  //     name: '控制台',
  //     component: _import('dashboard/index'),
  //     meta: { title: 'dashboard', noCache: true }
  //   }]
  // }
]

export default new Router({
  // mode: 'history', //后端支持可开
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRouterMap
})

export const asyncRouterMap = [
  // {
  //   path: '/assets',
  //   component: Layout,
  //   name: '资产管理',
  //   alwaysShow: true,
  //   activeMenu: '/assets',
  //   icon: 'asset',
  //   children: [
  //     { path: 'machine/list', name: '服务器管理', component: _import('assets/machine/index'), meta: { title: '服务器管理', permission: ['machine:list'] }},
  //     //  { path: 'role/list', name: '测试点', component: _import('system/role/list'), meta: { permission: ['role:detail'] }},
  //     { path: 'cases/apicases/list', name: '测试用例', component: _import('assets/cases/apicases/index'), meta: { title: '测试用例', permission: ['apicases:list'] }},
  //     { path: 'cases/apicasesvariables/list', name: '用例变量', component: _import('assets/cases/apicasesvariables/index'), meta: { title: '用例变量', permission: ['ApicasesVariables:list'] }}
  //   ]
  // },

  {
    path: '/deployunit',
    component: Layout,
    name: '发布单元',
    alwaysShow: true,
    activeMenu: '/deployunit',
    icon: 'deploy',
    children: [
      { path: 'depunit/list', name: '发布单元', component: _import('deployunit/depunit/index'), meta: { title: '发布单元', permission: ['depunit:list'] }, icon: 'testmanager' },
      { path: 'api/list', name: 'API管理', component: _import('deployunit/api/index'), meta: { title: 'API管理', permission: ['api:list'] }},
      { path: 'apiparams/list', name: 'API参数', component: _import('deployunit/apiparams/index'), meta: { title: 'API参数', permission: ['apiparams:list'] }}
    ]
  },

  {
    path: '/enviroment',
    component: Layout,
    name: '环境管理',
    icon: 'enviroment',
    children: [
      { path: 'machine/list', name: '服务器管理', component: _import('assets/machine/index'), meta: { title: '服务器管理', permission: ['machine:list'] }},
      { path: 'testenviroment/list', name: '环境管理', component: _import('enviroment/testenviroment/index'), meta: { title: '环境管理', permission: ['enviroment:list'] }},
      { path: 'envmachine/list', name: '环境服务器', component: _import('enviroment/envmachine/index'), meta: { title: '环境服务器', permission: ['envmachine:list'] }},
      { path: 'enviromentassemble/list', name: '环境组件', component: _import('enviroment/enviromentassemble/index'), meta: { title: '环境组件', permission: ['enviroment_assemble:list'] }},
      { path: 'macdepunit/list', name: '环境部署', component: _import('enviroment/macdepunit/index'), meta: { title: '环境部署', permission: ['macdepunit:list'] }
      }
    ]
  },

  nestedRouter,

  {
    path: '/condition',
    component: Layout,
    name: '条件管理',
    icon: 'condition',
    children: [
      { path: 'condition/list', name: '条件管理', component: _import('condition/condition/index'), meta: { title: '条件管理', permission: ['condition:list'] }},
      { path: 'apicondition/list', name: '接口条件', component: _import('condition/apicondition/index'), meta: { title: '接口条件', permission: ['apicondition:list'] }},
      { path: 'dbcondition/list', name: 'DB条件', component: _import('condition/dbcondition/index'), meta: { title: 'DB条件', permission: ['dbcondition:list'] }}
    ]
  },

  {
    path: '/testvariables',
    component: Layout,
    name: '变量管理',
    icon: 'paras',
    children: [
      { path: 'testvariables/list', name: '变量管理', component: _import('testvariables/testvariables/index'), meta: { title: '变量管理', permission: ['testvariables:list'] }},
      { path: 'testvariablesvalue/list', name: '变量结果', component: _import('testvariables/testvariablesvalue/index'), meta: { title: '变量结果', permission: ['testvariablesvalue:list'] }}
    ]
  },

  {
    path: '/dispatch',
    component: Layout,
    name: '调度中心',
    icon: 'dispatch',
    children: [
      { path: 'slaver/list', name: '测试执行机', component: _import('dispatch/slaver/index'), meta: { title: '测试执行机', permission: ['slaver:list'] }},
      { path: 'dispatch/list', name: '调度管理', component: _import('dispatch/dispatch/index'), meta: { title: '调度管理', permission: ['dispatch:list'] }}
    ]
  },

  {
    path: '/executecenter',
    component: Layout,
    name: '执行中心',
    icon: 'execute',
    children: [
      { path: 'executeplan/list', name: '执行计划', component: _import('executecenter/executeplan/index'), meta: { title: '执行计划', permission: ['executeplan:list'] }},
      { path: 'executeplancase/list', name: '计划用例', component: _import('executecenter/executeplancase/index'), meta: { title: '计划用例', permission: ['executeplan:list'] }},
      { path: 'executeplanbatch/list', name: '计划批次', component: _import('executecenter/executeplanbatch/index'), meta: { title: '计划批次', permission: ['executeplanbatch:list'] }}
    ]
  },

  {
    path: '/reportcenter',
    component: Layout,
    name: '报告中心',
    icon: 'report',
    children: [
      { path: 'testconditionreport/list', name: '条件执行报告', component: _import('reportcenter/testconditionreport/index'), meta: { title: '条件执行报告', permission: ['testconditionreport:list'] }},
      { path: 'apireport/list', name: '功能测试报告', component: _import('reportcenter/apireport/index'), meta: { title: '功能测试报告', permission: ['apireport:list'] }},
      { path: 'apireportstatics/list', name: '功能统计报告', component: _import('reportcenter/apireportstatics/index'), meta: { title: '功能统计报告', permission: ['apireportstatics:list'] }},
      //  { path: 'apireport/list', name: '功能报告分析', component: _import('reportcenter/apireport/index'), meta: { permission: ['apireport:list'] }},
      { path: 'apiperformancereport/list', name: '性能明细报告', component: _import('reportcenter/apiperformancereport/index'), meta: { title: '性能明细报告', permission: ['apiperformancereport:list'] }},
      { path: 'apiperformancestatistics/list', name: '性能统计报告', component: _import('reportcenter/apiperformancestatistics/index'), meta: { title: '性能统计报告', permission: ['apiperformancestatistics:list'] }}
    ]
  },

  // {
  //   path: '/test',
  //   component: Layout,
  //   name: '测试工作管理',
  //   icon: 'dashboard',
  //   children: [
  //     { path: 'account/list', name: '测试项目任务管理', component: _import('system/account/list'), meta: { permission: ['account:list'] }},
  //     { path: 'role/list', name: '测试排期管理', component: _import('system/role/list'), meta: { permission: ['role:detail'] }},
  //     { path: 'role/list', name: '测试文档库CF', component: _import('system/role/list'), meta: { permission: ['role:detail'] }},
  //     { path: 'role/list', name: '测试经验分享', component: _import('system/role/list'), meta: { permission: ['role:detail'] }},
  //     { path: 'role/list', name: '测试资金管理', component: _import('system/role/list'), meta: { permission: ['role:detail'] }}
  //   ]
  // },

  //
  // {
  //   path: '/test',
  //   component: Layout,
  //   name: '数据统计',
  //   icon: 'dashboard',
  //   children: [
  //     { path: 'account/list', name: 'API测试分析', component: _import('system/account/list'), meta: { permission: ['account:list'] }},
  //     { path: 'role/list', name: '提测发布分析', component: _import('system/role/list'), meta: { permission: ['role:detail'] }}
  //   ]
  // },
  //

  {
    path: '/system',
    component: Layout,
    name: '系统管理',
    icon: 'sys',
    children: [
      { path: 'account/list', name: '账户管理', component: _import('system/account/list'), meta: { title: '账户管理', permission: ['account:detail'] }},
      { path: 'role/list', name: '角色管理', component: _import('system/role/list'), meta: { title: '角色管理', permission: ['role:detail'] }},
      // { path: 'deploytestcase/list', name: '发布用例', component: _import('system/deploytestcase/index'), meta: { permission: ['deploytestcase:list'] }},
      { path: 'dictionary/list', name: '字典管理', component: _import('system/dictionary/index'), meta: { title: '字典管理', permission: ['dictionary:list'] }}
    ]
  },

  // {
  //   path: '/account',
  //   component: Layout,
  //   redirect: '/account/list',
  //   icon: 'name',
  //   noDropDown: true,
  //   children: [{
  //     path: 'list',
  //     name: '账户管理',
  //     component: _import('account/list'),
  //     meta: { permission: ['account:list'] }
  //   }]
  // },

  {
    path: '/account',
    component: Layout,
    redirect: '/account/detail',
    hidden: true,
    children: [{
      path: 'detail',
      name: '账户中心',
      component: _import('system/account/detail')
    }]
  }

  // {
  //   path: '/role',
  //   component: Layout,
  //   redirect: '/role/list',
  //   icon: 'role',
  //   noDropDown: true,
  //   children: [{
  //     path: 'list',
  //     name: '角色管理',
  //     component: _import('role/list'),
  //     meta: { permission: ['role:list'] }
  //   }]
  // }
]
