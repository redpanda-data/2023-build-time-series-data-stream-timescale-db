SELECT * FROM mock_data.peer_payouts
WHERE currency_code = 'EUR' AND payment_timestamp >= NOW() - INTERVAL '5 seconds'
ORDER BY payment_timestamp;
