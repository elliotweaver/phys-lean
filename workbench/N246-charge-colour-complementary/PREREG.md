# N246 PREREG — THE u(1)⊕su(3) COMMUTING PAIR AS COMPLEMENTARY SUMMANDS OF so(7) = 14 ⊕ 7

Frozen BEFORE production compute. Gather-side, owner-authorized under the LOCK. Self-authored
(worker-body STEP 5), single-flight tail. NOT the parked invariant-tower ascent.

## THE TARGET (ONE, forward, non-vacuous, on the banked tower)

The forced charge operator `chargeOp = crossOp u1` (N240) lives in the FUNDAMENTAL-7 summand
`range crossEmb` of the banked decomposition `so(7) = range imRepL (adjoint 14 = g₂) ⊕ range
crossEmb (fundamental 7)` (N225 `inter_eq_bot`/`sup_eq_so7`), while colour su(3) =
`imRep '' colourCentralizer` lives in the ADJOINT-14 summand `range imRepL`. They are in
COMPLEMENTARY summands (forced by N225 `inter_eq_bot`) AND they COMMUTE (N245). So the charge
line `u(1)` and colour `su(3)` form a genuine `u(1) ⊕ su(3)` commuting direct sum of dimension
`1 + 8 = 9` INSIDE the concrete so(7).

This CONNECTS the charge story (N240–N245) to the N225 so(7) = 14 ⊕ 7 decomposition — a joint the
chain does NOT yet have. THE MOAT / "one cause many terminations": the SAME `inter_eq_bot` (forced
by simplicity of Der(O), N28) that separates the adjoint 14 from the fundamental 7 now separates
colour su(3) (in the 14) from the charge operator (in the 7) — charge and colour are structurally
in COMPLEMENTARY so(7)-summands, and they commute.

## PLANNED DECLARATIONS (production: Phys/Algebra/TowerGatherForcedChargeColourComplementary.lean)

- `chargeOp_mem_range_crossEmb : chargeOp ∈ LinearMap.range crossEmb`
  (charge is a FUNDAMENTAL-7 element; via `crossEmb sgl = crossOp u1 = chargeOp`).
- `chargeOp_not_mem_range_imRep : chargeOp ∉ LinearMap.range imRepL`
  (charge is NOT an adjoint/colour generator; `inter_eq_bot` + `chargeOp_ne_zero`). ★ moat.
- `chargeLine := Submodule.span ℚ {chargeOp}`  (the u(1) charge line).
- `chargeLine_le_range_crossEmb : chargeLine ≤ LinearMap.range crossEmb`.
- `finrank_chargeLine : finrank ℚ chargeLine = 1`  (`finrank_span_singleton chargeOp_ne_zero`; W8).
- `chargeLine_inf_range_imRep_eq_bot : chargeLine ⊓ LinearMap.range imRepL = ⊥`
  (charge line meets the adjoint 14 only in 0; via chargeLine ≤ range crossEmb + `inter_eq_bot`).
- `colourImg := (colourCentralizer.toSubmodule).map imRepL`  (colour su(3) as an 8-dim submodule of so(7)).
- `colourImg_le_range_imRep : colourImg ≤ LinearMap.range imRepL`  (`Submodule.map_le_range`).
- `finrank_colourImg : finrank ℚ colourImg = 8`
  (`Submodule.equivMapOfInjective imRepL imRep_injective` + `finrank_colourCentralizer_eq_eight`).
- `chargeLine_inf_colourImg_eq_bot : chargeLine ⊓ colourImg = ⊥`
  (colourImg ≤ range imRepL, and chargeLine ⊓ range imRepL = ⊥).
- `finrank_chargeLine_sup_colourImg : finrank ℚ (chargeLine ⊔ colourImg) = 9`  ★★★ HEADLINE
  (`Submodule.finrank_sup_add_finrank_inf_eq` with inf = ⊥: 1 + 8 = 9 — the u(1)⊕su(3) is a genuine
   9-dim commuting direct sum inside so(7)).
- capstone `forced_charge_colour_complementary_structure` — bundles: chargeOp ∈ so(7) (N240);
  chargeOp ∈ range crossEmb; chargeOp ∉ range imRepL; chargeLine ⊓ range imRepL = ⊥;
  colourImg ≤ range imRepL; chargeLine ⊓ colourImg = ⊥; finrank (chargeLine ⊔ colourImg) = 9;
  ∀ D ∈ colourCentralizer, Commute (imRep D) chargeOp (N245 `colour_commute_chargeOp`).

## GO / NO-GO
- GO iff every obligation is structural over BANKED levers (N225 inter_eq_bot / finrank_imRep_range /
  imRep_injective / crossEmb / imRepL; N240 chargeOp / chargeOp_ne_zero / chargeOp_mem_so7; N245
  colour_commute_chargeOp; N201 finrank_colourCentralizer_eq_eight) + Mathlib submodule/finrank
  machinery. NO coordinate bash over O ℚ, NO minpoly, NO ℚ[i], NO TensorProduct.
- NO-GO / STOP-AND-REFRAME (W5/W9) if any obligation requires: a coordinate `ring`/`decide` over
  O ℚ; the two-level End-of-End space beyond `Module.End ℚ ImO`; a posited normalization/charge; a
  complex ground. Any of these ⟹ drift toward the ascent — reframe or child a route-finding node.

## KILL CLASSES (compile-cost budget)
- KILL any single obligation exceeding **90s net-of-import** → measure/decompose (W9). Imports
  (N245+N225 chains) ~30–45s expected; net-of-import is what to bound. NO maxHeartbeats raise.
- If ANY probe blows up (RSS climbing, no output > 90s), STOP — it is an instrument signal, reframe.
- Expect a LIGHT node: every lever is a banked submodule fact; the heaviest is the 3-line
  finrank_sup rank-nullity. Predicted net-of-import per probe < 10s.

## COSTUME (W8 teeth) — next id C277
- Anchor: `finrank ℚ (chargeLine ⊔ colourImg) = 9` (the u(1)⊕su(3) dimension, NEW headline number).
- `min 277 (finrank ℚ (chargeLine ⊔ colourImg)) = 9` TRUE; BOGUS `= 277`; bites `9 = 277` in ℕ.
- Distinct RHS from all prior (…C275=1=275, C276=6=276); pair (277,9) fresh; LHS anchor is the NEW
  N246 u(1)⊕su(3) direct-sum dimension.

## STANDARD (applied before kanban_complete)
- UNBROKEN: imports only banked N245 + N225 (+ their chains) + Mathlib submodule/finrank machinery;
  ground = derived ℚ; every headline TYPE mentions banked tower objects (chargeOp/crossEmb/imRepL/
  colourCentralizer/imRep/chargeLine/colourImg/bornBil-so(7)) — no free-floating carrier.
- COMPLETE: #print axioms ⊆ {propext, Classical.choice, Quot.sound}; no sorry/axiom/native_decide.
- WORDS-REMOVABLE: delete charge/colour/su(3)/u(1)/fundamental/adjoint/gauge → the pure statement
  (crossOp u1 ∈ range crossEmb, ∉ range imRepL; span{crossOp u1} ⊓ range imRepL = ⊥;
  (colourCentralizer).map imRepL 8-dim; the two meet in ⊥; their sup is 9-dim) stands.
- W4.5 SUFFICIENCY: FORWARD — connects the charge operator to the N225 so(7)=14⊕7 decomposition
  (charge ∈ 7-summand, colour ∈ 14-summand, complementary + commuting), a joint NOT banked. NOT a
  re-pin of N225 (which never mentions chargeOp) NOR of N240/N245 (which never place chargeOp in the
  N225 summands).
