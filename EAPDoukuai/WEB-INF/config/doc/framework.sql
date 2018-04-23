-----------------------------------------------------
-- Export file for user FRAMEWORK                  --
-- Created by Administrator on 2018/4/23, 13:43:50 --
-----------------------------------------------------

spool framework.log

prompt
prompt Creating table JK_AA10
prompt ======================
prompt
create table FRAMEWORK.JK_AA10
(
  AAA100 VARCHAR2(14) not null,
  AAA102 VARCHAR2(6) not null,
  AAA101 VARCHAR2(50),
  AAA103 VARCHAR2(50),
  AAA104 VARCHAR2(3)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FRAMEWORK.JK_AA10
  is '代码表';
comment on column FRAMEWORK.JK_AA10.AAA100
  is '代码类别';
comment on column FRAMEWORK.JK_AA10.AAA102
  is '代码值';
comment on column FRAMEWORK.JK_AA10.AAA101
  is '类别名称';
comment on column FRAMEWORK.JK_AA10.AAA103
  is '代码名称';
comment on column FRAMEWORK.JK_AA10.AAA104
  is '代码可维护标志';
alter table FRAMEWORK.JK_AA10
  add constraint PK_AA10 primary key (AAA100, AAA102)
  using index 
  tablespace INDEX_JLSI
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JK_AA26
prompt ======================
prompt
create table FRAMEWORK.JK_AA26
(
  BAZ001 NUMBER(16) not null,
  BAZ002 NUMBER(16),
  AAB301 VARCHAR2(6) not null,
  AAA146 VARCHAR2(100) not null,
  AAA148 VARCHAR2(6),
  AAE383 NUMBER(10),
  AAE013 VARCHAR2(100),
  AAA149 VARCHAR2(30),
  AAA150 VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FRAMEWORK.JK_AA26
  is '行政区划';
comment on column FRAMEWORK.JK_AA26.BAZ001
  is '记录编号';
comment on column FRAMEWORK.JK_AA26.BAZ002
  is '操作序号';
comment on column FRAMEWORK.JK_AA26.AAB301
  is '行政区划代码';
comment on column FRAMEWORK.JK_AA26.AAA146
  is '行政区划名称';
comment on column FRAMEWORK.JK_AA26.AAA148
  is '上级行政区划代码';
comment on column FRAMEWORK.JK_AA26.AAE383
  is '行政区划版本号';
comment on column FRAMEWORK.JK_AA26.AAE013
  is '备注';
comment on column FRAMEWORK.JK_AA26.AAA149
  is '坐标';
comment on column FRAMEWORK.JK_AA26.AAA150
  is '市级行政区划名称';

prompt
prompt Creating table JK_AC01
prompt ======================
prompt
create table FRAMEWORK.JK_AC01
(
  AAB299 VARCHAR2(6),
  AKC021 VARCHAR2(6),
  AAC006 NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FRAMEWORK.JK_AC01
  is '此表用于记录齐齐哈尔各个区县参保人员情况';
comment on column FRAMEWORK.JK_AC01.AAB299
  is '区县的统筹区编码';
comment on column FRAMEWORK.JK_AC01.AKC021
  is '参保人员类别';
comment on column FRAMEWORK.JK_AC01.AAC006
  is '该类别人数';

prompt
prompt Creating table JK_AC02
prompt ======================
prompt
create table FRAMEWORK.JK_AC02
(
  AAB299 VARCHAR2(6),
  AKC021 VARCHAR2(6),
  AAC006 NUMBER,
  AAE043 VARCHAR2(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FRAMEWORK.JK_AC02
  is '各个区县每期别（按月统计）的参保人数';
comment on column FRAMEWORK.JK_AC02.AAB299
  is '区县的统筹区编码';
comment on column FRAMEWORK.JK_AC02.AKC021
  is '参保人员类别';
comment on column FRAMEWORK.JK_AC02.AAC006
  is '该类别人数';
comment on column FRAMEWORK.JK_AC02.AAE043
  is '数据期别（按月统计形如201708）';

prompt
prompt Creating table JK_KC02
prompt ======================
prompt
create table FRAMEWORK.JK_KC02
(
  AAE073   VARCHAR2(20) not null,
  AAC001   VARCHAR2(20) not null,
  AAC001_N VARCHAR2(20),
  AAC003   VARCHAR2(20),
  AAC002   VARCHAR2(18),
  AAC004   VARCHAR2(4),
  AAC006   DATE,
  YAB003   VARCHAR2(6),
  YAB300   VARCHAR2(6),
  AKC170   VARCHAR2(3) not null,
  YDBZ     VARCHAR2(3),
  AKC044   DATE,
  AKC043   DATE,
  AKC021   VARCHAR2(3),
  AAE011   VARCHAR2(200),
  AAE036   DATE,
  YAB060   VARCHAR2(6),
  YAB600   VARCHAR2(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FRAMEWORK.JK_KC02
  is '异地监控人员基本信息';
comment on column FRAMEWORK.JK_KC02.AAE073
  is '审批编号';
comment on column FRAMEWORK.JK_KC02.AAC001
  is '参保地个人编号';
comment on column FRAMEWORK.JK_KC02.AAC001_N
  is '就医地个人编号';
comment on column FRAMEWORK.JK_KC02.AAC003
  is '姓名';
comment on column FRAMEWORK.JK_KC02.AAC002
  is '身份证号';
comment on column FRAMEWORK.JK_KC02.AAC004
  is '性别';
comment on column FRAMEWORK.JK_KC02.AAC006
  is '出生日期';
comment on column FRAMEWORK.JK_KC02.YAB003
  is '参保地';
comment on column FRAMEWORK.JK_KC02.YAB300
  is '就医地';
comment on column FRAMEWORK.JK_KC02.AKC170
  is '审批类别';
comment on column FRAMEWORK.JK_KC02.YDBZ
  is '异地有效标志';
comment on column FRAMEWORK.JK_KC02.AKC044
  is '备案开始日期';
comment on column FRAMEWORK.JK_KC02.AKC043
  is '备案终止日期';
comment on column FRAMEWORK.JK_KC02.AKC021
  is '参保人员类别';
comment on column FRAMEWORK.JK_KC02.AAE011
  is '经办人';
comment on column FRAMEWORK.JK_KC02.AAE036
  is '经办时间';
comment on column FRAMEWORK.JK_KC02.YAB060
  is '个人所属分中心编号';
comment on column FRAMEWORK.JK_KC02.YAB600
  is '就医地分中心编号';

prompt
prompt Creating table JK_KC21
prompt ======================
prompt
create table FRAMEWORK.JK_KC21
(
  AKC190 VARCHAR2(50),
  YAB003 VARCHAR2(6),
  YAB300 VARCHAR2(6),
  YAB060 VARCHAR2(6),
  YAB600 VARCHAR2(6),
  AAC001 VARCHAR2(20),
  AAC003 VARCHAR2(20),
  YKC023 VARCHAR2(3),
  AAE037 DATE,
  AAE011 VARCHAR2(20),
  AKC192 DATE,
  AKC194 DATE,
  AAC002 VARCHAR2(50),
  AKB020 VARCHAR2(14),
  AKB021 VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FRAMEWORK.JK_KC21
  is '患者在院数据表';
comment on column FRAMEWORK.JK_KC21.AKC190
  is '就诊登记号';
comment on column FRAMEWORK.JK_KC21.YAB003
  is '参保地统筹区编码';
comment on column FRAMEWORK.JK_KC21.YAB300
  is '就医地统筹区编码';
comment on column FRAMEWORK.JK_KC21.YAB060
  is '个人所属分中心编号';
comment on column FRAMEWORK.JK_KC21.YAB600
  is '就医地分中心编号';
comment on column FRAMEWORK.JK_KC21.AAC001
  is '个人编码';
comment on column FRAMEWORK.JK_KC21.AAC003
  is '姓名';
comment on column FRAMEWORK.JK_KC21.YKC023
  is '住院状态';
comment on column FRAMEWORK.JK_KC21.AAE037
  is '经办时间';
comment on column FRAMEWORK.JK_KC21.AAE011
  is '经办人';
comment on column FRAMEWORK.JK_KC21.AKC192
  is '入院时间';
comment on column FRAMEWORK.JK_KC21.AKC194
  is '出院时间';
comment on column FRAMEWORK.JK_KC21.AAC002
  is '身份证号';
comment on column FRAMEWORK.JK_KC21.AKB020
  is '医院编码';
comment on column FRAMEWORK.JK_KC21.AKB021
  is '医院名称';

prompt
prompt Creating table JK_KC24
prompt ======================
prompt
create table FRAMEWORK.JK_KC24
(
  AAC001   VARCHAR2(20),
  YAB300   VARCHAR2(6),
  YAB003   VARCHAR2(6),
  AKB020   VARCHAR2(14) not null,
  AKB021   VARCHAR2(100),
  AKC190   VARCHAR2(50),
  AKC193   VARCHAR2(20),
  YKC600   VARCHAR2(200),
  AKC192   DATE,
  AKC194   DATE,
  AKC264   NUMBER(14,2),
  AKC253   NUMBER(14,2),
  YKC621   NUMBER(14,2),
  AKC255   NUMBER(14,2),
  AKC256   NUMBER(14,2),
  AKC260   NUMBER(14,2),
  ZKC025   NUMBER(14,2),
  AKC351   VARCHAR2(30),
  AKA130   VARCHAR2(3),
  AAE040   DATE,
  AAE011   VARCHAR2(20),
  AAE036   DATE,
  YAB060   VARCHAR2(6),
  YAB600   VARCHAR2(6),
  AAE073   VARCHAR2(20),
  AAC001_N VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FRAMEWORK.JK_KC24
  is '监控结算信息汇总';
comment on column FRAMEWORK.JK_KC24.AAC001
  is '参保地个人编号';
comment on column FRAMEWORK.JK_KC24.YAB300
  is '就医地';
comment on column FRAMEWORK.JK_KC24.YAB003
  is '参保地';
comment on column FRAMEWORK.JK_KC24.AKB020
  is '定点编号';
comment on column FRAMEWORK.JK_KC24.AKB021
  is '定点名称';
comment on column FRAMEWORK.JK_KC24.AKC190
  is '住院号';
comment on column FRAMEWORK.JK_KC24.AKC193
  is '疾病编码(KC21获取)';
comment on column FRAMEWORK.JK_KC24.YKC600
  is '病种名称(KC21获取)';
comment on column FRAMEWORK.JK_KC24.AKC192
  is '入院时间';
comment on column FRAMEWORK.JK_KC24.AKC194
  is '出院时间';
comment on column FRAMEWORK.JK_KC24.AKC264
  is '医疗费用总额';
comment on column FRAMEWORK.JK_KC24.AKC253
  is '全自费金额';
comment on column FRAMEWORK.JK_KC24.YKC621
  is '本次现金支付';
comment on column FRAMEWORK.JK_KC24.AKC255
  is '个人账户支付';
comment on column FRAMEWORK.JK_KC24.AKC256
  is '经办机构支付(NVL(AKC264, 0) - NVL(AKC261, 0))';
comment on column FRAMEWORK.JK_KC24.AKC260
  is '职工基本医疗支付';
comment on column FRAMEWORK.JK_KC24.ZKC025
  is '公务员补助支付';
comment on column FRAMEWORK.JK_KC24.AKC351
  is '接收方结算流水号';
comment on column FRAMEWORK.JK_KC24.AKA130
  is '医疗类别(KC21获取)';
comment on column FRAMEWORK.JK_KC24.AAE040
  is '结算日期';
comment on column FRAMEWORK.JK_KC24.AAE011
  is '经办人';
comment on column FRAMEWORK.JK_KC24.AAE036
  is '经办时间';
comment on column FRAMEWORK.JK_KC24.YAB060
  is '个人所属分中心编号';
comment on column FRAMEWORK.JK_KC24.YAB600
  is '就医地分中心编号';

prompt
prompt Creating table JK_LOG
prompt =====================
prompt
create table FRAMEWORK.JK_LOG
(
  HASHCODE VARCHAR2(50),
  MESSAGE  VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JK_MSGNO
prompt =======================
prompt
create table FRAMEWORK.JK_MSGNO
(
  MSGNO   VARCHAR2(20),
  MSGNAME VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table JY_KC24
prompt ======================
prompt
create table FRAMEWORK.JY_KC24
(
  AKC190    VARCHAR2(50) not null,
  YAB003    VARCHAR2(6),
  YAB300    VARCHAR2(6),
  YAB060    VARCHAR2(6),
  YAB600    VARCHAR2(6),
  AAC001    VARCHAR2(20) not null,
  AAC003    VARCHAR2(20),
  AAC004    VARCHAR2(3),
  AAC002    VARCHAR2(18),
  AKC021    VARCHAR2(3),
  AKC261    NUMBER(14,2),
  AAB001    VARCHAR2(14),
  AAB004    VARCHAR2(100),
  AKB020    VARCHAR2(14) not null,
  AKB021    VARCHAR2(100),
  AKC264    NUMBER(14,2),
  AKC253    NUMBER(14,2),
  AKC265    NUMBER(14,2),
  AKC255    NUMBER(14,2),
  AAE040    DATE not null,
  AAE001    VARCHAR2(4),
  AAE011    VARCHAR2(50),
  AAE036    DATE,
  AAE072    VARCHAR2(50) not null,
  AKC350    VARCHAR2(30),
  AKC351    VARCHAR2(30),
  AKA135    VARCHAR2(3),
  AAE100    VARCHAR2(3),
  BALANCEID VARCHAR2(20) not null,
  AKC260    NUMBER(10,2),
  ZKC033    NUMBER(14,2),
  ZKC025    NUMBER(14,2),
  AAE314    VARCHAR2(3),
  AAA204    VARCHAR2(200),
  AAA229    VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 2M
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table FRAMEWORK.JY_KC24
  is '吉林省全国异地出院结算表';
comment on column FRAMEWORK.JY_KC24.AKC190
  is '就诊登记号';
comment on column FRAMEWORK.JY_KC24.YAB060
  is '参保地分中心编号';
comment on column FRAMEWORK.JY_KC24.YAB600
  is '就医地分中心编号';
comment on column FRAMEWORK.JY_KC24.AAC001
  is '个人编码';
comment on column FRAMEWORK.JY_KC24.AAC003
  is '姓名';
comment on column FRAMEWORK.JY_KC24.AAC004
  is '性别';
comment on column FRAMEWORK.JY_KC24.AAC002
  is '身份证号';
comment on column FRAMEWORK.JY_KC24.AKC021
  is '参保人员类别';
comment on column FRAMEWORK.JY_KC24.AKC261
  is '本次个人现金支付金额';
comment on column FRAMEWORK.JY_KC24.AAB001
  is '单位编码';
comment on column FRAMEWORK.JY_KC24.AAB004
  is '单位名称';
comment on column FRAMEWORK.JY_KC24.AKB020
  is '医院编码';
comment on column FRAMEWORK.JY_KC24.AKB021
  is '医院名称';
comment on column FRAMEWORK.JY_KC24.AKC264
  is '费用总额';
comment on column FRAMEWORK.JY_KC24.AKC253
  is '全自费部分';
comment on column FRAMEWORK.JY_KC24.AKC265
  is '医保基金支付';
comment on column FRAMEWORK.JY_KC24.AKC255
  is '个人帐户支付金额';
comment on column FRAMEWORK.JY_KC24.AAE040
  is '结算时间';
comment on column FRAMEWORK.JY_KC24.AAE001
  is '结算年度';
comment on column FRAMEWORK.JY_KC24.AAE011
  is '经办人';
comment on column FRAMEWORK.JY_KC24.AAE036
  is '经办时间';
comment on column FRAMEWORK.JY_KC24.AKC350
  is '发送方(医疗机构)交易流水号';
comment on column FRAMEWORK.JY_KC24.AKC351
  is '接收方(医保中心)交易流水号';
comment on column FRAMEWORK.JY_KC24.AKA135
  is '交易类型';
comment on column FRAMEWORK.JY_KC24.AAE100
  is '有效标志';
comment on column FRAMEWORK.JY_KC24.BALANCEID
  is '结算编号';
comment on column FRAMEWORK.JY_KC24.AKC260
  is '本次统筹应支付金额';
comment on column FRAMEWORK.JY_KC24.AAE314
  is '成功标志';
comment on column FRAMEWORK.JY_KC24.AAA204
  is '提示信息';
comment on column FRAMEWORK.JY_KC24.AAA229
  is '数据版本号';
alter table FRAMEWORK.JY_KC24
  add constraint PK_JY_KC24 primary key (BALANCEID)
  using index 
  tablespace INDEX_JLSI
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index FRAMEWORK.IDX_AKC35X on FRAMEWORK.JY_KC24 (AKC350, AKC351, AKA135)
  tablespace INDEX_JLSI
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index FRAMEWORK.IDX_BY10CYJSB_GRBM on FRAMEWORK.JY_KC24 (AAC001)
  tablespace INDEX_JLSI
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index FRAMEWORK.IDX_BY10CYJSB_YYBM on FRAMEWORK.JY_KC24 (AKB020)
  tablespace INDEX_JLSI
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating view V_JY_KC24
prompt =======================
prompt
CREATE OR REPLACE VIEW FRAMEWORK.V_JY_KC24 AS
SELECT "AKC190","YAB003","YAB300","YAB060","YAB600","AAC001","AAC003","AAC004","AAC002","AKC021","AKC261","AAB001","AAB004","AKB020","AKB021","AKC264","AKC253","AKC265","AKC255","AAE040","AAE001","AAE011","AAE036","AAE072","AKC350","AKC351","AKA135","AAE100","BALANCEID","AKC260","ZKC033","ZKC025","AAE314","AAA204","AAA229"FROM JY_KC24 KC24
    WHERE TO_CHAR(AAE036, 'yyyyMMdd') >= 20161101
    and NVL(AAE314, 3) = 3
    and aka135 in ('1', '-1')
    and aae072 not like '%CZ%'
    AND EXISTS (SELECT 1 FROM AY31@YDJY WHERE P_MSGID = KC24.AKC350)
    AND NOT EXISTS (SELECT 1 FROM JY_KC24 A WHERE A.AAC001 = KC24.AAC001 AND a.AKA135 = '2' AND SUBSTR(a.AAE072, 3) = KC24.AAE072)
		ORDER BY AAE040 DESC;


spool off
