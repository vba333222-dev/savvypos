-- =============================================
-- Enterprise Upgrade Migration
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
    product_uuid VARCHAR(255) NOT NULL, -- references products(uuid) - assuming generic loose FK for UUIDs or exact constraint if products.uuid is unique
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

-- 6. DATA MIGRATION
-- Create a default warehouse for existing stock
INSERT INTO warehouses (uuid, tenant_id, name, is_store_front, created_at, updated_at)
SELECT 
    'default-warehouse-' || tenant_id, -- Generate a predictable UUID or use generic GUID function
    tenant_id, 
    'Main Store', 
    TRUE,
    NOW(),
    NOW()
FROM (SELECT DISTINCT tenant_id FROM products WHERE tenant_id IS NOT NULL) AS tenants;

-- Migrate existing stock from products to inventory_stocks
-- We link it to the 'Main Store' created above
INSERT INTO inventory_stocks (product_uuid, warehouse_uuid, tenant_id, quantity, created_at, updated_at)
SELECT 
    p.uuid,
    'default-warehouse-' || p.tenant_id,
    p.tenant_id,
    p.stock,
    NOW(),
    NOW()
FROM products p
WHERE p.stock != 0;

-- 7. CLEANUP
-- Remove stock column from products
ALTER TABLE products DROP COLUMN stock;

COMMIT;
