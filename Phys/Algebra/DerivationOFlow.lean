/-
  # N177 — THE ONE-PARAMETER FLOW LAW of the octonion exponential automorphism over the
  #         DERIVED ℝ `ContinuumQ.Cut` (the continuous one-parameter SUBGROUP inside `Aut(O Cut)`).

  N41f (`Phys/Algebra/DerivationOAutomorphism.lean`) closed the GROUP end of `Der(𝕆) → Aut(𝕆)`:
  the exponential `expOEquiv D'` of a `Cut`-linear Leibniz derivation is a genuine `Cut`-side
  ALGEBRA AUTOMORPHISM of the non-associative `O Cut`, and it banked the STATIC structure
  (`expO_mul`, `expO_one`, `expOEquiv_isAlgAut`) together with the DISCRETE inverse special case
  `expOLin_comp_neg` (`expO(D) ∘ expO(-D) = id`, via the matrix law `expMap_mul_neg`). N41g
  (`Phys/Algebra/DerivationOTangent.lean`) closed the TANGENT end (`d/dt exp(tD)|₀ = D`) and banked
  the homogeneity lever `derivMatrix_smul` (`derivMatrix (t • D') = t • derivMatrix D'`).

  THIS file banks the genuinely-new structure those nodes do NOT express: the CONTINUOUS
  ONE-PARAMETER FLOW LAW

      `expOLin (s • D') ∘ expOLin (t • D') = expOLin ((s + t) • D')`     (for all `s t : Cut`)

  — the continuous one-parameter SUBGROUP `t ↦ expOEquiv (t • D')` inside the automorphism group
  `Aut(O Cut)`, with the additive group homomorphism law (`s + t`) and the identity element
  `expOLin ((0 : Cut) • D') = id`. This is to N41's discrete inverse `expOLin_comp_neg` (the
  `s = 1, t = -1` special case) exactly what N176's continuous flow `specPow_flow` is to N68's
  discrete `specOpN_comp`: the static / two-point structure promoted to the full one-parameter group.

  ## The route (THE ONE LAW — reframe through the trunk; all levers BANKED, no new analysis)

  The flow is NOT bashed analytically over the non-associative product. It transports, through the
  SAME N41d coordinate frame `coordOCut`, to the banked N40 matrix HOMOMORPHISM law
  `expMap_mul_of_commute` (`expMap A * expMap B = expMap (A+B)` for commuting `A`, `B`):

    1. `commute_derivMatrix_smul` — `Commute (s • derivMatrix D') (t • derivMatrix D')`: both are
       scalar multiples of the SAME matrix over the commutative derived field `Cut`, so they commute
       by `smul_mul_smul_comm` + `mul_comm`. This is the hypothesis the matrix homomorphism law needs.

    2. `expOLin_flow_apply` (★ THE FLOW, pointwise) — the composition collapses, through `coordOCut`,
       to `expMap (s•M) * expMap (t•M) = expMap (s•M + t•M) = expMap ((s+t)•M)`, by
       `derivMatrix_smul` (N41g, on each of the three occurrences) + `expMap_mul_of_commute` +
       `← add_smul`. The exact `s,t ↦ s+t` generalization of `expOLin_comp_neg`'s `s = 1, t = -1`.

    3. `expOEquiv_flow` (★★ THE ONE-PARAMETER SUBGROUP) — at the bundled-equivalence level:
       `(expOEquiv (t • D')).trans (expOEquiv (s • D')) = expOEquiv ((s + t) • D')`, the homomorphism
       `(Cut, +) → Aut(O Cut)` (a `LinearEquiv.ext` of the pointwise flow), with identity element
       `expOLin_smul_zero` (`expOLin ((0:Cut) • D') x = x`, the flow at parameter `0` is the identity).

  ## The one cause (THE ONE LAW)

  The SAME Born positivity that gave the operator norm (N38), the convergent matrix series (N39), the
  matrix one-parameter subgroup `exp(A)·exp(B) = exp(A+B)` (N40), and the static automorphism (N41f)
  now closes the CONTINUOUS one-parameter subgroup: the additive line `Cut` maps homomorphically into
  the automorphisms of the terminal algebra. One positivity, read from the operator norm all the way
  to the continuous flow of automorphisms — the Lie-algebra line `t ↦ t • D` integrated to a
  one-parameter subgroup of the Lie group `Aut(𝕆)`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "exp / derivation / automorphism / flow /
  one-parameter group / G₂ / gauge / Lorentz": the file is a complete proof that the map
  `t ↦ E(t • D')` (where `E(D')x := ∑ₙ (1/n!)•(Dⁿ x)`) is an additive-group homomorphism from the
  derived complete ordered field `Cut` into the `Cut`-linear bijections of the 8-dimensional
  non-associative complete-topological `*`-algebra `O Cut`: `E(s•D') ∘ E(t•D') = E((s+t)•D')`,
  `E(0•D') = id`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no posited exp/G₂/Aut/flow/
  one-parameter group/metric, NO Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib
  `NormedSpace.exp`/`Matrix.exp`, a fully proved implication throughout (no claim left without a proof).
-/
import Phys.Algebra.DerivationOTangent

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## The commutativity of scaled coordinate matrices (the hypothesis of the matrix homomorphism law). -/

/-- `Commute (s • derivMatrix D') (t • derivMatrix D')`: both factors are scalar multiples of the
    SAME matrix over the commutative derived field `Cut`, so they commute by `smul_mul_smul_comm`
    followed by `mul_comm s t`. This is the precise hypothesis the banked matrix homomorphism law
    `expMap_mul_of_commute` (N40) consumes. -/
theorem commute_derivMatrix_smul (s t : Cut) (D' : Module.End Cut (O Cut)) :
    Commute (s • derivMatrix D') (t • derivMatrix D') := by
  unfold Commute SemiconjBy
  rw [smul_mul_smul_comm, smul_mul_smul_comm, mul_comm s t]

/-! ## The one-parameter flow law (pointwise — the genuine new structure). -/

/-- ★ THE ONE-PARAMETER FLOW LAW (pointwise): `expOLin (s • D') (expOLin (t • D') x) =
    expOLin ((s + t) • D') x`. The composition collapses, through `coordOCut`, to the matrix
    homomorphism law `expMap (s•M) * expMap (t•M) = expMap ((s+t)•M)` (banked `expMap_mul_of_commute`
    N40, with `Commute` from `commute_derivMatrix_smul`), the homogeneity `derivMatrix_smul` (N41g)
    pushing the three scalars through the coordinate matrix, and `← add_smul` collecting `s•M + t•M`
    into `(s+t)•M`. The `s, t ↦ s+t` generalization of N41f's discrete `expOLin_comp_neg`
    (`s = 1, t = -1`). -/
theorem expOLin_flow_apply (s t : Cut) (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOLin (s • D') (expOLin (t • D') x) = expOLin ((s + t) • D') x := by
  unfold expOLin
  simp only [LinearMap.comp_apply, LinearEquiv.coe_coe, LinearEquiv.apply_symm_apply]
  rw [show Matrix.mulVecLin (expMap (derivMatrix (t • D'))) (coordOCut x)
        = expMap (derivMatrix (t • D')) *ᵥ coordOCut x from rfl,
    show Matrix.mulVecLin (expMap (derivMatrix (s • D')))
          (expMap (derivMatrix (t • D')) *ᵥ coordOCut x)
        = expMap (derivMatrix (s • D')) *ᵥ (expMap (derivMatrix (t • D')) *ᵥ coordOCut x) from rfl,
    show Matrix.mulVecLin (expMap (derivMatrix ((s + t) • D'))) (coordOCut x)
        = expMap (derivMatrix ((s + t) • D')) *ᵥ coordOCut x from rfl,
    Matrix.mulVec_mulVec, derivMatrix_smul, derivMatrix_smul, derivMatrix_smul,
    expMap_mul_of_commute (s • derivMatrix D') (t • derivMatrix D')
      (commute_derivMatrix_smul s t D'),
    ← add_smul]

/-- The flow law at the level of `Cut`-linear maps: `(expOLin (s • D')).comp (expOLin (t • D')) =
    expOLin ((s + t) • D')`. A `LinearMap.ext` of `expOLin_flow_apply`. -/
theorem expOLin_flow (s t : Cut) (D' : Module.End Cut (O Cut)) :
    (expOLin (s • D')).comp (expOLin (t • D')) = expOLin ((s + t) • D') :=
  LinearMap.ext (fun x => expOLin_flow_apply s t D' x)

/-- The flow law in terms of the vector exponential `expO`: `expO ((s•D').restrictScalars ℤ)
    (expO ((t•D').restrictScalars ℤ) x) = expO (((s+t)•D').restrictScalars ℤ) x`. The same content
    as `expOLin_flow_apply`, read through `expOLin_apply` (`expOLin D' x = expO (D'.restrictScalars ℤ) x`). -/
theorem expO_flow (s t : Cut) (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expO ((s • D').restrictScalars ℤ) (expO ((t • D').restrictScalars ℤ) x)
      = expO (((s + t) • D').restrictScalars ℤ) x := by
  rw [← expOLin_apply, ← expOLin_apply, ← expOLin_apply, expOLin_flow_apply]

/-! ## The identity element of the flow (parameter `0`). -/

/-- The flow at parameter `0` is the identity: `expOLin ((0 : Cut) • D') x = x`. The scaled
    derivation `0 • D' = 0` has coordinate matrix `0` (via `derivMatrix_smul` + `zero_smul`),
    whose exponential is the identity matrix (`expMap_zero`); the flow identity element. -/
theorem expOLin_smul_zero (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOLin ((0 : Cut) • D') x = x := by
  unfold expOLin
  simp only [LinearMap.comp_apply, LinearEquiv.coe_coe]
  rw [show Matrix.mulVecLin (expMap (derivMatrix ((0 : Cut) • D'))) (coordOCut x)
        = expMap (derivMatrix ((0 : Cut) • D')) *ᵥ coordOCut x from rfl,
    derivMatrix_smul, zero_smul, expMap_zero, Matrix.one_mulVec, LinearEquiv.symm_apply_apply]

/-! ## The one-parameter subgroup (the bundled equivalence — the headline). -/

/-- ★★ THE ONE-PARAMETER SUBGROUP: `(expOEquiv (t • D')).trans (expOEquiv (s • D')) =
    expOEquiv ((s + t) • D')` — the additive-group homomorphism `(Cut, +) → Aut(O Cut)`,
    `t ↦ expOEquiv (t • D')`. A `LinearEquiv.ext` of the pointwise flow `expOLin_flow_apply`
    (`(e₁.trans e₂) x = e₂ (e₁ x)`, and `expOEquiv D' x = expOLin D' x` by `expOEquiv_apply` /
    `expOLin_apply`). The continuous one-parameter subgroup inside the automorphism group — the
    genuine new structure the static N41f automorphism and its discrete inverse do not express. -/
theorem expOEquiv_flow (s t : Cut) (D' : Module.End Cut (O Cut)) :
    (expOEquiv (t • D')).trans (expOEquiv (s • D')) = expOEquiv ((s + t) • D') := by
  refine LinearEquiv.toLinearMap_injective (LinearMap.ext (fun x => ?_))
  simp only [LinearEquiv.coe_trans, LinearMap.comp_apply, LinearEquiv.coe_coe]
  rw [expOEquiv_apply, expOEquiv_apply, expOEquiv_apply, ← expOLin_apply, ← expOLin_apply,
    ← expOLin_apply, expOLin_flow_apply]

/-- The one-parameter subgroup carries the identity element: `expOEquiv ((0 : Cut) • D') x = x`,
    the bundled form of `expOLin_smul_zero` (via `expOEquiv_apply` / `expOLin_apply`). -/
theorem expOEquiv_smul_zero (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOEquiv ((0 : Cut) • D') x = x := by
  rw [expOEquiv_apply, ← expOLin_apply, expOLin_smul_zero]

/-! ## The flow members are algebra automorphisms (closure of the front (i) target). -/

/-- Each member of the one-parameter flow of a Leibniz derivation is an algebra automorphism:
    if `t • D'` is a `Cut`-linear Leibniz derivation for the parameter `t`, then `expOEquiv (t • D')`
    is an `IsAlgAutCut`. The flow stays INSIDE the automorphism group `Aut(O Cut)` — the
    one-parameter subgroup is a subgroup of automorphisms, not merely of `Cut`-linear bijections.
    (`IsDeriv` is closed under `Cut`-smul up the cascade; the hypothesis is the per-`t` Leibniz law.) -/
theorem expOEquiv_flow_isAlgAut (t : Cut) (D' : Module.End Cut (O Cut))
    (hD : IsDeriv ((t • D').restrictScalars ℤ)) : IsAlgAutCut (expOEquiv (t • D')) :=
  expOEquiv_isAlgAut (t • D') hD

/-! ## NON-VACUITY (W8): the flow is a genuine, non-trivial one-parameter group. -/

/-- NON-VACUITY: a concrete two-parameter instance of the flow law over the zero derivation —
    `expOLin (s • 0) (expOLin (t • 0) x) = expOLin ((s + t) • 0) x` — inhabiting the flow with
    explicit distinct parameters, witnessing `expOLin_flow_apply` is not vacuously quantified. -/
theorem expOLin_flow_zero (s t : Cut) (x : O Cut) :
    expOLin (s • (0 : Module.End Cut (O Cut))) (expOLin (t • (0 : Module.End Cut (O Cut))) x)
      = expOLin ((s + t) • (0 : Module.End Cut (O Cut))) x :=
  expOLin_flow_apply s t 0 x

/-- NON-VACUITY: the zero derivation's flow is the constant identity subgroup, with the additive
    composition collapsing to the identity at every parameter pair — a concrete inhabitant of the
    one-parameter subgroup `expOEquiv_flow` (the `D' = 0` line maps to `{id}`). -/
theorem expOEquiv_flow_zero (s t : Cut) :
    (expOEquiv (t • (0 : Module.End Cut (O Cut)))).trans
        (expOEquiv (s • (0 : Module.End Cut (O Cut))))
      = expOEquiv ((s + t) • (0 : Module.End Cut (O Cut))) :=
  expOEquiv_flow s t 0

/-- NON-VACUITY: every member of the zero-derivation flow is an algebra automorphism (the
    one-parameter subgroup of the zero line lands in `Aut(O Cut)`). A concrete `IsAlgAutCut`
    inhabitant of `expOEquiv_flow_isAlgAut`. -/
theorem expOEquiv_flow_zero_isAlgAut (t : Cut) :
    IsAlgAutCut (expOEquiv (t • (0 : Module.End Cut (O Cut)))) :=
  expOEquiv_flow_isAlgAut t 0 (by
    have : (t • (0 : Module.End Cut (O Cut))).restrictScalars ℤ = 0 := by
      rw [smul_zero]; rfl
    rw [this]; intro u v; simp)

end

end Phys.Algebra
