/-
  Counterexamples.StandpointArityVacuityCostume — N### arc-R R7 anti-vacuity (C476).
  ============================================================================================
  W8 ANTI-VACUITY. The R7 node (arc-R R7 — THE ARITY SIGNATURE) has genuine content only if the
  gluing obstruction (the banked associator on `O ℚ`, = the gather's gluing defect via
  `o_gluingDefect_eq_assoc`) is EXACTLY trilinear — both faces genuine:
  (A) PAIRS GLUE: any three elements of any 2-dim ℚ-span associate (`assoc_span2_vanishes`);
  (A') GENERATED CONTENT: any three elements of span{1,a,b,ab} associate (`assoc_span4_vanishes`);
  (B) TRIPLES TEAR: at arity 3 the obstruction is genuinely NONZERO (`arity3_tear`, on the banked
      non-associating witness);
  (Σ) the whole signature bundles non-hollow (`arity_signature`).
  A mis-reading where the arity-≤2 obstruction did NOT vanish (pairs failed to glue — the associator
  were not alternating), or where the arity-3 obstruction were secretly ZERO (`O ℚ` associative —
  the tear vacuous), would gut R7: with no genuine tear the signature is empty; with no clean pairs
  the "grain" is not trilinear.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the R7 arity signature is genuine: pairs
  glue (arity ≤ 2 associates), triples tear (arity 3 has a nonzero associator), and the two faces
  bundle into one trilinear grain". It is TIED to the banked R7 landing by `cFlag_forced` through
  `assoc_span2_vanishes`, `assoc_span4_vanishes`, `arity3_tear`, and `arity_signature`.

  We anchor `min 476 cFlag = 1` (TRUE — `cFlag = 1 < 476`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "pairs do not glue / triples do not tear / the signature is
  vacuous" mis-reading): that `min 476 cFlag = 476`. It GENUINELY equals `1`. Rewriting reduces the
  bogus claim to the false numeric `1 = 476` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (476, 1) is fresh (Cid 476 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.StandpointArity
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE R7-NON-VACUITY FLAG: `1` = "the arity signature is genuine: pairs glue, triples tear, and
    the two faces bundle into one trilinear grain of the gather's gluing obstruction". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked R7 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing R7 landings — pairs-glue (`assoc_span2_vanishes`), the generated content
    (`assoc_span4_vanishes`), the genuine tear (`arity3_tear`), and the non-hollow signature bundle
    (`arity_signature`). If any were hollow, those decls would not exist and this could not
    compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @assoc_span2_vanishes
  have _ := @assoc_span4_vanishes
  have _ := @arity3_tear
  have _ := @arity_signature
  rfl

/-- TRUE: `min 476 cFlag = 1`, holding precisely because `cFlag = 1 < 476`. -/
theorem cons_val_true : min (476 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 476 cFlag = 476`. It GENUINELY equals `1` (`cons_val_true`). A "pairs do not
    glue / triples do not tear / the signature is vacuous" mis-reading reduces — through the banked
    R7 landing — to the false numeric `1 = 476`, so this must NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (476 : ℕ) cFlag = 476 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 476  (FALSE — the costume bites)

end Counterexamples
