INSERT INTO pf_order (
    portfolio_id,
    etf_id,
    quantity
) VALUES (
    (select id from pf_portfolio where name = 'The long-term investor'),
    (select id from pf_etf where ticker = 'SWDA'),
    120
);

commit;