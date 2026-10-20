-- Convert Mock* Float monetary columns to Decimal(20,8) for precision-safe math
-- This migration addresses issue #621: MockRound, MockBet, and MockPlatformStat
-- had Float columns that could drift from production Decimal(20,8) values.

-- MockRound: startPrice, poolUp, poolDown, totalPool
ALTER TABLE "hackathon_rounds" ALTER COLUMN "start_price" SET DATA TYPE DECIMAL(20, 8);
ALTER TABLE "hackathon_rounds" ALTER COLUMN "pool_up" SET DATA TYPE DECIMAL(20, 8);
ALTER TABLE "hackathon_rounds" ALTER COLUMN "pool_down" SET DATA TYPE DECIMAL(20, 8);
ALTER TABLE "hackathon_rounds" ALTER COLUMN "total_pool" SET DATA TYPE DECIMAL(20, 8);

-- MockBet: amount, predicted_price
ALTER TABLE "hackathon_bets" ALTER COLUMN "amount" SET DATA TYPE DECIMAL(20, 8);
ALTER TABLE "hackathon_bets" ALTER COLUMN "predicted_price" SET DATA TYPE DECIMAL(20, 8);

-- MockPlatformStat: totalVxlmDistributed
ALTER TABLE "MockPlatformStat" ALTER COLUMN "totalVxlmDistributed" SET DATA TYPE DECIMAL(20, 8);
