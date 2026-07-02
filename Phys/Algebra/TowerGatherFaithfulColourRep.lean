/-
  Phys.Algebra.TowerGatherFaithfulColourRep — N249.
  ===========================================================================
  THE FAITHFULNESS OF THE INDUCED COLOUR su(3)-REPRESENTATION ON THE CHARGED COMPLEMENT
  `Vsub = 3 ⊕ 3̄`, DERIVED from the gather-obstruction charge operator. Owner-authorized
  gather-side hypercharge front, under the TEMPORARY PRIORITY LOCK (docs/ROADMAP.md, owner
  authorization 2026-07-01). Gather-native, NOT the parked invariant-tower ascent.

  THE DELIVERABLE. N248 banked THE INDUCED COLOUR su(3)-REP `colourRepV : colourCentralizer
  →ₗ⁅ℚ⁆ Module.End ℚ Vsub` (a genuine Lie-algebra hom), every value COMMUTING with the charge
  complex structure `chargeOpV` (ℂ-linearity), `chargeOpV² = −id`, and NONTRIVIAL
  (`colourRepV_ne_zero`: the concrete generator `DI` moves a charged vector). Nontriviality is
  the statement that ONE witness acts nonzero. THIS node strengthens that to the DEFINING
  classification fact of a faithful representation:

    ★★★ `colourRepV_faithful : Function.Injective colourRepV` — THE FAITHFULNESS: the induced
        colour rep is INJECTIVE. NO nonzero colour element acts as the zero endomorphism on the
        charged matter. su(3) embeds FAITHFULLY into the endomorphisms of the charged 6-space
        (those commuting with `chargeOpV` by N248 — the ℂ-linear endomorphisms). The charged
        6-space `Vsub = 3 ⊕ 3̄` is a genuine FAITHFUL su(3)-module, not merely a nontrivial one.
    ★★  `colourRepV_ker_eq_bot : LinearMap.ker colourRepV.toLinearMap = ⊥` — the equivalent
        kernel form, the standard packaging of a faithful representation (trivial kernel).
    ★★★ `faithful_colour_rep_structure` — THE CAPSTONE: the induced colour rep is a FAITHFUL
        (injective) AND NONTRIVIAL (`colourRepV_ne_zero`, N248) representation of the full
        `8`-dimensional colour su(3) (`finrank_colourCentralizer_eq_eight`, N201) — a genuine
        embedding of the whole dim-8 su(3) into `Module.End ℚ Vsub`.

  THE PROOF (THE ONE LAW / no coordinate bash). `injective_iff_map_eq_zero`: suppose
  `colourRepV D = 0` for `D : colourCentralizer`. This is the N248 `colourRepV_ne_zero` argument
  GENERALIZED from the concrete `DI` to an arbitrary `D`:
    1. `imRep (D : derivationLieQ)` vanishes on `range chargeOp` (the charged complement, since
       `colourVFun` is the restriction and `range_chargeOp_map_eq_Vsub`);
    2. it kills the singlet `sgl` (`colour_kills_sgl (D : derivationLieQ) D.2`);
    3. so it vanishes on `ker chargeOp ⊔ range chargeOp = ⊤` (`ker_sup_range_chargeOp`,
       `chargeOp_ker`), i.e. `imRep (D : derivationLieQ) = 0`;
    4. so `(D : derivationLieQ) = 0` by faithfulness of the 7-rep (`imRep_injective`, N22);
    5. so `D = 0` in `colourCentralizer` (`Subtype.ext`).
  Every step is a banked structural fact; no ring/decide/coordinate expansion.

  THE MOAT / "ONE CAUSE, MANY TERMINATIONS" (docs/STANDARD §0). The field POSITS that the
  coloured matter carries a faithful `3 ⊕ 3̄` of su(3). Here the faithfulness is DERIVED — it
  descends from the SAME `imRep_injective` (the faithfulness of the fundamental 7-rep, the
  first Leibniz-derivation representation) restricted through the eigenspace decomposition the
  gather charge operator forces: a colour element acting as zero on the charged 6-space AND
  annihilating the singlet acts as zero on all of `ImO = 1 ⊕ (3 ⊕ 3̄)`, hence is zero. The
  faithfulness of the branching su(3)-module is the faithfulness of the parent 7-rep read
  through the charge eigenspace split.

  ⚠ THE COMPLEX FIELD IS METALANGUAGE, NOT CONTENT (docs/ROADMAP.md N242 warning light, still
  lit). `chargeOp`, `chargeOpV`, `imRep`, `colourCentralizer`, `Vsub`, `range chargeOp`,
  `colourRepV` stay DERIVED REAL objects; `LieHom`, `Module.End`, `LinearMap.ker`,
  `Function.Injective`, `finrank` are Mathlib machinery on them. The "faithful su(3)-module"
  content is the REAL theorem `Function.Injective colourRepV`. NO `Algebra ℚ (Dbl ℚ)`, NO
  `TensorProduct`, NO `ℚ[i]`-as-ground.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "colour / su(3) / faithful / charge /
  triplet / 3 / 3̄ / representation": over the derived field ℚ and `O ℚ = CD (H ℚ)`, for the
  Leibniz-derivation representation `imRep`, the centralizer `colourCentralizer` of `J = L_{u1}`,
  and the branching complement `Vsub`, the Lie-algebra homomorphism `colourRepV : colourCentralizer
  →ₗ⁅ℚ⁆ End ℚ Vsub` is INJECTIVE (its kernel is `⊥`). No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N248 (`colourRepV`/`colourRepV_coe`/`colourRepV_ne_zero`/
  `colour_mapsTo_Vsub`/`ker_sup_range_chargeOp`/`chargeOpV`), N245 (`range_chargeOp_map_eq_Vsub`/
  `colour_kills_sgl`), N244 (`chargeOp_ker`), N22 (`imRep`/`imRep_coe`/`imRep_injective`), N201
  (`finrank_colourCentralizer_eq_eight`), and standard Mathlib Lie/LinearMap/finrank machinery.
  Ground = derived ℚ; nothing posited; no Mathlib number/algebra as content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherInducedColourRep

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## THE FAITHFULNESS OF THE INDUCED COLOUR su(3)-REPRESENTATION. -/

/-- ★★★ THE FAITHFULNESS: the induced colour su(3)-representation on the charged complement is
    INJECTIVE — `Function.Injective colourRepV`. NO nonzero colour element acts as the zero
    endomorphism on the charged matter `Vsub = 3 ⊕ 3̄`. su(3) embeds FAITHFULLY into
    `Module.End ℚ Vsub` (the ℂ-linear endomorphisms of the charged 6-space, N248). THE ONE LAW
    / no coordinate bash: this is the N248 `colourRepV_ne_zero` argument generalized from the
    concrete generator `DI` to an ARBITRARY `D`. Suppose `colourRepV D = 0`. Then `imRep D`
    vanishes on `range chargeOp` (the charged complement) AND kills the singlet
    (`colour_kills_sgl`); with `ker chargeOp ⊔ range chargeOp = ImO`, `imRep D` vanishes on all
    of `ImO`, so `imRep D = 0`, so `(D : derivationLieQ) = 0` by faithfulness of the 7-rep
    (`imRep_injective`), so `D = 0` in `colourCentralizer`. The faithful `3 ⊕ 3̄` is DERIVED —
    it descends from the faithfulness of the parent fundamental 7-rep read through the charge
    eigenspace split — not a posited quantum-number assignment. -/
theorem colourRepV_faithful : Function.Injective colourRepV := by
  rw [injective_iff_map_eq_zero]
  intro D hzero
  -- Step 1: imRep (D : derivationLieQ) vanishes on the charged complement `range chargeOp`.
  have hrange0 : ∀ y ∈ LinearMap.range chargeOp, imRep (D : derivationLieQ) y = 0 := by
    intro y hy
    have hyV : (y : O ℚ) ∈ Vsub := by
      rw [← range_chargeOp_map_eq_Vsub]; exact ⟨y, hy, rfl⟩
    have h0 : colourRepV D ⟨(y : O ℚ), hyV⟩ = 0 := by rw [hzero]; rfl
    have hc := congrArg (fun (z : Vsub) => (z : O ℚ)) h0
    simp only [colourRepV_coe] at hc
    apply Subtype.ext
    rw [imRep_coe]
    show (D.1 : Module.End ℚ (O ℚ)) (y : O ℚ) = ((0 : ImO) : O ℚ)
    simpa using hc
  -- Step 2: imRep (D : derivationLieQ) kills the singlet.
  have hsgl0 : imRep (D : derivationLieQ) sgl = 0 := colour_kills_sgl (D : derivationLieQ) D.2
  -- Step 3: imRep (D : derivationLieQ) vanishes on ker ⊔ range = ⊤, hence is 0.
  have hall : imRep (D : derivationLieQ) = 0 := by
    rw [← LinearMap.ker_eq_top, eq_top_iff, ← ker_sup_range_chargeOp]
    apply sup_le
    · rw [chargeOp_ker, Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe,
          LinearMap.mem_ker]
      exact hsgl0
    · intro r hr
      rw [LinearMap.mem_ker]
      exact hrange0 r hr
  -- Step 4: faithfulness of the 7-rep forces (D : derivationLieQ) = 0.
  have hD0 : (D : derivationLieQ) = 0 := imRep_injective (by rw [hall]; rfl)
  -- Step 5: D = 0 in colourCentralizer (Subtype).
  exact Subtype.ext hD0

/-- ★★ THE KERNEL FORM of faithfulness: `LinearMap.ker colourRepV.toLinearMap = ⊥`. The standard
    packaging of a faithful representation — the induced colour rep has trivial kernel. Equivalent
    to `colourRepV_faithful` (`colourRepV` and its underlying `LinearMap` have the same underlying
    function). -/
theorem colourRepV_ker_eq_bot : LinearMap.ker colourRepV.toLinearMap = ⊥ :=
  LinearMap.ker_eq_bot.mpr colourRepV_faithful

/-! ## THE CAPSTONE. -/

/-- ★★★ THE FAITHFUL COLOUR su(3)-REPRESENTATION ON THE CHARGED COMPLEMENT `Vsub = 3 ⊕ 3̄`, from
    the gather obstruction. Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`,
    with the branching complement `Vsub` (N42c), the Leibniz-derivation representation `imRep`
    (N22), colour `colourCentralizer = su(3)` (N201), and the induced colour rep `colourRepV`
    (N248):
    (i)   `colourRepV` is INJECTIVE (`colourRepV_faithful`) — a genuine FAITHFUL representation,
          NO nonzero colour element acts trivially on the charged matter;
    (ii)  its kernel is `⊥` (`colourRepV_ker_eq_bot`) — the standard faithful-module form;
    (iii) it is NONTRIVIAL — a concrete colour generator `DI` moves a charged vector
          (`colourRepV_ne_zero`, N248);
    (iv)  its domain is the FULL `8`-dimensional colour su(3)
          (`finrank_colourCentralizer_eq_eight`, N201).
    Together: the whole dim-`8` colour su(3) embeds FAITHFULLY (injectively) and NONTRIVIALLY
    into `Module.End ℚ Vsub` — the charged 6-space is a genuine faithful su(3)-module. The
    faithfulness is DERIVED, descending from the faithfulness of the parent fundamental 7-rep
    (`imRep_injective`) read through the charge eigenspace decomposition the gather obstruction
    forces — not a posited faithful assignment. -/
theorem faithful_colour_rep_structure :
    Function.Injective colourRepV ∧
    LinearMap.ker colourRepV.toLinearMap = ⊥ ∧
    colourRepV ⟨DI, DI_mem_colour⟩ ≠ 0 ∧
    Module.finrank ℚ colourCentralizer.toSubmodule = 8 :=
  ⟨colourRepV_faithful, colourRepV_ker_eq_bot, colourRepV_ne_zero,
   finrank_colourCentralizer_eq_eight⟩

end

end Phys.Algebra
