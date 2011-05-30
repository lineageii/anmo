package org.springside.examples.miniweb.common;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;

@Service
public class PulldownUtil {

	// public static Map<String, String> getProvinceMap(String lan) {
	// Map<String, String> map = Maps.newHashMap();
	// map.put("北京", "北京");
	// map.put("上海", "上海");
	// map.put("吉林", "吉林");
	// map.put("辽宁", "辽宁");
	// map.put("广东", "广东");
	// map.put("天津", "天津");
	// map.put("黑龙江", "黑龙江");
	// map.put("陕西", "陕西");
	// map.put("重庆", "重庆");
	// map.put("山东", "山东");
	// map.put("湖北", "湖北");
	// map.put("福建", "福建");
	// map.put("浙江", "浙江");
	// map.put("内蒙古", "内蒙古");
	// map.put("河南", "河南");
	// map.put("江苏", "江苏");
	// map.put("湖南", "湖南");
	// map.put("四川", "四川");
	// map.put("安徽", "安徽");
	// map.put("江西", "江西");
	// map.put("河北", "河北");
	// map.put("山西", "山西");
	// map.put("贵州", "贵州");
	// map.put("山西", "山西");
	// map.put("新疆", "新疆");
	// map.put("广西", "广西");
	// map.put("云南", "云南");
	// map.put("海南", "海南");
	// map.put("甘肃", "甘肃");
	// map.put("青海", "青海");
	// return map;

	public static Map getLanguagesMap() {
		Map<String, String> map = Maps.newHashMap();
		map.put("jp", "日语");
		map.put("en", "英语");
		return map;
	}

	/**
	 * 
	 * @param prex
	 *            中文：凌晨， 日文：翌
	 * @return
	 */
	public static Map<String, String> getWorkTimeMap(String prex) {
		Map<String, String> map = Maps.newTreeMap();
		int start = 12;
		int end = 29;

		for (int i = start; i <= end; i++) {
			String value = i < 24 ? String.valueOf(i) : prex + (i - 24);
			map.put(i + "00", value + ":00");
			map.put(i + "30", value + ":30");
		}
		return map;
	}

	public static Map<String, String> getWorkStatusMap(String workValue, String restValue) {
		Map<String, String> map = Maps.newTreeMap();
		map.put("work", workValue);
		map.put("rest", restValue);
		return map;
	}
}
