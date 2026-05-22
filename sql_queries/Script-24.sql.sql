CREATE TABLE delivery_logs (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Order_Timestamp TIMESTAMP,
    Pickup_Lat NUMERIC(9,6),
    Pickup_Lon NUMERIC(9,6),
    Dropoff_Lat NUMERIC(9,6),
    Dropoff_Lon NUMERIC(9,6),
    Weather_Condition VARCHAR(20),
    Courier_Vehicle VARCHAR(20),
    Est_Distance_km NUMERIC(5,2),
    Base_Payout_HUF NUMERIC(8,2),
    Is_Peak_Hour BOOLEAN,
    Final_Payout_HUF NUMERIC(8,2),
    Actual_Delivery_Time_Min INT
);