WITH order_metrics AS (
    SELECT Order_ID, Order_Timestamp, DATE_TRUNC('hour', Order_Timestamp) AS shift_hour, Weather_Condition, Courier_Vehicle, Est_Distance_km, Actual_Delivery_Time_Min, Final_Payout_HUF, ROUND((Final_Payout_HUF / NULLIF(Est_Distance_km, 0)), 2) AS actual_cost_per_km, ROUND((Est_Distance_km / NULLIF(Actual_Delivery_Time_Min, 0)) * 60, 2) AS speed_kmh
    FROM delivery_logs
    WHERE Est_Distance_km > 0.2
), cohort_baselines AS (
    SELECT *, ROUND(AVG(actual_cost_per_km) OVER(PARTITION BY Courier_Vehicle, Weather_Condition), 2) AS cohort_avg_cost_per_km, ROUND(AVG(Actual_Delivery_Time_Min) OVER(PARTITION BY shift_hour, Courier_Vehicle ORDER BY Order_Timestamp ROWS BETWEEN 50 PRECEDING AND CURRENT ROW), 0) AS rolling_expected_time_min
    FROM order_metrics
), anomaly_detection AS (
    SELECT *, ROUND(actual_cost_per_km - cohort_avg_cost_per_km, 2) AS cost_variance_huf, CASE WHEN actual_cost_per_km > (cohort_avg_cost_per_km * 1.25) THEN 'High Bleed (Audit Required)' WHEN actual_cost_per_km < (cohort_avg_cost_per_km * 0.85) THEN 'High Efficiency' ELSE 'Within Margin' END AS financial_status, CASE WHEN Actual_Delivery_Time_Min > (rolling_expected_time_min + 15) THEN 'Critical SLA Breach' ELSE 'On Time' END AS operational_status
    FROM cohort_baselines
)
SELECT Order_ID, shift_hour, Courier_Vehicle, Weather_Condition, Est_Distance_km, Final_Payout_HUF, actual_cost_per_km, cohort_avg_cost_per_km, financial_status, operational_status
FROM anomaly_detection;