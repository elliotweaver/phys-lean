import Phys.Algebra.DownConfinementRelativeScale
import Phys.Algebra.ConfinementScaleNumeral
import Phys.Algebra.UnitPeg
import Mathlib.Tactic

namespace Phys.Algebra.HeavyQuarkProbe

open Phys.Algebra Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.DownConfinementRelativeScale Phys.Algebra.BandEdgeList
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.ConfNumeral Phys.Algebra.LeptonNumerals
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- q bracket from the banked cos(π/4) bracket (q := cutCos (cutPi/4))
theorem q_bracket : (7071 / 10000 : Cut) ≤ q ∧ q ≤ 707107 / 1000000 :=
  cutCos_quarter_bracket

-- CRUX 1: mbRatioDerived bracket. mbRatioDerived = (1-q)²/(3(1+q)); with q²=1/2 the
-- inequality collapses to linear-in-q, so nlinarith should be cheap.
theorem crux_mb_bracket :
    (167505 / (10 : Cut) ^ 7) ≤ mbRatioDerived
      ∧ mbRatioDerived ≤ 167522 / (10 : Cut) ^ 7 := by
  obtain ⟨hqlo, hqhi⟩ := q_bracket
  have hq2 := q_sq
  have hqpos := q_pos
  have h1 : (0 : Cut) < 1 + q := by linarith
  have h3 : (0 : Cut) < 3 * (1 + q) := by linarith
  rw [mbRatioDerived_closed]
  constructor
  · rw [le_div_iff₀ h3]; nlinarith [hq2, hqhi, hqpos]
  · rw [div_le_iff₀ h3]; nlinarith [hq2, hqlo, hqpos]

-- CRUX 2: reciprocal (edgeCharm = 1/mbRatioDerived), derived from crux 1 + positivity.
theorem crux_inv_bracket :
    (5969 / 100 : Cut) ≤ 1 / mbRatioDerived
      ∧ 1 / mbRatioDerived ≤ 5971 / 100 := by
  obtain ⟨hlo, hhi⟩ := crux_mb_bracket
  have hpos : (0 : Cut) < mbRatioDerived := mbRatioDerived_pos
  have hlopos : (0 : Cut) < 167505 / (10 : Cut) ^ 7 := by norm_num
  constructor
  · have h1 : 1 / mbRatioDerived ≥ 1 / (167522 / (10 : Cut) ^ 7) :=
      one_div_le_one_div_of_le hpos hhi
    have h2 : (5969 / 100 : Cut) ≤ 1 / (167522 / (10 : Cut) ^ 7) := by norm_num
    linarith
  · have h1 : 1 / mbRatioDerived ≤ 1 / (167505 / (10 : Cut) ^ 7) :=
      one_div_le_one_div_of_le hlopos hlo
    have h2 : (1 / (167505 / (10 : Cut) ^ 7) : Cut) ≤ 5971 / 100 := by norm_num
    linarith

-- CRUX 3: downConfBundle = mbRatioDerived · confBandRatio, product bracket.
theorem downConfBundle_as_mul : downConfBundle = mbRatioDerived * confBandRatio := by
  show mbRatioDerived / confBundle = mbRatioDerived * confBandRatio
  rw [div_eq_mul_inv]
  rfl

theorem crux_dcb_bracket :
    (7280 / 100 : Cut) ≤ downConfBundle ∧ downConfBundle ≤ 7288 / 100 := by
  obtain ⟨hmlo, hmhi⟩ := crux_mb_bracket
  obtain ⟨hclo, hchi⟩ := confBandRatio_bracket
  have hmpos : (0 : Cut) < mbRatioDerived := mbRatioDerived_pos
  rw [downConfBundle_as_mul]
  constructor
  · have hkey : (7280 / 100 : Cut) ≤ (167505 / (10 : Cut) ^ 7) * 4347 := by norm_num
    have hprod : (167505 / (10 : Cut) ^ 7) * 4347 ≤ mbRatioDerived * confBandRatio := by
      apply mul_le_mul hmlo hclo (by norm_num) (le_of_lt hmpos)
    linarith
  · have hkey : (167522 / (10 : Cut) ^ 7) * 4350 ≤ 7288 / 100 := by norm_num
    have hprod : mbRatioDerived * confBandRatio ≤ (167522 / (10 : Cut) ^ 7) * 4350 := by
      apply mul_le_mul hmhi hchi (le_of_lt (lt_of_lt_of_le (by norm_num) hclo))
        (by norm_num)
    linarith

end

end Phys.Algebra.HeavyQuarkProbe
