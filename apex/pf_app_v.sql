CREATE OR REPLACE VIEW pf_app_v
AS
      SELECT x.*
        FROM (SELECT 'Portfolios'
                         AS title,
                     q'[Collection of assets for diversified investment]'
                         AS subtitle,
                     q'[Mix of different types of assets with the aim of balancing risk and return]'
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
                     q'[Exchange-traded index fund that tracks the performance of market indices one-to-one.]'
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