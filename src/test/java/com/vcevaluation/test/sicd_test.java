package com.vcevaluation.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vcevaluation.mapping.ResultMapper;
import com.vcevaluation.service.ResultService;




@RunWith(SpringJUnit4ClassRunner.class) // 整合
@ContextConfiguration(locations = { "classpath*:spring-mybatis.xml", "classpath*:spring-mvc.xml" })

public class sicd_test {

	@Autowired
	ResultService resultService;

	// 测试已通过
	@Test
	public void test() {
		System.out.println("this is a test made by sandaoliu ");
	}

//	 @Test
//		public void testQuery() {
//		
//	//	List<Map<String, Object>> newlist = resultService.selectEvaResult();
//		for (Map<String,Object> map : newlist) {
//		System.out.println(map.get("res_flag"));
//		System.out.println(map.get("res_name"));
//		System.out.println(map.get("res_protime"));
//		}
//	}


}
