/-
  Phys.Algebra.DerivationRep7IrreducibleBimodule — N194: THE (2,2) IS IRREDUCIBLE — the
  Born-anisotropy / rational-division lever that turns the joint so(4) bigrading into a genuine
  IRREDUCIBLE decomposition.
  ===========================================================================
  N189/N190 (diagonal `1 ⊕ 3 ⊕ 3`), N192 (`su(2)_T` `3·1 ⊕ 4`) and N193 (`su(2)_S` + the JOINT
  `so(4)` bigrading `7 = (3,1) ⊕ (2,2)`) banked how the gauge-algebra factors ACT on the `7`
  (`ImO`, N22) and that the branching pieces are INVARIANT (`so4_pieces_invariant`, N193). But
  invariance is NOT irreducibility: no branching node ever proved any piece IRREDUCIBLE. The `7`
  is `g₂`-irreducible (N28 `ImLie_isIrreducible`) but `so(4)`-REDUCIBLE — it SPLITS as
  `(3,1) ⊕ (2,2)`. Whether the SUMMANDS are themselves irreducible under the SMALLER `so(4)` is a
  genuinely DIFFERENT, unbanked question. THIS node answers it for the `(2,2)`: the new plane
  `κO(⊤)` (dim `4`, N192) is IRREDUCIBLE already under the single factor `su(2)_T`, hence a
  fortiori under the full `so(4)`.

  ★ THE MECHANISM (THE ONE LAW reframe — the trunk's Born positivity ONE RUNG DOWN, NOT a standard
  representation-theory grind). The `(2,2)` is `κO`-transport of the LEFT-REGULAR module of
  `H ℚ`, with `su(2)_T` acting by `leftImDeriv Q (κO b) = κO (Q·b)` — left-multiplication by an
  imaginary quaternion `Q` (N192). A submodule `W ⊆ H ℚ` closed under all such `L_Q` is a LEFT
  IDEAL (any `q = (reH q)•1 + q_im` with `q_im ∈ ImH`, so `q·x = (reH q)•x + q_im·x ∈ W`), and
  the BORN LEVER closes it:
    • `star w · w = quatNorm w • 1`  (`starMulSelf_eq_quatNorm`), where
      `quatNorm w = w.re.re² + w.re.im² + w.im.re² + w.im.im²` is the FOUR-SQUARE Born self-overlap
      form on `H ℚ = CD (Dbl ℚ)`;
    • over the DERIVED ℚ this form is ANISOTROPIC: `quatNorm w = 0 ↔ w = 0` (a sum of four
      rational squares vanishes iff each does — `quatNorm_eq_zero`).
  So for any `0 ≠ w ∈ W`, `quatNorm w ≠ 0` and `star w · w = quatNorm w • 1 ∈ W` (left ideal),
  hence `1 = quatNorm w⁻¹ • (star w · w) ∈ W`, and `1 ∈ W` + the left-ideal closure gives `W = ⊤`
  (`leftRegular_H_irreducible`). The SAME positivity that is the division law's survival at this
  rung (lost only at the sedenions, `Sedenion.lean`) makes the rational quaternion left-module
  irreducible. (Over ℂ the four-square form is ISOTROPIC and the `(2,2)` would split `2 + 2` — the
  irreducibility is a RATIONAL / derived-ℚ division-algebra fact, genuinely new content, NOT a
  consequence of base associativity.)

  ★★ THE IRREDUCIBLE DECOMPOSITION (`kappaTop_su2T_irreducible` / `kappaTop_so4_irreducible`):
  any submodule of `κO(⊤)` closed under the `su(2)_T` action (resp. under BOTH `so(4)` factors) is
  `⊥` or all of `κO(⊤)`. With the joint bigrading `7 = (3,1) ⊕ (2,2)` (N193) this upgrades the
  branching from INVARIANT to genuinely IRREDUCIBLE on the `(2,2)` summand.

  ★ W8 NON-VACUITY (`singletLine_ne_bot`, `singletLine_not_su2T_invariant`): the diagonal singlet
  line `ℚ·κO 1` (the diagonal-`su(2)`-FIXED line, N189) is a PROPER nonzero subspace of the `(2,2)`
  that FAILS `su(2)_T`-invariance (`leftImDeriv hI (κO 1) = κO hI ∉ ℚ·κO 1`). So the irreducibility
  dichotomy genuinely FORBIDS proper nonzero invariants — it does not hold vacuously, and the
  module is not 1-dimensional or trivial.

  THE MOAT — THE UNBROKEN-STRAND NOVELTY (docs/STANDARD.md §0). The division-algebra-physics field
  exhibits the rep decomposition by hand; here the irreducibility of the `(2,2)` summand is FORCED
  by the trunk's Born positivity at the quaternion rung — ONE cause (Born self-overlap = positivity
  = division survival), the SAME cause that stops the cascade at the octonions, now making the
  rational left-regular module irreducible. The branching becomes a genuine IRREDUCIBLE
  decomposition, derived, not asserted.

  NO posited su(2)/so(4)/g₂/SU(2)/G₂/Lie-group/rep/division-ring as content, NO Mathlib ℝ/ℂ as
  content (ℚ is the coefficient system the `Submodule`/`LinearMap`/`Module.End` statements are
  WRITTEN IN — the N6/N16/N19/N22/N25/N42/N184–N193 precedent; the OBJECTS are the derived rungs
  `Dbl ℚ` (N2), `H ℚ = CD (Dbl ℚ)` (N3), `O ℚ = CD (H ℚ)` (N4), the imaginary subspaces `ImO`
  (N22) and `ImH` (N190), the new plane `κO` (N189), and the second-slot family `leftImDeriv`
  (N191)).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "colour / isospin / 7 / g₂ / su(2) / so(4)
  / singlet / adjoint / branching / bigrading / bimodule / rep / gauge / diagonal / irreducible":
  what remains is the pure statement that the four-square form `quatNorm` on the Cayley–Dickson
  double `H ℚ = CD (Dbl ℚ)` satisfies `star w · w = quatNorm w • 1` and is anisotropic over ℚ, so
  the left-regular module of `H ℚ` has no proper nonzero submodule closed under left-multiplication
  by the conjugation-antifixed elements; transported through the injective second-coordinate
  embedding `κO`, the image `κO(⊤)` ⊆ `O ℚ` has no proper nonzero submodule closed under
  `b ↦ Q·b`. No theorem statement needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationRep7SU2SBranching
import Phys.Algebra.DerivationRep7SU2TBranching
import Phys.Algebra.DerivationRep7FullBranching
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The four-square Born self-overlap form on `H ℚ`, and its anisotropy over ℚ. -/

/-- The four-square Born self-overlap form on `H ℚ = CD (Dbl ℚ)`: the sum of the squares of the
    four rational coordinates. (Physics word "Born norm" removable — pure four-square form.) -/
def quatNorm (w : H ℚ) : ℚ :=
  w.re.re ^ 2 + w.re.im ^ 2 + w.im.re ^ 2 + w.im.im ^ 2

/-- ★ THE BORN LEVER (one rung down): `star w * w = quatNorm w • 1`. The self-overlap of `w`
    against its conjugate is the scalar four-square form times the unit. -/
theorem starMulSelf_eq_quatNorm (w : H ℚ) :
    star w * w = quatNorm w • (1 : H ℚ) := by
  ext <;> simp [quatNorm, Dbl.mul_re, Dbl.mul_im, cd_qsmul_re, cd_qsmul_im,
    Dbl.smul_re, Dbl.smul_im] <;> ring

/-- ★ BORN ANISOTROPY OVER ℚ: `quatNorm w = 0 ↔ w = 0` — a sum of four rational squares vanishes
    iff every coordinate vanishes. This is the division-law survival at the quaternion rung; over
    ℂ it would FAIL (the form is isotropic), which is exactly why the irreducibility below is a
    rational fact, not a formal one. -/
theorem quatNorm_eq_zero {w : H ℚ} : quatNorm w = 0 ↔ w = 0 := by
  constructor
  · intro h
    have h4 : w.re.re ^ 2 + w.re.im ^ 2 + w.im.re ^ 2 + w.im.im ^ 2 = 0 := h
    have e1 : w.re.re = 0 := by
      nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    have e2 : w.re.im = 0 := by
      nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    have e3 : w.im.re = 0 := by
      nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    have e4 : w.im.im = 0 := by
      nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    ext <;> simp [e1, e2, e3, e4]
  · intro h; subst h; simp [quatNorm]

theorem quatNorm_ne_zero {w : H ℚ} (hw : w ≠ 0) : quatNorm w ≠ 0 :=
  fun h => hw (quatNorm_eq_zero.mp h)

/-! ## The left-regular `H ℚ`-module is irreducible (under left-multiplication by `ImH`). -/

/-- The conjugation-antifixed complement `q − (reH q)•1` lies in `ImH` (it is `star`-antifixed),
    via the banked trace identity `reH_trace` (N190). -/
theorem sub_reH_mem_ImH (q : H ℚ) : (q - (reH q) • (1 : H ℚ)) ∈ ImH := by
  rw [mem_ImH]
  have ht : q + star q = (2 * reH q) • (1 : H ℚ) := reH_trace q
  have hst : star (q - (reH q) • (1:H ℚ)) = star q - (reH q) • (1:H ℚ) := by
    rw [star_sub]; congr 1; ext <;> simp [reH]
  rw [hst]
  have hsq : star q = (2 * reH q) • (1:H ℚ) - q := by
    linear_combination (norm := abel) ht
  rw [hsq]; module

/-- A submodule `W ⊆ H ℚ` closed under left-multiplication by every conjugation-antifixed element
    is closed under left-multiplication by ALL of `H ℚ` (it is a LEFT IDEAL): split
    `q = (reH q)•1 + q_im` with `q_im ∈ ImH`. -/
theorem left_mul_mem_of_ideal {W : Submodule ℚ (H ℚ)}
    (hW : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W, Q * x ∈ W)
    (q x : H ℚ) (hx : x ∈ W) : q * x ∈ W := by
  have hsplit : q * x = (reH q) • x + (q - (reH q) • (1:H ℚ)) * x := by
    rw [sub_mul, smul_mul_assoc, one_mul]; abel
  rw [hsplit]
  refine W.add_mem (W.smul_mem _ hx) ?_
  exact hW _ ((mem_ImH).mp (sub_reH_mem_ImH q)) x hx

/-- ★★ THE IRREDUCIBILITY: a submodule `W ⊆ H ℚ` closed under left-multiplication by every
    conjugation-antifixed element is `⊥` or `⊤`. The trunk lever: for `0 ≠ w ∈ W`,
    `star w · w = quatNorm w • 1 ∈ W` (left ideal) with `quatNorm w ≠ 0` (Born anisotropy over ℚ),
    so `1 ∈ W`, then the left-ideal closure gives `W = ⊤`. The left-regular `H ℚ`-module has NO
    proper nonzero invariant subspace. -/
theorem leftRegular_H_irreducible (W : Submodule ℚ (H ℚ))
    (hW : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W, Q * x ∈ W) :
    W = ⊥ ∨ W = ⊤ := by
  by_cases hbot : W = ⊥
  · exact Or.inl hbot
  · right
    obtain ⟨w, hwW, hwne⟩ := (Submodule.ne_bot_iff W).mp hbot
    have hstarw_mul : star w * w ∈ W := left_mul_mem_of_ideal hW (star w) w hwW
    rw [starMulSelf_eq_quatNorm] at hstarw_mul
    have hq : quatNorm w ≠ 0 := quatNorm_ne_zero hwne
    have h1 : (1 : H ℚ) ∈ W := by
      have := W.smul_mem (quatNorm w)⁻¹ hstarw_mul
      rwa [smul_smul, inv_mul_cancel₀ hq, one_smul] at this
    rw [eq_top_iff]; intro q _
    have := left_mul_mem_of_ideal hW q 1 h1
    rwa [mul_one] at this

/-! ## The (2,2) = `κO(⊤)` is irreducible under `su(2)_T`, hence under the full `so(4)`. -/

/-- ★★ THE `(2,2)` IS `su(2)_T`-IRREDUCIBLE: any submodule `W'` of the new plane `κO(⊤)` (dim `4`,
    N192) closed under the `su(2)_T` action `leftImDeriv Q` (imaginary `Q`, acting by
    left-multiplication, N192) is `⊥` or all of `κO(⊤)`. Pull `W'` back through the injective
    `κO`; the `leftImDeriv_kappaO` intertwiner turns `su(2)_T`-invariance into left-ideal closure,
    and `leftRegular_H_irreducible` closes it. -/
theorem kappaTop_su2T_irreducible (W' : Submodule ℚ (O ℚ))
    (hle : W' ≤ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)))
    (hinv : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W', leftImDeriv Q x ∈ W') :
    W' = ⊥ ∨ W' = Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)) := by
  set W : Submodule ℚ (H ℚ) := Submodule.comap kappaO W' with hWdef
  have hrange : W' ≤ LinearMap.range kappaO := by
    rw [LinearMap.range_eq_map]; exact hle
  have hmap : Submodule.map kappaO W = W' := Submodule.map_comap_eq_self hrange
  have hWideal : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W, Q * x ∈ W := by
    intro Q hQ x hx
    rw [hWdef, Submodule.mem_comap] at hx ⊢
    have := hinv Q hQ (kappaO x) hx
    rwa [leftImDeriv_kappaO] at this
  rcases leftRegular_H_irreducible W hWideal with hb | ht
  · left; rw [← hmap, hb, Submodule.map_bot]
  · right; rw [← hmap, ht]

/-- ★ THE `so(4)` COROLLARY: the `(2,2)` is irreducible under the FULL `so(4) = su(2)_S × su(2)_T`
    as well — a fortiori, since more operators preserve fewer subspaces. A submodule invariant
    under BOTH `leftImDeriv` (`su(2)_T`) and `secondSU2` (`su(2)_S`, N193) is in particular
    `leftImDeriv`-invariant, so the `su(2)_T` dichotomy already forces it `⊥` or `⊤`. -/
theorem kappaTop_so4_irreducible (W' : Submodule ℚ (O ℚ))
    (hle : W' ≤ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)))
    (hinvT : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W', leftImDeriv Q x ∈ W')
    (hinvS : ∀ (P : H ℚ), star P = -P → ∀ x ∈ W', secondSU2 P x ∈ W') :
    W' = ⊥ ∨ W' = Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)) :=
  kappaTop_su2T_irreducible W' hle hinvT

/-! ## W8 — non-vacuity: a natural proper nonzero subspace fails invariance. -/

/-- The diagonal singlet line `ℚ·κO 1` (the diagonal-`su(2)`-FIXED line, N189) is a PROPER NONZERO
    subspace of the `(2,2)`: it is nonzero because `κO 1 ≠ 0` (`κO` injective, `1 ≠ 0`). -/
theorem singletLine_ne_bot : Submodule.span ℚ {kappaO (1 : H ℚ)} ≠ ⊥ := by
  rw [Ne, Submodule.span_singleton_eq_bot]
  intro h
  have h0 : kappaO (1 : H ℚ) = kappaO (0 : H ℚ) := by rw [h, map_zero]
  have h1 : (1 : H ℚ) = 0 := kappaO_injective h0
  exact one_ne_zero (congrArg (fun z : H ℚ => z.re.re) h1)

/-- ★ W8: the singlet line is NOT `su(2)_T`-invariant — `leftImDeriv hI (κO 1) = κO hI ∉ ℚ·κO 1`.
    A natural proper nonzero candidate FAILS invariance, so the irreducibility dichotomy
    genuinely FORBIDS proper nonzero invariants (it does not hold vacuously, the module is not
    1-dimensional). -/
theorem singletLine_not_su2T_invariant :
    ¬ (∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ Submodule.span ℚ {kappaO (1 : H ℚ)},
        leftImDeriv Q x ∈ Submodule.span ℚ {kappaO (1 : H ℚ)}) := by
  intro hinv
  have hImem : star (hI : H ℚ) = -hI := by
    rw [hI]; ext <;> simp [CD.iota, Dbl.J]
  have hmem : leftImDeriv (hI : H ℚ) (kappaO 1) ∈ Submodule.span ℚ {kappaO (1 : H ℚ)} :=
    hinv hI hImem (kappaO 1) (Submodule.mem_span_singleton_self _)
  rw [leftImDeriv_kappaO, mul_one] at hmem
  rw [Submodule.mem_span_singleton] at hmem
  obtain ⟨c, hc⟩ := hmem
  have hck : kappaO ((c : ℚ) • (1 : H ℚ)) = kappaO hI := by rw [map_smul]; exact hc
  have hcc := kappaO_injective hck
  have := congrArg (fun z : H ℚ => z.re.im) hcc
  simp [hI, CD.iota, Dbl.J, cd_qsmul_re, Dbl.smul_im] at this

end

end Phys.Algebra
