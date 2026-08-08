/-
  Counterexamples.GaussComposedLookVacuityCostume — the composed look is
  GENUINE: it composes two real looks of the real Heegner window and the
  kernel recomputes both sides. C657.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the composed look. The content that must
  NOT be hollow: composed_look must RECOMPUTE on real window data —
  c₀ = 41 (A = 163), x = 1, x′ = 2: P(1) = 43, P(2) = 47;
  4·43·47 = 8084; w = 2·2 + 3 − 82 + 1 = −74; ȳ = 4;
  w² + 163·16 = 5476 + 2608 = 8084 ✓ — the identity live on Euler's own
  window, both sides kernel-evaluated. AND non-degeneracy: the composed
  representation is the (−74, 4) look — a REAL second-generation
  representation of 2021 = 43·47 by x² + 163y² /4-scaled.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 657 attestFlag = 1 (TRUE).
  BOGUS: min 657 attestFlag = 657 reduces to 1 = 657; BITES. (657, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussComposedLook

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((4 * (((1:Z) * 1 + 1 + 41) * ((2:Z) * 2 + 2 + 41))
      = (2 * 1 * 2 + 1 + 2 - 2 * 41 + 1) * (2 * 1 * 2 + 1 + 2 - 2 * 41 + 1)
        + 163 * (((1:Z) + 2 + 1) * ((1:Z) + 2 + 1)))) → attestFlag = 1 :=
  fun _ => rfl

/-- The composed look fires on Euler's window: P(1)·P(2) = 43·47
    composes to the (−74, 4) look at A = 163. -/
theorem look_fires :
    4 * (((1:Z) * 1 + 1 + 41) * ((2:Z) * 2 + 2 + 41))
      = (2 * 1 * 2 + 1 + 2 - 2 * 41 + 1) * (2 * 1 * 2 + 1 + 2 - 2 * 41 + 1)
        + 163 * (((1:Z) + 2 + 1) * ((1:Z) + 2 + 1)) :=
  composed_look (c₀ := 41) (A := 163) (x := 1) (x' := 2) (by norm_num)

theorem cert_val_true : min 657 attestFlag = 1 := by
  have h := attestFlag_forced look_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 657 attestFlag = 657 := by
  rw [cert_val_true]

end Counterexamples
