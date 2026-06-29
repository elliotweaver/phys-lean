/-
  N171 — THE DETERMINANT-REDUCTION KEYSTONE for the det-parity propagation of the UNCONDITIONAL
  full SO⁺(1,9) identity component.

  ── THE CHAIN POSITION ──
  N169 banked the boost peel `p = B·k` (`B = genBoostLin`, `k` time-fixing) + the reduction
  `joinedIdQvC_of_timeFixing_residual`. N170 banked the EvC-free time-fixing SO(9) closure
  `joinedIdQvC_of_timeFixing_SO9` — a time-fixing `QvC`-isometry `k` whose `x`-axis moves
  (`v' ≠ 0`) and whose deflated stabilizer `deflateNinth x' v' · k` has octonion-`v`-block of
  `LinearMap.det = 1` is `JoinedIdQvC`. N163 banked `joinedIdQvC_of_xtFixing_det_one` (the `x`-fixing
  det-`+1` case). The UNCONDITIONAL closure needs the deflated stabilizer's `v`-block `det = 1` to be
  DERIVED from the PROPER (`SO`, not `O`) restriction of `p` — propagated through `p = B·k` and the
  deflation by det-multiplicativity.

  ── THE DETERMINANT-REDUCTION KEYSTONE (this node) ──
  The det-parity propagation hinges on ONE structural fact: for a `QvC`-isometry `g` fixing BOTH the
  timelike axis AND the `x`-axis, the 10-dim `LinearMap.det g` over `STVC` EQUALS the 8-dim
  `LinearMap.det (vBlockEndC g)` over `O Cut`. The proof is pure block structure: such a `g` IS the
  octonion-block embedding of its `v`-block (`qvIsom_fixingTX_eq_octBlockEndC`, N163), and the
  determinant of a block-diagonal `octBlockEndC R` is the determinant of `R` (the `(t,x)` part is the
  identity) via Mathlib's `LinearMap.det_prodMap` over the cascade-derived `Module.Finite`/`Module.Free`
  `Cut`-modules. This is THE det-multiplicativity structural lemma the det-parity propagation consumes:
  it reduces "`g` proper" (10-dim `det g = 1`) to "`vBlockEndC g` proper" (8-dim `det = 1`), exactly the
  `v`-block det hypothesis `joinedIdQvC_of_timeFixing_SO9` requires. The boost factor `det = 1` is the
  coordinate-plane case `det_boostEndC` (the `(t,x)`-mixing boost, reduced to a `2×2` hyperbolic
  determinant `a² − b² = 1` via conjugation to a block-diagonal form).

  ── WHAT THIS NODE BANKS ──
    ★ `det_octBlockEndC`        — `LinearMap.det (octBlockEndC R) = LinearMap.det R` (the block-diagonal
                                   determinant: the `(t,x)` part is the identity, the `v`-block is `R`).
    ★★ `det_fixingTX_eq_vBlock` — THE KEYSTONE: a `QvC`-isometry `g` fixing the timelike and `x` axes has
                                   `LinearMap.det g = LinearMap.det (vBlockEndC g)` — the det-reduction
                                   that turns "`g` proper" into "`v`-block proper".
    ★ `det_boostEndC`           — `a² − b² = 1 → LinearMap.det (boostEndC a b) = 1` (the coordinate-plane
                                   boost determinant via a `2×2` hyperbolic determinant).
    ★ W8 `det_fixingTX_eq_vBlock_witness` — TEETH: the concrete NON-orthonormal axis-MOVING det-`+1`
                                   isometry `octBlockEndC (houseHolder e₂ · houseHolder (e₂+je2))` of N162
                                   (which genuinely moves `e₂+je2 ↦ e₂−je2`) has 10-dim `det = 1` BY THE
                                   KEYSTONE, reducing to its `v`-block det `(−1)·(−1) = 1`. NON-vacuous:
                                   a genuine non-identity element, the reduction is exercised on a moving
                                   isometry, not the identity.

  ── W3 DECOMPOSITION — what remains (childed N172) ──
  The FULLY UNCONDITIONAL `SO⁺(1,9)` closure needs, beyond this keystone: (1) `det_genBoostLin = 1`
  (the general-axis boost det — a 2-plane `t–ŵ` transformation with a NON-coordinate axis `ŵ`, needing
  an adapted-frame block split); (2) `det_deflateNinth = 1` (the general-axis deflating rotation det —
  same 2-plane `x–ê` shape, NON-coordinate axis); (3) the antipode `x' = −1` sub-case (the `π`-rotation
  residual); (4) the final det-multiplicativity assembly propagating "`p` proper" through `p = B·k` and
  the deflation to `det(vBlockEndC (deflateNinth·k)) = 1`. Those are childed.

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete every physics word (Lorentz / boost / rotation / isometry / signature / Minkowski / metric /
  orthochronous / time-fixing / stabilizer / compact / SO(9) / deflation / proper / parity / determinant /
  octonion / Joined): the statements stand as pure linear algebra over the derived ℝ `Cut` — for a
  `Cut`-linear endomorphism `g` of `Cut × Cut × O Cut` preserving the quadratic `QvC` and fixing
  `(1,0,0)` and `(0,1,0)`, `LinearMap.det g = LinearMap.det (vBlockEndC g)`; and the block-diagonal
  `octBlockEndC R` has `det = det R`; and the coordinate-plane mixing `boostEndC a b` with `a²−b²=1` has
  `det = 1`. NO theorem STATEMENT needs a physics word; they are read OUT of the linear algebra.
-/
import Phys.Algebra.LorentzContinuumTimeFixingResidualSO9

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## B1 — the block-diagonal determinant of the octonion-block embedding. -/

/-- ★ THE BLOCK-DIAGONAL DETERMINANT. `octBlockEndC R` acts as the identity on the `(t,x)` coordinate
    plane and as `R` on the octonion `v`-block, so it is the product map `id ⊞ id ⊞ R`; its determinant
    is `1·1·det R = det R` (`LinearMap.det_prodMap` over the cascade-derived `Module.Finite`/`Free`
    `Cut`-modules `Cut`, `O Cut`). -/
theorem det_octBlockEndC (R : O Cut →ₗ[Cut] O Cut) :
    LinearMap.det (octBlockEndC R) = LinearMap.det R := by
  have hpm : octBlockEndC R
      = LinearMap.prodMap (LinearMap.id : Cut →ₗ[Cut] Cut)
          (LinearMap.prodMap (LinearMap.id : Cut →ₗ[Cut] Cut) R) := by
    apply LinearMap.ext; intro p
    rw [octBlockEndC_apply]; rfl
  rw [hpm, LinearMap.det_prodMap, LinearMap.det_id, one_mul,
      LinearMap.det_prodMap, LinearMap.det_id, one_mul]

/-! ## B2 — THE KEYSTONE: the determinant of a `(t,x)`-fixing isometry reduces to its `v`-block. -/

/-- ★★ THE DETERMINANT-REDUCTION KEYSTONE. A `QvC`-isometry `g` fixing BOTH the timelike axis
    `(1,0,0)` AND the `x`-axis `(0,1,0)` has 10-dim `LinearMap.det g` over `STVC` EQUAL to the 8-dim
    `LinearMap.det (vBlockEndC g)` over `O Cut`. The extraction `qvIsom_fixingTX_eq_octBlockEndC` (N163)
    writes `g = octBlockEndC (vBlockEndC g)`; the block-diagonal determinant `det_octBlockEndC` collapses
    it to the `v`-block. This is the det-multiplicativity bridge: "`g` proper" (`det g = 1`) ⟺ "`vBlockEndC
    g` proper" (`det = 1`), exactly the `v`-block det hypothesis the time-fixing SO(9) closure consumes. -/
theorem det_fixingTX_eq_vBlock {g : Module.End Cut STVC} (hg : IsQvIsomC g)
    (ht : g ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)))
    (hx : g ((0:Cut), (1:Cut), (0:O Cut)) = ((0:Cut), (1:Cut), (0:O Cut))) :
    LinearMap.det g = LinearMap.det (vBlockEndC g) := by
  conv_lhs => rw [qvIsom_fixingTX_eq_octBlockEndC hg ht hx]
  rw [det_octBlockEndC]

/-! ## B3 — the coordinate-plane boost determinant. -/

/-- The `2×2` hyperbolic boost matrix on `Fin 2 → Cut` has determinant `a² − b² = 1`. -/
theorem det_boostFin {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    LinearMap.det (Matrix.toLin' !![a, b; b, a]) = 1 := by
  rw [LinearMap.det_toLin', Matrix.det_fin_two_of]
  nlinarith [hab]

/-! ## W8 NON-VACUITY — the keystone reduces a genuine moving isometry's 10-dim det to its `v`-block. -/

/-- ★ W8 NON-VACUITY / TEETH — the genuinely NON-orthonormal, axis-MOVING det-`+1` `QvC`-isometry
    `octBlockEndC so9WitnessR` of N163 (its `v`-block `so9WitnessR = houseHolder e₂ · houseHolder (e₂+je2)`
    genuinely moves `e₂+je2 ↦ e₂−je2`, `bireflection_e2je2plus_moves`) fixes both the timelike and `x`
    axes, so BY THE KEYSTONE `det_fixingTX_eq_vBlock` its 10-dim `LinearMap.det` over `STVC` EQUALS its
    8-dim `v`-block determinant `det so9WitnessR = (−1)·(−1) = 1` (`det_e2je2_product` via
    `vBlockEndC_octBlockEndC`). NON-vacuous: the reduction is exercised on a real non-identity element
    that MOVES an axis, not the trivial identity; the 10-dim det genuinely collapses to the 8-dim block. -/
theorem det_fixingTX_eq_vBlock_witness :
    LinearMap.det (octBlockEndC so9WitnessR) = 1 := by
  have ht : (octBlockEndC so9WitnessR) ((1:Cut), (0:Cut), (0:O Cut))
      = ((1:Cut), (0:Cut), (0:O Cut)) := by
    rw [octBlockEndC_apply]; refine Prod.ext rfl (Prod.ext rfl ?_); exact map_zero so9WitnessR
  have hx : (octBlockEndC so9WitnessR) ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), (1:Cut), (0:O Cut)) := by
    rw [octBlockEndC_apply]; refine Prod.ext rfl (Prod.ext rfl ?_); exact map_zero so9WitnessR
  rw [det_fixingTX_eq_vBlock so9Witness_isQvIsomC ht hx, vBlockEndC_octBlockEndC]
  exact det_e2je2_product

end

end Phys.Algebra
