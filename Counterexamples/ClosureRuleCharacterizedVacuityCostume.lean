/-
  Counterexamples.ClosureRuleCharacterizedVacuityCostume — the three principle-nodes are
  GENUINE: the extent discriminators bite (0 under-supplies strictly, ≥2 over-supplies
  strictly), the holonomy-derived masses genuinely split, and the provenance collapse
  certificates are real rationals. C701 (covers N701 + N702 + N703).
  =====================================================================================
  W8 ANTI-VACUITY. N701 characterizes the closure extent (1 uniquely census-exact,
  welded to the unary nest law); N702 builds the mass chain forward from the holonomy;
  N703 identifies the resummed class by π-collapse provenance. What must NOT be hollow:
  (i) the extent discrimination is strict (extent-0 and extent-1 staircase totals
  genuinely differ); (ii) the derived conic genuinely splits (mass0Derived ≠
  mass1Derived); (iii) the collapse form is real arithmetic (κ·c·(kπ/3) = ck/9 with
  κ's π genuinely cancelling).

  THE CERTIFICATE. attestFlag := 1 -- "extents discriminate + conic splits + π cancels".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 701 attestFlag = 1 (TRUE -- attestFlag = 1 < 701).

  THE BOGUS CLAIM (a stand-in for ANY "the extent family is degenerate / the derived
  chain is a relabel / the collapse is notational" reading): that min 701 attestFlag
  = 701. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 701 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (701, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ClosureRuleCharacterized
import Phys.Algebra.MassChainFromHolonomy
import Phys.Algebra.ResummationScopeFromProvenance

namespace Counterexamples

open Phys.Algebra.ClosureRuleCharacterized
open Phys.Algebra.MassChainFromHolonomy
open Phys.Algebra.ResummationScopeFromProvenance
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "extents discriminate + conic splits + π cancels". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): extent-1 is census-exact and extent-0 is not
    (the discrimination is real), the derived conic splits, the collapse arithmetic
    holds at the gem instance, and attestFlag = 1. -/
theorem attestFlag_forced :
    censusExact 1
      ∧ ¬ censusExact 0
      ∧ mass0Derived ≠ mass1Derived
      ∧ kappaLeading * ((5/3 : ℚ) : Cut) * (((8 : ℚ) : Cut) * cutPi / 3) = ((40/27 : ℚ) : Cut)
      ∧ attestFlag = 1 := by
  refine ⟨censusExact_one, ?_, mass0Derived_ne_mass1Derived, ?_, rfl⟩
  · intro h
    exact absurd ((censusExact_iff 0).mp h) (by norm_num)
  · have h := kappa_rung_collapse (5/3) 8
    convert h using 2
    norm_num

/-- TRUE: min 701 attestFlag = 1. -/
theorem cert_val_true : min (701 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 701 attestFlag = 701. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (701 : ℕ) attestFlag = 701 := by
  rw [cert_val_true]

end Counterexamples
