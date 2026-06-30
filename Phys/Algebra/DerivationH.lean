/-
  Phys.Algebra.DerivationH — N184: THE QUATERNION DERIVATION LIE ALGEBRA
  Der(H ℚ) ≅ so(3) ≅ su(2) — the WEAK-ISOSPIN gauge-algebra seed.
  ===========================================================================
  THE WIDE FRONTIER (docs/RUNBOOK W4.5). The g₂ = Der(O) chain (N16–N30) and EIGHT
  consecutive g₂-flow lateral nodes (N176–N183) are banked; the colour gauge algebra
  SU(3) ⊂ G₂ = Der(O) is banked (N42a/b/c). The Standard-Model gauge group
  SU(3) × SU(2) × U(1) has its SU(3) colour factor banked but its SU(2) WEAK-ISOSPIN
  factor UNBANKED. This module banks that seed: the Leibniz-derivations of the
  ASSOCIATIVE quaternion algebra `H ℚ = CD (Dbl ℚ)` — one Cayley–Dickson rung BELOW the
  octonions — form a Lie algebra whose inner derivations `ad_q : x ↦ q·x − x·q` carry the
  so(3) ≅ su(2) bracket structure `⁅ad_i, ad_j⁆ = 2·ad_k` (and cyclically), non-abelian.

  THE MOAT — posit-vs-derive (docs/STANDARD §0). The division-algebra-physics field
  (Furey, Dixon, Günaydin–Gürsey) POSITS the quaternions and reads SU(2) weak-isospin off
  their automorphism / derivation structure by hand. Here `H ℚ = CD (Dbl ℚ)` is the
  cascade's OWN second doubling, its product the forced Cayley–Dickson product, and the
  su(2) ≅ so(3) bracket is DERIVED FORWARD from the banked inner-derivation engine
  (`adHom` / `adHom_isDeriv`, N6) — NO posited su(2) / so(3) / SU(2) / Lie group, NO
  Mathlib ℝ/ℂ as content (ℚ is the coefficient field the Module statements are written in;
  the OBJECT is the derived quaternions). The bracket closure is the SAME distributivity
  fact that survives non-associativity at N6 — here on the ASSOCIATIVE rung, so the inner
  derivations are genuine and the structure constants are forced.

  THE CONTENT (each step a theorem, foundations-only):

    hI, hJ, hK       — the three quaternion units `i = ιJ`, `j = e₂`, `k = i·j`.
    hI_sq/hJ_sq/hK_sq — `i² = j² = k² = −1` (the quaternion relations).
    hI_hJ/hJ_hI/…    — the full multiplication table (`i·j = k`, `j·i = −k`, cyclic).
    IsDerivH         — the Leibniz-derivation predicate on `H ℚ`.
    isDerivH_*       — the closure laws (zero / add / smul / bracket) — `Der(H ℚ)` a Lie subalgebra.
    derivationH      — `Der(H ℚ)` as a `LieSubalgebra ℤ (Module.End ℤ (H ℚ))`.
    adM q            — the inner derivation `ad_q` as a `Module.End ℤ (H ℚ)`.
    adM_isDerivH     — `ad_q` IS a Leibniz-derivation (the base is associative).
    adM_bracket      — ★★ THE LIE-HOM: `⁅ad_p, ad_q⁆ = ad_(p·q − q·p)`.
    adM_ij/jk/ki     — ★★ THE so(3)/su(2) STRUCTURE CONSTANTS `⁅ad_i, ad_j⁆ = 2·ad_k` cyclic.
    adM_k_on_i       — W8: `ad_k(i) = 2j`.
    adM_k_ne_zero / adM_ij_ne_zero
                     — ★★ W8 NON-VACUITY: the bracket is genuinely NON-ABELIAN (real so(3)).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "isospin / weak / gauge / su(2) /
  so(3) / SU(2)": what remains is the pure statement that the inner maps `ad_q` of the
  Cayley–Dickson double `CD (Dbl ℚ)` form a Lie algebra under the commutator with
  `⁅ad_i, ad_j⁆ = 2·ad_k` cyclically, non-abelian. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.Derivation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-! ## The three quaternion units in `H ℚ = CD (Dbl ℚ)`. -/

/-- `i := ιJ` — the first imaginary unit (the embedded complex unit `J` of `Dbl ℚ`). -/
def hI : H ℚ := CD.iota (Dbl.J)
/-- `j := e₂` — the new generator the second doubling adds. -/
def hJ : H ℚ := (CD.e2 : H ℚ)
/-- `k := i · j` — the third imaginary unit. -/
def hK : H ℚ := hI * hJ

theorem hK_def : hK = ⟨0, Dbl.J⟩ := by
  unfold hK hI hJ; ext <;> simp [CD.iota, CD.e2, Dbl.J]

/-! ## The quaternion multiplication table. -/

theorem hI_sq : hI * hI = -1 := by unfold hI; ext <;> simp [CD.iota, Dbl.J_mul_J]
theorem hJ_sq : hJ * hJ = -1 := by unfold hJ; ext <;> simp [CD.e2]
theorem hK_sq : hK * hK = -1 := by rw [hK_def]; ext <;> simp [Dbl.star_J, Dbl.J_mul_J]
theorem hI_hJ : hI * hJ = hK := rfl
theorem hJ_hI : hJ * hI = -hK := by
  rw [hK_def]; unfold hJ hI; ext <;> simp [CD.iota, CD.e2, Dbl.star_J, Dbl.J] <;> ring
theorem hJ_hK : hJ * hK = hI := by
  rw [hK_def]; unfold hJ hI; ext <;> simp [CD.iota, CD.e2, Dbl.star_J, Dbl.J] <;> ring
theorem hK_hJ : hK * hJ = -hI := by
  rw [hK_def]; unfold hJ hI; ext <;> simp [CD.iota, CD.e2, Dbl.star_J, Dbl.J] <;> ring
theorem hK_hI : hK * hI = hJ := by
  rw [hK_def]; unfold hJ hI; ext <;> simp [CD.iota, CD.e2, Dbl.star_J, Dbl.J] <;> ring
theorem hI_hK : hI * hK = -hJ := by
  rw [hK_def]; unfold hJ hI; ext <;> simp [CD.iota, CD.e2, Dbl.star_J, Dbl.J] <;> ring

/-! ## `Der(H ℚ)` — the Leibniz-derivation Lie algebra of the quaternions. -/

/-- THE LEIBNIZ-DERIVATION PREDICATE on the associative quaternion algebra `H ℚ = CD (Dbl ℚ)`. -/
def IsDerivH (D : Module.End ℤ (H ℚ)) : Prop := ∀ x y, D (x * y) = D x * y + x * D y

theorem isDerivH_zero : IsDerivH 0 := by intro x y; simp
theorem isDerivH_add (f g : Module.End ℤ (H ℚ)) (hf : IsDerivH f) (hg : IsDerivH g) :
    IsDerivH (f + g) := by
  intro x y; simp only [LinearMap.add_apply]; rw [hf x y, hg x y]
  simp only [add_mul, mul_add]; abel
theorem isDerivH_smul (n : ℤ) (f : Module.End ℤ (H ℚ)) (hf : IsDerivH f) :
    IsDerivH (n • f) := by
  intro x y; simp only [LinearMap.smul_apply]
  rw [hf x y, smul_add, smul_mul_assoc, mul_smul_comm]
/-- ★ THE COMMUTATOR CLOSURE: the bracket of two Leibniz-derivations is again one — the
    SAME distributivity argument as N6's `isDeriv_bracket` (no associator needed). -/
theorem isDerivH_bracket (f g : Module.End ℤ (H ℚ)) (hf : IsDerivH f) (hg : IsDerivH g) :
    IsDerivH ⁅f, g⁆ := by
  intro x y
  show (f * g - g * f) (x * y) = (f * g - g * f) x * y + x * (f * g - g * f) y
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [hg x y, hf x y]; simp only [map_add]
  rw [hf (g x) y, hf x (g y), hg (f x) y, hg x (f y)]
  simp only [sub_mul, mul_sub]; abel

/-- `Der(H ℚ)` — the derivation Lie algebra, a `LieSubalgebra` of `Module.End ℤ (H ℚ)`. -/
def derivationH : LieSubalgebra ℤ (Module.End ℤ (H ℚ)) where
  carrier := { D | IsDerivH D }
  add_mem' := isDerivH_add _ _
  zero_mem' := isDerivH_zero
  smul_mem' := isDerivH_smul
  lie_mem' := isDerivH_bracket _ _

@[simp] theorem mem_derivationH {D : Module.End ℤ (H ℚ)} : D ∈ derivationH ↔ IsDerivH D := Iff.rfl

/-! ## The inner derivations and the su(2) ≅ so(3) bracket. -/

/-- `adM q := ad_q : x ↦ q·x − x·q` as a `Module.End ℤ (H ℚ)` (reusing the banked `adHom`). -/
def adM (q : H ℚ) : Module.End ℤ (H ℚ) := (adHom q).toIntLinearMap

@[simp] theorem adM_apply (q x : H ℚ) : adM q x = q * x - x * q := rfl

/-- `ad_q` IS a Leibniz-derivation of `H ℚ` (the base is associative). -/
theorem adM_isDerivH (q : H ℚ) : IsDerivH (adM q) := by
  intro x y; simp only [adM_apply]; noncomm_ring

theorem adM_mem (q : H ℚ) : adM q ∈ derivationH := adM_isDerivH q

theorem adM_add (p q : H ℚ) : adM (p + q) = adM p + adM q := by
  refine LinearMap.ext fun x => ?_
  simp only [adM_apply, LinearMap.add_apply, add_mul, mul_add]; abel

/-- ★★ THE LIE-HOM IDENTITY: `ad` carries the associative commutator to the End commutator. -/
theorem adM_bracket (p q : H ℚ) : ⁅adM p, adM q⁆ = adM (p * q - q * p) := by
  refine LinearMap.ext fun x => ?_
  show (adM p * adM q - adM q * adM p) x = adM (p * q - q * p) x
  simp only [LinearMap.sub_apply, Module.End.mul_apply, adM_apply]
  noncomm_ring

/-- ★★ THE so(3)/su(2) STRUCTURE CONSTANT: `⁅ad_i, ad_j⁆ = 2·ad_k`. -/
theorem adM_ij : ⁅adM hI, adM hJ⁆ = (2 : ℤ) • adM hK := by
  rw [adM_bracket, two_zsmul, ← adM_add]; congr 1; rw [hI_hJ, hJ_hI, sub_neg_eq_add]
/-- ★★ cyclic: `⁅ad_j, ad_k⁆ = 2·ad_i`. -/
theorem adM_jk : ⁅adM hJ, adM hK⁆ = (2 : ℤ) • adM hI := by
  rw [adM_bracket, two_zsmul, ← adM_add]; congr 1; rw [hJ_hK, hK_hJ, sub_neg_eq_add]
/-- ★★ cyclic: `⁅ad_k, ad_i⁆ = 2·ad_j`. -/
theorem adM_ki : ⁅adM hK, adM hI⁆ = (2 : ℤ) • adM hJ := by
  rw [adM_bracket, two_zsmul, ← adM_add]; congr 1; rw [hK_hI, hI_hK, sub_neg_eq_add]

/-! ## W8 — non-vacuity: the bracket is genuinely NON-ABELIAN (real so(3), not 0 = 0). -/

/-- W8 witness: `ad_k(i) = 2j`. -/
theorem adM_k_on_i : adM hK hI = (2 : ℤ) • hJ := by
  rw [adM_apply, two_zsmul, hK_hI, hI_hK, sub_neg_eq_add]

/-- THE so(3)/su(2) STRUCTURE CONSTANT, read off as a scalar: the `(im.re)`-coordinate of
    `ad_k(i)` is exactly `2` — the structure constant `⁅ad_i, ad_j⁆ = 2·ad_k`. (Used by the
    anti-vacuity costume: a wrong structure-constant claim collapses this `2`.) -/
theorem adM_k_on_i_coord : (adM hK hI).im.re = 2 := by
  rw [adM_k_on_i, two_zsmul]
  simp only [CD.add_im, Dbl.add_re, hJ, CD.e2]
  norm_num

theorem hJ_ne_zero : hJ ≠ 0 := by
  intro h
  have him := congrArg (fun z : H ℚ => z.im.re) h
  simp only [hJ, CD.e2] at him; norm_num at him

theorem twoJ_ne_zero : (2 : ℤ) • hJ ≠ 0 := by
  rw [two_zsmul]; intro h
  have := congrArg (fun z : H ℚ => z.im.re) h
  simp [hJ, CD.e2] at this

theorem fourJ_ne_zero : (4 : ℤ) • hJ ≠ 0 := by
  have e4 : (4 : ℤ) • hJ = hJ + hJ + hJ + hJ := by
    rw [show (4:ℤ) = 1+1+1+1 by norm_num, add_smul, add_smul, add_smul, one_smul]
  rw [e4]; intro h
  have := congrArg (fun z : H ℚ => z.im.re) h
  simp only [hJ, CD.e2, CD.add_im, Dbl.add_re, CD.zero_im, Dbl.zero_re] at this
  norm_num at this

/-- ★★ W8: `ad_k ≠ 0` — it moves `i` to `2j ≠ 0`. -/
theorem adM_k_ne_zero : adM hK ≠ 0 := by
  intro h; apply twoJ_ne_zero; rw [← adM_k_on_i, h]; rfl

/-- ★★ W8 NON-VACUITY: the bracket is genuinely non-abelian — `⁅ad_i, ad_j⁆` sends `i` to
    `4j ≠ 0`, so it is NOT the zero map. The quaternion derivation algebra is a real so(3). -/
theorem adM_ij_ne_zero : ⁅adM hI, adM hJ⁆ ≠ 0 := by
  intro h
  apply fourJ_ne_zero
  have h2 : (⁅adM hI, adM hJ⁆) hI = 0 := by rw [h]; rfl
  rw [adM_ij, LinearMap.smul_apply, adM_k_on_i, smul_smul] at h2
  rw [← h2]; norm_num

end Phys.Algebra
