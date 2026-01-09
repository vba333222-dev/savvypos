-- =============================================
-- Enterprise Upgrade Migration (REMEDIATED)
-- Safe Data Seeding & Schema Evolution
-- =============================================

BEGIN;

-- 1. Create Outlets Table
CREATE TABLE IF NOT EXISTS outlets (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE,
    uuid VARCHAR(255) UNIQUE NOT NULL,
    tenant_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    address TEXT,
    phone VARCHAR(50)
);

-- 2. Create Warehouses Table
CREATE TABLE IF NOT EXISTS warehouses (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE,
    uuid VARCHAR(255) UNIQUE NOT NULL,
    tenant_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    is_store_front BOOLEAN DEFAULT FALSE,
    outlet_uuid VARCHAR(255) REFERENCES outlets(uuid)
);

-- 3. Create Suppliers Table
CREATE TABLE IF NOT EXISTS suppliers (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE,
    uuid VARCHAR(255) UNIQUE NOT NULL,
    tenant_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(50),
    address TEXT
);

-- 4. Create Product Suppliers (Many-to-Many)
CREATE TABLE IF NOT EXISTS product_suppliers (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE,
    product_uuid VARCHAR(255) NOT NULL, 
    supplier_uuid VARCHAR(255) REFERENCES suppliers(uuid),
    tenant_id VARCHAR(255) NOT NULL,
    cost_price NUMERIC(15, 2) DEFAULT 0,
    lead_time_days INT DEFAULT 0,
    min_order_qty NUMERIC(15, 2) DEFAULT 0,
    UNIQUE(product_uuid, supplier_uuid)
);

-- 5. Create Inventory Stocks Table
CREATE TABLE IF NOT EXISTS inventory_stocks (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE,
    product_uuid VARCHAR(255) NOT NULL,
    warehouse_uuid VARCHAR(255) REFERENCES warehouses(uuid),
    tenant_id VARCHAR(255) NOT NULL,
    quantity NUMERIC(15, 2) DEFAULT 0,
    UNIQUE(product_uuid, warehouse_uuid)
);

-- 6. SAFE DATA MIGRATION (Idempotent)

-- 6a. Ensure Default Warehouse exists for each Tenant in Products
INSERT INTO warehouses (uuid, tenant_id, name, is_store_front, created_at, updated_at)
SELECT 
    'default-warehouse-' || tenant_id, 
    tenant_id, 
    'Main Store', 
    TRUE,
    NOW(),
    NOW()
FROM (SELECT DISTINCT tenant_id FROM products WHERE tenant_id IS NOT NULL) AS tenants
WHERE NOT EXISTS (
    SELECT 1 FROM warehouses w WHERE w.uuid = 'default-warehouse-' || tenants.tenant_id
);

-- 6b. COPY Data from Products.stock to InventoryStocks (Only if not already migrated)
-- This preserves the existing stock levels by moving them to the new structure.
INSERT INTO inventory_stocks (product_uuid, warehouse_uuid, tenant_id, quantity, created_at, updated_at)
SELECT 
    p.uuid,
    'default-warehouse-' || p.tenant_id,
    p.tenant_id,
    COALESCE(p.stock, 0), -- Handle nulls safely if any
    NOW(),
    NOW()
FROM products p
WHERE 
    -- Only migrate if the product has stock (or even if 0 to initialize record)
    -- And if it hasn't been migrated yet (check existence in inventory_stocks)
    NOT EXISTS (
        SELECT 1 FROM inventory_stocks s 
        WHERE s.product_uuid = p.uuid 
          AND s.warehouse_uuid = 'default-warehouse-' || p.tenant_id
    );

-- 7. CLEANUP (Destructive but Safe due to Copy above)
-- We check if the column exists before dropping to avoid errors on re-runs
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'products' AND column_name = 'stock') THEN
        ALTER TABLE products DROP COLUMN stock;
    END IF;
END $$;

COMMIT;
