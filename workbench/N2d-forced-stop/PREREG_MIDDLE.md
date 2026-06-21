# N2d-hard-backward-MIDDLE — PREREG (run 29). Frozen BEFORE production Lean.

## Context / prior runs
Parent decomposed the backward Hurwitz direction into 3 thirds along the ALTERNATIVITY
route. FIRST (Part A: polarization — bilin, Nrm_add, P1, P2) and LAST (Part B: reflection
— iota_mul, iota_assoc_iff, base_assoc_of_image_assoc) are BANKED, gate-green (7ab52b1).
This node = the MIDDLE third: `H : Nrm mult on CD A ⟹ A associative`, non-vacuously.
Runs 26/27 timed out building Parts A+B uncommitted; run 28 banked them. The single-
associator-witness route is REFUTED 3 independent ways (do NOT retry).

## Numerics with teeth re-verified THIS run (exact rational, S=CD(O), O=CD(H)):
- scaling_law.py: left/right scaling L(x,y)=x·(x̄·y)−ι(Nrm x)·y holds 0/300 on O (base
  assoc), FAILS 300/300 on S (base non-assoc). Base-associativity-equivalent.  ✓
- scaling_reflect_verify.py: ★ THE REFLECTION (H-free, structural, k=±1, 400/400):
    R2:  Lpol(ιa, ιb·e2; ιc)   = (0, [a,b,c]_A)         [associator in im-coord]
    R1:  Lpol(ιa, ιb·e2; ιc·e2) = −ι([a,b,c]_A)         [associator in re-coord]
  where Lpol(x1,x2,y):=L(x1+x2,y)−L(x1,y)−L(x2,y). So L≡0 ⟹ [a,b,c]_A≡0 (ι injective).
- pin_H.py / lock_identities.py: ★ THE POLARIZATION CORE. bilin(L(x,y),w)=0 ∀w on O (H),
  FAILS 300/300 on S (no H). Decomposes as:
    (i)   bilin(x·(x̄·y), w) = bilin(x̄·y, x̄·w)              [H-FREE, 0/300 both O,S]
    (ii)  bilin(x̄·y, x̄·w)  = Nrm(x̄)·bilin(y,w)             [= banked P2 with z=x̄; uses H]
    (iii) bilin(ι(Nrm x)·y, w) = Nrm x · bilin(y,w)          [H-FREE, 0/300 both]
    (iv)  Nrm(x̄) = Nrm x                                     [H-FREE, 0/300 both]
    (cen) Nrm x central in base                              [H-FREE, 0/300 both]
  ⟹ bilin(L(x,y),w) = (Nrm x̄ − Nrm x)·bilin(y,w) = 0. ONLY H-step is banked P2. ✓
- closing_chain.py / adjoint_probe.py: NO clean single-witness; obstruction is irreducibly
  bilinear-3-element. The bilin+nondegeneracy route is the honest one (confirms parent).

## THE CRUX (typeclass, make-or-break)
P1/P2/Nrm_add are banked over `[Ring A]` (base associative) ⟹ "A associative" is VACUOUS.
The non-vacuous home is a base WITHOUT assumed associativity: `[NonAssocRing A][StarRing A]`
(NonAssocRing has distributivity + 1 but NOT mul_assoc). The conclusion `∀ a b c : A,
(a*b)*c=a*(b*c)` is then real content. Sub-question to TEST in scratch: do the Part-A
proofs (add_mul', mul_add', Nrm_add, P1, P2) port from [Ring A] to [NonAssocRing A]?
(They use only base distributivity + abel + H + add_left_cancel — NOT base mul_assoc — so
they SHOULD port. Verify, do not assume.) Conclusion stated as a Prop, NOT an instance, to
avoid NonAssocRing/Ring diamond on CD A.

## GO / NO-GO (frozen)
GO to bank a piece iff it compiles foundations-only (#print axioms ⊆ {propext,Classical.
choice,Quot.sound}) AND its costume bites. Pieces, in priority order (bank each that closes):
  M-RFL ★ THE REFLECTION (H-free): `(∀ x y, L x y = 0) → ∀ a b c, (a*b)*c=a*(b*c)`, via R2.
         Cleanest, H-free, structural — the alternativity analogue of Part B.
  M-GEN  Generalize Part-A typeclass [Ring A]→[NonAssocRing A] (only if it compiles clean;
         this strengthens the banked lemmas, must not break their proofs or the gate).
  M-CORE ★ THE POLARIZATION CORE (H): `H → ∀ x y w, bilin (L x y) w = 0`, via (i)+P2+(iii)+(iv).
  M-IFF  Full closure: M-CORE + nondegeneracy (bilin(L,·)=0 ⟹ L=0) + M-RFL ⟹ A associative;
         assemble `Nrm mult on CD A ⟺ A associative`; recover genNrm_not_mul_at_S as corollary.

## DECISION RULE (W1-step3 / W3)
Attempt M-IFF (full closure). If nondegeneracy (bilin(L,·)=0 ⟹ L=0) does NOT close cleanly
THIS run (it requires nondegeneracy of bilin on CD A, which reduces by recursion to the base
form — a substantial sub-development), then DECOMPOSE: bank M-RFL + M-CORE (+ M-GEN if clean),
child the nondegeneracy/closure as the immediate next node, link onto the chain tail, complete
THIS task as "decomposed: reflection + polarization core banked, nondegeneracy-closure childed."
Bank ONLY genuinely-forced foundations-only content; NEVER a shell-as-iff; LEDGER keeps the iff
explicitly OWED until M-IFF lands.

## KILL (a fight = INSTRUMENT failure, return to trunk; never patch)
  K1. If generalizing Part-A to [NonAssocRing A] FIGHTS (a proof secretly used base mul_assoc),
      do NOT force it — keep Part A at [Ring A], state the middle's NEW lemmas over the weaker
      class directly, re-deriving only what the middle needs. The fight = wrong instrument.
  K2. Do NOT retry the single-associator-witness route (refuted). Do NOT import Mathlib's
      Hurwitz/CompositionAlgebra/normed-division classification (POSITS the iff — drift trap).
  K3. Do NOT weaken to a vacuous statement (base [Ring A] ⟹ conclusion trivial). If the only
      thing that compiles is vacuous, that is NOT progress — child the real statement instead.
  K4. If nondegeneracy fights, return to the trunk: bilin IS the Born self-overlap positivity;
      its nondegeneracy is the trunk's positivity. Reduce to the base form by recursion, base
      case ℚ (Euclidean). Do NOT posit nondegeneracy as a hypothesis on a general base.

## Costume that BITES (ONE row, scripts/costume_manifest.tsv)
A WRONG middle claim must FAIL to compile. Candidate: "CD A stays alternative for a non-
associative base" i.e. assert `L x y = 0` (scaling law) holds on S ℚ at a concrete witness
where it does NOT → false numeric core. OR assert the reflection with a WRONG coefficient
(e.g. Lpol(ιa,ιbe2;ιc) = 0 unconditionally, ignoring the associator) → fails at a non-assoc
witness in O ℚ. Pick the one matching whatever lands; it must reduce to a clean false core.

## Single-flight (W4): this is the chain tail (children:[] verified at orient). Do not fork.
