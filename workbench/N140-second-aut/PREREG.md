# N140 PREREG — A SECOND INDEPENDENT NON-IDENTITY G₂ AUTOMORPHISM (frozen before compute)

## TARGET (measured against the chain, ROADMAP §N140 (i))
N139 SEEDED the gauge-group non-triviality with ONE concrete non-identity octonion
algebra-automorphism (`octTopNeg`, the outer Cayley–Dickson top-half negation, ≠ id, in
`octStab`). The ROADMAP §N140 (i) forward joint names EXACTLY: "whether MORE than one
INDEPENDENT non-identity direction exists — a SECOND concrete automorphism DISTINCT from
`octTopNeg` (e.g. a DIFFERENT Cayley–Dickson involution), pinning the gauge group as MORE
THAN ℤ/2."

THE TRUNK REFRAME (W1 step 2 / THE ONE LAW — the N139 model, one rung down): the terminal
algebra is a LAYERED Cayley–Dickson double `O Cut = CD (H Cut)`, `H Cut = CD (Dbl Cut)`.
N139's `octTopNeg ⟨a,b⟩ = ⟨a,−b⟩` negates the OUTER im-half (a,b ∈ H). The SECOND
independent involution `octInnerNeg` applies the H-LEVEL top-half negation
`hTopNeg ⟨p,q⟩ = ⟨p,−q⟩` (p,q ∈ Dbl Cut) COMPONENTWISE to each H-component:
`octInnerNeg ⟨a,b⟩ = ⟨hTopNeg a, hTopNeg b⟩`. It is series-free, trunk-native (the cascade's
OWN inner doubling), NO `tsum`, NO W9 risk — exactly N139's reframe applied one rung down.

## WHY IT IS A GENUINE AUTOMORPHISM (the math, before Lean)
`hTopNeg : H Cut → H Cut`, `⟨p,q⟩ ↦ ⟨p,−q⟩`, is (over any CD double):
  • ADDITIVE, UNITAL, Cut-LINEAR (componentwise, like N139's octTopNeg);
  • MULTIPLICATIVE — the two top-half sign flips cancel in `.re`, combine in `.im`
    (N139's `octTopNegFun_mul` argument, one rung down);
  • STAR-COMMUTING — `hTopNeg (star p) = ⟨star p.re, p.im⟩ = star (hTopNeg p)` (both flips agree).
The COMPONENTWISE LIFT `F⟨a,b⟩ = ⟨f a, f b⟩` of a *-algebra automorphism `f` (additive +
multiplicative + unital + star-commuting) of the base is an automorphism of the double:
  F(z·w).re = f(z.re·w.re − star(w.im)·z.im) = f(z.re)f(w.re) − star(f(w.im))f(z.im)
            = (Fz·Fw).re  [uses f-mul + f-star-comm + f-additive];  .im likewise. ∎
So `octInnerNeg` is an `IsAlgAutCut` ⇒ (N138 `octBlockEndC_autC_mem_octStab`) lands in `octStab`.

## INDEPENDENCE (the forward content — "more than ℤ/2")
THREE DISTINCT elements of the gauge group G₂ = Aut(O) ⊂ SO(8) ⊂ octStab:
  • `id`  (≠ octTopNeg, N139 `octTopNeg_ne_refl`);
  • `octTopNeg`  (negates `e₂ = ⟨0,1⟩` to `−e₂`; FIXES the inner generator `⟨e₂_H,0⟩`);
  • `octInnerNeg`  (FIXES `e₂` since hTopNeg 1_H = 1_H; NEGATES the inner generator
    `⟨e₂_H,0⟩` where `e₂_H = ⟨0,1⟩ ∈ H` to its negative).
WITNESSES:  octInnerNeg ≠ id  (it moves `⟨e₂_H,0⟩` ↦ `−⟨e₂_H,0⟩`);
            octInnerNeg ≠ octTopNeg  (on `e₂`: octInnerNeg `e₂` = `e₂`, octTopNeg `e₂` = `−e₂`).
Hence the gauge group has ≥ 3 elements — STRICTLY larger than the ℤ/2 = {id, octTopNeg} that
N139 alone pinned. A SECOND independent non-identity direction toward the full 14-dim G₂.

## GO / NO-GO
GO if: `octInnerNeg` is built as an `O Cut ≃ₗ[Cut] O Cut`, proved `IsAlgAutCut`
(`octInnerNeg_isAlgAut`), proved `≠ id` (`octInnerNeg_ne_refl`) AND `≠ octTopNeg`
(`octInnerNeg_ne_octTopNeg`), and its block embedding lands in `octStab`
(`octBlockEndC_octInnerNeg_mem_octStab`), all foundations-only (`#print axioms` ⊆
{propext, Classical.choice, Quot.sound}); costume C172 bites a WRONG second-automorphism /
independence / gauge claim reducing to a false numeric DISTINCT from C115 `1=7` … C171 `1=139`.
NO-GO / DECOMPOSE if: the componentwise-lift multiplicativity resists after the structured
hTopNeg lemmas (then bank the bankable hTopNeg *-automorphism pieces + child the lift).

## KILL (W9 — classify a fight as INSTRUMENT failure, not theory)
KILL = 90 s / single obligation. This is a LIGHT node (N139 was: full probe ~28s). NO inflated
`maxHeartbeats`, NO `tsum`, NO brute coordinate normalizer. If any single proof obligation
exceeds 90 s → STOP, it is an instrument signal the framing is wrong (decompose / reframe), NOT
a longer grind. The series-free involution REPLACES any heavy route entirely (the N139 lesson).

## COSTUME C172 (must BITE — W8)
A WRONG second-automorphism / independence claim. Anchor: octInnerNeg FIXES `e₂` and PRESERVES
its Born self-overlap = 1 (`octInnerNeg_gFormC_e2_eq_one`). Claiming it reads 140 forces `1 = 140`.
PASS_SIGNATURE ERE matches a trailing `1 = 140`; DISTINCT from C171 `1 = 139` and all banked.

## PHYSICS-WORDS-REMOVABLE
Delete gauge/G₂/SO(8)/automorphism/Aut/Lorentz/stabilizer/octonion/observer/independence/
non-triviality → over the derived complete ordered field `Cut`, `O Cut := CD (H Cut)`,
`H Cut := CD (Dbl Cut)`, `STVC = Cut×Cut×O Cut`: the componentwise map
`⟨⟨p,q⟩,⟨r,s⟩⟩ ↦ ⟨⟨p,−q⟩,⟨r,−s⟩⟩` is a multiplicative-and-unital Cut-linear self-equiv of
`O Cut`, NOT the identity, DISTINCT from `⟨a,b⟩↦⟨a,−b⟩`, and its block embedding lies in the
submonoid of `BvC`-isometries fixing `(1,0,0)` and `(0,1,0)`. No theorem statement needs a
physics word.
