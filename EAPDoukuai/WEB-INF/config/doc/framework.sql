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
  is '�����';
comment on column FRAMEWORK.JK_AA10.AAA100
  is '�������';
comment on column FRAMEWORK.JK_AA10.AAA102
  is '����ֵ';
comment on column FRAMEWORK.JK_AA10.AAA101
  is '�������';
comment on column FRAMEWORK.JK_AA10.AAA103
  is '��������';
comment on column FRAMEWORK.JK_AA10.AAA104
  is '�����ά����־';
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
  is '��������';
comment on column FRAMEWORK.JK_AA26.BAZ001
  is '��¼���';
comment on column FRAMEWORK.JK_AA26.BAZ002
  is '�������';
comment on column FRAMEWORK.JK_AA26.AAB301
  is '������������';
comment on column FRAMEWORK.JK_AA26.AAA146
  is '������������';
comment on column FRAMEWORK.JK_AA26.AAA148
  is '�ϼ�������������';
comment on column FRAMEWORK.JK_AA26.AAE383
  is '���������汾��';
comment on column FRAMEWORK.JK_AA26.AAE013
  is '��ע';
comment on column FRAMEWORK.JK_AA26.AAA149
  is '����';
comment on column FRAMEWORK.JK_AA26.AAA150
  is '�м�������������';

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
  is '�˱����ڼ�¼��������������زα���Ա���';
comment on column FRAMEWORK.JK_AC01.AAB299
  is '���ص�ͳ��������';
comment on column FRAMEWORK.JK_AC01.AKC021
  is '�α���Ա���';
comment on column FRAMEWORK.JK_AC01.AAC006
  is '���������';

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
  is '��������ÿ�ڱ𣨰���ͳ�ƣ��Ĳα�����';
comment on column FRAMEWORK.JK_AC02.AAB299
  is '���ص�ͳ��������';
comment on column FRAMEWORK.JK_AC02.AKC021
  is '�α���Ա���';
comment on column FRAMEWORK.JK_AC02.AAC006
  is '���������';
comment on column FRAMEWORK.JK_AC02.AAE043
  is '�����ڱ𣨰���ͳ������201708��';

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
  is '��ؼ����Ա������Ϣ';
comment on column FRAMEWORK.JK_KC02.AAE073
  is '�������';
comment on column FRAMEWORK.JK_KC02.AAC001
  is '�α��ظ��˱��';
comment on column FRAMEWORK.JK_KC02.AAC001_N
  is '��ҽ�ظ��˱��';
comment on column FRAMEWORK.JK_KC02.AAC003
  is '����';
comment on column FRAMEWORK.JK_KC02.AAC002
  is '���֤��';
comment on column FRAMEWORK.JK_KC02.AAC004
  is '�Ա�';
comment on column FRAMEWORK.JK_KC02.AAC006
  is '��������';
comment on column FRAMEWORK.JK_KC02.YAB003
  is '�α���';
comment on column FRAMEWORK.JK_KC02.YAB300
  is '��ҽ��';
comment on column FRAMEWORK.JK_KC02.AKC170
  is '�������';
comment on column FRAMEWORK.JK_KC02.YDBZ
  is '�����Ч��־';
comment on column FRAMEWORK.JK_KC02.AKC044
  is '������ʼ����';
comment on column FRAMEWORK.JK_KC02.AKC043
  is '������ֹ����';
comment on column FRAMEWORK.JK_KC02.AKC021
  is '�α���Ա���';
comment on column FRAMEWORK.JK_KC02.AAE011
  is '������';
comment on column FRAMEWORK.JK_KC02.AAE036
  is '����ʱ��';
comment on column FRAMEWORK.JK_KC02.YAB060
  is '�������������ı��';
comment on column FRAMEWORK.JK_KC02.YAB600
  is '��ҽ�ط����ı��';

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
  is '������Ժ���ݱ�';
comment on column FRAMEWORK.JK_KC21.AKC190
  is '����ǼǺ�';
comment on column FRAMEWORK.JK_KC21.YAB003
  is '�α���ͳ��������';
comment on column FRAMEWORK.JK_KC21.YAB300
  is '��ҽ��ͳ��������';
comment on column FRAMEWORK.JK_KC21.YAB060
  is '�������������ı��';
comment on column FRAMEWORK.JK_KC21.YAB600
  is '��ҽ�ط����ı��';
comment on column FRAMEWORK.JK_KC21.AAC001
  is '���˱���';
comment on column FRAMEWORK.JK_KC21.AAC003
  is '����';
comment on column FRAMEWORK.JK_KC21.YKC023
  is 'סԺ״̬';
comment on column FRAMEWORK.JK_KC21.AAE037
  is '����ʱ��';
comment on column FRAMEWORK.JK_KC21.AAE011
  is '������';
comment on column FRAMEWORK.JK_KC21.AKC192
  is '��Ժʱ��';
comment on column FRAMEWORK.JK_KC21.AKC194
  is '��Ժʱ��';
comment on column FRAMEWORK.JK_KC21.AAC002
  is '���֤��';
comment on column FRAMEWORK.JK_KC21.AKB020
  is 'ҽԺ����';
comment on column FRAMEWORK.JK_KC21.AKB021
  is 'ҽԺ����';

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
  is '��ؽ�����Ϣ����';
comment on column FRAMEWORK.JK_KC24.AAC001
  is '�α��ظ��˱��';
comment on column FRAMEWORK.JK_KC24.YAB300
  is '��ҽ��';
comment on column FRAMEWORK.JK_KC24.YAB003
  is '�α���';
comment on column FRAMEWORK.JK_KC24.AKB020
  is '������';
comment on column FRAMEWORK.JK_KC24.AKB021
  is '��������';
comment on column FRAMEWORK.JK_KC24.AKC190
  is 'סԺ��';
comment on column FRAMEWORK.JK_KC24.AKC193
  is '��������(KC21��ȡ)';
comment on column FRAMEWORK.JK_KC24.YKC600
  is '��������(KC21��ȡ)';
comment on column FRAMEWORK.JK_KC24.AKC192
  is '��Ժʱ��';
comment on column FRAMEWORK.JK_KC24.AKC194
  is '��Ժʱ��';
comment on column FRAMEWORK.JK_KC24.AKC264
  is 'ҽ�Ʒ����ܶ�';
comment on column FRAMEWORK.JK_KC24.AKC253
  is 'ȫ�Էѽ��';
comment on column FRAMEWORK.JK_KC24.YKC621
  is '�����ֽ�֧��';
comment on column FRAMEWORK.JK_KC24.AKC255
  is '�����˻�֧��';
comment on column FRAMEWORK.JK_KC24.AKC256
  is '�������֧��(NVL(AKC264, 0) - NVL(AKC261, 0))';
comment on column FRAMEWORK.JK_KC24.AKC260
  is 'ְ������ҽ��֧��';
comment on column FRAMEWORK.JK_KC24.ZKC025
  is '����Ա����֧��';
comment on column FRAMEWORK.JK_KC24.AKC351
  is '���շ�������ˮ��';
comment on column FRAMEWORK.JK_KC24.AKA130
  is 'ҽ�����(KC21��ȡ)';
comment on column FRAMEWORK.JK_KC24.AAE040
  is '��������';
comment on column FRAMEWORK.JK_KC24.AAE011
  is '������';
comment on column FRAMEWORK.JK_KC24.AAE036
  is '����ʱ��';
comment on column FRAMEWORK.JK_KC24.YAB060
  is '�������������ı��';
comment on column FRAMEWORK.JK_KC24.YAB600
  is '��ҽ�ط����ı��';

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
  is '����ʡȫ����س�Ժ�����';
comment on column FRAMEWORK.JY_KC24.AKC190
  is '����ǼǺ�';
comment on column FRAMEWORK.JY_KC24.YAB060
  is '�α��ط����ı��';
comment on column FRAMEWORK.JY_KC24.YAB600
  is '��ҽ�ط����ı��';
comment on column FRAMEWORK.JY_KC24.AAC001
  is '���˱���';
comment on column FRAMEWORK.JY_KC24.AAC003
  is '����';
comment on column FRAMEWORK.JY_KC24.AAC004
  is '�Ա�';
comment on column FRAMEWORK.JY_KC24.AAC002
  is '���֤��';
comment on column FRAMEWORK.JY_KC24.AKC021
  is '�α���Ա���';
comment on column FRAMEWORK.JY_KC24.AKC261
  is '���θ����ֽ�֧�����';
comment on column FRAMEWORK.JY_KC24.AAB001
  is '��λ����';
comment on column FRAMEWORK.JY_KC24.AAB004
  is '��λ����';
comment on column FRAMEWORK.JY_KC24.AKB020
  is 'ҽԺ����';
comment on column FRAMEWORK.JY_KC24.AKB021
  is 'ҽԺ����';
comment on column FRAMEWORK.JY_KC24.AKC264
  is '�����ܶ�';
comment on column FRAMEWORK.JY_KC24.AKC253
  is 'ȫ�ԷѲ���';
comment on column FRAMEWORK.JY_KC24.AKC265
  is 'ҽ������֧��';
comment on column FRAMEWORK.JY_KC24.AKC255
  is '�����ʻ�֧�����';
comment on column FRAMEWORK.JY_KC24.AAE040
  is '����ʱ��';
comment on column FRAMEWORK.JY_KC24.AAE001
  is '�������';
comment on column FRAMEWORK.JY_KC24.AAE011
  is '������';
comment on column FRAMEWORK.JY_KC24.AAE036
  is '����ʱ��';
comment on column FRAMEWORK.JY_KC24.AKC350
  is '���ͷ�(ҽ�ƻ���)������ˮ��';
comment on column FRAMEWORK.JY_KC24.AKC351
  is '���շ�(ҽ������)������ˮ��';
comment on column FRAMEWORK.JY_KC24.AKA135
  is '��������';
comment on column FRAMEWORK.JY_KC24.AAE100
  is '��Ч��־';
comment on column FRAMEWORK.JY_KC24.BALANCEID
  is '������';
comment on column FRAMEWORK.JY_KC24.AKC260
  is '����ͳ��Ӧ֧�����';
comment on column FRAMEWORK.JY_KC24.AAE314
  is '�ɹ���־';
comment on column FRAMEWORK.JY_KC24.AAA204
  is '��ʾ��Ϣ';
comment on column FRAMEWORK.JY_KC24.AAA229
  is '���ݰ汾��';
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
