drop sequence pf_portfolio_seq;

create sequence pf_portfolio_seq nocache;

drop table pf_portfolio;

create table pf_portfolio (
    id              number(10)      not null,
    name            varchar2(100)   not null,
    description     varchar2(500)   not null,
    created         timestamp(3)    not null,
    updated         timestamp(3)    not null
);

alter table pf_portfolio
    modify id default on null pf_portfolio_seq.nextval;

alter table pf_portfolio
    add constraint pf_portfolio_pk primary key (id);
    
create or replace trigger pf_portfolio_trg_01
    before insert or update 
    on pf_portfolio
    for each row
declare
    v_systimestamp timestamp := systimestamp;
begin
    if inserting then
        :new.created := v_systimestamp;
    end if;
    
    :new.updated := v_systimestamp;
end pf_portfolio_trg_01;
/