/-
  N42a — THE STABILIZER LIE SUBALGEBRA of a fixed imaginary unit inside `Der(𝕆)`.

  The structural skeleton of `su(3) ⊂ g₂` at the Lie-algebra level, DERIVED from the
  chain (the banked 14-dim derivation Lie algebra `derivationLieQ` of N16–N21, the banked
  first imaginary generator `u1` = `e₁` from the cascade, the banked imaginary subspace
  `ImO`), NOT a posited `SU(3)`/`G₂`.

  WHAT THIS FILE BANKS (N42a, the first increment of the colour-branching node):
    complexUnit_sq         — `u1 · u1 = −1`: the fixed unit IS a square root of `−1` (a
                             complex unit, the banked first imaginary generator of the cascade).
    evalU1                 — the ℚ-linear evaluation-at-`u1` map `D ↦ D u1` on `derivationLieQ`.
    stabLieQ               — the STABILIZER `{D ∈ Der(𝕆) : D u1 = 0}` as a `LieSubalgebra`
                             of `derivationLieQ` (the bracket closes because `⁅D,E⁆ u1 =
                             D (E u1) − E (D u1) = 0` whenever both kill `u1`).
    mem_stabLieQ           — membership iff `D u1 = 0`.
    stabLieQ_toSubmodule_eq_ker — `stabLieQ.toSubmodule = ker evalU1` (the rank–nullity hook
                             for the dimension count, childed N42b).
    stabLieQ_ne_bot        — NON-VACUITY (lower): `D0E ∈ stab` and `D0E ≠ 0`, so the stabilizer
                             is NONTRIVIAL (`≠ ⊥`).
    stabLieQ_ne_top        — NON-VACUITY (upper): `D3E ∉ stab` (it sends `u1 ↦ e₆ ≠ 0`), so the
                             stabilizer is a PROPER subalgebra (`≠ ⊤`) — strictly between `0`
                             and the 14-dim whole. The exact dimension `= 8` is childed (N42b).

  PHYSICS-WORDS-REMOVABLE: delete "colour/SU(3)/G₂/complex unit" → a proof that the set of
  derivations of the 8-dim non-associative `*`-algebra `O ℚ` annihilating a fixed square-root
  of `−1` is a proper nontrivial Lie subalgebra of the derivation algebra, equal to the kernel
  of the evaluation-at-that-vector map. The names do zero logical work.

  Everything is over ℚ (pure algebra — NO continuum, NO Mathlib ℝ as content). The Mathlib
  `LieSubalgebra`/`LinearMap.ker` are MACHINERY on the DERIVED objects. NO posited
  `SU(3)`/`G₂`/`su(3)`/`g₂`, NO bridge.
-/
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationLowerBound
import Mathlib.Algebra.Lie.Subalgebra

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## The fixed unit is a complex unit (square root of `−1`). -/

/-- ★ THE FIXED UNIT IS A SQUARE ROOT OF `−1`: `u1 · u1 = −1`. The banked first imaginary
    generator `e₁` of the cascade is a complex unit — the complex structure we stabilize.
    (Physics word "complex unit" removable: `u1` is just the basis element with `u1·u1 = −1`.) -/
theorem complexUnit_sq : u1 * u1 = (-1 : O ℚ) := by
  ext <;> simp [u1]

/-! ## The evaluation-at-`u1` map and the stabilizer subalgebra. -/

/-- The ℚ-linear evaluation-at-`u1` map `D ↦ D u1` on the derivation Lie algebra. Its kernel
    is the stabilizer; rank–nullity on it gives the dimension (childed N42b). -/
noncomputable def evalU1 : derivationLieQ →ₗ[ℚ] O ℚ where
  toFun D := (D : Module.End ℚ (O ℚ)) u1
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

@[simp] theorem evalU1_apply (D : derivationLieQ) :
    evalU1 D = (D : Module.End ℚ (O ℚ)) u1 := rfl

/-- ★★ THE STABILIZER `{D ∈ Der(𝕆) : D u1 = 0}` as a `LieSubalgebra` of `derivationLieQ`.
    The submodule conditions are immediate; the *Lie* closure is the key: if `D u1 = 0` and
    `E u1 = 0` then `⁅D,E⁆ u1 = D (E u1) − E (D u1) = D 0 − E 0 = 0` — the commutator of two
    stabilizing derivations stabilizes. This is `su(3) ⊂ g₂` at the Lie-algebra level, derived
    forward from the banked `Der(𝕆)` and the banked complex unit `u1`. -/
def stabLieQ : LieSubalgebra ℚ derivationLieQ where
  carrier := { D | (D : Module.End ℚ (O ℚ)) u1 = 0 }
  add_mem' := by
    intro D E hD hE
    simp only [Set.mem_setOf_eq] at *
    show ((D + E : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0
    rw [AddSubmonoid.coe_add, LinearMap.add_apply, hD, hE, add_zero]
  zero_mem' := by
    show ((0 : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0
    simp
  smul_mem' := by
    intro c D hD
    simp only [Set.mem_setOf_eq] at *
    show ((c • D : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0
    rw [SetLike.val_smul, LinearMap.smul_apply, hD, smul_zero]
  lie_mem' := by
    intro D E hD hE
    simp only [Set.mem_setOf_eq] at *
    show ((⁅D, E⁆ : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0
    have hbr : ((⁅D, E⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
        = ⁅(D : Module.End ℚ (O ℚ)), (E : Module.End ℚ (O ℚ))⁆ := rfl
    rw [hbr]
    show ((D : Module.End ℚ (O ℚ)) * E - E * D) u1 = 0
    simp only [LinearMap.sub_apply, Module.End.mul_apply, hE, hD, map_zero, sub_zero]

@[simp] theorem mem_stabLieQ {D : derivationLieQ} :
    D ∈ stabLieQ ↔ (D : Module.End ℚ (O ℚ)) u1 = 0 := Iff.rfl

/-- ★ THE RANK–NULLITY HOOK: the stabilizer submodule is exactly `ker evalU1`. The dimension
    count `dim stab = 14 − rank evalU1 = 14 − 6 = 8` (childed N42b) reduces to this. -/
theorem stabLieQ_toSubmodule_eq_ker :
    stabLieQ.toSubmodule = LinearMap.ker evalU1 := by
  ext D
  simp only [LieSubalgebra.mem_toSubmodule, mem_stabLieQ, LinearMap.mem_ker, evalU1_apply]

/-! ## Non-vacuity (W8): the stabilizer is PROPER and NONTRIVIAL. -/

/-- `D0E` (a banked explicit derivation) stabilizes `u1`. -/
theorem D0E_mem_stab : (⟨D0E, D0E_isDerivQ⟩ : derivationLieQ) ∈ stabLieQ := by
  rw [mem_stabLieQ]
  show D0E u1 = 0
  ext <;> simp [D0E, u1, c2, c3, c4, c5]

/-- `D0E` is a NONZERO element of `derivationLieQ` (it sends `u4 ↦ e₃ ≠ 0`). -/
theorem D0E_lie_ne_zero : (⟨D0E, D0E_isDerivQ⟩ : derivationLieQ) ≠ 0 := by
  intro h
  have hval : D0E = 0 := by
    have := congrArg (fun D : derivationLieQ => (D : Module.End ℚ (O ℚ))) h
    simpa using this
  have hc : c3 (D0E u4) = c3 ((0 : Module.End ℚ (O ℚ)) u4) := by rw [hval]
  simp [D0E, u4, c2, c3, c4, c5] at hc

/-- ★ NON-VACUITY (lower): the stabilizer is NONTRIVIAL — it contains the nonzero derivation
    `D0E`, so `stabLieQ ≠ ⊥`. (Rules out "the stabilizer is just `{0}`".) -/
theorem stabLieQ_ne_bot : stabLieQ ≠ ⊥ := by
  intro h
  apply D0E_lie_ne_zero
  have : (⟨D0E, D0E_isDerivQ⟩ : derivationLieQ) ∈ (⊥ : LieSubalgebra ℚ derivationLieQ) := by
    rw [← h]; exact D0E_mem_stab
  rwa [LieSubalgebra.mem_bot] at this

/-- `D3E` (a banked explicit derivation) does NOT stabilize `u1`: it sends `u1 ↦ e₆ ≠ 0`. -/
theorem D3E_not_mem_stab : (⟨D3E, D3E_isDerivQ⟩ : derivationLieQ) ∉ stabLieQ := by
  rw [mem_stabLieQ]
  show D3E u1 ≠ 0
  intro h
  have hc : c6 (D3E u1) = c6 ((0 : O ℚ)) := by rw [h]
  simp [D3E, u1, c1, c3, c4, c6] at hc

/-- ★ NON-VACUITY (upper): the stabilizer is a PROPER subalgebra — it omits the derivation
    `D3E ∈ Der(𝕆)`, so `stabLieQ ≠ ⊤`. Together with `stabLieQ_ne_bot`, the stabilizer sits
    STRICTLY between `0` and the 14-dim whole `Der(𝕆)` — the qualitative `0 < 8 < 14`. The
    exact value `dim = 8 = dim su(3)` is childed (N42b). -/
theorem stabLieQ_ne_top : stabLieQ ≠ ⊤ := by
  intro h
  apply D3E_not_mem_stab
  rw [h]; exact LieSubalgebra.mem_top _

end Phys.Algebra
