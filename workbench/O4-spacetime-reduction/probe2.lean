import Phys.Algebra.SpacetimeSignature

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Matrix
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

/-- The ℂ-rung embedding as a linear map. -/
def cToO : Dbl ℚ →ₗ[ℚ] O ℚ where
  toFun d := ⟨⟨d, 0⟩, 0⟩
  map_add' d d' := by ext <;> simp
  map_smul' q d := by ext <;> simp

abbrev STV4 := ℚ × ℚ × Dbl ℚ

/-- The 4D embedding into STV. -/
def emb4 : STV4 →ₗ[ℚ] STV where
  toFun p := (p.1, p.2.1, cToO p.2.2)
  map_add' a b := by
    simp only [Prod.fst_add, Prod.snd_add, map_add, Prod.mk_add_mk]
  map_smul' q p := by
    simp only [Prod.smul_fst, Prod.smul_snd, map_smul, RingHom.id_apply, Prod.smul_mk]

def Q4 (t x : ℚ) (d : Dbl ℚ) : ℚ := t^2 - x^2 - (d.re^2 + d.im^2)
def Q4v (p : STV4) : ℚ := Q4 p.1 p.2.1 p.2.2

-- PROBE 5: gForm collapse as a lemma reused
theorem gForm_cToO (d : Dbl ℚ) : gForm (cToO d) (cToO d) = d.re^2 + d.im^2 := by
  rw [gForm_self_sum_sq]
  simp only [cToO, LinearMap.coe_mk, AddHom.coe_mk, c0, c1, c2, c3, c4, c5, c6, c7,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im]
  ring

-- PROBE 6: THE FORM WELD
example (p : STV4) : Qv (emb4 p) = Q4v p := by
  show Qform (emb4 p).1 (emb4 p).2.1 (emb4 p).2.2 = Q4 p.1 p.2.1 p.2.2
  simp only [emb4, LinearMap.coe_mk, AddHom.coe_mk]
  unfold Qform Q4
  rw [gForm_cToO]

-- PROBE 7: finrank STV4 = 4
example : Module.finrank ℚ STV4 = 4 := by
  simp [STV4, Module.finrank_prod, Module.finrank_self, finrank_dbl_eq_two]

-- PROBE 8: emb4 injective
example : Function.Injective emb4 := by
  intro p q h
  simp only [emb4, LinearMap.coe_mk, AddHom.coe_mk, Prod.mk.injEq] at h
  obtain ⟨h1, h2, h3⟩ := h
  have hd : p.2.2 = q.2.2 := by
    have := congrArg (fun z => z.re.re) h3
    simpa [cToO] using this
  obtain ⟨pt, px, pd⟩ := p
  obtain ⟨qt, qx, qd⟩ := q
  simp_all

end
end Phys.Algebra
