/-
  Phys.Algebra.DerivationRep7IrreducibleAdjoint — N195: THE (3,1) SUMMAND IS IRREDUCIBLE —
  the Born-anisotropy / rational-division lever applied to the ADJOINT rep, completing the
  irreducible decomposition of the joint so(4) bigrading 7 = (3,1) ⊕ (2,2).
  ===========================================================================
  N194 banked the IRREDUCIBILITY of the `(2,2) = κO(⊤)` (the new plane, dim 4) under `su(2)_T`,
  via the Born-anisotropy lever on the LEFT-REGULAR module of `H ℚ`. But the joint bigrading
  `7 = (3,1) ⊕ (2,2)` (N193) has a SECOND summand — the OLD line `ιO(ImH)` (dim 3, the `(3,1)`),
  which is `su(2)_T`-TRIVIAL (annihilated, N192 `leftImDeriv_iotaO`) and `su(2)_S`-NONTRIVIAL
  (the ADJOINT action, N193 `secondSU2_iotaO`: `secondSU2 P (ιO a) = ιO (adHom P a)`). Whether THIS
  summand is IRREDUCIBLE under `su(2)_S` is a genuinely DIFFERENT, unbanked question on a DIFFERENT
  object: the 3-dim ADJOINT / cross-product rep `ImH`, not the 4-dim left-regular module of N194.
  THIS node answers it: the `(3,1)` is `su(2)_S`-IRREDUCIBLE. Together with N194 the joint bigrading
  becomes a FULLY IRREDUCIBLE `so(4)`-decomposition — both summands irreducible, derived.

  ★ THE MECHANISM (THE ONE LAW reframe — the trunk's Born positivity, now on the ADJOINT rep, NOT
  a standard representation-theory grind). The adjoint action `ad_p(x) = p·x − x·p` of an imaginary
  `p` on imaginary quaternions is (twice) the cross product. The DOUBLE-BRACKET LEVER
  (`double_bracket_id`): for imaginary `w, p`,
      `(4 · quatNorm w) • p = ad_w(ad_p w) − (4 · (w·p).re.re) • w`,
  where `quatNorm w = w.re.re² + w.re.im² + w.im.re² + w.im.im²` is the FOUR-SQUARE Born self-overlap
  form on `H ℚ = CD (Dbl ℚ)` (N194 `quatNorm`), ANISOTROPIC over ℚ (`quatNorm w = 0 ↔ w = 0`,
  N194 `quatNorm_eq_zero`). For any submodule `W ⊆ ImH` closed under all `ad_Q` (imaginary `Q`) and
  any `0 ≠ w ∈ W`: `ad_p w ∈ W` (then `ad_w(ad_p w) ∈ W`) and `(4·(w·p).re.re)•w ∈ W`, so
  `(4·quatNorm w)•p ∈ W`; with `quatNorm w ≠ 0` this forces `p ∈ W` for EVERY imaginary `p`, hence
  `W = ImH` (`iotaImH_irreducible`). Transported through the injective `ιO` and the N193 adjoint
  intertwiner, the `(3,1) = ιO(ImH)` is `su(2)_S`-IRREDUCIBLE (`iotaImH_su2S_irreducible`).

  The SAME Born positivity that stops the cascade at the octonions and irreducibilizes the `(2,2)`
  (N194) now irreducibilizes the rational ADJOINT `3`. Over ℂ the four-square form is ISOTROPIC and
  the lever FAILS — the irreducibility is a RATIONAL / derived-ℚ division-algebra fact, NOT a
  consequence of base associativity.

  ★ W8 NON-VACUITY (`iotaImH_ne_bot`, `imHLine_not_adjoint_invariant`): the line `ℚ·hI ⊆ ImH` is a
  PROPER nonzero subspace that FAILS ad-invariance (`adHom hJ hI = −2·hK ∉ ℚ·hI`), so the
  irreducibility dichotomy genuinely FORBIDS proper nonzero invariants — not vacuous, the module is
  not 1-dimensional.

  THE MOAT — THE UNBROKEN-STRAND NOVELTY (docs/STANDARD.md §0). The division-algebra-physics field
  reads the adjoint-3 irreducibility off `so(3) ≅ su(2)` rep theory by hand. Here it is FORCED by the
  trunk's Born positivity at the quaternion rung — ONE cause (Born self-overlap = positivity =
  division survival), the SAME cause that stops the cascade and irreducibilizes the `(2,2)` (N194),
  now making the rational adjoint `3` irreducible. With BOTH summands irreducible, the joint so(4)
  bigrading is a genuine FULLY IRREDUCIBLE decomposition, derived not asserted.

  NO posited su(2)/so(3)/so(4)/g₂/SU(2)/G₂/Lie-group/rep/division-ring as content, NO Mathlib ℝ/ℂ as
  content (ℚ is the coefficient system the `Submodule`/`LinearMap`/`Module.End` statements are
  WRITTEN IN — the N6/N16/N19/N22/N25/N42/N184–N194 precedent; the OBJECTS are the derived rungs
  `Dbl ℚ` (N2), `H ℚ = CD (Dbl ℚ)` (N3), `O ℚ = CD (H ℚ)` (N4), the imaginary subspace `ImH` (N190),
  the embedding `ιO` (N190), the adjoint `adHom` (N6), and the difference family `secondSU2` (N191)).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "colour / isospin / 7 / g₂ / su(2) / so(3) /
  so(4) / adjoint / 3 / branching / bigrading / rep / gauge / irreducible": what remains is the pure
  statement that the four-square form `quatNorm` on the Cayley–Dickson double `H ℚ = CD (Dbl ℚ)` is
  anisotropic over ℚ, so the left/commutator action `ad_Q` (`Q` conjugation-antifixed) on the
  antifixed subspace `ImH` has no proper nonzero invariant submodule; transported through the
  injective embedding `ιO`, `ιO(ImH)` ⊆ `O ℚ` has none either. No theorem statement needs a physics
  word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationRep7IrreducibleBimodule
import Phys.Algebra.DerivationRep7SU2SBranching
import Phys.Algebra.DerivationH

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The double-bracket lever: the adjoint rep reconstructs every imaginary direction. -/

/-- ★ THE DOUBLE-BRACKET / BAC–CAB LEVER (one rung down): for imaginary `w, p`,
    `(4 · quatNorm w) • p = ad_w(ad_p w) − (4 · (w·p).re.re) • w`. The iterated adjoint of `w`
    recovers `p` up to the nonzero scalar `4·quatNorm w` (Born anisotropy) and a multiple of `w`.
    This is the adjoint-rep analogue of N194's `starMulSelf_eq_quatNorm`. -/
theorem double_bracket_id (w p : H ℚ) (hw : star w = -w) (hp : star p = -p) :
    ((4 * quatNorm w) : ℚ) • p
      = adHom w (adHom p w) - ((4 * (w * p).re.re) : ℚ) • w := by
  have hwre0 : w.re.re = 0 := by
    have h := congrArg (fun z : H ℚ => z.re.re) hw
    simp only [CD.star_re, Dbl.star_re', CD.neg_re, Dbl.neg_re] at h; linarith
  have hpre0 : p.re.re = 0 := by
    have h := congrArg (fun z : H ℚ => z.re.re) hp
    simp only [CD.star_re, Dbl.star_re', CD.neg_re, Dbl.neg_re] at h; linarith
  simp only [adHom_apply, sub_eq_add_neg]
  ext <;>
    simp [quatNorm, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im',
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, hwre0, hpre0] <;>
    ring

/-! ## The adjoint `3 = ImH` is irreducible under the commutator action `ad_Q`. -/

/-- ★★ THE ADJOINT IRREDUCIBILITY: a submodule `W ⊆ ImH` closed under the commutator action
    `ad_Q` for every conjugation-antifixed `Q` is `⊥` or all of `ImH`. The trunk lever: for any
    `0 ≠ w ∈ W` and any antifixed `p`, `(4·quatNorm w)•p = ad_w(ad_p w) − (4·(w·p).re.re)•w ∈ W`
    (closure under `ad`) with `quatNorm w ≠ 0` (Born anisotropy over ℚ), so `p ∈ W`; every antifixed
    `p` lies in `W`, hence `ImH ≤ W`. The adjoint `ImH`-rep has NO proper nonzero invariant. -/
theorem iotaImH_irreducible (W : Submodule ℚ (H ℚ)) (hWle : W ≤ ImH)
    (hW : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W, adHom Q x ∈ W) :
    W = ⊥ ∨ W = ImH := by
  by_cases hbot : W = ⊥
  · exact Or.inl hbot
  · right
    obtain ⟨w, hwW, hwne⟩ := (Submodule.ne_bot_iff W).mp hbot
    have hwstar : star w = -w := (mem_ImH).mp (hWle hwW)
    have hqn : quatNorm w ≠ 0 := quatNorm_ne_zero hwne
    refine le_antisymm hWle ?_
    intro x hx
    have hxstar : star x = -x := (mem_ImH).mp hx
    have hlev := double_bracket_id w x hwstar hxstar
    have h1 : adHom x w ∈ W := hW x hxstar w hwW
    have h2 : adHom w (adHom x w) ∈ W := hW w hwstar _ h1
    have h3 : ((4 * (w * x).re.re : ℚ)) • w ∈ W := W.smul_mem _ hwW
    have h4 : ((4 * quatNorm w : ℚ)) • x ∈ W := by rw [hlev]; exact W.sub_mem h2 h3
    have hne : (4 * quatNorm w : ℚ) ≠ 0 := mul_ne_zero (by norm_num) hqn
    have hxW := W.smul_mem (4 * quatNorm w)⁻¹ h4
    rwa [smul_smul, inv_mul_cancel₀ hne, one_smul] at hxW

/-! ## Transport: the (3,1) = `ιO(ImH)` is irreducible under `su(2)_S` (the adjoint action). -/

/-- ★★ THE `(3,1)` IS `su(2)_S`-IRREDUCIBLE: any submodule `W'` of the old line `ιO(ImH)` (dim 3,
    N190) closed under the `su(2)_S` action `secondSU2 P` (antifixed `P`, acting by the adjoint
    `secondSU2 P (ιO a) = ιO (adHom P a)`, N193) is `⊥` or all of `ιO(ImH)`. Pull `W'` back through
    the injective `ιO`; the `secondSU2_iotaO` intertwiner turns `su(2)_S`-invariance into adjoint
    closure on `ImH`, and `iotaImH_irreducible` closes it. -/
theorem iotaImH_su2S_irreducible (W' : Submodule ℚ (O ℚ))
    (hle : W' ≤ Submodule.map iotaO ImH)
    (hinv : ∀ (P : H ℚ), star P = -P → ∀ x ∈ W', secondSU2 P x ∈ W') :
    W' = ⊥ ∨ W' = Submodule.map iotaO ImH := by
  have hmap_le_range : Submodule.map iotaO ImH ≤ LinearMap.range iotaO := by
    rw [LinearMap.range_eq_map]; exact Submodule.map_mono le_top
  set W : Submodule ℚ (H ℚ) := Submodule.comap iotaO W' with hWdef
  have hmap : Submodule.map iotaO W = W' :=
    Submodule.map_comap_eq_self (le_trans hle hmap_le_range)
  -- W ≤ ImH
  have hWle : W ≤ ImH := by
    intro x hx
    rw [hWdef, Submodule.mem_comap] at hx
    obtain ⟨a, ha, hax⟩ := hle hx
    have : x = a := iotaO_injective hax.symm
    rw [this]; exact ha
  -- closure under ad on W
  have hWad : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W, adHom Q x ∈ W := by
    intro Q hQ x hx
    rw [hWdef, Submodule.mem_comap] at hx ⊢
    have hint := hinv Q hQ (iotaO x) hx
    rwa [secondSU2_iotaO] at hint
  rcases iotaImH_irreducible W hWle hWad with hb | ht
  · left; rw [← hmap, hb, Submodule.map_bot]
  · right; rw [← hmap, ht]

/-! ## W8 — non-vacuity: a natural proper nonzero subspace fails adjoint-invariance. -/

/-- The line `ℚ·hI ⊆ ImH` is nonzero (`hI ≠ 0`). -/
theorem iotaImH_ne_bot : Submodule.span ℚ {(hI : H ℚ)} ≠ ⊥ := by
  rw [Ne, Submodule.span_singleton_eq_bot]
  intro h
  have hc := congrArg (fun z : H ℚ => z.re.im) h
  simp [hI, CD.iota, Dbl.J] at hc

/-- ★ W8: the line `ℚ·hI` is NOT closed under the adjoint action `adHom hJ` —
    `adHom hJ hI = hJ·hI − hI·hJ = −hK − hK = −2·hK ∉ ℚ·hI`. A natural proper nonzero candidate
    FAILS invariance, so the irreducibility dichotomy genuinely FORBIDS proper nonzero invariants
    (it does not hold vacuously; the adjoint `3` is not 1-dimensional). -/
theorem imHLine_not_adjoint_invariant :
    ¬ (∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ Submodule.span ℚ {(hI : H ℚ)},
        adHom Q x ∈ Submodule.span ℚ {(hI : H ℚ)}) := by
  intro hinv
  have hJmem : star (hJ : H ℚ) = -hJ := by
    rw [hJ]; ext <;> simp [CD.e2]
  have hmem : adHom (hJ : H ℚ) hI ∈ Submodule.span ℚ {(hI : H ℚ)} :=
    hinv hJ hJmem hI (Submodule.mem_span_singleton_self _)
  have hval : adHom (hJ : H ℚ) hI = (-2 : ℚ) • hK := by
    rw [adHom_apply, hJ_hI, hI_hJ]; rw [neg_sub_left]; module
  rw [hval, Submodule.mem_span_singleton] at hmem
  obtain ⟨c, hc⟩ := hmem
  -- compare the `.im.im` coordinate: (c • hI).im.im = 0 but ((-2)•hK).im.im = -2
  have hcoord := congrArg (fun z : H ℚ => z.im.im) hc
  simp [hI, hK_def, CD.iota, Dbl.J, cd_qsmul_im, Dbl.smul_im] at hcoord

end

end Phys.Algebra
