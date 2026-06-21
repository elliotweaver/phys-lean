# N2d MIDDLE — RUN 30 FINDINGS (decompose: Part C banked, polarization core childed)

## What this run BANKED (committed ed65812, gate-green, foundations-only)

### ★ PART C — THE SCALING-LAW REFLECTION (Phys/Cascade/ForcedStop.lean, namespace CD)
Over a GENUINELY non-associative base `[NonAssocRing A] [StarRing A]` (non-vacuous):
  • `scal_im_assoc (a b c : A)` : the new-dimension component of `⟨a,b⟩·(star⟨a,b⟩·ι c)`
    equals the ι-scaling value PLUS the *-associator `b·(star c·a) − (b·star c)·a`. The
    scaling defect in the new dimension IS a base associator. #print axioms = [propext,
    Quot.sound].
  • `assoc_of_scaling (Scal : ∀ x y, x·(star x·y) = ι(Nrm x)·y) : A associative`. The
    LEFT scaling law forces base associativity — the alternativity analogue of Part B's
    `iota_assoc_iff`, reaching the e₂-mixing content base-IMAGE reflection (Part B) could
    not. Proof: evaluate Scal at x=⟨c,a⟩, y=ι(star b), read .im through scal_im_assoc, the
    base associator is forced to 0. #print axioms = [propext, Quot.sound].
Costume C14 (`ForcedStopMiddleScalingNonAssocCostume.lean`): the scaling law asserted on
the non-assoc base `O ℚ` at witness X=⟨ι(ιJ),ι e₂⟩, Y=ι e₂ → proved helpers LHS proj `2`,
RHS proj `0` → false core `2=0`. Bites: assoc_of_scaling genuinely USES non-associativity.

## What this run VERIFIED foundations-only but did NOT bank (saved for the child node)
`workbench/N2d-forced-stop/VERIFIED_polar_core_lemmas.lean` (both [propext, Quot.sound]):
  • `star_add_self : z + star z = iota (bilin z 1)` — the conjugation-TRACE relation
    (trace lands in the base). Structural, H-free.
  • `P2_polar (H) : bilin(z·x)(w·y) + bilin(w·x)(z·y) = bilin z w · bilin x y` — the FULL
    POLARIZATION of banked P2 (both slots), forced by multiplicativity. Derived from
    P2 + Nrm_add + add_mul' + bilin biadditivity by additive-group cancellation (abel).
These are NOT banked into production this run (they belong with the core they serve) but
they compile clean and are the verified next bricks for the child.

## THE REMAINING GAP (childed): the polarization core `H ⟹ scaling law on CD A`
The single forward implication left in the middle third. Numerics (this run + run 29,
re-verified exact rational on the cascade C/H/O/S):
  • scaling_doubled.py: scaling law on `CD A` holds 0/300 on C,H,O (A assoc) and FAILS
    300/300 on S,SS (A non-assoc). So scaling-on-CD-A ⟺ A-associative — confirms the
    reflection direction is the genuine content; the FORWARD H⟹scaling needs H.
  • The clean Hurwitz chain (pin_H.py) is:
      bilin(L(x,y),w) = bilin(x·(x̄·y),w) − bilin(ι(Nrm x)·y,w)
        = [ADJOINT, u=x]  bilin(x̄·y, x̄·w) − Nrm x·bilin(y,w)
        = [P2, banked]    Nrm(x̄)·bilin(y,w) − Nrm x·bilin(y,w)
        = [star-inv]      0,
    then NONDEGENERACY of bilin ⟹ L = 0 (the scaling law), which assoc_of_scaling
    reflects to base associativity.
  • ★ THE HARD STEP — the ADJOINT IDENTITY `bilin(u·v,w) = bilin(v, star u·w)` is NOT a
    bare-ring identity: adj_structure.py shows it FAILS 296/300 on `CD(M₂(ℚ))` (an
    associative non-commutative *-ring whose self-overlaps are NOT central) and holds
    0/500 on every cascade rung. It requires the cascade's CENTRALITY (trace a+star a and
    norm a·star a central) — THE TRUNK: Born = self-overlap = CENTRAL positivity. Same W5
    lesson the FORWARD half hit (abstract "assoc+central" insufficient; need base = a
    double `CD B`).
  • NONDEGENERACY reduces at the scalar level (nondegen_reduce.py: the scalar Born trace
    form is Euclidean/positive-definite up the tower) but the A-VALUED bilin nondegeneracy
    used to cancel `(Nrm x̄ − Nrm x)·bilin(y,w) = 0 ⟹ ...` into `L = 0` is the substantial
    sub-development.

## SCOPE DECISION (frozen, executed): GO-DECOMPOSE (PREREG_MIDDLE / W3)
Bank Part C (the reflection — the genuine "alternative ⟹ base-associative" core, the
e₂-mixing reflection Part B could not reach; foundations-only, costume bites). CHILD the
polarization core `H ⟹ scaling law on CD A` (needs: the adjoint identity over the
cascade's centrality structure + A-valued bilin nondegeneracy; verified bricks star_add_self
+ P2_polar ready). Link onto the chain tail. Complete THIS task "decomposed: reflection
banked, polarization core childed." LEDGER keeps the forced iff explicitly OWED.

## KILL respected
No single-witness retry (refuted). No Mathlib Hurwitz/CompositionAlgebra import. Part C is
over the general NON-associative base (non-vacuous; base [Ring A] would trivialize the
conclusion). The adjoint's failure on a non-central ring is the INSTRUMENT pointing at the
trunk's centrality — childed rather than forcing a false general-ring identity (THE ONE LAW).
