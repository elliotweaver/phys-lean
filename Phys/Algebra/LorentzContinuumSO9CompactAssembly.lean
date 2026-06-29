/-
  N163 — THE FULL TIME-FIXING SO(9) COMPACT FACTOR ASSEMBLY into the NON-VACUOUS `JoinedIdQvC`.

  N158 (`LorentzContinuumGenuineSO9Peel`) banked the core peel
  `joinedIdQvC_of_timeFixing_evCOrth_peel` / `joinedIdQvC_peel_reduce`: a time-fixing,
  EvC-orthogonal compact `QvC`-isometry `k` whose `x`-axis image MOVES (`k(0,1,0) = (0,x',v')`,
  `v' ≠ 0`) reduces — by peeling off one explicit unit-axis Givens rotation `inflateNinth x' v'` —
  to the `JoinedIdQvC` of its `x`-fixing stabilizer `deflateNinth x' v' · k`.
  N162 (`LorentzContinuumOctBlockSO8DetParity`) banked the UNCONDITIONAL octonion-block `SO(8)`
  closure `joinedIdQvC_octBlockEndC_of_det_one`: every `gFormC`-isometry `S` of `O Cut` with
  `LinearMap.det S = 1` lifts to the NON-VACUOUS `JoinedIdQvC (octBlockEndC S)`.

  THE SINGLE RESIDUAL joining the two is the EXTRACTION — the structural identification of the
  `x`-fixing, time-fixing stabilizer with the octonion-block embedding of its `v`-block:

  ★★ `qvIsom_fixingTX_eq_octBlockEndC` — a `QvC`-isometry `g` fixing BOTH the timelike axis
     `(1,0,0)` AND the `x`-axis `(0,1,0)` equals `octBlockEndC (vBlockEndC g)`.

  THE DERIVATION (pure trunk, via the indefinite Born form `BvC` and Born positivity, NO heavy
  tactic, NO coordinate brute):
    - `g` linear `QvC`-isometry ⟹ `BvC`-isometry (`linIsom_BvC_preserved`, N51).
    - For `w := g(0,0,v)`: `BvC(w, g(1,0,0)) = BvC((0,0,v),(1,0,0)) = 0` and `g(1,0,0)=(1,0,0)`;
      `BvC(·,(1,0,0))` reads the `t`-slot ⟹ `w.1 = 0`. Likewise `BvC(·,(0,1,0))` reads the
      `−x`-slot ⟹ `w.2.1 = 0`. So `g(0,0,v) = (0,0,(g(0,0,v)).2.2)` (`qvIsom_fixingTX_vanish`).
    - Decompose `(t,x,v) = t•(1,0,0)+x•(0,1,0)+(0,0,v)` and push `g` through linearity ⟹
      `g = octBlockEndC (vBlockEndC g)`.
    - `BvC((0,0,u),(0,0,w)) = −gFormC u w` ⟹ `gFormC (Ru)(Rw) = gFormC u w`: the `v`-block
      `vBlockEndC g` is a `gFormC`-isometry (`vBlockEndC_isGFormCIsom`).

  THE det `+1` CONDITION IS HONEST, NOT A WEAKENING. `JoinedIdQvC` is the
  path-component-of-the-identity predicate; `LinearMap.det` is continuous and `{±1}`-valued on the
  isometry group, hence LOCALLY CONSTANT — a `det = −1` element is in the OTHER topological
  component and is GENUINELY NOT `JoinedIdQvC`. So requiring `det = 1` on the octonion `v`-block
  states the identity component (`SO(9)`, not the disconnected `O(9)`) CORRECTLY. The full
  non-path-connected `O(9)` compact factor is NOT `JoinedIdQvC`; only the `SO(9)` component is.

  ★★ `joinedIdQvC_of_xtFixing_det_one` — the direct `x`-fixing case (extraction ∘ N162 closure,
     no peel): a det `+1` `QvC`-isometry fixing both axes is `JoinedIdQvC`.
  ★★ `joinedIdQvC_of_timeFixing_evCOrth_SO9_aux` / `joinedIdQvC_of_timeFixing_evCOrth_SO9` — THE
     ASSEMBLY: the N158 peel ∘ the extraction ∘ the N162 det-parity `SO(8)` closure, reaching the
     full time-fixing `SO(9)` compact factor as the NON-VACUOUS `JoinedIdQvC`.

  W8 NON-VACUITY (`joinedIdQvC_so9Witness_via_assembly`): the lift of N162's genuinely
  NON-orthonormal axis-MOVING det `+1` product `houseHolder e₂ · houseHolder (e₂+je2)` (sends
  `e₂+je2 ↦ e₂−je2`, NOT the identity) is `JoinedIdQvC` BY THIS NODE'S `x`-fixing assembly route,
  with `vBlockEndC` recovering it (`vBlockEndC_octBlockEndC`, the round-trip / left-inverse).

  Physics-words-removable: every theorem statement is pure linear algebra over the derived field
  `Cut` and the terminal algebra `O Cut` — the indefinite form `BvC`/`QvC`, the positive form
  `gFormC`, the explicit operator `deflateNinth`/`octBlockEndC`, `LinearMap.det`, and the operator
  topology predicate `JoinedIdQvC`. No theorem statement needs a physics word.
-/
import Phys.Algebra.LorentzContinuumGenuineSO9Peel
import Phys.Algebra.LorentzContinuumOctBlockSO8DetParity

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The octonion `v`-block of an operator, and its left-inverse round-trip. -/

/-- The octonion `v`-block of an operator: `v ↦ (g (0,0,v)).2.2`. -/
def vBlockEndC (g : Module.End Cut STVC) : O Cut →ₗ[Cut] O Cut where
  toFun v := (g ((0:Cut), (0:Cut), v)).2.2
  map_add' v w := by
    have h : (((0:Cut), (0:Cut), v + w) : STVC)
        = (((0:Cut), (0:Cut), v) : STVC) + (((0:Cut), (0:Cut), w) : STVC) := by
      refine Prod.ext ?_ (Prod.ext ?_ ?_) <;> simp
    rw [h, map_add]; rfl
  map_smul' c v := by
    have h : (((0:Cut), (0:Cut), c • v) : STVC) = c • (((0:Cut), (0:Cut), v) : STVC) := by
      refine Prod.ext ?_ (Prod.ext ?_ ?_) <;> simp
    rw [h, map_smul]; rfl

theorem vBlockEndC_apply (g : Module.End Cut STVC) (v : O Cut) :
    vBlockEndC g v = (g ((0:Cut), (0:Cut), v)).2.2 := rfl

/-! ## THE EXTRACTION — a `QvC`-isometry fixing the `(t,x)` plane is `octBlockEndC` of its `v`-block. -/

/-- The vanishing: a `QvC`-isometry fixing the timelike axis and the `x`-axis sends `(0,0,v)` to
    `(0,0,·)` — its `t` and `x` slots are forced to 0 by `BvC`-orthogonality. -/
theorem qvIsom_fixingTX_vanish {g : Module.End Cut STVC} (hg : IsQvIsomC g)
    (ht : g ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hx : g ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (1:Cut), (0:O Cut))) (v : O Cut) :
    g ((0:Cut), (0:Cut), v) = ((0:Cut), (0:Cut), vBlockEndC g v) := by
  have h1 : (g ((0:Cut), (0:Cut), v)).1 = 0 := by
    have h := linIsom_BvC_preserved hg ((0:Cut), (0:Cut), v) ((1:Cut), (0:Cut), (0:O Cut))
    rw [ht] at h
    simp only [BvC, gFormC_zero_right', mul_one, mul_zero, sub_zero] at h
    linarith [h]
  have h2 : (g ((0:Cut), (0:Cut), v)).2.1 = 0 := by
    have h := linIsom_BvC_preserved hg ((0:Cut), (0:Cut), v) ((0:Cut), (1:Cut), (0:O Cut))
    rw [hx] at h
    simp only [BvC, gFormC_zero_right', mul_one, mul_zero, sub_zero, zero_sub] at h
    linarith [h]
  refine Prod.ext h1 (Prod.ext h2 ?_)
  rfl

/-- ★★ THE EXTRACTION — a `QvC`-isometry fixing the timelike axis and the `x`-axis IS the octonion-
    block embedding of its `v`-block. Decompose `(t,x,v)` along the two fixed axes and the
    `v`-block; linearity + the vanishing collapse `g` to `octBlockEndC (vBlockEndC g)`. -/
theorem qvIsom_fixingTX_eq_octBlockEndC {g : Module.End Cut STVC} (hg : IsQvIsomC g)
    (ht : g ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hx : g ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (1:Cut), (0:O Cut))) :
    g = octBlockEndC (vBlockEndC g) := by
  apply LinearMap.ext
  rintro ⟨t, x, v⟩
  have hvan := qvIsom_fixingTX_vanish hg ht hx v
  have hdecomp : ((t, x, v) : STVC)
      = t • ((1:Cut), (0:Cut), (0:O Cut)) + x • ((0:Cut), (1:Cut), (0:O Cut))
        + ((0:Cut), (0:Cut), v) := by
    refine Prod.ext ?_ (Prod.ext ?_ ?_) <;> simp
  have hL : g ((t, x, v) : STVC) = (t, x, vBlockEndC g v) := by
    rw [hdecomp, map_add, map_add, map_smul, map_smul, ht, hx, hvan]
    refine Prod.ext ?_ (Prod.ext ?_ ?_) <;> simp
  rw [hL, octBlockEndC_apply]

/-- ★ The `v`-block of such a `g` is a `gFormC`-isometry of `O Cut`: `BvC` on the spatial block IS
    `−gFormC`, and `g` preserves `BvC`. -/
theorem vBlockEndC_isGFormCIsom {g : Module.End Cut STVC} (hg : IsQvIsomC g)
    (ht : g ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hx : g ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (1:Cut), (0:O Cut))) :
    IsGFormCIsom (vBlockEndC g) := by
  intro u w
  have h := linIsom_BvC_preserved hg ((0:Cut), (0:Cut), u) ((0:Cut), (0:Cut), w)
  rw [qvIsom_fixingTX_vanish hg ht hx u, qvIsom_fixingTX_vanish hg ht hx w] at h
  simp only [BvC, mul_zero, sub_zero, zero_sub, neg_inj] at h
  exact h

/-- ★ THE ROUND-TRIP — the `v`-block of the octonion-block embedding of `R` recovers `R`. The
    extraction `vBlockEndC` is a genuine left-inverse of `octBlockEndC` (the lift is not lossy). -/
theorem vBlockEndC_octBlockEndC (R : O Cut →ₗ[Cut] O Cut) :
    vBlockEndC (octBlockEndC R) = R := by
  apply LinearMap.ext; intro v
  rw [vBlockEndC_apply, octBlockEndC_apply]

/-! ## THE DIRECT `x`-FIXING CASE — extraction ∘ the N162 det-parity SO(8) closure. -/

/-- ★ THE DIRECT `x`-FIXING CASE: a det `+1` `QvC`-isometry fixing both axes is `JoinedIdQvC`. The
    extraction (`qvIsom_fixingTX_eq_octBlockEndC`) writes it as `octBlockEndC (vBlockEndC g)` with a
    `gFormC`-isometry `v`-block, and the det `+1` octonion-block closure (N162
    `joinedIdQvC_octBlockEndC_of_det_one`) lifts it into the NON-VACUOUS `JoinedIdQvC`. -/
theorem joinedIdQvC_of_xtFixing_det_one {g : Module.End Cut STVC} (hg : IsQvIsomC g)
    (ht : g ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hx : g ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (1:Cut), (0:O Cut)))
    (hdet : LinearMap.det (vBlockEndC g) = 1) :
    JoinedIdQvC g := by
  rw [qvIsom_fixingTX_eq_octBlockEndC hg ht hx]
  exact joinedIdQvC_octBlockEndC_of_det_one (vBlockEndC g)
    (vBlockEndC_isGFormCIsom hg ht hx) hdet

/-! ## THE ASSEMBLY — the N158 peel ∘ the extraction ∘ the N162 closure. -/

/-- `deflateNinth` fixes the timelike axis (its `axisRotLin` factor fixes `p.1`). -/
theorem deflateNinth_fixes_time (x' : Cut) (v' : O Cut) :
    deflateNinth x' v' ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)) := by
  unfold deflateNinth
  rw [axisRotLin_apply]
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show x' * 0 - (-(cutSqrt (gFormC v' v'))) * gFormC (0:O Cut) ((cutSqrt (gFormC v' v'))⁻¹ • v')
        = 0
    rw [gFormC_zero_left]; ring
  · show (0:O Cut)
        + ((-(cutSqrt (gFormC v' v'))) * 0
            + (x' - 1) * gFormC (0:O Cut) ((cutSqrt (gFormC v' v'))⁻¹ • v'))
          • ((cutSqrt (gFormC v' v'))⁻¹ • v') = 0
    rw [gFormC_zero_left]
    rw [mul_zero, mul_zero, add_zero, zero_smul, add_zero]

/-- ★★ THE FULL TIME-FIXING SO(9) COMPACT FACTOR ASSEMBLY (general `x'`/`v'` form). For a
    `QvC`-isometry `k` whose `x`-axis image moves to `(0,x',v')` with `v' ≠ 0`, IF the deflated
    stabilizer `deflateNinth x' v' · k` has octonion-`v`-block of `LinearMap.det = 1`, THEN `k` is
    `JoinedIdQvC`. The peel (N158 `joinedIdQvC_peel_reduce`) reduces `k` to the `x`-fixing,
    time-fixing stabilizer; the EXTRACTION identifies that stabilizer with the octonion-block
    embedding of its `v`-block (a `gFormC`-isometry); the det `+1` closure (N162) lifts it. -/
theorem joinedIdQvC_of_timeFixing_evCOrth_SO9_aux {k : Module.End Cut STVC}
    (hk : IsQvIsomC k)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    {x' : Cut} {v' : O Cut}
    (himg : k ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), x', v')) (hv : v' ≠ 0)
    (hdet : LinearMap.det (vBlockEndC (deflateNinth x' v' * k)) = 1) :
    JoinedIdQvC k := by
  have hnorm : x' ^ 2 + gFormC v' v' = 1 := isom_xaxis_image_norm hk himg
  have hS0isom : IsQvIsomC ((deflateNinth x' v' * k : Module.End Cut STVC) : STVC → STVC) := by
    intro p
    show QvC ((deflateNinth x' v' * k) p) = QvC p
    rw [Module.End.mul_apply, deflateNinth_isQvIsomC hv hnorm (k p), hk p]
  have hS0time : (deflateNinth x' v' * k) ((1:Cut), (0:Cut), (0:O Cut))
      = ((1:Cut), (0:Cut), (0:O Cut)) := by
    rw [Module.End.mul_apply, htime, deflateNinth_fixes_time]
  have hS0x : (deflateNinth x' v' * k) ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), (1:Cut), (0:O Cut)) :=
    deflateNinth_step hk himg hv
  apply joinedIdQvC_peel_reduce hk himg hv
  exact joinedIdQvC_of_xtFixing_det_one hS0isom hS0time hS0x hdet

/-- ★★ THE FULL TIME-FIXING SO(9) COMPACT FACTOR ASSEMBLY (component form, over the genuine polar
    compact-factor shape: `k` EvC-orthogonal AND time-fixing). The spatial-image lemma
    (`xaxis_image_spatial_form`, N158) supplies the `(0,x',v')` form the general assembly consumes. -/
theorem joinedIdQvC_of_timeFixing_evCOrth_SO9 {k kadj : Module.End Cut STVC}
    (hk : IsQvIsomC k) (hadj : IsEvCAdjoint k kadj) (horth : kadj.comp k = LinearMap.id)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hv : (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 ≠ 0)
    (hdet : LinearMap.det
      (vBlockEndC (deflateNinth (k ((0:Cut), (1:Cut), (0:O Cut))).2.1
        (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 * k)) = 1) :
    JoinedIdQvC k :=
  joinedIdQvC_of_timeFixing_evCOrth_SO9_aux hk htime
    (xaxis_image_spatial_form hadj horth htime) hv hdet

/-! ## W8 NON-VACUITY — a genuine NON-trivial element captured by the direct `x`-fixing assembly. -/

/-- The genuinely NON-orthonormal, axis-moving det `+1` octonion-block isometry of N162. -/
abbrev so9WitnessR : O Cut →ₗ[Cut] O Cut :=
  houseHolder (CD.e2 : O Cut) * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut))

/-- The lift `octBlockEndC so9WitnessR` is a `QvC`-isometry: its `v`-block `so9WitnessR` is a
    `gFormC`-isometry (product of two Householder reflections), so the embedding is a `BvC`-isometry
    (`octBlockEndC_isBvIsomLin`), hence a `QvC`-isometry (`BvC_self`). -/
theorem so9Witness_isQvIsomC :
    IsQvIsomC (octBlockEndC so9WitnessR) := by
  have hbne : gFormC ((CD.e2 : O Cut) + (je2 : O Cut)) ((CD.e2 : O Cut) + (je2 : O Cut)) ≠ 0 := by
    rw [e2_plus_je2_gFormC_self]; norm_num
  have he2 : gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) ≠ 0 := by
    rw [e2_gFormC_self]; norm_num
  have hIsom : IsGFormCIsom so9WitnessR := (houseHolder_isom he2).comp (houseHolder_isom hbne)
  intro p
  have hbv := octBlockEndC_isBvIsomLin hIsom p p
  rw [BvC_self, BvC_self] at hbv
  exact hbv

/-- ★ W8 NON-VACUITY — a GENUINE non-trivial element of the assembled compact factor. The lift
    `octBlockEndC so9WitnessR` (a) is a `QvC`-isometry fixing the timelike axis and the `x`-axis
    (`octBlockEndC` fixes `(t,x)`), (b) has `v`-block recovered by the extraction
    (`vBlockEndC (octBlockEndC so9WitnessR) = so9WitnessR`), (c) of `LinearMap.det = 1`
    (`det_e2je2_product`), so it is `JoinedIdQvC` BY THE NEW `x`-fixing assembly route — and it
    MOVES the axis `e₂+je2 ↦ e₂−je2` (`bireflection_e2je2plus_moves`), so it is NOT the identity. -/
theorem joinedIdQvC_so9Witness_via_assembly :
    JoinedIdQvC (octBlockEndC so9WitnessR) := by
  have ht : (octBlockEndC so9WitnessR) ((1:Cut), (0:Cut), (0:O Cut))
      = ((1:Cut), (0:Cut), (0:O Cut)) := by
    rw [octBlockEndC_apply]; refine Prod.ext rfl (Prod.ext rfl ?_); exact map_zero so9WitnessR
  have hx : (octBlockEndC so9WitnessR) ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), (1:Cut), (0:O Cut)) := by
    rw [octBlockEndC_apply]; refine Prod.ext rfl (Prod.ext rfl ?_); exact map_zero so9WitnessR
  have hdet : LinearMap.det (vBlockEndC (octBlockEndC so9WitnessR)) = 1 := by
    rw [vBlockEndC_octBlockEndC]; exact det_e2je2_product
  exact joinedIdQvC_of_xtFixing_det_one so9Witness_isQvIsomC ht hx hdet

end

end Phys.Algebra
