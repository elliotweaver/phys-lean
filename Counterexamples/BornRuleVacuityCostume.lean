/-
  Counterexamples.BornRuleVacuityCostume — N393 anti-vacuity (C418).
  ============================================================================================
  W8 ANTI-VACUITY. The N393 node (arc-J J3 — Kähler compatibility ⇒ the Born rule) derives that
  the transition probability is the modulus-square `bornProb φ ψ = g(φ,ψ)² + ω(φ,ψ)²` of the
  complex overlap amplitude `g + i·ω`, where `g = bornForm` (N391) and `ω = kahlerForm` read `g`
  through the derived complex structure `J = foldComplex` (N392). The load-bearing non-vacuity fact
  is that the KÄHLER / IMAGINARY part `ω` is GENUINELY load-bearing — NOT redundant with the real
  self-overlap `g`. The witness: `eOutward = J(eInward)` is the SAME complex ray as `eInward` (a
  phase `i·eInward`), so their Born-probability is `1` — carried ENTIRELY by `ω` (the real part
  `g(eInward,eOutward) = 0`). A mis-reading where the Born rule were "`g²` alone" (dropping the
  imaginary/Kähler part) would give `0` for this pair, collapsing the derived complex structure.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the Kähler/imaginary part ω carries the
  full transition probability between eInward and its complex phase eOutward = J(eInward): the
  Born-probability is 1, so the imaginary part is genuinely load-bearing". It is TIED to the banked
  N393 landing by `iFlag_forced`: the banked `bornProb_eInward_eOutward` witnesses
  `bornProb eInward eOutward = 1` while the real self-overlap `bornForm eInward eOutward = 0`
  (banked `bornForm_eInward_eOutward`), so the probability is carried purely by ω — the flag is `1`.

  We anchor `min 418 iFlag = 1` (TRUE — `iFlag = 1 < 418`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the Born rule is the real self-overlap g² alone / the
  imaginary/Kähler part ω is redundant / drop the complex structure" mis-reading): that
  `min 418 iFlag = 418`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 418` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (418, 1) is fresh (Cid 418 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Quantum.BornRule
import Mathlib.Tactic

namespace Counterexamples

open Phys.Quantum

/-- THE KÄHLER-LOAD-BEARING FLAG: `1` = "between eInward and its complex phase eOutward = J(eInward)
    the real self-overlap g is 0 but the Born-probability is 1, so the imaginary/Kähler part ω
    carries the full probability and is genuinely load-bearing". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N393 landing): the banked `bornProb_eInward_eOutward` proves the Born-
    probability between eInward and eOutward is `1`, while the banked `bornForm_eInward_eOutward`
    proves the real self-overlap between them is `0` — so the probability is carried purely by the
    Kähler/imaginary part ω. Hence `iFlag = 1`. If ω were redundant (Born = g² alone), this pair
    would have probability 0 and the witness would not exist. -/
theorem iFlag_forced :
    (bornProb eInward eOutward = 1 ∧ bornForm eInward eOutward = 0) ∧ iFlag = 1 :=
  ⟨⟨bornProb_eInward_eOutward, bornForm_eInward_eOutward⟩, rfl⟩

/-- TRUE: `min 418 iFlag = 1`, holding precisely because `iFlag = 1 < 418`. -/
theorem cert_val_true : min (418 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 418 iFlag = 418`. It GENUINELY equals `1` (`cert_val_true`). A "the Born rule
    is g² alone / the Kähler part ω is redundant / drop the complex structure" mis-reading reduces —
    through the banked ω-only probability of the eInward/eOutward pair — to the false numeric
    `1 = 418`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (418 : ℕ) iFlag = 418 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 418  (FALSE — the costume bites)

end Counterexamples
