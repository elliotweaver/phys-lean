/-
  N165 — THE FULL SO⁺(1,9) IDENTITY-COMPONENT ASSEMBLY (the KAK product + the polar reduction).

  ── THE CHAIN POSITION ──
  N164 banked the BOOST factor `joinedIdQvC_boostEndC` (a forward boost `boostEndC a b`,
  `a²−b²=1`, `0<a`, is the NON-VACUOUS `JoinedIdQvC`) and the polar assembly
  `joinedIdQvC_boost_compact` (`boostEndC a b · k` is `JoinedIdQvC` for ANY `JoinedIdQvC` compact
  factor `k`, via the engine `joinedIdQvC_mul`, N157). N163 banked the full TIME-FIXING `SO(9)`
  compact factor as `JoinedIdQvC` (`joinedIdQvC_of_timeFixing_evCOrth_SO9`). N131 banked the
  CONVERSE polar decomposition `bvIsomLin_polar_path_decomp` (an ARBITRARY `BvC`-isometry `S`
  factors as `S = k · γ(1)`: `k := S∘(p^{1/2})⁻¹` a `QvC`-isometry compact factor, `γ(1)` the
  EvC-positive self-adjoint positive part of `p = S*S`). This node ASSEMBLES them.

  ── MEASURE-FIRST / THE ONE LAW verdict ──
  The polar positive part `γ(1) = specOpN (cutSqrt∘c) u` is a GENERAL EvC-positive self-adjoint
  operator — NOT a single `boostEndC`. The banked affine cone-path `specPathOp` connecting
  `id → γ(1)` stays POSITIVE but LEAVES the isometry group (intermediate positive operators are
  not `QvC`-isometries), so it does NOT witness `JoinedIdQvC (γ 1)`. Establishing the general
  positive-part factor as `JoinedIdQvC` needs a path of ISOMETRIES (a spectral `t`-power
  hyperbolic boost-family / the KAK frame product of single-axis boosts each reached by N164's
  `boostPath`) — the SINGLE genuine residual, scoped to the dedicated W1 dissolution node N166.

  This node banks the TWO clean forward levers (no fresh exhaustion, no re-derivation):

    ★★ `joinedIdQvC_boost_so9compact` — THE EXPLICIT KAK PRODUCT ASSEMBLY. For a forward boost
       (`a²−b²=1`, `0<a`) and a compact factor `k` satisfying N163's time-fixing / EvC-orthogonal /
       det-+1 hypotheses, the polar product `boostEndC a b · k` is the NON-VACUOUS `JoinedIdQvC` —
       the canonical KAK shape (boost · time-fixing `SO(9)` rotation) of a full `SO⁺(1,9)`
       identity-component element, proved end-to-end (`joinedIdQvC_boost_compact` ∘
       `joinedIdQvC_of_timeFixing_evCOrth_SO9`).

    ★★ `bvIsomLin_polar_reduction` — THE POLAR REDUCTION. For an ARBITRARY `BvC`-isometry `S`, the
       converse decomposition exhibits `k`, `p` with `k` a `QvC`-isometry, `p` EvC-positive
       self-adjoint, `k · p = S`, and: IF `k` is `JoinedIdQvC` AND `p` is `JoinedIdQvC` THEN `S` is
       `JoinedIdQvC` (`joinedIdQvC_mul` on `k · p = S`). The global assembly reduced to the SINGLE
       open positive-part residual — the way N104/N132 reduced converse generation to one residual.

  ── PHYSICS-WORDS-REMOVABLE ──
  Delete every physics word (Lorentz / boost / rotation / KAK / polar / compact / SO(9) /
  orthochronous / proper / Minkowski / isometry / positive-part / self-adjoint / spectral …):
  the statements stand as pure mathematics about the banked operators `boostEndC`, `octBlockEndC`,
  `specOpN`, the NON-VACUOUS predicate `JoinedIdQvC` (a preconnected set of `QvC`-preservers
  containing `1`), the engine `joinedIdQvC_mul`, and the converse decomposition
  `bvIsomLin_polar_path_decomp` — all over the derived ℝ `Cut` and the terminal algebra `O Cut`.
  NO posited Lorentz / Pin / Spin / gauge / G₂ group, NO posited topology / connectedness, NO
  posited KAK / polar product, NO posited boost flow / rapidity, NO regression to the vacuous
  `JoinedIdC`, NO Mathlib ℝ/ℂ as content, NO bridge.

  DECLS:
    ★★ joinedIdQvC_boost_so9compact          — the explicit KAK product assembly.
    ★★ bvIsomLin_polar_reduction             — the polar reduction to the single positive residual.
    W8 joinedIdQvC_boostWitness_so9Witness   — a concrete boost · (axis-MOVING SO(9) rotation)
                                                product is the NON-VACUOUS `JoinedIdQvC`.
    W8 boostWitness_so9Witness_moves_time    — that product MOVES the timelike axis (reads 5/3).
-/
import Phys.Algebra.LorentzContinuumBoostPolarFactor
import Phys.Algebra.LorentzContinuumGenerationConversePolar

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## (A) THE EXPLICIT KAK PRODUCT ASSEMBLY -/

/-- ★★ THE EXPLICIT KAK PRODUCT ASSEMBLY — for a FORWARD boost `boostEndC a b` (`a²−b²=1`, `0<a`,
    the orthochronous branch) and a compact factor `k` satisfying N163's time-fixing /
    EvC-orthogonal / det-+1 hypotheses (the time-fixing `SO(9)` rotation), the polar/KAK product
    `boostEndC a b · k` is the NON-VACUOUS `JoinedIdQvC`. This is the canonical KAK shape of a full
    `SO⁺(1,9)` identity-component element (boost · time-fixing `SO(9)` rotation), proved end-to-end:
    `joinedIdQvC_of_timeFixing_evCOrth_SO9` (N163) makes the compact factor `JoinedIdQvC`, and
    `joinedIdQvC_boost_compact` (N164) glues the boost factor through the engine `joinedIdQvC_mul`
    (N157). The `0 < a` (forward) and det-+1 (proper) conditions state the identity component
    correctly — they are honest, not weakenings. -/
theorem joinedIdQvC_boost_so9compact {a b : Cut} (hab : a^2 - b^2 = 1) (ha : 0 < a)
    {k kadj : Module.End Cut STVC}
    (hk : IsQvIsomC k) (hadj : IsEvCAdjoint k kadj) (horth : kadj.comp k = LinearMap.id)
    (htime : k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hv : (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 ≠ 0)
    (hdet : LinearMap.det
      (vBlockEndC (deflateNinth (k ((0:Cut), (1:Cut), (0:O Cut))).2.1
        (k ((0:Cut), (1:Cut), (0:O Cut))).2.2 * k)) = 1) :
    JoinedIdQvC (boostEndC a b * k) :=
  joinedIdQvC_boost_compact hab ha
    (joinedIdQvC_of_timeFixing_evCOrth_SO9 hk hadj horth htime hv hdet)

/-! ## (B) THE POLAR REDUCTION -/

/-- ★★ THE POLAR REDUCTION — for an ARBITRARY `BvC`-isometry `S`, the converse polar decomposition
    (`bvIsomLin_polar_path_decomp`, N131) exhibits a compact factor `k := S∘(p^{1/2})⁻¹` (a
    `QvC`-isometry), a positive self-adjoint part `p := γ(1)` (EvC-symmetric, EvC-positive), with
    `k · p = S`, AND the conditional assembly: IF `k` is `JoinedIdQvC` AND `p` is `JoinedIdQvC`,
    THEN `S` is `JoinedIdQvC` (the engine `joinedIdQvC_mul`, N157, on `k · p = S`). The global
    `SO⁺(1,9)` identity-component assembly for an arbitrary proper orthochronous `S` is thereby
    reduced to the SINGLE residual `JoinedIdQvC (γ 1)` (the positive-part factor) — the way
    N104/N132 reduced converse generation to one word-membership residual, with NO operator
    topology / `exp`, NO posited polar product. The positive-part residual is the dedicated W1
    dissolution node N166. -/
theorem bvIsomLin_polar_reduction {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (k p : Module.End Cut STVC),
      IsQvIsomC k ∧ IsEvCSymm p ∧ (∀ q, 0 ≤ EvC (p q) q) ∧
      k * p = S ∧
      (JoinedIdQvC k → JoinedIdQvC p → JoinedIdQvC S) := by
  obtain ⟨h, n, c, u, γ, _h1, _h2, _h3, _h4, h5, h6, h7, h8⟩ :=
    bvIsomLin_polar_path_decomp hS
  rw [← Module.End.mul_eq_comp] at h8
  refine ⟨S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u), γ 1, h7, h5 1,
    fun q => h6 1 (by norm_num) (by norm_num) q, h8, ?_⟩
  intro hk hp
  rw [← h8]
  exact joinedIdQvC_mul hk hp

/-! ## (C) W8 NON-VACUITY — a concrete non-identity boost · (SO(9) rotation) product. -/

/-- ★ W8 NON-VACUITY — the concrete KAK product `boostEndC (5/3) (4/3) · octBlockEndC so9WitnessR`
    of a genuine FORWARD boost (`(5/3)²−(4/3)²=1`, `0<5/3`) with N162/N163's genuinely
    NON-orthonormal, axis-MOVING det-+1 `SO(9)` rotation `octBlockEndC so9WitnessR` (which is
    `JoinedIdQvC` by `joinedIdQvC_so9Witness_via_assembly`) is the NON-VACUOUS `JoinedIdQvC` — a
    genuine non-trivial full `SO⁺(1,9)` identity-component element in KAK form. -/
theorem joinedIdQvC_boostWitness_so9Witness :
    JoinedIdQvC (boostEndC ((5:Cut)/3) ((4:Cut)/3) * octBlockEndC so9WitnessR) :=
  joinedIdQvC_boost_compact boostWitness_hab (by norm_num) joinedIdQvC_so9Witness_via_assembly

/-- ★ W8 TEETH — the KAK product `boostEndC (5/3) (4/3) · octBlockEndC so9WitnessR` GENUINELY MOVES
    the timelike axis: the `SO(9)` rotation fixes `(1,0,0)` (its octonion block sends `0 ↦ 0`), and
    the forward boost then sends `(1,0,0) ↦ (5/3, 4/3, 0)`, reading `5/3` on the time slot. The KAK
    element is a non-trivial isometry — the assembly is not decoration. This is the distinguishing
    read-off the costume C197 bites (a wrong value forces the false numeric `1 = 165`). -/
theorem boostWitness_so9Witness_moves_time :
    (boostEndC ((5:Cut)/3) ((4:Cut)/3) * octBlockEndC so9WitnessR)
        ((1:Cut), (0:Cut), (0:O Cut))
      = ((5:Cut)/3, (4:Cut)/3, (0:O Cut)) := by
  rw [Module.End.mul_apply, octBlockEndC_apply]
  have hz : so9WitnessR (0 : O Cut) = 0 := map_zero so9WitnessR
  rw [hz, boostEndC_apply]
  refine Prod.ext ?_ (Prod.ext ?_ rfl)
  · show (5:Cut)/3 * 1 + (4:Cut)/3 * 0 = (5:Cut)/3; ring
  · show (4:Cut)/3 * 1 + (5:Cut)/3 * 0 = (4:Cut)/3; ring

end

end Phys.Algebra
