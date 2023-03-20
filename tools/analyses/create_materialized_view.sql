CREATE MATERIALIZED VIEW mock_data.peer_payouts_per_minute
	WITH (timescaledb.continuous) AS
SELECT
	time_bucket('5 minute', payment_timestamp) AS day,
	status,
	AVG(amount)                                AS mean_amount,
	STDDEV(amount)                             AS std_amount,
	MAX(amount)                                AS max_amount,
	COUNT(1)                                   AS frequency
FROM mock_data.peer_payouts pyt
WHERE status = 'fail'
GROUP BY day, status;
