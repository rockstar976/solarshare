# SolarShare — Complete Q&A Aligned to Pre-Ideathon Evaluation Criteria

> **Event:** Pre-Ideathon 2026 | **Date:** Aug 21, 2026
> **Format:** 4-5 min pitch + 3-5 min Q&A | **PPT:** 6-8 slides
> **Pathway:** Problem -> Solution -> Validation -> Implementation -> Market -> Revenue -> Growth

---

## SCORING OVERVIEW (100 Marks Total)

| # | Criterion | Marks | What Judges Want |
|---|---|---|---|
| 1 | Problem Understanding & Relevance | 10 | Is this a real, serious problem? Who faces it? |
| 2 | Innovation & Originality | 15 | Is the solution genuinely new? How is it different? |
| 3 | Feasibility & Technical Approach | 10 | Can this actually be built and deployed? |
| 4 | Social Impact | 10 | Does it make a difference to society? |
| 5 | Creativity & USP | 15 | What makes it uniquely compelling? |
| 6 | Revenue, Business Potential & Scalability | **25** | Can this become a sustainable business? |
| 7 | Presentation & Q&A | 15 | Can the team explain everything confidently? |

> **Note:** In case of tied scores, priority goes to: (i) Innovation & Originality, (ii) Revenue, Business and Implementation Potential

---

# CRITERION 1: PROBLEM UNDERSTANDING & RELEVANCE (10 Marks)

### Q1. What is the problem?

India's rooftop solar households generate surplus electricity but can only sell it back to the DISCOM (government electricity company) at a **low feed-in tariff**. Meanwhile, their non-solar neighbors in the same housing society pay the **full DISCOM retail tariff** — even when surplus solar energy is available next door, on the same grid line. The DISCOM acts as an unnecessary middleman, buying cheap and selling expensive.

---

### Q2. Who faces the problem?

**Two groups simultaneously:**

1. **Solar prosumers (50.06 lakh households as of July 2026)** — People who installed rooftop solar under PM Surya Ghar scheme. They generate more electricity than they use on sunny days but earn very little from their surplus.

2. **Non-solar consumers (crores of urban households)** — People living in the same locality who pay full retail tariff and want cheaper, greener electricity but cannot or don't want to install solar panels.

---

### Q3. How serious/frequent is the problem?

**Very serious, and happening every single day:**

| Fact | Data | Source |
|---|---|---|
| Households with rooftop solar | 50.06 lakh (July 2026), growing at 3 lakh+/month | MNRE / PM Surya Ghar |
| Revenue earned selling surplus at low rates | Rs.421 crore in FY 2024-25 by 12 lakh households | Ministry of Power, Parliament reply |
| Smart meters installed | 7.24 crore | RDSS Dashboard |
| India's total solar capacity | 150 GW+ | MNRE |
| Government subsidies disbursed | Rs.28,000+ crore | MNRE |
| PM Surya Ghar target | 1 crore households by FY 2026-27 | Government target |

This isn't a future problem — **12 lakh households are already losing money every day** because there's no mechanism to sell surplus at fair rates.

---

### Q4. What existing solutions are available?

| Existing Solution | How It Works |
|---|---|
| **DISCOM Net Metering** | Surplus solar goes to the grid; DISCOM credits the prosumer at a low feed-in tariff. The only option currently available to all solar households. |
| **Pulse Energy / SUPEREV** | First authorized Trade Platform Provider on the India Energy Stack. Operates in the P2P energy pilot but focuses on **EV charging users**, not residential housing societies. |
| **Power Ledger (Australia)** | Global P2P energy trading platform using blockchain. Not India-focused at the residential level. |

---

### Q5. Why are existing solutions insufficient?

| Existing Solution | Why It Falls Short |
|---|---|
| **Net metering** | Prosumer gets low price (DISCOM decides); buyer has no choice; no transparency; no community benefit. The middleman (DISCOM) keeps the spread. |
| **Pulse Energy / SUPEREV** | Built for EV charging segment, not housing societies. Different UX, different go-to-market, different user needs. The housing society segment is **completely unaddressed**. |
| **Power Ledger** | International platform, not adapted to Indian regulatory framework (IES, Beckn Protocol, DERC/UPERC pilot rules). Not available for Indian residential consumers. |

**The gap:** The government has built the entire P2P trading infrastructure (IES, Beckn Protocol, smart meters, regulatory pilot) but there is **no consumer app specifically for housing societies** — the largest concentrated segment of prosumers and buyers.

---

# CRITERION 2: INNOVATION & ORIGINALITY (15 Marks)

### Q6. What is genuinely new about SolarShare?

**SolarShare is not a new concept for P2P energy trading — P2P trading already exists globally. Our innovation is in three specific areas:**

1. **Housing-society-first go-to-market** — No existing platform targets the closed-community, RWA-led housing society segment in India. Pulse Energy targets EV users. Power Ledger targets utilities globally. We target the 50 lakh+ solar households in Indian housing societies.

2. **Asset-light BAP model on India's own stack** — We don't build any infrastructure. We plug into the government's India Energy Stack as a Beckn Application Provider (BAP). This is like building a food delivery app on top of Google Maps — the infrastructure exists, we build the user experience.

3. **RWA-led trust model** — Most marketplace startups fail because of the cold-start trust problem. We solve it by onboarding through the RWA (society admin) — a trusted local authority who can drive bulk adoption in one push.

---

### Q7. What already exists? What are you changing? Why is yours better?

**(Required by Section 4 of Event Guidelines — Originality & IP)**

| What Already Exists | What We Change | Why Ours Is Better |
|---|---|---|
| Net metering (sell to DISCOM only) | Direct P2P trading between neighbors | Better rates for BOTH seller (+20-30%) and buyer (-10-15%) |
| Pulse Energy / SUPEREV (EV-focused TPP) | Housing-society-focused BAP | Different segment, different UX, different trust model (RWA vs individual) |
| Generic P2P energy platforms (global) | India-specific: IES, Beckn, DERC/UPERC compliant | Built for Indian regulations, Indian infrastructure, Indian users |
| Blockchain-heavy energy platforms | Phased approach: hash chain (MVP) -> Hyperledger (pilot) | Pragmatic — doesn't over-engineer for hackathon stage |

---

### Q8. Is this just a copy of Power Ledger / any global P2P platform?

**No.** The core concept (P2P energy trading) exists globally, but SolarShare is meaningfully different:

1. **Technology stack:** Built on India's own Beckn Protocol / UEI (not custom blockchain)
2. **Regulatory alignment:** Designed for DERC/UPERC pilot rules, not EU/US regulations
3. **Segment:** Housing societies, not utilities or EV networks
4. **Go-to-market:** RWA-first bulk onboarding, not individual marketing
5. **Cost:** Rs.0 MVP, asset-light model (vs. Power Ledger's infrastructure-heavy approach)

We use P2P trading as inspiration but demonstrate **meaningful innovation in segment targeting, trust model, and regulatory compliance** — as required by Section 4 of the event guidelines.

---

# CRITERION 3: FEASIBILITY & TECHNICAL APPROACH (10 Marks)

### Q9. Can this actually be built? What's the technical approach?

**Yes. The hackathon MVP is a standard web/mobile app — no exotic technology required.**

| Component | Technology | Student Buildable? | Complexity |
|---|---|---|---|
| Mobile app (3 screens) | React Native / Flutter | Yes | Medium |
| Backend API | Node.js / FastAPI | Yes | Medium |
| Database | Firebase / Supabase (free tier) | Yes | Low |
| Tamper-evident ledger | SHA-256 (built-in crypto library) | Yes — ~10 lines of code | Low |
| Simulated meter data | JSON mock data | Yes | Low |
| Mock payment wallet | Simple balance tracking | Yes | Low |
| Hosting | Firebase / Vercel (free tier) | Yes | Low |

**Total cost: Rs.0** — all free-tier tools, student team.

---

### Q10. What is the realistic implementation pathway?

**(Required by Section 7 — "realistic implementation pathway")**

| Phase | Timeline | Goal | Key Milestone |
|---|---|---|---|
| **Phase 0** | 1 week | Hackathon MVP | Working demo — judges can complete a mock trade |
| **Phase 1** | Month 1-3 | Single-society pilot | 50+ active prosumer/buyer pairs in one real society |
| **Phase 2** | Month 3-6 | Technical integration | Real BAP registration, real meter data, real escrow |
| **Phase 3** | Month 6-12 | Multi-society scale | 5+ societies, positive unit economics |
| **Phase 4** | Year 2+ | Platform maturity | Multi-state, VPP partnerships, carbon credits |

---

### Q11. What resources/technology are required?

| Resource | Phase 0 (Hackathon) | Phase 1 (Pilot) | Phase 2 (Integration) |
|---|---|---|---|
| **Development** | Student team (2-4 people) | Same + possible freelance help | Full-time team (3-4 devs) |
| **Hosting** | Free tier (Firebase/Vercel) | Free tier or Rs.3K/month | Rs.5-15K/month |
| **Meter data** | Simulated (JSON) | Manual/CSV readings | Real AMISP/HES feed |
| **Payments** | Mock wallet | UPI sandbox | RBI-compliant escrow |
| **Beckn/UEI** | Simulated | Simulated | Real BAP registration |
| **Legal** | None needed | Rs.5-20K (compliance basics) | BAP registration process |
| **Total cost** | **Rs.0** | **Rs.0-2 lakh** | **Primarily time cost** |

---

### Q12. What do you simulate vs. what is real in the MVP?

| Component | Status | Explanation |
|---|---|---|
| App UI (3 screens) | **REAL** | Fully functional interface |
| Trade logic (list, match, buy) | **REAL** | Core business logic works |
| SHA-256 tamper-evident ledger | **REAL** | Actual cryptographic hashing |
| Trade history dashboard | **REAL** | Shows real logged data |
| Smart meter data | **Simulated** | Real DISCOM integration needs partnership |
| Payment settlement | **Mocked** | Real escrow needs RBI-compliant gateway |
| Beckn/UEI registration | **Not yet** | BAP registration is post-hackathon |

---

### Q13. How does the data flow end-to-end?

```
Solar Panel -> Inverter -> Smart Meter (bidirectional)
    -> DLMS/COSEM protocol (wireless: 4G/RF/PLC)
    -> DISCOM Head-End System (HES)
    -> Meter Data Management (MDM) — validates & cleans
    -> UEI / Beckn API Layer
    -> SolarShare App (BAP) — displays surplus, matches trades
    -> User sees it on their phone
```

SolarShare never reads meters directly — we consume **verified data** from the DISCOM's own infrastructure via standardized APIs.

---

### Q14. How does blockchain/trust layer work?

**Phase-wise approach:**

**MVP (Hackathon): SHA-256 Hash Chain**
- Each trade record is hashed with SHA-256
- Each hash includes the previous trade's hash
- This creates a chain — changing any past record breaks the chain
- Anyone can detect tampering by recalculating hashes
- Simple, zero-cost, ~10 lines of code

**Production (Phase 2): Hyperledger Fabric Blockchain**
- Permissioned blockchain — only verified DISCOM customers can participate
- Multiple organizations run copies of the ledger (SolarShare, DISCOM, RWA)
- Smart contracts (chaincode) automatically enforce trade rules
- Private data collections for DPDP Act compliance
- No gas fees (unlike Ethereum), 3000+ transactions/second

---

# CRITERION 4: SOCIAL IMPACT (10 Marks)

### Q15. What social impact does SolarShare create?

| Impact Area | How SolarShare Helps |
|---|---|
| **Green energy adoption** | Makes solar more financially attractive — prosumers earn more, which encourages more rooftop solar installations |
| **Energy access equity** | Non-solar households get access to cheaper, greener electricity without needing to install panels |
| **Carbon emission reduction** | Every kWh traded P2P displaces coal/gas-generated grid electricity. Measurable CO2 offset per trade |
| **Community building** | Shared energy trading creates a tangible community benefit — the whole society saves money together |
| **Financial inclusion** | Rural and semi-urban households (PM Surya Ghar's primary targets) can earn better returns on their solar investment |
| **Supporting government policy** | Directly supports PM Surya Ghar, IES, and India's 500 GW renewable energy target by 2030 |
| **Women empowerment** | Many PM Surya Ghar beneficiaries are women homeowners — better returns directly benefit women-led households |

---

### Q16. Can you quantify the environmental impact?

**Yes. For a single housing society (200 units, 50 solar households):**

| Metric | Estimate | Basis |
|---|---|---|
| Daily P2P solar traded | ~200-400 kWh | 50 prosumers x 4-8 kWh surplus each |
| Annual P2P solar traded | ~73,000-146,000 kWh | 365 days (sunny-day average) |
| CO2 offset per year | ~60-120 tonnes CO2 | India grid emission factor: ~0.82 kg CO2/kWh |
| Equivalent trees planted | ~2,700-5,400 trees | 22 kg CO2/tree/year |
| Household savings (buyers) | Rs.1,000-2,500/year per household | 10-15% below retail tariff |
| Additional earnings (sellers) | Rs.2,000-5,000/year per household | 20-30% above feed-in tariff |

---

### Q17. How does this align with government goals?

| Government Initiative | SolarShare's Alignment |
|---|---|
| **PM Surya Ghar: Muft Bijli Yojana** | Increases financial returns for solar households, incentivizing more installations |
| **India Energy Stack (IES)** | SolarShare is designed to be a BAP on IES — exactly what the government wants |
| **500 GW renewable energy by 2030** | Accelerates rooftop solar adoption by improving economics |
| **Digital India** | App-based, WhatsApp-first, digitally native energy trading |
| **DPDP Act 2023** | Data privacy compliant by design |
| **Net Zero by 2070** | Every P2P trade displaces fossil-fuel electricity |

---

# CRITERION 5: CREATIVITY & UNIQUE SELLING PROPOSITION (15 Marks)

### Q18. What is SolarShare's USP?

**"The UPI of electricity for housing societies"**

Three USPs combined create a unique position:

1. **Only platform targeting housing societies** — The one existing TPP (Pulse Energy/SUPEREV) targets EV charging users. Housing societies (with RWA-led trust and bulk onboarding) are completely unaddressed.

2. **Government infrastructure, zero hardware** — We don't build meters, grids, or protocol. Everything exists. We build only the app layer — like building PhonePe on top of UPI.

3. **Both sides win simultaneously** — Sellers earn 20-30% more. Buyers pay 10-15% less. This isn't a zero-sum game — we remove the DISCOM's middleman margin and split the benefit.

---

### Q19. What makes the go-to-market creative?

**RWA-first onboarding solves the classic "chicken-and-egg" marketplace problem:**

| Typical Marketplace Problem | SolarShare's Solution |
|---|---|
| "Need sellers to attract buyers, need buyers to attract sellers" | RWA onboards BOTH sides in one push — 50-200 households at once |
| "Users don't trust a new platform" | RWA coordinator is a trusted local authority who vouches for legitimacy |
| "High customer acquisition cost" | One RWA relationship = 100+ users (vs. individual marketing at Rs.500+ per user) |
| "Low viral spread" | Societies already have active WhatsApp groups — natural word-of-mouth |

---

### Q20. What are the key features?

| Feature | Description | User Benefit |
|---|---|---|
| Surplus listing | Prosumer lists available kWh + asking price | One-tap monetization |
| Marketplace browse | Buyer sees available listings from their society | Choice and transparency |
| Smart price suggestions | Shows rate relative to DISCOM feed-in and retail tariff | Both sides see they're getting a better deal |
| Tamper-evident ledger | Every trade gets a unique SHA-256 hash, chained to previous | Trust — nobody can alter records |
| Trade history dashboard | Complete log of all trades with amounts, prices, timestamps | Transparency for dispute resolution |
| Auto grid fallback | If no surplus available, buyer stays on grid automatically | No disruption, ever |
| WhatsApp notifications | Trade confirmations via WhatsApp | No app download needed for basic updates |

---

# CRITERION 6: REVENUE, BUSINESS POTENTIAL & SCALABILITY (25 Marks)

**(This is the HIGHEST-WEIGHTED criterion at 25 marks)**

### Q21. Who will pay for the solution?

| Payer | What They Pay For | Why They Pay |
|---|---|---|
| **Buyers** | Transaction fee (Rs.0.21/kWh share) | They're still saving 10-15% vs. DISCOM retail tariff even after the fee |
| **Sellers** | Transaction fee (Rs.0.21/kWh share) | They're still earning 20-30% more than DISCOM feed-in tariff even after the fee |
| **RWA admins** | SaaS subscription (Phase 2+) | Dashboard, analytics, billing tools for managing society energy |
| **Corporates** | Carbon credits (Phase 3+) | ESG compliance, green certificates from verified P2P solar trades |
| **DISCOMs/Policy makers** | Data insights (Phase 3+) | Anonymized consumption patterns for grid planning |

---

### Q22. Revenue Model — What are all the streams?

| Stream | Type | How It Works | When |
|---|---|---|---|
| **Transaction fee** | Commission / Pay-per-use | Rs.0.42/kWh per trade (Rs.0.21 buyer + Rs.0.21 seller) | Phase 1+ |
| **SaaS subscription** | Subscription | Monthly fee to RWA admins for dashboard + analytics | Phase 2+ |
| **Carbon credits** | Service fees / B2B | Track CO2 offsets per trade, sell green certificates to corporates | Phase 3+ |
| **Data insights** | B2B contracts / Licensing | Anonymized consumption pattern data for DISCOMs, planners | Phase 3+ |
| **Premium features** | Freemium | AI-based demand forecasting, priority matching for buyers | Phase 3+ |

---

### Q23. Is the market local, regional, national, or global?

| Phase | Market Scope | Geography |
|---|---|---|
| Phase 0-1 | **Local** | One housing society in Delhi / Western UP (DERC/UPERC pilot zones) |
| Phase 2-3 | **Regional** | Multiple societies across Delhi, Western UP (pilot expansion) |
| Phase 3+ | **National** | Maharashtra, Gujarat, Karnataka (as more states approve P2P) |
| Phase 4+ | **Potentially global** | Model replicable in any country with rooftop solar + smart meters |

---

### Q24. What are the unit economics?

| Metric | Value |
|---|---|
| **Revenue per trade** | Rs.0.42 (transaction fee) |
| **Average trade size** | ~5-8 kWh |
| **Revenue per trade (Rs)** | Rs.2.10 - Rs.3.36 |
| **Cost per trade** | Near-zero (cloud compute + API calls) |
| **Gross margin per trade** | ~95%+ |
| **Hosting cost (MVP)** | Rs.0 (free tier) |
| **Hosting cost (100 societies)** | Rs.5,000-15,000/month |
| **Customer acquisition cost** | Very low — RWA bulk onboarding, not individual marketing |
| **Breakeven** | Estimated at 5-10 active societies |

---

### Q25. Cost structure — what are the major costs?

**(Required by Section 8 — "Production/development, Customer acquisition, Distribution, Maintenance costs")**

| Cost Category | Phase 0 | Phase 1 | Phase 2 | Phase 3 |
|---|---|---|---|---|
| Development | Rs.0 (students) | Rs.0-1.5 lakh | Rs.5-10 lakh | Rs.10-20 lakh |
| Hosting/Cloud | Rs.0 (free tier) | Rs.0-3K/month | Rs.5-10K/month | Rs.15-30K/month |
| Customer acquisition | Rs.0 | Rs.10-20K (RWA events) | Rs.50K-1 lakh | Rs.2-5 lakh |
| Legal/Compliance | Rs.0 | Rs.5-20K | Rs.20-50K | Rs.1-2 lakh |
| WhatsApp API | Rs.0 | Rs.2-10K/month | Rs.10-30K/month | Rs.30-60K/month |
| **Total** | **Rs.0** | **Rs.0-2 lakh** | **Rs.3-6 lakh** | **Rs.15-30 lakh** |

---

### Q26. What about profitability?

**Revenue model at steady state (10 active societies, ~500 trading pairs):**

| Metric | Monthly Value |
|---|---|
| Average trades per day | ~500 (50 per society x 10) |
| Average kWh per trade | ~6 kWh |
| Revenue per day (transaction fees) | 500 x 6 x Rs.0.42 = Rs.1,260 |
| Revenue per month | ~Rs.38,000 |
| SaaS revenue (10 RWAs x Rs.2K/month) | Rs.20,000 |
| **Total monthly revenue** | **~Rs.58,000** |
| Monthly operating costs | ~Rs.25,000-35,000 |
| **Monthly profit** | **~Rs.23,000-33,000** |

**At 100 societies:** Revenue scales 10x while costs scale ~3-4x = strong positive unit economics.

---

### Q27. Scalability — how does this grow?

```
GROWTH PATHWAY:

Year 1: 1-5 societies (validation)
    -> Prove the model works
    -> Achieve product-market fit

Year 2: 50-100 societies (scale within pilot zones)
    -> Delhi + Western UP
    -> Launch SaaS + carbon credit streams
    -> Positive unit economics

Year 3: 500+ societies (multi-state expansion)
    -> Maharashtra, Gujarat, Karnataka
    -> As more states approve P2P trading

Year 5: National platform
    -> 5,000+ societies
    -> VPP partnerships
    -> EV charging integration
    -> Rs.10Cr+ annual revenue potential
```

**Why it scales:**
1. Software-only model — no hardware to deploy per society
2. RWA onboarding is replicable — same playbook in every society
3. Network effects — more societies = more data = better AI matching
4. Multi-state expansion follows regulatory expansion (government-driven)

---

### Q28. What would you do with Rs.50 lakh in funding?

| Allocation | Amount | Purpose |
|---|---|---|
| Engineering team (3-4 devs, 6 months) | Rs.20 lakh | Full-time development, BAP registration |
| DISCOM partnership & compliance | Rs.10 lakh | Legal, AMISP integration, escrow setup |
| Community onboarding | Rs.8 lakh | RWA partnerships, WhatsApp campaigns, on-ground activation |
| Cloud infrastructure | Rs.5 lakh | Production-grade hosting, security, monitoring |
| Working capital | Rs.7 lakh | Buffer for unexpected costs, 3-month runway |

---

# CRITERION 7: PRESENTATION & Q&A (15 Marks)

### Q29. How should we structure the 4-5 minute pitch?

**(Based on Section 7 — 6-8 slide PPT covering all required topics)**

| Slide | Content | Time |
|---|---|---|
| 1 | Title + key stat hook (50L solar homes, Rs.421Cr surplus) | 15 sec |
| 2 | Problem + who faces it + why current solutions fail | 45 sec |
| 3 | Solution — how SolarShare works (architecture + flow) | 60 sec |
| 4 | Market size + government validation (IES, DERC pilot) | 45 sec |
| 5 | Business model — revenue streams + unit economics + competitive edge | 60 sec |
| 6 | Roadmap — phases + growth strategy | 30 sec |
| 7 | Thank you — impact summary + key pillars | 15 sec |

---

### Q30-50: RAPID-FIRE Q&A PREPARATION

**These are the questions judges are most likely to ask in the 3-5 minute Q&A window. Practice answering each in under 30 seconds.**

---

**Q30. In one sentence, what is SolarShare?**
An app that lets rooftop solar owners sell surplus electricity directly to non-solar neighbors at rates better for both sides, using the government's India Energy Stack.

**Q31. How is this different from just net metering?**
Net metering pays you the low DISCOM rate. SolarShare lets you sell directly to your neighbor at a higher rate — they still pay less than DISCOM retail. Both sides win.

**Q32. Is P2P energy trading legal in India?**
Yes — DERC and UPERC approved a 6-month pilot in February 2026 for Delhi and Western UP, covering ~1.25 crore consumers.

**Q33. What happens when there's no sun?**
The buyer automatically falls back to standard grid supply. No interruption, no action needed. SolarShare is a bonus layer on top of the grid, not a replacement.

**Q34. Why would DISCOMs allow this?**
The government mandated the pilot. DISCOMs still earn wheeling charges and transaction fees. P2P actually reduces their grid stress during peak solar hours.

**Q35. What's the transaction fee?**
Rs.0.42 per kWh, split equally between buyer and seller (Rs.0.21 each). This is the DERC pilot's reference rate.

**Q36. Can a student team really build this?**
The hackathon MVP is a marketplace app with simulated data + SHA-256 hashing. React Native + Node.js + Firebase — all standard student skills. Total cost: Rs.0.

**Q37. Why not Ethereum/public blockchain?**
Too expensive (gas fees exceed trade value), too slow (15 TPS), and too public (violates DPDP Act privacy requirements). Hyperledger Fabric is permissioned, private, and free.

**Q38. What if only 5 people in a society join?**
Even 5 prosumers + 10 buyers can start trading. The RWA drives bulk adoption — word spreads as early adopters save money. WhatsApp groups amplify virally.

**Q39. How do you prevent fake data?**
In production, we consume verified data from the DISCOM's own Head-End System. Smart meters are tamper-proof, sealed devices. We never read meters directly.

**Q40. What's the biggest risk?**
Regulatory timing — the DERC/UPERC pilot is 6 months. If it doesn't extend, our market stays narrow. But the pilot was explicitly designed to inform a national rollout decision, and the government has invested heavily in the infrastructure.

**Q41. What's your competitive moat?**
Housing society niche (unaddressed by any competitor), RWA trust relationships (hard to replicate), and first-mover timing (entering during a narrow pilot window).

**Q42. How do you handle disputes?**
DISCOM's verified smart meter data is the ground truth. Escrow holds payment until delivery is confirmed. SHA-256 hash chain prevents record tampering.

**Q43. Does the electricity physically go from seller to buyer?**
No — the actual electrons go to the grid. P2P trading is an accounting transaction: the billing is adjusted so both parties get better rates. The grid acts as the buffer.

**Q44. What about battery storage?**
Explicitly out of scope for v1. The grid IS the battery. We stay asset-light. Battery/VPP partnerships are Phase 4.

**Q45. How does the prosumer know how much surplus they have?**
The smart meter records export data every 15 minutes. In production, this feeds into the app automatically. For hackathon, we simulate this.

**Q46. What if another competitor copies your idea?**
The market is massive (1 crore household target). The real competition is getting people OFF net metering, not fighting other platforms. Our moat is RWA relationships and community trust.

**Q47. How did you come up with this idea?**
We noticed that PM Surya Ghar is creating millions of solar households, but the monetization mechanism (net metering) is inefficient. When the IES pilot launched in February 2026, we saw the infrastructure gap — the government built the protocol but needs consumer apps. SolarShare fills that gap.

**Q48. Are the financial figures you're presenting real?**
All market data (50 lakh households, Rs.421 crore, 7.24 crore meters, Rs.0.42/kWh transaction fee) is sourced from MNRE, Ministry of Power Parliament replies, RDSS Dashboard, and DERC pilot orders. We have not fabricated any data.

**Q49. What's your 3-year vision?**
Year 1: Validate in 5 societies. Year 2: Scale to 100 societies across pilot zones. Year 3: Multi-state expansion as more states approve P2P, hitting positive unit economics and Rs.10 lakh+ monthly revenue.

**Q50. Why should we pick your team?**
We understand the domain deeply — IES, Beckn Protocol, DERC pilot rules, DLMS/COSEM, Hyperledger Fabric. We have 7 detailed documents. Our approach is realistic — we're not claiming to disrupt DISCOMs on day 1, we're building one society at a time. And the timing is perfect — the IES pilot is live right now.

---

## MASTER ANSWER FOR ANY UNKNOWN QUESTION

> *"The government has already validated the problem and built the infrastructure. IES is live. The DERC pilot is running. Smart meters are installed. We're just building the consumer app that reaches households — which is exactly what the pilot framework is designed to onboard."*

---

## DISQUALIFICATION SAFEGUARDS (Section 10 of Guidelines)

| Risk | Our Protection |
|---|---|
| Plagiarism | Our idea is original; we cite Power Ledger and Pulse Energy as existing inspiration with clear differentiation |
| Fabricated data | All statistics sourced from MNRE, Ministry of Power, RDSS Dashboard, DERC orders |
| AI-generated content pretending to be original | AI tools used for research and presentation assistance; core idea, reasoning, and validation are our own work |
| Cannot explain during Q&A | Every team member should study this Q&A document and the Concepts Explained document |
