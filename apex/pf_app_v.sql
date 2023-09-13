CREATE OR REPLACE VIEW pf_app_v AS
    SELECT
        x.*
    FROM
        (
            SELECT
                'Indexes'                                                                                        AS title,
                q'[Financial market's performance]'                                                              AS subtitle,
                q'[Statistical measures that show the performances of a market or a specific sector over time.]' AS body,
                'fa fa-bar-chart u-color-1'                                                                      AS icon,
                apex_page.get_url(p_page => 2)                                                                   AS url,
                1                                                                                                AS sequence
            FROM
                dual
        ) x;