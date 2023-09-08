drop sequence pf_index_seq;

create sequence pf_index_seq nocache;

drop table pf_index;

create table pf_index (
    id              number(10)      not null,
    name            varchar2(100)   not null,
    description     varchar2(400)   not null,
    created         timestamp(3)    not null,
    updated         timestamp(3)    not null
);

alter table pf_index
    modify id default on null pf_index_seq.nextval;

alter table pf_index
    add constraint pf_index_pk primary key (id);

create unique index pf_index_idx_01 on pf_index (name);
    
create or replace trigger pf_index_trg_01
    before insert or update 
    on pf_index
    for each row
declare
    v_systimestamp timestamp := systimestamp;
begin
    if inserting then
        :new.created := v_systimestamp;
    end if;
    
    :new.updated := v_systimestamp;
end pf_index_trg_01;
/