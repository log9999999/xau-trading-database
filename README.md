# XAU/USD Algorithmic Trading Ecosystem

A technical stack built to automate execution logic and store detailed performance analytics for Gold (XAU/USD) trading. This repository bridges quantitative edge creation on TradingView with structured database design.

## 🏗️ Technical Stack Architecture
* **Execution Layer:** Pine Script v5 (TradingView)
* **Storage Layer:** PostgreSQL (Data Persistence)
* **Analytics Interface:** VS Code (Structured SQL Queries)

---

## 🌲 1. Pine Script Strategy Execution (`gold_strategy.pine`)
The strategy file houses the core systematic execution rules running live charts. It identifies structural edges while strictly filtering for market noise.

### Key Strategy Mechanics:
* **Trend & Volatility Alignment:** Employs moving average crossovers optimized for the gold market alongside dynamic volatility bands.
* **Intraday Session Filters:** Limits trade generation to high-liquidity trading hours to minimize overnight exposure and slippage.
* **Automated Risk Profiling:** Calculates precise position sizes dynamically based on account equity before printing execution signals.

---

## 🗄️ 2. Relational Database Layer (`xau_trading_schema.sql`)
A clean, scalable PostgreSQL schema designed to log every trade modification, ensuring zero rounding errors and high-precision historical data retention.

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
