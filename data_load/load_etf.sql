DELETE FROM pf_etf;

INSERT INTO pf_etf (
    name,
    isin,
    ticker,
    index_id,
    total_expense_ratio,
    listing_date 
) VALUES (
    'iShares Core MSCI World UCITS ETF USD (Acc)',
    'IE00B4L5Y983',
    'SWDA',
    (select id from pf_index where label = 'msci-world'),
    0.20,
    to_date('25-09-2009', 'dd-mm-yyyy')
);

INSERT INTO pf_etf (
    name,
    isin,
    ticker,
    index_id,
    total_expense_ratio,
    listing_date 
) VALUES (
    'iShares Core MSCI Emerging Markets IMI UCITS ETF (Acc)',
    'IE00BKM4GZ66',
    'EIMI',
    (select id from pf_index where label = 'msci-emerging-markets'),
    0.18,
    to_date('30-05-2014', 'dd-mm-yyyy')
);

commit;