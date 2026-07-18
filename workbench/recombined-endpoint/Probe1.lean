import Phys.Algebra.TwoChannelDescent
import Phys.Algebra.FreezeoutComposition
import Mathlib.Tactic

namespace Phys.Algebra.RecombProbe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.TheNumeral
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

theorem census_additive : chargeTraceDepth = isoDepth + hyperDepth := by
  rw [chargeTraceDepth_eq, isoDepth_eq, hyperDepth_eq]; norm_num

theorem bandScreen_channel_split (r : Cut) :
    bandScreen isoDepth r + bandScreen hyperDepth r = bandScreen chargeTraceDepth r := by
  unfold bandScreen
  rw [census_additive]; ring

def totalScreeningWith (c : Cut) (bands : List (Cut × Cut)) : Cut :=
  (bands.map (fun p => bandScreen c p.2)).sum

theorem totalScreeningWith_channel_split (bands : List (Cut × Cut)) :
    totalScreeningWith isoDepth bands + totalScreeningWith hyperDepth bands
      = totalScreeningWith chargeTraceDepth bands := by
  induction bands with
  | nil => simp [totalScreeningWith]
  | cons p ps ih =>
    unfold totalScreeningWith at ih ⊢
    simp only [List.map_cons, List.sum_cons]
    have hb := bandScreen_channel_split p.2
    linarith [ih, hb]

def isoTower (bands : List (Cut × Cut)) : Cut := invAlpha2High + totalScreeningWith isoDepth bands
def hyperTower (bands : List (Cut × Cut)) : Cut := invAlphaYHigh + totalScreeningWith hyperDepth bands
def invAlphaEM (bands : List (Cut × Cut)) : Cut := isoTower bands + hyperTower bands

theorem invAlphaEM_closed_charge (bands : List (Cut × Cut)) :
    invAlphaEM bands = 112 + totalScreeningWith chargeTraceDepth bands := by
  unfold invAlphaEM isoTower hyperTower
  rw [invAlpha2High_eq, invAlphaYHigh_eq, ← totalScreeningWith_channel_split]
  ring

theorem completeBandList_all_charge (p : Cut × Cut)
    (hp : p ∈ completeBandList chargeTraceDepth) : p.1 = chargeTraceDepth := by
  unfold completeBandList derivedBandList leptonTail at hp
  simp only [List.mem_append, List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with (h | h) | (h | h) <;> rw [h]

theorem totalScreeningWith_eq_totalScreening (bands : List (Cut × Cut))
    (h : ∀ p ∈ bands, p.1 = chargeTraceDepth) :
    totalScreeningWith chargeTraceDepth bands = totalScreening bands := by
  unfold totalScreeningWith totalScreening
  apply congrArg List.sum
  apply List.map_congr_left
  intro p hp
  rw [← h p hp]

theorem composed_endpoint :
    invAlphaEM (completeBandList chargeTraceDepth)
      = invAlphaZero (completeBandList chargeTraceDepth) + 70 := by
  rw [invAlphaEM_closed_charge,
      totalScreeningWith_eq_totalScreening _ completeBandList_all_charge,
      invAlphaZero_closed]
  ring

-- recombination weight = 3/8 (Z2 mixing at the ceiling)
theorem recombination_weight :
    invAlpha2High / (invAlpha2High + invAlphaYHigh) = 3 / 8 := by
  rw [invAlpha2High_eq, invAlphaYHigh_eq]; norm_num

-- composed bracket: D7 bracket + 70
theorem composed_bracket :
    (12007329939722 / 176714586765 + 70 : Cut)
        ≤ invAlphaEM (completeBandList chargeTraceDepth)
      ∧ invAlphaEM (completeBandList chargeTraceDepth)
        ≤ 32019546505738 / 471238898037 + 70 := by
  rw [composed_endpoint]
  obtain ⟨hlo, hhi⟩ := theNumeral_bracket
  exact ⟨by linarith, by linarith⟩

end

end Phys.Algebra.RecombProbe
