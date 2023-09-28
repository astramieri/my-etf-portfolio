CREATE OR REPLACE VIEW pf_app_v
AS
      SELECT x.*
        FROM (SELECT 'Portfolio'
                         AS title,
                     q'[Collection of ETFs for diversified investment]'
                         AS subtitle,
                     q'[Portfolios are managed with the aim of optimizing returns while considering the individual's risk tolerance and investment horizon.]'
                         AS body,
                     'fa fa-pie-chart u-color-11'
                         AS icon,
                     apex_page.get_url (p_page => 8)
                         AS url,
                     1
                         AS sequence
                FROM dual
              UNION
              SELECT 'ETFs'
                         AS title,
                     q'[Exchange-Traded Funds]'
                         AS subtitle,
                     q'[Exchange-traded index fund that tracks the performance of well-known market indices one-to-one.]'
                         AS body,
                     'fa fa-stock-chart u-color-7'
                         AS icon,
                     apex_page.get_url (p_page => 4)
                         AS url,
                     2
                         AS sequence
                FROM dual
              UNION
              SELECT 'Indexes'                                                             AS title,
                     q'[Financial market's performance]'                                   AS subtitle,
                     q'[Securities basket representing a whole market or a submarket.]'    AS body,
                     'fa fa-bar-chart u-color-4'                                           AS icon,
                     apex_page.get_url (p_page => 2)                                       AS url,
                     3                                                                     AS sequence
                FROM dual) x
    ORDER BY x.sequence ASC;