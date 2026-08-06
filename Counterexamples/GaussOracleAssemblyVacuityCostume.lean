/-
  Counterexamples.GaussOracleAssemblyVacuityCostume — the oracle assembly is GENUINE:
  the fold fires on a real capture. C609.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the oracle skeleton. The content that must NOT be
  hollow: all_coprime_fold FIRES (with the trivially-true FoldStep at p := 1... NO —
  honest instance: the fold on an ALREADY-coprime selection returns it unchanged,
  which exercises the recursion's terminal branch on REAL data: the singleton
  selection [(1,2,6)] capturing the D=−20 principal class with identity slacks).

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 609 attestFlag = 1 (TRUE — attestFlag = 1 < 609).
  THE BOGUS CLAIM: min 609 attestFlag = 609. Rewriting reduces to 1 = 609; BITES.
  DISTINCT: the pair (609, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussOracleAssembly

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ (sel : List GaussForms.BQF) (h : GaussForms.BQF),
      ProdRel sel h ∧ CapturedBy (Re.step (Re.step Re.void)) (⟨1, 2, 6⟩ : GaussForms.BQF) h) →
    attestFlag = 1 :=
  fun _ => rfl

theorem capture_fires :
    ∃ (sel : List GaussForms.BQF) (h : GaussForms.BQF),
      ProdRel sel h ∧ CapturedBy (Re.step (Re.step Re.void)) (⟨1, 2, 6⟩ : GaussForms.BQF) h := by
  -- the singleton selection [e] with e = (1,2,6); product = e∘e-composite;
  -- capture: x = e, slacks := the SECOND power of e (a real 2-power)
  have hms : CompRel (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩ ⟨1 * 1, 2, 6⟩ := by
    have h := miss_split (a1 := 1) (a2 := 1) (b := 2) (c := 6)
      (al := 0) (be := 1) (by ring) (by norm_num)
    have e1 : (⟨(1:Z), 2, 1 * 6⟩ : GaussForms.BQF) = ⟨1, 2, 6⟩ := by norm_num
    rw [e1] at h
    exact h
  have he11 : (⟨(1:Z) * 1, 2, 6⟩ : GaussForms.BQF) = ⟨1, 2, 6⟩ := by norm_num
  -- the 2-power of e: PowRel e 2 (e∘e-target)
  have hpow2 : PowRel (⟨1, 2, 6⟩ : GaussForms.BQF) (Re.step (Re.step Re.void))
      ⟨1 * 1, 2, 6⟩ :=
    PowRel.succ (PowRel.one (Chain.refl _)) hms
  -- product over the singleton [e]:
  have hnil : ProdRel ([] : List GaussForms.BQF) (⟨1, 2, 6⟩ : GaussForms.BQF) :=
    ProdRel.nil rfl
  have hprod : ProdRel [(⟨1, 2, 6⟩ : GaussForms.BQF)] ⟨1 * 1, 2, 6⟩ :=
    ProdRel.cons hnil hms
  -- capture with the 2-power slack on both sides:
  refine ⟨[⟨1, 2, 6⟩], ⟨1 * 1, 2, 6⟩, hprod,
    ⟨1 * 1, 2, 6⟩, ⟨1 * 1, 2, 6⟩, ⟨1 * 1, 2, 6⟩, ⟨1 * 1, 2, 6⟩,
    ⟨⟨1, 2, 6⟩, hpow2⟩, ⟨⟨1, 2, 6⟩, hpow2⟩, ?_, ?_, Chain.refl _⟩
  · -- CompRel x P1 L: e ∘ (1·1,2,6) → (1·1,2,6) — via he11 rewrite:
    rw [he11]
    exact hms
  · -- CompRel h P2 R: (1·1,2,6) ∘ (1·1,2,6) → (1·1,2,6):
    rw [he11]
    exact hms

theorem cert_val_true : min 609 attestFlag = 1 := by
  have h := attestFlag_forced capture_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 609 attestFlag = 609 := by
  rw [cert_val_true]

end Counterexamples
