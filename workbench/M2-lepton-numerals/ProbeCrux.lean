import Phys.Foundation.ContinuumBracket
import Phys.Algebra.NarrowedBracket7
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- CRUX 1: big-number norm_num, ewlo * Ehi^28 <= 1  (Ehi=284966/1e5, ewlo=184405/1e18)
example : (184405 / (10:Cut)^18) * (284966 / 100000)^28 ≤ 1 := by norm_num

-- CRUX 2: 1 <= ewhi * Elo^28  (Elo=284965/1e5, ewhi=184445/1e18)
example : (1:Cut) ≤ (184445 / (10:Cut)^18) * (284965 / 100000)^28 := by norm_num

-- CRUX 3: exp lower partial sum, Elo <= partialExp aArg 12
example : (284965 / 100000 : Cut) ≤ partialExp (1047197 / 1000000) 12 := by
  unfold partialExp expTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

-- CRUX 4: exp upper, partialExp bArg 12 + expRemBound bArg 12 <= Ehi
example : partialExp (1047198 / 1000000 : Cut) 12 + expRemBound (1047198 / 1000000) 12
    ≤ 284966 / 100000 := by
  unfold partialExp expTermC expRemBound
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

end
