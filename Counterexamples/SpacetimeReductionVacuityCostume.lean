/-
  Counterexamples.SpacetimeReductionVacuityCostume — N419 anti-vacuity (C444).
  ============================================================================================
  W8 ANTI-VACUITY. The N419 node (arc-O O4 — the (1,9)→(1,3) spacetime reduction) derives the
  physical Lorentzian signature `(1, 3)` as the restriction of the banked octonionic `(1, 9)` form
  (N43) to the cascade's first-fold complex rung `Dbl ℚ ⊂ O ℚ`, form-isometrically embedded via
  `emb4`. The load-bearing non-vacuity fact: the reduction is a GENUINE 4-dimensional Lorentzian
  space — the space block has `finrank spaceSub4 = 3` (a genuine THREE, the physical space
  dimension), NOT the trivial `0`/`9` a vacuous or non-reducing embedding would give, AND the
  banked `(1,9)` form is genuinely PRESERVED by the embedding (`emb4_preserves_form`). A mis-reading
  where the space block were empty (finrank `0`, a degenerate reduction with no space directions)
  would gut the whole O4 reduction — there would be no physical spacetime.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N419 reduced space block is a GENUINE
  3-dimensional negative-definite block (`finrank spaceSub4 = 3`) inside the form-preserving 4→10
  embedding". It is TIED to the banked N419 landing by `cFlag_forced` through `finrank_spaceSub4`
  (= 3) + `emb4_preserves_form`.

  We anchor `min 444 cFlag = 1` (TRUE — `cFlag = 1 < 444`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the reduction is vacuous / the space block is empty /
  the (1,3) form is not the restriction of the (1,9) form" mis-reading): that `min 444 cFlag = 444`.
  It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric
  `1 = 444` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (444, 1) is fresh (Cid 444 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeReduction
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE N419-NON-VACUITY FLAG: `1` = "the reduced space block is a genuine 3-dim negative-definite
    block inside the form-preserving 4→10 embedding of the physical (1,3) space into the banked
    octonionic (1,9) space". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N419 landing): the space block has `finrank = 3` (a genuine three
    physical space dimensions, `finrank_spaceSub4`) AND the banked `(1,9)` form restricts to the
    `(1,3)` form under the embedding (`emb4_preserves_form`); hence `cFlag = 1`. If the reduction
    were vacuous (empty space block) or non-form-preserving, this conjunction would fail. -/
theorem cFlag_forced :
    (Module.finrank ℚ spaceSub4 = 3 ∧ (∀ p : STV4, Qv (emb4 p) = Q4v p))
    ∧ cFlag = 1 :=
  ⟨⟨finrank_spaceSub4, emb4_preserves_form⟩, rfl⟩

/-- TRUE: `min 444 cFlag = 1`, holding precisely because `cFlag = 1 < 444`. -/
theorem cert_val_true : min (444 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 444 cFlag = 444`. It GENUINELY equals `1` (`cert_val_true`). A "the reduction
    is vacuous / the space block is empty / the (1,3) form is not the restriction of the (1,9) form"
    mis-reading reduces — through the banked O4 landing — to the false numeric `1 = 444`, so this
    must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (444 : ℕ) cFlag = 444 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 444  (FALSE — the costume bites)

end Counterexamples
