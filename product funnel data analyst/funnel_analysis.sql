create database product_funnel;
use product_funnel;
SELECT
    event_name,
    COUNT(DISTINCT user_id) AS users
FROM user_event_data_cleaned
GROUP BY event_name
ORDER BY users DESC;

WITH funnel AS (
    SELECT
        user_id,
        MAX(CASE WHEN event_name = 'app_open' THEN 1 ELSE 0 END) AS app_open,
        MAX(CASE WHEN event_name = 'signup' THEN 1 ELSE 0 END) AS signup,
        MAX(CASE WHEN event_name = 'login' THEN 1 ELSE 0 END) AS login,
        MAX(CASE WHEN event_name = 'search' THEN 1 ELSE 0 END) AS search,
        MAX(CASE WHEN event_name = 'view_product' THEN 1 ELSE 0 END) AS view_product,
        MAX(CASE WHEN event_name = 'add_to_cart' THEN 1 ELSE 0 END) AS add_to_cart,
        MAX(CASE WHEN event_name = 'checkout' THEN 1 ELSE 0 END) AS checkout,
        MAX(CASE WHEN event_name = 'purchase' THEN 1 ELSE 0 END) AS purchase
    FROM user_event_data_cleaned
    GROUP BY user_id
)

SELECT
    COUNT(*) AS total_users,
    SUM(app_open) AS app_open_users,
    SUM(signup) AS signup_users,
    SUM(login) AS login_users,
    SUM(search) AS search_users,
    SUM(view_product) AS view_product_users,
    SUM(add_to_cart) AS add_to_cart_users,
    SUM(checkout) AS checkout_users,
    SUM(purchase) AS purchase_users
FROM funnel;

WITH funnel AS (
    SELECT
        user_id,
        MAX(CASE WHEN event_name = 'app_open' THEN 1 ELSE 0 END) AS app_open,
        MAX(CASE WHEN event_name = 'signup' THEN 1 ELSE 0 END) AS signup,
        MAX(CASE WHEN event_name = 'login' THEN 1 ELSE 0 END) AS login,
        MAX(CASE WHEN event_name = 'purchase' THEN 1 ELSE 0 END) AS purchase
    FROM user_event_data_cleaned
    GROUP BY user_id
)

SELECT
    SUM(signup)*100.0 / SUM(app_open) AS app_to_signup_rate,
    SUM(login)*100.0 / SUM(signup) AS signup_to_login_rate,
    SUM(purchase)*100.0 / SUM(login) AS login_to_purchase_rate
FROM funnel;

WITH funnel AS (
    SELECT
        user_id,
        MAX(CASE WHEN event_name = 'app_open' THEN 1 ELSE 0 END) AS app_open,
        MAX(CASE WHEN event_name = 'signup' THEN 1 ELSE 0 END) AS signup,
        MAX(CASE WHEN event_name = 'login' THEN 1 ELSE 0 END) AS login
    FROM user_event_data_cleaned
    GROUP BY user_id
)

SELECT
    SUM(app_open) - SUM(signup) AS drop_after_app_open,
    SUM(signup) - SUM(login) AS drop_after_signup
FROM funnel;


WITH device_funnel AS (
    SELECT
        device_type,
        user_id,
        MAX(CASE WHEN event_name = 'purchase' THEN 1 ELSE 0 END) AS purchase
    FROM user_event_data_cleaned
    GROUP BY device_type, user_id
)

SELECT
    device_type,
    COUNT(user_id) AS users,
    SUM(purchase) AS purchasers,
    SUM(purchase)*100.0 / COUNT(user_id) AS conversion_rate
FROM device_funnel
GROUP BY device_type
ORDER BY conversion_rate DESC;

SELECT
    country,
    COUNT(DISTINCT user_id) AS users,
    COUNT(CASE WHEN event_name = 'purchase' THEN user_id END) AS purchases
FROM user_events
GROUP BY country
ORDER BY purchases DESC;

drop table user_events;

show tables;






