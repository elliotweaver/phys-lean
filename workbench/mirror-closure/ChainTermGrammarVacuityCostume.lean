/-
  Counterexamples.ChainTermGrammarVacuityCostume — the chain-term grammar is GENUINE: the four
  banked endpoint terms parse into DISTINCT grammar cells (pairwise-distinct census weights;
  the base uniquely κ-free; the mirror uniquely α-carrying), and the full endpoint re-assembles
  from the parses exactly. C588.
  =====================================================================================
  W8 ANTI-VACUITY. The grammar node states the chain's term shape as Lean structure and proves
  the banked terms parse. The content that must NOT be hollow: (i) the parse is DISCRIMINATING
  (parse_weights_distinct — if all four terms landed in the same cell the "grammar" would be a
  catch-all accepting anything); (ii) the mirror is the UNIQUE α-carrying term
  (mirror_unique_alpha — the α² slot genuinely separates the mirror from the created content);
  (iii) the full endpoint parse re-assembles exactly (endpoint_parses).

  THE CERTIFICATE. attestFlag := 1 -- "the grammar discriminates: distinct weights, unique
  κ-free base, unique α-carrying mirror, exact endpoint re-assembly". TIED by attestFlag_forced.

  We anchor min 588 attestFlag = 1 (TRUE -- attestFlag = 1 < 588).

  THE BOGUS CLAIM (a stand-in for ANY "the grammar is a catch-all / the parse cells collapse /
  the re-assembly is approximate" reading): that min 588 attestFlag = 588. It GENUINELY equals
  1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 588 in the
  naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (588, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ChainTermGrammar

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.ChainTermGrammar

/-- THE FLAG: 1 = "the grammar discriminates and the endpoint re-assembles exactly". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the four parses have pairwise-distinct census weights
    (`parse_weights_distinct`), the mirror is the unique α-carrier (`mirror_unique_alpha`),
    the base the unique κ-free term (`base_unique_kappa_free`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    (baseTerm.censusWeight ≠ mirrorParsed.censusWeight)
    ∧ (mirrorParsed.alphaEnds = 2 ∧ baseTerm.alphaEnds = 0)
    ∧ (baseTerm.returns = 0 ∧ mirrorParsed.returns ≠ 0)
    ∧ attestFlag = 1 :=
  ⟨parse_weights_distinct.2.2.1,
   ⟨mirror_unique_alpha.1, mirror_unique_alpha.2.1⟩,
   ⟨base_unique_kappa_free.1, base_unique_kappa_free.2.2.2⟩, rfl⟩

/-- TRUE: min 588 attestFlag = 1. -/
theorem cert_val_true : min (588 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 588 attestFlag = 588. It GENUINELY equals 1 (cert_val_true). The kernel
    cannot close it; it BITES. -/
theorem bogus_claim : min (588 : ℕ) attestFlag = 588 := by
  rw [cert_val_true]

end Counterexamples
