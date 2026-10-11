
CREDIT CARD DEFAULT RISK ANALYSIS - SQL QUERIES

QUERY 1: OVERALL KPIs

SELECT
    COUNT(*) AS total_customers,
    SUM(default_status) AS default_customers,
    COUNT(*) - SUM(default_status) AS non_default_customers,
    ROUND(AVG(default_status) * 100, 2) AS default_rate_percentage,
    ROUND(AVG(LIMIT_BAL), 2) AS average_credit_limit
FROM credit_card_customers;


QUERY 2: GENDER ANALYSIS

SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(default_status) AS default_customers,
    ROUND(AVG(default_status) * 100, 2) AS default_rate_percentage,
    ROUND(AVG(LIMIT_BAL), 2) AS average_credit_limit
FROM credit_card_customers
GROUP BY gender
ORDER BY default_rate_percentage DESC;


QUERY 3: EDUCATION ANALYSIS

SELECT
    education_level,
    COUNT(*) AS total_customers,
    SUM(default_status) AS default_customers,
    ROUND(AVG(default_status) * 100, 2) AS default_rate_percentage,
    ROUND(AVG(LIMIT_BAL), 2) AS average_credit_limit
FROM credit_card_customers
GROUP BY education_level
ORDER BY default_rate_percentage DESC;


QUERY 4: MARITAL STATUS ANALYSIS

SELECT
    marital_status,
    COUNT(*) AS total_customers,
    SUM(default_status) AS default_customers,
    ROUND(AVG(default_status) * 100, 2) AS default_rate_percentage
FROM credit_card_customers
GROUP BY marital_status
ORDER BY default_rate_percentage DESC;


QUERY 5: AGE GROUP ANALYSIS

SELECT
    age_group,
    COUNT(*) AS total_customers,
    SUM(default_status) AS default_customers,
    ROUND(AVG(default_status) * 100, 2) AS default_rate_percentage,
    ROUND(AVG(LIMIT_BAL), 2) AS average_credit_limit
FROM credit_card_customers
GROUP BY age_group
ORDER BY default_rate_percentage DESC;


QUERY 6: CREDIT LIMIT ANALYSIS

SELECT
    credit_limit_group,
    COUNT(*) AS total_customers,
    SUM(default_status) AS default_customers,
    ROUND(AVG(default_status) * 100, 2) AS default_rate_percentage,
    ROUND(AVG(LIMIT_BAL), 2) AS average_credit_limit
FROM credit_card_customers
GROUP BY credit_limit_group
ORDER BY default_rate_percentage DESC;


QUERY 7: RISK SEGMENT ANALYSIS

SELECT
    risk_segment,
    COUNT(*) AS total_customers,
    SUM(default_status) AS default_customers,
    ROUND(AVG(default_status) * 100, 2) AS default_rate_percentage,
    ROUND(AVG(delayed_months_count), 2) AS average_delayed_months,
    ROUND(AVG(bill_to_limit_ratio), 2) AS average_bill_to_limit_ratio
FROM credit_card_customers
GROUP BY risk_segment
ORDER BY default_rate_percentage DESC;


QUERY 8: DELAYED MONTH ANALYSIS

SELECT
    delayed_months_count,
    COUNT(*) AS total_customers,
    SUM(default_status) AS default_customers,
    ROUND(AVG(default_status) * 100, 2) AS default_rate_percentage
FROM credit_card_customers
GROUP BY delayed_months_count
ORDER BY delayed_months_count;


QUERY 9: PAYMENT BEHAVIOUR

SELECT
    default_label,
    COUNT(*) AS total_customers,
    ROUND(AVG(average_bill_amount), 2) AS average_bill_amount,
    ROUND(AVG(average_payment_amount), 2) AS average_payment_amount,
    ROUND(AVG(bill_to_limit_ratio), 3) AS average_bill_to_limit_ratio,
    ROUND(AVG(payment_to_bill_ratio), 3) AS average_payment_to_bill_ratio,
    ROUND(AVG(delayed_months_count), 2) AS average_delayed_months
FROM credit_card_customers
GROUP BY default_label;


QUERY 10: TOP HIGH-RISK CUSTOMERS

SELECT
    ID,
    AGE,
    gender,
    education_level,
    marital_status,
    LIMIT_BAL,
    average_bill_amount,
    total_payment_amount,
    delayed_months_count,
    maximum_delay_months,
    ROUND(bill_to_limit_ratio, 3) AS bill_to_limit_ratio,
    risk_segment,
    default_label
FROM credit_card_customers
WHERE risk_segment = 'High Risk'
ORDER BY
    delayed_months_count DESC,
    bill_to_limit_ratio DESC
LIMIT 10;


QUERY 11: RISK SEGMENT RANKING

WITH risk_summary AS (
    SELECT
        risk_segment,
        COUNT(*) AS total_customers,
        SUM(default_status) AS default_customers,
        ROUND(AVG(default_status) * 100, 2)
            AS default_rate_percentage
    FROM credit_card_customers
    GROUP BY risk_segment
)

SELECT
    *,
    RANK() OVER (
        ORDER BY default_rate_percentage DESC
    ) AS risk_rank
FROM risk_summary;

