/**
 * 权限管理表
 **/

/* 用户表，已经包含原 用户信息表userinfo*/
drop table IF EXISTS P_USER;
create table P_USER 
(
   ID                   varchar(50)                    null,
   NAME                 varchar(50)                    null,
   PASSWORD             varchar(20)                    null,
   TELL                 varchar(50)                    null,
   MAIL                 varchar(50)                    null,
   COMPANY              varchar(50)                    null,
   USER_TYPE            varchar(10)                    null,
   ROLE_ID              varchar(50)                    null,
   MARK                 varchar(100)                   null
);

/*角色表*/
drop table IF EXISTS P_ROLE;
create table P_ROLE 
(
   ROLE_ID              varchar(50)                    null,
   ROLE_NAME            varchar(50)                    null,
   MENU_ID              varchar(50)                    null,
   MARK                 varchar(100)                   null
);

/*菜单表*/
drop table IF EXISTS P_MENU;

/*==============================================================*/
/* Table: P_MENU                                                */
/*==============================================================*/
create table P_MENU 
(
   MENU_ID              varchar(50)                    null,
   MANU_NAME            varchar(50)                    null,
   MANU_PATH            varchar(100)                   null,
   PARENT_ID            varchar(50)                    null,
   MARK                 varchar(100)                   null,
   STATE                varchar(20)                    null,
   ICON_CLS             varchar(20)                    null
);