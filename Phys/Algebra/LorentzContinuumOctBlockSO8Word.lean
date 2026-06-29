/-
  N159 — THE OCTONION-BLOCK 2-PLANE ROTATION GENERATION INTO THE NON-VACUOUS `JoinedIdQvC`.

  N158 (`LorentzContinuumGenuineSO9Peel`) reduced the genuine TIME-FIXING compact factor's
  `JoinedIdQvC` to the `JoinedIdQvC` of its `x`-fixing `SO(8)` octonion-block stabilizer
  (`joinedIdQvC_of_timeFixing_evCOrth_peel`). That residual factor fixes BOTH the timelike axis AND
  the `x`-axis, acting purely on the 8-dim octonion block `𝕆 = O Cut`. THIS node banks the
  generation of that stabilizer's connected elements into the NON-VACUOUS path-component predicate.

  ★ THE LIFT IS BANKED. `octBlockEndC R : Module.End Cut STVC` (N129,
  `LorentzContinuumGenerationBoostRotationSplit`) maps `(t,x,v) ↦ (t,x,R v)`, FIXES the `(t,x)`
  plane (`octBlockEndC_fixes_mTimeUnit` / `octBlockEndC_fixes_mSpaceUnit`, N130), and is a
  `BvC`-isometry whenever `R` is a `gFormC`-isometry of `O Cut` (`octBlockEndC_isBvIsomLin`, N129).
  Since `BvC p p = QvC p` (`BvC_self`, N51), a `BvC`-isometry is a `QvC`-isometry. So the residual is
  ONLY the octonion-block ROTATION generators and the proof that their lift is `JoinedIdQvC`.

  ★ THE GENERATOR. `octPlaneRot e f c s` is the 2-plane rotation of `span{e,f} ⊆ O Cut` by the circle
  point `(c,s)`, the identity on the Born-complement — the octonion-block analogue of N113's
  `axisRotLin` (which rotates `span{x,e}`); `octPlaneRot` rotates `span{e,f} ⊆ 𝕆`, touching NEITHER
  `t` NOR `x`. For ORTHONORMAL `e,f` (`gFormC e e = gFormC f f = 1`, `gFormC e f = 0`) and a circle
  point (`c²+s²=1`), it is a `gFormC`-isometry (`octPlaneRot_isGFormCIsom`) — pure field arithmetic
  over the derived ℝ `Cut` via the two-axis completing-the-square expansion `gFormC_twoaxis_expand`
  and the Born self-overlap (the trunk). The lift `octBlockEndC (octPlaneRot e f c s)` is then a
  `QvC`-isometry fixing `t` and `x` (`isQvIsomC_octBlockEndC_octPlaneRot`).

  ★★ THE CORE. The cayley-steered path `octPlaneRotPath e f m := octBlockEndC (octPlaneRot e f
  (cayleyC m)(cayleyS m))` is continuous in `endOpC` (rational cayley + octonion smul/add
  continuity — NO `cos`/`sin`/`exp`), starts at `1` (`octPlaneRotPath_zero`), and reaches the
  generator (`octPlaneRotPath_reaches`); every point is a genuine `QvC`-isometry
  (`octPlaneRotPath_isQvIsomC`, which REQUIRES orthonormal `e,f`). So the lifted generator is
  `JoinedIdQvC` (`joinedIdQvC_octBlockEndC_octPlaneRot`) — NON-vacuously (the connecting set is a
  preconnected set OF ISOMETRIES). A finite product of such generators is `JoinedIdQvC`
  (`joinedIdQvC_octPlaneRotWord`, via `joinedIdQvC_mul` / `joinedIdQvC_listProd`, N157).

  W8 NON-VACUITY: the concrete lifted quarter-turn `octBlockEndC (octPlaneRot e₂ je2 0 1)` GENUINELY
  MOVES the octonion axis `e₂ ↦ je2` (`octPlaneRot_e2je2_quarter_moves`), reading `1` on the moved
  `je2` slot (`octBlockEndC_octPlaneRot_e2je2_moves_read`) — for the banked orthonormal pair `e₂,je2`
  (`e2_gFormC_self`, `je2_gFormC_self`, `octDeflate_e2_je2_gFormC_zero`) — AND is `JoinedIdQvC`
  (`joinedIdQvC_octBlockEndC_octPlaneRot_e2je2_quarter`). The generator is a non-trivial isometry, not
  decoration.

  THE FORWARD NODE (childed N160): the full octonion-block `SO(8)` exhaustion — every `x`-fixing,
  time-fixing compact `QvC`-isometry (its `v`-block a `gFormC`-isometry rotation) is a FINITE PRODUCT
  of `octPlaneRot` generators, via the banked reflection word `gFormC_isom_mem_closure` (N124) +
  the rotation = even-reflection-pair identification — the genuine heavy group-manifold remainder
  Mathlib lacks over the derived `Cut`.

  DERIVED from the trunk (the banked N49–N158 + the derived ℝ `Cut` + the terminal algebra `O Cut` +
  `STVC` + the indefinite Minkowski form `BvC` + the operator topology `endOpC` (N152) + the lift
  `octBlockEndC` / `octBlockEndC_isBvIsomLin` (N129) + the cayley rationals `cayleyC` / `cayleyS` /
  `cayley_on_circle` / `cayley_surj` (N153) + the NON-VACUOUS engine `JoinedIdQvC` / `joinedIdQvC_mul`
  / `joinedIdQvC_listProd` (N157) + the Born positivity / orthonormal octonion units `e2_gFormC_self`
  / `je2_gFormC_self` / `octDeflate_e2_je2_gFormC_zero`; `gFormC` bilinearity, `LinearMap` /
  `Continuous.*` / `IsPreconnected.image` MACHINERY on the DERIVED objects, STANDARD §3), NOT a
  posited rotation group, NOT a posited connectedness, NOT a posited topology, NOT a posited
  Lorentz / Pin / Spin / gauge / G₂ / `SO(8)` group, NOT a posited compact group, NOT Mathlib ℝ/ℂ as
  content (the field, the form, AND the path parameter are ALL the derived `Cut`), NOT a regression to
  the vacuous `JoinedIdC`, NOT a fully proved implication asserted without a proof, NOT a bridge.
-/
import Phys.Algebra.LorentzContinuumGenuineSO9Peel
import Phys.Algebra.LorentzContinuumGenerationBoostRotationSplit
import Phys.Algebra.LorentzContinuumGenerationSO8GlobalExhaustion
import Phys.Algebra.LorentzContinuumGeneralAxisRotationPath
import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation
import Phys.Algebra.LorentzContinuumSpin9Product

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## THE GENERATOR — the octonion-block 2-plane rotation. -/

/-- ★ `octPlaneRot e f c s` — the 2-plane rotation of `span{e,f} ⊆ O Cut` by the circle point
    `(c,s)`, the identity on the Born-complement:
    `R v = v + ((c−1)·gFormC v e − s·gFormC v f)•e + (s·gFormC v e + (c−1)·gFormC v f)•f`.
    On the plane this is `e ↦ c·e + s·f`, `f ↦ −s·e + c·f` (reading off the `e`,`f`-components);
    a Born-orthogonal `w` (`gFormC w e = gFormC w f = 0`) is FIXED. The octonion-block analogue of
    N113's `axisRotLin` (which rotates `span{x,e}` across the `(t,x)`/octonion split); `octPlaneRot`
    rotates `span{e,f} ⊆ 𝕆`, touching NEITHER `t` NOR `x`. `Cut`-linear via `gFormC` bilinearity. -/
def octPlaneRot (e f : O Cut) (c s : Cut) : O Cut →ₗ[Cut] O Cut where
  toFun v := v + ((c - 1) * gFormC v e - s * gFormC v f) • e
               + (s * gFormC v e + (c - 1) * gFormC v f) • f
  map_add' v w := by
    simp only [gFormC_add_left]
    rw [show ((c - 1) * (gFormC v e + gFormC w e) - s * (gFormC v f + gFormC w f))
          = ((c - 1) * gFormC v e - s * gFormC v f) + ((c - 1) * gFormC w e - s * gFormC w f) by ring,
        show (s * (gFormC v e + gFormC w e) + (c - 1) * (gFormC v f + gFormC w f))
          = (s * gFormC v e + (c - 1) * gFormC v f) + (s * gFormC w e + (c - 1) * gFormC w f) by ring,
        add_smul, add_smul]
    abel
  map_smul' a v := by
    simp only [gFormC_smul_left, RingHom.id_apply, smul_add]
    rw [show ((c - 1) * (a * gFormC v e) - s * (a * gFormC v f))
          = a * ((c - 1) * gFormC v e - s * gFormC v f) by ring,
        show (s * (a * gFormC v e) + (c - 1) * (a * gFormC v f))
          = a * (s * gFormC v e + (c - 1) * gFormC v f) by ring,
        smul_smul, smul_smul]

/-- The explicit action of the octonion-block 2-plane rotation. -/
theorem octPlaneRot_apply (e f : O Cut) (c s : Cut) (v : O Cut) :
    octPlaneRot e f c s v
      = v + ((c - 1) * gFormC v e - s * gFormC v f) • e
          + (s * gFormC v e + (c - 1) * gFormC v f) • f := rfl

/-- `c=1, s=0` ⇒ the identity (the rotation by the unit circle point `(1,0)`). -/
theorem octPlaneRot_one_zero (e f : O Cut) : octPlaneRot e f 1 0 = LinearMap.id := by
  apply LinearMap.ext; intro v; rw [octPlaneRot_apply]; simp

/-! ## THE ISOMETRY — orthonormal axes + circle point. -/

/-- ★ THE TWO-AXIS COMPLETING-THE-SQUARE EXPANSION over the derived ℝ: for ORTHONORMAL `e,f`
    (`gFormC e e = gFormC f f = 1`, `gFormC e f = 0`),
    `gFormC (v + α•e + β•f) (w + γ•e + δ•f)
       = gFormC v w + γ·gFormC v e + δ·gFormC v f + α·gFormC w e + β·gFormC w f + α·γ + β·δ`.
    Pure `gFormC` bilinearity (N-LieAlgebra) with the orthonormality collapsing the `e`,`f`
    self/cross terms. The two-axis analogue of N113's single-axis `gFormC_add_axis_self`. -/
theorem gFormC_twoaxis_expand (e f v w : O Cut) (α β γ δ : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0) :
    gFormC (v + α • e + β • f) (w + γ • e + δ • f)
      = gFormC v w + γ * gFormC v e + δ * gFormC v f
        + α * gFormC w e + β * gFormC w f + α * γ + β * δ := by
  have hfe : gFormC f e = 0 := by rw [gFormC_symm]; exact hef
  simp only [gFormC_add_left, gFormC_add_right, gFormC_smul_left, gFormC_smul_right,
    hee, hff, hef, hfe]
  rw [gFormC_symm e w, gFormC_symm f w]; ring

/-- ★★ THE ISOMETRY — `octPlaneRot e f c s` is a `gFormC`-isometry for ORTHONORMAL `e,f` and a
    circle point `c²+s²=1`. The two-axis expansion `gFormC_twoaxis_expand` reduces the difference to
    `(gFormC v e · gFormC w e + gFormC v f · gFormC w f)·(c²+s²−1)`, which vanishes on the circle —
    one `linear_combination`, pure field arithmetic over the derived ℝ. The negative-definite
    `span{e,f}` block of the Born form is preserved by the circular rotation; the complement rides
    along unchanged. -/
theorem octPlaneRot_isGFormCIsom (e f : O Cut) (c s : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hcs : c ^ 2 + s ^ 2 = 1) :
    IsGFormCIsom (octPlaneRot e f c s) := by
  intro v w
  rw [octPlaneRot_apply, octPlaneRot_apply]
  rw [gFormC_twoaxis_expand e f v w
        ((c - 1) * gFormC v e - s * gFormC v f) (s * gFormC v e + (c - 1) * gFormC v f)
        ((c - 1) * gFormC w e - s * gFormC w f) (s * gFormC w e + (c - 1) * gFormC w f)
        hee hff hef]
  linear_combination (gFormC v e * gFormC w e + gFormC v f * gFormC w f) * hcs

/-! ## THE LIFT — the octonion-block embedding lands a QvC-isometry fixing time and x. -/

/-- ★ THE LIFTED GENERATOR `octBlockEndC (octPlaneRot e f c s)` is a `QvC`-isometry (fixing the
    `(t,x)` plane, by `octBlockEndC` N129/N130). The lift `octBlockEndC R` is a `BvC`-isometry for a
    `gFormC`-isometry `R` (`octBlockEndC_isBvIsomLin`, N129); on the diagonal `BvC p p = QvC p`
    (`BvC_self`, N51) gives the `QvC`-isometry. -/
theorem isQvIsomC_octBlockEndC_octPlaneRot (e f : O Cut) (c s : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hcs : c ^ 2 + s ^ 2 = 1) :
    IsQvIsomC (octBlockEndC (octPlaneRot e f c s)) := by
  intro p
  have hbv := octBlockEndC_isBvIsomLin (octPlaneRot_isGFormCIsom e f c s hee hff hef hcs) p p
  rw [BvC_self, BvC_self] at hbv
  exact hbv

/-! ## THE PATH — cayley-steered, continuous, isometric, off the antipode. -/

/-- THE LIFTED OCTONION-BLOCK ROTATION PATH `octPlaneRotPath e f m := octBlockEndC (octPlaneRot e f
    (cayleyC m)(cayleyS m))` — the cayley-steered family of lifted octonion-block plane rotations.
    The octonion-block analogue of N156's `axisRotPath`. -/
def octPlaneRotPath (e f : O Cut) (m : Cut) : Module.End Cut STVC :=
  octBlockEndC (octPlaneRot e f (cayleyC m) (cayleyS m))

/-- `octPlaneRotPath e f 0 = 1`: the path starts at the identity (`cayleyC 0 = 1`, `cayleyS 0 = 0`,
    `octPlaneRot e f 1 0 = id`, `octBlockEndC id = id`). -/
theorem octPlaneRotPath_zero (e f : O Cut) : octPlaneRotPath e f 0 = 1 := by
  rw [octPlaneRotPath, cayleyC_zero, cayleyS_zero, octPlaneRot_one_zero]
  apply LinearMap.ext; intro p
  rw [octBlockEndC_apply]; rfl

/-- ★ EVERY POINT of the lifted rotation path is a genuine `QvC`-isometry for ORTHONORMAL `e,f` —
    the path lies entirely IN the compact isometry group, because `(cayleyC m)²+(cayleyS m)²=1` for
    every `m` (`cayley_on_circle`). The non-vacuity ingredient. -/
theorem octPlaneRotPath_isQvIsomC (e f : O Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0) (m : Cut) :
    IsQvIsomC (octPlaneRotPath e f m) :=
  isQvIsomC_octBlockEndC_octPlaneRot e f (cayleyC m) (cayleyS m) hee hff hef (cayley_on_circle m)

/-- ★ THE PATH REACHES AN ARBITRARY LIFTED GENERATOR: for any circle point `(c,s)` with `c ≠ −1`,
    `octPlaneRotPath e f (s/(1+c)) = octBlockEndC (octPlaneRot e f c s)` (the surjective cayley
    parameter, `cayley_surj`). -/
theorem octPlaneRotPath_reaches (e f : O Cut) (c s : Cut)
    (h : c ^ 2 + s ^ 2 = 1) (hc : 1 + c ≠ 0) :
    octPlaneRotPath e f (s / (1 + c)) = octBlockEndC (octPlaneRot e f c s) := by
  obtain ⟨hC, hS⟩ := cayley_surj c s h hc
  rw [octPlaneRotPath, hC, hS]

/-- ★ THE LIFTED ROTATION PATH IS CONTINUOUS in the operator topology `endOpC`. By
    `endOpC_continuous_iff`, each coordinate evaluation `m ↦ (octPlaneRotPath e f m) v` is
    continuous: the `(t,x)` part is constant; the octonion `v`-block is a finite combination of the
    `Cut`-continuous `cayleyC`/`cayleyS`, the fixed scalars `gFormC v.2.2 e`/`gFormC v.2.2 f`, and
    the constant octonion vectors `e,f` under the banked octonion `ContinuousAdd`/`ContinuousSMul` —
    WITHOUT a continuous `exp`, WITHOUT a posited angle. -/
theorem octPlaneRotPath_cont (e f : O Cut) : Continuous (octPlaneRotPath e f) := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun m => (octPlaneRotPath e f m) v)
      = (fun m => ((v.1, v.2.1,
          v.2.2 + ((cayleyC m - 1) * gFormC v.2.2 e - cayleyS m * gFormC v.2.2 f) • e
            + (cayleyS m * gFormC v.2.2 e + (cayleyC m - 1) * gFormC v.2.2 f) • f) : STVC)) := by
    funext m
    rw [octPlaneRotPath, octBlockEndC_apply, octPlaneRot_apply]
  rw [hrw]
  apply Continuous.prodMk continuous_const
  apply Continuous.prodMk continuous_const
  apply Continuous.add
  apply Continuous.add continuous_const
  · apply Continuous.smul _ continuous_const
    exact ((cayleyC_continuous.sub continuous_const).mul continuous_const).sub
      (cayleyS_continuous.mul continuous_const)
  · apply Continuous.smul _ continuous_const
    exact (cayleyS_continuous.mul continuous_const).add
      ((cayleyC_continuous.sub continuous_const).mul continuous_const)

/-- The image of the lifted rotation path on a closed (unordered) interval is preconnected in the
    operator topology — the continuous image of a preconnected interval of the derived `Cut`. -/
theorem octPlaneRotPath_image_preconnected (e f : O Cut) (m : Cut) :
    IsPreconnected (octPlaneRotPath e f '' (Set.uIcc 0 m)) :=
  (isPreconnected_uIcc).image _ (octPlaneRotPath_cont e f).continuousOn

/-! ## THE CORE — the lifted generator is `JoinedIdQvC` (non-vacuous), and the word. -/

/-- ★★ THE CORE — the lifted octonion-block plane rotation `octBlockEndC (octPlaneRot e f c s)`
    (x-fixing, time-fixing, acting purely on `𝕆`) is `JoinedIdQvC` (non-vacuously) for ORTHONORMAL
    `e,f`, a circle point `c²+s²=1`, off the antipode `1+c≠0`. The cayley path
    `octPlaneRotPath e f` supplies the preconnected witness set OF ISOMETRIES
    (`octPlaneRotPath_isQvIsomC`, which REQUIRES orthonormal `e,f` — the non-vacuity): it is
    continuous, starts at `1` (`octPlaneRotPath_zero`), and reaches the generator
    (`octPlaneRotPath_reaches`). The octonion-block analogue of N157's `joinedIdQvC_axisRotLin`. -/
theorem joinedIdQvC_octBlockEndC_octPlaneRot (e f : O Cut) (c s : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hcs : c ^ 2 + s ^ 2 = 1) (hc : 1 + c ≠ 0) :
    JoinedIdQvC (octBlockEndC (octPlaneRot e f c s)) := by
  refine ⟨octPlaneRotPath e f '' (Set.uIcc 0 (s / (1 + c))), ?_,
    octPlaneRotPath_image_preconnected e f _, ?_, ?_⟩
  · rintro x ⟨m, _, rfl⟩
    exact octPlaneRotPath_isQvIsomC e f hee hff hef m
  · exact ⟨0, Set.left_mem_uIcc, octPlaneRotPath_zero e f⟩
  · exact ⟨s / (1 + c), Set.right_mem_uIcc, octPlaneRotPath_reaches e f c s hcs hc⟩

/-- ★ THE WORD — a FINITE PRODUCT of lifted octonion-block plane rotations (mixed orthonormal axis
    pairs, each off the antipode) is `JoinedIdQvC` (non-vacuously). Each factor is `JoinedIdQvC` by
    `joinedIdQvC_octBlockEndC_octPlaneRot`; the product by the word-induction `joinedIdQvC_listProd`
    (N157). The exact form the octonion-block `SO(8)` rotation decomposition produces, into the
    NON-VACUOUS target. -/
theorem joinedIdQvC_octPlaneRotWord
    (L : List (O Cut × O Cut × Cut × Cut))
    (hL : ∀ t ∈ L, gFormC t.1 t.1 = 1 ∧ gFormC t.2.1 t.2.1 = 1 ∧ gFormC t.1 t.2.1 = 0
            ∧ (t.2.2.1)^2 + (t.2.2.2)^2 = 1 ∧ 1 + t.2.2.1 ≠ 0) :
    JoinedIdQvC ((L.map (fun t => octBlockEndC (octPlaneRot t.1 t.2.1 t.2.2.1 t.2.2.2))).prod) := by
  apply joinedIdQvC_listProd
  intro g hg
  rw [List.mem_map] at hg
  obtain ⟨t, htL, hgt⟩ := hg
  obtain ⟨hee, hff, hef, hcirc, hanti⟩ := hL t htL
  rw [← hgt]
  exact joinedIdQvC_octBlockEndC_octPlaneRot t.1 t.2.1 t.2.2.1 t.2.2.2 hee hff hef hcirc hanti

/-! ## W8 NON-VACUITY — the concrete lifted quarter-turn moves an octonion axis and is JoinedIdQvC. -/

/-- The octonion-block quarter-turn `octPlaneRot e₂ je2 0 1` sends `e₂ ↦ je2` (the banked orthonormal
    pair `e2_gFormC_self`, `je2_gFormC_self`, `octDeflate_e2_je2_gFormC_zero`). The generator
    genuinely MOVES the axis — it is not the identity. -/
theorem octPlaneRot_e2je2_quarter_moves :
    octPlaneRot (CD.e2 : O Cut) (je2 : O Cut) 0 1 (CD.e2 : O Cut) = (je2 : O Cut) := by
  rw [octPlaneRot_apply, e2_gFormC_self, octDeflate_e2_je2_gFormC_zero]
  rw [show ((0:Cut) - 1) * 1 - 1 * 0 = -1 by ring, show (1:Cut) * 1 + (0 - 1) * 0 = 1 by ring]
  rw [neg_one_smul, one_smul]
  abel

/-- ★ W8 TEETH — the lifted quarter-turn `octBlockEndC (octPlaneRot e₂ je2 0 1)` sends `(0,0,e₂)` to
    `(0,0,je2)`, GENUINELY reading `1` on the moved `je2` slot:
    `gFormC ((octBlockEndC (octPlaneRot e₂ je2 0 1) (0,0,e₂)).2.2) je2 = 1`
    (`octPlaneRot_e2je2_quarter_moves` + `je2_gFormC_self`). The lifted generator is a non-trivial
    isometry — the path engine is not decoration. -/
theorem octBlockEndC_octPlaneRot_e2je2_moves_read :
    gFormC ((octBlockEndC (octPlaneRot (CD.e2 : O Cut) (je2 : O Cut) 0 1)
      ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.2) (je2 : O Cut) = 1 := by
  rw [octBlockEndC_apply]
  show gFormC (octPlaneRot (CD.e2 : O Cut) (je2 : O Cut) 0 1 (CD.e2 : O Cut)) (je2 : O Cut) = 1
  rw [octPlaneRot_e2je2_quarter_moves, je2_gFormC_self]

/-- ★ W8 — the concrete lifted quarter-turn `octBlockEndC (octPlaneRot e₂ je2 0 1)` is `JoinedIdQvC`
    (`0²+1²=1`, off the antipode `1+0≠0`, on the banked orthonormal pair). A genuine element of the
    NON-VACUOUS group-constrained path component, not the identity (`octBlockEndC_octPlaneRot_e2je2_
    moves_read` shows it moves `e₂`). -/
theorem joinedIdQvC_octBlockEndC_octPlaneRot_e2je2_quarter :
    JoinedIdQvC (octBlockEndC (octPlaneRot (CD.e2 : O Cut) (je2 : O Cut) 0 1)) := by
  refine joinedIdQvC_octBlockEndC_octPlaneRot (CD.e2 : O Cut) (je2 : O Cut) 0 1
    e2_gFormC_self je2_gFormC_self octDeflate_e2_je2_gFormC_zero (by ring) (by norm_num)

end
end Phys.Algebra
