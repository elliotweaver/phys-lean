import Phys.Algebra.SpacetimeReduction
import Mathlib.Tactic

namespace Phys.Algebra.ProbeO5

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The reduced (1,3) isometry predicate + monoid (mirroring N45 on STV4). -/

def IsQ4Isom (T : STV4 →ₗ[ℚ] STV4) : Prop := ∀ p : STV4, Q4v (T p) = Q4v p

theorem isQ4Isom_id : IsQ4Isom (LinearMap.id) := fun _ => rfl

theorem isQ4Isom_comp {S T : STV4 →ₗ[ℚ] STV4} (hS : IsQ4Isom S) (hT : IsQ4Isom T) :
    IsQ4Isom (S.comp T) := by
  intro p; show Q4v (S (T p)) = Q4v p; rw [hS (T p), hT p]

def q4IsomMonoid : Submonoid (Module.End ℚ STV4) where
  carrier := {T | IsQ4Isom T}
  one_mem' := isQ4Isom_id
  mul_mem' hS hT := isQ4Isom_comp hS hT

/-! ## The boost on the reduced arena (t,x block hyperbolic; d untouched). -/

def boost4 (a b : ℚ) : STV4 →ₗ[ℚ] STV4 where
  toFun p := (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2)
  map_add' p q := by
    simp only [Prod.fst_add, Prod.snd_add]
    ext <;> simp <;> ring
  map_smul' c p := by
    simp only [Prod.smul_fst, Prod.smul_snd, smul_eq_mul, RingHom.id_apply]
    ext <;> simp <;> ring

theorem boost4_isom {a b : ℚ} (h : a^2 - b^2 = 1) : IsQ4Isom (boost4 a b) := by
  intro p
  obtain ⟨t, x, d⟩ := p
  show Q4 _ _ _ = Q4 _ _ _
  unfold boost4 Q4
  simp only [LinearMap.coe_mk, AddHom.coe_mk]
  linear_combination (t^2 - x^2) * h

theorem boost4_mem {a b : ℚ} (h : a^2 - b^2 = 1) : boost4 a b ∈ q4IsomMonoid :=
  boost4_isom h

theorem boost4_ne_id {a b : ℚ} (hb : b ≠ 0) : boost4 a b ≠ LinearMap.id := by
  intro hcontra
  have := congrArg (fun T => (T ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ))).2.1) hcontra
  simp only [boost4, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.id_coe, id_eq] at this
  rw [mul_one, mul_zero, add_zero] at this
  exact hb this

/-! ## Translations + the interval. -/

def transl4 (a : STV4) : STV4 → STV4 := fun p => p + a

def interval4 (p q : STV4) : ℚ := Q4v (p - q)

theorem transl4_zero : transl4 (0 : STV4) = id := by
  funext p; simp [transl4]

theorem transl4_comp (a b : STV4) : transl4 a ∘ transl4 b = transl4 (a + b) := by
  funext p; simp [transl4]; ring

theorem interval4_transl_invariant (a p q : STV4) :
    interval4 (transl4 a p) (transl4 a q) = interval4 p q := by
  unfold interval4 transl4
  congr 1
  abel

end
end Phys.Algebra.ProbeO5
