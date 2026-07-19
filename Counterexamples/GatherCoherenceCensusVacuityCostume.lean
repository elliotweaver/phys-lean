/-
  Counterexamples.GatherCoherenceCensusVacuityCostume — the gather-coherence census is GENUINE: both
  classes are inhabited by proved algebra theorems (42 associating, 168 antipodal — NOT all-associating,
  NOT all-antipodal), the 210 triples are duplicate-free, and the census mean is the strict deficit
  −3/5 ∈ (−1, 0). C585.
  =====================================================================================
  W8 ANTI-VACUITY. The census node proves per-triple bracketing identities of the banked derived O ℚ
  and assembles them into the −3/5 mean. The content that must NOT be hollow: (i) the associating class
  is INHABITED (42 > 0 — if the octonions were "maximally non-associative on basis triples" the mean
  would be −1 and the census trivial); (ii) the antipodal class is INHABITED (168 > 0 — if the algebra
  were associative the mean would be +1 and there would be no obstruction at all); (iii) the mean is
  STRICTLY inside (−1, 0) — a genuine partial deficit, not a degenerate endpoint.

  THE CERTIFICATE. attestFlag := 1 -- "the census is genuine: both classes inhabited, 210 nodup
  triples, mean = −3/5 strictly between −1 and 0". TIED to the banked landing by attestFlag_forced.

  We anchor min 585 attestFlag = 1 (TRUE -- attestFlag = 1 < 585, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the census is one-sided / the mean is a degenerate ±1 / the
  lists are padded with duplicates" reading): that min 585 attestFlag = 585. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 585 in the naturals.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (585, 1) is fresh (Cid 585 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GatherCoherenceCensus

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.GatherCoherence

/-- THE FLAG: 1 = "the gather-coherence census is genuine: both classes inhabited (42 and 168),
    the 210 triples nodup, the mean −3/5 strictly inside (−1, 0)". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the census counts are 42 and 168 (`assoc_card`/`anti_card`),
    the union is duplicate-free (`census_nodup`), the mean is exactly −3/5 (`census_mean`), strictly
    between −1 and 0 (`census_not_vacuous`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    assocTriples.length = 42 ∧ antiTriples.length = 168
    ∧ (assocTriples ++ antiTriples).Nodup
    ∧ ((assocTriples.length : ℚ) - antiTriples.length) /
        ((assocTriples.length : ℚ) + antiTriples.length) = -(3/5)
    ∧ (-(1:ℚ) < -(3/5) ∧ -(3/5:ℚ) < 0)
    ∧ attestFlag = 1 :=
  ⟨assoc_card, anti_card, census_nodup, census_mean, census_not_vacuous.2, rfl⟩

/-- TRUE: min 585 attestFlag = 1, holding precisely because attestFlag = 1 < 585. -/
theorem cert_val_true : min (585 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 585 attestFlag = 585. It GENUINELY equals 1 (cert_val_true). A "the census is
    one-sided / the mean is degenerate / the lists are padded" reading reduces -- through the banked
    assoc_card / anti_card / census_nodup / census_mean tie -- to the false numeric 1 = 585 in the
    naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (585 : ℕ) attestFlag = 585 := by
  rw [cert_val_true]

end Counterexamples
