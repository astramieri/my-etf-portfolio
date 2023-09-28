drop sequence pf_order_seq;

create sequence pf_order_seq nocache;

drop table pf_order;

create table pf_order (
    id              number(10)      not null,
    portfolio_id    number(10)      not null,
    etf_id          number(10)      not null,
    quantity        number(10)      not null,
    created         timestamp(3)    not null,
    updated         timestamp(3)    not null
);

alter table pf_order
    modify id default on null pf_order_seq.nextval;

alter table pf_order
    add constraint pf_order_pk primary key (id);

alter table pf_order
    add constraint pf_order_fk_01 
    foreign key (portfolio_id)
    references pf_portfolio (id);

alter table pf_order
    add constraint pf_order_fk_02 
    foreign key (etf_id)
    references pf_etf (id);

create index pf_order_idx_01 on pf_order (portfolio_id);
create index pf_order_idx_02 on pf_order (etf_id);
    
create or replace trigger pf_order_trg_01
    before insert or update 
    on pf_order
    for each row
declare
    v_systimestamp timestamp := systimestamp;
begin
    if inserting then
        :new.created := v_systimestamp;
    end if;
    
    :new.updated := v_systimestamp;
end pf_order_trg_01;
/