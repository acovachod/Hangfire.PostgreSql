SET search_path = 'hangfire';

DO $$
BEGIN
    IF EXISTS(SELECT 1 FROM "schema" WHERE "version"::integer >= 21) THEN
        RAISE EXCEPTION 'version-already-applied';
END IF;
END $$;

-- Set REPLICA IDENTITY to allow replication
-- YugabyteDB does not support REPLICA IDENTITY, this DB probably does not need it because the replication differs from PostgreSQL
-- ALTER TABLE "lock" REPLICA IDENTITY USING INDEX "lock_resource_key";

RESET search_path;
