# N2d-hard-backward — RUN 27 decision: GO-DECOMPOSE (frozen before production Lean).

## What run 27 established (numerics, all exact, re-verified)
- reverse_witness.py / direct_witness.py / abstract_witness.py / compound_witness.py:
  NO fixed witness x(p,q),y(p,q) in CD(CD B) gives a norm-defect proportional to [p,q]
  or vanishing-iff-[p,q]=0 in a single coordinate. The simplest defects are NORMALITY
  defects (star m·m − m·star m) that VANISH on the cascade bases (every quaternion/
  octonion is normal) — this is exactly why the single-witness route is dead. The
  obstruction is irreducibly 3-element (alt_chain.py: S=CD O fails left/right
  alternativity 300/300 while O,H,C pass). 5th independent confirmation of Hurwitz depth.
- scaling_law.py: the scaling law x·(x̄·y)=ι(Nrm x)·y holds on H,O (assoc) and fails
  300/300 on S — the genuine alternativity obstruction, base-associativity-equivalent.
- pin_assoc.py / assoc_extract.py: [ι a, ι b, ι c]_{CD A} = ι([a,b,c]_A) with coeff
  exactly 1 (iota is a ring hom) — the base associator is reflected EXACTLY.
- adjoint_probe.py: K(x,y,z)=bilin(xy,z)−bilin(y,star x·z) surfaces base commutators
  (K(ip,iq,1)=[p,q]−[P,Q]) — confirms the obstruction is bilinear-3-element, needs the
  nondegeneracy/alternativity machinery, not a fixed witness.
- nondegen_probe.py: bilin is nondegenerate on the CD(CD B) probe set (necessary for the
  classical chain, but the FULL chain over the non-associative backward base is long).

## What COMPILES this run (foundations-only, verified by `lake env lean`)
Layer 1 — POLARIZATION (the Born self-overlap bilinear form, forced by multiplicativity),
over a GENERAL associative *-base [Ring A][StarRing A] (no commutativity):
  bilin x y := (x·star y + y·star x).re ;  bilin_diag, bilin_symm,
  bilin_add_left, bilin_add_right ;  Nrm_add (polarization) ;
  ★ P1: H ⟹ bilin(xz,yz)=bilin x y·Nrm z ;  ★ P2: H ⟹ bilin(zx,zy)=Nrm z·bilin x y.
  P1/P2 genuinely USE the multiplicativity hypothesis H (anti-vacuity costume C13).
Layer 2 — REFLECTION (associativity of the double pins base associativity):
  iota_mul (iota is a ring hom) ; ★ iota_assoc_iff (CD A associates on a base-image
  triple ⟺ the base associates on it) ; base_assoc_of_image_assoc.

Neither layer is "the iff" or a one-directional shell. They are the genuine FIRST and
LAST thirds of the Hurwitz chain, honestly partial. The middle — H ⟹ CD A alternative
⟹ CD A associates on the e₂-triples — remains OPEN and is childed.

## DECISION: GO-DECOMPOSE (PREREG_BACKWARD GO-DECOMPOSE clause, sanctioned W1-step3/W3)
Bank Layer 1 + Layer 2 (real forced content, foundations-only, words-removable, costume
C13 bites). CHILD the alternativity middle as the immediate next node, link onto the
chain tail, complete THIS task as "decomposed: polarization+reflection banked, alternativity
core childed." NEVER bank a shell as the iff; the LEDGER shows the backward still OWED.

## Child target (the Hurwitz middle, the only remaining third)
H: Nrm multiplicative on CD A  ⟹  CD A is alternative  ⟹  CD A associates on ALL
triples (the e₂-involving ones, beyond the base-image triples Layer 2 already handles).
Combined with Layer 2 (base_assoc_of_image_assoc) ⟹ base A associative; instantiated
at A = CD B with banked iota_iota_e2_assoc_iff ⟹ B commutative — closing the forced iff
and recovering genNrm_not_mul_at_S as a corollary. Tools available to the child:
P1, P2 (banked here), bilin nondegeneracy on CD A (numerically confirmed), the
polarized P1'/P2' (bilin(xz,yw)+bilin(xw,yz)=bilin x y·bilin z w).

## KILL (unchanged): no single-witness retry; no Mathlib Hurwitz import; no shell-as-iff.
## Costume that BITES (C13, one row): P1 asserted WITHOUT the multiplicativity hypothesis
at the concrete witness x=e₄,y=e₁₅,z=e₁+e₁₀ on S ℚ, where bilin(xz,yz) projects to 4 but
bilin(x,y)·Nrm z projects to 0 → false core 4=0 → must FAIL to compile (anti-vacuity W8).
