/-
  Phys.Algebra.LorentzContinuumSpin9DistinctPlane — N98: THE DISTINCT-UNITS TWO-SIDED GENERATOR
  CARRIES THE REAL AXIS ONTO A PRODUCT UNIT — a 2-plane rotation `span{1, u·u'}` built from a
  PRODUCT of two distinct unit-imaginaries, the next structural reachability step toward the
  `Spin(9)→SO(9)` exhaustion, over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE FORWARD FRONTIER after N97 (docs/ROADMAP.md §N98 priority (ii) — EXTEND the biMulFun-product
  family toward a generic-rank product / a new 2-plane). The packaged reverse-surjectivity skeleton
  is fully assembled (N97 `isometry_polar_path_decomp`): every isometry `g = k·γ(1)`, `k` an isometry
  reachable by finite `biMulFun` products (N94/N95), `γ(1)` the endpoint of an affine cone-path from
  the identity (N96). The remaining HEAVY core is the global generation `qvIsomMonoidC ≤
  genIsomMonoidC2` (which lives in `Module.End Cut STVC`, requiring a Function.End ↔ Module.End
  bridge) and the operator topology over `Cut` (Mathlib has neither) — childed N99. The
  immediately-bankable, FORCED structural advance is a NEW 2-plane reached by the banked two-sided
  generator family, entirely within the `Function.End STVC` generation world.

  ── THE WITNESS: distinct anticommuting unit-imaginaries reach a NEW product-unit 2-plane ──
  N94 banked the DIAGONAL half-turn `biMulFun u u` for a unit-imaginary `u`: an INVOLUTION that sends
  the real axis `1 ↦ −1` (NEGATES `span{1,u}`, on the real line). N95 banked the PRODUCT of two
  diagonal half-turns `biMulFun w w ∘ biMulFun u u`: it FIXES the real axis `1 ↦ 1` and rotates the
  imaginary plane `span{u,w}`. This node pins the geometry of the OFF-DIAGONAL two-sided generator
  `biMulFun u u'` for DISTINCT anticommuting unit-imaginaries `u ≠ u'` (`u·u = u'·u' = −1`):

      biMulFun u u' (0,0,1) = (0,0, u·u')        — CARRIES the real axis `1` OFF the real line onto
                                                    the PRODUCT unit `u·u'` (NEW: N94 keeps it on the
                                                    real line at `−1`, N95 fixes it at `1`);
      biMulFun u u' (0,0, u·u') = (0,0,1)         — SWAPS the product unit back to `1`.

  So `biMulFun u u'` is a 2-plane rotation in the plane `span{1, u·u'}` — a plane built from a
  PRODUCT of two distinct generators, reached by NEITHER the single diagonal half-turn (which never
  leaves the real line) NOR the imaginary-plane product (which fixes the real line). The swap
  DISSOLVES through the banked octonion alternative laws (N5b `mul_mul_right` `(x·y)·y = x·(y·y)`),
  NO coordinate grind:

      biMulFun u u' (0,0,1).space    = u·(1·u') = u·u'                  [one_mul]
      biMulFun u u' (0,0,u·u').space = u·((u·u')·u')
        = u·(u·(u'·u'))   [mul_mul_right] = u·(u·(−1)) = u·(−u)         [u'·u' = −1]
        = −(u·u) = −(−1) = 1                                            [u·u = −1].

  The product unit `u·u'` is itself a Born-unit (`gFormC (u·u') (u·u') = gFormC u u · gFormC u' u' =
  1` via the banked composition law `gFormC_comp`), so the new 2-plane `span{1, u·u'}` is a genuine
  Born-orthonormal plane. And applying the generator TWICE on the real axis returns `1` — the rotation
  is order-2 ON THE 2-PLANE (the generator is NOT a global involution off this plane; that is exactly
  the non-associative difference from the diagonal half-turn, and the structural content of the
  octonionic `Spin(9)` action).

  ── THE DISTINGUISHING FACT (W8 — the genuine novelty toward SO(9)) ──
  Over the derived ℝ `Cut`, take `u = e₂` and `u' = ιe₂ := iota(e₂ : H Cut)`, the cascade's terminal
  imaginary generator and the imaginary unit it embeds (both Born-units that ANTICOMMUTE, N95). The
  concrete product unit `e₂·ιe₂` lands strictly OFF the real axis: its scalar part `re.re.re = 0` and
  its nonzero coordinate `im.im.re = −1`. A DIAGONAL half-turn (N94) sends `1 ↦ −1` whose scalar part
  is `−1 ≠ 0`; the off-diagonal generator sends `1` to a unit with ZERO scalar part — the
  distinguishing teeth that the off-diagonal generator reaches a NEW plane the diagonal family never
  touches.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N55 + N94 + N95 + N5b):
    biMulFun_distinct_swap_one    — ★ the off-diagonal generator CARRIES the real axis `1 ↦ u·u'`.
    biMulFun_distinct_swap_prod   — ★ the generator SWAPS the product unit back `u·u' ↦ 1`.
    biMulFun_distinct_prod_born   — the product unit `u·u'` is itself a Born-unit (`gFormC = 1`).
    biMulFun_distinct_mem_gen2    — the off-diagonal generator lies in `genIsomMonoidC2`.
    biMulFun_distinct_order2_one  — ★ applying the generator TWICE fixes the real axis (order-2 on
                                    the 2-plane), even though it is not a global involution.
    biMulFun_e2je2_offaxis        — ★ W8: the concrete product unit `e₂·ιe₂` has ZERO scalar part.
    biMulFun_e2je2_swap_coord     — ★ W8 TEETH: the concrete generator carries `1` to a unit whose
                                    nonzero coordinate `im.im.re = −1`.
    biMulFun_e2je2_distinct_mem   — the concrete `e₂,ιe₂` generator lies in `genIsomMonoidC2`.
    biMulFun_e2je2_order2_one     — the concrete generator's order-2 action on the real axis.

  ── THE W1 HEAVY REMAINDER (childed N99, an honest dissolution ticket, NOT closed here) ──
  The GLOBAL reverse surjectivity `qvIsomMonoidC ≤ genIsomMonoidC2` — that every isometry's compact
  part (a `Module.End Cut STVC` operator, N93) is a finite product of these `Function.End` generators,
  requiring a Function.End ↔ Module.End bridge — the literal operator TOPOLOGY over `Cut`
  (`TopologicalSpace (Module.End Cut STVC)` / continuity of the affine path N96), and the full
  `Spin(9)→SO(9)` exhaustion: the genuine group-manifold topology Mathlib lacks over `Cut`. Childed.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That octonionic bimultiplication `v ↦ u·(v·u')`
  by distinct units reaches generic 2-plane rotations, and that `Spin(9)` two-sidedly covers `SO(9)`,
  is standard (Sudbery, Manogue–Dray, Baez, the `Spin(9)` triality literature). Here the real-axis
  swap onto the product unit, the product unit's Born-orthonormality, the order-2-on-the-plane action,
  and the `genIsomMonoidC2` membership DESCEND from the banked octonion alternative law `mul_mul_right`
  (N5b — forward from the Cayley–Dickson product, the cascade STOP) and the banked Born composition
  law `gFormC_comp` (N50) over the DERIVED ℝ `Cut` and the terminal algebra `O Cut` — NOT a posited
  Lorentz/Spin group, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / half-turn /
  plane / SO(9) / Spin / SO⁺(1,9) / isometry / generator / Moufang / bimultiplication / cover /
  orthonormal / 2-plane / order / real-axis / product-unit": what remains is the theorem that over
  the derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, for `u, u'` with
  `u·u = u'·u' = −1`, the map `(t,x,v) ↦ (t,x, u·(v·u'))` sends `1 ↦ u·u'` and `u·u' ↦ 1`, that
  `u·u'` has `gFormC (u·u') (u·u') = 1` when `gFormC u u = gFormC u' u' = 1`, that the map applied
  twice fixes `1`, and that the map lies in the generated submonoid `genIsomMonoidC2 ⊆ Function.End
  (Cut × Cut × O Cut)`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The off-diagonal two-sided generator carries the real axis onto a product unit. -/

/-- ★ THE REAL-AXIS SWAP (forward): the off-diagonal two-sided generator `biMulFun u u'` carries the
    real axis `1` OFF the real line onto the PRODUCT unit `u·u'`: `biMulFun u u' (0,0,1) = (0,0, u·u')`
    (`u·(1·u') = u·u'`). The structural NOVELTY over the diagonal half-turn (N94, which sends `1 ↦ −1`
    on the real line) and over the imaginary-plane product (N95, which fixes `1`): the off-diagonal
    generator reaches a 2-plane `span{1, u·u'}` built from a PRODUCT of two distinct generators. -/
theorem biMulFun_distinct_swap_one (u u' : O Cut) :
    biMulFun u u' ((0 : Cut), (0 : Cut), (1 : O Cut)) = ((0 : Cut), (0 : Cut), u * u') := by
  simp only [biMulFun, one_mul]

/-- ★ THE REAL-AXIS SWAP (back): the off-diagonal generator carries the product unit `u·u'` back to
    the real axis `1`: `biMulFun u u' (0,0, u·u') = (0,0,1)`. Dissolved through the banked octonion
    right-alternative law `mul_mul_right` (`(u·u')·u' = u·(u'·u')`): `u·((u·u')·u') = u·(u·(u'·u')) =
    u·(u·(−1)) = u·(−u) = −(u·u) = −(−1) = 1`. NO coordinate grind. Together with the forward swap,
    `biMulFun u u'` is a 2-plane rotation in `span{1, u·u'}`. -/
theorem biMulFun_distinct_swap_prod (u u' : O Cut) (hsqu : u * u = -1) (hsqu' : u' * u' = -1) :
    biMulFun u u' ((0 : Cut), (0 : Cut), u * u') = ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  simp only [biMulFun]
  have h : u * ((u * u') * u') = 1 := by
    rw [mul_mul_right u u', hsqu', mul_neg_one]
    rw [show u * -u = -(u * u) from mul_neg u u, hsqu, neg_neg]
  rw [h]

/-- The product unit `u·u'` is itself a Born-unit when `u, u'` are: `gFormC (u·u') (u·u') =
    gFormC u u · gFormC u' u' = 1` (the banked composition law `gFormC_comp`). So the new 2-plane
    `span{1, u·u'}` is a genuine Born-orthonormal plane. -/
theorem biMulFun_distinct_prod_born (u u' : O Cut) (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    gFormC (u * u') (u * u') = 1 := by
  rw [gFormC_comp u u', hu, hu', mul_one]

/-- The off-diagonal generator `biMulFun u u'` (Born-units `u, u'`) lies in the extended generated
    isometry submonoid `genIsomMonoidC2` — it is a Born-unit bimultiplication. -/
theorem biMulFun_distinct_mem_gen2 (u u' : O Cut) (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    (biMulFun u u' : Function.End STVC) ∈ genIsomMonoidC2 := by
  apply Submonoid.subset_closure
  apply Set.mem_union_right
  exact ⟨u, u', hu, hu', rfl⟩

/-- ★ ORDER-2 ON THE 2-PLANE: applying the off-diagonal generator TWICE fixes the real axis
    `biMulFun u u' (biMulFun u u' (0,0,1)) = (0,0,1)` (forward swap then back swap). The generator is
    order-2 ON the 2-plane `span{1, u·u'}`, even though — unlike the diagonal half-turn N94 — it is
    NOT a global involution (the non-associative difference is the structural content of the
    octonionic `Spin(9)` action). -/
theorem biMulFun_distinct_order2_one (u u' : O Cut) (hsqu : u * u = -1) (hsqu' : u' * u' = -1) :
    biMulFun u u' (biMulFun u u' ((0 : Cut), (0 : Cut), (1 : O Cut)))
      = ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  rw [biMulFun_distinct_swap_one u u', biMulFun_distinct_swap_prod u u' hsqu hsqu']

/-! ## The CONCRETE off-diagonal generator `biMulFun e₂ ιe₂` and its W8 teeth. -/

/-- ★ W8: the concrete product unit `e₂·ιe₂` lands strictly OFF the real axis — its scalar part
    `re.re.re = 0`. The diagonal half-turn (N94) sends `1 ↦ −1`, whose scalar part is `−1 ≠ 0`; the
    off-diagonal generator sends `1` to a unit with ZERO scalar part — the distinguishing fact that
    the off-diagonal generator reaches a NEW plane the diagonal family never touches. -/
theorem biMulFun_e2je2_offaxis : ((CD.e2 : O Cut) * (je2 : O Cut)).re.re.re = 0 := by
  simp [CD.e2, CD.iota]

/-- ★ W8 NON-VACUITY / TEETH: the concrete off-diagonal generator `biMulFun e₂ ιe₂` carries the real
    axis `(0,0,1)` to the product unit `e₂·ιe₂`, whose nonzero coordinate `im.im.re = −1` (the
    concrete realization of the real-axis swap onto a NEW product-unit 2-plane). A SINGLE diagonal
    half-turn sends `1` to the scalar `−1` (coordinate `re.re.re = −1`, all imaginary coordinates
    zero); the off-diagonal generator sends it to a purely-imaginary unit with `im.im.re = −1` — the
    teeth that the off-diagonal generator reaches a genuinely different image. -/
theorem biMulFun_e2je2_swap_coord :
    ((biMulFun (CD.e2 : O Cut) (je2 : O Cut) ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).im.im.re
      = -1 := by
  rw [biMulFun_distinct_swap_one (CD.e2 : O Cut) (je2 : O Cut)]
  simp [CD.e2, CD.iota]

/-- The concrete off-diagonal generator `biMulFun e₂ ιe₂` lies in the extended generated isometry
    submonoid `genIsomMonoidC2`. -/
theorem biMulFun_e2je2_distinct_mem :
    (biMulFun (CD.e2 : O Cut) (je2 : O Cut) : Function.End STVC) ∈ genIsomMonoidC2 :=
  biMulFun_distinct_mem_gen2 (CD.e2 : O Cut) (je2 : O Cut) e2_gFormC_self je2_gFormC_self

/-- The concrete off-diagonal generator's order-2 action on the real axis: applied twice it fixes
    `(0,0,1)`. -/
theorem biMulFun_e2je2_order2_one :
    biMulFun (CD.e2 : O Cut) (je2 : O Cut)
        (biMulFun (CD.e2 : O Cut) (je2 : O Cut) ((0 : Cut), (0 : Cut), (1 : O Cut)))
      = ((0 : Cut), (0 : Cut), (1 : O Cut)) :=
  biMulFun_distinct_order2_one (CD.e2 : O Cut) (je2 : O Cut) biMulFun_e2_sq je2_sq

end

end Phys.Algebra
