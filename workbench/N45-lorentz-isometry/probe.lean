/- N45 MEASUREMENT PROBE — bounded, throwaway. Measures the core obligations of the
   LORENTZ ISOMETRY STRUCTURE before committing to production (W9 measure-first). KILL=60s/oblig.
   Imports the banked N43 SpacetimeSignature (Qv, Qform, STV). -/
import Phys.Algebra.SpacetimeSignature
import Mathlib.Tactic

namespace N45Probe

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- The isometry predicate for the banked Born determinant form `Qv` on `STV = ℚ × ℚ × O ℚ`. -/
def IsQvIsom (T : STV →ₗ[ℚ] STV) : Prop := ∀ p : STV, Qv (T p) = Qv p

/-- THE RATIONAL HYPERBOLIC BOOST in the (t,x) plane: `(t,x,v) ↦ (a t + b x, b t + a x, v)`,
    leaving the space block `v` fixed. ℚ-linear by construction. -/
def boost (a b : ℚ) : STV →ₗ[ℚ] STV where
  toFun p := (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2)
  map_add' p q := by
    simp only [Prod.fst_add, Prod.snd_add]
    ext <;> simp <;> ring
  map_smul' c p := by
    simp only [Prod.smul_fst, Prod.smul_snd, smul_eq_mul, RingHom.id_apply]
    ext <;> simp [Prod.smul_fst, Prod.smul_snd] <;> ring

/-- ★ CORE OBLIGATION: the rational hyperbolic boost with `a² − b² = 1` preserves `Qv`.
    PURE ℚ RING ARITHMETIC — no octonion product, no determinant, no ℝ. -/
theorem boost_isom {a b : ℚ} (h : a^2 - b^2 = 1) : IsQvIsom (boost a b) := by
  intro p
  obtain ⟨t, x, v⟩ := p
  show Qform _ _ _ = Qform _ _ _
  unfold boost Qform
  simp only [LinearMap.coe_mk, AddHom.coe_mk]
  linear_combination (t^2 - x^2) * h

end

end N45Probe
