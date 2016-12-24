create table su_keyword (
    id                      integer         not null auto_increment,
    word                    varchar(254)    not null,
    category                tinyint         not null,
    primary key (id)
) engine=InnoDB;

create table su_project (
    id                      integer         not null auto_increment,
    create_time             double          not null,
    name                    varchar(254)    not null,
    url                     varchar(254)    not null,
    url_signature           varchar(1024)   not null,
    allocation              double          not null,
    credit                  double          not null,
    primary key (id)
) engine=InnoDB;

create table su_project_keyword (
    project_id              integer         not null,
    keyword_id              integer         not null,
    unique(project_id, keyword_id)
) engine=InnoDB;

create table su_user_keyword (
    user_id                 integer         not null,
    keyword_id              integer         not null,
    type                    smallint        not null,
    unique(user_id, keyword_id)
) engine=InnoDB;

create table su_account (
    user_id                 integer         not null,
    project_id              integer         not null,
    authenticator           varchar(254)    not null,
    state                   smallint        not null,
    retry_time              double          not null,
    unique(user_id, project_id),
    index account_state (state)
) engine=InnoDB;

/*
 * historical accounting records, for
 * - total
 * - per project
 * - per user
 *
 * We could also have per-host, per-user-project, per-host-project etc.
 * but let's defer those
 */

create table su_accounting (
    create_time             double          not null,
    rec                     double          not null,
    nactive_hosts           integer         not null,
    nactive_users           integer         not null,
    index (create_time)
) engine=InnoDB;


create table su_accounting_project (
    create_time             double          not null,
    project_id              integer         not null,
    rec                     double          not null,
    rec_time                double          not null,
    index (create_time)
) engine=InnoDB;

create table su_accounting_user (
    create_time             double          not null,
    user_id                 integer         not null,
    rec                     double          not null,
    rec_time                double          not null,
    index (create_time)
) engine=InnoDB;
