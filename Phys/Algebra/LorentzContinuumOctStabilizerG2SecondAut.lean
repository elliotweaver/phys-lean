/-
  Phys.Algebra.LorentzContinuumOctStabilizerG2SecondAut — N140: A SECOND INDEPENDENT
  NON-IDENTITY G₂ AUTOMORPHISM — the INNER Cayley–Dickson involution `octInnerNeg`, a concrete
  octonion algebra-automorphism of the terminal algebra `O Cut` that is DISTINCT from N139's
  `octTopNeg`, embedded into the observer-plane gauge stabilizer `octStab` (N137), proving the
  gauge group G₂ = Aut(O) ⊂ SO(8) ⊂ stabilizer of `SO⁺(1,9)` is STRICTLY LARGER THAN ℤ/2 (it
  has ≥ 3 elements: `id`, `octTopNeg`, `octInnerNeg`), over the derived ℝ `Cut`, the terminal
  algebra `O Cut := CD (H Cut)`, `H Cut := CD (Dbl Cut)`, the spacetime `STVC = Cut × Cut × O Cut`,
  the indefinite Minkowski form `BvC` (signature (1,9)).

  ===========================================================================
  CONTEXT. N139 SEEDED the gauge-group non-triviality with ONE concrete non-identity octonion
  algebra-automorphism (`octTopNeg ⟨a,b⟩ = ⟨a,−b⟩`, the OUTER Cayley–Dickson top-half negation,
  `≠ id`, moving the doubling generator `e₂ ↦ −e₂`, landing in `octStab`). From what was banked,
  the gauge group could still have been exactly ℤ/2 = {id, octTopNeg}. W4.5 SUFFICIENCY: this
  node does NOT re-pin the inclusion — it ADVANCES to the FORWARD joint the ROADMAP §N140 (i)
  names: exhibiting a SECOND concrete automorphism DISTINCT from `octTopNeg`, pinning the gauge
  group as STRICTLY MORE THAN ℤ/2 — a second independent non-identity direction toward the full
  14-dim G₂.

  ── THE TRUNK REFRAME (W1 step 2 / THE ONE LAW — the N139 model, one rung down) ──
  The terminal algebra is a LAYERED Cayley–Dickson double: `O Cut = CD (H Cut)`,
  `H Cut = CD (Dbl Cut)`. N139's `octTopNeg` negates the OUTER `im`-half (the `H`-components). The
  SECOND independent involution `octInnerNeg` applies the H-RUNG top-half negation
  `hTopNeg ⟨p,q⟩ = ⟨p,−q⟩` (p,q ∈ `Dbl Cut`) COMPONENTWISE to each `H`-component of an octonion:
  `octInnerNeg ⟨a,b⟩ = ⟨hTopNeg a, hTopNeg b⟩`. It is the SAME canonical, series-free, order-2
  Cayley–Dickson involution N139 used — applied one rung down, then lifted componentwise. NO
  `tsum`, NO exponential, NO W9 instrument-wall risk.

  ── WHY IT IS A GENUINE AUTOMORPHISM ──
  `hTopNeg : H Cut → H Cut` is additive, unital, `Cut`-linear, MULTIPLICATIVE (the two top-half
  sign flips cancel in `.re`, combine in `.im` — N139's `octTopNegFun_mul`, one rung down), and
  STAR-COMMUTING (`hTopNeg (star p) = star (hTopNeg p)`, both flips agree). The COMPONENTWISE LIFT
  `F⟨a,b⟩ = ⟨f a, f b⟩` of any `*`-algebra automorphism `f` (additive + multiplicative + unital +
  star-commuting) is an automorphism of the double: in `(z·w).re = z.re·w.re − star(w.im)·z.im`,
  `f` distributes over `−`, `·`, and `star`, so `F(z·w) = Fz·Fw`. Hence `octInnerNeg` is an
  `IsAlgAutCut` (N41f) and plugs DIRECTLY into N138's `octBlockEndC_autC_mem_octStab`.

  ── INDEPENDENCE (the forward content — "strictly more than ℤ/2") ──
  `octTopNeg` NEGATES `e₂ = ⟨0,1⟩` (its outer `im`-half) and FIXES the inner generator
  `innerGen = ι(e₂_H) = ⟨e₂_H, 0⟩` (its outer `im`-half is 0). `octInnerNeg` does the OPPOSITE:
  it FIXES `e₂` (since `hTopNeg 1_H = 1_H`, and `e₂`'s `im`-half is `1_H`) and NEGATES `innerGen`
  (`hTopNeg e₂_H = −e₂_H`). So on `innerGen`: `octInnerNeg ≠ id` (`octInnerNeg innerGen = −innerGen
  ≠ innerGen`); and on `e₂`: `octInnerNeg ≠ octTopNeg` (`octInnerNeg e₂ = e₂`, `octTopNeg e₂ = −e₂`).
  Three DISTINCT gauge elements `{id, octTopNeg, octInnerNeg}` — the gauge group is STRICTLY larger
  than the ℤ/2 N139 alone pinned.

  ── WHAT THIS NODE BANKS ──
  `hTopNegFun` / `hTopNegFun_re` / `hTopNegFun_im` — the H-rung top-half negation and components.
  `hTopNegFun_add` / `hTopNegFun_neg` / `hTopNegFun_one` / `hTopNegFun_star` — its `*`-algebra
    structure (additive, unital, conjugation-commuting).
  ★ `hTopNegFun_mul` — MULTIPLICATIVE at the H rung (the inner involution is an algebra map).
  `octInnerNegFun` / `octInnerNegFun_re` / `octInnerNegFun_im` — the componentwise lift to `O Cut`.
  ★ `octInnerNegFun_mul` — MULTIPLICATIVE (the lift of a `*`-automorphism is a double automorphism).
  `octInnerNegFun_one` — UNITAL.
  `octInnerNeg` — the `Cut`-linear EQUIVALENCE (additive + smul, self-inverse involution) +
    `octInnerNeg_apply`.
  ★ `octInnerNeg_isAlgAut` — THE HEADLINE: `octInnerNeg` is an octonion algebra-automorphism
    `IsAlgAutCut`.
  `innerGen` — the inner doubling generator `ι(e₂_H)` embedded into `O Cut`.
  `octInnerNeg_innerGen` — it MOVES the inner generator: `octInnerNeg innerGen = −innerGen`.
  `octInnerNeg_e2` — it FIXES the OUTER generator: `octInnerNeg e₂ = e₂` (the discriminator from
    `octTopNeg`, which negates it).
  ★ `octInnerNeg_ne_refl` — NON-IDENTITY: `octInnerNeg ≠ id` (it moves `innerGen`).
  ★★ `octInnerNeg_ne_octTopNeg` — INDEPENDENCE: `octInnerNeg ≠ octTopNeg` (they act oppositely on
    `e₂` — the SECOND independent non-identity direction; the gauge group is strictly larger than ℤ/2).
  ★★ `octBlockEndC_octInnerNeg_mem_octStab` — the octonion-block embedding of the second concrete
    non-identity automorphism lands in the gauge stabilizer `octStab` (a second real gauge element).
  W8 (the costume anchor): `octInnerNeg_gFormC_e2_eq_one` (the second gauge automorphism FIXES `e₂`
    and preserves its Born self-overlap `= 1`).

  THE MOAT (docs/STANDARD.md §0). The literature POSITS the gauge group AND its dimension (14
  generators) as independent physical inputs. Here the gauge group is the DERIVED observer-plane
  stabilizer (N137), its G₂ subgroup the DERIVED octonion automorphism group (N138), N139 SEEDED
  its non-triviality with one concrete element, and THIS node pins it as STRICTLY LARGER THAN ℤ/2
  with a SECOND independent automorphism CONSTRUCTED from the cascade's OWN layered Cayley–Dickson
  doubling (the inner involution, one rung below N139's outer one) — no posited gauge group, no
  posited G₂, no posited automorphism, no Mathlib ℝ/ℂ as content, no bridge.

  Physics-words-removable: delete "gauge / G₂ / SO(8) / automorphism / Aut / Lorentz / stabilizer /
  octonion / observer / independence / non-triviality" → over the derived complete ordered field
  `Cut`, `O Cut := CD (H Cut)`, `H Cut := CD (Dbl Cut)`, `STVC = Cut × Cut × O Cut`: the
  componentwise map `⟨⟨p,q⟩,⟨r,s⟩⟩ ↦ ⟨⟨p,−q⟩,⟨r,−s⟩⟩` is a multiplicative-and-unital `Cut`-linear
  self-equiv of `O Cut`, NOT the identity (it sends `⟨⟨0,1⟩,0⟩` to `⟨⟨0,−1⟩,0⟩`), DISTINCT from the
  map `⟨a,b⟩ ↦ ⟨a,−b⟩` (they differ on `⟨0,1⟩`), and its block embedding `(t,x,v) ↦ (t,x,octInnerNeg v)`
  lies in the submonoid of `BvC`-isometries fixing `(1,0,0)` and `(0,1,0)`. No theorem statement
  needs a physics word.
-/
import Phys.Algebra.LorentzContinuumOctStabilizerG2Nontrivial

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## The H-rung top-half negation — the INNER canonical series-free order-2 involution. -/

/-- The top-half negation on the rung-2 algebra `H Cut = CD (Dbl Cut)`: fix the `re` half, negate
    the `im` half. The cascade's OWN inner doubling carries this involution — the same canonical
    Cayley–Dickson order-2 map N139 used, one rung down. -/
def hTopNegFun (p : H Cut) : H Cut := ⟨p.re, -p.im⟩

@[simp] theorem hTopNegFun_re (p : H Cut) : (hTopNegFun p).re = p.re := rfl
@[simp] theorem hTopNegFun_im (p : H Cut) : (hTopNegFun p).im = -p.im := rfl

/-- ADDITIVE. -/
theorem hTopNegFun_add (p q : H Cut) :
    hTopNegFun (p + q) = hTopNegFun p + hTopNegFun q := by
  apply CD.ext
  · simp [hTopNegFun]
  · simp only [hTopNegFun, CD.add_im]; abel

/-- Commutes with negation. -/
theorem hTopNegFun_neg (p : H Cut) : hTopNegFun (-p) = -hTopNegFun p := by
  apply CD.ext <;> simp [hTopNegFun]

/-- UNITAL: `hTopNeg 1 = ⟨1,−0⟩ = 1`. -/
theorem hTopNegFun_one : hTopNegFun (1 : H Cut) = 1 := by
  apply CD.ext <;> simp [hTopNegFun]

/-- ★ MULTIPLICATIVE at the H rung (the two top-half sign flips cancel in `.re`, combine in `.im`). -/
theorem hTopNegFun_mul (p q : H Cut) :
    hTopNegFun (p * q) = hTopNegFun p * hTopNegFun q := by
  apply CD.ext
  · simp [hTopNegFun, CD.mul_re]
  · show -(p * q).im = (hTopNegFun q).im * (hTopNegFun p).re
        + (hTopNegFun p).im * star (hTopNegFun q).re
    simp only [hTopNegFun, CD.mul_im]
    rw [neg_add]
    congr 1
    · exact (neg_mul q.im p.re).symm
    · exact (neg_mul p.im (star q.re)).symm

/-- STAR-COMMUTING: `hTopNeg (star p) = star (hTopNeg p)` (both top-half flips agree). -/
theorem hTopNegFun_star (p : H Cut) : hTopNegFun (star p) = star (hTopNegFun p) := by
  apply CD.ext <;> simp [hTopNegFun]

/-! ## The inner negation on `O Cut` — the componentwise lift of `hTopNeg`. -/

/-- The INNER Cayley–Dickson involution on the terminal algebra `O Cut = CD (H Cut)`: apply the
    H-rung top-half negation `hTopNeg` componentwise to each `H`-component. The componentwise lift
    of a `*`-algebra automorphism is an automorphism of the double. -/
def octInnerNegFun (z : O Cut) : O Cut := ⟨hTopNegFun z.re, hTopNegFun z.im⟩

@[simp] theorem octInnerNegFun_re (z : O Cut) : (octInnerNegFun z).re = hTopNegFun z.re := rfl
@[simp] theorem octInnerNegFun_im (z : O Cut) : (octInnerNegFun z).im = hTopNegFun z.im := rfl

/-- ★ MULTIPLICATIVE: the lift of the `*`-automorphism `hTopNeg` is a double automorphism — in
    `(z·w).re = z.re·w.re − star(w.im)·z.im`, `hTopNeg` distributes over `−`, `·`, and `star`. -/
theorem octInnerNegFun_mul (z w : O Cut) :
    octInnerNegFun (z * w) = octInnerNegFun z * octInnerNegFun w := by
  apply CD.ext
  · show hTopNegFun ((z * w).re) = (octInnerNegFun z).re * (octInnerNegFun w).re
        + -(star (octInnerNegFun w).im * (octInnerNegFun z).im)
    simp only [octInnerNegFun_re, octInnerNegFun_im, CD.mul_re]
    rw [hTopNegFun_add, hTopNegFun_mul, hTopNegFun_neg, hTopNegFun_mul, hTopNegFun_star]
  · show hTopNegFun ((z * w).im) = (octInnerNegFun w).im * (octInnerNegFun z).re
        + (octInnerNegFun z).im * star (octInnerNegFun w).re
    simp only [octInnerNegFun_re, octInnerNegFun_im, CD.mul_im]
    rw [hTopNegFun_add, hTopNegFun_mul, hTopNegFun_mul, hTopNegFun_star]

/-- UNITAL. -/
theorem octInnerNegFun_one : octInnerNegFun (1 : O Cut) = 1 := by
  apply CD.ext
  · show hTopNegFun (1 : O Cut).re = (1 : O Cut).re
    rw [CD.one_re, hTopNegFun_one]
  · show hTopNegFun (1 : O Cut).im = (1 : O Cut).im
    rw [CD.one_im]
    apply CD.ext <;> simp [hTopNegFun]

/-- The inner negation as a `Cut`-linear EQUIVALENCE — additive and `Cut`-homogeneous
    (componentwise `+`/`•`), a self-inverse involution. -/
def octInnerNeg : O Cut ≃ₗ[Cut] O Cut where
  toFun := octInnerNegFun
  map_add' x y := by
    apply CD.ext
    · show hTopNegFun (x + y).re = hTopNegFun x.re + hTopNegFun y.re
      simp only [CD.add_re]; exact hTopNegFun_add x.re y.re
    · show hTopNegFun (x + y).im = hTopNegFun x.im + hTopNegFun y.im
      simp only [CD.add_im]; exact hTopNegFun_add x.im y.im
  map_smul' r x := by
    apply CD.ext
    · show hTopNegFun (r • x).re = (r • octInnerNegFun x).re
      simp only [CD.genSmul_re, octInnerNegFun]
      apply CD.ext
      · simp [hTopNegFun, CD.genSmul_re]
      · simp only [hTopNegFun, CD.genSmul_im]; rw [smul_neg]
    · show hTopNegFun (r • x).im = (r • octInnerNegFun x).im
      simp only [CD.genSmul_im, octInnerNegFun]
      apply CD.ext
      · simp [hTopNegFun, CD.genSmul_re]
      · simp only [hTopNegFun, CD.genSmul_im]; rw [smul_neg]
  invFun := octInnerNegFun
  left_inv x := by apply CD.ext <;> (apply CD.ext <;> simp [hTopNegFun, octInnerNegFun])
  right_inv x := by apply CD.ext <;> (apply CD.ext <;> simp [hTopNegFun, octInnerNegFun])

@[simp] theorem octInnerNeg_apply (z : O Cut) : octInnerNeg z = octInnerNegFun z := rfl

/-- ★ THE HEADLINE: the inner negation is an octonion ALGEBRA-AUTOMORPHISM (`IsAlgAutCut` —
    multiplicative and unital `Cut`-linear self-equiv, N41f). A second concrete member of
    G₂ = Aut(O). -/
theorem octInnerNeg_isAlgAut : IsAlgAutCut octInnerNeg := by
  refine ⟨?_, ?_⟩
  · intro x y; simp only [octInnerNeg_apply]; exact octInnerNegFun_mul x y
  · simp only [octInnerNeg_apply]; exact octInnerNegFun_one

/-! ## INDEPENDENCE: `octInnerNeg` is a SECOND non-identity direction, distinct from `octTopNeg`. -/

/-- The inner doubling generator: the H-rung generator `e₂_H = ⟨0,1⟩ ∈ H Cut` embedded into `O Cut`
    via `ι` as `⟨e₂_H, 0⟩` (its OUTER `im`-half is 0, so `octTopNeg` fixes it). -/
def innerGen : O Cut := CD.iota (CD.e2 : H Cut)

/-- `octInnerNeg` MOVES the inner generator to its negative (it negates the inner `im`-half). -/
theorem octInnerNeg_innerGen : octInnerNeg innerGen = -innerGen := by
  apply CD.ext
  · show hTopNegFun (innerGen.re) = (-innerGen).re
    rw [CD.neg_re]
    show hTopNegFun (CD.e2 : H Cut) = -(CD.e2 : H Cut)
    apply CD.ext <;> simp [hTopNegFun, CD.e2]
  · show hTopNegFun (innerGen.im) = (-innerGen).im
    rw [CD.neg_im]
    show hTopNegFun (0 : H Cut) = -(0 : H Cut)
    apply CD.ext <;> simp [hTopNegFun]

/-- `octInnerNeg` FIXES the OUTER doubling generator `e₂` (since `hTopNeg 1_H = 1_H` and `e₂`'s
    `im`-half is `1_H`). The discriminator from `octTopNeg`, which sends `e₂ ↦ −e₂`. -/
theorem octInnerNeg_e2 : octInnerNeg (CD.e2 : O Cut) = (CD.e2 : O Cut) := by
  apply CD.ext
  · show hTopNegFun ((CD.e2 : O Cut).re) = (CD.e2 : O Cut).re
    rw [CD.e2_re]
    apply CD.ext <;> simp [hTopNegFun]
  · show hTopNegFun ((CD.e2 : O Cut).im) = (CD.e2 : O Cut).im
    rw [CD.e2_im, hTopNegFun_one]

/-- ★ NON-IDENTITY: `octInnerNeg ≠ id`. It moves `innerGen` to `−innerGen`, and `innerGen ≠ −innerGen`
    because the inner `im` coordinate is the unit `1` whose innermost real is `1 ≠ −1` over the
    derived field `Cut` (characteristic 0). -/
theorem octInnerNeg_ne_refl : octInnerNeg ≠ LinearEquiv.refl Cut (O Cut) := by
  intro h
  have he : octInnerNeg innerGen = innerGen := by rw [h]; rfl
  rw [octInnerNeg_innerGen] at he
  have hre := congrArg (fun z => (z : O Cut).re) he
  simp only at hre
  -- `(-innerGen).re = innerGen.re` ⟹ `-(e₂_H) = e₂_H` in `H Cut`
  have hgen : -(CD.e2 : H Cut) = (CD.e2 : H Cut) := by
    have := hre; simpa [innerGen, CD.iota, CD.neg_re] using this
  have him := congrArg (fun (p : H Cut) => p.im) hgen
  simp only [CD.neg_im, CD.e2_im] at him
  -- `-(1 : Dbl Cut) = 1` ⟹ innermost `-1 = 1` over `Cut`
  have hc := congrArg (fun (d : Dbl Cut) => d.re) him
  simp only at hc
  norm_num [Dbl.neg_re, Dbl.one_re] at hc

/-- ★★ INDEPENDENCE: `octInnerNeg ≠ octTopNeg`. They act OPPOSITELY on `e₂`: `octInnerNeg e₂ = e₂`
    but `octTopNeg e₂ = −e₂`, and `e₂ ≠ −e₂` (char `Cut` = 0). The SECOND independent non-identity
    direction — the gauge group G₂ = Aut(O) is STRICTLY LARGER than the ℤ/2 = {id, octTopNeg} that
    N139 alone pinned. -/
theorem octInnerNeg_ne_octTopNeg : octInnerNeg ≠ octTopNeg := by
  intro h
  have he : octInnerNeg (CD.e2 : O Cut) = octTopNeg (CD.e2 : O Cut) := by rw [h]
  rw [octInnerNeg_e2, octTopNeg_e2] at he
  -- `e₂ = −e₂` ⟹ innermost `1 = −1` over `Cut`
  have him := congrArg (fun z => (z : O Cut).im) he
  simp only [CD.neg_im, CD.e2_im] at him
  have hc := congrArg (fun (q : H Cut) => q.re.re) him
  simp only at hc
  norm_num [CD.neg_re, CD.one_re, Dbl.neg_re, Dbl.one_re] at hc

/-! ## THE SECOND GAUGE ELEMENT: the concrete distinct automorphism lands in the stabilizer. -/

/-- ★★ The octonion-block embedding of the SECOND concrete non-identity automorphism `octInnerNeg`
    lands in the observer-plane gauge stabilizer `octStab` (N137) — a second real gauge element,
    distinct from N139's `octTopNeg`. The gauge group G₂ = Aut(O) ⊂ SO(8) ⊂ the stabilizer of
    `SO⁺(1,9)` has at least TWO non-identity members and so is strictly larger than ℤ/2. -/
theorem octBlockEndC_octInnerNeg_mem_octStab :
    IsOctStab (octBlockEndC ((octInnerNeg : O Cut →ₗ[Cut] O Cut))) :=
  octBlockEndC_autC_mem_octStab octInnerNeg_isAlgAut

/-! ## W8 (genuine non-vacuity / the costume anchor). -/

/-- W8 anchor (the costume `C172` reads off this `1`): the SECOND gauge automorphism FIXES `e₂`
    and preserves its Born self-overlap, which is `1` (the unit octonion `e₂` has Born norm `1`). -/
theorem octInnerNeg_gFormC_e2_eq_one :
    gFormC (octInnerNeg (CD.e2 : O Cut)) (octInnerNeg (CD.e2 : O Cut)) = 1 := by
  rw [octInnerNeg_e2]
  simp [gFormC, reQC, CD.e2, CD.mul_re, CD.star_re, CD.star_im]

end

end Phys.Algebra
