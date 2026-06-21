# N2d MIDDLE — RUN 29 FINDINGS (frozen before production Lean)

## What this run ESTABLISHED (exact rational + Lean-verified)

### ★ THE REFLECTION — BUILT, foundations-only, GENERAL non-associative base
`assoc_of_scaling` : over `[NonAssocRing A] [StarRing A]` (NO associativity assumed —
non-vacuous, the contrapositive's base can be non-associative):
    (∀ x y : CD A, x * (star x * y) = iota (Nrm x) * y)  →  A is associative.
i.e. the LEFT SCALING LAW (the alternativity/composition law in its scaling form) forces
the base to associate. Proof is the structural im-identity `scal_im_assoc`:
    (⟨a,b⟩ * (star ⟨a,b⟩ * iota c)).im
      = (iota (Nrm ⟨a,b⟩) * iota c).im + (b*(star c*a) - (b*star c)*a)
evaluated at x=⟨c,a⟩, y=iota(star b): the new-dimension component of the scaling defect IS
the base associator [a,b,c]. ι injective ⟹ associator = 0. #print axioms = {propext,
Quot.sound}. THIS IS THE HEART OF THE MIDDLE THIRD ("CD A alternative ⟹ base associative",
the alternativity analogue of Part B's reflection) — and it is GENERAL and CLEAN.

### THE POLARIZATION CORE (H ⟹ scaling law) — genuinely structure-specific (W5/THE ONE LAW)
The remaining gap is `H : Nrm mult on CD A ⟹ scaling law L(x,y)=0`. Numerics pinned the
classical Hurwitz chain (pin_H.py, lock_identities.py, exact rational on O/S):
    bilin(L(x,y),w) = (i) bilin(x·(x̄·y),w)  −  bilin(ι(Nrm x)·y,w)
                    = [adjoint, u=x] bilin(x̄·y, x̄·w)  −  Nrm x · bilin(y,w)
                    = [P2, banked]   Nrm(x̄)·bilin(y,w)  −  Nrm x·bilin(y,w)
                    = [star-inv]     0.
Then nondegeneracy of bilin ⟹ L=0. BUT:
  ★ THE ADJOINT IDENTITY  bilin(u·v,w) = bilin(v, star u·w)  IS NOT a bare-ring identity.
    adj_structure.py: it FAILS 296/300 on CD(M₂(ℚ)) (associative non-commutative *-ring,
    star=transpose, self-overlaps NOT central) and holds 0/500 on every cascade rung
    C/H/O/S. It needs the cascade's CENTRALITY (trace a+star a and norm a·star a central —
    fails 281/300, 272/300 on M₂(ℚ) but holds on the cascade). THIS IS THE TRUNK: Born =
    self-overlap = CENTRAL positivity. So the polarization core is NOT a general *-ring
    fact; it requires the doubled-base centrality structure (same W5 lesson the parent hit
    for the FORWARD half: "assoc+central" abstract hypothesis insufficient, need base=CD B).
  ★ Nondegeneracy reduces cleanly at the SCALAR level: nondegen_reduce.py — the scalar Born
    trace form T(v,w)=projre(v·w̄+w·v̄)=2⟨v,w⟩ is Euclidean (positive definite) all the way up
    the tower — manifestly nondegenerate. But the A-VALUED bilin nondegeneracy + the adjoint
    centrality is the substantial part.

## SCOPE DECISION (frozen): GO-DECOMPOSE (PREREG_MIDDLE decision rule, W3)
Bank `scal_im_assoc` + `assoc_of_scaling` (the reflection — the genuine "alternative ⟹
base-associative" core of the middle third, foundations-only, general non-assoc base, costume
bites). CHILD the polarization core `H ⟹ scaling law` (requires the cascade's centrality: the
adjoint identity over the doubled base + A-valued bilin nondegeneracy) as the immediate next
node, link onto the chain tail, complete THIS task "decomposed: reflection banked, polarization
core childed." The LEDGER keeps the forced iff explicitly OWED. NEVER a shell-as-iff.

## Why this is genuine forced content, not a dodge
The reflection is the ALTERNATIVITY ANALOGUE OF PART B: Part B reflected base-IMAGE-triple
associativity to base associativity (iota a ring hom); this reflects the SCALING LAW (the
e₂-mixing content, the part Part B could NOT reach) to base associativity. Together with the
banked P1/P2 (Part A) and Part B, the ONLY remaining gap is the single forward implication
H ⟹ scaling-law — cleanly scoped, with the exact chain and the centrality requirement pinned.

## KILL respected: no single-witness retry; no Mathlib Hurwitz import; reflection is over the
general non-associative base (NOT vacuous — base [Ring A] would trivialize the conclusion).
The adjoint's failure on a bare ring is the INSTRUMENT telling us the core needs the trunk's
centrality — we childed it rather than forcing a false general-ring identity.
