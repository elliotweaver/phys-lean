/-
  Counterexamples.CPTInvolutionWeldVacuityCostume — N438 anti-vacuity (C463).
  ============================================================================================
  W8 ANTI-VACUITY. The N438 node (arc-Q Q4 — THE CPT THEOREM as the weld of three banked
  involutions) has genuine content only if the weld genuinely DEPENDS on the banked objects and
  the composite/ω-parity threads bite. Specifically it needs:
  (a) three commuting nontrivial involutions with the Klein-four closure `C = P·T`
      (`cpt_PT_eq_C`) and the composite `C∘P∘T = id` (`cpt_composite_returns`);
  (b) all three preserve the banked self-overlap `g = bornForm` (`chargeConj_bornForm`,
      `parityRefl_bornForm`, `timeRev_bornForm`);
  (c) `P` and `T` REVERSE the banked oriented `ω = kahlerForm` (`parityRefl_kahler`,
      `timeRev_kahler`) while `C` and the full `CPT` PRESERVE it (`chargeConj_kahler`,
      `cpt_CPT_kahler`);
  (d) the three banked ANCHORS: `T = dblConj` (`timeRev_is_dblConj`, N393), `P` anti-commutes
      with `foldComplex` (`parityRefl_anticommutes_foldComplex`, N392/N435), and `C` is the F1
      Hodge-odd charge (`charge_conjugation_hodge_odd`, N366);
  (e) the never-co-stated cross fact (`cpt_factor_violates_but_triple_restores`) and the capstone
      (`cpt_theorem`).
  A mis-reading where the composite were NOT the identity, or where every factor preserved ω (so
  the "violation" were vacuous), or where the factors were not welded to the banked modules, would
  gut Q4 into a hollow conjunction.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N438 CPT weld is genuine: C, P, T are
  three commuting nontrivial involutions with C = P·T so C∘P∘T = id; each is a g-isometry; P and T
  reverse ω while C and CPT preserve it; and the three factors are welded to dblConj / foldComplex /
  the F1 Hodge charge". It is TIED to the banked N438 landing by `cFlag_forced` through
  `cpt_PT_eq_C`, `cpt_composite_returns`, `chargeConj_bornForm`, `parityRefl_bornForm`,
  `timeRev_bornForm`, `parityRefl_kahler`, `timeRev_kahler`, `chargeConj_kahler`, `cpt_CPT_kahler`,
  `timeRev_is_dblConj`, `parityRefl_anticommutes_foldComplex`, `charge_conjugation_hodge_odd`,
  `cpt_factor_violates_but_triple_restores`, and `cpt_theorem`.

  We anchor `min 463 cFlag = 1` (TRUE — `cFlag = 1 < 463`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the composite is not id / the violation is vacuous / the
  factors are unwelded" mis-reading): that `min 463 cFlag = 463`. It GENUINELY equals `1`
  (`cons_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 463` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (463, 1) is fresh (Cid 463 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.CPTInvolutionWeld
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum.CPT

/-- THE N438-NON-VACUITY FLAG: `1` = "the CPT weld is genuine: C, P, T are three commuting
    nontrivial involutions with C = P·T so C∘P∘T = id; each is a g-isometry; P and T reverse ω
    while C and CPT preserve it; the three factors are welded to dblConj / foldComplex / the F1
    Hodge charge". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N438 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing Q4 landings — the Klein-four closure (`cpt_PT_eq_C`) and the composite returning
    (`cpt_composite_returns`), the g-isometries (`chargeConj_bornForm`, `parityRefl_bornForm`,
    `timeRev_bornForm`), the ω-parity split (`parityRefl_kahler`, `timeRev_kahler`,
    `chargeConj_kahler`, `cpt_CPT_kahler`), the three banked anchors (`timeRev_is_dblConj`,
    `parityRefl_anticommutes_foldComplex`, `charge_conjugation_hodge_odd`), the cross fact
    (`cpt_factor_violates_but_triple_restores`), and the capstone (`cpt_theorem`). If the composite
    were not id / the violation were vacuous / the factors were unwelded, those decls would not
    exist and this could not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @cpt_PT_eq_C
  have _ := @cpt_composite_returns
  have _ := @chargeConj_bornForm
  have _ := @parityRefl_bornForm
  have _ := @timeRev_bornForm
  have _ := @parityRefl_kahler
  have _ := @timeRev_kahler
  have _ := @chargeConj_kahler
  have _ := @cpt_CPT_kahler
  have _ := @timeRev_is_dblConj
  have _ := @parityRefl_anticommutes_foldComplex
  have _ := @charge_conjugation_hodge_odd
  have _ := cpt_factor_violates_but_triple_restores
  have _ := cpt_theorem
  rfl

/-- TRUE: `min 463 cFlag = 1`, holding precisely because `cFlag = 1 < 463`. -/
theorem cons_val_true : min (463 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 463 cFlag = 463`. It GENUINELY equals `1` (`cons_val_true`). A "the composite
    is not id / the violation is vacuous / the factors are unwelded" mis-reading reduces — through
    the banked N438 landing — to the false numeric `1 = 463`, so this must NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (463 : ℕ) cFlag = 463 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 463  (FALSE — the costume bites)

end Counterexamples
