import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure

namespace Probe393

open Phys.Foundation Phys.Cascade Phys.Quantum Module
open Phys.Foundation.ContinuumQ

-- ω, the symplectic / Kähler form: ω(x,y) = bornForm(J x, y)
noncomputable def kahlerForm (x y : StateFibre) : ContinuumQ.Cut := bornForm (foldComplex x) y

theorem kahlerForm_apply (x y : StateFibre) :
    kahlerForm x y = x.1 * y.2 - x.2 * y.1 := by
  unfold kahlerForm bornForm; simp [foldComplex_apply]; ring

-- (1) Kähler compatibility: J is an isometry of the self-overlap g.
theorem bornForm_foldComplex_invariant (x y : StateFibre) :
    bornForm (foldComplex x) (foldComplex y) = bornForm x y := by
  unfold bornForm; simp [foldComplex_apply]; ring

-- (2) J skew-adjoint: bornForm(Jx,y) = -bornForm(x,Jy) — the Kähler triangle g/J/ω.
theorem foldComplex_skew_adjoint (x y : StateFibre) :
    bornForm (foldComplex x) y = - bornForm x (foldComplex y) := by
  unfold bornForm; simp only [foldComplex_apply]; ring

-- (3) ω antisymmetric
theorem kahlerForm_antisymm (x y : StateFibre) :
    kahlerForm x y = - kahlerForm y x := by
  rw [kahlerForm_apply, kahlerForm_apply]; ring

-- The identification with the banked complex algebra Dbl Cut.
noncomputable def toDbl (p : StateFibre) : Dbl ContinuumQ.Cut := ⟨p.1, p.2⟩

@[simp] theorem toDbl_re (p : StateFibre) : (toDbl p).re = p.1 := rfl
@[simp] theorem toDbl_im (p : StateFibre) : (toDbl p).im = p.2 := rfl

-- THE JOINT: the derived complex structure = multiplication by the banked cascade unit J₂ = Dbl.J.
theorem toDbl_foldComplex (p : StateFibre) :
    toDbl (foldComplex p) = Dbl.J * toDbl p := by
  apply Dbl.ext <;> simp [toDbl, foldComplex_apply, Dbl.J]

-- Conjugation on the banked Dbl Cut (the reversal of the fold's chirality J ↦ -J). W1: build it.
noncomputable def dblConj (z : Dbl ContinuumQ.Cut) : Dbl ContinuumQ.Cut := ⟨z.re, -z.im⟩

@[simp] theorem dblConj_re (z : Dbl ContinuumQ.Cut) : (dblConj z).re = z.re := rfl
@[simp] theorem dblConj_im (z : Dbl ContinuumQ.Cut) : (dblConj z).im = -z.im := rfl

-- The Hermitian inner product ⟨z|w⟩ = z̄ * w over the derived complex algebra.
noncomputable def hInner (z w : Dbl ContinuumQ.Cut) : Dbl ContinuumQ.Cut := dblConj z * w

-- ⟨z|w⟩.re = g (self-overlap)  and  ⟨z|w⟩.im = ω (Kähler form)  ⇒  ⟨z|w⟩ = g + i·ω.
theorem hInner_re (φ ψ : StateFibre) :
    (hInner (toDbl φ) (toDbl ψ)).re = bornForm φ ψ := by
  unfold hInner bornForm; simp only [Dbl.mul_re, dblConj_re, dblConj_im, toDbl_re, toDbl_im]; ring

theorem hInner_im (φ ψ : StateFibre) :
    (hInner (toDbl φ) (toDbl ψ)).im = kahlerForm φ ψ := by
  rw [kahlerForm_apply]; unfold hInner; simp [dblConj]; ring

-- Hermitian symmetry: ⟨w|z⟩ = conj⟨z|w⟩.
theorem hInner_conj_symm (z w : Dbl ContinuumQ.Cut) :
    hInner w z = dblConj (hInner z w) := by
  apply Dbl.ext <;> simp [hInner, dblConj] <;> ring

-- The Dbl norm-square (self-overlap in the derived complex algebra).
noncomputable def dblNormSq (z : Dbl ContinuumQ.Cut) : ContinuumQ.Cut := z.re ^ 2 + z.im ^ 2

-- THE BORN PROBABILITY: |⟨φ|ψ⟩|² as the modulus-square of the amplitude.
noncomputable def bornProb (φ ψ : StateFibre) : ContinuumQ.Cut :=
  (bornForm φ ψ) ^ 2 + (kahlerForm φ ψ) ^ 2

-- bornProb = Dbl-norm-square of the Hermitian inner product.
theorem bornProb_eq_dblNormSq (φ ψ : StateFibre) :
    bornProb φ ψ = dblNormSq (hInner (toDbl φ) (toDbl ψ)) := by
  unfold bornProb dblNormSq
  rw [hInner_re, hInner_im]

-- ★ THE RETIREMENT: the transition probability IS the raw self-overlap (N391 bornForm)
-- of the complex overlap amplitude (g, ω).
theorem bornProb_eq_self_overlap_of_amplitude (φ ψ : StateFibre) :
    bornProb φ ψ = bornForm (bornForm φ ψ, kahlerForm φ ψ) (bornForm φ ψ, kahlerForm φ ψ) := by
  unfold bornProb bornForm; ring

theorem bornProb_nonneg (φ ψ : StateFibre) : 0 ≤ bornProb φ ψ := by
  unfold bornProb
  have h1 : 0 ≤ (bornForm φ ψ)^2 := sq_nonneg _
  have h2 : 0 ≤ (kahlerForm φ ψ)^2 := sq_nonneg _
  linarith

theorem bornProb_self (φ : StateFibre) : bornProb φ φ = (bornForm φ φ) ^ 2 := by
  unfold bornProb
  have : kahlerForm φ φ = 0 := by rw [kahlerForm_apply]; ring
  rw [this]; ring

theorem bornProb_eInward_self : bornProb eInward eInward = 1 := by
  rw [bornProb_self, bornForm_eInward_self]; ring

-- multiplicativity of the Dbl norm (1 complex dim ⇒ all rays coincide): |⟨z|w⟩|² = |z|²|w|²
theorem bornProb_eq_mul_normSq (φ ψ : StateFibre) :
    bornProb φ ψ = (bornForm φ φ) * (bornForm ψ ψ) := by
  unfold bornProb bornForm; rw [kahlerForm_apply]; ring

end Probe393
