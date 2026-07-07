# XAU/USD Trading History Database

A PostgreSQL database designed to log, track, and analyze historical gold (XAU/USD) trading performance. 

## 📊 Database Features
* **Automated Primary Keys:** Scalable tracking using serial IDs.
* **Precise Financial Types:** Using `NUMERIC` data types for exact price and profit/loss calculations, avoiding rounding issues.
* **Risk Analytics:** Built-in tracking for direction, execution runup, and maximum drawdown percentages.

## 🛠️ Database Schema

```sql
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
