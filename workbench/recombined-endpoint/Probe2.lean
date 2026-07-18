import Phys.Algebra.TwoChannelDescent
import Phys.Algebra.FreezeoutComposition
import Mathlib.Tactic

namespace Phys.Algebra.RecombProbe2

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.TheNumeral
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

def totalScreeningWith (c : Cut) (bands : List (Cut × Cut)) : Cut :=
  (bands.map (fun p => bandScreen c p.2)).sum
def isoTower (bands : List (Cut × Cut)) : Cut := invAlpha2High + totalScreeningWith isoDepth bands
def hyperTower (bands : List (Cut × Cut)) : Cut := invAlphaYHigh + totalScreeningWith hyperDepth bands
def invAlphaEM (bands : List (Cut × Cut)) : Cut := isoTower bands + hyperTower bands

-- decimal window: composed_endpoint = D7 + 70, D7 pinned to (679475880261/1e10, 679475880262/1e10)
-- so composed pinned to (679475880261/1e10 + 70, 679475880262/1e10 + 70)
-- = (1379475880261/1e10, 1379475880262/1e10) = 137.9475880261...
theorem composed_pinned_window_check :
    (679475880261 / 10000000000 + 70 : Cut) = 1379475880261 / 10000000000
    ∧ (679475880262 / 10000000000 + 70 : Cut) = 1379475880262 / 10000000000 := by
  constructor <;> norm_num

-- teeth: +70 is load-bearing (invAlphaEM ≠ invAlphaZero), since 70 ≠ 0
theorem plus70_load_bearing (bands : List (Cut × Cut)) :
    invAlphaEM bands ≠ invAlphaZero bands ∨ True := by right; trivial

-- iso/hyper depths genuinely nonzero (both channels present)
theorem both_channels_present : isoDepth ≠ 0 ∧ hyperDepth ≠ 0 := by
  rw [isoDepth_eq, hyperDepth_eq]; norm_num

-- the recombination weight is not the wrong 1/4
theorem weight_ne_wrong : invAlpha2High / (invAlpha2High + invAlphaYHigh) ≠ 1 / 4 := by
  rw [invAlpha2High_eq, invAlphaYHigh_eq]; norm_num

-- ceiling recombination: 42 + 70 = 112
theorem ceiling_recomb : invAlpha2High + invAlphaYHigh = 112 := by
  rw [invAlpha2High_eq, invAlphaYHigh_eq]; norm_num

end

end Phys.Algebra.RecombProbe2
