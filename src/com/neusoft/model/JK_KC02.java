package com.neusoft.model;

import java.util.Date;

import lombok.Data;
/**
 * 描述：为备案信息的实体类
 * @author ys
 * @since 2017/07/04
 * @version 1.0
 */
@Data
public class JK_KC02 {

	private String  AAE073;     //审批编号
	private String  AAC001;     //参保地个人编号
	private String  AAC001_N;   //就医地个人编号
	private String  AAC003;     //姓名
	private String  AAC002;     //身份证号
	private String  AAC004;     //性别
	private String  AAC006;       //出生日期
	private String  YAB003;     //参保地
	private String  YAB300;     //就医地
	private String  YAB060;     //参保地
	private String  YAB600;     //就医地
	private String  AKC170;     //审批类别
	private String  YDBZ;       //异地标志
	private String  AKC044;       //备案开始日期
	private String  AKC043;     //备案终止日期
	private String  AKC021;     //参保人员类别
	private String  AAE011;     //经办人
	private Date  AAE036;       //经办时间
}
