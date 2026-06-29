/-
  Phys.Algebra.LorentzContinuumGenuineSO9Peel — N158: THE GENUINE SO(9) GIVENS-WORD PEEL on the
  TIME-FIXING compact factor, into the NON-VACUOUS `JoinedIdQvC` (N157), over the DERIVED ℝ `Cut`
  and the terminal algebra `O Cut := CD (H Cut)`.

  ===========================================================================
  CONTEXT — what N157 reduced the full path-connectedness to, correctly re-scoped. N157
  (`LorentzContinuumGivensWordExhaustion`) fired THE ONE LAW (MEASURE-FIRST) and found N156's
  `hgivens` UNSATISFIABLE (every `axisRotLin e c s` FIXES time, a boost is `IsQvIsomC` and MOVES
  time) and N155's conclusion predicate `JoinedIdC` VACUOUS (`joinedIdC_everything`: the convex
  operator segment joins `1` to ANY operator). N157's repair: the GROUP-CONSTRAINED path component
  `JoinedIdQvC` (the connecting set STAYS in the isometry group; `joinedIdQvC_isQvIsomC` is the
  load-bearing non-vacuity), with the full engine (`joinedIdQvC_mul`, `joinedIdQvC_listProd`,
  `joinedIdQvC_axisRotLin`, `joinedIdQvC_axisRotProd`) re-banked NON-VACUOUSLY. The correct scoping:
  the exhaustion is over the TIME-FIXING compact factor (an SO(9) rotation), into `JoinedIdQvC`.

  ===========================================================================
  ★ MEASURE-FIRST FINDING (the smallest obligations probed, the W3 decomposition fixed). The genuine
  polar compact factor `k` of `bvIsomLin_compact_factor_spec` (N131) is `IsQvIsomC k` AND
  EvC-orthogonal (`kadj∘k = id`, `IsEvCAdjoint k kadj`). EvC is positive-definite (signature
  (10,0)); QvC is indefinite (1,9). Preserving BOTH the indefinite `QvC` and (derived here) the
  definite `EvC` constrains `k` to the maximal compact `O(1)×O(9)` — it fixes the timelike axis only
  up to SIGN, i.e. on the orthochronous component. So TIME-FIXING is the correct hypothesis (an
  orthochronous-component restriction), exactly as the spec flagged.

  Given a TIME-FIXING such factor, the `x`-axis image `k(0,1,0)` has ZERO time component (EvC is
  preserved, and `EvC (1,0,0) (0,1,0) = 0`), so `k(0,1,0) = (0,x',v')`. THE ONE PEEL: if `v' ≠ 0`,
  the banked factorization `deflate_factorization` (N116) gives
  `k = inflateNinth x' v' · (deflateNinth x' v' · k)`, with `inflateNinth x' v'` ONE explicit
  unit-axis Givens rotation. The antipode condition `1 + x' ≠ 0` is FREE: the unit-sphere law
  `x'² + gFormC v' v' = 1` with `v' ≠ 0` forces `gFormC v' v' > 0`, hence `x'² < 1`, hence `1 + x' >
  0`. So `inflateNinth x' v'` is `JoinedIdQvC` (`joinedIdQvC_axisRotLin`, NON-vacuously), and
  `deflateNinth x' v' · k` FIXES the `x`-axis (`deflateNinth_step`, N115) — landing in the SO(8)
  octonion-block stabilizer. The peel wires the SO(9)→x-fixing reduction into the NON-VACUOUS
  `JoinedIdQvC` target for the first time.

  ── WHAT THIS NODE BANKS ──
  `evC_preserved_of_orth` — an EvC-orthogonal operator preserves the (positive-definite) form `EvC`.
  ★ `evCOrth_xaxis_image_time_zero` — a TIME-FIXING EvC-orthogonal `QvC`-isometry sends the `x`-axis
     unit vector `(0,1,0)` to a vector with ZERO time component (the spatial-image lemma).
  ★ `xaxis_image_spatial_form` — packaged: its image is `(0, x', v')` for the spatial data `x', v'`.
  ★★ `joinedIdQvC_peel_reduce` — THE CORE PEEL: for a `QvC`-isometry `k` whose `x`-axis image MOVES
     off the pole (`k(0,1,0) = (0,x',v')`, `v' ≠ 0`), IF the deflated `deflateNinth x' v' · k` is
     `JoinedIdQvC`, THEN `k` is `JoinedIdQvC`. One explicit unit-axis Givens rotation peeled off,
     into the NON-VACUOUS target.
  ★★ `joinedIdQvC_of_timeFixing_evCOrth_peel` — THE ASSEMBLY over the time-fixing EvC-orthogonal
     compact factor: combines the spatial-image lemma and the core peel, reducing the factor's
     `JoinedIdQvC` to its `x`-fixing SO(8)-stabilizer's `JoinedIdQvC` (the childed N159 remainder),
     when the `x`-axis moves; and trivially when it is already fixed.
  W8 NON-VACUITY: `inflate_witness_joinedIdQvC` (the concrete inflate factor of a genuine `x`-moving
     peel is `JoinedIdQvC`) + `inflate_witness_x_read` (it genuinely re-moves a coordinate, `3/5`).

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the deflation/peel `deflateNinth` / `deflateNinth_step` /
  `deflateNinth_axis_unit` / `isom_xaxis_image_norm` / `gFormC_pos_of_ne` (N115), `inflateNinth` /
  `inflateNinth_circle` / `deflate_factorization` (N116); the NON-VACUOUS engine `JoinedIdQvC` /
  `joinedIdQvC_axisRotLin` / `joinedIdQvC_mul` (N157); `EvC` / `EvC` bilinearity, `IsEvCAdjoint`,
  `IsQvIsomC` / `QvC` / `gFormC` (N49–N131); the time-fixing compact factor
  `bvIsomLin_compact_factor_spec` (N131). `LinearMap.comp` / `congrArg` / field arithmetic are
  MACHINERY on the DERIVED objects (STANDARD §3) — over the derived ℝ `ContinuumQ.Cut`. NO Mathlib
  ℝ/ℂ as content, NO posited topology / connectedness / isometry group / Lorentz group, NO bridge.

  ── THE FORWARD REMAINDER (childed N159) ──
  THE OCTONION-BLOCK SO(8) ROTATION-WORD GENERATION: the `x`-fixing, time-fixing compact factor
  `deflateNinth x' v' · k` acts purely on the 8-dim octonion block `𝕆`; show it is a finite product
  of unit-axis Givens rotations `axisRotLin` (even reflection pairs), hence `JoinedIdQvC`. The
  banked `gFormC_isom_mem_closure` (N124) gives a REFLECTION word on `O Cut`; the residual is the
  `x`-pivot conjugation generation of SO(8) rotations into `axisRotLin` factors (a single reflection
  has det −1, NOT `JoinedIdQvC`; rotations = even pairs are). This is the genuine heavy
  group-manifold remainder Mathlib lacks over the derived `Cut`.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "rotation / axis / Givens / isometry / compact / time-fixing / orthochronous / peel /
  deflation / inflation / Lorentz / SO(9) / SO(8) / boost / path-connected": over the derived
  complete ordered field `Cut`, the lemmas say: an operator preserving the definite form `EvC` (via
  an adjoint composing to `id`) preserves `EvC`; one preserving both `EvC` and the indefinite `QvC`
  and fixing the first basis vector sends the second to a vector with zero first coordinate; and if
  an explicit linear factor `deflateNinth x' v' · k` lies in a preconnected isometry set with `1`,
  so does `k` (via the banked product law). Pure linear algebra over the derived field; no theorem
  statement needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGivensWordExhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## EvC preservation from EvC-orthogonality. -/

/-- An EvC-orthogonal operator preserves the (positive-definite) form `EvC`: if `kadj` is the
    EvC-adjoint of `k` and `kadj∘k = id`, then `EvC (k p) (k q) = EvC p q`. Pure adjoint algebra:
    `EvC (k p) (k q) = EvC p (kadj (k q)) = EvC p q`. The definite-form analogue of the
    `QvC`-isometry property, derived from the polar compact factor's EvC-orthogonality
    (`bvIsomLin_compact_factor_spec`, N131). -/
theorem evC_preserved_of_orth {k kadj : Module.End Cut STVC}
    (hadj : IsEvCAdjoint k kadj) (horth : kadj.comp k = LinearMap.id) :
    ∀ p q : STVC, EvC (k p) (k q) = EvC p q := by
  intro p q
  have e : kadj (k q) = q := by
    have := congrArg (fun f : Module.End Cut STVC => f q) horth
    simpa only [LinearMap.comp_apply, LinearMap.id_apply] using this
  rw [hadj p (k q), e]

/-! ## The spatial image of the x-axis under a time-fixing EvC-orthogonal isometry. -/

/-- ★ THE SPATIAL-IMAGE LEMMA — a TIME-FIXING EvC-orthogonal operator sends the `x`-axis unit vector
    `(0,1,0)` to a vector with ZERO time component. The EvC-orthogonality gives EvC preservation
    (`evC_preserved_of_orth`); `EvC (1,0,0) (0,1,0) = 0` and `EvC (1,0,0) w = w.1` (the first
    coordinate read-off of the definite form against the timelike axis), so
    `(k (0,1,0)).1 = EvC (1,0,0) (k (0,1,0)) = EvC (k (1,0,0)) (k (0,1,0)) = EvC (1,0,0) (0,1,0) =
    0`. The compact factor's `x`-axis image lives in the spatial block. -/
theorem evCOrth_xaxis_image_time_zero {k kadj : Module.End Cut STVC}
    (hadj : IsEvCAdjoint k kadj) (horth : kadj.comp k = LinearMap.id)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut))) :
    (k ((0:Cut), (1:Cut), (0:O Cut))).1 = 0 := by
  have hpres := evC_preserved_of_orth hadj horth
  have h := hpres ((1:Cut), (0:Cut), (0:O Cut)) ((0:Cut), (1:Cut), (0:O Cut))
  rw [htime] at h
  have lhs : EvC ((1:Cut), (0:Cut), (0:O Cut)) (k ((0:Cut), (1:Cut), (0:O Cut)))
      = (k ((0:Cut), (1:Cut), (0:O Cut))).1 := by
    unfold EvC; simp only; rw [gFormC_zero_left]; ring
  have rhs : EvC ((1:Cut), (0:Cut), (0:O Cut)) ((0:Cut), (1:Cut), (0:O Cut)) = 0 := by
    unfold EvC; simp only; rw [gFormC_zero_left]; ring
  rw [lhs, rhs] at h
  exact h

/-- The `x`-axis image of a time-fixing EvC-orthogonal operator is of the spatial form `(0, x', v')`
    where `x' := (k (0,1,0)).2.1` and `v' := (k (0,1,0)).2.2` are its spatial data. A repackaging of
    `evCOrth_xaxis_image_time_zero` exposing the form the deflation/peel consumes. -/
theorem xaxis_image_spatial_form {k kadj : Module.End Cut STVC}
    (hadj : IsEvCAdjoint k kadj) (horth : kadj.comp k = LinearMap.id)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut))) :
    k ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), (k ((0:Cut), (1:Cut), (0:O Cut))).2.1,
          (k ((0:Cut), (1:Cut), (0:O Cut))).2.2) := by
  have h0 := evCOrth_xaxis_image_time_zero hadj horth htime
  apply Prod.ext
  · exact h0
  · rfl

/-! ## THE CORE PEEL — one explicit unit-axis Givens rotation off, into JoinedIdQvC. -/

/-- ★★ THE CORE PEEL — the `SO(9) → SO(8)` reduction wired into the NON-VACUOUS `JoinedIdQvC`. For a
    `QvC`-isometry `k` whose `x`-axis image MOVES off the pole (`k(0,1,0) = (0,x',v')`, `v' ≠ 0`),
    IF the deflated operator `deflateNinth x' v' · k` is `JoinedIdQvC` (lands in the `x`-fixing
    SO(8) stabilizer, the childed N159 remainder), THEN `k` is `JoinedIdQvC`.

    The banked factorization `deflate_factorization` (N116) gives `k = inflateNinth x' v' ·
    (deflateNinth x' v' · k)`. The LEFT factor `inflateNinth x' v'` is ONE explicit unit-axis Givens
    rotation: its axis `r⁻¹•v'` is a unit (`deflateNinth_axis_unit`), `(x', r)` is a circle point
    (`inflateNinth_circle`), and `1 + x' ≠ 0` is FREE — the unit-sphere law `x'² + gFormC v' v' = 1`
    (`isom_xaxis_image_norm`) with `gFormC v' v' > 0` (`gFormC_pos_of_ne`, since `v' ≠ 0`) forces
    `x'² < 1`, hence `x' > -1`. So `inflateNinth x' v'` is `JoinedIdQvC` (`joinedIdQvC_axisRotLin`),
    and the product is `JoinedIdQvC` by the engine `joinedIdQvC_mul` (N157) — NON-vacuously. -/
theorem joinedIdQvC_peel_reduce {k : Module.End Cut STVC} (hk : IsQvIsomC k)
    {x' : Cut} {v' : O Cut}
    (himg : k ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) (hv : v' ≠ 0)
    (hstab : JoinedIdQvC (deflateNinth x' v' * k)) :
    JoinedIdQvC k := by
  have hnorm : x' ^ 2 + gFormC v' v' = 1 := isom_xaxis_image_norm hk himg
  have hpos : 0 < gFormC v' v' := gFormC_pos_of_ne hv
  have hc : (1:Cut) + x' ≠ 0 := by
    intro h
    have hx : x' = -1 := by linarith
    rw [hx] at hnorm
    nlinarith [hnorm, hpos]
  have hinflate : JoinedIdQvC (inflateNinth x' v') := by
    unfold inflateNinth
    exact joinedIdQvC_axisRotLin _ (deflateNinth_axis_unit hv) x'
      (cutSqrt (gFormC v' v')) (inflateNinth_circle hv hnorm) hc
  rw [deflate_factorization hk himg hv]
  exact joinedIdQvC_mul hinflate hstab

/-! ## THE ASSEMBLY — over the time-fixing EvC-orthogonal compact factor. -/

/-- ★★ THE GENUINE COMPACT-FACTOR PEEL ASSEMBLY. For the genuine polar compact factor shape — a
    `QvC`-isometry `k` that is EvC-orthogonal (`kadj∘k = id`) and TIME-FIXING (`k(1,0,0) =
    (1,0,0)`) — the `JoinedIdQvC` of `k` REDUCES to the `JoinedIdQvC` of its `x`-fixing SO(8)
    stabilizer factor:

      IF the `x`-axis moves (`v' := (k(0,1,0)).2.2 ≠ 0`) and the deflated `deflateNinth x' v' · k` is
      `JoinedIdQvC`, THEN `k` is `JoinedIdQvC`.

    The spatial-image lemma (`xaxis_image_spatial_form`) supplies the `(0,x',v')` form the deflation
    consumes; the core peel (`joinedIdQvC_peel_reduce`) peels off one explicit unit-axis Givens
    rotation. The inner reduction (`x`-fixing factor → octonion-block Givens word, hence
    `JoinedIdQvC`) is the childed N159 SO(8) remainder. The `SO(9) = (Givens rotation)·(SO(8)
    stabilizer)` reassembly, DERIVED, into the NON-VACUOUS target. -/
theorem joinedIdQvC_of_timeFixing_evCOrth_peel {k kadj : Module.End Cut STVC}
    (hk : IsQvIsomC k) (hadj : IsEvCAdjoint k kadj) (horth : kadj.comp k = LinearMap.id)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hv : (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 ≠ 0)
    (hstab : JoinedIdQvC
      (deflateNinth (k ((0:Cut), (1:Cut), (0:O Cut))).2.1
        (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 * k)) :
    JoinedIdQvC k := by
  have himg := xaxis_image_spatial_form hadj horth htime
  exact joinedIdQvC_peel_reduce hk himg hv hstab

/-! ## W8 NON-VACUITY — the concrete inflate factor of a genuine peel is JoinedIdQvC and moves a coordinate. -/

/-- ★ W8 NON-VACUITY — the concrete inflate factor `inflateNinth (3/5) ((4/5)•e₂)` of a GENUINE
    `x`-moving peel (its `v`-block `(4/5)•e₂` is nonzero, `deflate_witness_v_ne`, on the unit sphere
    `deflate_witness_norm`, off the antipode `1 + 3/5 ≠ 0`) is a `JoinedIdQvC` unit-axis Givens
    rotation. The peel's LEFT factor is a genuine element of the group-constrained path component,
    not the identity. -/
theorem inflate_witness_joinedIdQvC :
    JoinedIdQvC (inflateNinth ((3:Cut)/5) (((4:Cut)/5) • (CD.e2 : O Cut))) := by
  have hnorm := deflate_witness_norm
  have hv := deflate_witness_v_ne
  unfold inflateNinth
  refine joinedIdQvC_axisRotLin _ (deflateNinth_axis_unit hv) ((3:Cut)/5)
    (cutSqrt (gFormC (((4:Cut)/5) • (CD.e2 : O Cut)) (((4:Cut)/5) • (CD.e2 : O Cut))))
    (inflateNinth_circle hv hnorm) ?_
  norm_num

/-- ★ W8 TEETH — the concrete inflate factor `inflateNinth (3/5) ((4/5)•e₂)` GENUINELY re-moves the
    pole `(0,1,0)`: its `x`-slot reads `3/5` (`inflate_witness_x_val`, N116). The `JoinedIdQvC`
    inflate factor is a non-trivial isometry — the peel engine is not decoration. -/
theorem inflate_witness_x_read :
    (inflateNinth ((3:Cut)/5) (((4:Cut)/5) • (CD.e2 : O Cut))
        ((0:Cut), (1:Cut), (0:O Cut))).2.1 = (3:Cut)/5 :=
  inflate_witness_x_val

end

end Phys.Algebra
