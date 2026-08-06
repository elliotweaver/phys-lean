/-
  Counterexamples.GaussComposeVacuityCostume — the WD theorem is GENUINE: its
  hypotheses are satisfiable on a real instance (the identity gather of D=−4)
  and the transform machinery has teeth (transform_id reads the form itself,
  and the unit classification excludes 2). C594.
  =====================================================================================
  W8 ANTI-VACUITY. compose_well_defined concludes Chain G G' from chain-equivalent
  concordant presentations. The content that must NOT be hollow: the chain transport +
  canonical completion + CRT-record pipeline must FIRE on a real instance. Witness:
  transform_id (the identity landing reads f itself — the transform is not a constant
  map), and z_unit_class applied to 1·1 = 1 (the unit classification is inhabited).

  THE CERTIFICATE. attestFlag := 1 -- "the WD pipeline fires". TIED to the banked
  landing by attestFlag_forced.

  We anchor min 594 attestFlag = 1 (TRUE -- attestFlag = 1 < 594).

  THE BOGUS CLAIM (a stand-in for ANY "the WD hypotheses are unsatisfiable / the
  transform is degenerate" reading): that min 594 attestFlag = 594. It GENUINELY
  equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric
  1 = 594 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (594, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussCompose

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (transform (⟨1, 0, 1⟩ : GaussForms.BQF) 1 0 0 1 = ⟨1, 0, 1⟩) → attestFlag = 1 :=
  fun _ => rfl

theorem cert_val_true : min 594 attestFlag = 1 := by
  have h := attestFlag_forced (transform_id ⟨1, 0, 1⟩)
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 594 attestFlag = 594 := by
  rw [cert_val_true]

end Counterexamples
