# SolarShare — Complete Q&A for Judges & Evaluators

> **Prepared for:** Ideathon 2026 — Energy & Sustainability Track
> **Purpose:** Every possible question, deeply researched answers, problems & solutions

---

## Section 1: Concept & Problem

### Q1. What exactly is SolarShare?

SolarShare is a **peer-to-peer (P2P) solar energy trading app** for housing societies. It lets rooftop solar owners (prosumers) sell their surplus electricity directly to non-solar neighbors at rates better than what the DISCOM offers — while giving buyers cheaper electricity than the retail tariff.

We don't build any hardware or grid infrastructure. We are a **software app layer** (called a BAP — Beckn Application Provider) that plugs into the government's own India Energy Stack.

---

### Q2. What problem are you solving?

**Three connected problems:**

1. **Prosumers are underpaid.** Right now, if you have rooftop solar and generate surplus, your only option is to sell it back to the DISCOM at a low feed-in tariff. In FY 2024–25, over 12 lakh households earned Rs.421 crore this way — but at rates well below what a direct buyer would pay.

2. **Non-solar neighbors overpay.** Even when a neighbor is exporting unused solar at the same moment, on the same local grid line, the non-solar household pays the full DISCOM retail tariff.

3. **The DISCOM acts as an unnecessary middleman.** It buys cheap from the prosumer and sells expensive to the neighbor. Both sides lose. SolarShare cuts the middleman and gives both sides a better deal.

---

### Q3. Is this problem real or just theoretical?

**Completely real, and provable with government data:**

| Fact | Number | Source |
|---|---|---|
| Households with rooftop solar | 50.06 lakh (July 2026) | MNRE / PM Surya Ghar |
| Revenue earned from selling surplus | Rs.421 crore in FY 2024–25 | Ministry of Power, Parliament reply |
| Installation rate | 3 lakh+ per month | MNRE |
| Smart meters installed | 7.24 crore | RDSS Dashboard |
| Subsidies disbursed | Rs.28,000+ crore | MNRE |

These are not projections. These are households **already earning money by selling solar surplus** — they're just earning less than they should.

---

### Q4. Why can't people already trade energy with each other?

Until February 2026, there was **no legal mechanism** for P2P energy trading in India. You could only sell to the DISCOM via net metering.

In February 2026, the government changed this:
- The **India Energy Stack (IES)** was launched and demonstrated to the Prime Minister
- **DERC** (Delhi) and **UPERC** (Uttar Pradesh) approved a 6-month P2P trading pilot
- The pilot explicitly requires **third-party consumer apps (BAPs)** to reach households

SolarShare is designed to be one of those apps.

---

### Q5. Why housing societies specifically? Why not individual homes?

**Three strategic reasons:**

1. **Trust.** In a society, you know your neighbors. The RWA (Resident Welfare Association) is a trusted authority who can vouch for the platform's legitimacy. Cold-calling random individuals is much harder.

2. **Bulk onboarding.** One RWA coordinator can onboard 50–200 households in a single push. Individual marketing is expensive and slow.

3. **Grid proximity.** Homes in the same society share the same local distribution transformer and grid line. This means minimal transmission losses and maximum efficiency for P2P trades.

---

## Section 2: Technical Architecture

### Q6. What is the India Energy Stack (IES)?

The IES is a **Digital Public Infrastructure (DPI)** initiative led by the Ministry of Power, with REC Limited as the nodal agency. Think of it like:

- **UPI** revolutionized payments by creating an open standard that any app can plug into
- **ONDC** is doing the same for e-commerce
- **IES** does the same for energy — any app can discover, trade, and settle energy using open standards

The IES was demonstrated live to the Prime Minister on **16 February 2026** and is currently piloting in Delhi and Western Uttar Pradesh.

---

### Q7. What is the Beckn Protocol and why does it matter?

The Beckn Protocol is an **open-source, India-made communication standard** that lets different platforms talk to each other without a central intermediary. It's the same protocol family behind ONDC.

In energy, it works through the **Unified Energy Interface (UEI):**

| Component | Role |
|---|---|
| **BAP** (Beckn Application Provider) | The buyer-side app — this is SolarShare |
| **BPP** (Beckn Provider Platform) | The seller/supply-side system (DISCOM, meter systems) |
| **Beckn Gateway** | Routes discovery requests between BAPs and BPPs |

**The API flow is:**
```
/search     -> BAP asks: "Any surplus solar available nearby?"
/on_search  -> BPP responds with available listings
/select     -> Buyer picks a listing
/on_select  -> BPP confirms details and pricing
/init       -> BAP initializes the trade
/on_init    -> BPP prepares draft order and payment
/confirm    -> BAP confirms the trade
/on_confirm -> BPP finalizes, logs, and settles
```

This is **asynchronous and callback-based** — each request gets an immediate ACK, and the actual data comes back via a callback. This handles real-world delays gracefully.

---

### Q8. How does data flow from the solar panel to the app?

**Step-by-step data flow:**

```
Solar Panel
    | generates DC electricity
Inverter
    | converts to AC
Smart Meter (bidirectional, IS 16444 compliant)
    | records import/export in separate registers
    | communicates via DLMS/COSEM protocol
    | uses RF Mesh / Cellular (4G/NB-IoT) / PLC
Head-End System (HES)
    | aggregates raw data from thousands of meters
    | managed by AMISP (Advanced Metering Infrastructure Service Provider)
Meter Data Management (MDM)
    | validates, cleans, makes data billing-ready
UEI / Beckn Layer
    | exposes verified data via standardized APIs
SolarShare App (BAP)
    | displays available surplus to buyers
    | matches trades, logs on ledger
```

**Key point:** SolarShare never reads meters directly. We consume **verified data** via the AMISP/Head-End System, exposed through the UEI layer.

---

### Q9. What is DLMS/COSEM?

**DLMS** (Device Language Message Specification) and **COSEM** (Companion Specification for Energy Metering) together form the **international standard protocol** for smart meter communication.

- Every data point in the meter is stored as a **COSEM object** identified by a unique **OBIS code**
- This ensures data is structured the same way regardless of the meter manufacturer
- India mandates this through **IS 15959** for all smart meters
- Meters must be **Class 1.0** (single-phase residential) or **Class 0.5S** (three-phase) per CEA Smart Meter Regulations 2023

**For our hackathon MVP, we simulate this data.** We generate realistic meter readings (kWh import/export values at 15-minute intervals) as JSON data that mimics what the real HES would provide.

---

### Q10. What tech stack are you using and why?

| Layer | Choice | Why |
|---|---|---|
| **Frontend** | React Native or Flutter | Cross-platform (Android + iOS) from single codebase, fast prototyping |
| **Chat interface** | WhatsApp Business API | Mirrors the real IES pilot's UX pattern — no app download friction |
| **Backend** | Node.js (Express) or Python (FastAPI) | Fast iteration, huge library ecosystem, student-friendly |
| **Database** | PostgreSQL or Firebase/Supabase | Relational integrity for trades and ledger; Firebase for zero-cost prototyping |
| **Trust layer** | SHA-256 hash chain (MVP) then Hyperledger Fabric (pilot) | Start simple, add real blockchain when trade volume justifies complexity |
| **Hosting** | Firebase / Vercel / AWS Free Tier | Rs.0 at MVP scale |
| **Matching** | Rule-based (MVP) then ML-based forecasting (Phase 2) | Start simple, add intelligence once real data exists |

---

### Q11. What are your three core screens?

**Screen 1 — List Surplus (Prosumer)**
- Enter available kWh and asking price per kWh
- See DISCOM feed-in tariff and retail tariff for context
- Set availability window (e.g., 10am-4pm on sunny days)
- One-tap listing

**Screen 2 — Marketplace (Buyer)**
- Browse available listings from your housing society
- See price per kWh, quantity, seller rating
- Compare against DISCOM retail tariff (savings shown)
- One-tap purchase

**Screen 3 — Trade Ledger (Both)**
- Every completed trade shows: parties, amount (kWh), price, timestamp
- Each record has a unique SHA-256 hash
- Each hash includes the previous record's hash (tamper-evident chain)
- Status: Listed -> Matched -> Settled

---

## Section 3: Blockchain & Security

### Q12. What role does blockchain play in SolarShare?

Blockchain serves as the **trust and verification layer** — it ensures that no one (not even us) can go back and change trade records after they've been logged.

**Why trust matters here:** When real money and real energy are being traded between neighbors, both sides need to trust that:
- The trade was recorded correctly
- No one can edit it after the fact
- The DISCOM can verify the trade for billing adjustments

**Our approach is phased:**

| Phase | Trust Mechanism | Why |
|---|---|---|
| **MVP (Hackathon)** | SHA-256 hash chain | Simple, zero-cost, proves the concept |
| **Pilot (Phase 1-2)** | Permissioned blockchain (Hyperledger Fabric) | Real trades need decentralized verification |
| **Scale (Phase 3+)** | Full Hyperledger network with multiple org nodes | Multi-society, multi-DISCOM, regulatory audit trail |

---

### Q13. How does the SHA-256 hash chain work? (MVP)

**Step by step:**

```
Trade #1:
  Data: {seller: "A-302", buyer: "D-201", kWh: 8.2, price: 5.10, time: "2026-08-21T10:30:00"}
  Previous Hash: "0000000000" (genesis - first record)
  Combined: Data + Previous Hash
  SHA-256 Hash: "a7f2c9e81b3d..."

Trade #2:
  Data: {seller: "B-105", buyer: "C-401", kWh: 5.0, price: 4.90, time: "2026-08-21T11:15:00"}
  Previous Hash: "a7f2c9e81b3d..." (from Trade #1)
  Combined: Data + Previous Hash
  SHA-256 Hash: "3e8b1f42d6a9..."

Trade #3:
  Data: {seller: "A-302", buyer: "E-501", kWh: 3.1, price: 5.20, time: "2026-08-21T12:00:00"}
  Previous Hash: "3e8b1f42d6a9..." (from Trade #2)
  Combined: Data + Previous Hash
  SHA-256 Hash: "c4d7a2f8e105..."
```

**Why this is tamper-evident:**
- If someone tries to change Trade #1 (e.g., changing 8.2 kWh to 15 kWh), its hash changes completely (avalanche effect)
- But Trade #2 still stores the OLD hash of Trade #1
- The chain is now broken — anyone can see the tampering
- This works because SHA-256 is a one-way function — you cannot reverse it or find two different inputs that produce the same hash

**In code (Node.js):**
```javascript
const crypto = require('crypto');

function hashTrade(tradeData, previousHash) {
  const combined = JSON.stringify(tradeData) + previousHash;
  return crypto.createHash('sha256').update(combined).digest('hex');
}
```

---

### Q14. Why not use a public blockchain like Ethereum?

**Three reasons:**

1. **Cost.** Public blockchains charge gas fees per transaction. For small energy trades (a few kWh at Rs.5/kWh), the gas fee could exceed the trade value itself.

2. **Privacy.** Public blockchains are transparent — everyone can see every transaction. Energy consumption data is personal data protected under India's DPDP Act, 2023. We cannot expose it publicly.

3. **Speed.** Ethereum processes ~15 transactions per second. A housing society with 200 units trading during peak solar hours needs much faster throughput.

**Hyperledger Fabric solves all three:**
- No gas fees (permissioned network, no mining)
- Private data collections restrict sensitive data to relevant parties only
- 3,000+ transactions per second

---

### Q15. How does Hyperledger Fabric work for energy trading?

**Hyperledger Fabric** is a **permissioned blockchain** — only verified, authorized participants can join the network. This is perfect for energy trading because all users are verified DISCOM customers.

**Architecture:**

```
Organizations (Nodes):
  +-- SolarShare Org    -> runs our backend, submits trades
  +-- DISCOM Org        -> verifies meter data, approves settlements
  +-- RWA Org           -> community governance, dispute resolution
  +-- Regulator Org     -> audit access, compliance monitoring

Channel: "energy-trading"
  +-- Smart Contract (Chaincode):
      +-- listSurplus(sellerId, kWh, pricePerKWh)
      +-- createTrade(buyerId, listingId, kWh)
      +-- verifyMeterData(tradeId, meterReading)
      +-- settleTrade(tradeId, paymentConfirmation)
      +-- queryTradeHistory(userId)
```

**Key concepts:**
- **Chaincode** = the smart contract (business logic that runs automatically)
- **Channel** = a private communication pathway — only members of the channel can see its data
- **Private Data Collections** = even within a channel, some data (like exact prices) can be restricted to only the trading parties
- **Endorsement Policy** = e.g., "a trade is valid only when endorsed by both SolarShare AND the DISCOM"

**Development tools:**
- Write chaincode in Node.js, Go, or Java
- Test with IBM Blockchain Platform Extension for VS Code
- Benchmark performance with Hyperledger Caliper

---

### Q16. How do you ensure data privacy?

| Layer | Protection |
|---|---|
| **Identity** | Every user verified as genuine DISCOM customer with valid metering credentials |
| **Data** | Consumption/generation data handled per DPDP Act, 2023 |
| **Transaction** | SHA-256 hashing makes tampering detectable |
| **Blockchain** | Hyperledger private data collections restrict sensitive data |
| **Payment** | No direct peer-to-peer cash — all settlement via RBI-compliant escrow |
| **Communication** | HTTPS/TLS for all API calls |

---

### Q17. What if someone fakes their meter data?

**This cannot happen in the production system** because:

1. SolarShare **never reads meters directly.** We consume verified data from the DISCOM's own AMISP/Head-End System.
2. The AMISP is contractually bound by SLAs to provide accurate data.
3. Smart meters are sealed, tamper-proof devices compliant with IS 16444 and CEA Regulations 2023.
4. Every meter has a unique digital identity in the IES framework.
5. The DISCOM can cross-verify any trade against their own meter records.

**For the hackathon MVP**, we use simulated data — this is clearly labeled as simulated and not presented as real.

---

## Section 4: Regulatory & Compliance

### Q18. Is P2P energy trading legal in India?

**Yes, but only in pilot zones as of August 2026.**

In February 2026, DERC and UPERC approved a **6-month P2P trading pilot** under the IES framework:

| Detail | Value |
|---|---|
| Approved by | DERC (Delhi) + UPERC (Uttar Pradesh) |
| Duration | 6 months from February 2026 |
| DISCOMs covered | BSES Rajdhani (BRPL), Tata Power Delhi (TPDDL), PVVNL (Western UP) |
| Consumers covered | ~1.25 crore across the three DISCOMs |
| Transaction fee | Rs.0.42 per kWh (split equally: Rs.0.21 buyer + Rs.0.21 seller) |
| Wheeling charges | **Waived** within Delhi by DERC |
| CUF cap | **Removed** — prosumers can trade entire surplus |
| Under-injection penalty | **Waived** for pilot duration |

---

### Q19. What happens if the pilot doesn't get extended?

This is a real risk, but:
1. The pilot was **explicitly designed** to be reviewed after 6 months to inform a national rollout decision
2. The government has invested heavily in the IES infrastructure — PM demonstration, Beckn Protocol, smart meters — it would be unusual to abandon this investment
3. Even if the pilot is delayed, SolarShare's Phase 1 (manual-bridge model) can continue operating independently
4. Multiple states (Maharashtra, Gujarat, Karnataka) have shown interest in similar pilots

---

### Q20. How does pricing work?

**The price is NOT fixed by the regulator.** It is discovered through **mutual agreement** between buyer and seller on the platform.

However, SolarShare provides **intelligent price suggestions:**

```
DISCOM Feed-in Tariff:      Rs.4.10/kWh (what DISCOM pays the prosumer)
SolarShare Suggested Range:  Rs.4.90 - Rs.5.30/kWh
DISCOM Retail Tariff:        Rs.6.00/kWh (what buyer normally pays)
```

**Result:**
- **Seller gets Rs.4.90-5.30** instead of Rs.4.10 -> **+20-30% more**
- **Buyer pays Rs.4.90-5.30** instead of Rs.6.00 -> **10-15% savings**
- **Transaction fee:** Rs.0.42/kWh split equally (Rs.0.21 each)
- **Both sides win.** The DISCOM's cut is removed.

---

### Q21. What about the DPDP Act?

The Digital Personal Data Protection Act, 2023 applies because we handle energy consumption data, which is personal data. Our compliance approach:

1. **Consent:** Users explicitly consent to data collection during onboarding
2. **Purpose limitation:** Data used only for energy trading, not sold or shared
3. **Data minimization:** We only access aggregate surplus/consumption, not granular appliance-level data
4. **Right to erasure:** Users can request deletion of their data
5. **Data localization:** All data stored on Indian servers

---

## Section 5: Business Model & Revenue

### Q22. How does SolarShare make money?

**Four revenue streams:**

| Stream | How It Works | When |
|---|---|---|
| **Transaction fee** | Commission on every P2P trade (reference: Rs.0.42/kWh) | Phase 1+ |
| **SaaS subscription** | Monthly fee to RWA admins for dashboard, analytics, billing integration | Phase 2+ |
| **Carbon credit monetization** | Track CO2 offsets per trade, sell green certificates to corporates for ESG compliance | Phase 3+ |
| **Data insights** | Anonymized, aggregated consumption pattern data sold to DISCOMs and policy makers | Phase 3+ |

---

### Q23. Is the transaction fee enough to sustain the business?

**Honestly, not alone at small scale.** A single trade of 5 kWh at Rs.0.42/kWh = Rs.2.10 per trade. That's very small.

**But at scale:**
- A society of 200 units with 50 active trading pairs, doing 2 trades/day = 100 trades/day
- 100 trades x 8 kWh average x Rs.0.42 = Rs.336/day per society
- 100 societies = Rs.33,600/day = ~Rs.10 lakh/month

**This is why we diversify:**
- SaaS to RWAs adds predictable recurring revenue
- Carbon credits add a high-margin layer
- Data insights are high-value, low-cost to produce

---

### Q24. What are your unit economics?

| Metric | Value |
|---|---|
| **Cost per trade** | Near-zero (cloud compute + API calls) |
| **Revenue per trade** | Rs.0.42 (or higher platform fee at scale) |
| **Hosting cost (MVP)** | Rs.0 (free tier) |
| **Hosting cost (100 societies)** | Rs.5,000-15,000/month |
| **Customer acquisition cost** | Very low (RWA bulk onboarding, not individual marketing) |
| **Breakeven** | Estimated at 5-10 active societies |

---

## Section 6: Market & Competition

### Q25. Who are your competitors?

| Competitor | What They Do | Our Advantage |
|---|---|---|
| **Pulse Energy / SUPEREV** | First authorized IES Trade Platform Provider | Their core base is EV charging users, not housing societies. Different segment. |
| **Power Ledger (Australia)** | Global P2P energy trading pioneer | Not India-focused at the residential level. Different geography. |
| **DISCOM net metering** | Default — every solar owner's current option | We offer better rates for both sides. The real "competitor" to beat on price. |

**The housing society segment is currently unaddressed by any platform.** This is our niche.

---

### Q26. What if Pulse Energy starts targeting housing societies too?

This is possible, but:
1. Pulse Energy's entire product is built around **EV charging** — their ML models, UX, and partnerships are optimized for that use case
2. Pivoting to a housing-society-first model requires different go-to-market (RWA relationships), different UX (family-oriented, not EV-owner-oriented), and different matching algorithms
3. **First-mover advantage in a niche matters.** Once we onboard the RWAs and build trust, switching costs for societies are high
4. The market is large enough for multiple players — the real competition is getting households off DISCOM net metering, not fighting other platforms

---

### Q27. What if DISCOMs resist P2P trading because they lose revenue?

DISCOMs do lose some margin on P2P trades. However:
1. The **government mandated** the DERC/UPERC pilot — DISCOMs don't have a choice in pilot zones
2. DISCOMs still earn the **wheeling charge** (currently waived in the pilot, but expected to be reintroduced post-pilot)
3. P2P trading **reduces grid stress** during peak solar hours, which saves DISCOMs money on transmission losses and capacity investments
4. The IES is explicitly designed to make DISCOMs part of the ecosystem, not cut them out — trades are reflected in their billing systems

---

## Section 7: Implementation & Feasibility

### Q28. How long does the hackathon MVP take to build?

**1 week for a team of 2-4 students.**

| Task | Time | Who |
|---|---|---|
| UI/UX design (3 screens) | 1-2 days | Designer/Frontend |
| Frontend development | 2-3 days | Frontend dev |
| Backend API + database | 2-3 days | Backend dev |
| SHA-256 hash chain | 0.5 day | Backend dev |
| Simulated meter data | 0.5 day | Anyone |
| Integration + testing | 1 day | Full team |
| Demo preparation | 0.5 day | Full team |

---

### Q29. What do you simulate vs. what is real in the MVP?

| Component | MVP Status | Why |
|---|---|---|
| User interface (3 screens) | **Real** | Fully functional |
| Listing, matching, buying | **Real** | Core trade logic works |
| SHA-256 tamper-evident ledger | **Real** | Actual hashing, actual chain |
| Trade history dashboard | **Real** | Shows real logged data |
| Smart meter data | **Simulated** | AMISP integration needs real DISCOM partnership |
| Payment settlement | **Mocked** | Escrow integration needs RBI-compliant gateway |
| Beckn/UEI registration | **Not implemented** | BAP registration process is post-hackathon |
| WhatsApp notifications | **Optional** | Can be added with WhatsApp Business API sandbox |

---

### Q30. What is your total cost?

| Phase | Cost |
|---|---|
| **Phase 0 (Hackathon)** | Rs.0 (student team, free-tier hosting) |
| **Phase 1 (Pilot)** | Rs.0-2 lakh (partial outsourcing, WhatsApp API, compliance basics) |
| **Phase 2 (Integration)** | Primarily time cost (BAP registration, AMISP integration) |
| **Phase 3 (Scale)** | Self-funding from transaction revenue |

---

## Section 8: Tough / Challenging Questions

### Q31. What happens when there's no sun? Do buyers lose power?

**No, never.** SolarShare is a **value-add layer on top of the existing grid.** If no local solar surplus is available:
- The buyer automatically falls back to standard grid supply
- No manual intervention needed
- The buyer's power is never interrupted
- SolarShare simply shows "No local surplus available — you're on standard grid"

---

### Q32. What about battery storage?

Battery storage is **explicitly out of scope for v1.** Here's why:

1. We want to stay **asset-light** — no hardware, no installation costs
2. The existing DISCOM grid line acts as the natural buffer: surplus goes to the grid, deficit comes from the grid
3. Battery costs are still high (Rs.5-8 lakh per household unit)
4. Adding batteries introduces complexity (state of charge management, degradation, safety regulations)

**Phase 4** explores Virtual Power Plant (VPP) partnerships for users who independently adopt batteries.

---

### Q33. How do you handle disputes between buyer and seller?

| Scenario | Resolution |
|---|---|
| Seller claims they exported 10 kWh but meter shows 8 kWh | DISCOM's verified meter data (HES) is the ground truth. Platform uses meter data, not seller claims. |
| Buyer says energy quality was poor | P2P trades use the same physical grid — energy quality is identical to DISCOM supply. Not a valid dispute. |
| Payment not received | Escrow-based settlement — buyer's payment is held in escrow before trade is executed. No payment = no trade. |
| Trade recorded incorrectly | SHA-256 hash chain makes tampering detectable. Both parties + DISCOM can verify. |

---

### Q34. What if only a few people in a society adopt SolarShare?

This is the **classic chicken-and-egg problem** in marketplaces. Our solution:

1. **RWA-led onboarding:** The society admin drives adoption as a community initiative, not individual marketing
2. **Immediate value:** Even with 5 prosumers and 10 buyers, trades can begin — you don't need 100% adoption
3. **Social proof:** Once the first few families save money, word spreads organically within the society
4. **WhatsApp groups:** Societies already have active WhatsApp groups — natural viral distribution channel

---

### Q35. How is this different from just using net metering better?

| Feature | Net Metering | SolarShare |
|---|---|---|
| Who you sell to | Only the DISCOM | Any neighbor in your society |
| Price you get | Low feed-in tariff (DISCOM decides) | Market-discovered price (you decide) |
| Buyer choice | None — DISCOM is the only supplier | Multiple prosumers to choose from |
| Transparency | DISCOM handles everything behind the scenes | Every trade hashed, timestamped, visible |
| Community benefit | None — it's individual | Whole society saves money and goes greener |

---

### Q36. What's your unfair advantage?

1. **Timing.** We're entering during a narrow regulatory pilot window — not after it becomes a crowded national rollout
2. **Niche.** Housing societies are unaddressed. The only existing TPP (Pulse Energy) targets a completely different segment (EV charging)
3. **Trust model.** RWA-first onboarding solves the trust/adoption problem that kills most marketplace startups
4. **Documentation.** We have 7 detailed documents (PRD, TRD, backend schema, UI/UX brief, app flow, implementation plan, market analysis) — more rigorous than most seed-stage startups

---

### Q37. Can you actually register as a BAP?

Yes. The Beckn Protocol is open-source. BAP registration is handled through **REC Limited's onboarding pathway.** The process is:

1. Apply to REC Limited (nodal agency for IES)
2. Demonstrate technical compliance with Beckn specifications
3. Pass security and interoperability testing
4. Receive BAP authorization to operate on the UEI network

This process is new and evolving as of 2026 — we plan for schedule flexibility here. Phase 2 (Month 3-6) is dedicated to this.

---

### Q38. What if the government shuts down the IES?

Extremely unlikely because:
1. The PM personally witnessed the IES demonstration
2. Rs.28,000+ crore in subsidies already disbursed for rooftop solar
3. 7.24 crore smart meters already installed (massive sunk investment)
4. The Beckn Protocol powers ONDC, UHI (health), and DSEP (education) — it's not going away
5. India's 150 GW+ solar capacity needs better monetization mechanisms — the problem only grows

---

### Q39. What's your exit strategy?

Multiple options:
1. **Acquisition** by a DISCOM, energy company, or fintech wanting to enter energy trading
2. **Acquisition** by Pulse Energy or another TPP wanting to expand into housing societies
3. **Revenue-generating SaaS** — sustainable independent business at scale
4. **IPO** — if the P2P energy market reaches the projected $10.4 billion by 2034

But honestly, as students at a hackathon, our immediate goal is **validation** — proving the model works in one society before thinking about exits.

---

### Q40. What would you do with Rs.50 lakh in funding?

| Allocation | Amount | Purpose |
|---|---|---|
| Engineering team (3-4 devs) | Rs.20 lakh | 6-month runway for full-time development |
| DISCOM partnership & compliance | Rs.10 lakh | Legal, BAP registration, AMISP integration |
| Community onboarding | Rs.8 lakh | RWA partnerships, WhatsApp campaigns, on-ground activation |
| Cloud infrastructure | Rs.5 lakh | Production-grade hosting, security, monitoring |
| Working capital | Rs.7 lakh | Buffer for unexpected costs |

---

### Q41. Why should we pick your team?

1. **We understand the domain deeply.** We've researched IES, Beckn, DERC pilot, DLMS/COSEM, CEA regulations — not just surface-level buzzwords.
2. **We've already done the work.** 7 detailed documents (PRD, TRD, Backend Schema, UI/UX Brief, App Flow, Implementation Plan, Market Analysis) — this isn't a weekend idea.
3. **Our approach is realistic.** We're not claiming to disrupt DISCOMs on day 1. We're building one society at a time, starting in pilot-approved zones only.
4. **The timing is perfect.** The IES pilot is live RIGHT NOW. Building during the pilot gives us a first-mover advantage that won't exist once 50 apps enter the market.

---

> **Remember:** The strongest answer to any challenge question is always:
> *"The government has already validated this. IES is live. The pilot is running. We're just building the app that reaches households — which is exactly what the pilot is designed to onboard."*
