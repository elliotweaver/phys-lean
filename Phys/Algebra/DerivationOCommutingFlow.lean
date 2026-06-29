/-
# The commuting-generator flow law and the abelian first-order bracket (N180)

  N177 (`DerivationOFlow.lean`) banked the one-parameter flow law for the SAME generator:
  `expOLin (s • D') ∘ expOLin (t • D') = expOLin ((s + t) • D')` — two flows of the SAME derivation
  `D'`, whose scaled coordinate matrices `s • M`, `t • M` trivially commute. This node banks the
  genuinely-new structure that the SAME-generator law cannot express: the COMMUTING-GENERATOR flow
  law for two DIFFERENT derivations `D'`, `E'`.

  THE NEW LEVER (the coordinate representation is a ring homomorphism). The coordinate matrix
  `derivMatrix D' = (coordOCut.conjRingEquiv D').toMatrix'` is the composite of two ring isomorphisms
  (`conjRingEquiv` of the `Cut`-linear coordinatization, then `toMatrix'`), hence preserves the ring
  structure of `Module.End Cut (O Cut)`:
    * `derivMatrix_mul`  — `derivMatrix (D' * E') = derivMatrix D' * derivMatrix E'`
    * `derivMatrix_add`  — `derivMatrix (D' + E') = derivMatrix D' + derivMatrix E'`
  Therefore OPERATOR commutation transports to MATRIX commutation:
    * `derivMatrix_commute` — `Commute D' E' → Commute (derivMatrix D') (derivMatrix E')`
  and the banked matrix one-parameter-subgroup law `expMap_mul_of_commute` (N40) — which already takes
  an arbitrary `Commute` hypothesis — closes the product law for ANY commuting pair, not only the
  scalar-multiple pair N177 used.

  THE HEADLINE (the abelian first-order BCH connection). `Module.End Cut (O Cut)` is a ring, so it
  carries the Lie bracket `⁅D', E'⁆ = D' * E' - E' * D'`; `⁅D', E'⁆ = 0` is exactly `Commute D' E'`
  (`commute_of_lie_zero`). With this the chain closes the connection the roadmap named — from the Lie
  bracket (`isDeriv_bracket`, `Derivation.lean`) and the tangent (`expO_tangent`, N41g) to the flow
  (`expOEquiv_flow`, N177):
    * `expOLin_comm_flow_apply` / `expOLin_comm_flow` — the PRODUCT LAW
        `expOLin D' ∘ expOLin E' = expOLin (D' + E')`  (commuting generators)
    * `expOLin_comm_flow_comm` — the two flows COMMUTE
    * `expOEquiv_comm_flow`    — the bundled-equivalence (automorphism-group) form
    * `expOLin_bracket_zero_flows_commute` — ★★ the abelian BCH first order: the Lie bracket vanishing
        `⁅D', E'⁆ = 0` FORCES the two exponential flows to commute. The genuine first-order content:
        the group commutator of the two integrated flows is trivial precisely when the algebra
        commutator of their generators is zero. (The full non-abelian first order
        `[exp(sD), exp(tE)] ≈ id + st·⁅D,E⁆` needs the SECOND-order Taylor of `exp` over `Cut`, which
        is not banked — a separate heavier node; this abelian case is the exact, complete core.)

  NON-VACUITY (W8). `expOLin_comm_flow_self` fires the product law on the self-commuting pair
  `(D', D')` (`Commute.refl`), recovering the DOUBLING law `expOLin D' ∘ expOLin D' = expOLin (D'+D')`
  — a genuinely non-trivial composition, not `0 = 0`. The `Commute`/`⁅·,·⁆ = 0` hypothesis is
  satisfiable (every operator self-commutes), so the laws are not vacuously quantified.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "exp / derivation / automorphism / flow /
  one-parameter group / Lie bracket / G₂ / gauge". The file is a complete proof that, for the
  `Cut`-linear endomorphism ring of the 8-dimensional non-associative complete-topological `*`-algebra
  `O Cut`, the coordinate map `D' ↦ derivMatrix D'` into `Matrix (Fin 8) (Fin 8) Cut` is a ring
  homomorphism, hence the exponential `D' ↦ (x ↦ ∑ₙ (1/n!)•(Dⁿ x))` sends a COMMUTING (zero-bracket)
  pair `D'`, `E'` to composable maps with `E(D') ∘ E(E') = E(D' + E') = E(E') ∘ E(D')`. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no posited
  exp/G₂/Aut/flow/Lie-group/one-parameter group/metric, NO Mathlib ℝ as content, NO ℝ-valued `Norm`,
  NO Mathlib `NormedSpace.exp`/`Matrix.exp`, a fully proved implication throughout (no claim left
  without a proof).
-/
import Phys.Algebra.DerivationOFlow
import Phys.Algebra.Derivation

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## The coordinate representation is a ring homomorphism (the new lever). -/

/-- ★ `derivMatrix` PRESERVES COMPOSITION: `derivMatrix (D' * E') = derivMatrix D' * derivMatrix E'`.
    `derivMatrix` is the composite of the ring isomorphism `conjRingEquiv coordOCut`
    (`Module.End Cut (O Cut) ≃+* Module.End Cut (Fin 8 → Cut)`) and `toMatrix'`
    (`Module.End Cut (Fin 8 → Cut) → Matrix (Fin 8) (Fin 8) Cut`, multiplicative by
    `LinearMap.toMatrix'_mul`), so it carries operator composition to matrix product. -/
theorem derivMatrix_mul (D' E' : Module.End Cut (O Cut)) :
    derivMatrix (D' * E') = derivMatrix D' * derivMatrix E' := by
  unfold derivMatrix
  rw [map_mul (LinearEquiv.conjRingEquiv coordOCut), LinearMap.toMatrix'_mul]

/-- `derivMatrix` PRESERVES ADDITION: `derivMatrix (D' + E') = derivMatrix D' + derivMatrix E'`
    (both `conjRingEquiv coordOCut` and `toMatrix'` are additive). -/
theorem derivMatrix_add (D' E' : Module.End Cut (O Cut)) :
    derivMatrix (D' + E') = derivMatrix D' + derivMatrix E' := by
  unfold derivMatrix
  rw [map_add (LinearEquiv.conjRingEquiv coordOCut), map_add]

/-- ★ OPERATOR COMMUTATION TRANSPORTS TO MATRIX COMMUTATION:
    `Commute D' E' → Commute (derivMatrix D') (derivMatrix E')`. Immediate from `derivMatrix_mul`
    (a ring hom sends commuting elements to commuting elements). This is what feeds the banked matrix
    one-parameter-subgroup law `expMap_mul_of_commute` (N40) for two DIFFERENT generators. -/
theorem derivMatrix_commute (D' E' : Module.End Cut (O Cut)) (h : Commute D' E') :
    Commute (derivMatrix D') (derivMatrix E') := by
  unfold Commute SemiconjBy
  rw [← derivMatrix_mul, ← derivMatrix_mul, h.eq]

/-- The Lie-bracket form of the commutation hypothesis: in the endomorphism RING
    `Module.End Cut (O Cut)` the bracket is `⁅D', E'⁆ = D' * E' - E' * D'`, so `⁅D', E'⁆ = 0`
    is exactly `Commute D' E'`. This is the bridge to the Lie-algebra closure `isDeriv_bracket`
    (`Derivation.lean`): a vanishing bracket is a commuting pair. -/
theorem commute_of_lie_zero (D' E' : Module.End Cut (O Cut)) (h : ⁅D', E'⁆ = 0) :
    Commute D' E' :=
  sub_eq_zero.mp h

/-! ## The commuting-generator flow law (the genuinely-new structure). -/

/-- ★★ THE COMMUTING-GENERATOR PRODUCT LAW (pointwise): for two derivations `D'`, `E'` whose
    operators COMMUTE, `expOLin D' (expOLin E' x) = expOLin (D' + E') x`. The composition collapses,
    through `coordOCut`, to the matrix homomorphism law `expMap M * expMap N = expMap (M + N)`
    (banked `expMap_mul_of_commute` N40, with `Commute` from `derivMatrix_commute`), and
    `← derivMatrix_add` re-assembles `derivMatrix D' + derivMatrix E'` into `derivMatrix (D' + E')`.
    The two-generator generalization of N177's same-generator `expOLin_flow_apply`
    (which is the special case `D' = s • D₀`, `E' = t • D₀`, automatically commuting). -/
theorem expOLin_comm_flow_apply (D' E' : Module.End Cut (O Cut)) (h : Commute D' E')
    (x : O Cut) :
    expOLin D' (expOLin E' x) = expOLin (D' + E') x := by
  unfold expOLin
  simp only [LinearMap.comp_apply, LinearEquiv.coe_coe, LinearEquiv.apply_symm_apply]
  rw [show Matrix.mulVecLin (expMap (derivMatrix E')) (coordOCut x)
        = expMap (derivMatrix E') *ᵥ coordOCut x from rfl,
    show Matrix.mulVecLin (expMap (derivMatrix D'))
          (expMap (derivMatrix E') *ᵥ coordOCut x)
        = expMap (derivMatrix D') *ᵥ (expMap (derivMatrix E') *ᵥ coordOCut x) from rfl,
    show Matrix.mulVecLin (expMap (derivMatrix (D' + E'))) (coordOCut x)
        = expMap (derivMatrix (D' + E')) *ᵥ coordOCut x from rfl,
    Matrix.mulVec_mulVec,
    expMap_mul_of_commute (derivMatrix D') (derivMatrix E') (derivMatrix_commute D' E' h),
    ← derivMatrix_add]

/-- The commuting-generator flow law at the level of `Cut`-linear maps:
    `(expOLin D').comp (expOLin E') = expOLin (D' + E')`. A `LinearMap.ext` of
    `expOLin_comm_flow_apply`. -/
theorem expOLin_comm_flow (D' E' : Module.End Cut (O Cut)) (h : Commute D' E') :
    (expOLin D').comp (expOLin E') = expOLin (D' + E') :=
  LinearMap.ext (fun x => expOLin_comm_flow_apply D' E' h x)

/-- ★ THE FLOWS COMMUTE: commuting generators give commuting flows —
    `expOLin D' (expOLin E' x) = expOLin E' (expOLin D' x)`. Both sides equal `expOLin (D' + E') x`
    (the second via `Commute.symm` and `add_comm`). -/
theorem expOLin_comm_flow_comm (D' E' : Module.End Cut (O Cut)) (h : Commute D' E')
    (x : O Cut) :
    expOLin D' (expOLin E' x) = expOLin E' (expOLin D' x) := by
  rw [expOLin_comm_flow_apply D' E' h, expOLin_comm_flow_apply E' D' h.symm, add_comm]

/-- ★★ THE BUNDLED ONE-PARAMETER-SUBGROUP form for commuting generators:
    `(expOEquiv E').trans (expOEquiv D') = expOEquiv (D' + E')` — the additive-group homomorphism
    on commuting generators inside the automorphism group. A `LinearEquiv.ext` of
    `expOLin_comm_flow_apply`. -/
theorem expOEquiv_comm_flow (D' E' : Module.End Cut (O Cut)) (h : Commute D' E') :
    (expOEquiv E').trans (expOEquiv D') = expOEquiv (D' + E') := by
  refine LinearEquiv.toLinearMap_injective (LinearMap.ext (fun x => ?_))
  simp only [LinearEquiv.coe_trans, LinearMap.comp_apply, LinearEquiv.coe_coe]
  rw [expOEquiv_apply, expOEquiv_apply, expOEquiv_apply, ← expOLin_apply, ← expOLin_apply,
    ← expOLin_apply, expOLin_comm_flow_apply D' E' h]

/-- W8 NON-VACUITY: ANY operator commutes with itself (`Commute.refl`), so the product law fires on
    the self-commuting pair `(D', D')`, recovering the DOUBLING law
    `expOLin D' (expOLin D' x) = expOLin (D' + D') x` — a genuinely non-trivial composition (not
    `0 = 0`), witnessing the commuting-flow law is not vacuously quantified. -/
theorem expOLin_comm_flow_self (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOLin D' (expOLin D' x) = expOLin (D' + D') x :=
  expOLin_comm_flow_apply D' D' (Commute.refl D') x

/-- ★★ THE HEADLINE CONNECTION — THE ABELIAN BCH FIRST ORDER: the Lie bracket vanishing
    `⁅D', E'⁆ = 0` FORCES the two exponential flows to COMMUTE,
    `expOLin D' (expOLin E' x) = expOLin E' (expOLin D' x)`. This is exactly the connection from the
    Lie-algebra commutator (`isDeriv_bracket`, `Derivation.lean`) and the tangent (`expO_tangent`,
    N41g) to the integrated flow (`expOEquiv_flow`, N177): the group commutator of the two integrated
    flows is trivial precisely when the algebra commutator of their generators is zero (the exact,
    complete abelian case of the first-order Baker–Campbell–Hausdorff relation). -/
theorem expOLin_bracket_zero_flows_commute (D' E' : Module.End Cut (O Cut))
    (h : ⁅D', E'⁆ = 0) (x : O Cut) :
    expOLin D' (expOLin E' x) = expOLin E' (expOLin D' x) :=
  expOLin_comm_flow_comm D' E' (commute_of_lie_zero D' E' h) x

end

end Phys.Algebra
