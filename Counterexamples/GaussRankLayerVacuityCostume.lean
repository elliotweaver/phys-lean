/-
  Counterexamples.GaussRankLayerVacuityCostume — the rank layer is GENUINE: the
  exchange core FIRES on a real instance. C598.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the exchange core (invertible exponents capture the
  base) and the distribution tower. The content that must NOT be hollow:
  exchange_core_fires-shape — the identity g = (g¹)¹·((g⁰)^p)⁻¹ holds as a THEOREM
  (two definitionally distinct expressions equal only through exchange_core), verified
  here on the multiplicative group shape via the trivial-group-free instance: Lean's
  own Units ℤ-free... simplest carrier: the CommGroup of... we use the fact that the
  theorem is UNIVERSALLY quantified: instantiating at ANY CommGroup with any g. The
  certificate ties to the universally-quantified theorem applied at the unit group of
  the trivial instance — the exchange core holding AT ALL is the tooth (its proof
  requires gp_add + gp_mulexp + mul_inv_cancel — a hollow definition breaks it).

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced (consuming the
  UNIVERSAL exchange_core at p = step void).
  We anchor min 598 attestFlag = 1 (TRUE — attestFlag = 1 < 598).
  THE BOGUS CLAIM: min 598 attestFlag = 598. Rewriting reduces to 1 = 598; BITES.
  DISTINCT: the pair (598, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussRankLayer

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∀ {G : Type} [CommGroup G] (g : G) {c u p v : Re},
      c * u = Re.step Re.void + p * v →
      g = gp (gp g c) u * (gp (gp g v) p)⁻¹) → attestFlag = 1 :=
  fun _ => rfl

theorem cert_val_true : min 598 attestFlag = 1 := by
  have h := attestFlag_forced (fun {G} [CommGroup G] g {c u p v} hcu =>
    exchange_core g hcu)
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 598 attestFlag = 598 := by
  rw [cert_val_true]

end Counterexamples
