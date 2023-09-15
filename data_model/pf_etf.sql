drop sequence pf_etf_seq;

create sequence pf_etf_seq nocache;

drop table pf_etf cascade constraints;

create table pf_etf (
    id                      number(10)      not null,
    name                    varchar2(100)   not null,
    isin                    varchar2(12)    not null,
    ticker                  varchar2(10)    not null,
    index_id                number(10)      not null,
    total_expense_ratio     number(4, 2)    not null,
    listing_date            date            not null,
    created                 timestamp(3)    not null,
    updated                 timestamp(3)    not null
);

alter table pf_etf
    modify id default on null pf_etf_seq.nextval;

alter table pf_etf
    add constraint pf_etf_pk primary key (id);

alter table pf_etf
    add constraint pf_etf_fx_01 
    foreign key (index_id)
    references pf_index (id);

create index pf_etf_idx_01 on pf_etf (isin);
create index pf_etf_idx_02 on pf_etf (ticker);
create index pf_etf_idx_03 on pf_etf (index_id);
    
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