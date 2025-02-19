package com.api.autotest.core;

import com.api.autotest.dto.ApicasesAssert;
import com.api.autotest.dto.RequestObject;
import com.jayway.jsonpath.JsonPath;
import org.apache.jmeter.protocol.java.sampler.JavaSamplerContext;
import org.apache.log.Logger;
import sun.misc.FloatingDecimal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by fanseasn on 2020/10/17.
 */
/*
 @author Season
 @DESCRIPTION 
 @create 2020/10/17
*/
public class TestAssert {

    private Logger logger = null;

    public TestAssert(Logger log) {
        logger = log;
    }

    //通过JsonPath获取实际值和期望值比较，返回断言信息
    public String ParseJsonResult(String ActualJson, RequestObject ob) throws Exception {
        String AssertInfo = "";
        List<ApicasesAssert> apicasesAssertList = ob.getApicasesAssertList();
        for (ApicasesAssert apicasesAssert : apicasesAssertList) {
            //获取实际值使用JsonPath解析
            String ActualResult = "";
            //获取期望值
            String ExpectValue = apicasesAssert.getAssertvalues();
            if (apicasesAssert.getAsserttype().equals(new String("Json"))) {
                try {
                    ActualResult = JsonPath.read(ActualJson, apicasesAssert.getExpression()).toString();
                } catch (Exception ex) {
                    ActualResult = ex.getMessage();
                }
                logger.info(TestCore.logplannameandcasename + "ExpectValue is:" + ExpectValue + "  ActualResult is:" + ActualResult);
                AssertInfo = AssertCondition(apicasesAssert, ExpectValue, ActualResult);
            }
            //处理Json返回值类型，类型为Respone断言处理
            if (apicasesAssert.getAsserttype().equals(new String("Respone"))) {
                if(apicasesAssert.getAssertsubtype().equals(new String("Code")))
                {
                    ActualResult = JsonPath.read(ActualJson, "$.Code").toString();
                }
                if(apicasesAssert.getAssertsubtype().equals(new String("文本")))
                {
                    ActualResult= ActualJson;
                }
                AssertInfo = AssertCondition(apicasesAssert, ExpectValue, ActualResult);
            }
        }
        logger.info(TestCore.logplannameandcasename + "AssertInfo is:" + AssertInfo );
        return AssertInfo;
    }

    public String ParseXmlResult(String ActualXml, RequestObject ob) {
        String AssertInfo = "";
        return AssertInfo;
    }

    public String ParseResponeResult(String ActualJson, RequestObject ob) {
        String AssertInfo = "";
        return AssertInfo;
    }

    private String AssertCondition(ApicasesAssert apicasesAssert, String ExpectValue, String ActualResult) {
        String AssertInfo = "";
        if (apicasesAssert.getAssertcondition().equals("=")) {
            AssertInfo = CallAssertEqualFun(apicasesAssert.getAssertvaluetype(), ExpectValue, ActualResult);
        }
        if (apicasesAssert.getAssertcondition().equals(">")) {
            AssertInfo = CallAssertMoreFun(apicasesAssert.getAssertvaluetype(), ExpectValue, ActualResult);
        }
        if (apicasesAssert.getAssertcondition().equals("<")) {
            AssertInfo = CallAssertLessFun(apicasesAssert.getAssertvaluetype(), ExpectValue, ActualResult);
        }
        if (apicasesAssert.getAssertcondition().equals("Contain")) {
            AssertInfo = AssertContains(ExpectValue, ActualResult);
        }
        return AssertInfo;
    }

    private String CallAssertEqualFun(String AssertValueType, String ExpectValue, String ActualResult) {
        String AssertInfo = "";
        try {
            if (AssertValueType.equals(new String("int"))) {
                AssertInfo = AssertEqual(Integer.parseInt(ExpectValue), Integer.parseInt(ActualResult));
            }
            if (AssertValueType.equals(new String("Long"))) {
                AssertInfo = AssertEqual(Long.parseLong(ExpectValue), Long.parseLong(ActualResult));
            }
            if (AssertValueType.equals(new String("Float"))) {
                AssertInfo = AssertEqual(Float.parseFloat(ExpectValue), Float.parseFloat((ActualResult)));
            }
            if (AssertValueType.equals(new String("Double"))) {
                AssertInfo = AssertEqual(Double.parseDouble(ExpectValue), Double.parseDouble(ActualResult));
            }
            if (AssertValueType.equals(new String("Decimal"))) {
                AssertInfo = AssertEqual(FloatingDecimal.parseDouble(ExpectValue), FloatingDecimal.parseDouble(ActualResult));
            }
            if (AssertValueType.equals(new String("String"))) {
                AssertInfo = AssertEqual(ExpectValue, ActualResult);
            }
        } catch (Exception ex) {
            caseresult = false;
            AssertInfo = "1,接口实际响应中无期望值类型的数据 2,期望值和配置的期望值类型不匹配,期望值类型：" + AssertValueType + " 期望值：" + ExpectValue + " 实际值：" + ActualResult;
        }
        return AssertInfo;
    }

    private String CallAssertMoreFun(String AssertValueType, String ExpectValue, String ActualResult) {
        String AssertInfo = "";
        try {
            if (AssertValueType.equals(new String("int"))) {
                AssertInfo = AssertMore(Integer.parseInt(ExpectValue), Integer.parseInt(ActualResult));
            }
            if (AssertValueType.equals(new String("Long"))) {
                AssertInfo = AssertMore(Long.parseLong(ExpectValue), Long.parseLong(ActualResult));
            }
            if (AssertValueType.equals(new String("Float"))) {
                AssertInfo = AssertMore(Float.parseFloat(ExpectValue), Float.parseFloat((ActualResult)));
            }
            if (AssertValueType.equals(new String("Double"))) {
                AssertInfo = AssertMore(Double.parseDouble(ExpectValue), Double.parseDouble(ActualResult));
            }
            if (AssertValueType.equals(new String("Decimal"))) {
                AssertInfo = AssertMore(FloatingDecimal.parseDouble(ExpectValue), FloatingDecimal.parseDouble(ActualResult));
            }
        } catch (Exception ex) {
            caseresult = false;
            AssertInfo = "1,接口实际响应中无期望值类型的数据 2,期望值和配置的期望值类型不匹配,期望值类型：" + AssertValueType + " 期望值：" + ExpectValue + " 实际值：" + ActualResult;
        }
        return AssertInfo;
    }

    private String CallAssertLessFun(String AssertValueType, String ExpectValue, String ActualResult) {
        String AssertInfo = "";
        try {
            if (AssertValueType.equals(new String("int"))) {
                AssertInfo = AssertLess(Integer.parseInt(ExpectValue), Integer.parseInt(ActualResult));
            }
            if (AssertValueType.equals(new String("Long"))) {
                AssertInfo = AssertLess(Long.parseLong(ExpectValue), Long.parseLong(ActualResult));
            }
            if (AssertValueType.equals(new String("Float"))) {
                AssertInfo = AssertLess(Float.parseFloat(ExpectValue), Float.parseFloat((ActualResult)));
            }
            if (AssertValueType.equals(new String("Double"))) {
                AssertInfo = AssertLess(Double.parseDouble(ExpectValue), Double.parseDouble(ActualResult));
            }
            if (AssertValueType.equals(new String("Decimal"))) {
                AssertInfo = AssertLess(FloatingDecimal.parseDouble(ExpectValue), FloatingDecimal.parseDouble(ActualResult));
            }
        } catch (Exception ex) {
            caseresult = false;
            AssertInfo = "1,接口实际响应中无期望值类型的数据 2,期望值和配置的期望值类型不匹配,期望值类型：" + AssertValueType + " 期望值：" + ExpectValue + " 实际值：" + ActualResult;
        }
        return AssertInfo;
    }

    public List<ApicasesAssert> GetApicasesAssertList(ArrayList<HashMap<String, String>> list) {
        List<ApicasesAssert> apicasesAssertList = new ArrayList<>();
        if (list.size() > 0) {
            for (HashMap<String, String> map : list) {
                ApicasesAssert apicasesAssert = new ApicasesAssert();
                for (String Key : map.keySet()) {
                    if (Key.equals(new String("asserttype"))) {
                        apicasesAssert.setAsserttype(map.get(Key));
                    }
                    if (Key.equals(new String("assertsubtype"))) {
                        apicasesAssert.setAssertsubtype(map.get(Key));
                    }
                    if (Key.equals(new String("assertvalues"))) {
                        apicasesAssert.setAssertvalues(map.get(Key));
                    }
                    if (Key.equals(new String("expression"))) {
                        apicasesAssert.setExpression(map.get(Key));
                    }
                    if (Key.equals(new String("assertcondition"))) {
                        apicasesAssert.setAssertcondition(map.get(Key));
                    }
                    if (Key.equals(new String("assertvaluetype"))) {
                        apicasesAssert.setAssertvaluetype(map.get(Key));
                    }
                }
                apicasesAssertList.add(apicasesAssert);
            }
        }
        return apicasesAssertList;
    }

    private boolean flag = true;

    public boolean isCaseresult() {
        if (flag) {
            return caseresult;
        } else {
            return flag;
        }
    }

    public void setCaseresult(boolean caseresult) {
        this.caseresult = caseresult;
    }

    private boolean caseresult = false;
    public String assertinfo = "";


    private String collectioninfo(String expect, String actual, boolean result) {
        String ResultDesc = "通过";
        if (!result) {
            ResultDesc = "失败";
        }
        return "【期望值】：" + expect + " , 【实际值】：" + actual + " 【断言结果】: " + ResultDesc + " || ";
    }

    private String collectioninfomore(int expect, int actual, boolean result) {
        String ResultDesc = "通过";
        if (!result) {
            ResultDesc = "失败";
        }
        return "【期望值大于】 ：" + expect + " 【实际值】 ：" + actual + " 【断言结果】: " + ResultDesc + " || ";
    }

    private String collectioninfomore(long expect, long actual, boolean result) {
        String ResultDesc = "通过";
        if (!result) {
            ResultDesc = "失败";
        }
        return "【期望值大于】 ：" + expect + " 【实际值】 ：" + actual + " 【断言结果】: " + ResultDesc + " || ";
    }

    private String collectioninfomore(float expect, float actual, boolean result) {
        String ResultDesc = "通过";
        if (!result) {
            ResultDesc = "失败";
        }
        return "【期望值大于】 ：" + expect + " 【实际值】 ：" + actual + " 【断言结果】: " + ResultDesc + " || ";
    }

    private String collectioninfomore(double expect, double actual, boolean result) {
        String ResultDesc = "通过";
        if (!result) {
            ResultDesc = "失败";
        }
        return "【期望值大于】 ：" + expect + " 【实际值】 ：" + actual + " 【断言结果】: " + ResultDesc + " || ";
    }


    private String collectioninfoless(int expect, int actual, boolean result) {
        String ResultDesc = "通过";
        if (!result) {
            ResultDesc = "失败";
        }
        return "【期望值小于】 ：" + expect + " 【实际值】 ：" + actual + " 【断言结果】: " + result + " || ";
    }

    private String collectioninfoless(long expect, long actual, boolean result) {
        String ResultDesc = "通过";
        if (!result) {
            ResultDesc = "失败";
        }
        return "【期望值小于】 ：" + expect + " 【实际值】 ：" + actual + " 【断言结果】: " + result + " || ";
    }

    private String collectioninfoless(float expect, float actual, boolean result) {
        String ResultDesc = "通过";
        if (!result) {
            ResultDesc = "失败";
        }
        return "【期望值小于】 ：" + expect + " 【实际值】 ：" + actual + " 【断言结果】: " + result + " || ";
    }

    private String collectioninfoless(double expect, double actual, boolean result) {
        String ResultDesc = "通过";
        if (!result) {
            ResultDesc = "失败";
        }
        return "【期望值小于】 ：" + expect + " 【实际值】 ：" + actual + " 【断言结果】: " + result + " || ";
    }


    public String AssertContains(String expect, String actual) {
        try {
            if (actual.contains(expect)) {
                caseresult = true;
            } else {
                caseresult = false;
            }
            assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        } catch (Exception ex) {
            caseresult = false;
            assertinfo = assertinfo + " 期望值：" + expect + " 实际值：" + actual + ex.getMessage();
        }
        return assertinfo;
    }


    public String AssertEqual(String expect, String actual) {
        if (expect.equals(actual)) {
            caseresult = true;
        } else {
            caseresult = false;
            flag = false;
        }
        assertinfo = assertinfo + collectioninfo(expect, actual, caseresult);
        return assertinfo;
    }

    public String AssertEqual(int expect, int actual) {
        if (expect == actual) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        return assertinfo;
    }

    public String AssertEqual(double expect, double actual) {
        if (expect == actual) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        return assertinfo;
    }

    public String AssertEqual(long expect, long actual) {
        if (expect == actual) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        return assertinfo;
    }

    public String AssertEqual(float expect, float actual) {
        if (expect == actual) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        return assertinfo;
    }

    public String AssertEqual(Integer expect, Integer actual) {
        if (expect.equals(actual)) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        return assertinfo;
    }

    public String AssertEqual(Long expect, Long actual) {
        if (expect.equals(actual)) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        return assertinfo;
    }

    public String AssertEqual(Float expect, Float actual) {
        if (expect.equals(actual)) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        return assertinfo;
    }

    public String AssertEqual(Double expect, Double actual) {
        if (expect.equals(actual)) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        return assertinfo;
    }

    public String AssertEqual(boolean expect, boolean actual) {
        if (expect == actual) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        return assertinfo;
    }

    public String AssertEqual(Boolean expect, Boolean actual) {
        if (expect.equals(actual)) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        return assertinfo;
    }

    public String AssertEqual(char expect, char actual) {
        if (expect == actual) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfo(String.valueOf(expect), String.valueOf(actual), caseresult);
        return assertinfo;
    }


    public String AssertMore(int expect, int actual) {
        if (actual > expect) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfomore(expect, actual, caseresult);
        return assertinfo;
    }


    public String AssertMore(long expect, long actual) {
        if (actual > expect) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfomore(expect, actual, caseresult);
        return assertinfo;
    }

    public String AssertMore(float expect, float actual) {
        if (actual > expect) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfomore(expect, actual, caseresult);
        return assertinfo;
    }

    public String AssertMore(double expect, double actual) {
        if (actual > expect) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfomore(expect, actual, caseresult);
        return assertinfo;
    }


    public String AssertLess(int expect, int actual) {
        if (actual > expect) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfoless(expect, actual, caseresult);
        return assertinfo;
    }


    public String AssertLess(long expect, long actual) {
        if (actual > expect) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfoless(expect, actual, caseresult);
        return assertinfo;
    }

    public String AssertLess(float expect, float actual) {
        if (actual > expect) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfoless(expect, actual, caseresult);
        return assertinfo;
    }

    public String AssertLess(double expect, double actual) {
        if (actual > expect) {
            caseresult = true;
        } else {
            caseresult = false;
        }
        assertinfo = assertinfo + collectioninfoless(expect, actual, caseresult);
        return assertinfo;
    }
}
