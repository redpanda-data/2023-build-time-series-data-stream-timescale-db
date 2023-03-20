CREATE SCHEMA IF NOT EXISTS mock_data;

CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;

CREATE TABLE IF NOT EXISTS mock_data.peer_payouts
(
	payment_timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
	amount            DOUBLE PRECISION         NOT NULL,
	status            VARCHAR(10)              NOT NULL,
	currency_code     VARCHAR(10)              NOT NULL,
	sender            VARCHAR(50)              NOT NULL,
	recipient         VARCHAR(50)              NOT NULL,

	_loaded_at        TIMESTAMPTZ DEFAULT NOW()
);

SELECT create_hypertable('mock_data.peer_payouts', 'payment_timestamp');
