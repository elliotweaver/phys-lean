import Phys.Algebra.OctonionJordanGenerationMixingOverlap
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def quarkTextureCP : ℚ := assoc3 u2 u1 (octCross u1 u2)
noncomputable def leptonTextureCP (x : O ℚ) (b d : ℚ) : ℚ := assoc3 x (b • u1) (d • u1)

theorem quark_texture_cp_value : quarkTextureCP = -1 := assoc3_witness
theorem quark_texture_cp_ne_zero : quarkTextureCP ≠ 0 := by rw [quark_texture_cp_value]; norm_num
theorem lepton_texture_cp_zero (x : O ℚ) (b d : ℚ) : leptonTextureCP x b d = 0 := assoc3_cline_zero x b d

/-- ★★ THE SHARP SEPARATION (matched magnitudes): at ANY nonzero magnitudes `a,b,c`, the lepton
    (ℂ-line) texture is `0` while the quark (Fano) texture is `−a·b·c ≠ 0`. The SAME magnitudes
    (hence the same Koide norm Q) realize BOTH — so the associator distinguisher is INDEPENDENT of
    the mass norms (N310 separation, sharp form). -/
theorem sharp_texture_separation (a b c : ℚ) (ha : a ≠ 0) (hb : b ≠ 0) (hc : c ≠ 0) (x : O ℚ) :
    leptonTextureCP (a • x) b c = 0
      ∧ assoc3 (a • u2) (b • u1) (c • octCross u1 u2) ≠ 0 :=
  invariants_independent a b c ha hb hc x

/-! quark cubic non-degeneracy tooth (generic phase, distinct masses). -/

theorem quark_amp_distinct01 (M A : ℚ) (hA : A ≠ 0) :
    genVec M A (1/7) (-12/7) 0 ≠ genVec M A (1/7) (-12/7) 1 := amp_distinct01 M A hA

theorem quark_mass_degenerate_at_zero (M A : ℚ) : massVec M A 1 0 1 = massVec M A 1 0 2 :=
  mass_degenerate_at_zero M A

/-- THE CAPSTONE probe. -/
theorem quark_texture_structure :
    -- the SHARED forced-cubic mass structure (Q=2/3, cite N307/N309)
    (∀ M A p r : ℚ, 3 * p ^ 2 + r ^ 2 = 3 → M ≠ 0 → A ^ 2 = 2 * M ^ 2 →
        Qkoide (genVec M A p r) = 2 / 3)
    ∧ (∀ M A p r : ℚ, 3 * p ^ 2 + r ^ 2 = 3 → A ^ 2 = 2 * M ^ 2 → ∀ t : ℚ,
        (t - massVec M A p r 0) * (t - massVec M A p r 1) * (t - massVec M A p r 2)
          = t ^ 3 - (6 * M ^ 2) * t ^ 2 + ((9 / 4) * M ^ 4 - 6 * M * (e3amp M A p r)) * t
            - (e3amp M A p r) ^ 2)
    -- the SOLE distinguisher: quark I₃ = −1, lepton I₃ = 0
    ∧ quarkTextureCP = -1
    ∧ (∀ (x : O ℚ) (b d : ℚ), leptonTextureCP x b d = 0)
    -- sharp separation at matched magnitudes (associator ⊥ norms)
    ∧ (∀ a b c : ℚ, a ≠ 0 → b ≠ 0 → c ≠ 0 → ∀ x : O ℚ,
        leptonTextureCP (a • x) b c = 0
          ∧ assoc3 (a • u2) (b • u1) (c • octCross u1 u2) ≠ 0)
    -- two-sector overlap (CKM) unitary-up-to-scale + corner-zero (N311/N312)
    ∧ (∀ u0 u1' d0 d1 : ℚ, (mixV u0 u1' d0 d1)ᵀ * (mixV u0 u1' d0 d1)
        = ((u0 ^ 2 + u1' ^ 2) * (d0 ^ 2 + d1 ^ 2)) • (1 : Matrix (Fin 2) (Fin 2) ℚ))
    ∧ (cascadePath ≠ seeMat)
    -- W8: the two textures genuinely differ; non-degenerate spectrum at generic phase
    ∧ (∀ (x : O ℚ) (b d : ℚ), quarkTextureCP ≠ leptonTextureCP x b d)
    ∧ (∀ M A : ℚ, A ≠ 0 → genVec M A (1/7) (-12/7) 0 ≠ genVec M A (1/7) (-12/7) 1)
    -- the octonion cap grounding
    ∧ jdef Xwit Ywit ≠ 0 := by
  refine ⟨koide_genVec, ?_, quark_texture_cp_value, lepton_texture_cp_zero,
    sharp_texture_separation, mixV_unitary_up_to_scale, cascade_open_ne_closed, ?_,
    quark_amp_distinct01, jordan_fails_H4⟩
  · intro M A p r h hA t; exact mass_cubic M A p r h hA t
  · intro x b d; rw [quark_texture_cp_value, lepton_texture_cp_zero]; norm_num

end Phys.Algebra.HJ
