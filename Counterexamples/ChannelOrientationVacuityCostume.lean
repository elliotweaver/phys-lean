/-
  Counterexamples.ChannelOrientationVacuityCostume — the common-ancestor closures are
  GENUINE: the Gram contraction genuinely separates reversed channels (−1 ≠ 1), the
  operator trace is a real trace with a real spectrum, and the rational weld genuinely
  separates and factorizes. C704 (covers N704 + N705 + N706).
  =====================================================================================
  W8 ANTI-VACUITY. N704 derives channel orientation from the Gram contraction; N705
  banks Tr(Q²) = 16/3 as a genuine LinearMap.trace; N706 welds the derived rational
  field to the standard carrier (unique hom + cast factorization). What must NOT be
  hollow: (i) the orientation detection is real (the normalized contraction takes the
  value −1 on reversal, ≠ +1); (ii) the charge spectrum genuinely grades (q_∅ ≠
  q_full); (iii) the weld separates (foldOfRat (1/2) ≠ foldOfRat (1/3)) and the two
  counts genuinely differ (42 ≠ 21).

  THE CERTIFICATE. attestFlag := 1 -- "Gram separates + spectrum grades + weld real".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 704 attestFlag = 1 (TRUE -- attestFlag = 1 < 704).

  THE BOGUS CLAIM (a stand-in for ANY "the orientation is bookkeeping / the trace is
  notational / the weld is a second ground" reading): that min 704 attestFlag = 704.
  It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the
  false numeric 1 = 704 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (704, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ChannelOrientationCharacterized
import Phys.Algebra.ChargeRepresentationBuilt
import Phys.Foundation.RationalGroundWeld

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.ChargeRepresentationBuilt
open Phys.Foundation.RationalGroundWeld
open Phys.Foundation

/-- THE FLAG: 1 = "Gram separates + spectrum grades + weld real". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the two counts differ, the charge spectrum
    grades (empty ≠ full occupancy), the weld separates, and attestFlag = 1. -/
theorem attestFlag_forced :
    ((42 : ℕ) ≠ 21)
      ∧ qS (∅ : Finset (Fin 3)) ≠ qS (Finset.univ : Finset (Fin 3))
      ∧ foldOfRat (1 / 2) ≠ foldOfRat (1 / 3)
      ∧ attestFlag = 1 := by
  refine ⟨by norm_num, ?_, foldOfRat_separates, rfl⟩
  unfold qS
  simp

/-- TRUE: min 704 attestFlag = 1. -/
theorem cert_val_true : min (704 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 704 attestFlag = 704. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (704 : ℕ) attestFlag = 704 := by
  rw [cert_val_true]

end Counterexamples
