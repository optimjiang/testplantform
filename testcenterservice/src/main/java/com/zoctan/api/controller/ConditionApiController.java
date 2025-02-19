package com.zoctan.api.controller;

import com.zoctan.api.core.response.Result;
import com.zoctan.api.core.response.ResultGenerator;
import com.zoctan.api.entity.ConditionApi;
import com.zoctan.api.entity.Testcondition;
import com.zoctan.api.service.ConditionApiService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Condition;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author SeasonFan
 * @date 2021/05/30
 */
@RestController
@RequestMapping("/condition/api")
public class ConditionApiController {
    @Resource
    private ConditionApiService conditionApiService;

    @PostMapping
    public Result add(@RequestBody ConditionApi conditionApi) {
        Condition con=new Condition(ConditionApi.class);
        con.createCriteria().andCondition("conditionname = '" + conditionApi.getConditionname() + "'")
                .andCondition("deployunitname = '" + conditionApi.getDeployunitname()+ "'")
                .andCondition("apiname = '" + conditionApi.getApiname()+ "'")
                .andCondition("casename = '" + conditionApi.getCasename()+ "'");
        if(conditionApiService.ifexist(con)>0)
        {
            return ResultGenerator.genFailedResult("该条件名已存在此接口");
        }
        else {
            conditionApiService.save(conditionApi);
        }
        return ResultGenerator.genOkResult();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        conditionApiService.deleteById(id);
        return ResultGenerator.genOkResult();
    }

    @PatchMapping
    public Result update(@RequestBody ConditionApi conditionApi) {
        conditionApiService.update(conditionApi);
        return ResultGenerator.genOkResult();
    }

    @GetMapping("/{id}")
    public Result detail(@PathVariable Long id) {
        ConditionApi conditionApi = conditionApiService.getById(id);
        return ResultGenerator.genOkResult(conditionApi);
    }

    @GetMapping
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<ConditionApi> list = conditionApiService.listAll();
        PageInfo<ConditionApi> pageInfo = PageInfo.of(list);
        return ResultGenerator.genOkResult(pageInfo);
    }

    /**
     * 更新自己的资料
     */
    @PutMapping("/detail")
    public Result updateDeploy(@RequestBody final ConditionApi conditionApi) {
        Condition con=new Condition(ConditionApi.class);
        con.createCriteria().andCondition("conditionname = '" + conditionApi.getConditionname() + "'")
                .andCondition("deployunitname = '" + conditionApi.getDeployunitname()+ "'")
                .andCondition("apiname = '" + conditionApi.getApiname()+ "'")
                .andCondition("casename = '" + conditionApi.getCasename()+ "'")
                .andCondition("id <> " + conditionApi.getId());
        if(conditionApiService.ifexist(con)>0)
        {
            return ResultGenerator.genFailedResult("该条件下已存在此接口");
        }
        else {
            this.conditionApiService.updateTestconditionapi(conditionApi);
            return ResultGenerator.genOkResult();
        }
    }


    /**
     * 输入框查询
     */
    @PostMapping("/search")
    public Result search(@RequestBody final Map<String, Object> param) {
        Integer page= Integer.parseInt(param.get("page").toString());
        Integer size= Integer.parseInt(param.get("size").toString());
        PageHelper.startPage(page, size);
        final List<ConditionApi> list = this.conditionApiService.findtestconditionapiWithName(param);
        final PageInfo<ConditionApi> pageInfo = new PageInfo<>(list);
        return ResultGenerator.genOkResult(pageInfo);
    }
}
