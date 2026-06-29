/-
  N170 — THE TIME-FIXING SPATIAL RESIDUAL CLOSURE (EvC-orthogonality DISSOLVED).

  ── THE CHAIN POSITION ──
  N169 banked THE BOOST PEEL: every orthochronous `QvC`-isometry `p` factors as `p = B · k` with
  `B = genBoostLin wx wv a b` a FORWARD general-axis boost (read off `p e₀`) and `k` a TIME-FIXING
  `QvC`-isometry (`k e₀ = e₀`), AND the reduction `joinedIdQvC_of_timeFixing_residual` (IF `k` is
  `JoinedIdQvC` THEN `p` is). The boost factor is FULLY DISCHARGED; the single residual closing the
  full `SO⁺(1,9)` identity component is purely spatial: the TIME-FIXING residual `k` is `JoinedIdQvC`.

  N163 banked `joinedIdQvC_of_timeFixing_evCOrth_SO9_aux`: a time-fixing `QvC`-isometry `k` whose
  `x`-axis image moves to `(0, x', v')` with `v' ≠ 0`, whose deflated stabilizer `deflateNinth x' v'·k`
  has octonion-`v`-block of `LinearMap.det = 1`, is `JoinedIdQvC`. But N163's component form
  `joinedIdQvC_of_timeFixing_evCOrth_SO9` consumed the `(0, x', v')` SPATIAL FORM of the `x`-axis image
  from an EvC-ORTHOGONALITY hypothesis (`xaxis_image_spatial_form`, via `evC_preserved_of_orth` /
  N158's `evCOrth_xaxis_image_time_zero`).

  ── THE ONE LAW REFRAME (W1/W5, the MEASURE-FIRST verdict) ──
  The EvC-orthogonality hypothesis is REDUNDANT. The spatial form `(k (0,1,0)).1 = 0` of a TIME-FIXING
  `QvC`-isometry follows from the INDEFINITE Born form `BvC` ALONE (N51 `linIsom_BvC_preserved` — every
  `QvC`-isometry preserves `BvC`), with NO auxiliary definite-form adjoint:
    `BvC (k (0,1,0)) (k e₀) = BvC (0,1,0) e₀ = 0` (isometry), and `k e₀ = e₀` (time-fixing), and
    `BvC (·) e₀` READS THE `t`-SLOT (`BvC p e₀ = p.1·1 − p.2.1·0 − gFormC p.2.2 0 = p.1`), so
    `(k (0,1,0)).1 = 0`.
  This is exactly the trunk lever N163's OWN `qvIsom_fixingTX_vanish` already used for the `(0,0,v)`
  block — applied to the `x`-axis. The residual does NOT fight; the EvC framing was simply heavier than
  the trunk needs. So the time-fixing `SO(9)` compact-factor closure holds with the EvC-orthogonality
  hypothesis DROPPED — a `QvC`-isometry that ONLY fixes the timelike axis already restricts to the
  spatial block. THE ONE LAW: the indefinite Born form (the trunk) is the lever, not the definite `EvC`.

  ── WHAT THIS NODE BANKS ──
    ★ `timeFixing_xaxis_time_zero`     — a time-fixing `QvC`-isometry sends the `x`-axis to a vector
                                          with ZERO timelike component (the BvC dissolution, EvC-free).
    `timeFixing_xaxis_spatial_form`    — repackaged to `k (0,1,0) = (0, x', v')`.
    ★★ `joinedIdQvC_of_timeFixing_SO9` — THE EvC-FREE TIME-FIXING SO(9) CLOSURE: a time-fixing
                                          `QvC`-isometry `k` whose `x`-axis moves (`v' ≠ 0`) and whose
                                          deflated stabilizer has `v`-block `det = 1` is `JoinedIdQvC`.
                                          Same conclusion as N163's `…_evCOrth_SO9` but with the
                                          EvC-orthogonality hypothesis DISSOLVED — fed by the
                                          BvC-derived spatial form into N163's `…_aux`.
    `deflate_inflate_id` / `vBlockEndC_one` — helpers for the witness (the deflation inverts the
                                          inflation; the `v`-block of the identity is the identity).
    ★ W8 `joinedIdQvC_timeFixingWitness` — TEETH: the concrete `inflateNinth (3/5) ((4/5)•e₂)`, a
                                          genuine time-fixing `QvC`-isometry that MOVES the `x`-axis
                                          (`(0,1,0) ↦ (0, 3/5, (4/5)•e₂) ≠ (0,1,0)`), is `JoinedIdQvC`
                                          BY THIS NODE'S EvC-free route (its deflated stabilizer is the
                                          identity, `v`-block `det = 1`). NON-vacuous: the `x`-axis
                                          genuinely moves, the route is not the identity stabilizer.

  ── W3 DECOMPOSITION — what remains (childed N171) ──
  The TIME-FIXING residual `k` of N169's boost peel is now `JoinedIdQvC` UNDER two residual hypotheses:
  (a) the `x`-axis MOVES (`v' ≠ 0`) — the antipode/`x`-fixing case `v' = 0` is N163's
  `joinedIdQvC_of_xtFixing_det_one` (also det-`+1`, no peel); (b) the deflated stabilizer's `v`-block
  has `det = 1` — the PROPER (`SO`, not `O`) restriction, which is HONEST (a `det = −1` element is in the
  OTHER topological component and is genuinely NOT `JoinedIdQvC`). The genuinely-heavy remainder closing
  the FULLY UNCONDITIONAL `SO⁺(1,9)` is the det-parity BOOKKEEPING: propagating "`p` proper" through the
  boost factorization `p = B·k` to "`det(v`-block of `deflateNinth·k) = 1`", plus folding in the `v' = 0`
  antipode case. That det-parity/antipode closure is childed.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete every physics word (Lorentz / boost / rotation / isometry / signature / Minkowski / metric /
  orthochronous / time-fixing / spatial / timelike / stabilizer / compact / SO(9) / deflation / Joined):
  the statements stand as pure mathematics over the derived ℝ `Cut` and the terminal algebra `O Cut` —
  for a `Cut`-linear endomorphism `k` of `Cut × Cut × O Cut` preserving the form `QvC` with
  `k (1,0,0) = (1,0,0)`, the first coordinate of `k (0,1,0)` is `0`; and if moreover
  `(k (0,1,0)).2.2 ≠ 0` and `LinearMap.det (vBlockEndC (deflateNinth … * k)) = 1`, then `k` lies in the
  preconnected isometry set through `1`. NO theorem STATEMENT needs a physics word.

  DERIVED from the banked chain: the indefinite Born form `BvC` + `linIsom_BvC_preserved` (N51); the
  time-fixing `SO(9)` assembly `joinedIdQvC_of_timeFixing_evCOrth_SO9_aux` + `vBlockEndC`/`vBlockEndC_apply`
  (N163); the deflation/inflation `deflateNinth`/`inflateNinth`/`axisRotLin_comp_same_axis`/
  `axisRotLin_one_zero`/`inflateNinth_apply_pole`/`inflateNinth_isQvIsomC`/`deflateNinth_axis_unit`
  (N113–N116); the unit-sphere witness `deflate_witness_norm`/`deflate_witness_v_ne` (N158); the square
  root `cutSqrt`/`cutSqrt_sq` + `gFormC_pos_of_ne` (N57). `LinearMap.ext`, `Module.End.mul_apply`,
  `nlinarith`, `LinearMap.det_id` are MACHINERY on the DERIVED objects (STANDARD §3). Foundations-only.

  NO posited Lorentz / Pin / Spin / gauge / G₂ group, NO posited topology / connectedness, NO posited
  KAK / polar product, NO posited compact group, NO posited SO(9)/SO(8) exhaustion, NO regression to the
  vacuous `JoinedIdC`, NO Mathlib ℝ/ℂ as content, NO bridge.
-/
import Phys.Algebra.LorentzContinuumSO9CompactAssembly

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## THE BvC DISSOLUTION — a time-fixing `QvC`-isometry restricts to the spatial block (EvC-free). -/

/-- ★ THE SPATIAL-FORM DISSOLUTION — a TIME-FIXING `QvC`-isometry `k` (`k (1,0,0) = (1,0,0)`) sends the
    `x`-axis unit vector `(0,1,0)` to a vector with ZERO timelike component, with NO EvC-orthogonality
    hypothesis. The INDEFINITE Born form alone: `k` preserves `BvC` (N51 `linIsom_BvC_preserved`), so
    `BvC (k (0,1,0)) (k (1,0,0)) = BvC (0,1,0) (1,0,0) = 0`; with `k (1,0,0) = (1,0,0)` and
    `BvC (·) (1,0,0)` reading the `t`-slot, `(k (0,1,0)).1 = 0`. THE ONE LAW: the trunk's indefinite
    form is the lever — the auxiliary definite form `EvC` (and its adjoint) is not needed. -/
theorem timeFixing_xaxis_time_zero {k : Module.End Cut STVC} (hk : IsQvIsomC k)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut))) :
    (k ((0:Cut), (1:Cut), (0:O Cut))).1 = 0 := by
  have h := linIsom_BvC_preserved hk ((0:Cut), (1:Cut), (0:O Cut)) ((1:Cut), (0:Cut), (0:O Cut))
  rw [htime] at h
  simp only [BvC, gFormC_zero_right', mul_one, mul_zero, sub_zero] at h
  linarith [h]

/-- The `x`-axis image of a time-fixing `QvC`-isometry is of the spatial form `(0, x', v')` — a
    repackaging of `timeFixing_xaxis_time_zero` exposing the form the deflation/peel consumes. -/
theorem timeFixing_xaxis_spatial_form {k : Module.End Cut STVC} (hk : IsQvIsomC k)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut))) :
    k ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), (k ((0:Cut), (1:Cut), (0:O Cut))).2.1,
          (k ((0:Cut), (1:Cut), (0:O Cut))).2.2) := by
  have h0 := timeFixing_xaxis_time_zero hk htime
  apply Prod.ext
  · exact h0
  · rfl

/-! ## THE EvC-FREE TIME-FIXING SO(9) CLOSURE. -/

/-- ★★ THE EvC-FREE TIME-FIXING SO(9) CLOSURE. A TIME-FIXING `QvC`-isometry `k` (`k (1,0,0) = (1,0,0)`)
    whose `x`-axis image MOVES (`(k (0,1,0)).2.2 ≠ 0`) and whose deflated stabilizer
    `deflateNinth x' v' · k` has octonion-`v`-block of `LinearMap.det = 1` is `JoinedIdQvC`. The SAME
    conclusion as N163's `joinedIdQvC_of_timeFixing_evCOrth_SO9` but with the EvC-ORTHOGONALITY
    hypothesis DISSOLVED: the BvC-derived spatial form (`timeFixing_xaxis_spatial_form`) feeds N163's
    `joinedIdQvC_of_timeFixing_evCOrth_SO9_aux` directly. THE ONE LAW: the trunk's indefinite form
    already restricts a time-fixing isometry to the spatial block — no definite-form adjoint needed. -/
theorem joinedIdQvC_of_timeFixing_SO9 {k : Module.End Cut STVC}
    (hk : IsQvIsomC k)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hv : (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 ≠ 0)
    (hdet : LinearMap.det
      (vBlockEndC (deflateNinth (k ((0:Cut), (1:Cut), (0:O Cut))).2.1
        (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 * k)) = 1) :
    JoinedIdQvC k := by
  have himg := timeFixing_xaxis_spatial_form hk htime
  exact joinedIdQvC_of_timeFixing_evCOrth_SO9_aux hk htime himg hv hdet

/-! ## Helpers for the W8 witness — the deflation/inflation group law and the identity `v`-block. -/

/-- The deflating rotation inverts the inflating rotation: `deflateNinth x' v' · inflateNinth x' v' = 1`
    (the `inflate_deflate_id` companion in the OTHER order). Same unit axis `r⁻¹•v'`, angle addition
    `(x',−r)·(x',r) = (x'² + r·r, 0) = (1, 0)` via `axisRotLin_comp_same_axis` + the unit-sphere law. -/
theorem deflate_inflate_id {x' : Cut} {v' : O Cut} (hv : v' ≠ 0)
    (hnorm : x' ^ 2 + gFormC v' v' = 1) :
    deflateNinth x' v' * inflateNinth x' v' = 1 := by
  set r := cutSqrt (gFormC v' v') with hrdef
  have he : gFormC ((cutSqrt (gFormC v' v'))⁻¹ • v') ((cutSqrt (gFormC v' v'))⁻¹ • v') = 1 :=
    deflateNinth_axis_unit hv
  have hrr : r * r = gFormC v' v' := cutSqrt_sq (le_of_lt (gFormC_pos_of_ne hv))
  unfold deflateNinth inflateNinth
  rw [axisRotLin_comp_same_axis _ he x' (-r) x' r]
  rw [show x' * x' - (-r) * r = (1:Cut) by nlinarith [hnorm, hrr]]
  rw [show x' * r + (-r) * x' = (0:Cut) by ring]
  exact axisRotLin_one_zero _

/-- The octonion-`v`-block of the identity operator is the identity linear map. -/
theorem vBlockEndC_one : vBlockEndC (1 : Module.End Cut STVC) = LinearMap.id := by
  apply LinearMap.ext; intro v
  rw [vBlockEndC_apply]
  rfl

/-! ## W8 NON-VACUITY — a concrete time-fixing `x`-moving `QvC`-isometry is `JoinedIdQvC` (EvC-free). -/

/-- ★ W8 NON-VACUITY / TEETH — the concrete inflate `inflateNinth (3/5) ((4/5)•e₂)` is a GENUINE
    time-fixing `QvC`-isometry that MOVES the `x`-axis (`(0,1,0) ↦ (0, 3/5, (4/5)•e₂) ≠ (0,1,0)`,
    its `v`-block `(4/5)•e₂` nonzero, `deflate_witness_v_ne`), and it is `JoinedIdQvC` BY THIS NODE'S
    EvC-FREE route `joinedIdQvC_of_timeFixing_SO9`: its deflated stabilizer
    `deflateNinth (3/5) ((4/5)•e₂) · inflateNinth (3/5) ((4/5)•e₂) = 1` is the identity
    (`deflate_inflate_id`), whose `v`-block is the identity (`vBlockEndC_one`) of `det = 1`. NON-vacuous:
    the `x`-axis genuinely moves, the closure is exercised on a real non-identity element of the
    compact factor, not the trivial stabilizer. -/
theorem joinedIdQvC_timeFixingWitness :
    JoinedIdQvC (inflateNinth ((3:Cut)/5) (((4:Cut)/5) • (CD.e2 : O Cut))) := by
  set v' : O Cut := ((4:Cut)/5) • (CD.e2 : O Cut) with hv'def
  set k : Module.End Cut STVC := inflateNinth ((3:Cut)/5) v' with hkdef
  have hvne : v' ≠ 0 := deflate_witness_v_ne
  have hnorm : ((3:Cut)/5) ^ 2 + gFormC v' v' = 1 := deflate_witness_norm
  have hk : IsQvIsomC k := inflateNinth_isQvIsomC hvne hnorm
  have htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)) := by
    rw [hkdef]; unfold inflateNinth; rw [axisRotLin_apply]
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show ((3:Cut)/5) * 0 - _ * gFormC (0:O Cut) _ = 0
      rw [gFormC_zero_left]; ring
    · show (0:O Cut) + (_ * 0 + _ * gFormC (0:O Cut) _) • _ = 0
      rw [gFormC_zero_left]; rw [mul_zero, mul_zero, add_zero, zero_smul, add_zero]
  have kpole : k ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (3:Cut)/5, v') := by
    rw [hkdef]; exact inflateNinth_apply_pole hvne hnorm
  have hv : (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 ≠ 0 := by rw [kpole]; exact hvne
  have hdet : LinearMap.det
      (vBlockEndC (deflateNinth (k ((0:Cut), (1:Cut), (0:O Cut))).2.1
        (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 * k)) = 1 := by
    rw [kpole]
    simp only
    rw [hkdef, deflate_inflate_id hvne hnorm, vBlockEndC_one, LinearMap.det_id]
  exact joinedIdQvC_of_timeFixing_SO9 hk htime hv hdet

end

end Phys.Algebra
