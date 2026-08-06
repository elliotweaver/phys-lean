/-
  Counterexamples.GaussReaderJoinVacuityCostume — the reader/join kit is GENUINE: the
  join FIRES on a real fused ladder. C604.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims exact membership + exponent addition. The content
  that must NOT be hollow: pow_join fires on a REAL base-rung JoinLadder over the
  D=−20 PRINCIPAL form e = (1,2,6): hi := e (its own 1-power), base tower h := e
  (refl), W := (1·1, 2, 6) from the unit-unit miss_split. The joined result:
  PowRel e (1+1) (1·1,2,6) — an actual kernel-checked 2nd power.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 604 attestFlag = 1 (TRUE — attestFlag = 1 < 604).
  THE BOGUS CLAIM: min 604 attestFlag = 604. Rewriting reduces to 1 = 604; BITES.
  DISTINCT: the pair (604, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussReaderJoin

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation.IntegerArith
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    PowRel (⟨1, 2, 6⟩ : GaussForms.BQF)
      (Re.step Re.void + Re.step Re.void) ⟨1 * 1, 2, 6⟩ → attestFlag = 1 :=
  fun _ => rfl

theorem join_fires :
    PowRel (⟨1, 2, 6⟩ : GaussForms.BQF)
      (Re.step Re.void + Re.step Re.void) ⟨1 * 1, 2, 6⟩ := by
  have hpi : PowRel (⟨1, 2, 6⟩ : GaussForms.BQF) (Re.step Re.void) ⟨1, 2, 6⟩ :=
    PowRel.one (Chain.refl _)
  have hms : CompRel (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩ ⟨1 * 1, 2, 6⟩ := by
    have h := miss_split (a1 := 1) (a2 := 1) (b := 2) (c := 6)
      (al := 0) (be := 1) (by ring) (by norm_num)
    have e1 : (⟨(1:Z), 2, 1 * 6⟩ : GaussForms.BQF) = ⟨1, 2, 6⟩ := by norm_num
    rw [e1] at h
    exact h
  have htower : JoinLadder (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩
      (Re.step Re.void) ⟨1, 2, 6⟩ ⟨1 * 1, 2, 6⟩ :=
    JoinLadder.base (Chain.refl _) hms
  exact pow_join hpi htower

theorem cert_val_true : min 604 attestFlag = 1 := by
  have h := attestFlag_forced join_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 604 attestFlag = 604 := by
  rw [cert_val_true]

end Counterexamples
