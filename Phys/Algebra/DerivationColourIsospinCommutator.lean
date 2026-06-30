/-
  Phys.Algebra.DerivationColourIsospinCommutator — N197 THE COMMUTATOR OF THE TWO
  DECOMPOSITIONS OF THE SAME 7: the colour complex structure `J = L_{u1}` (N42c) versus the
  isospin inner-derivation action (N187/N191), over the DERIVED ℚ and the octonion rung
  `O ℚ = CD (H ℚ)`.
  ===========================================================================
  THE HONEST PIVOT off the now-CLOSED 12-node gauge-representation arc (N184–N196). Those nodes
  pinned how EACH gauge factor acts on the `7` and decomposed it two ways: the COLOUR branching
  `7 = 3 ⊕ 3̄ ⊕ 1` under the complex structure `J = L_{u1}` (N42c `DerivationStabilizerSplit`,
  `JO z = u1·z`, `JO² = −id`, the singlet `⟨u1⟩`), and the ISOSPIN/so(4) bigrading
  `7 = (3,1) ⊕ (2,2)` under the inner derivations `innerDeriv` (N187/N191). NONE of them related
  the two gradings to each other. THIS node banks the genuinely-NEW RELATIONAL content: the
  commutator of the colour complex structure with the isospin action.

  THE STRUCTURAL PUNCHLINE (derived, not asserted):

  ── the two gradings are built on the SAME element ──
    `u1_eq_iotaO_hI` : `u1 = ιO hI`. The colour complex unit `u1` (the generator of `J = L_{u1}`,
    N42c) IS the octonion embedding of the isospin Cartan generator `hI = ι J` (N184). The colour
    complex structure and the isospin Cartan direction are the SAME element read two ways.

  ── the commutator is left-multiplication by the moved generator ──
    `commutator_innerDeriv_JO` : for imaginary `q`,
      `innerDeriv q (JO z) = (innerDeriv q u1)·z + JO (innerDeriv q z)`,
    i.e. `[innerDeriv q, JO] = L_{innerDeriv q (u1)}`. PURE Leibniz: `innerDeriv q` is a derivation
    (N6 `innerDeriv_isDeriv`) and `JO` is left-multiplication by `u1`; NO associativity, NO
    coordinate expansion. (`O ℚ` is non-associative and carries no `Sub`, so the commutator is
    stated in additive form — `D(JO z) = (D u1)·z + JO(D z)` — never as a subtraction.)
    `innerDeriv_u1` : `innerDeriv q u1 = ιO (adHom q hI)` — the obstruction to commuting is EXACTLY
    the isospin bracket `[q, hI]` embedded into `O ℚ`.

  ── the dichotomy: the colour structure is preserved exactly along the isospin Cartan ──
    `innerDeriv_u1_eq_zero_iff` : `innerDeriv q u1 = 0 ↔ q·hI = hI·q`. The isospin generator `q`
    PRESERVES the colour complex structure `J` if and only if `q` COMMUTES with the Cartan `hI`.
    `innerDeriv_hI_u1` : `innerDeriv hI u1 = 0` — the Cartan generator preserves `J`.
    `innerDeriv_hJ_u1` : `innerDeriv hJ u1 = ιO(−2•hK) ≠ 0` (`hK_ne_zero_witness`, W8) — the
    OFF-Cartan generator ROTATES `J`. Hence (`JO_isospin_not_commute`) the colour complex
    structure and the FULL isospin `su(2)` do NOT commute as operators; they intersect exactly
    along the isospin Cartan `u(1) = ⟨hI⟩`. This is the colour⊗isospin entanglement the
    division-algebra-physics field reads off by hand — here a derived theorem.

  THE MOAT (docs/STANDARD §0): the literature reads colour⊗isospin commutation off the embedding
  by hand. Here it is FORCED: the colour complex structure `J = L_{u1}` and the isospin action are
  built on the SAME doubling `O ℚ = CD (H ℚ)`, `u1 = ιO hI`, and the commutator is the
  derivation-vs-left-multiplication identity `[D, L_{u1}] = L_{D u1}` evaluated through the banked
  isospin bracket — ONE cause (the doubling), the two gradings related, the entanglement derived.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "colour / isospin / Cartan / complex
  structure / su(2) / gauge / 7 / singlet / entanglement": what remains is the theorem that, over
  the derived field ℚ and the Cayley–Dickson double `O ℚ = CD (H ℚ)`, the distinguished imaginary
  unit `u1 = ιO hI` satisfies, for every imaginary base generator `q`, the derivation identity
  `D_q(u1·z) = (D_q u1)·z + u1·(D_q z)` with `D_q u1 = ιO(q·hI − hI·q)`, which vanishes iff `q`
  commutes with `hI`, is `0` at `q = hI` and is `ιO(−2•hK) ≠ 0` at `q = hJ`. No theorem STATEMENT
  needs a physics word.

  Foundations-only: no posited `su(2)/so(4)/u(1)/Lie group/division-ring` as content, no Mathlib
  ℝ/ℂ as content (ℚ/ℤ are the coefficient systems the `Module.End`/`LinearMap` statements are
  WRITTEN IN — the N6/N42/N184–N196 precedent; the OBJECTS are the derived rungs `H ℚ`, `O ℚ`, the
  complex structure `JO`/`u1` N42c, the embedding `iotaO` N190, the inner derivation `innerDeriv`
  N6), no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationStabilizerSplit
import Phys.Algebra.DerivationRep7SU2TBranching
import Phys.Algebra.DerivationRep7FullBranching
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

/-! ## The two decompositions of the same `7` are built on the same element. -/

/-- ★ THE COLOUR COMPLEX UNIT IS THE EMBEDDED ISOSPIN CARTAN GENERATOR: `u1 = ιO hI`. The
    generator of the colour complex structure `J = L_{u1}` (N42c) is the octonion embedding of
    the isospin Cartan generator `hI = ι J` (N184). The two gradings of the same `7` rest on the
    SAME element read two ways. -/
theorem u1_eq_iotaO_hI : u1 = iotaO hI := by
  show (u1 : O ℚ) = ⟨hI, 0⟩
  ext <;> simp [u1, hI, CD.iota, Dbl.J]

/-! ## The commutator law: `[innerDeriv q, JO] = L_{innerDeriv q (u1)}`. -/

/-- ★★ THE COMMUTATOR LAW (additive form — `O ℚ` carries no `Sub`). For an imaginary base
    generator `q`, the isospin inner derivation and the colour complex structure satisfy
    `innerDeriv q (JO z) = (innerDeriv q u1)·z + JO (innerDeriv q z)`, i.e.
    `[innerDeriv q, JO] = L_{innerDeriv q (u1)}`. PURE Leibniz: `innerDeriv q` is a derivation of
    `O ℚ` (N6 `innerDeriv_isDeriv`) and `JO` is left-multiplication by `u1`; no associativity, no
    coordinate expansion is used. -/
theorem commutator_innerDeriv_JO (q : H ℚ) (hq : star q = -q) (z : O ℚ) :
    (innerDeriv q) (JO z) = (innerDeriv q) u1 * z + JO ((innerDeriv q) z) := by
  have hd : (innerDeriv q) (u1 * z) = (innerDeriv q) u1 * z + u1 * (innerDeriv q) z :=
    innerDeriv_isDeriv q hq u1 z
  simpa only [JO_apply] using hd

/-- ★ THE COMMUTATOR GENERATOR: `innerDeriv q u1 = ιO (adHom q hI)`. The obstruction to the
    isospin generator commuting with the colour complex structure is EXACTLY the isospin bracket
    `[q, hI] = q·hI − hI·q` embedded into `O ℚ`. -/
theorem innerDeriv_u1 (q : H ℚ) : (innerDeriv q) u1 = iotaO (adHom q hI) := by
  rw [u1_eq_iotaO_hI, innerDeriv_iotaO]

/-! ## The dichotomy: the colour structure is preserved exactly along the isospin Cartan. -/

/-- ★★ THE CARTAN CHARACTERIZATION: the isospin generator `q` PRESERVES the colour complex
    structure `J` (`innerDeriv q u1 = 0`) IF AND ONLY IF `q` COMMUTES with the Cartan generator
    `hI` (`q·hI = hI·q`). The colour structure and the isospin action commute precisely on the
    centralizer of `hI` — the isospin Cartan `u(1) = ⟨hI⟩`. -/
theorem innerDeriv_u1_eq_zero_iff (q : H ℚ) :
    (innerDeriv q) u1 = 0 ↔ q * hI = hI * q := by
  rw [innerDeriv_u1]
  constructor
  · intro h
    have hz : adHom q hI = 0 :=
      iotaO_injective (a₁ := adHom q hI) (a₂ := 0) (by rw [h]; ext <;> simp [iotaO])
    rw [adHom_apply, sub_eq_zero] at hz
    exact hz
  · intro h
    have : adHom q hI = 0 := by rw [adHom_apply, h, sub_self]
    rw [this]; ext <;> simp [iotaO]

/-- ★ THE CARTAN PRESERVES `J`: `innerDeriv hI u1 = 0`. The isospin Cartan generator `hI` itself
    commutes with the colour complex structure (it commutes with itself). -/
theorem innerDeriv_hI_u1 : (innerDeriv hI) u1 = 0 := by
  rw [innerDeriv_u1, adHom_apply, sub_self]
  ext <;> simp [iotaO]

/-- ★★ THE OFF-CARTAN GENERATOR ROTATES `J`: `innerDeriv hJ u1 = ιO(−2•hK)`. The isospin
    generator `hJ` (off the Cartan) does NOT preserve the colour complex structure — its
    commutator with `J` is left-multiplication by `ιO(−2•hK) ≠ 0`. -/
theorem innerDeriv_hJ_u1 : (innerDeriv hJ) u1 = iotaO (-(2 : ℚ) • hK) := by
  rw [innerDeriv_u1, adHom_apply, hJ_hI]
  congr 1
  show -hK - hI * hJ = -(2 : ℚ) • hK
  rw [show hI * hJ = hK from rfl]; module

/-- ★ W8 NON-VACUITY: `hK ≠ 0`. The entanglement witness `innerDeriv hJ u1 = ιO(−2•hK)` is
    genuinely nonzero — the off-Cartan rotation of `J` is not a vacuous `0`. -/
theorem hK_ne_zero_witness : hK ≠ (0 : H ℚ) := by
  intro h
  have h1 : (1 : ℚ) = 0 := by
    have := congrArg (fun w : H ℚ => w.im.im) h
    simpa [hK, hI, hJ, CD.iota, CD.e2, Dbl.J, CD.mul_im] using this
  exact one_ne_zero h1

/-- ★★ THE COLOUR STRUCTURE AND THE FULL ISOSPIN `su(2)` DO NOT COMMUTE. There is an isospin
    generator (`hJ`, off the Cartan) whose inner derivation fails to commute with the colour
    complex structure `J` (its commutator is `L_{ιO(−2•hK)}` with `ιO(−2•hK) ≠ 0`). The two
    gradings of the `7` are genuinely entangled — they commute only along the isospin Cartan
    `⟨hI⟩`, not on all of `su(2)`. -/
theorem JO_isospin_not_commute : (innerDeriv hJ) u1 ≠ 0 := by
  rw [innerDeriv_hJ_u1]
  intro h
  have h2 : (-(2 : ℚ) • hK) = 0 :=
    iotaO_injective (a₁ := -(2 : ℚ) • hK) (a₂ := 0) (by rw [h]; ext <;> simp [iotaO])
  have : hK = (0 : H ℚ) := by
    have := smul_eq_zero.mp h2
    rcases this with h3 | h3
    · norm_num at h3
    · exact h3
  exact hK_ne_zero_witness this

end Phys.Algebra
