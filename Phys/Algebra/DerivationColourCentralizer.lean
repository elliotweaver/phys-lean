/-
  Phys.Algebra.DerivationColourCentralizer — N201 THE COLOUR su(3) IS THE CENTRALIZER OF
  THE COLOUR COMPLEX STRUCTURE `J = L_{u1}` INSIDE `g₂ = Der(O ℚ)`, over the DERIVED ℚ and
  the octonion rung `O ℚ = CD (H ℚ)`.
  ===========================================================================
  THE CONNECTION between two banked-but-unrelated colour facts. N42a/N42b built the COLOUR
  STABILIZER `stabLieQ = {D ∈ Der(𝕆) : D u1 = 0}` as a Lie subalgebra of `g₂`, dimension `8`
  (`finrank_stabLieQ`, N42b) — the `su(3)` value, derived as a MODULE stabilizer (the set of
  derivations annihilating the distinguished square-root-of-`−1` `u1`). N42c built the COLOUR
  COMPLEX STRUCTURE `J = L_{u1}` (`JO z = u1·z`, `JO² = −id`, `DerivationStabilizerSplit`) and
  decomposed the `7` as `3 ⊕ 3̄ ⊕ 1` under it. NEITHER node related the two: is the dim-8
  stabilizer the same thing as the OPERATOR CENTRALIZER of `J` — the set of derivations that
  COMMUTE with the colour complex structure as endomorphisms? THIS node proves it: yes, exactly.

  THE STRUCTURAL PUNCHLINE (derived, not asserted):

  ── the commutator with the complex structure is left-multiplication by the moved unit ──
    `comm_deriv_JO` : for ANY ℚ-linear Leibniz derivation `D` of `O ℚ`,
      `D (JO z) = (D u1)·z + JO (D z)`,  i.e.  `[D, JO] = L_{D u1}`.
    PURE Leibniz: `D` is a derivation and `JO` is left-multiplication by `u1`; NO associativity,
    NO coordinate expansion. (`O ℚ` is non-associative and carries no `Sub`, so this is stated in
    additive form — `D(JO z) = (D u1)·z + JO(D z)` — never as a subtraction.)

  ── commuting with the complex structure ⟺ annihilating its generator ──
    `commutes_JO_iff` : for a Leibniz derivation `D`, `D ∘ JO = JO ∘ D ↔ D u1 = 0`. (The forward
    direction evaluates at `1`: `D(JO 1) = JO(D 1)`, with `JO 1 = u1` and `D 1 = 0` (`derivQ_one`)
    giving `D u1 = JO 0 = 0`. The reverse direction is `comm_deriv_JO` with `D u1 = 0`.)

  ── the headline: the centralizer of `J` IS the colour stabilizer su(3) ──
    `colourCentralizer` : the operator centralizer `{D ∈ g₂ : D ∘ JO = JO ∘ D}` as a Lie
    subalgebra of `derivationLieQ` (the centralizer of a fixed operator is always a Lie
    subalgebra: a pure composition-algebra closure, `comm_bracket`).
    `colourCentralizer_eq_stab` : `colourCentralizer = stabLieQ`. The two descriptions of `su(3)`
    coincide — the symmetry preserving the colour complex structure `J` is exactly the symmetry
    fixing its generator `u1`.
    `finrank_colourCentralizer_eq_eight` : `dim colourCentralizer = 8` (transport of N42b).
    `colourCentralizer_ne_bot` / `colourCentralizer_ne_top` (W8) : `0 ⊊ su(3) ⊊ g₂` as a
    centralizer — some derivation commutes with `J` (the dim is genuinely positive) and some does
    NOT (`J` is not central in `g₂`; the colour structure is a PROPER reduction of `g₂`).

  THE MOAT (docs/STANDARD §0): the division-algebra-physics field reads "`SU(3) ⊂ G₂` preserves a
  complex structure on the imaginary octonions" off by hand. Here it is FORCED and made precise: the
  complex structure `J = L_{u1}` and the stabilizer `su(3)` are built on the SAME element `u1` (the
  cascade's distinguished square-root of `−1`), and the centralizer-equals-stabilizer identity is the
  derivation-vs-left-multiplication law `[D, L_{u1}] = L_{D u1}` — ONE cause (the element `u1`), the
  two banked colour descriptions related, the Lie-theoretic content (centralizer) of the module
  content (stabilizer) derived. NOT a re-pin of N42a/N42b (which built the stabilizer as a module
  object and counted its dimension; the OPERATOR-centralizer description and its EQUALITY to the
  stabilizer were never banked), NOT N197 (which gave `[innerDeriv q, JO]` only for the ISOSPIN
  innerDeriv family — here the law holds for EVERY derivation of `g₂`, and the centralizer=stabilizer
  identification is genuinely new), NOT N191 (which measured the centralizer of the ISOSPIN su(2) and
  found it vacuous — this is the centralizer of the COLOUR complex structure `J`, a different
  operator with a non-vacuous dim-8 answer), NOT a juxtaposition.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "colour / su(3) / g₂ / complex structure /
  gauge / SU(3) / G₂ / J": what remains is the theorem that, over the derived field ℚ and the
  Cayley–Dickson double `O ℚ = CD (H ℚ)`, for left-multiplication `JO` by the fixed
  square-root-of-`−1` `u1`, the Leibniz-derivations `D` commuting with `JO` (`D ∘ JO = JO ∘ D`)
  are exactly those annihilating `u1` (`D u1 = 0`); this set is a Lie subalgebra of the 14-dim
  derivation algebra, of dimension `8`, and it is proper (some derivation does not commute with
  `JO`). No theorem STATEMENT needs a physics word.

  Foundations-only: no posited `su(3)/SU(3)/G₂/Lie group/complex-structure` as content, no Mathlib
  ℝ/ℂ as content (ℚ is the coefficient field the `Module.End`/`finrank` statements are WRITTEN IN —
  the N6/N42/N197 precedent; the OBJECTS are the derived rung `O ℚ`, the derivation Lie algebra
  `derivationLieQ` N16–N21, the complex structure `JO`/`u1` N42c, the stabilizer `stabLieQ` N42a),
  no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationColourIsospinCommutator
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- ★★ THE COMMUTATOR WITH THE COLOUR COMPLEX STRUCTURE IS LEFT-MULTIPLICATION BY THE MOVED
    GENERATOR (additive form — `O ℚ` carries no `Sub`). For ANY ℚ-linear Leibniz derivation `D`
    of the octonion rung, `D (JO z) = (D u1)·z + JO (D z)`, i.e. `[D, JO] = L_{D u1}`. PURE
    Leibniz: `D` is a derivation and `JO` is left-multiplication by `u1`; no associativity, no
    coordinate expansion. -/
theorem comm_deriv_JO {D : Module.End ℚ (O ℚ)} (hD : IsDerivQ D) (z : O ℚ) :
    D (JO z) = D u1 * z + JO (D z) := by
  have hd : D (u1 * z) = D u1 * z + u1 * D z := hD u1 z
  simpa only [JO_apply] using hd

/-- ★★ COMMUTING WITH THE COLOUR COMPLEX STRUCTURE ⟺ ANNIHILATING ITS GENERATOR. For a Leibniz
    derivation `D` of `O ℚ`, `D ∘ JO = JO ∘ D ↔ D u1 = 0`. Forward: evaluate at `1` — `D(JO 1) =
    JO(D 1)`, with `JO 1 = u1` and `D 1 = 0` (`derivQ_one`), giving `D u1 = JO 0 = 0`. Reverse:
    `comm_deriv_JO` with `D u1 = 0`. -/
theorem commutes_JO_iff {D : Module.End ℚ (O ℚ)} (hD : IsDerivQ D) :
    D.comp JO = JO.comp D ↔ D u1 = 0 := by
  constructor
  · intro h
    have he : (D.comp JO) 1 = (JO.comp D) 1 := by rw [h]
    simp only [LinearMap.comp_apply] at he
    rw [JO_apply] at he
    have hj1 : (u1 * 1 : O ℚ) = u1 := by simp
    rw [hj1, derivQ_one D hD, map_zero] at he
    exact he
  · intro h
    refine LinearMap.ext fun z => ?_
    simp only [LinearMap.comp_apply]
    rw [comm_deriv_JO hD z, h, zero_mul, zero_add, JO_apply]

/-- A member of `derivationLieQ = g₂` satisfies the Leibniz law `IsDerivQ`. -/
theorem isDerivQ_of_mem (D : derivationLieQ) : IsDerivQ (D : Module.End ℚ (O ℚ)) := D.2

/-- The centralizer of a fixed operator is closed under the commutator (operator-level): if
    `dD` and `dE` both commute with `JO`, so does `dD * dE − dE * dD`. Pure composition algebra,
    no derivation property needed here. -/
theorem comm_bracket {dD dE : Module.End ℚ (O ℚ)}
    (hD : dD.comp JO = JO.comp dD) (hE : dE.comp JO = JO.comp dE) :
    (dD * dE - dE * dD).comp JO = JO.comp (dD * dE - dE * dD) := by
  have e1 : (dD * dE).comp JO = JO.comp (dD * dE) := by
    rw [Module.End.mul_eq_comp, LinearMap.comp_assoc, hE, ← LinearMap.comp_assoc, hD,
        LinearMap.comp_assoc, ← Module.End.mul_eq_comp]
  have e2 : (dE * dD).comp JO = JO.comp (dE * dD) := by
    rw [Module.End.mul_eq_comp, LinearMap.comp_assoc, hD, ← LinearMap.comp_assoc, hE,
        LinearMap.comp_assoc, ← Module.End.mul_eq_comp]
  rw [LinearMap.sub_comp, LinearMap.comp_sub, e1, e2]

/-- ★★ THE COLOUR CENTRALIZER: `{D ∈ g₂ : D ∘ JO = JO ∘ D}`, the set of derivations of the
    octonion rung that COMMUTE with the colour complex structure `J = L_{u1}`, as a Lie
    subalgebra of `derivationLieQ`. The submodule conditions are linearity of composition; the
    Lie closure is `comm_bracket` (the centralizer of a fixed operator is always a Lie
    subalgebra). -/
def colourCentralizer : LieSubalgebra ℚ derivationLieQ where
  carrier := { D | (D : Module.End ℚ (O ℚ)).comp JO = JO.comp (D : Module.End ℚ (O ℚ)) }
  add_mem' := by
    intro D E hD hE
    simp only [Set.mem_setOf_eq] at *
    show ((D + E : derivationLieQ) : Module.End ℚ (O ℚ)).comp JO
        = JO.comp ((D + E : derivationLieQ) : Module.End ℚ (O ℚ))
    rw [AddSubmonoid.coe_add, LinearMap.comp_add, LinearMap.add_comp, hD, hE]
  zero_mem' := by
    show ((0 : derivationLieQ) : Module.End ℚ (O ℚ)).comp JO
        = JO.comp ((0 : derivationLieQ) : Module.End ℚ (O ℚ))
    simp
  smul_mem' := by
    intro c D hD
    simp only [Set.mem_setOf_eq] at *
    show ((c • D : derivationLieQ) : Module.End ℚ (O ℚ)).comp JO
        = JO.comp ((c • D : derivationLieQ) : Module.End ℚ (O ℚ))
    rw [SetLike.val_smul, LinearMap.comp_smul, LinearMap.smul_comp, hD]
  lie_mem' := by
    intro D E hD hE
    simp only [Set.mem_setOf_eq] at *
    show ((⁅D, E⁆ : derivationLieQ) : Module.End ℚ (O ℚ)).comp JO
        = JO.comp ((⁅D, E⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
    have hbr : ((⁅D, E⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
        = (D : Module.End ℚ (O ℚ)) * (E : Module.End ℚ (O ℚ))
          - (E : Module.End ℚ (O ℚ)) * (D : Module.End ℚ (O ℚ)) := rfl
    rw [hbr]
    exact comm_bracket hD hE

@[simp] theorem mem_colourCentralizer {D : derivationLieQ} :
    D ∈ colourCentralizer ↔
      (D : Module.End ℚ (O ℚ)).comp JO = JO.comp (D : Module.End ℚ (O ℚ)) := Iff.rfl

/-- ★★ THE HEADLINE: the centralizer of the colour complex structure equals the colour
    stabilizer `su(3)`. The operator-level symmetry (`D ∘ JO = JO ∘ D`, preserving the complex
    structure) and the module-level symmetry (`D u1 = 0`, fixing its generator) coincide — via
    `commutes_JO_iff`. -/
theorem colourCentralizer_eq_stab : colourCentralizer = stabLieQ := by
  ext D
  rw [mem_colourCentralizer, mem_stabLieQ]
  exact commutes_JO_iff (isDerivQ_of_mem D)

/-- The centralizer submodule equals the stabilizer submodule (the dimension hook). -/
theorem colourCentralizer_toSubmodule_eq :
    colourCentralizer.toSubmodule = stabLieQ.toSubmodule := by
  rw [colourCentralizer_eq_stab]

/-- ★★ THE DIMENSION OF THE COLOUR CENTRALIZER IS `8`. The operator centralizer of the colour
    complex structure inside the 14-dim derivation Lie algebra is exactly 8-dimensional — the
    `su(3)` value, now carried by the centralizer description (transported from N42b's
    `finrank_stabLieQ`). -/
theorem finrank_colourCentralizer_eq_eight :
    Module.finrank ℚ colourCentralizer.toSubmodule = 8 := by
  rw [colourCentralizer_toSubmodule_eq, finrank_stabLieQ]

/-- ★ W8 NON-VACUITY (lower): the colour centralizer is NONTRIVIAL — some nonzero derivation
    commutes with the colour complex structure. -/
theorem colourCentralizer_ne_bot : colourCentralizer ≠ ⊥ := by
  rw [colourCentralizer_eq_stab]; exact stabLieQ_ne_bot

/-- ★★ W8 NON-VACUITY (upper): the colour centralizer is PROPER — some derivation does NOT
    commute with the colour complex structure (`J` is not central in `g₂`; the colour structure
    is a genuine reduction `su(3) ⊊ g₂`, not the whole algebra). -/
theorem colourCentralizer_ne_top : colourCentralizer ≠ ⊤ := by
  rw [colourCentralizer_eq_stab]; exact stabLieQ_ne_top

end Phys.Algebra
