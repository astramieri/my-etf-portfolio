INSERT INTO pf_etf (
    name,
    isin,
    ticker,
    index_id
) VALUES (
    'iShares Core MSCI World UCITS ETF USD (Acc)',
    'IE00B4L5Y983',
    'SWDA',
    (select id from pf_index where name = 'MSCI World Index (USD)')
);

commit;