/-
  Counterexamples.OctonionJordanHermTraceCommutatorWrongValueCostume — N299 anti-vacuity (C328).
  ===========================================================================
  W8 ANTI-VACUITY. The N299 node banks the INNERNESS-FREE trace-annihilation of the Jordan-derivation
  algebra `f₄ = derH3`: on the Hermitian arena `hermSub`, every `T ∈ derH3` sends the spectrum-mover
  `Lmul (T A)` to a COMMUTATOR whose operator trace vanishes (`derH3_kills_hermTrace`), with NO
  Chevalley–Schafer innerness. The load-bearing NON-TRIVIALITY is that the restriction map is a
  genuine nonzero action, not a vacuous zero map: the `f₄`-central DILATION restricts to `2 • id`
  (`dilation_restrict`), so applied to the identity member `⟨1, _⟩ ∈ hermSub` it yields `2 • 1`,
  whose deep-real `(0,0)` coordinate is `2`.

  The certificate is the magnitude of that dilation coefficient:

      `certVal := ((Lmul 1).restrict _ ⟨1,_⟩ : hermSub).val 0 0 |>.re.re.re   (= 2)`.

  Since `(Lmul 1)|_H = 2 • id` (banked `dilation_restrict`), `certVal = 2`, certifying the
  restricted action is genuinely nonzero — the trace-annihilation constrains a nonzero operator.

  We anchor `certVal.num.natAbs = 2` (TRUE), packaged as `min 328 (certVal.num.natAbs) = 2`, TIED
  to the node via `dilation_restrict`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the restriction is the zero map / the dilation
  restricts to `0` / `Lmul` acts trivially on `hermSub` / the trace-annihilation is vacuous): that
  `min 328 (…) = 328`. It GENUINELY equals `2` (`cert_val_true`). Rewriting the banked value reduces
  the bogus claim to the false numeric `2 = 328` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (328, 2) is fresh (RHS 328 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE DILATION-RESTRICTION CERTIFICATE: apply the restricted dilation `(Lmul 1)|_H` to the
    identity member `⟨1, _⟩ ∈ hermSub` and read the deep-real `(0,0)` coordinate of the arena value.
    Since `(Lmul 1)|_H = 2 • id` (banked `dilation_restrict`), the value is `2 • 1`, whose `(0,0)`
    real coordinate is `2` — certifying the restricted action is genuinely nonzero. -/
noncomputable def dilApplied : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  ((Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
    (lmul_mapsTo (by simp : (1 : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = 1))
    ⟨1, one_mem_hermSub⟩ : hermSub)

/-- TRUE (tied to the banked N299 law `dilation_restrict`): the restricted dilation applied to `1`
    is `2 • 1`. -/
theorem dilApplied_eq : dilApplied = (2 : ℚ) • (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  unfold dilApplied
  rw [dilation_restrict]
  simp only [LinearMap.smul_apply, LinearMap.id_coe, id_eq, SetLike.val_smul]

/-- The certificate: the deep-real `(0,0)` coordinate of the dilation-restriction value. -/
noncomputable def certVal : ℚ := (dilApplied 0 0).re.re.re

/-- TRUE: the certificate is `2`. -/
theorem certVal_eq : certVal = 2 := by
  unfold certVal
  rw [dilApplied_eq]
  simp [Matrix.smul_apply]

/-- TRUE: the magnitude of the dilation coefficient is `2`. -/
theorem certNum_true : certVal.num.natAbs = 2 := by rw [certVal_eq]; decide

/-- TRUE: `min 328 (magnitude of the certificate) = 2`, holding precisely because the restricted
    dilation `(Lmul 1)|_H = 2 • id` is genuinely nonzero — the annihilated trace acts on a
    nonzero restricted operator. -/
theorem cert_val_true : min (328 : ℕ) certVal.num.natAbs = 2 := by
  rw [certNum_true]; decide

/-- BOGUS: claims `min 328 (magnitude of the certificate) = 328`. It GENUINELY equals `2`
    (`cert_val_true`). The WRONG reading (the restriction is the zero map / the dilation restricts
    to `0` / the trace-annihilation is vacuous) reduces — through the banked value — to the false
    numeric `2 = 328`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (328 : ℕ) certVal.num.natAbs = 328 := by
  rw [cert_val_true]
  -- ⊢ (2 : ℕ) = 328  (FALSE — the costume bites)

end Counterexamples
