drop sequence pf_etf_seq;

create sequence pf_etf_seq nocache;

drop table pf_etf;

create table pf_etf (
    id              number(10)      not null,
    title           varchar2(100)   not null,
    isin            varchar2(12)    not null,
    ticker          varchar2(4)     not null,
    created         timestamp(3)    not null,
    updated         timestamp(3)    not null
);

alter table pf_etf
    modify id default on null pf_etf_seq.nextval;

alter table pf_etf
    add constraint pf_etf_pk primary key (id);
    
create or replace trigger pf_etf_trg_01
    before insert or update 
    on pf_etf
    for each row
declare
    v_systimestamp timestamp := systimestamp;
begin
    if inserting then
        :new.created := v_systimestamp;
    end if;
    
    :new.updated := v_systimestamp;
end pf_etf_trg_01;
/