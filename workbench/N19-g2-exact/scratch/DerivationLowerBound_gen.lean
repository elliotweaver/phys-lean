/-
  Phys.Algebra.DerivationLowerBound — N19 (L): the LOWER BOUND dim_ℚ Der(O ℚ) ≥ 14.
  ===========================================================================
  N19's scaffold (DerivationFinrank.lean) made `Module.finrank ℚ derivationQ` a
  well-typed ℕ and pinned `1 ≤ dim ≤ 64`. THIS module sharpens the lower frame to
  the EXACT `≥ 14` by EXHIBITING 14 explicit linearly-independent derivations of
  the terminal algebra `O ℚ`.

  ★ THE 14 DERIVATIONS are the explicit integer-sparse nullbasis of the Leibniz
  ℚ-system (workbench/N16-g2-dimension/nullbasis.pkl, re-verified exact-rational
  every node N16–N19). Each `DkE` is built directly as a `Module.End ℚ (O ℚ)` from
  8 coordinate functionals — MACHINERY on the DERIVED object (docs/STANDARD.md §3),
  NOT a posited number system — and each satisfies the Leibniz law `IsDerivQ`.

  ★ THE INDEPENDENCE IS DIAGONAL (the W1 reframe that dissolves a 14×14 determinant
  into a triangular read-off, docs/RUNBOOK.md W9.4 structure-over-expansion). Each
  `DkE` has a coordinate `(out aₖ, in iₖ)` where it is the UNIQUE nonzero among the
  14, so the functional `φₖ(D) := (D eᵢₖ).coord_aₖ` gives `φₖ(Dⱼ) = -δₖⱼ` — a
  negated identity ⟹ the 14 are linearly independent with no determinant.

  ★ THE BOUND. `span ℚ {D0E…D13E} ≤ derivationQ` (each is a derivation) and
  `finrank (span) = 14` (the 14 are independent), so `Submodule.finrank_mono` gives
  `14 ≤ finrank ℚ derivationQ`. Forward, foundations-only, NO posited `G₂`.

  THE MOAT — posit-vs-derive. The division-algebra field POSITS `𝕆` and reads
  `dim Der(𝕆) = 14` off `g₂` by hand. Here the 14 derivations are CONSTRUCTED and
  PROVED to be derivations + independent; the bound `≥ 14` is derived forward. The
  matching upper bound `≤ 14` (the so(7)→g₂ cut 21→14) + the `≅ g₂` structure are
  the downstream child N20, never asserted, never a bridge.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "gauge / g₂ / automorphism":
  what remains is the pure statement that the Leibniz-derivation ℚ-submodule of the
  Cayley–Dickson double of a double of a double has dimension at least 14, exhibited
  by 14 explicit linearly-independent derivations. No theorem STATEMENT needs a
  physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## The 8 coordinate functionals on `O ℚ` (model.py layout, index
    `oct_im*4 + h_im*2 + dbl_im`). Machinery on the DERIVED object. -/

def c0 (z : O ℚ) : ℚ := z.re.re.re
def c1 (z : O ℚ) : ℚ := z.re.re.im
def c2 (z : O ℚ) : ℚ := z.re.im.re
def c3 (z : O ℚ) : ℚ := z.re.im.im
def c4 (z : O ℚ) : ℚ := z.im.re.re
def c5 (z : O ℚ) : ℚ := z.im.re.im
def c6 (z : O ℚ) : ℚ := z.im.im.re
def c7 (z : O ℚ) : ℚ := z.im.im.im

/-! ## The 14 explicit derivations (the integer-sparse nullbasis). -/

/-- Derivation 0 of the nullbasis. -/
def D0E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, 0⟩, ⟨-c5 z, c4 z⟩⟩, ⟨⟨-c3 z, c2 z⟩, ⟨0, 0⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c2, c3, c4, c5, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c2, c3, c4, c5, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 1 of the nullbasis. -/
def D1E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, 0⟩, ⟨-c4 z, -c5 z⟩⟩, ⟨⟨c2 z, c3 z⟩, ⟨0, 0⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c2, c3, c4, c5, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c2, c3, c4, c5, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 2 of the nullbasis. -/
def D2E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, 0⟩, ⟨c3 z, -c2 z⟩⟩, ⟨⟨-c5 z, c4 z⟩, ⟨0, 0⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c2, c3, c4, c5, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c2, c3, c4, c5, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 3 of the nullbasis. -/
def D3E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, -c6 z⟩, ⟨0, -c4 z⟩⟩, ⟨⟨c3 z, 0⟩, ⟨c1 z, 0⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c1, c3, c4, c6, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c1, c3, c4, c6, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 4 of the nullbasis. -/
def D4E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, c5 z⟩, ⟨-c6 z, 0⟩⟩, ⟨⟨0, -c1 z⟩, ⟨c2 z, 0⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c1, c2, c5, c6, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c1, c2, c5, c6, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 5 of the nullbasis. -/
def D5E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, c4 z⟩, ⟨0, -c6 z⟩⟩, ⟨⟨-c1 z, 0⟩, ⟨c3 z, 0⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c1, c3, c4, c6, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c1, c3, c4, c6, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 6 of the nullbasis. -/
def D6E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, -c3 z⟩, ⟨0, c1 z⟩⟩, ⟨⟨-c6 z, 0⟩, ⟨c4 z, 0⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c1, c3, c4, c6, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c1, c3, c4, c6, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 7 of the nullbasis. -/
def D7E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, -c2 z⟩, ⟨c1 z, 0⟩⟩, ⟨⟨0, -c6 z⟩, ⟨c5 z, 0⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c1, c2, c5, c6, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c1, c2, c5, c6, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 8 of the nullbasis. -/
def D8E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, -c7 z⟩, ⟨c4 z, 0⟩⟩, ⟨⟨-c2 z, 0⟩, ⟨0, c1 z⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c1, c2, c4, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c1, c2, c4, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 9 of the nullbasis. -/
def D9E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, -c4 z⟩, ⟨-c7 z, 0⟩⟩, ⟨⟨c1 z, 0⟩, ⟨0, c2 z⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c1, c2, c4, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c1, c2, c4, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 10 of the nullbasis. -/
def D10E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, c5 z⟩, ⟨0, -c7 z⟩⟩, ⟨⟨0, -c1 z⟩, ⟨0, c3 z⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c1, c3, c5, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c1, c3, c5, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 11 of the nullbasis. -/
def D11E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, c2 z⟩, ⟨-c1 z, 0⟩⟩, ⟨⟨-c7 z, 0⟩, ⟨0, c4 z⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c1, c2, c4, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c1, c2, c4, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 12 of the nullbasis. -/
def D12E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, -c3 z⟩, ⟨0, c1 z⟩⟩, ⟨⟨0, -c7 z⟩, ⟨0, c5 z⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c1, c3, c5, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c1, c3, c5, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Derivation 13 of the nullbasis. -/
def D13E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, 0⟩, ⟨-c3 z, c2 z⟩⟩, ⟨⟨0, 0⟩, ⟨-c7 z, c6 z⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c2, c3, c6, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c2, c3, c6, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-! ## Each `DkE` is a Leibniz-derivation (`IsDerivQ`). -/

theorem D0E_isDerivQ : IsDerivQ D0E := by
  intro x y
  ext <;>
    simp [D0E, c2, c3, c4, c5, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D1E_isDerivQ : IsDerivQ D1E := by
  intro x y
  ext <;>
    simp [D1E, c2, c3, c4, c5, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D2E_isDerivQ : IsDerivQ D2E := by
  intro x y
  ext <;>
    simp [D2E, c2, c3, c4, c5, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D3E_isDerivQ : IsDerivQ D3E := by
  intro x y
  ext <;>
    simp [D3E, c1, c3, c4, c6, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D4E_isDerivQ : IsDerivQ D4E := by
  intro x y
  ext <;>
    simp [D4E, c1, c2, c5, c6, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D5E_isDerivQ : IsDerivQ D5E := by
  intro x y
  ext <;>
    simp [D5E, c1, c3, c4, c6, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D6E_isDerivQ : IsDerivQ D6E := by
  intro x y
  ext <;>
    simp [D6E, c1, c3, c4, c6, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D7E_isDerivQ : IsDerivQ D7E := by
  intro x y
  ext <;>
    simp [D7E, c1, c2, c5, c6, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D8E_isDerivQ : IsDerivQ D8E := by
  intro x y
  ext <;>
    simp [D8E, c1, c2, c4, c7, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D9E_isDerivQ : IsDerivQ D9E := by
  intro x y
  ext <;>
    simp [D9E, c1, c2, c4, c7, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D10E_isDerivQ : IsDerivQ D10E := by
  intro x y
  ext <;>
    simp [D10E, c1, c3, c5, c7, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D11E_isDerivQ : IsDerivQ D11E := by
  intro x y
  ext <;>
    simp [D11E, c1, c2, c4, c7, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D12E_isDerivQ : IsDerivQ D12E := by
  intro x y
  ext <;>
    simp [D12E, c1, c3, c5, c7, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem D13E_isDerivQ : IsDerivQ D13E := by
  intro x y
  ext <;>
    simp [D13E, c2, c3, c6, c7, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

/-! ## Basis elements for the diagonal functionals. -/

def e5elt : O ℚ := ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 1⟩, ⟨0, 0⟩⟩⟩
def e6elt : O ℚ := ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨1, 0⟩⟩⟩
def e7elt : O ℚ := ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 1⟩⟩⟩

/-! ## The 14 are linearly independent (diagonal-functional route). -/

theorem Dvec_linearIndependent : LinearIndependent ℚ ![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E] := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero] at hg
  have h0 := congrArg (fun z => z.re.im.re) (LinearMap.congr_fun hg e5elt)
  have h1 := congrArg (fun z => z.re.im.im) (LinearMap.congr_fun hg e5elt)
  have h2 := congrArg (fun z => z.im.re.re) (LinearMap.congr_fun hg e5elt)
  have h3 := congrArg (fun z => z.re.re.im) (LinearMap.congr_fun hg e6elt)
  have h4 := congrArg (fun z => z.re.im.re) (LinearMap.congr_fun hg e6elt)
  have h5 := congrArg (fun z => z.re.im.im) (LinearMap.congr_fun hg e6elt)
  have h6 := congrArg (fun z => z.im.re.re) (LinearMap.congr_fun hg e6elt)
  have h7 := congrArg (fun z => z.im.re.im) (LinearMap.congr_fun hg e6elt)
  have h8 := congrArg (fun z => z.re.re.im) (LinearMap.congr_fun hg e7elt)
  have h9 := congrArg (fun z => z.re.im.re) (LinearMap.congr_fun hg e7elt)
  have h10 := congrArg (fun z => z.re.im.im) (LinearMap.congr_fun hg e7elt)
  have h11 := congrArg (fun z => z.im.re.re) (LinearMap.congr_fun hg e7elt)
  have h12 := congrArg (fun z => z.im.re.im) (LinearMap.congr_fun hg e7elt)
  have h13 := congrArg (fun z => z.im.im.re) (LinearMap.congr_fun hg e7elt)
  simp only [LinearMap.add_apply, LinearMap.smul_apply, LinearMap.zero_apply,
    D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E, e5elt, e6elt, e7elt, c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] at h0 h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13
  intro i
  fin_cases i
  · simpa using h0
  · simpa using h1
  · simpa using h2
  · simpa using h3
  · simpa using h4
  · simpa using h5
  · simpa using h6
  · simpa using h7
  · simpa using h8
  · simpa using h9
  · simpa using h10
  · simpa using h11
  · simpa using h12
  · simpa using h13

/-! ## The lower bound `14 ≤ dim_ℚ Der(O ℚ)`. -/

theorem Dvec_mem (i : Fin 14) : ![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E] i ∈ derivationQ := by
  fin_cases i
  · exact D0E_isDerivQ
  · exact D1E_isDerivQ
  · exact D2E_isDerivQ
  · exact D3E_isDerivQ
  · exact D4E_isDerivQ
  · exact D5E_isDerivQ
  · exact D6E_isDerivQ
  · exact D7E_isDerivQ
  · exact D8E_isDerivQ
  · exact D9E_isDerivQ
  · exact D10E_isDerivQ
  · exact D11E_isDerivQ
  · exact D12E_isDerivQ
  · exact D13E_isDerivQ

/-- ★★ THE LOWER BOUND: `14 ≤ dim_ℚ Der(O ℚ)`. Exhibited by the 14 explicit
    linearly-independent derivations; their span sits inside `derivationQ`, and
    a span of 14 independent vectors has dimension 14. Forward, NO posited G₂. -/
theorem finrank_derivationQ_ge_14 : 14 ≤ Module.finrank ℚ derivationQ := by
  have hspan : Module.finrank ℚ (Submodule.span ℚ (Set.range ![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E])) = 14 := by
    rw [finrank_span_eq_card Dvec_linearIndependent]; rfl
  have hle : Submodule.span ℚ (Set.range ![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E]) ≤ derivationQ := by
    rw [Submodule.span_le, Set.range_subset_iff]
    exact Dvec_mem
  calc 14 = Module.finrank ℚ (Submodule.span ℚ (Set.range ![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E])) := hspan.symm
    _ ≤ Module.finrank ℚ derivationQ := Submodule.finrank_mono hle

end Phys.Algebra
