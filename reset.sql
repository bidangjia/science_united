drop table su_keyword;
drop table su_project;
drop table su_allocation;
drop table su_project_keyword;
drop table su_user_keyword;
drop table su_account;
drop table su_host_project;
drop table su_accounting;
drop table su_accounting_project;
drop table su_accounting_user;
source schema.sql;
delete from user where id>0;
delete from host where id>0;
delete from forum_preferences where userid>0;
