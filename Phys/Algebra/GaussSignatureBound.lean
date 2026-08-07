/-
  # THE SIGNATURE BOUND — B as one theorem (GQ SG-t)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The composition weld the external audit named as item (i): the
  signature engine (N638 cofactor kill + N639 window/pairing + N640
  ratio kill; PREREG-36b: zero collisions population-wide) states its
  COUNT as a single kernel theorem:

  * `crossMul` / `crossMul_length` — the signature space {t·d} as an
    explicit list of size |twoPows| · |divs|.
  * `signature_unique_bound` — ★★ injectivity in filter form caps the
    count at the signature space's size (box_bound at K = 1).
  * `band_signature_bound` — ★★★ THE B-BOUND: band-touch values with
    injective stripped signatures number ≤ |twoPows| · |divs|. Under
    deferral at m: |divs| ≤ 2^(m−1) (divisors of the squarefree deep
    product), |twoPows| = 1 when 2 is inert — B ≤ f(m), |D|-FREE.
    Per-D injectivity is discharged by decide in instantiation
    certificates; the engine theorems are why it always holds.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussDeferringBound

namespace Phys.Foundation
namespace GaussForms
namespace BQF

/-- The signature space as an explicit list: all products t·d. -/
def crossMul : List Z → List Z → List Z
  | [], _ => []
  | a :: as, bs => bs.map (fun b => a * b) ++ crossMul as bs

theorem crossMul_length (as bs : List Z) :
    (crossMul as bs).length = as.length * bs.length := by
  induction as with
  | nil => simp [crossMul]
  | cons a rest ih =>
      simp only [crossMul, List.length_append, List.length_map, ih,
        List.length_cons]
      rw [Nat.succ_mul]
      omega

/-- ★★ Injectivity in filter form caps the count at the signature
    space's size — box_bound at K = 1. -/
theorem signature_unique_bound {α : Type} (sigs : List Z) (vals : List α)
    (stripped : α → Z)
    (hin : ∀ v ∈ vals, stripped v ∈ sigs)
    (hinj : ∀ s ∈ sigs,
      (vals.filter (fun v => decide (stripped v = s))).length ≤ 1) :
    vals.length ≤ sigs.length := by
  have h := box_bound (K := 1) sigs vals stripped hin hinj
  omega

/-- ★★★ THE B-BOUND: band touches with injective signatures in the
    2-power × deep-divisor space number at most |twoPows| · |divs|. -/
theorem band_signature_bound {α : Type} (twoPows divs : List Z)
    (vals : List α) (stripped : α → Z)
    (hin : ∀ v ∈ vals, stripped v ∈ crossMul twoPows divs)
    (hinj : ∀ s ∈ crossMul twoPows divs,
      (vals.filter (fun v => decide (stripped v = s))).length ≤ 1) :
    vals.length ≤ twoPows.length * divs.length := by
  have h := signature_unique_bound (crossMul twoPows divs) vals stripped hin hinj
  rw [crossMul_length] at h
  exact h


#print axioms crossMul_length
#print axioms signature_unique_bound
#print axioms band_signature_bound

end BQF
end GaussForms
end Phys.Foundation
