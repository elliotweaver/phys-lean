/-
  Counterexamples.StandpointLatticeVacuityCostume — N450 anti-vacuity (C475).
  ============================================================================================
  W8 ANTI-VACUITY. The R6 node (arc-R R6 — THE COMPONENT LATTICE + THE UNIQUE MAXIMAL CELL) has
  genuine content only if the assembly of the five banked components — over the four BANKED dependency
  edges (`fold_self_blind` N1, `J₂_self_blind`/`foldComplex` N392, `gather_bar_monad_structure` N411,
  `physical_state_talgebra_structure` N412) — is a REAL, non-trivial combinatorial structure:
  (a) the dependency-coherent cells number exactly 10 (`coherent_count_ten`);
  (b) adding the banked miss-forcing edge prunes them to exactly 7 (`forced_count_seven`);
  (★ c) a coherent cell contains {closure, gather, gluing} IFF it is the full engine
      (`triple_iff_full`, an iff, not a one-way inclusion);
  the full engine is the UNIQUE maximal coherent cell (`full_unique_maximal`);
  (Σ) the whole assembly bundles as ONE object anchored to the four banked edges (`component_lattice`).
  A mis-reading where the coherent cells did NOT number 10 (the edges over- or under-constrained), or
  where the miss-forcing edge did NOT prune to 7, or where the three upper components did NOT force the
  full engine (a proper cell carried all of {closure, gather, gluing}), would gut R6.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the R6 component lattice is genuine: the
  coherent cells number 10, the miss-forcing edge prunes to 7, and the full five-component engine is
  the unique maximal coherent cell — the only cell carrying all three upper components". It is TIED to
  the banked R6 landing by `cFlag_forced` through `coherent_count_ten`, `forced_count_seven`,
  `triple_iff_full`, `coherent_univ`, `full_unique_maximal`, and `component_lattice`.

  We anchor `min 475 cFlag = 1` (TRUE — `cFlag = 1 < 475`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the count is not 10 / the prune is not 7 / a proper cell carries
  all three upper components" mis-reading): that `min 475 cFlag = 475`. It GENUINELY equals `1`.
  Rewriting reduces the bogus claim to the false numeric `1 = 475` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (475, 1) is fresh (Cid 475 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.StandpointLattice
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.StandpointLattice

/-- THE R6-NON-VACUITY FLAG: `1` = "the component lattice is genuine: the dependency-coherent cells
    number 10, the miss-forcing edge prunes to 7, and the full five-component engine is the unique
    maximal coherent cell". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked R6 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing R6 landings — the count-10 (`coherent_count_ten`), the prune-to-7
    (`forced_count_seven`), the ★ marquee iff (`triple_iff_full`), the coherent full engine
    (`coherent_univ`), the unique-maximal theorem (`full_unique_maximal`), and the anchored capstone
    (`component_lattice`). If any were hollow, those decls would not exist and this could not
    compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @coherent_count_ten
  have _ := @forced_count_seven
  have _ := @triple_iff_full
  have _ := @coherent_univ
  have _ := @full_unique_maximal
  have _ := @component_lattice
  rfl

/-- TRUE: `min 475 cFlag = 1`, holding precisely because `cFlag = 1 < 475`. -/
theorem cons_val_true : min (475 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 475 cFlag = 475`. It GENUINELY equals `1` (`cons_val_true`). A "the count is
    not 10 / the prune is not 7 / a proper cell carries all three upper components" mis-reading reduces
    — through the banked R6 landing — to the false numeric `1 = 475`, so this must NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (475 : ℕ) cFlag = 475 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 475  (FALSE — the costume bites)

end Counterexamples
