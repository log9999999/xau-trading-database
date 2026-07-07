CREATE TABLE IF NOT EXISTS historical_trades (
    trade_id SERIAL PRIMARY KEY,
    ticker VARCHAR(20) NOT NULL,
    direction VARCHAR(10) NOT NULL,
    entry_time TIMESTAMPTZ NOT NULL,
    entry_price NUMERIC(18, 4) NOT NULL,
    exit_time TIMESTAMPTZ NOT NULL,
    exit_price NUMERIC(18, 4) NOT NULL,
    contracts NUMERIC(18, 4) NOT NULL,
    profit_loss NUMERIC(18, 4) NOT NULL,
    runup_percent NUMERIC(5, 2),
    drawdown_percent NUMERIC(5, 2)
);

INSERT INTO historical_trades 
    (ticker, direction, entry_time, entry_price, exit_time, exit_price, contracts, profit_loss, runup_percent, drawdown_percent)
VALUES
    ('XAU/USD', 'Long', '2026-06-15 08:30:00+01', 2345.50, '2026-06-15 14:15:00+01', 2362.20, 10.00, 167.00, 0.85, 0.12),
    ('XAU/USD', 'Short', '2026-06-16 10:00:00+01', 2358.00, '2026-06-16 11:45:00+01', 2364.50, 10.00, -65.00, 0.05, 0.32),
    ('XAU/USD', 'Short', '2026-06-18 13:00:00+01', 2370.10, '2026-06-18 19:30:00+01', 2342.40, 15.00, 415.50, 1.25, 0.18),
    ('XAU/USD', 'Long', '2026-06-22 09:15:00+01', 2335.00, '2026-06-22 16:00:00+01', 2331.80, 20.00, -64.00, 0.22, 0.28);

    SELECT 
    ticker,
    COUNT(*) AS total_trades,
    ROUND(SUM(profit_loss), 2) AS net_pnl,
    ROUND(AVG(profit_loss), 2) AS avg_pnl_per_trade
FROM historical_trades
GROUP BY ticker;