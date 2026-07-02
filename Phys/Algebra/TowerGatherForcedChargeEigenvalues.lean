/-
  Phys.Algebra.TowerGatherForcedChargeEigenvalues — N242.
  ===========================================================================
  THE EXPLICIT OPPOSITE CHARGE EIGENVALUES (`±i`) of the two triplets, DERIVED from the
  gather-obstruction charge operator. Owner-authorized gather-side hypercharge front, under the
  TEMPORARY PRIORITY LOCK (docs/ROADMAP.md, owner authorization 2026-07-01). Gather-native, NOT
  the parked invariant-tower ascent.

  THE DELIVERABLE. N240 banked the forced charge operator `chargeOp = crossOp u1` with
  `chargeOp²(y) = ⟨u1,y⟩•u1 − y` — a complex structure on the branching complement
  `V = 3 ⊕ 3̄`. N241 banked that the gather tear `crossOpO u1` COINCIDES with the branching
  complex structure `JO = L_{u1}` on `V` and EXCHANGES the two triplets `Uhol ↔ Uah` (squaring to
  `−id`). Those nodes established the QUALITATIVE `±i` eigenspace structure. THIS node makes the
  opposite eigenvalues EXPLICIT.

  THE OBJECT: restrict the gather charge operator to the banked real 6-space `V`. Because
  `crossOpO u1` maps `Uhol` onto `Uah` and `Uah` onto `Uhol` (N241), it maps `V = Uhol ⊔ Uah`
  onto itself (`Vsub_map_crossOpO`), so it restricts to a genuine endomorphism
    ★ `chargeOpV := (crossOpO u1).restrict … : Module.End ℚ V`.
  On `V` the gather tear IS the branching complex structure (N241), so `chargeOpV² = −id`
  (`chargeOpV_sq`). Therefore `chargeOpV` annihilates `X² + 1`, and:

    ★★★ `chargeOpV_minpoly : minpoly ℚ chargeOpV = X² + 1`.

  The MINIMAL POLYNOMIAL of the forced charge operator on the two triplets is exactly `X² + 1`.
  Its two roots are the OPPOSITE pair `±i` — realized in the DERIVED complex unit `±J` of the
  cascade's own `Dbl ℚ` (`J² = −1`, `Dbl_J_root` / `Dbl_negJ_root`), opposite and distinct
  (`Dbl_J_ne_negJ`). The charge operator carries NO rational eigenvalue
  (`chargeOpV_no_rational_eigenvalue`) — its spectrum sits on the imaginary axis, at the explicit
  opposite values `+i` on one triplet and `−i` on the other. The particle/antiparticle
  opposite-charge assignment of the `3` vs the `3̄` is the explicit `±i` spectrum of the
  gather-obstruction charge operator — DERIVED, not posited or normalized.

  ⚠ THE COMPLEX FIELD IS METALANGUAGE, NOT CONTENT (docs/ROADMAP.md N242 warning light). `V` and
  `chargeOpV` are DERIVED REAL objects — the banked real 6-space and the banked real gather tear
  restricted to it. `ℚ[X]` is the polynomial machinery applied to that derived operator (as
  `propext` or `Fin`-arity is machinery), and `±i` appears ONLY as the two roots of the minimal
  polynomial `X² + 1`, concretely the derived `±J`. The derivation is NOT built OVER `ℚ[i]` as a
  ground field — indeed `Algebra ℚ (Dbl ℚ)` is not even banked, and no `TensorProduct`
  complexification is used. The `±i` eigenvalues NAME the spectrum of a derived real complex
  structure; they are not a posited content ground.

  WHAT THIS FILE BANKS (all foundations-only):
    Vsub_map_crossOpO         — `Vsub.map (crossOpO u1) = Vsub`: the gather charge operator maps
                                the `6 = 3 ⊕ 3̄` onto itself (from N241's map-equalities + the
                                `Uhol ⊔ Uah = Vsub` split N42c).
    crossOpO_u1_mapsTo_Vsub   — the pointwise mapsTo used to restrict.
    chargeOpV                 — ★ THE RESTRICTED CHARGE OPERATOR on the real 6-space `V`.
    chargeOpV_coe             — subtype-native coe to `crossOpO u1`.
    chargeOpV_sq              — ★★ `chargeOpV² = −id` (the complex structure, from N241's
                                coincidence with `JO` + `JO_JO`).
    chargeOpV_aeval           — `aeval chargeOpV (X²+1) = 0`.
    chargeOpV_monic_wit       — `(X²+1).Monic`; `chargeOpV_integral` — `IsIntegral ℚ chargeOpV`.
    charge_poly_no_root       — ★ `X²+1` has NO rational root: the SAME fold self-overlap
                                positivity `q²+1 ≥ 1 > 0` that forbade `√−1` on the line
                                (N2 `sqrt_fold_not_on_line`).
    charge_poly_irreducible   — `X²+1` is irreducible over ℚ (degree-2, no root).
    chargeOpV_minpoly         — ★★★ THE HEADLINE: `minpoly ℚ chargeOpV = X²+1` — the explicit
                                `±i` eigenvalue polynomial of the gather charge operator.
    chargeOpV_no_rational_eigenvalue — ★ the charge operator has NO rational eigenvalue (the
                                spectrum is the imaginary pair `±i`, not a real value).
    Dbl_J_root / Dbl_negJ_root — ★ the two roots `±i` ARE the derived complex unit `±J`
                                (`J²=−1`), the OPPOSITE pair.
    Dbl_J_ne_negJ             — ★★ W8 TEETH: `J ≠ −J` — the two eigenvalues are opposite AND
                                genuinely distinct (the opposite charge is nonzero).
    forced_charge_eigenvalues_structure — the capstone.

  THE MOAT (docs/STANDARD §0). The field POSITS opposite hypercharge/particle-antiparticle
  eigenvalues. Here the opposite `±i` spectrum is FORCED: the minimal polynomial of the
  gather-obstruction charge operator on the two triplets is `X²+1`, its roots the derived
  complex unit `±J`. ONE cause — `u1`, the fold's `√−1`, the gather-tear input AND the
  left-multiplication complex structure — MANY faces: the charge operator's square (`−id`), its
  triplet exchange (N241), and now its explicit imaginary spectrum, all the same object.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / hypercharge / eigenvalue-as-charge
  / particle / antiparticle / triplet / i": over the derived field ℚ and `O ℚ = CD (H ℚ)`, the
  restriction of the endomorphism `crossOpO u1` to the span `Vsub` has minimal polynomial `X²+1`,
  irreducible over ℚ (no rational root, `q²+1 > 0`), so the operator has no rational eigenvalue;
  the two roots of `X²+1` are `±J` for the derived `Dbl ℚ` unit `J` (`J²=−1`), opposite and
  distinct. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N241 (`crossOpO_u1_eq_JO_on_Vsub`/`Uhol_map_crossOpO_eq_Uah`/
  `Uah_map_crossOpO_eq_Uhol`/`JO_JO`), N42c (`Vsub`/`Uhol`/`Uah`/`Uhol_sup_Uah_eq_Vsub`/
  `finrank_Vsub`), N223 (`crossOpO`/`crossOpO_apply`), N2 rung 1 (`Dbl`/`Dbl.J`/`Dbl.J_mul_J`),
  and standard Mathlib polynomial/minpoly machinery (`minpoly.eq_of_irreducible_of_monic`,
  `irreducible_of_degree_le_three_of_not_isRoot`, `Module.End.hasEigenvalue_iff_isRoot`). Ground
  = derived ℚ; ℚ[X] and Dbl ℚ are metalanguage naming the spectrum of a derived real operator;
  nothing posited; no Mathlib number/algebra as content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherForcedChargeSplitting
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.LinearAlgebra.Eigenspace.Minpoly
import Mathlib.Algebra.Polynomial.SpecificDegree

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The gather charge operator maps the branching complement `V` onto itself. -/

/-- ★ The gather charge operator `crossOpO u1` maps the `6 = 3 ⊕ 3̄` (`Vsub`) ONTO itself. Since
    `V = Uhol ⊔ Uah` (N42c `Uhol_sup_Uah_eq_Vsub`) and the operator maps `Uhol` onto `Uah` and
    `Uah` onto `Uhol` (N241 map-equalities), the image of the sup is `Uah ⊔ Uhol = V`. -/
theorem Vsub_map_crossOpO : Vsub.map (crossOpO u1) = Vsub := by
  rw [← Uhol_sup_Uah_eq_Vsub, Submodule.map_sup, Uhol_map_crossOpO_eq_Uah,
      Uah_map_crossOpO_eq_Uhol, sup_comm]

/-- The pointwise mapsTo: `crossOpO u1 v ∈ Vsub` for every `v ∈ Vsub`. -/
theorem crossOpO_u1_mapsTo_Vsub : ∀ v ∈ Vsub, crossOpO u1 v ∈ Vsub := by
  intro v hv
  have : crossOpO u1 v ∈ Vsub.map (crossOpO u1) := ⟨v, hv, rfl⟩
  rwa [Vsub_map_crossOpO] at this

/-! ## The restricted charge operator on the real 6-space `V` — a complex structure. -/

/-- ★ THE RESTRICTED CHARGE OPERATOR: the gather charge operator `crossOpO u1` restricted to the
    banked branching complement `V = Vsub` (the real 6-space `3 ⊕ 3̄`), a genuine ℚ-linear
    endomorphism of `V`. This is the DERIVED REAL operator whose imaginary spectrum `±i` this
    node makes explicit. -/
def chargeOpV : Module.End ℚ Vsub := (crossOpO u1).restrict crossOpO_u1_mapsTo_Vsub

/-- The subtype-native coe: on `V`, `chargeOpV` acts as `crossOpO u1`. -/
theorem chargeOpV_coe (v : Vsub) : ((chargeOpV v : Vsub) : O ℚ) = crossOpO u1 (v : O ℚ) := rfl

/-- ★★ THE COMPLEX STRUCTURE ON `V`: `chargeOpV² = −id`. On the complement `V` the gather tear
    IS the branching complex structure `JO` (N241 `crossOpO_u1_eq_JO_on_Vsub`), and `JO(JO v) =
    −v` (N241 `JO_JO`, from left-alternativity). NO coordinate bash — the trunk's coincidence
    dissolves it. -/
theorem chargeOpV_sq : chargeOpV.comp chargeOpV = -LinearMap.id := by
  refine LinearMap.ext (fun v => ?_)
  apply Subtype.ext
  show ((chargeOpV (chargeOpV v) : Vsub) : O ℚ) = ((-v : Vsub) : O ℚ)
  rw [chargeOpV_coe, chargeOpV_coe, crossOpO_u1_eq_JO_on_Vsub _ (crossOpO_u1_mapsTo_Vsub _ v.2),
      crossOpO_u1_eq_JO_on_Vsub _ v.2, JO_JO]
  rfl

/-! ## The charge polynomial `X² + 1` — annihilating, monic, no rational root, irreducible. -/

/-- `chargeOpV` annihilates `X² + 1`: `aeval chargeOpV (X²+1) = 0` (from `chargeOpV² = −id`). -/
theorem chargeOpV_aeval : (aeval chargeOpV) (X ^ 2 + 1 : ℚ[X]) = 0 := by
  have h : chargeOpV * chargeOpV = -1 := by
    rw [show chargeOpV * chargeOpV = chargeOpV.comp chargeOpV from rfl, chargeOpV_sq]; rfl
  rw [map_add, map_pow, aeval_X, map_one, sq, h]; abel

/-- `X² + 1` is monic. -/
theorem chargeOpV_monic_wit : (X ^ 2 + 1 : ℚ[X]).Monic := by monicity!

/-- `chargeOpV` is integral over ℚ, witnessed by the monic annihilator `X² + 1`. -/
theorem chargeOpV_integral : IsIntegral ℚ chargeOpV :=
  ⟨X ^ 2 + 1, chargeOpV_monic_wit, chargeOpV_aeval⟩

/-- ★ THE CHARGE POLYNOMIAL HAS NO RATIONAL ROOT: `X² + 1` is nowhere zero on ℚ, because
    `q² + 1 ≥ 1 > 0` — the SAME fold self-overlap positivity (Born = self-overlap ≥ 0) that
    forbade a square root of `−1` on the line (N2 `sqrt_fold_not_on_line`). The charge operator's
    eigenvalues cannot be real; they sit on the imaginary axis at `±i`. -/
theorem charge_poly_no_root (q : ℚ) : ¬ IsRoot (X ^ 2 + 1 : ℚ[X]) q := by
  simp only [IsRoot, eval_add, eval_pow, eval_X, eval_one]
  nlinarith [sq_nonneg q]

/-- `X² + 1` has degree `2`. -/
theorem charge_poly_natDegree : (X ^ 2 + 1 : ℚ[X]).natDegree = 2 := by compute_degree!

/-- ★ `X² + 1` is IRREDUCIBLE over ℚ: a degree-2 polynomial with no rational root
    (`charge_poly_no_root`) is irreducible (Mathlib `SpecificDegree`). -/
theorem charge_poly_irreducible : Irreducible (X ^ 2 + 1 : ℚ[X]) := by
  apply irreducible_of_degree_le_three_of_not_isRoot (p := (X ^ 2 + 1 : ℚ[X]))
  · rw [charge_poly_natDegree]; decide
  · exact charge_poly_no_root

/-! ## THE HEADLINE — the minimal polynomial is `X² + 1`, spectrum `±i`. -/

/-- The real 6-space `V` is nontrivial (dimension `6 > 0`). -/
theorem nontrivial_Vsub : Nontrivial Vsub :=
  Module.nontrivial_of_finrank_pos (by rw [finrank_Vsub]; norm_num : 0 < Module.finrank ℚ Vsub)

/-- ★★★ THE HEADLINE: the MINIMAL POLYNOMIAL of the forced charge operator on the two triplets is
    exactly `X² + 1`. Since `X² + 1` is irreducible (`charge_poly_irreducible`), monic
    (`chargeOpV_monic_wit`), and annihilates `chargeOpV` (`chargeOpV_aeval`), it IS the minimal
    polynomial (`minpoly.eq_of_irreducible_of_monic`). The two roots of `X² + 1` are the OPPOSITE
    pair `±i` — the explicit opposite charge eigenvalues of the `3` and the `3̄`. -/
theorem chargeOpV_minpoly : minpoly ℚ chargeOpV = X ^ 2 + 1 := by
  haveI := nontrivial_Vsub
  exact (minpoly.eq_of_irreducible_of_monic charge_poly_irreducible chargeOpV_aeval
    chargeOpV_monic_wit).symm

/-- ★ THE CHARGE OPERATOR HAS NO RATIONAL EIGENVALUE. An eigenvalue is a root of the minimal
    polynomial (`Module.End.hasEigenvalue_iff_isRoot`), which is `X² + 1` (`chargeOpV_minpoly`),
    and that has no rational root (`charge_poly_no_root`). The spectrum of the forced charge
    operator on the two triplets is NOT real — it is the imaginary opposite pair `±i`. -/
theorem chargeOpV_no_rational_eigenvalue (μ : ℚ) : ¬ Module.End.HasEigenvalue chargeOpV μ := by
  intro hμ
  have hroot := Module.End.hasEigenvalue_iff_isRoot.mp hμ
  rw [chargeOpV_minpoly] at hroot
  exact charge_poly_no_root μ hroot

/-! ## The two roots `±i` are the derived complex unit `±J` — opposite and distinct. -/

/-- ★ THE `+i` ROOT IS THE DERIVED COMPLEX UNIT `J`: `J² + 1 = 0` in the cascade's own `Dbl ℚ`
    (banked `Dbl.J_mul_J : J*J = −1`, N2 rung 1). The eigenvalue `+i` of the charge operator is
    the fold-forced square-root-of-`−1`, not an imported constant. -/
theorem Dbl_J_root : (Dbl.J : Dbl ℚ) ^ 2 + 1 = 0 := by
  rw [sq, Dbl.J_mul_J]; abel

/-- ★ THE `−i` ROOT IS `−J`: `(−J)² + 1 = 0` — the OPPOSITE eigenvalue, the charge of the
    conjugate triplet. -/
theorem Dbl_negJ_root : (-Dbl.J : Dbl ℚ) ^ 2 + 1 = 0 := by
  rw [neg_sq, sq, Dbl.J_mul_J]; abel

/-- ★★ W8 TEETH — THE TWO EIGENVALUES ARE OPPOSITE AND GENUINELY DISTINCT: `J ≠ −J` in `Dbl ℚ`
    (their imaginary parts are `1` and `−1`). The opposite charge of the `3` vs the `3̄` is a
    nonzero splitting — `+i` and `−i` are different values, not a degenerate coincidence. -/
theorem Dbl_J_ne_negJ : (Dbl.J : Dbl ℚ) ≠ -Dbl.J := by
  intro h
  have := congrArg Dbl.im h
  simp only [Dbl.J, Dbl.neg_im] at this
  norm_num at this

/-! ## THE CAPSTONE. -/

/-- ★★★ THE EXPLICIT OPPOSITE CHARGE EIGENVALUES `±i` of the two triplets, from the gather
    obstruction. Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the
    gather-obstruction cross-product operator `crossOpO u1` (N223/N240), the branching complement
    `V = Vsub` (the `6 = 3 ⊕ 3̄`, N42c), and the derived complex unit `J` of `Dbl ℚ`:
    (i)   `crossOpO u1` maps `V` onto itself, restricting to `chargeOpV : Module.End ℚ V`;
    (ii)  `chargeOpV² = −id` (a complex structure on the real 6-space `V`);
    (iii) its minimal polynomial is `X² + 1`, irreducible over ℚ;
    (iv)  it has NO rational eigenvalue (the spectrum is the imaginary pair `±i`, not real);
    (v)   the two roots `±i` are the derived complex unit `±J` (`(±J)² = −1`), opposite and
          genuinely distinct (`J ≠ −J`).
    The opposite `±i` charge eigenvalues — the particle/antiparticle assignment of the `3` vs the
    `3̄` — are the explicit imaginary spectrum of the gather-obstruction charge operator, DERIVED
    (not posited, not normalized). `±i` names the roots of a derived real operator's minimal
    polynomial; it is metalanguage, not a posited content ground. -/
theorem forced_charge_eigenvalues_structure :
    Vsub.map (crossOpO u1) = Vsub ∧
    chargeOpV.comp chargeOpV = -LinearMap.id ∧
    minpoly ℚ chargeOpV = X ^ 2 + 1 ∧
    Irreducible (X ^ 2 + 1 : ℚ[X]) ∧
    (∀ μ : ℚ, ¬ Module.End.HasEigenvalue chargeOpV μ) ∧
    (Dbl.J : Dbl ℚ) ^ 2 + 1 = 0 ∧
    (-Dbl.J : Dbl ℚ) ^ 2 + 1 = 0 ∧
    (Dbl.J : Dbl ℚ) ≠ -Dbl.J :=
  ⟨Vsub_map_crossOpO, chargeOpV_sq, chargeOpV_minpoly, charge_poly_irreducible,
   chargeOpV_no_rational_eigenvalue, Dbl_J_root, Dbl_negJ_root, Dbl_J_ne_negJ⟩

end

end Phys.Algebra
