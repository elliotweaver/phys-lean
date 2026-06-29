import Phys.Algebra.LorentzContinuumOctBlockSO8Exhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- banked-by-this-node helpers (assume probe1 versions)
theorem houseHolder_smul_probe (a : O Cut) (t : Cut) (ht : t ≠ 0) :
    houseHolder (t • a) = houseHolder a := by
  apply LinearMap.ext; intro v
  rw [houseHolder_apply, houseHolder_apply, gFormC_smul_left, gFormC_smul_right,
      gFormC_smul_left, mul_inv, smul_smul]
  congr 1; field_simp

theorem bireflection_eq_octPlaneRot_gen_probe (e f : O Cut) (k μ : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hkm : k ^ 2 + μ ^ 2 = 1) :
    houseHolder e * houseHolder (k • e + μ • f)
      = octPlaneRot e f (2 * k ^ 2 - 1) (-(2 * k * μ)) := by
  have hfe : gFormC f e = 0 := by rw [gFormC_symm]; exact hef
  have hbb : gFormC (k • e + μ • f) (k • e + μ • f) = 1 := by
    simp only [gFormC_add_left, gFormC_add_right, gFormC_smul_left, gFormC_smul_right,
      hee, hff, hef, hfe]
    nlinarith [hkm]
  apply LinearMap.ext; intro v
  rw [Module.End.mul_apply, houseHolder_apply e (houseHolder (k • e + μ • f) v),
      houseHolder_apply (k • e + μ • f) v, octPlaneRot_apply, hee, hbb]
  simp only [inv_one, mul_one]
  have hbv : gFormC (k • e + μ • f) v = k * gFormC e v + μ * gFormC f v := by
    rw [gFormC_add_left, gFormC_smul_left, gFormC_smul_left]
  have heb : gFormC e (k • e + μ • f) = k := by
    rw [gFormC_add_right, gFormC_smul_right, gFormC_smul_right, hee, hef]; ring
  have hinner : gFormC e (v - (2 * gFormC (k • e + μ • f) v) • (k • e + μ • f))
      = gFormC e v - 2 * gFormC (k • e + μ • f) v * k := by
    rw [gFormC_symm e, gFormC_sub_left, gFormC_smul_left, gFormC_symm (k • e + μ • f) e, heb,
        gFormC_symm v e]
  rw [hinner, hbv, gFormC_symm v e, gFormC_symm v f]
  match_scalars
  all_goals (try ring)
  all_goals linear_combination (-2 * gFormC f v) * hkm

theorem joinedIdQvC_circle_probe (e f : O Cut) (c s : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hcs : c ^ 2 + s ^ 2 = 1) :
    JoinedIdQvC (octBlockEndC (octPlaneRot e f c s)) := by
  by_cases hc : 1 + c = 0
  · have hc' : c = -1 := by linarith
    have hs0 : s ^ 2 = 0 := by nlinarith [hcs]
    have hs : s = 0 := pow_eq_zero_iff (n := 2) (by norm_num) |>.mp hs0
    rw [hc', hs, ← octPlaneRot_quarter_sq e f hee hff hef, octBlockEndC_mul]
    have hq : JoinedIdQvC (octBlockEndC (octPlaneRot e f 0 1)) :=
      joinedIdQvC_octBlockEndC_octPlaneRot e f 0 1 hee hff hef (by ring) (by norm_num)
    exact joinedIdQvC_mul hq hq
  · exact joinedIdQvC_octBlockEndC_octPlaneRot e f c s hee hff hef hcs hc

-- ★ D1 (unit) : the general bireflection of two UNIT vectors is JoinedIdQvC.
theorem joinedIdQvC_unitBireflection_probe (a b : O Cut)
    (haa : gFormC a a = 1) (hbb : gFormC b b = 1) :
    JoinedIdQvC (octBlockEndC (houseHolder a * houseHolder b)) := by
  set k : Cut := gFormC a b with hk
  have hba : gFormC b a = k := by rw [hk, gFormC_symm]
  set f0 : O Cut := b - k • a with hf0
  have haf0 : gFormC a f0 = 0 := by
    rw [hf0, sub_eq_add_neg, gFormC_add_right, octRefl_gFormC_neg_right, gFormC_smul_right, haa,
        ← hk]; ring
  have hf0f0 : gFormC f0 f0 = 1 - k ^ 2 := by
    rw [hf0, gFormC_houseterm b b a k k, hbb, hba, ← hk, haa]; ring
  rcases eq_or_lt_of_le (gFormC_nonneg f0) with hz | hpos
  · -- f0 has zero norm ⇒ f0 = 0 ⇒ b = k • a, k² = 1, bireflection = 1
    have hf0z : f0 = 0 := (gFormC_eq_zero_iff f0).mp hz.symm
    have hbka : b = k • a := by rw [hf0] at hf0z; linear_combination (norm := module) hf0z
    have hk2 : k ^ 2 = 1 := by
      have hzz : gFormC f0 f0 = 1 - k ^ 2 := hf0f0
      rw [← hz] at hzz; linarith [hzz]
    have hkne : k ≠ 0 := by intro h; rw [h] at hk2; norm_num at hk2
    rw [hbka, houseHolder_smul_probe a k hkne, houseHolder_involutive (by rw [haa]; norm_num),
        octBlockEndC_one]
    exact joinedIdQvC_one
  · -- f0 has positive norm ⇒ normalize, apply the gen identity + circle lemma
    rw [eq_comm] at hf0f0  -- 1 - k^2 = gFormC f0 f0
    have hpos' : (0:Cut) < 1 - k ^ 2 := by rw [hf0f0]; exact hpos
    set μ : Cut := cutSqrt (1 - k ^ 2) with hμ
    have hμpos : 0 < μ := cutSqrt_pos hpos'
    have hμne : μ ≠ 0 := ne_of_gt hμpos
    have hμ2 : μ * μ = 1 - k ^ 2 := cutSqrt_sq (le_of_lt hpos')
    set f : O Cut := μ⁻¹ • f0 with hf
    have hff : gFormC f f = 1 := by
      rw [hf, gFormC_smul_left, gFormC_smul_right, ← hf0f0]
      field_simp
      nlinarith [hμ2]
    have haf : gFormC a f = 0 := by rw [hf, gFormC_smul_right, haf0, mul_zero]
    have hbexp : b = k • a + μ • f := by
      rw [hf, smul_smul, mul_inv_cancel₀ hμne, one_smul, hf0]; module
    have hkm : k ^ 2 + μ ^ 2 = 1 := by nlinarith [hμ2]
    rw [hbexp, bireflection_eq_octPlaneRot_gen_probe a f k μ haa hff haf hkm]
    apply joinedIdQvC_circle_probe a f _ _ haa hff haf
    nlinarith [hkm]

-- ★ D2 : a WORD of bireflections (unit pairs) lifts to JoinedIdQvC.
theorem joinedIdQvC_unitBireflectionWord_probe :
    ∀ (L : List (O Cut × O Cut)),
      (∀ t ∈ L, gFormC t.1 t.1 = 1 ∧ gFormC t.2 t.2 = 1) →
      JoinedIdQvC (octBlockEndC ((L.map (fun t => houseHolder t.1 * houseHolder t.2)).prod))
  | [], _ => by
      simp only [List.map_nil, List.prod_nil, octBlockEndC_one]; exact joinedIdQvC_one
  | t :: L, h => by
      simp only [List.map_cons, List.prod_cons, octBlockEndC_mul]
      obtain ⟨h1, h2⟩ := h t (List.mem_cons_self ..)
      refine joinedIdQvC_mul (joinedIdQvC_unitBireflection_probe t.1 t.2 h1 h2) ?_
      exact joinedIdQvC_unitBireflectionWord_probe L (fun s hs => h s (List.mem_cons_of_mem t hs))

end
end Phys.Algebra
