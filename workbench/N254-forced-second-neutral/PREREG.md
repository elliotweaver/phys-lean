# N254 PREREG — THE FORCED SECOND NEUTRAL DIRECTION (rank-2 abelian torus, misaligned gradings)

## TARGET (theory-native, selected via SELECT S1–S5, comment 67)
The gather charge operator `chargeOp = crossOp u1` (N240) and the doubling weak-isospin Cartan
`imRep DI` (N202) — BOTH born from the single fold-root `u1 = ιO hI` (N202/N251) — are:
1. **COMMUTING**: `Commute chargeOp (imRep DI)` (they generate an abelian subalgebra).
2. **INDEPENDENT** over ℚ: `∀ a b : ℚ, a • chargeOp + b • imRep DI = 0 → a = 0 ∧ b = 0`
   (so `span{chargeOp, imRep DI}` is a genuine 2-dim abelian subalgebra of so(7) — a rank-2 torus).
3. **MISALIGNED GRADINGS** (the crux): the isospin singlet `κ1 = kappaO 1 = ⟨0,1⟩` (N189) is
   isospin-NEUTRAL (`imRep DI κ1 = 0`) but charge-NONZERO (`chargeOp κ1 ≠ 0`). Hence
   `ker (imRep DI) ⊄ ker chargeOp` — weak isospin does NOT determine the charge grading;
   a second, independent neutral generator (hypercharge) is FORCED, not posited.
4. **UNIQUE DOUBLY-NEUTRAL DIRECTION**: `ker chargeOp ⊓ ker (imRep DI) = span{sgl}` — the only
   direction neutral under BOTH is exactly the fold-root branching singlet `u1`. (Easy: N244 gives
   `ker chargeOp = span{sgl}`, and `sgl ∈ ker (imRep DI)` since `innerDeriv hI u1 = 0` N202, so the
   meet is `ker chargeOp` itself.)

## WHY THEORY-NATIVE (anti-bullshit, full record in comment 67)
- Fold → complex unit u1 (N2) → u1 re-enters as gather cross-product (chargeOp, N240) AND as
  inner-derivation commutator (imRep DI, N202): ONE root, two forced neutral generators.
- Dissolution: field POSITS U(1)_Y + chooses Q=T3+Y/2; here the second neutral direction is FORCED
  by the misalignment of two DERIVED operators' gradings — computable, not chosen.
- Words-removable: "two commuting, linearly-independent skew-adjoint endos of ImO, both from u1,
  grade ImO differently (∃v: Cv=0, Av≠0); common kernel = span{u1}." Pure math survives.
- SCOPE (deferred, honest): the weak MIXING ANGLE / hypercharge NORMALIZATION (couplings/running/
  embedding) is NOT claimed — only the FORCED-independence + misalignment structure underneath it.
  (≥5× hypercharge-normalization deferral respected; this banks the posit-free anchor, not the angle.)

## ROUTE (W9-LIGHT — integer 7×7 matrix arithmetic, NO coordinate bash of octonion products)
Reuse N253's banked bridges `chargeOp_eq_qI : chargeOp = qI Cmat`, `imRep_DI_eq_qI : imRep DI = qI Imat`.
- (1) Commute: `chargeOp * imRep DI = qI (mul7 Cmat Imat)`, `imRep DI * chargeOp = qI (mul7 Imat Cmat)`
  via `qI_comp`; then `mul7 Cmat Imat = mul7 Imat Cmat` by `decide` (integer matrices). NO ring on O.
- (2) Independence: apply `a•chargeOp + b•imRep DI = 0` to two ImO basis vectors, read coordinates:
  at c4-dir → `a•e_c5 = 0` gives a=0; at c2-dir → `(a+2b)•e_c3=0` with a=0 gives b=0. Via qI_coe + qZ
  coordinate extraction (c-functions).
- (3a) `imRep DI κ1 = 0`: banked `innerDeriv_kappaO_one hI` (imRep DI coerces to innerDeriv hI via
  imRep_coe) OR imRep_DI_eq_qI + qZ Imat (kappaO 1) = 0.
- (3b) `chargeOp κ1 ≠ 0`: chargeOp_eq_qI → qZ Cmat (kappaO 1); its c5 coordinate = 1 ≠ 0.
- (4) meet: N244 `ker_chargeOp = span{sgl}` (or `ker_le_span_sgl`) + `sgl ∈ ker imRep DI` (innerDeriv_hI_u1).

## KILL / COST BUDGET (W9)
Every obligation is integer-matrix `decide` or a single-coordinate `simp`/`norm_num`. NO tactic may
exceed default heartbeats; NO `ring`/`decide` on expanded octonion coordinates; NO `native_decide`.
If the commute `decide` is slow (unlikely, 7×7 ℤ), evaluate `mul7` entrywise by `Matrix` simp instead.
If ANY obligation wants a coordinate bash on O ℚ, STOP — it is an instrument-framing error (W9).

## W8 TEETH
- Commute is NON-vacuous (both operators nonzero: N253 lengths −6, −16).
- Independence is genuine (the ratio 3:8 ≠ 1:1 already shows non-proportional; here the stronger
  linear independence).
- Misalignment is GENUINE: `chargeOp κ1 ≠ 0` with witness coordinate c5 = 1 (not a vacuous ≠).

## FILE
`Phys/Algebra/TowerGatherForcedSecondNeutral.lean`, imports N253
`TowerGatherChargeIsospinRatio` + N189 `DerivationRep7IsospinBranching` (κ1) + N244 eigenspace file.
Costume next id C285 (per memory: next was C284=N253, so C285). Verify via costume manifest.
