# N2d-hard-backward — PREREG (run 26). Frozen before production Lean.

## TARGET (closing the forced iff, backward half)
The iff to close, matching the banked forward `Nrm_mul_of_doubled_base` exactly:
   Nrm multiplicative on CD(CD B)  ⟺  B commutative   (B [Ring][StarRing], assoc).
Forward (B comm ⟹ mult) is BANKED. Backward (this node):
   (∃ p q : B, p*q ≠ q*p) ⟹ ∃ x y : CD(CD B), Nrm(x*y) ≠ Nrm x * Nrm y.
Instantiated at B = H ℚ (non-commutative) it recovers genNrm_not_mul_at_S.
Equivalent cascade reading: base M = CD B is non-associative (iota_iota_e2_assoc_iff:
CD B assoc ⟺ B comm) ⟹ Nrm not mult on CD M. "A non-assoc ⟹ ¬mult" for cascade bases.

## WHAT THE NUMERICS DECISIVELY SETTLE (re-verified THIS run, independently)
- comm_span.py: over a BARE associative *-ring, [p,q] is NOT in the Q-linear span of
  norm-defects D(x,y) on CD(CD B) (26900 defects, dim checked). NO linear extraction.
- concrete_span.py: over the CONCRETE octonions, the associator [e1,e2,e4] is NOT in
  the Q-span of norm-defects on CD O. NO linear extraction even on the real cascade.
- clean_witness.py: x=(0,a),y=(0,b) over O has defect ≡ 0 on 2000 random imaginary
  pairs — every 2-element witness VANISHES (octonions alternative: any 2 elts associate).
  The non-associativity is irreducibly 3-element.
- zerodiv_symbolic/zerodiv_witness: generic zero divisors x*y=0 in CD(CD B) exist but
  REQUIRE p²=q² central and p,q anticommuting (imaginary-unit structure), NOT derivable
  from mere p*q≠q*p. So the zero-divisor route is also Hurwitz-depth.
⇒ CONFIRMED: the backward is genuine Hurwitz depth. The ONLY route is POLARIZATION /
  the composition-algebra bilinear identities (alternativity), exactly as the task names.
  THE ONE LAW check: the fight is the INSTRUMENT (no linear/single-witness route), not the
  theory; the theory-native instrument is the polarized self-overlap (Born) bilinear form.

## THE ATTACK (theory-native, alternativity via polarized Born form)
Define the polarized self-overlap (Born) bilinear form on CD A:
   bilin x y := (x * star y + y * star x).re        (∈ A)
Real forced content (derived from the banked CD product + star + selfMul):
   B0. bilin x x = Nrm x + Nrm x   (= 2·Nrm x): polarization fixes the diagonal.
   B1. bilin symmetric; additive each slot.
   P1. multiplicativity hyp ⟹ bilin (x*z) (y*z) = bilin x y * Nrm z   (right composition).
   P2. multiplicativity hyp ⟹ bilin (x*y) (x*z) = Nrm x * bilin y z   (left composition).
   (P1/P2 proof: polarize Nrm((x+y)z)=Nrm(x+y)Nrm z via right_distrib + selfMul; SHORT.)
These are the genuine first steps of the Hurwitz alternativity argument.

## GO / NO-GO (frozen)
GO-FULL: if, with bilin+P1+P2 banked, the extraction "P1/P2 + iota_iota_e2_assoc_iff ⟹
  B commutative" closes cleanly in Lean THIS run → bank the whole backward, close the iff,
  recover genNrm_not_mul_at_S as corollary, DONE.
GO-DECOMPOSE (W3): if the extraction is genuinely long/fights (the remaining Hurwitz core),
  bank bilin+P1+P2 (real forced content, foundations-only, words-removable), and CHILD the
  final extraction as the immediate next node with this numerical blueprint; BLOCK on it.
  NEVER bridge, NEVER bank a vacuous/one-directional shell as the "iff", NEVER scope-reduce.

## KILL (a fight = INSTRUMENT failure, return to trunk; never patch)
  K1. Do NOT retry the refuted single-witness / linear-associator route (4× refuted).
  K2. Do NOT import Mathlib CompositionAlgebra/Hurwitz and point at it (POSITS the iff).
  K3. bilin/P1/P2 must derive FORWARD from CD/star/selfMul; if any needs a hypothesis beyond
      [Ring B][StarRing B] + the multiplicativity assumption, the form is mis-derived.
  K4. Anti-vacuity (W8): the banked content must be NON-trivial — P1/P2 must actually use the
      multiplicativity hypothesis (a costume claiming P1 WITHOUT the hyp must fail to compile).

## Costume that BITES (one row, scripts/costume_manifest.tsv) — C13
  A wrong backward claim must FAIL to compile. Candidate: "Nrm stays multiplicative on
  CD(CD (H ℚ)) = S ℚ" at the witnessed pair (the negation of the recovered corollary) →
  reduces to the banked genNrm_not_mul_at_S contradiction (0 = 4 projected). OR a P1 costume
  claiming the composition identity holds with NO multiplicativity hypothesis (vacuity guard).
