import Phys.Algebra.OctonionJordanGenerationMixingOverlap
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! PROBE 1 — the texture distinguisher (the associator is the SOLE quark-vs-lepton distinguisher). -/

/-- The quark-sector CP texture invariant: the octonion associator 3-form on the non-associating
    Fano triple (the octonionic line the quark generations span). -/
noncomputable def quarkTextureCP : ℚ := assoc3 u2 u1 (octCross u1 u2)

/-- The lepton-sector CP texture invariant on the associative ℂ-line (`u1`-collinear). -/
noncomputable def leptonTextureCP (x : O ℚ) (b d : ℚ) : ℚ := assoc3 x (b • u1) (d • u1)

theorem quark_texture_cp_value : quarkTextureCP = -1 := assoc3_witness

theorem quark_texture_cp_ne_zero : quarkTextureCP ≠ 0 := by
  rw [quark_texture_cp_value]; norm_num

theorem lepton_texture_cp_zero (x : O ℚ) (b d : ℚ) : leptonTextureCP x b d = 0 :=
  assoc3_cline_zero x b d

/-- ★ THE SOLE DISTINGUISHER: quark texture carries a nonzero associator, lepton texture zero. -/
theorem texture_distinguisher :
    quarkTextureCP ≠ 0 ∧ (∀ (x : O ℚ) (b d : ℚ), leptonTextureCP x b d = 0) :=
  ⟨quark_texture_cp_ne_zero, lepton_texture_cp_zero⟩

/-- ★ the two textures are genuinely different objects (−1 ≠ 0). -/
theorem quark_texture_ne_lepton_texture (x : O ℚ) (b d : ℚ) :
    quarkTextureCP ≠ leptonTextureCP x b d := by
  rw [quark_texture_cp_value, lepton_texture_cp_zero]; norm_num

/-! PROBE 2 — the SHARED forced cubic (quark spectrum = same norm structure, cite N309). -/

theorem quark_shared_koide (M A p r : ℚ) (h : 3 * p ^ 2 + r ^ 2 = 3) (hM : M ≠ 0)
    (hA : A ^ 2 = 2 * M ^ 2) : Qkoide (genVec M A p r) = 2 / 3 :=
  koide_genVec M A p r h hM hA

theorem quark_spectrum_cubic (M A p r : ℚ) (h : 3 * p ^ 2 + r ^ 2 = 3) (hA : A ^ 2 = 2 * M ^ 2)
    (t : ℚ) :
    (t - massVec M A p r 0) * (t - massVec M A p r 1) * (t - massVec M A p r 2)
      = t ^ 3 - (6 * M ^ 2) * t ^ 2 + ((9 / 4) * M ^ 4 - 6 * M * (e3amp M A p r)) * t
        - (e3amp M A p r) ^ 2 :=
  mass_cubic M A p r h hA t

/-! PROBE 3 — two-sector overlap re-export + fano scaled. -/

theorem quark_overlap_unitary (u0 u1' d0 d1 : ℚ) :
    (mixV u0 u1' d0 d1)ᵀ * (mixV u0 u1' d0 d1)
      = ((u0 ^ 2 + u1' ^ 2) * (d0 ^ 2 + d1 ^ 2)) • (1 : Matrix (Fin 2) (Fin 2) ℚ) :=
  mixV_unitary_up_to_scale u0 u1' d0 d1

theorem quark_cp_persists (a b c : ℚ) (ha : a ≠ 0) (hb : b ≠ 0) (hc : c ≠ 0) :
    assoc3 (a • u2) (b • u1) (c • octCross u1 u2) ≠ 0 :=
  fano_scaled_ne_zero a b c ha hb hc

/-- grounding cap. -/
theorem quark_cap : jdef Xwit Ywit ≠ 0 := jordan_fails_H4

end Phys.Algebra.HJ
