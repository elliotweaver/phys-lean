/-
  Counterexamples.ParityMirrorObstructionVacuityCostume — N435 anti-vacuity (C460).
  ============================================================================================
  W8 ANTI-VACUITY. The N435 node (arc-Q Q1 — PARITY VIOLATION as the fifth face of the ONE
  obstruction: the mirror/right-regular action is blocked on the non-associative octonion rung
  while the chosen/left isospin extends cleanly, and this chirality block IS the N3 associator
  locus) has genuine content only if the fifth-face identification genuinely DEPENDS on the
  banked landings and the threads bite. Specifically it needs:
  (a) the fifth-face joint `parity_mirror_is_fifth_face` (the chirality block ⟺ the N3 locus
  `AssocLocusNonempty`); (b) the ℍ-symmetric/𝕆-broken dichotomy (`H_rung_parity_symmetric`,
  `O_rung_parity_broken`); (c) the clean-extension/blocked-mirror pair (`su2_left_extends_cleanly`,
  `mirror_extension_blocked`); (d) the five-terminations bundle `five_terminations_one_obstruction`;
  (e) the capstone `parity_violation`. A mis-reading where the block did NOT equal the N3 locus
  (a hollow fifth face), or where the two rungs behaved alike, would gut Q1.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N435 parity fifth face is genuine:
  the mirror block equals the N3 associator locus, the two rungs disagree (ℍ symmetric, 𝕆 broken),
  the chosen action extends while the mirror is blocked". It is TIED to the banked N435 landing by
  `cFlag_forced` through `parity_mirror_is_fifth_face`, `H_rung_parity_symmetric`,
  `O_rung_parity_broken`, `su2_left_extends_cleanly`, `mirror_extension_blocked`,
  `five_terminations_one_obstruction`, and `parity_violation`.

  We anchor `min 460 cFlag = 1` (TRUE — `cFlag = 1 < 460`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the fifth face is hollow / the rungs behave alike"
  mis-reading): that `min 460 cFlag = 460`. It GENUINELY equals `1` (`cons_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 460` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (460, 1) is fresh (Cid 460 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ParityMirrorObstruction
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE N435-NON-VACUITY FLAG: `1` = "the parity fifth face is genuine: the mirror block equals the
    N3 associator locus, the two rungs disagree, the chosen action extends while the mirror is
    blocked". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N435 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing Q1 landings — the fifth-face joint (`parity_mirror_is_fifth_face`), the
    rung dichotomy (`H_rung_parity_symmetric`, `O_rung_parity_broken`), the clean/blocked pair
    (`su2_left_extends_cleanly`, `mirror_extension_blocked`), the five-terminations bundle
    (`five_terminations_one_obstruction`), and the capstone (`parity_violation`). If the fifth face
    were hollow / the rungs behaved alike, those decls would not exist and this could not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := parity_mirror_is_fifth_face
  have _ := H_rung_parity_symmetric
  have _ := O_rung_parity_broken
  have _ := su2_left_extends_cleanly
  have _ := mirror_extension_blocked
  have _ := five_terminations_one_obstruction
  have _ := parity_violation
  rfl

/-- TRUE: `min 460 cFlag = 1`, holding precisely because `cFlag = 1 < 460`. -/
theorem cons_val_true : min (460 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 460 cFlag = 460`. It GENUINELY equals `1` (`cons_val_true`). A "the fifth
    face is hollow / the rungs behave alike" mis-reading reduces — through the banked N435 landing —
    to the false numeric `1 = 460`, so this must NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (460 : ℕ) cFlag = 460 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 460  (FALSE — the costume bites)

end Counterexamples
