/-
  Phys.Algebra.LorentzContinuumOctStabilizerG2Nontrivial — N139: THE FULL G₂ NONTRIVIALITY —
  a CONCRETE NON-IDENTITY octonion algebra-automorphism of the terminal algebra `O Cut`, embedded
  into the observer-plane gauge stabilizer `octStab` (N137), proving the G₂ = Aut(O) = Der(O) gauge
  group is GENUINELY NON-TRIVIAL (real non-identity content, NOT the trivial group {id}), over the
  derived ℝ `Cut`, the terminal algebra `O Cut := CD (H Cut)`, the spacetime `STVC = Cut × Cut × O Cut`,
  the indefinite Minkowski form `BvC` (signature (1,9)).

  ===========================================================================
  CONTEXT. N138 PINNED the G₂ IDENTITY of the gauge group: an octonion ALGEBRA-automorphism
  (`IsAlgAutCut φ`, N41f) is a `gFormC`-isometry (`autC_gFormC`) and its octonion-block embedding
  `octBlockEndC φ` lands in the observer-plane gauge stabilizer `octStab`
  (`octBlockEndC_autC_mem_octStab` — the G₂ = Aut(O) ⊂ SO(8) ⊂ stabilizer of `SO⁺(1,9)` inclusion).
  But N138's ONLY non-vacuity witness was the IDENTITY automorphism `expOEquiv 0` — the inclusion
  was inhabited only by the trivial element. The gauge group could still, from what was banked, have
  been the TRIVIAL group {id}. W4.5 SUFFICIENCY: this node does NOT re-pin the gauge inclusion; it
  ADVANCES to the FORWARD joint N138 opens — exhibiting a CONCRETE NON-IDENTITY gauge automorphism,
  pinning the gauge group as GENUINELY NON-TRIVIAL.

  ── THE TRUNK REFRAME (W1 step 2 / THE ONE LAW — the route the difficulty DISSOLVES through) ──
  The ROADMAP §N139 frontier SUGGESTED the exponential `expOEquiv D` of a banked nonzero derivation
  `D` (N20's 14-element basis) — but proving `expOEquiv D ≠ id` requires EVALUATING the infinite
  vector-exponential `tsum` in closed form, a W9 instrument-wall risk (the predecessors' death). The
  difficulty DISSOLVES when attacked from the trunk: the Cayley–Dickson DOUBLING `O Cut = CD (H Cut)`
  — the cascade's OWN construction — carries a CANONICAL, series-free, order-2 automorphism: the
  TOP-HALF NEGATION `octTopNeg ⟨a, b⟩ = ⟨a, -b⟩` (fix the quaternion subalgebra `H`, negate its
  orthogonal complement `H⊥`). It is MULTIPLICATIVE because the doubled product
  `⟨a,b⟩·⟨c,d⟩ = ⟨ac − d⋆b, da + bc⋆⟩` has the two top-half sign flips CANCEL in the `re` component
  and COMBINE in the `im` component (`octTopNegFun_mul`); UNITAL (`octTopNegFun_one`); a `Cut`-linear
  involution (componentwise `•`/`+`, self-inverse); and NON-IDENTITY because it sends the doubling
  generator `e₂ = ⟨0,1⟩` to `−e₂ = ⟨0,−1⟩ ≠ e₂` (char `Cut` = 0). It is the standard order-2 element
  of G₂ = Aut(O), the involution whose fixed subalgebra is the quaternions. It plugs DIRECTLY into
  N138's `octBlockEndC_autC_mem_octStab` (which accepts ANY `IsAlgAutCut`), giving a CONCRETE
  non-identity gauge element of `octStab`.

  ── WHAT THIS NODE BANKS ──
  `octTopNegFun` / `octTopNegFun_re` / `octTopNegFun_im` — the top-half negation map and its components.
  `octTopNegFun_mul` — MULTIPLICATIVE (the two top-half sign flips cancel in `.re`, combine in `.im`).
  `octTopNegFun_one` — UNITAL.
  `octTopNeg` — the `Cut`-linear EQUIVALENCE (additive + smul, self-inverse involution).
  `octTopNeg_apply` — its action.
  ★ `octTopNeg_isAlgAut` — THE HEADLINE: `octTopNeg` is an octonion algebra-automorphism `IsAlgAutCut`.
  `octTopNeg_e2` — it MOVES the doubling generator: `octTopNeg e₂ = −e₂`.
  ★ `octTopNeg_ne_refl` — NON-IDENTITY: `octTopNeg ≠ id` (a genuine non-identity element of G₂ = Aut(O),
    NOT the trivial automorphism — the gauge group is genuinely non-trivial).
  ★★ `octBlockEndC_octTopNeg_mem_octStab` — THE NON-TRIVIALITY: the octonion-block embedding of the
    CONCRETE NON-IDENTITY automorphism `octTopNeg` lands in the gauge stabilizer `octStab` (a real
    non-identity gauge element — the G₂ = Aut(O) ⊂ SO(8) inclusion has genuine content, not just {id}).
  W8 (genuine non-vacuity, the costume anchor): `octTopNeg_gFormC_e2` (the non-identity gauge
    automorphism still PRESERVES `e₂`'s Born self-overlap, `gFormC (octTopNeg e₂)(octTopNeg e₂) =
    gFormC e₂ e₂`), `octTopNeg_gFormC_e2_eq_one` (and that overlap is `1` — the costume reads off this `1`).

  THE MOAT (docs/STANDARD.md §0). The literature POSITS the gauge group AND its non-triviality (the
  internal symmetry has 14 generators) as independent physical inputs. Here the gauge group is the
  DERIVED observer-plane stabilizer (N137), its G₂ subgroup the DERIVED octonion automorphism group
  (N138), and its NON-TRIVIALITY is a CONCRETE non-identity automorphism CONSTRUCTED from the cascade's
  OWN Cayley–Dickson doubling — the involution fixing the quaternion subalgebra and negating its
  complement, no posited gauge group, no posited G₂, no posited automorphism, no Mathlib ℝ/ℂ as
  content, no bridge.

  Physics-words-removable: delete "gauge / G₂ / SO(8) / automorphism / derivation / Aut / Lorentz /
  stabilizer / octonion / observer / internal-symmetry / isometry / non-triviality" → over the derived
  complete ordered field `Cut`, the terminal algebra `O Cut := CD (H Cut)`, and `STVC = Cut × Cut × O Cut`:
  the componentwise map `⟨a,b⟩ ↦ ⟨a,−b⟩` is a multiplicative-and-unital `Cut`-linear self-equiv of
  `O Cut` that is NOT the identity (it sends `⟨0,1⟩` to `⟨0,−1⟩`), and its block embedding
  `(t,x,v) ↦ (t,x,⟨v.re,−v.im⟩)` lies in the submonoid of `BvC`-isometries fixing `(1,0,0)` and `(0,1,0)`.
  No theorem statement needs a physics word.
-/
import Phys.Algebra.LorentzContinuumOctStabilizerG2

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## The top-half negation — the canonical series-free order-2 automorphism of the CD double. -/

/-- The top-half negation on the terminal algebra `O Cut = CD (H Cut)`: fix the quaternion subalgebra
    `H` (the `re` half), negate its orthogonal complement `H⊥` (the `im` half). The cascade's OWN
    Cayley–Dickson doubling carries this involution — no series, no exponential. -/
def octTopNegFun (z : O Cut) : O Cut := ⟨z.re, -z.im⟩

@[simp] theorem octTopNegFun_re (z : O Cut) : (octTopNegFun z).re = z.re := rfl
@[simp] theorem octTopNegFun_im (z : O Cut) : (octTopNegFun z).im = -z.im := rfl

/-- ★ MULTIPLICATIVE. In the doubled product `⟨a,b⟩·⟨c,d⟩ = ⟨ac − d⋆b, da + bc⋆⟩`, the two top-half
    sign flips CANCEL in the `re` component (`(−d)⋆(−b) = d⋆b`) and COMBINE in the `im` component
    (`(−d)a + (−b)c⋆ = −(da + bc⋆)`), so `octTopNeg (z·w) = octTopNeg z · octTopNeg w`. -/
theorem octTopNegFun_mul (z w : O Cut) :
    octTopNegFun (z * w) = octTopNegFun z * octTopNegFun w := by
  apply CD.ext
  · simp [octTopNegFun, CD.mul_re]
  · show -(z * w).im = (octTopNegFun w).im * (octTopNegFun z).re
        + (octTopNegFun z).im * star (octTopNegFun w).re
    simp only [octTopNegFun, CD.mul_im]
    rw [neg_add]
    congr 1
    · exact (neg_mul w.im z.re).symm
    · exact (neg_mul z.im (star w.re)).symm

/-- UNITAL: `octTopNeg 1 = ⟨1, −0⟩ = 1`. -/
theorem octTopNegFun_one : octTopNegFun (1 : O Cut) = 1 := by
  apply CD.ext <;> simp [octTopNegFun]

/-- The top-half negation as a `Cut`-linear EQUIVALENCE of `O Cut` — additive and `Cut`-homogeneous
    (componentwise `+`/`•`), and a self-inverse involution. -/
def octTopNeg : O Cut ≃ₗ[Cut] O Cut where
  toFun := octTopNegFun
  map_add' x y := by
    apply CD.ext
    · simp [octTopNegFun]
    · simp only [octTopNegFun, CD.add_im]; abel
  map_smul' r x := by
    apply CD.ext <;> simp [octTopNegFun, CD.genSmul_re, CD.genSmul_im]
  invFun := octTopNegFun
  left_inv x := by apply CD.ext <;> simp [octTopNegFun]
  right_inv x := by apply CD.ext <;> simp [octTopNegFun]

@[simp] theorem octTopNeg_apply (z : O Cut) : octTopNeg z = octTopNegFun z := rfl

/-- ★ THE HEADLINE: the top-half negation is an octonion ALGEBRA-AUTOMORPHISM (`IsAlgAutCut` —
    multiplicative and unital `Cut`-linear self-equiv, N41f). A concrete member of G₂ = Aut(O). -/
theorem octTopNeg_isAlgAut : IsAlgAutCut octTopNeg := by
  refine ⟨?_, ?_⟩
  · intro x y; simp only [octTopNeg_apply]; exact octTopNegFun_mul x y
  · simp only [octTopNeg_apply]; exact octTopNegFun_one

/-! ## NON-IDENTITY: the automorphism genuinely moves an octonion axis. -/

/-- The automorphism MOVES the Cayley–Dickson doubling generator: `octTopNeg e₂ = −e₂`
    (`e₂ = ⟨0,1⟩ ↦ ⟨0,−1⟩`). -/
theorem octTopNeg_e2 : octTopNeg (CD.e2 : O Cut) = -(CD.e2 : O Cut) := by
  apply CD.ext <;> simp [octTopNeg, octTopNegFun, CD.e2]

/-- ★ NON-IDENTITY: `octTopNeg ≠ id`. It moves `e₂` to `−e₂`, and `e₂ ≠ −e₂` because the `im`
    component is the unit `1 : H Cut` whose innermost real coordinate is `1 ≠ −1` over the derived
    field `Cut` (characteristic 0). Hence the G₂ = Aut(O) gauge group is GENUINELY NON-TRIVIAL —
    it is NOT the trivial group `{id}`. -/
theorem octTopNeg_ne_refl : octTopNeg ≠ LinearEquiv.refl Cut (O Cut) := by
  intro h
  have he : octTopNeg (CD.e2 : O Cut) = (CD.e2 : O Cut) := by rw [h]; rfl
  rw [octTopNeg_e2] at he
  have him := congrArg (fun z => (z : O Cut).im) he
  simp only at him
  have hneg : -((CD.e2 : O Cut).im) = (CD.e2 : O Cut).im := by
    have := him; simpa [CD.neg_im] using this
  rw [CD.e2_im] at hneg
  have hc := congrArg (fun (q : H Cut) => q.re.re) hneg
  simp only at hc
  norm_num [CD.neg_re, CD.one_re] at hc

/-! ## THE NON-TRIVIALITY: the concrete non-identity gauge element lands in the stabilizer. -/

/-- ★★ THE NON-TRIVIALITY (the FORWARD joint N138 opens): the octonion-block embedding of the CONCRETE
    NON-IDENTITY automorphism `octTopNeg` lands in the observer-plane gauge stabilizer `octStab`
    (N137) — a genuine non-identity gauge element, not the trivial `expOEquiv 0`. The gauge group
    G₂ = Aut(O) ⊂ SO(8) ⊂ the stabilizer of `SO⁺(1,9)` has REAL non-identity content. -/
theorem octBlockEndC_octTopNeg_mem_octStab :
    IsOctStab (octBlockEndC ((octTopNeg : O Cut →ₗ[Cut] O Cut))) :=
  octBlockEndC_autC_mem_octStab octTopNeg_isAlgAut

/-! ## W8 (genuine non-vacuity / the costume anchor). -/

/-- W8 anchor: the NON-IDENTITY gauge automorphism STILL preserves `e₂`'s Born self-overlap,
    `gFormC (octTopNeg e₂) (octTopNeg e₂) = gFormC e₂ e₂` (`autC_gFormC` — it is a `gFormC`-isometry,
    even though it is not the identity). -/
theorem octTopNeg_gFormC_e2 :
    gFormC (octTopNeg (CD.e2 : O Cut)) (octTopNeg (CD.e2 : O Cut))
      = gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) :=
  autC_gFormC octTopNeg_isAlgAut _ _

/-- W8 anchor (the costume `C171` reads off this `1`): the non-identity gauge automorphism preserves
    `e₂`'s self-overlap and that overlap is `1` (the unit octonion `e₂` has Born norm `1`). -/
theorem octTopNeg_gFormC_e2_eq_one :
    gFormC (octTopNeg (CD.e2 : O Cut)) (octTopNeg (CD.e2 : O Cut)) = 1 := by
  rw [octTopNeg_gFormC_e2]
  simp [gFormC, reQC, CD.e2, CD.mul_re, CD.star_re, CD.star_im]

end

end Phys.Algebra
