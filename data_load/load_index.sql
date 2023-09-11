INSERT INTO pf_index (
    label,
    name,
    description,
    constituents,
    last_update
) VALUES (
    'msci-world',
    'MSCI World Index (USD)',
    'The MSCI World Index captures large and mid-cap representation across 23 Developed Markets (DM) countries. DM countries include: Australia, Austria, Belgium, Canada, Denmark, Finland, France, Germany, Hong Kong, Ireland, Israel, Italy, Japan, Netherlands, New Zealand, Norway, Portugal, Singapore, Spain, Sweden, Switzerland, the UK and the US.',
    1513,
    to_date('31-AUG-2023', 'dd-mm-yyyy')
);

INSERT INTO pf_index (
    label,
    name,
    description,
    constituents,
    last_update
) VALUES (
    'msci-emerging-markets',
    'MSCI Emerging Markets Index (USD)',
    'The MSCI Emerging Markets Index captures large and mid cap representation across 24 Emerging Markets (EM) countries. EM countries include: Brazil, Chile, China, Colombia, Czech Republic, Egypt, Greece, Hungary, India, Indonesia, Korea, Kuwait, Malaysia, Mexico, Peru, Philippines, Poland, Qatar, Saudi Arabia, South Africa, Taiwan, Thailand, Turkey and United Arab Emirates.',
    1421,
    to_date('31-AUG-2023', 'dd-mm-yyyy')
);

INSERT INTO pf_index (
    label,
    name,
    description,
    constituents,
    last_update
) VALUES (
    'msci-europe',
    'MSCI Europe Index (USD)',
    'The MSCI Europe Index captures large and mid cap representation across 15 Developed Markets (DM) countries in Europe. DM countries in Europe include: Austria, Belgium, Denmark, Finland, France, Germany, Ireland, Italy, the Netherlands, Norway, Portugal, Spain, Sweden, Switzerland and the UK.',
    1421,
    to_date('31-AUG-2023', 'dd-mm-yyyy')
);

commit;