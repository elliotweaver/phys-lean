/-
  Phys.Algebra.DerivationHIntoO — N187: THE WEAK-ISOSPIN DERIVATION ALGEBRA EMBEDS INTO
  THE COLOUR-HOSTING DERIVATION ALGEBRA — `Der(H ℚ) = su(2) ↪ Der(O ℚ) = g₂`, the Lie
  embedding INDUCED BY THE CAYLEY–DICKSON DOUBLING `H ℚ ↪ O ℚ = CD (H ℚ)`.
  ===========================================================================
  THE FIRST PROVED CONNECTION BETWEEN TWO BANKED GAUGE-ALGEBRA FACTORS. The Standard-Model
  gauge group `SU(3) × SU(2) × U(1)` now has all three factors banked INDIVIDUALLY: colour
  `SU(3) ⊂ G₂ = Der(O)` (N42/N20, dim 14), weak-isospin `SU(2) = Der(H)` (N184 bracket
  `⁅ad_i,ad_j⁆ = 2·ad_k` + N185 dim 3), hypercharge `U(1) = so(2)` (N186, dim 1). Three
  ISLANDS. THIS node banks the first RELATION between them: the weak-isospin algebra `Der(H ℚ)`
  is NOT a separate island — it sits INSIDE the colour-hosting `Der(O ℚ) = g₂` as a Lie
  subalgebra, and the inclusion is the cascade's OWN doubling `H ℚ ↪ O ℚ = CD (H ℚ)`.

  ★ THE MECHANISM — the banked doubling lift IS the embedding (docs/RUNBOOK W2 import-and-USE,
  W9.4 structure-over-coordinate-expansion). N6 built the componentwise lift `liftEnd` and the
  inner derivation `innerDeriv q = liftEnd (adHom q)`, with `innerDeriv_isDeriv`: for IMAGINARY
  `q` (`star q = −q`), `innerDeriv q` is a genuine Leibniz-derivation of `O ℚ = CD (H ℚ)` —
  i.e. it LANDS in `Der(O ℚ) = g₂`. This module proves the lift is a LIE-ALGEBRA HOMOMORPHISM
  from the inner derivations of `H ℚ` (the weak-isospin su(2)) into `Der(O ℚ)`:

      ★★ innerDeriv_bracket : ⁅innerDeriv p, innerDeriv q⁆ = innerDeriv (p·q − q·p).

  THE STRUCTURAL ROUTE (no `O`-coordinate expansion). The lift is additive (`liftEnd_add`) and
  carries composition to End-multiplication (`liftEnd_mul`), so the bracket of two lifted inner
  derivations reduces to the lift of the BASE End-commutator `ad_p∘ad_q − ad_q∘ad_p`, which on
  the ASSOCIATIVE quaternion ring `H ℚ` equals `ad_(p·q − q·p)` (`adHom_comp_comm`, the same
  inner-derivation Lie-hom that N184's `adM_bracket` exhibits on `H`). NO associator, NO
  16- or 64-coordinate normalizer — the doubling identities do all the work.

  WHAT THE EMBEDDING TRANSFERS (the su(2) ≅ so(3) structure constants now realized in g₂):
      ★★ struct_ij : ⁅innerDeriv hI, innerDeriv hJ⁆ = 2·innerDeriv hK   (and cyclic jk, ki)
  exactly the N184 weak-isospin brackets `⁅ad_i,ad_j⁆ = 2·ad_k`, now living inside `Der(O) = g₂`.
  And the embedding is FAITHFUL on the inner derivations: `innerDeriv q = 0 ↔ ad_q = 0`
  (`innerDeriv_eq_zero_iff_adHom`, via `liftEnd_injective`), so a NONZERO inner derivation of
  `H ℚ` maps to a NONZERO derivation of `O ℚ` — the three units `hI, hJ, hK` give genuinely
  nonzero, non-abelian generators inside g₂ (`innerDeriv_hI/J/K_ne_zero`, `struct_ij_ne_zero`).

  THE MOAT — posit-vs-derive (docs/STANDARD §0, the UNBROKEN-STRAND novelty). The
  division-algebra-physics field (Furey, Dixon, Günaydin–Gürsey) POSITS the algebras as
  disconnected islands and reads each gauge factor off by hand. Here `su(2) ⊂ g₂` is DERIVED
  from the ONE doubling that also STOPS the cascade at the octonions (N2c): the SAME Cayley–
  Dickson step `H ↦ CD H = O` that forces the terminal algebra also NESTS the weak-isospin
  derivations inside the colour-hosting derivations. One cause, the connection between two
  physical structures — NOT a juxtaposition of two banked facts, but a proved bracket-preserving
  inclusion. NO posited su(2)/g₂/SU(2)/Lie-group map, NO Mathlib ℝ/ℂ as content (ℚ/ℤ are the
  coefficient systems the `Module.End` statements are written in; the OBJECTS are the derived
  rungs `H ℚ = CD (Dbl ℚ)`, `O ℚ = CD (H ℚ)`).

  THE CONTENT (each step a theorem, foundations-only):
    liftEnd_add / liftEnd_sub  — the doubling lift respects `+` and `−`.
    liftEnd_mul                — ★ the lift carries composition to End-multiplication
                                 (`liftEnd δ * liftEnd ε = liftEnd (δ.comp ε)`).
    liftEnd_injective          — ★ the lift is INJECTIVE (faithful).
    adHom_addCD                — `ad` is additive in the generator.
    adHom_comp_comm            — ★ the base End-commutator on the ASSOCIATIVE `CD B`:
                                 `ad_p∘ad_q − ad_q∘ad_p = ad_(p·q − q·p)`.
    innerDeriv_bracket         — ★★ THE LIE-HOM: `⁅innerDeriv p, innerDeriv q⁆ = innerDeriv (p·q − q·p)`.
    innerDeriv_addCD / innerDeriv_two_zsmul — `innerDeriv` additive / 2-scaling in the generator.
    innerDeriv_eq_zero_iff_adHom — ★ faithfulness on inner derivations.
    hI_imag / hJ_imag / hK_imag — the three quaternion units are imaginary.
    innerDeriv_hI/J/K_isDerivO — ★ the lifted units LAND in `Der(O ℚ) = g₂`.
    innerDeriv_hI/J/K_mem_derivation — membership in the banked `derivation (B := Dbl ℚ)`.
    struct_ij / struct_jk / struct_ki — ★★ the su(2) STRUCTURE CONSTANTS transferred into g₂.
    innerDeriv_hK_ne_zero / struct_ij_ne_zero — ★★ W8 NON-VACUITY: the embedded su(2) is a
                                 genuine NON-ABELIAN copy inside g₂, not the zero map.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "isospin / colour / weak / gauge / su(2) /
  g₂ / SU(2) / SU(3)": what remains is the pure statement that the componentwise doubling lift
  `End(CD B) ← (CD B →+ CD B)` is an injective, bracket-preserving map carrying the inner-
  derivation commutator algebra of the associative ring `CD B` (with `⁅ad_i,ad_j⁆ = 2·ad_k`)
  into the Leibniz-derivation Lie algebra of `CD (CD B)`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationDblPhase
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The doubling lift `liftEnd` (N6) as a Lie-algebra homomorphism on the base End-ring.

    These hold over any commutative `*`-base `B`; the cascade applies them at `B := Dbl ℚ`,
    where `CD B = H ℚ` is the associative quaternion rung and `CD (CD B) = O ℚ` is the
    terminal octonion rung. -/
section General
variable {B : Type*} [CommRing B] [StarRing B]

/-- The doubling lift respects addition. -/
theorem liftEnd_add (δ ε : CD B →+ CD B) : liftEnd (δ + ε) = liftEnd δ + liftEnd ε := by
  refine LinearMap.ext fun z => ?_
  ext <;> simp [liftEnd_apply]

/-- The doubling lift respects subtraction. -/
theorem liftEnd_sub (δ ε : CD B →+ CD B) : liftEnd δ - liftEnd ε = liftEnd (δ - ε) := by
  refine LinearMap.ext fun z => ?_
  simp only [LinearMap.sub_apply, liftEnd_apply, AddMonoidHom.sub_apply]
  ext <;> simp [sub_eq_add_neg, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im]

/-- ★ THE LIFT CARRIES COMPOSITION TO End-MULTIPLICATION: `liftEnd δ * liftEnd ε = liftEnd (δ ∘ ε)`.
    Composition acts componentwise on `.re`/`.im`, so the lift is multiplicative — the key step
    that makes the bracket transfer. -/
theorem liftEnd_mul (δ ε : CD B →+ CD B) :
    (liftEnd δ) * (liftEnd ε) = liftEnd (δ.comp ε) := by
  refine LinearMap.ext fun z => ?_
  show liftEnd δ (liftEnd ε z) = liftEnd (δ.comp ε) z
  ext <;> simp [liftEnd_apply]

/-- ★ THE LIFT IS INJECTIVE (faithful): reading the `.re`-component at `iota a` recovers `δ a`. -/
theorem liftEnd_injective :
    Function.Injective (liftEnd : (CD B →+ CD B) → Module.End ℤ (CD (CD B))) := by
  intro δ ε h
  refine AddMonoidHom.ext fun a => ?_
  have := congrArg (fun (f : Module.End ℤ (CD (CD B))) => (f (iota a)).re) h
  simpa [liftEnd_apply, CD.iota] using this

/-- `ad` is additive in the generator (on the base `CD B`). -/
theorem adHom_addCD (p q : CD B) : adHom (p + q) = adHom p + adHom q := by
  refine AddMonoidHom.ext fun x => ?_
  simp only [adHom_apply, AddMonoidHom.add_apply, add_mul, mul_add]; abel

/-- ★ THE BASE End-COMMUTATOR on the ASSOCIATIVE `CD B`: the commutator of the two inner maps
    `ad_p`, `ad_q` (as additive endomorphisms) is the inner map of the algebra commutator
    `p·q − q·p`. This is the inner-derivation Lie-hom on the associative rung — exactly the
    fact N184's `adM_bracket` exhibits on `H`, here at the `AddMonoidHom` level so it feeds the
    doubling lift. The proof is `noncomm_ring` on the associative `CD B`; no associator. -/
theorem adHom_comp_comm (p q : CD B) :
    (adHom p).comp (adHom q) - (adHom q).comp (adHom p) = adHom (p * q - q * p) := by
  refine AddMonoidHom.ext fun x => ?_
  simp only [AddMonoidHom.sub_apply, AddMonoidHom.comp_apply, adHom_apply]
  noncomm_ring

/-- ★★ THE LIE-HOM. The bracket of two lifted inner derivations is the lifted inner derivation of
    the base commutator: `⁅innerDeriv p, innerDeriv q⁆ = innerDeriv (p·q − q·p)`. By
    `liftEnd_mul` (composition → End-mult) the End-bracket of the lifts is the lift of the base
    End-commutator, which `adHom_comp_comm` identifies as `ad_(p·q − q·p)`. NO `O`-coordinate
    expansion — the doubling identities reduce everything to the associative base. -/
theorem innerDeriv_bracket (p q : CD B) :
    ⁅innerDeriv p, innerDeriv q⁆ = innerDeriv (p * q - q * p) := by
  show innerDeriv p * innerDeriv q - innerDeriv q * innerDeriv p = innerDeriv (p * q - q * p)
  unfold innerDeriv
  rw [liftEnd_mul, liftEnd_mul, liftEnd_sub, adHom_comp_comm]

/-- `innerDeriv` is additive in the generator. -/
theorem innerDeriv_addCD (p q : CD B) : innerDeriv (p + q) = innerDeriv p + innerDeriv q := by
  unfold innerDeriv; rw [adHom_addCD, liftEnd_add]

/-- `innerDeriv` carries `2·q` to `2·innerDeriv q` (the structure-constant scaling). -/
theorem innerDeriv_two_zsmul (q : CD B) :
    innerDeriv ((2 : ℤ) • q) = (2 : ℤ) • innerDeriv q := by
  rw [two_zsmul, two_zsmul, innerDeriv_addCD]

/-- ★ FAITHFULNESS on inner derivations: `innerDeriv q = 0 ↔ ad_q = 0`. The lift is injective,
    so the lifted inner derivation vanishes exactly when the base inner derivation does. -/
theorem innerDeriv_eq_zero_iff_adHom (q : CD B) : innerDeriv q = 0 ↔ adHom q = 0 := by
  constructor
  · intro h
    have h2 : liftEnd (adHom q) = liftEnd (0 : CD B →+ CD B) := by
      show innerDeriv q = liftEnd 0
      rw [h]; symm
      refine LinearMap.ext fun z => ?_; ext <;> simp [liftEnd_apply]
    exact liftEnd_injective h2
  · intro h; unfold innerDeriv; rw [h]
    refine LinearMap.ext fun z => ?_; ext <;> simp [liftEnd_apply]

end General

/-! ## THE EMBEDDING AT THE CASCADE'S RUNGS: `Der(H ℚ) = su(2) ↪ Der(O ℚ) = g₂`.

    `B := Dbl ℚ`, so `CD B = H ℚ` (associative quaternions) and `CD (CD B) = O ℚ` (octonions).
    The three quaternion units `hI, hJ, hK` (N184) are imaginary, so their inner derivations
    lift into the banked octonion derivation Lie algebra `derivation (B := Dbl ℚ) = Der(O ℚ)`. -/
section Cascade

/-- `hI = ιJ` is imaginary (`star (ιJ) = −ιJ`, since `star J = −J`). -/
theorem hI_imag : star (hI : H ℚ) = -hI := by
  unfold hI; ext <;> simp [CD.iota, Dbl.J]

/-- `hJ = e₂` is imaginary (N6 `e2_imag_H`). -/
theorem hJ_imag : star (hJ : H ℚ) = -hJ := e2_imag_H

/-- `hK = i·j = ⟨0, J⟩` is imaginary. -/
theorem hK_imag : star (hK : H ℚ) = -hK := by
  rw [hK_def]; ext <;> simp [Dbl.J]

/-- ★ `innerDeriv hI` LANDS in `Der(O ℚ) = g₂` — it is a genuine Leibniz-derivation of `O ℚ`. -/
theorem innerDeriv_hI_isDerivO : IsDeriv (innerDeriv (hI : H ℚ)) :=
  innerDeriv_isDeriv hI hI_imag
/-- ★ `innerDeriv hJ` LANDS in `Der(O ℚ) = g₂`. -/
theorem innerDeriv_hJ_isDerivO : IsDeriv (innerDeriv (hJ : H ℚ)) :=
  innerDeriv_isDeriv hJ hJ_imag
/-- ★ `innerDeriv hK` LANDS in `Der(O ℚ) = g₂`. -/
theorem innerDeriv_hK_isDerivO : IsDeriv (innerDeriv (hK : H ℚ)) :=
  innerDeriv_isDeriv hK hK_imag

/-- Membership in the banked octonion derivation Lie algebra `derivation (B := Dbl ℚ)`. -/
theorem innerDeriv_hI_mem : innerDeriv (hI : H ℚ) ∈ derivation (B := Dbl ℚ) :=
  innerDeriv_hI_isDerivO
theorem innerDeriv_hJ_mem : innerDeriv (hJ : H ℚ) ∈ derivation (B := Dbl ℚ) :=
  innerDeriv_hJ_isDerivO
theorem innerDeriv_hK_mem : innerDeriv (hK : H ℚ) ∈ derivation (B := Dbl ℚ) :=
  innerDeriv_hK_isDerivO

/-- ★★ THE su(2) ≅ so(3) STRUCTURE CONSTANT, TRANSFERRED INTO g₂:
    `⁅innerDeriv hI, innerDeriv hJ⁆ = 2·innerDeriv hK`. The N184 weak-isospin bracket
    `⁅ad_i,ad_j⁆ = 2·ad_k`, now realized inside the colour-hosting `Der(O ℚ) = g₂`. -/
theorem struct_ij : ⁅innerDeriv (hI : H ℚ), innerDeriv hJ⁆ = (2 : ℤ) • innerDeriv hK := by
  rw [innerDeriv_bracket,
    show (hI : H ℚ) * hJ - hJ * hI = (2 : ℤ) • hK by
      rw [hI_hJ, hJ_hI, sub_neg_eq_add, two_zsmul]]
  exact innerDeriv_two_zsmul hK

/-- ★★ cyclic: `⁅innerDeriv hJ, innerDeriv hK⁆ = 2·innerDeriv hI`. -/
theorem struct_jk : ⁅innerDeriv (hJ : H ℚ), innerDeriv hK⁆ = (2 : ℤ) • innerDeriv hI := by
  rw [innerDeriv_bracket,
    show (hJ : H ℚ) * hK - hK * hJ = (2 : ℤ) • hI by
      rw [hJ_hK, hK_hJ, sub_neg_eq_add, two_zsmul]]
  exact innerDeriv_two_zsmul hI

/-- ★★ cyclic: `⁅innerDeriv hK, innerDeriv hI⁆ = 2·innerDeriv hJ`. -/
theorem struct_ki : ⁅innerDeriv (hK : H ℚ), innerDeriv hI⁆ = (2 : ℤ) • innerDeriv hJ := by
  rw [innerDeriv_bracket,
    show (hK : H ℚ) * hI - hI * hK = (2 : ℤ) • hJ by
      rw [hK_hI, hI_hK, sub_neg_eq_add, two_zsmul]]
  exact innerDeriv_two_zsmul hJ

/-! ## W8 — non-vacuity: the embedded su(2) is a genuine NON-ABELIAN copy inside g₂. -/

/-- ★★ W8: `innerDeriv hK ≠ 0` — the embedded generator is genuinely nonzero. By faithfulness
    it suffices that `ad_{hK} ≠ 0`, and `ad_{hK}(hI) = hK·hI − hI·hK = hJ − (−hJ) = 2j ≠ 0`. -/
theorem innerDeriv_hK_ne_zero : innerDeriv (hK : H ℚ) ≠ 0 := by
  intro h
  have hz : adHom (hK : H ℚ) = 0 := (innerDeriv_eq_zero_iff_adHom hK).mp h
  have hki : adHom (hK : H ℚ) hI = 0 := by rw [hz]; rfl
  rw [adHom_apply, hK_hI, hI_hK, sub_neg_eq_add] at hki
  have := congrArg (fun z : H ℚ => z.im.re) hki
  simp [hJ, CD.e2] at this

/-- ★★ W8: `innerDeriv hI ≠ 0`. By faithfulness, `ad_{hI}(hJ) = hI·hJ − hJ·hI = hK − (−hK) = 2k`,
    whose `im.im`-coordinate is `2 ≠ 0`. -/
theorem innerDeriv_hI_ne_zero : innerDeriv (hI : H ℚ) ≠ 0 := by
  intro h
  have hz : adHom (hI : H ℚ) = 0 := (innerDeriv_eq_zero_iff_adHom hI).mp h
  have hij : adHom (hI : H ℚ) hJ = 0 := by rw [hz]; rfl
  rw [adHom_apply, hI_hJ, hJ_hI, sub_neg_eq_add] at hij
  have := congrArg (fun z : H ℚ => z.im.im) hij
  simp [hK_def, Dbl.J] at this

/-- ★★ W8: `innerDeriv hJ ≠ 0`. By faithfulness, `ad_{hJ}(hK) = hJ·hK − hK·hJ = hI − (−hI) = 2i`,
    whose `re.im.re`-coordinate is `2 ≠ 0`. -/
theorem innerDeriv_hJ_ne_zero : innerDeriv (hJ : H ℚ) ≠ 0 := by
  intro h
  have hz : adHom (hJ : H ℚ) = 0 := (innerDeriv_eq_zero_iff_adHom hJ).mp h
  have hjk : adHom (hJ : H ℚ) hK = 0 := by rw [hz]; rfl
  rw [adHom_apply, hJ_hK, hK_hJ, sub_neg_eq_add] at hjk
  have := congrArg (fun z : H ℚ => z.re.im) hjk
  simp [hI, CD.iota, Dbl.J] at this

/-- `ad_{2k}(i) = 4j` — the witnessing coordinate for the nonvanishing of the transferred
    bracket: `⁅innerDeriv hI, innerDeriv hJ⁆ = innerDeriv (2·hK)`, and `ad_{2hK}(hI) = 4j ≠ 0`. -/
theorem adHom_two_hK_hI : adHom ((2 : ℤ) • hK : H ℚ) hI = (4 : ℤ) • hJ := by
  rw [show ((2 : ℤ) • hK : H ℚ) = hK + hK by rw [two_zsmul]]
  simp only [adHom_apply, add_mul, mul_add, hK_hI, hI_hK]
  rw [show (4 : ℤ) • hJ = hJ + hJ + hJ + hJ by
    rw [show (4 : ℤ) = 1 + 1 + 1 + 1 by norm_num, add_smul, add_smul, add_smul, one_smul]]
  abel

theorem four_hJ_ne_zero : (4 : ℤ) • hJ ≠ (0 : H ℚ) := by
  rw [show (4 : ℤ) • hJ = hJ + hJ + hJ + hJ by
    rw [show (4 : ℤ) = 1 + 1 + 1 + 1 by norm_num, add_smul, add_smul, add_smul, one_smul]]
  intro h
  have := congrArg (fun z : H ℚ => z.im.re) h
  simp only [hJ, CD.e2, CD.add_im, Dbl.add_re, CD.zero_im, Dbl.zero_re] at this
  norm_num at this

/-- ★★ W8 NON-VACUITY: the transferred bracket is genuinely NONZERO inside g₂ — the embedded
    su(2) is a real NON-ABELIAN subalgebra, not the zero map. By `innerDeriv_bracket` the
    bracket is `innerDeriv (hI·hJ − hJ·hI) = innerDeriv (2·hK)`; were it zero, faithfulness
    forces `ad_{2hK} = 0`, contradicting `ad_{2hK}(hI) = 4j ≠ 0`. -/
theorem struct_ij_ne_zero : ⁅innerDeriv (hI : H ℚ), innerDeriv hJ⁆ ≠ 0 := by
  rw [innerDeriv_bracket,
    show (hI : H ℚ) * hJ - hJ * hI = (2 : ℤ) • hK by
      rw [hI_hJ, hJ_hI, sub_neg_eq_add, two_zsmul]]
  intro h
  have hz : adHom ((2 : ℤ) • hK : H ℚ) = 0 := (innerDeriv_eq_zero_iff_adHom _).mp h
  apply four_hJ_ne_zero
  rw [← adHom_two_hK_hI, hz]; rfl

end Cascade

end

end Phys.Algebra
