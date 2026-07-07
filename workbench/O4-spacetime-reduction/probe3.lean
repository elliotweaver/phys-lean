import Phys.Algebra.SpacetimeSignature

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Matrix
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

abbrev STV4 := ℚ × ℚ × Dbl ℚ
def Q4 (t x : ℚ) (d : Dbl ℚ) : ℚ := t^2 - x^2 - (d.re^2 + d.im^2)
def Q4v (p : STV4) : ℚ := Q4 p.1 p.2.1 p.2.2

def timeSub4 : Submodule ℚ STV4 := Submodule.span ℚ {((1:ℚ),(0:ℚ),(0:Dbl ℚ))}
def spaceSub4 : Submodule ℚ STV4 := LinearMap.ker (LinearMap.fst ℚ ℚ (ℚ × Dbl ℚ))

-- finrank STV4 = 4
theorem finrank_STV4 : Module.finrank ℚ STV4 = 4 := by
  simp [STV4, Module.finrank_prod, Module.finrank_self, finrank_dbl_eq_two]

-- finrank spaceSub4 = 3
example : Module.finrank ℚ spaceSub4 = 3 := by
  have hsurj : Function.Surjective (LinearMap.fst ℚ ℚ (ℚ × Dbl ℚ)) :=
    fun a => ⟨(a, 0), rfl⟩
  have hrk := LinearMap.finrank_range_add_finrank_ker (LinearMap.fst ℚ ℚ (ℚ × Dbl ℚ))
  rw [LinearMap.range_eq_top.mpr hsurj] at hrk
  simp only [finrank_top] at hrk
  rw [finrank_STV4, Module.finrank_self] at hrk
  have : Module.finrank ℚ (LinearMap.ker (LinearMap.fst ℚ ℚ (ℚ × Dbl ℚ))) = 3 := by omega
  exact this

-- finrank timeSub4 = 1
example : Module.finrank ℚ timeSub4 = 1 := by
  rw [timeSub4, finrank_span_singleton]
  intro h
  have := congrArg Prod.fst h
  simp at this

-- IsCompl
example : IsCompl timeSub4 spaceSub4 := by
  constructor
  · rw [Submodule.disjoint_def]
    intro p hpt hps
    obtain ⟨c, hc⟩ := Submodule.mem_span_singleton.mp hpt
    have hp1 : p.1 = 0 := hps
    rw [← hc] at hp1
    simp only [Prod.smul_fst, smul_eq_mul, mul_one] at hp1
    rw [← hc, hp1]
    simp
  · rw [codisjoint_iff, eq_top_iff]
    intro p _
    have hsplit : p = (p.1 • ((1:ℚ),(0:ℚ),(0:Dbl ℚ))) + (0, p.2.1, p.2.2) := by
      obtain ⟨t, x, d⟩ := p
      simp
    rw [hsplit]
    apply Submodule.add_mem
    · apply Submodule.mem_sup_left
      exact Submodule.mem_span_singleton.mpr ⟨p.1, rfl⟩
    · apply Submodule.mem_sup_right
      show (0, p.2.1, p.2.2).1 = 0
      rfl

end
end Phys.Algebra
