/-
  Phys.Algebra.TowerGatherForcedColourChargeCommute — N245.
  ===========================================================================
  THE FORCED COMMUTING COLOUR–CHARGE STRUCTURE on the fundamental 7, DERIVED from the
  gather-obstruction charge operator. Owner-authorized gather-side hypercharge front, under the
  TEMPORARY PRIORITY LOCK (docs/ROADMAP.md, owner authorization 2026-07-01). Gather-native, NOT
  the parked invariant-tower ascent.

  THE DELIVERABLE. N240 banked THE COVARIANCE HEADLINE `chargeOp_stabilizer_iff`: the g₂-stabilizer
  of the forced charge operator `chargeOp = crossOp u1` is EXACTLY colour `su(3) = colourCentralizer`
  (`⁅imRep D, chargeOp⁆ = 0 ↔ D ∈ colourCentralizer`). N244 banked THE EIGENSPACE DECOMPOSITION
  `ImO = ker chargeOp ⊕ Vsub = 1 ⊕ (3 ⊕ 3̄)` — the `0`-eigenspace the neutral singlet, the
  complement the two triplets at `±i`. THIS node fuses the two: it shows the colour symmetry
  ACTS COVARIANTLY on that charge decomposition. Colour su(3) COMMUTES with the u(1) charge
  operator, hence PRESERVES each charge eigen-piece and ANNIHILATES the doubly-neutral singlet:

    ★★★ `chargeOp_commute_iff_colour : Commute (imRep D) chargeOp ↔ D ∈ colourCentralizer`
        — the abelian charge factor and the non-abelian colour factor COMMUTE on the
          fundamental 7, exactly on colour su(3) (the commuting SU(3)×U(1) gauge structure).
    ★★  `colour_mapsTo_ker_chargeOp` / `colour_mapsTo_range_chargeOp` — colour PRESERVES the
          charge decomposition: it maps the `0`-eigenspace (the neutral singlet line) and the
          charged complement (`range chargeOp`, the `6 = 3 ⊕ 3̄`) each into itself. The charge
          grading `7 = 1 ⊕ (3 ⊕ 3̄)` is simultaneously a decomposition into colour-invariant
          subspaces.
    ★   `colour_kills_sgl` — colour ANNIHILATES the neutral singlet: `imRep D sgl = 0` for
          `D ∈ colourCentralizer`. The `1` is a colour singlet AND a charge singlet — DOUBLY
          NEUTRAL.
    ★★  `range_chargeOp_map_eq_Vsub` + `finrank_range_chargeOp` — THE CHARGED COMPLEMENT: the
          range of the charge operator, pushed through `ImO.subtype`, is EXACTLY the banked
          branching `Vsub = 3 ⊕ 3̄`, of dimension `6` (rank–nullity on the `1`-dim kernel, N244).

  ONE cause — `u1`, the fold's √−1 = the gather-tear input = the colour complex-structure axis =
  the branching singlet — MANY faces: the SAME `u1` generates the charge operator (whose
  eigenspaces are the branching, N244) AND fixes the colour complex structure (whose centralizer
  is colour su(3), N201), so colour and charge COMMUTE and share the eigenspace decomposition.
  The commuting SU(3)×U(1) structure on the fundamental representation, DERIVED not posited.

  W8 TEETH — THE COMMUTING IS A PROPER PROPERTY. `chargeOp_commute_proper`: the off-Cartan
  isospin generator `DJ` (N202) does NOT commute with the charge operator
  (`¬ Commute (imRep DJ) chargeOp`, since `DJ ∉ colourCentralizer`). So it is NOT the whole g₂
  that commutes with the charge — precisely colour su(3) does, a PROPER reduction `su(3) ⊊ g₂`.
  A garbage claim ("everything commutes" / "colour acts nontrivially on the singlet" / "the
  charged complement is not the 6") fails.

  ⚠ THE COMPLEX FIELD IS METALANGUAGE, NOT CONTENT (docs/ROADMAP.md N242 warning light, still lit).
  `chargeOp`, `imRep`, `ImO`, `Vsub`, `sgl` stay DERIVED REAL objects; `Commute`/`LinearMap.range`/
  `Set.MapsTo`/`finrank` are Mathlib machinery on them. NO `Algebra ℚ (Dbl ℚ)`, NO `TensorProduct`,
  NO `ℚ[i]`-as-ground.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / hypercharge / colour / su(3) /
  u(1) / singlet / triplet / neutral / gauge": over the derived field ℚ and `O ℚ = CD (H ℚ)`, for
  the fundamental 7 `ImO`, the cross-product endomorphism `crossOp u1 = chargeOp`, and the
  Leibniz-derivation representation `imRep`, a derivation `D` satisfies `Commute (imRep D) chargeOp`
  IF AND ONLY IF `D` lies in `colourCentralizer`; such `D` map `LinearMap.ker chargeOp` and
  `LinearMap.range chargeOp` each into itself and send `sgl` to `0`; and `range chargeOp` pushes
  through `ImO.subtype` onto `Vsub` (`finrank = 6`). No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N244 (`chargeOp`/`sgl`/`chargeOp_stabilizer_iff`/`chargeOp_ker`/
  `finrank_ker_chargeOp`/`chargeOp_ne_zero` via N240, `Vsub_map_crossOpO`/`crossOpO_u1_mapsTo_Vsub`
  via N242), N201 (`colourCentralizer`/`mem_colourCentralizer`/`commutes_JO_iff`/`isDerivQ_of_mem`),
  N202 (`DJ`/`DJ_not_mem_colour`), N42c (`Vsub`/`singlet_sup_Vsub_eq_ImO`/`Vsub_le_ImO`), N22
  (`imRep`/`imRep_coe`/`ImO`), N206 (`octCross_self`), and standard Mathlib commute/range/mapsTo/
  finrank machinery. Ground = derived ℚ; nothing posited; no Mathlib number/algebra as content; no
  bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherForcedChargeEigenspace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## THE HEADLINE — colour su(3) COMMUTES with the u(1) charge operator, and only colour does. -/

/-- ★★★ THE COMMUTING SU(3)×U(1) STRUCTURE: a Leibniz derivation `D` commutes with the forced
    charge operator `chargeOp = crossOp u1` on the fundamental 7 IF AND ONLY IF it lies in colour
    `su(3) = colourCentralizer`. This is the N240 covariance headline `chargeOp_stabilizer_iff`
    (`⁅imRep D, chargeOp⁆ = 0 ↔ D ∈ colourCentralizer`) recast in the operator-`Commute` form: the
    Lie bracket vanishes iff the two endomorphisms commute (`⁅a,b⁆ = a*b − b*a`). The abelian
    charge factor and the non-abelian colour factor commute — exactly on colour su(3). -/
theorem chargeOp_commute_iff_colour (D : derivationLieQ) :
    Commute (imRep D) chargeOp ↔ D ∈ colourCentralizer := by
  rw [← chargeOp_stabilizer_iff D]
  constructor
  · intro h
    show imRep D * chargeOp - chargeOp * imRep D = 0
    rw [sub_eq_zero]; exact h.eq
  · intro h
    have h2 : imRep D * chargeOp - chargeOp * imRep D = 0 := h
    exact sub_eq_zero.mp h2

/-- ★★ Colour su(3) COMMUTES with the charge operator: for `D ∈ colourCentralizer`,
    `Commute (imRep D) chargeOp`. The colour symmetry preserves the charge operator (hence its
    whole eigenspace decomposition). -/
theorem colour_commute_chargeOp (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    Commute (imRep D) chargeOp :=
  (chargeOp_commute_iff_colour D).mpr hD

/-- ★★ W8 TEETH — THE COMMUTING IS A PROPER PROPERTY: the off-Cartan isospin generator `DJ`
    (N202) does NOT commute with the charge operator, `¬ Commute (imRep DJ) chargeOp`, because
    `DJ ∉ colourCentralizer` (banked `DJ_not_mem_colour`). So it is NOT the whole g₂ that commutes
    with the charge — precisely colour su(3) does. The commuting reduction `su(3) ⊊ g₂` is proper;
    the charge grading is NOT centrally symmetric under all of g₂. -/
theorem chargeOp_commute_proper : ¬ Commute (imRep DJ) chargeOp := by
  intro h
  exact DJ_not_mem_colour ((chargeOp_commute_iff_colour DJ).mp h)

/-! ## Colour ANNIHILATES the neutral singlet — the `1` is doubly neutral. -/

/-- ★ Colour su(3) ANNIHILATES the neutral singlet: `imRep D sgl = 0` for `D ∈ colourCentralizer`.
    Colour membership is `D u1 = 0` (N201 `commutes_JO_iff`); `imRep D sgl` is the restriction of
    `D` to `sgl = ⟨u1⟩`, so it too is `0`. The branching singlet `1` is a colour singlet AND the
    charge-`0` eigenspace (N244) — DOUBLY NEUTRAL under both the non-abelian colour and the abelian
    charge. -/
theorem colour_kills_sgl (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    imRep D sgl = 0 := by
  apply Subtype.ext
  rw [imRep_coe]
  show (D : Module.End ℚ (O ℚ)) u1 = 0
  exact (commutes_JO_iff (isDerivQ_of_mem D)).mp (mem_colourCentralizer.mp hD)

/-! ## Colour PRESERVES the charge decomposition — each eigen-piece is colour-invariant. -/

/-- ★★ Colour PRESERVES the `0`-eigenspace: for `D ∈ colourCentralizer`, `imRep D` maps
    `ker chargeOp` (the neutral singlet line, N244 `chargeOp_ker`) into itself. Because `imRep D`
    commutes with `chargeOp` (`colour_commute_chargeOp`), a kernel vector stays in the kernel:
    `chargeOp (imRep D x) = imRep D (chargeOp x) = imRep D 0 = 0`. The charge-`0` eigenspace is a
    colour-invariant subspace. -/
theorem colour_mapsTo_ker_chargeOp (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    Set.MapsTo (imRep D) ↑(LinearMap.ker chargeOp) ↑(LinearMap.ker chargeOp) := by
  have hc : Commute (imRep D) chargeOp := colour_commute_chargeOp D hD
  intro x hx
  simp only [SetLike.mem_coe, LinearMap.mem_ker] at hx ⊢
  have hcomm : chargeOp (imRep D x) = imRep D (chargeOp x) := by
    calc chargeOp (imRep D x) = (chargeOp * imRep D) x := rfl
      _ = (imRep D * chargeOp) x := by rw [hc.eq]
      _ = imRep D (chargeOp x) := rfl
  rw [hcomm, hx, map_zero]

/-- ★★ Colour PRESERVES the charged complement: for `D ∈ colourCentralizer`, `imRep D` maps
    `range chargeOp` (the `6 = 3 ⊕ 3̄`, `range_chargeOp_map_eq_Vsub`) into itself. Because
    `imRep D` commutes with `chargeOp`, the image of `chargeOp z` is `chargeOp (imRep D z)`, again
    in the range. The charged complement is a colour-invariant subspace — colour acts within it as
    the `3 ⊕ 3̄` of su(3). -/
theorem colour_mapsTo_range_chargeOp (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    Set.MapsTo (imRep D) ↑(LinearMap.range chargeOp) ↑(LinearMap.range chargeOp) := by
  have hc : Commute (imRep D) chargeOp := colour_commute_chargeOp D hD
  intro x hx
  simp only [SetLike.mem_coe, LinearMap.mem_range] at hx ⊢
  obtain ⟨z, rfl⟩ := hx
  refine ⟨imRep D z, ?_⟩
  calc chargeOp (imRep D z) = (chargeOp * imRep D) z := rfl
    _ = (imRep D * chargeOp) z := by rw [hc.eq]
    _ = imRep D (chargeOp z) := rfl

/-! ## THE CHARGED COMPLEMENT is EXACTLY the banked `Vsub = 3 ⊕ 3̄`, dimension `6`. -/

/-- Helper: the gather charge operator `crossOpO u1` sends every element of the fundamental 7 into
    the branching complement `Vsub`. On the singlet part it is `0` (`octCross u1 u1 = 0`, N206);
    on the `Vsub` part it maps into `Vsub` (N242 `crossOpO_u1_mapsTo_Vsub`). So the whole range
    lands in `Vsub`. -/
theorem crossOpO_u1_ImO_mem_Vsub (z : O ℚ) (hz : z ∈ ImO) : crossOpO u1 z ∈ Vsub := by
  rw [← singlet_sup_Vsub_eq_ImO, Submodule.mem_sup] at hz
  obtain ⟨a, ha, b, hb, rfl⟩ := hz
  rw [singlet, Submodule.mem_span_singleton] at ha
  obtain ⟨c, rfl⟩ := ha
  rw [map_add, map_smul]
  have h0 : crossOpO u1 u1 = 0 := by rw [crossOpO_apply]; exact octCross_self u1_mem_ImO
  rw [h0, smul_zero, zero_add]
  exact crossOpO_u1_mapsTo_Vsub b hb

/-- ★★ THE CHARGED COMPLEMENT: the range of the forced charge operator, pushed through
    `ImO.subtype`, is EXACTLY the banked branching complement `Vsub = 3 ⊕ 3̄` (N42c). The charged
    (nonzero-`±i`) part of the fundamental 7 IS the two triplets. ⊆: every `chargeOp y` lands in
    `Vsub` (`crossOpO_u1_ImO_mem_Vsub`). ⊇: `Vsub` is mapped onto itself by `crossOpO u1` (N242
    `Vsub_map_crossOpO`), so each `v ∈ Vsub` is `chargeOp` of a preimage in `Vsub ⊆ ImO`. -/
theorem range_chargeOp_map_eq_Vsub :
    (LinearMap.range chargeOp).map (ImO.subtype) = Vsub := by
  apply le_antisymm
  · rintro _ ⟨x, hx, rfl⟩
    rw [SetLike.mem_coe, LinearMap.mem_range] at hx
    obtain ⟨y, rfl⟩ := hx
    show (chargeOp y : O ℚ) ∈ Vsub
    have hcoe : (chargeOp y : O ℚ) = crossOpO u1 (y : O ℚ) := by
      show octCross u1 (y : O ℚ) = crossOpO u1 (y : O ℚ); rw [crossOpO_apply]
    rw [hcoe]
    exact crossOpO_u1_ImO_mem_Vsub (y : O ℚ) y.2
  · intro v hv
    have hvim : v ∈ Vsub.map (crossOpO u1) := by rw [Vsub_map_crossOpO]; exact hv
    obtain ⟨w, hw, hwv⟩ := hvim
    refine ⟨chargeOp ⟨w, Vsub_le_ImO hw⟩, LinearMap.mem_range_self _ _, ?_⟩
    show (chargeOp ⟨w, Vsub_le_ImO hw⟩ : O ℚ) = v
    show octCross u1 w = v
    rw [← crossOpO_apply]; exact hwv

/-- ★ THE CHARGED COMPLEMENT IS EXACTLY `6`-DIMENSIONAL: `finrank ℚ (range chargeOp) = 6`. By
    rank–nullity (`finrank_range_add_finrank_ker`) with the `1`-dim kernel (N244
    `finrank_ker_chargeOp`) and the `7`-dim fundamental (N22 `finrank_ImO`): `range + 1 = 7`, so
    `range = 6` — the `3 ⊕ 3̄`. (W8 non-vacuity: the charged part is genuinely the 6, not `0` or
    `7`.) -/
theorem finrank_range_chargeOp : Module.finrank ℚ (LinearMap.range chargeOp) = 6 := by
  have hrn := LinearMap.finrank_range_add_finrank_ker chargeOp
  rw [finrank_ker_chargeOp, finrank_ImO] at hrn
  omega

/-- ★ W8 NON-VACUITY (lower): the charged complement is NONTRIVIAL — `range chargeOp ≠ ⊥` (the
    charge operator is nonzero, N240 `chargeOp_ne_zero`). There genuinely IS a charged part. -/
theorem range_chargeOp_ne_bot : LinearMap.range chargeOp ≠ ⊥ := by
  rw [Ne, LinearMap.range_eq_bot]
  exact chargeOp_ne_zero

/-! ## THE CAPSTONE. -/

/-- ★★★ THE FORCED COMMUTING COLOUR–CHARGE STRUCTURE on the fundamental 7, from the gather
    obstruction. Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the
    fundamental 7 `ImO`, the forced charge operator `chargeOp = crossOp u1` (N240), the
    Leibniz-derivation representation `imRep` (N22), the branching singlet `sgl = ⟨u1⟩`, the
    branching complement `Vsub = 3 ⊕ 3̄` (N42c), and colour `colourCentralizer = su(3)` (N201):
    (i)   `Commute (imRep D) chargeOp ↔ D ∈ colourCentralizer` — colour su(3) commutes with the
          charge operator, and precisely colour does (the commuting SU(3)×U(1) structure);
    (ii)  the off-Cartan `DJ` does NOT commute (the reduction `su(3) ⊊ g₂` is proper);
    (iii) colour annihilates the neutral singlet (`imRep D sgl = 0` — the `1` is doubly neutral);
    (iv)  colour preserves the charge decomposition: it maps `ker chargeOp` (the `0`-eigenspace)
          and `range chargeOp` (the charged complement) each into itself;
    (v)   the charged complement `range chargeOp` pushes through `ImO.subtype` onto the banked
          `Vsub` and has dimension exactly `6` (rank–nullity on the `1`-dim kernel).
    The commuting colour–charge (SU(3)×U(1)) structure on the fundamental representation, with the
    charge grading `7 = 1 ⊕ (3 ⊕ 3̄)` a decomposition into colour-invariant subspaces and the
    singlet doubly neutral — DERIVED from the gather obstruction, not posited or normalized. -/
theorem forced_colour_charge_commuting_structure :
    (∀ D : derivationLieQ, Commute (imRep D) chargeOp ↔ D ∈ colourCentralizer) ∧
    (¬ Commute (imRep DJ) chargeOp) ∧
    (∀ D : derivationLieQ, D ∈ colourCentralizer → imRep D sgl = 0) ∧
    (∀ D : derivationLieQ, D ∈ colourCentralizer →
      Set.MapsTo (imRep D) ↑(LinearMap.ker chargeOp) ↑(LinearMap.ker chargeOp)) ∧
    (∀ D : derivationLieQ, D ∈ colourCentralizer →
      Set.MapsTo (imRep D) ↑(LinearMap.range chargeOp) ↑(LinearMap.range chargeOp)) ∧
    (LinearMap.range chargeOp).map (ImO.subtype) = Vsub ∧
    Module.finrank ℚ (LinearMap.range chargeOp) = 6 :=
  ⟨chargeOp_commute_iff_colour, chargeOp_commute_proper, colour_kills_sgl,
   colour_mapsTo_ker_chargeOp, colour_mapsTo_range_chargeOp, range_chargeOp_map_eq_Vsub,
   finrank_range_chargeOp⟩

end

end Phys.Algebra
