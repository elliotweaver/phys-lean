# N317 PREREG — SEEDED GAUGE ROUTE A5: the chiral hypercharge trace Tr(Y²)/Tr(T3²)=5/3

## TARGET (seed A5, docs/SEED_GAUGE_SCALE_COSMOLOGY.md)
Over ONE chiral generation of the banked SU(3)×SU(2)×U(1) content, derive
Tr(Y²)/Tr(T3²) = 5/3 (feeding A6 sin²θ_W = 3/(3+5) = 3/8). ⚠ The naive gauged-F₄
normalization gives the WRONG 3/4 — must derive via the chiral-generation trace.

## THE THEORY-NATIVE ROUTE (colour exterior ladder, NOT F₄)
One chiral generation of matter = the colour EXTERIOR LADDER Λ*(colour-3)
(Furey/Dixon minimal-left-ideal picture): the 2^{n_c}=8 states of one chirality are
the subsets S ⊆ Fin n_c of the colour index set, doubled by the conjugate chirality
(16 total). The electric charge is the ladder OCCUPATION NUMBER normalized by the
colour count: Q(S) = |S| / n_c, with n_c = finrank ℚ Uhol = 3 (the BANKED derived
colour-triplet dimension, N42c/DerivationStabilizerSplit). This is WHY quarks carry
charge 1/n_c — because there are n_c colours. So
    Tr(Q²) = 2 · Σ_{S⊆Fin n_c} (|S|/n_c)²  = 2·(24/9) = 16/3   at n_c=3.
This is the GUT-normalization DENOMINATOR of the Weinberg angle:
    sin²θ_W = Tr(T3²)/Tr(Q²) = 2/(16/3) = 3/8,
and, with Y := Q − T3 and the orthogonality Tr(Y·T3)=0 (Y constant per isospin
doublet ⇒ Σ_doublet T3 = 0),
    Tr(Y²) = Tr(Q²) − Tr(T3²) = 16/3 − 2 = 10/3,  ratio = (10/3)/2 = 5/3.

## ANTI-BULLSHIT GATE (S4)
1. FOLD-CAUSAL: fold → cascade terminates at 𝕆 → colour SU(3) = g₂-centralizer of
   L_{u1} (banked) → colour triplet dim n_c = finrank Uhol (banked) → the generation
   carrier is the exterior ladder Λ*(colour-3) → charge = occupation/n_c → Tr(Q²)=16/3
   FORCED. Each arrow forced; no "the field now needs Y".
2. DISSOLUTION: the field POSITS the hypercharge table + a GUT embedding to fix the
   normalization; the theory reads Q OFF the derived colour ladder (occupation ÷
   finrank Uhol). The F₄ route (the seed's trap) gives 3/4 and is NOT used.
3. GOAL-WORDS-REMOVABLE: delete charge/colour/generation — "twice the second moment of
   normalized subset-cardinality over the exterior algebra of an n_c-space, at
   n_c = finrank ℚ Uhol = 3, equals 16/3". No physics word load-bearing.
4. TEMPTATION: tabulate the 15-state SM (Q,T3,Y) and `decide` 5/3. Built + DISCARDED
   that probe — it ASSERTS the SM table (G1 + free-floating-rail violation). Rejected.
5. HONESTY: the charge pillar genuinely grounds to the banked colour dim; the isospin
   pillar genuinely does not yet (see W3 below). Not bullshitting either way.

## W3 DECOMPOSE (ticket-authorized: "if A5 must decompose, bank first sub-lemma, child remainder")
The FULL 5/3 needs THREE pillars:
  (1) Tr(Q²) = 16/3  — colour ladder, GROUNDED to finrank Uhol NOW. [THIS NODE]
  (2) Tr(T3²) = 2    — needs the su(2)_L DOUBLET action on the generation carrier
      (the fundamental-2 rep, NOT the banked fundamental-7 TRIPLET N277) — genuinely
      new structure, the 11×-deferred (N201–N211) half. [CHILD]
  (3) Tr(Y·T3) = 0   — Y constant per doublet ⇒ orthogonality. [CHILD]
THIS NODE banks pillar (1) — the GUT-normalization denominator, forced from the
colour ladder — PLUS the parametric assembly engine that DELIVERS 5/3 and 3/8 the
moment (2)+(3) land: hyperRatio(trQ²,trT3²) under Tr(Y·T3)=0, evaluated at (16/3, 2).
The child (single successor) banks pillars (2)+(3) + the 5/3 landing, then A6.

## PRODUCTION: Phys/Algebra/ChiralGenerationChargeTrace.lean (ns Phys.Algebra)
- `ladderChargeTrace (n:ℕ) : ℚ := 2 * Σ_{S:Finset (Fin n)} ((S.card:ℚ)/(n:ℚ))^2`
- `sum_card_sq_three : Σ_{S:Finset (Fin 3)} S.card^2 = 24`  (decide on ℕ)
- `ladderChargeTrace_three : ladderChargeTrace 3 = 16/3`
- ★ `generation_charge_trace : ladderChargeTrace (finrank ℚ Uhol) = 16/3`  (grounds to banked colour dim)
- assembly: `hyperTraceOrtho (q t : ℚ) := q - t` (= Tr(Y²) when Tr(Y·T3)=0);
  `hyperRatio (q t : ℚ) := (q - t)/t`;
  `weinberg (q t : ℚ) := t/q`
- `hyperRatio_at : hyperRatio (16/3) 2 = 5/3`, `weinberg_at : weinberg (16/3) 2 = 3/8`
- localizer `assembly_delivers_5_3 : hyperRatio (ladderChargeTrace (finrank ℚ Uhol)) 2 = 5/3`
- W8 non-vacuity: `ladderChargeTrace 2 ≠ 16/3`, `ladderChargeTrace 4 ≠ 16/3` (a WRONG
  colour count / F₄-route normalization fails), `hyperRatio (16/3) (3/4) ≠ 5/3` (a WRONG
  isospin trace giving the 3/4-trap fails), and Tr(Q²)=16/3 ≠ the naive 3/4-route value.

## COSTUME C346 (next free): 3·Tr(Q²)=16 forced ⇒ bogus 16=346 bites.
   cert: `three_trQ2 : ℕ := 16` tied to generation_charge_trace (3·(16/3)=16); a WRONG
   reading (F₄ 3/4 route / wrong colour count / diagonal miscount) reduces to 16=346.

## GATE: gate-fast D0–D6; add module import + #print axioms lines to AxiomAudit; wire Phys.lean.
## SUCCESSOR: ONE directed child toward pillars (2)+(3)+5/3 landing, then A6. NOT also A6 ticket.
