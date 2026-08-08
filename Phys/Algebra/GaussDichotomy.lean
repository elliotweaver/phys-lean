/-
  # THE DICHOTOMY — small box over large disc forces total sparseness
  (GQ SG-al)

  ## What this file proves (SEED-GROWTH campaign, THE RESIDUE
  CHARACTERIZED)

  The squeeze (N658) quantified over the prime budget, as one
  theorem:

  * `zqpow_base_mono` — tower comparison across bases.
  * `small_h_dichotomy` — ★★★ THE DICHOTOMY (∀D): box complete +
    duplicate-free + length ≤ H, disc A ≥ 4·Q^(2(H+1)) ⟹ EVERY odd
    prime q ≤ Q that touches the branch DIVIDES the disc. The
    residue of the covered region is exactly TOTAL SMALL-SPARSENESS
    — the return-law frontier characterized in kernel, not prose.

  PREREG-37/37b (recon, frozen bars): the sparse rosters to 4e6 —
  every one of the 1,200 deepest sparse members across rungs
  Q = 13..43 carries h > 20 (min observed = 21 at the h-cap; NO
  small-h escapee found). The residue population is EMPTY in range
  at every observed depth — the return forcing h growth exactly as
  the dichotomy's complement demands.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussSqueeze

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- Tower comparison across bases: q ≤ Q ⟹ q^n ≤ Q^n. -/
theorem zqpow_base_mono {q Q : Z} (hq : 0 < q) (hQ : q ≤ Q) :
    ∀ n, zqpow q n ≤ zqpow Q n
  | 0 => le_refl _
  | n + 1 => by
      have ih := zqpow_base_mono hq hQ n
      have hqp : 0 < zqpow q n := by
        clear ih
        induction n with
        | zero => norm_num [zqpow]
        | succ k ihk =>
            simp only [zqpow]
            exact mul_pos hq ihk
      show q * zqpow q n ≤ Q * zqpow Q n
      have h1 : q * zqpow q n ≤ Q * zqpow q n :=
        mul_le_mul_of_nonneg_right hQ (le_of_lt hqp)
      have h2 : Q * zqpow q n ≤ Q * zqpow Q n :=
        mul_le_mul_of_nonneg_left ih (by linarith)
      linarith

/-- ★★★ THE DICHOTOMY: a small box over a large disc kills every
    small touching split prime — the residue is total sparseness. -/
theorem small_h_dichotomy {c₀ A Q : Z} {H : Nat}
    (hA : A = 4 * c₀ - 1)
    (box : List BQF)
    (hboxpw : List.Pairwise (· ≠ ·) box)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f → disc f = 1 - 4 * c₀ →
      f ∈ box)
    (hH : box.length ≤ H)
    (hbig : 4 * (zqpow Q (H + 1) * zqpow Q (H + 1)) ≤ A) :
    ∀ q : Z, ∀ p : Re, q = Z.ofRe p → PrimeRe p → 3 ≤ q → q ≤ Q →
    ∀ x w : Z, x * x + x + c₀ = q * w → ZDvd q (1 - 4 * c₀) := by
  intro q p hq hprime hq3 hqQ x w htouch
  by_contra hqndD
  -- the squeeze caps A below 4·q^(2(H+1)) ≤ 4·Q^(2(H+1)) ≤ A: dead
  have hsq := touching_squeeze hA hq hprime hq3 htouch hqndD box
    hboxpw hcomplete hH
  have hmono : zqpow q (H + 1) ≤ zqpow Q (H + 1) :=
    zqpow_base_mono (by linarith) hqQ (H + 1)
  have hqp : 0 < zqpow q (H + 1) := zqpow_pos3 hq3 (H + 1)
  nlinarith


#print axioms small_h_dichotomy

end BQF
end GaussForms
end Phys.Foundation
