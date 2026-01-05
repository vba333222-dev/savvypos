# SAVVY POS: MASTER BLUEPRINT (Revised & Consolidated – January 2026)

## 1. VISION & OBJECTIVE

**Project Name:** Savvy POS 
**Subtitle:** Agnostic Offline-First mPOS System for Retail, F&B, Hospitality, Entertainment, Property, and Service Industries

**Core Objective**  
Build a scalable, offline-first mobile Point of Sale (mPOS) system that is industry-agnostic. The system must support thousands of outlets in a single global multi-tenant entity, with unified operational support for:
- Retail (physical goods)
- F&B (table/order management)
- Hospitality (room folio, night audit, housekeeping)
- Entertainment (seating maps, showtime scheduling)
- Property/Real Estate (lease tracking, utility billing)
- Services (booking, resource allocation)

All within a single, maintainable codebase.

**Key Principles**
- **Offline-First**: Core transactions (catalog, cart, checkout, inventory) function fully without internet.
- **Hardware Agnostic**: Plug-and-play peripherals via Hardware Abstraction Layer (HAL).
- **Multi-Tenant & Secure**: Strict data isolation per tenant with end-to-end encryption.
- **Enterprise Scalability**: >10,000 TPS, multi-warehouse, multi-currency, multi-tax, full organizational hierarchy.
- **Extensibility**: Clear separation between core features and vertical-specific add-ons.

**Organizational Hierarchy**  
Holding/HQ → Legal Entity → Brand → Region → Outlet → Warehouse/Cost Center (full cost center accounting support).

## 2. CORE ARCHITECTURE

**Pattern:** Strict Clean Architecture (Domain-Driven Design)  
- **Domain Layer**: Pure entities, value objects, and use cases (no external dependencies).  
- **Data Layer**: Repositories, DTOs, local (Drift/SQLite) and remote data sources.  
- **Presentation Layer**: BLoC for state management, widgets, UI logic.

**Offline-First Philosophy**  
All core operations execute locally in Drift DB. Transactions are queued for synchronization when connectivity returns. Delta-based sync minimizes bandwidth usage.

## 3. TECHNOLOGY STACK

### Frontend (Flutter – Mobile/Tablet)
- **Core Framework:** Flutter (Latest Stable) using Dart 3.x
- **Architecture:** Clean Architecture + BLoC + Isolates (for heavy computation)
- **Local Database:** Drift (SQLite) with synchronous write guarantee.
- **Antigravity UX Engine:**
  - `flutter_animate`: For micro-interactions (bouncy buttons, cascades).
  - `wolt_modal_sheet`: For physics-based, draggable bottom sheets (Google Stitch feel).
  - `sliver_tools`: For high-performance scrolling lists (60/120fps).
- **Networking:** Dio (REST) + Retrofit + Workmanager (Background Sync).
- **Monetization:** RevenueCat (Subscriptions) + Google Mobile Ads (AdMob).
- **Security:** flutter_secure_storage (KeyStore/Keychain) + SSL Pinning.

### Backend (Microservices)
- Language: Go (Golang) – chosen for performance and concurrency
- Databases:
 - PostgreSQL (Primary transactional, utilizing JSONB for flexible/unstructured metadata, replacing the need for NoSQL)
 - Redis (Caching, rate limiting, session store, idempotency keys)
- API Gateway: Kong (rate limiting, auth, routing)
- Infrastructure: Docker + Kubernetes (AWS/GCP multi-region, auto-scaling)

### Key Data Schema Highlights (PostgreSQL)
- Products: UUID, tenant_id, type (PHYSICAL/SERVICE/DIGITAL), SKU, base_price, metadata (JSONB), track_stock flag, localized names (JSONB)
- Inventory: product_id, warehouse_id, quantity, min_stock_level, batch/expiry/serial (JSONB)
- Inventory Valuation: Strict FIFO (enforced server-side)
- Orders: Mixed-cart support (retail + service + F&B items)
- Resources/Spaces: Rooms, seats, units, vehicles – with time-block availability
- Local Drift Mirror: Product, Order, Booking, Inventory, TenantConfig (with isSynced, updatedAt, conflict flags)

## 4. SYNC, OFFLINE STRATEGY & DATA INTEGRITY

**Core Philosophy: Delta-Based Synchronization (Ledger Model)**
To prevent race conditions (e.g., two offline devices selling the last item), we avoid "Last-Write-Wins" for quantitative data.

1.  **Inventory Strategy (The "Delta" Rule):**
    -   Clients do NOT send absolute stock values (e.g., `qty: 5`).
    -   Clients send **adjustments** (e.g., `change: -1`, `reason: SALE`, `ref: ORDER_UUID`).
    -   Server processes adjustments atomically. If Server has 10, and receives `-1` from Device A and `-2` from Device B, final stock is 7 (mathematically correct regardless of arrival order).

2.  **Queue & Idempotency:**
    -   **Local Queue:** All offline actions are stored in Drift with a `status: PENDING`.
    -   **Idempotency Key:** Every action generates a generic UUID v4. The Go backend stores this key in Redis (TTL 24h). If the client re-sends the same payload due to network timeout, the server detects the duplicate UUID and returns the previous success response without re-processing.

3.  **Conflict Resolution (Non-Inventory Data):**
    -   For qualitative data (e.g., Product Name, Customer Info): Server Timestamp Wins / Last-Write-Wins.
    -   Critical conflicts trigger a "Conflict Resolution UI" for the manager to decide manually.

4.  **Resilience:**
    -   **Background Sync:** Uses `workmanager` to push queues periodically even when the app is minimized.
    -   **Optimistic UI:** The UI updates immediately (Inventory count drops instantly visually) while the sync happens in the background.

## 5. MONETIZATION & ADS STRATEGY (Freemium Model)

**Objective:** Monetize free users via AdMob while protecting the "Checkout Flow" speed. Monetize power users via Subscriptions (RevenueCat).

### A. Subscription Tiers (Managed via RevenueCat)
1.  **Free Tier (Micro-SME):**
    -   Limit: 1 Outlet, Single User.
    -   Storage: Local Backup only (No Cloud Sync).
    -   Ads: **Enabled**.
2.  **Pro/Enterprise Tier:**
    -   Limit: Unlimited Outlets & Users.
    -   Storage: Real-time Cloud Sync & Web Dashboard access.
    -   Ads: **Disabled**.

### B. AdMob Implementation Guidelines (UX-Safe)
*Strict Rule: Ads must never interrupt a transaction or delay the cashier.*

1.  **Banner Ads:**
    -   **Allowed:** Dashboard (bottom anchor), Settings Menu, Report Summary.
    -   **Prohibited:** Cart Screen, Payment Screen, PIN Entry.
2.  **Native Ads:**
    -   Native Ads: Integrated into lists but clearly labeled with 'Ad' badge to comply with Google Policy, ensuring distinct visual separation from transaction items.
3.  **Interstitial Ads (Full Screen):**
    -   **Trigger:** Only triggered upon "Shift Close", "Logout", or "End of Day Report".
    -   **Logic:** Pre-loaded in background. If not ready, skip ad immediately. Never show before a sale.

### C. Feature Gating Logic
-   **Entitlement Check:** On app launch, `SubscriptionService` checks RevenueCat status.
-   **Locking:** If Pro expires, the app gracefully degrades to Free mode (enables Ads, disables Cloud Sync) but **never** deletes local data.


## 6. HARDWARE ABSTRACTION LAYER (HAL)

**Strategy: Mobile-First Interface (Android & iOS)**
Since the app runs on mobile devices with limited physical ports and strict OS sandboxing, we use a layered approach to connect with external hardware via Platform Channels (Kotlin/Swift).

1.  **Mobile Native Connectivity (Managed by Flutter):**
    -   **Printer:** -   *Primary:* Custom Platform Channels wrapping vendor SDKs (Sunmi/iMin/Epson) for reliability.
        -   *Fallback:* `blue_thermal_printer` package for generic Bluetooth ESC/POS devices.
    -   **Scanner:** -   *Camera:* `mobile_scanner` (uses MLKit via FFI/Channels) for high-speed barcode recognition.
        -   *Physical:* HID Mode (Keyboard injection) handled natively by Flutter `FocusNode`.
    -   **USB OTG (Android Only):** Direct communication via `usb_serial` package or Android USB Host API channels.

2.  **Peripheral Support Strategy:**
    -   **Printers:**
        -   *Wireless:* Direct Bluetooth (BLE for iOS, Classic for Android) & TCP/IP (WiFi).
        -   *Vendor SDKs:* Integrated native SDKs for Star, Epson, Sunmi, and iMin devices.
    -   **Payment Terminals:**
        -   *App-to-App (Android):* Intent-based switching to local banking apps (EDC Android).
        -   *Bluetooth mPOS:* Integration with wireless card readers (e.g., Stripe, Adyen) via BLE.
    -   **Scanners:**
        -   *Software:* Camera-based scanning using MLKit (Android) / Vision (iOS).
        -   *Hardware:* Bluetooth Scanners in HID Mode (Keyboard Emulation) supported natively by both OS.

2.  **Legacy Bridge (Network Proxy):**
    -   For legacy serial/parallel hardware, the Flutter app treats the device as a **Network Resource**. The Flutter app connects via WebSocket/HTTP to a simple bridge (e.g., a Windows PC running a proxy) to send print commands. No native daemons run on the mobile device itself.

**Improvement:** Publish `savvy_hal_interface` as a package to standardize the API across Android and iOS implementations.

## 7. CORE FEATURES (Mandatory for All Tenants)

### A. Unified Sales & Order Engine
- Mixed cart (goods + services + F&B)
- Fulfillment modes: Carry-out, Delivery, Pickup, Table service, Appointment
- Payment: Multi-tender, split payment, deposits, partial/layaway, dynamic pricing (season/volume-based)

### B. Inventory & Supply Chain
- Real-time multi-warehouse visibility
- Stock movements: Transfer, Adjustment, Scrap. *Note:* Complex calculations like BOM Explosion and Landed Cost are processed server-side (Go) to keep the mobile client lightweight.
- Stock Opname / Cycle Count: Session freeze, blind counting, variance approval workflow, auto-adjustment
- Automated Procurement: Reorder point → PO generation
- Batch/Expiry/Serial, Consignment, Landed Cost (freight, duties, insurance → COGS)

### C. Cash & Shift Management
- Float declaration, cash drops, blind/close reconciliation
- Shift reports and handover
- Manager Override: 
  - Online: Real-time remote approval.
  - Offline: Local PIN validation via securely stored bcrypt hashes (synced during login).

### D. Enterprise Governance
- Granular RBAC + immutable audit trail
- Tax Engine: Geo-aware (VAT/GST/PPN/service tax)
- Multi-currency, multi-language (full i18n)
- Sensitive Data Masking (PCI-DSS/GDPR compliance)

### E. Analytics & Reporting
- Real-time dashboards (sales, P&L, cash flow, staff commission, outlet KPIs)
- Decoupled OLAP backend for heavy queries

## 8. ADD-ON MODULES (Vertical-Specific – Feature-Flagged)

1. **F&B**  
   Table/floor plan management, KDS integration, BOM deduction on order.

2. **Service / Appointment**  
   Calendar, staff allocation, commission tracking, work order status.

3. **Hospitality**  
   Folio management (cross-outlet charging to room), Night Audit, Housekeeping status sync.

4. **Entertainment / Cinema**  
   Interactive seating maps, showtime scheduling, combo/bundle engine with simultaneous BOM deduction.

5. **Property & Real Estate**  
   Lease/contract lifecycle, recurring utility/service charge billing, CMMS for asset maintenance.

6. **Common Add-ons**  
   CRM/Loyalty (tiers, omnichannel points), HRIS Lite (geofence attendance, rostering), External integrations (marketplace, delivery platforms, ERP).

## 9. SECURITY & COMPLIANCE

- App Attestation: Firebase App Check / Google Play Integrity
- Authentication: OAuth2 + SSL Pinning
- Data at Rest/Transit: AES-256 + TLS 1.3
- Immutable Audit Logs (append-only)
- Rate limiting, bot protection, WAF via Kong
- Compliance: PCI-DSS, GDPR/PDPA, local fiscalization requirements

**Improvement Additions**:
- Regular third-party security audits and penetration testing schedule.
- Fraud detection rules engine (velocity checks, unusual patterns).

## 10. UI/UX GUIDELINES
- Color Theme: token.json
- Theme: warm mpos
- Layout: Responsive – mobile (stacked + bottom sheets) vs tablet (split-view + persistent cart)
- High-density, cashier-efficient design
- Light/Dark mode + high-contrast accessibility mode
- Full internationalization (product names, UI strings)
- WCAG 2.1 compliance (screen reader, adjustable fonts)
- Interactive onboarding and in-app training guides

**Visual Language:**
-   **Fluidity:** Lists don't just "appear"; they cascade in (`.animate().slideY().fadeIn()`).
-   **Feedback:** Every tap has a micro-scale animation (button shrinks 5%) and haptic feedback.
-   **Transitions:** Use `OpenContainer` or Shared Element Transitions for opening Product Details.

**Performance Budget:**
-   **Frame Time:** Strict < 8ms per frame.
-   **List Rendering:** Use `ListView.builder` with `itemExtent` fixed where possible.
-   **Images:** Aggressive caching with `cached_network_image`.

## 11. FOLDER STRUCTURE (Flutter)

```
lib/
├── bootstrap.dart          # App initialization (DI, monitoring, remote config)
├── main.dart
├── l10n/                   # Localization files
├── core/
│   ├── config/             # Theme, flavors, remote config
│   ├── network/            # Dio setup, interceptors
│   ├── database/           # Isar schemas & migrations
│   ├── hardware/           # HAL implementations
│   └── utils/
├── domain/                 # Entities, Value Objects, Use Cases
├── data/                   # Repositories, Data Sources, DTOs
├── features/               # Feature modules
│   ├── auth/
│   ├── pos/
│   ├── inventory/
│   ├── cash_management/
│   ├── bookings/
│   ├── tables/
│   ├── hospitality/
│   ├── entertainment/
│   └── settings/
└── shared/
    ├── widgets/
    └── components/
```

## 12. ROADMAP

1.  **Foundation:** Setup, Drift, RevenueCat Init, HAL Skeleton.
2.  **Core POS:** Catalog, Cart, Local Order (Free Tier).
3.  **Hardware & Ads:** Printer integration + AdMob wiring.
4.  **Sync & Cloud:** Auth, Go Backend, Delta Sync Logic (Pro Tier).
5.  **Refining:** "Antigravity" polish (Animations, Haptics).

### DevOps
- CI/CD: GitHub Actions / GitLab CI (lint → tests → build → staged rollout)
- Deployment: Blue-Green/Canary (backend), Shorebird OTA (frontend critical fixes)
- Testing:
  - Unit: 90%+ coverage on domain
  - Widget: 80%+
  - Integration/E2E: Patrol for hardware simulation
  - Golden tests for UI consistency
  - Property-based testing for critical domain logic

### Additional Improvements Recommended
1. **Testing Depth** – Add contract testing between frontend and backend APIs (Pact or similar).
2. **Performance** – Benchmark extreme scenarios (50k+ SKUs, 500+ offline transactions, 100-item carts) and implement virtualized lists + Isar query optimization.
3. **Resilience** – Global error handling with exponential backoff, circuit breakers, and offline queue health monitoring.
4. **Scalability** – Plan for database sharding/partitioning by tenant_id early; consider event-driven architecture (Kafka) for high-volume sync.
5. **Documentation** – Auto-generate OpenAPI specs from Go backend; comprehensive architecture decision records (ADRs).
6. **Migration Support** – Build import tools for legacy POS data (CSV, API pulls).
7. **Future-Proofing** – Design public Open API early for third-party extensions; consider PWA version for low-end devices.

This revised blueprint removes duplicates (e.g., repeated Sales Engine section), consolidates overlapping points, improves logical flow, and adds targeted improvements for robustness, maintainability, and long-term scalability.