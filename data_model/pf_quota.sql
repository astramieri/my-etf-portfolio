drop sequence pf_quota_seq;

create sequence pf_quota_seq nocache;

drop table pf_quota;

create table pf_quota (
    id              number(10)      not null,
    portfolio_id    number(10)      not null,
    etf_id          number(10)      not null,
    quantity        number(10)      not null,
    created         timestamp(3)    not null,
    updated         timestamp(3)    not null
);

alter table pf_quota
    modify id default on null pf_quota_seq.nextval;

alter table pf_quota
    add constraint pf_quota_pk primary key (id);

alter table pf_quota
    add constraint pf_quota_fk_01 
    foreign key (portfolio_id)
    references pf_portfolio (id);

alter table pf_quota
    add constraint pf_quota_fk_02 
    foreign key (etf_id)
    references pf_etf (id);

create index pf_quota_idx_01 on pf_quota (portfolio_id);
create index pf_quota_idx_02 on pf_quota (etf_id);
    
create or replace trigger pf_quota_trg_01
    before insert or update 
    on pf_quota
    for each row
declare
    v_systimestamp timestamp := systimestamp;
begin
    if inserting then
        :new.created := v_systimestamp;
    end if;
    
    :new.updated := v_systimestamp;
end pf_quota_trg_01;
/