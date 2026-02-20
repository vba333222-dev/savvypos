# SAVVY POS: MASTER BLUEPRINT (Revised – January 2026)

## 1. VISION & STRATEGY: "BIG VISION, PRAGMATIC EXECUTION"

**Project Name:** Savvy POS
**Subtitle:** Agnostic Offline-First mPOS System (Retail, F&B, Hospitality, Entertainment, Property, Services)

**Core Philosophy**
We are building a massive, industry-agnostic platform. However, to survive and win, we must execute pragmatically.
-   **Big Vision:** A single codebase that powers a coffee shop, a hotel, a cinema, and a mall management office.
-   **Pragmatic Execution:** We start with a **Modular Monolith** for speed. We perfect the **Retail & F&B** core first. We treat everything else as "Vertical Extensions" to be activated later.

**Key Principles**
1.  **Offline-First & Local-First:** The internet is a feature, not a requirement.
2.  **Single Source of Truth:** `token.json` dictates the UI. No hardcoded styles.
3.  **Monolith First:** We split into microservices only when we break the monolith (Scale > Complexity).
4.  **Strict Data Isolation:** Multi-tenant by default.

---

## 2. CORE ARCHITECTURE

**Pattern:** Clean Architecture + Modular Monolith
**Layers:**
-   **Domain:** Pure business logic (Dart/Go).
-   **Application:** Use Cases / Orchestration.
-   **Infrastructure:** Implementations (native wrappers, specific DB drivers).
-   **Presentation/API:** Flutter UI (Mobile) / REST/gRPC (Backend).

### A. Frontend (Flutter – Mobile/Tablet)
-   **State:** `flutter_bloc` + `freezed` (Strict State Machines).
-   **Local DB:** `Drift` (SQLite) – The "Source of Truth" for the offline device.
-   **Design System:** "Antigravity UI" powered by `flutter_animate` and strict `token.json` bindings.
-   **Sync:** Delta-based synchronization engine.

### B. Backend (Modular Monolith)
**Architecture:** Modular Monolith in Go (Golang).
Instead of managing 20 microservices and K8s complexity on Day 1, we build **Modules** inside a single Go binary.
-   **Stack:** Go + PostgreSQL + Docker Compose (Local) / Cloud Run (Prod).
-   **Modules (Contexts):**
    -   `core` (Auth, Tenant Config)
    -   `catalog` (Products, Prices)
    -   `sales` (Orders, Carts)
    -   `inventory` (Stock Ledger)
    -   *Future:* `hospitality`, `booking`, `billing`.
-   **Communication:** In-memory function calls between modules initially. Can be refactored to gRPC if split later.

---

## 3. UI/UX AUTHORITY (STRICT)

**The Rule:** Code must **never** contain hardcoded colors, spacing, or animation durations.
**Source of Truth:** `token.json` (and its generated Dart counterpart `theme_config.dart`).

1.  **Colors:** Referenced via `context.savvy.colors.*` (e.g., `brandPrimary`, `textMuted`).
2.  **Typography:** Defined in tokens, mapped to `TextTheme`.
3.  **Spacing:** `context.savvy.shapes.spacingMd` (no `SizedBox(height: 16)`).
4.  **Motion:** `context.savvy.motion.durationFast` (no `Duration(milliseconds: 200)`).

**Antigravity UX:**
-   Physics-based animations.
-   Fluid transitions (no abrupt screen changes).
-   Haptic feedback on all interactions.
-   Skeleton loaders over spinners.

---

## 4. FEATURE SCOPE (PHASED)

### Phase 1: The Core (Retail & F&B)
*Immediate Execution Focus*
1.  **Universal Catalog:** Products, Variants, Modifiers, Bundles.
2.  **Sales Engine:** Cart, Discounts, Tax, Multi-tender Payment.
3.  **Inventory:** Multi-warehouse, Transfer, Adjustment, Stock Opname.
4.  **Hardware:** Printer & Scanner (HAL).
5.  **Offline Sync:** Robust delta-sync queue.

### Phase 2: Vertical Extensions (Future Modules)
*Architectural "Hook Points" must exist now, but implementation is deferred.*
1.  **Hospitality:** Room Folio, Night Audit, Housekeeping.
2.  **Entertainment:** Seat Maps, Showtime Scheduling.
3.  **Property:** Recurring Billing, Meter Reading.
4.  **Services:** Resource Scheduling (Barbers, Spas).

*Implementation Note:* These modules will tap into the Core `Product` entity via Polymorphism (e.g., a `Room` is a `Product` with `time_based_availability = true`).

---

## 5. HARDWARE ABSTRACTION LAYER (HAL)

**Goal:** Write UI once, run on any hardware (Sunmi, iMin, Generic Android, iOS).

-   **Interface:** `IPrinterService`, `IScannerService`.
-   **Implementation:**
    -   `SunmiPrinterService` (Native SDK)
    -   `BluetoothPrinterService` (ESC/POS Generic)
    -   `MockPrinterService` (Dev/Test)

---

## 6. ROADMAP: "MONOLITH FIRST"

### Quarter 1: Foundation & Core
-   [x] Project Setup, DI, Architecture.
-   [x] Database Schema (Drift).
-   [x] HAL Skeleton.
-   [ ] **Design System:** Implement `token.json` parser and Theme Extensions.
-   [ ] **Catalog Module:** Product list, search, details (Flutter + Go).
-   [ ] **Sales Module:** Cart logic, checkout flow.

### Quarter 2: Sync & Backend Alpha
-   [ ] **Backend:** Go Modular Monolith setup (Echo/Fiber + GORM/Sqlc).
-   [ ] **Auth:** Tenant isolation, JWT.
-   [ ] **Sync Engine:** Implement "Delta Sync" logic (Client Queue -> Backend).
-   [ ] **Inventory:** Stock ledger implementation.

### Quarter 3: hardening & Expansion
-   [ ] **Hardware:** Deep integration with specific vendor SDKs.
-   [ ] **Analytics:** Dashboard basics.
-   [ ] **Vertical Alpha:** Interactive Table / Seat Map POC.

---

## 7. DEVELOPER GUIDELINES

1.  **Think Offline:** Always assume `network = false`. Write to DB first, then sync.
2.  **Think Module:** Don't import `inventory` code into `sales`. Use defined interfaces/use-cases.
3.  **Respect the Token:** If the color isn't in `token.json`, you can't use it.