import Phys.Algebra.LorentzContinuumCliffordPinKernel

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## THE SPINOR NORM on the unit-normalized Pin group. -/

/-- The spinor norm `N(u) = reverse(↑u)·↑u`. -/
def pinUnitNorm (u : CliffCˣ) : CliffC :=
  CliffordAlgebra.reverse (u : CliffC) * (u : CliffC)

/-- G1 — THE SPINOR NORM IS ±1 on PinUnitSub. -/
theorem pinUnitNorm_eq_pm {u : CliffCˣ} (hu : u ∈ PinUnitSub) :
    ∃ lam : Cut, pinUnitNorm u = algebraMap Cut CliffC lam ∧ (lam = 1 ∨ lam = -1) := by
  induction hu using Submonoid.closure_induction with
  | mem x hx =>
      obtain ⟨a, ha, hpm, rfl⟩ := hx
      refine ⟨QvC a, ?_, hpm⟩
      -- N(cliffUnitOf a) = ι a · ι a = algebraMap (QvC a)
      unfold pinUnitNorm
      rw [cliffUnitOf_val, CliffordAlgebra.reverse_ι, cliffSq]
  | one =>
      refine ⟨1, ?_, Or.inl rfl⟩
      unfold pinUnitNorm
      rw [Units.val_one, CliffordAlgebra.reverse.map_one, mul_one, map_one]
  | mul x y _ _ ihx ihy =>
      obtain ⟨lx, hlx, hpx⟩ := ihx
      obtain ⟨ly, hly, hpy⟩ := ihy
      refine ⟨lx * ly, ?_, ?_⟩
      · -- N(x*y) = reverse(↑y)·N(x)·↑y = algebraMap lx · N(y) = algebraMap (lx*ly)
        unfold pinUnitNorm at hlx hly ⊢
        rw [Units.val_mul, CliffordAlgebra.reverse.map_mul]
        calc CliffordAlgebra.reverse (y : CliffC) * CliffordAlgebra.reverse (x : CliffC)
                * ((x : CliffC) * (y : CliffC))
            = CliffordAlgebra.reverse (y : CliffC)
                * (CliffordAlgebra.reverse (x : CliffC) * (x : CliffC)) * (y : CliffC) := by
              noncomm_ring
          _ = CliffordAlgebra.reverse (y : CliffC) * algebraMap Cut CliffC lx * (y : CliffC) := by
              rw [hlx]
          _ = algebraMap Cut CliffC lx
                * (CliffordAlgebra.reverse (y : CliffC) * (y : CliffC)) := by
              rw [← Algebra.commutes lx (CliffordAlgebra.reverse (y : CliffC)), mul_assoc]
          _ = algebraMap Cut CliffC lx * algebraMap Cut CliffC ly := by rw [hly]
          _ = algebraMap Cut CliffC (lx * ly) := by rw [map_mul]
      · rcases hpx with h | h <;> rcases hpy with h' | h' <;> subst h <;> subst h' <;> simp

/-- W8 read-off — the spinor norm of the timelike reflection unit is `1`. -/
theorem pinUnitNorm_timelike :
    pinUnitNorm (cliffUnitOf mTimeUnit
      (by rw [BvC_mTimeUnit_self]; exact one_ne_zero)) = (1 : CliffC) := by
  unfold pinUnitNorm
  rw [cliffUnitOf_val, CliffordAlgebra.reverse_ι, cliffSq, QvC_mTimeUnit, map_one]

/-! ## THE SCALAR-ELEMENT HALF OF INJECTIVITY-MOD-CENTER. -/

/-- G3 — a SCALAR element of PinUnitSub has coefficient `±1`. -/
theorem scalar_pinUnit_eq_pm {u : CliffCˣ} (hu : u ∈ PinUnitSub) {mu : Cut}
    (hscal : (u : CliffC) = algebraMap Cut CliffC mu) :
    mu = 1 ∨ mu = -1 := by
  obtain ⟨lam, hN, hpm⟩ := pinUnitNorm_eq_pm hu
  -- N(u) = reverse(algebraMap mu)·algebraMap mu = algebraMap (mu*mu)
  have hNscal : pinUnitNorm u = algebraMap Cut CliffC (mu * mu) := by
    unfold pinUnitNorm
    rw [hscal, CliffordAlgebra.reverse.commutes, ← map_mul]
  rw [hNscal] at hN
  have hinj : Function.Injective (algebraMap Cut CliffC) := (algebraMap Cut CliffC).injective
  have hmm : mu * mu = lam := hinj hN
  -- lam = ±1, and mu*mu ≥ 0 over the ordered field, so mu*mu = 1
  have hmm1 : mu * mu = 1 := by
    rcases hpm with h | h
    · rw [hmm, h]
    · exfalso
      have hnn : (0 : Cut) ≤ mu * mu := mul_self_nonneg mu
      rw [hmm, h] at hnn
      have : (0 : Cut) ≤ (-1 : Cut) := hnn
      norm_num at this
  exact mul_self_eq_one_iff.mp hmm1

/-- G4 — a SCALAR element of PinUnitSub is `1` or `-1` as a unit. -/
theorem scalar_pinUnit_unit_eq_pm {u : CliffCˣ} (hu : u ∈ PinUnitSub) {mu : Cut}
    (hscal : (u : CliffC) = algebraMap Cut CliffC mu) :
    u = 1 ∨ u = -1 := by
  rcases scalar_pinUnit_eq_pm hu hscal with h | h
  · left; apply Units.ext
    rw [hscal, h, map_one, Units.val_one]
  · right; apply Units.ext
    rw [hscal, h, map_neg, map_one, Units.val_neg, Units.val_one]

/-- G5 — THE REDUCTION: injectivity-mod-center CONDITIONAL on the centralizer fact (the child).
    If every kernel element is a scalar, then every kernel element is `±1`. -/
theorem coverMapPinUnit_injmodcenter_of_scalar
    (hcent : ∀ u : PinUnitSub, u ∈ MonoidHom.mker coverMapPinUnit →
      ∃ mu : Cut, ((u : CliffCˣ) : CliffC) = algebraMap Cut CliffC mu) :
    ∀ u : PinUnitSub, u ∈ MonoidHom.mker coverMapPinUnit →
      (u : CliffCˣ) = 1 ∨ (u : CliffCˣ) = -1 := by
  intro u hu
  obtain ⟨mu, hscal⟩ := hcent u hu
  exact scalar_pinUnit_unit_eq_pm u.prop hscal

end

end Phys.Algebra
