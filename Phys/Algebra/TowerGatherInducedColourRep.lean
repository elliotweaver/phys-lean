/-
  Phys.Algebra.TowerGatherInducedColourRep — N248.
  ===========================================================================
  THE INDUCED COLOUR su(3)-REPRESENTATION ON THE CHARGED COMPLEMENT `Vsub = 3 ⊕ 3̄`, DERIVED from
  the gather-obstruction charge operator. Owner-authorized gather-side hypercharge front, under the
  TEMPORARY PRIORITY LOCK (docs/ROADMAP.md, owner authorization 2026-07-01). Gather-native, NOT the
  parked invariant-tower ascent.

  THE DELIVERABLE. N247 banked THE REDUCTIVE GAUGE LIE ALGEBRA `u(1) ⊕ su(3)` as one LieSubalgebra
  of so(7). The reductive algebra forces its REPRESENTATION-THEORETIC content: the charged matter —
  the branching complement `Vsub` (the `6 = 3 ⊕ 3̄`, N42c) — carries a genuine colour su(3)-rep.
  N245 banked only that colour MAPS `range chargeOp` into itself (a `Set.MapsTo`); it never packaged
  the induced action AS a representation, never stated its structure, never proved it nontrivial.
  THIS node builds the induced rep as a genuine object and reads its structure:

    ★★★ `colourRepV : colourCentralizer →ₗ⁅ℚ⁆ Module.End ℚ Vsub` — THE INDUCED COLOUR su(3)-REP on
        the charged complement, a genuine LIE-ALGEBRA HOMOMORPHISM (colour `imRep D` restricted to
        the invariant charged 6-space `Vsub`). The two triplets carry a bona-fide su(3)-action.
    ★★★ `colourRepV_commute_chargeOpV : ∀ D, Commute (colourRepV D) chargeOpV` — THE ℂ-LINEARITY:
        colour acts by maps that COMMUTE with the charge complex structure `chargeOpV` (`= J` on
        `Vsub`, `chargeOpV² = −id`, N242/N244). THIS is the precise, TRUE, ℚ-native meaning of the
        `3 ⊕ 3̄` naming: colour acts COMPLEX-LINEARLY on the charged 6-space, and the `3` / `3̄` are
        the `±i`-eigenspaces of `J` on the COMPLEXIFICATION. Over the derived ℚ the charged 6-space
        is su(3)-IRREDUCIBLE (the realification of the non-self-conjugate `3`); the split into two
        triplets is NOT a pair of real ℚ-subspaces (colour does NOT preserve `Uhol`/`Uah`
        individually — `J` swaps them, N241, and colour commutes with `J`), it is the eigenspace
        split of `J` on the complexification. The forced structural fact is the ℂ-linearity.
    ★★  `chargeOpV_sq_id : chargeOpV.comp chargeOpV = −id` (N242, re-exported) — the charge complex
        structure on the charged 6-space genuinely squares to `−id`, so `(Vsub, chargeOpV)` is a
        genuine complex 3-space and the ℂ-linearity is content, not vacuity.
    ★★  `colourRepV_ne_zero : colourRepV ⟨DI, DI_mem_colour⟩ ≠ 0` — W8 NON-TRIVIALITY: a concrete
        colour generator `DI` (N202) genuinely MOVES some charged vector. THE ONE LAW / no coordinate
        bash: if the induced rep of `DI` vanished it would kill all of `range chargeOp` (= the charged
        complement) AND the singlet (`colour_kills_sgl`), hence all of `ker chargeOp ⊔ range chargeOp
        = ImO` (`ker_sup_range_chargeOp`), so `imRep DI = 0`, so `DI = 0` by faithfulness
        (`imRep_injective`) — contradicting `DI ≠ 0` (`DI_ne_zero`, N202). Colour genuinely acts.

  THE MOAT / "ONE CAUSE, MANY TERMINATIONS" (docs/STANDARD §0). The field POSITS that the coloured
  matter transforms in the `3 ⊕ 3̄` of su(3). Here the induced rep is DERIVED — colour su(3) is the
  centralizer of the charge complex structure `J` (N201/N245), so its induced action on the charged
  6-space AUTOMATICALLY commutes with `J`, i.e. is ℂ-linear: the SAME `u1` (the fold's √−1) that is
  the gather-tear input, the charge operator, and the complex structure `J`, forces the colour rep
  to be complex. The `3 ⊕ 3̄` is not a posited quantum-number assignment; it is the ℂ-linear
  structure the gather obstruction's own complex structure imposes on the induced colour action.

  ⚠ THE COMPLEX FIELD IS METALANGUAGE, NOT CONTENT (docs/ROADMAP.md N242 warning light, still lit).
  `chargeOp`, `chargeOpV`, `imRep`, `colourCentralizer`, `Vsub`, `range chargeOp` stay DERIVED REAL
  objects; `LieHom`, `Module.End`, `Commute`, `LinearMap.restrict`/`ker`/`range`, `finrank` are
  Mathlib machinery on them. The "ℂ-linear" content is the REAL theorem `Commute (colourRepV D)
  chargeOpV` together with the REAL `chargeOpV.comp chargeOpV = −id`. NO `Algebra ℚ (Dbl ℚ)`, NO
  `TensorProduct`, NO `ℚ[i]`-as-ground.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "colour / su(3) / charge / triplet / 3 / 3̄ /
  gauge / complex / representation": over the derived field ℚ and `O ℚ = CD (H ℚ)`, for the
  Leibniz-derivation representation `imRep`, the centralizer `colourCentralizer` of `J = L_{u1}`, and
  the branching complement `Vsub`, the restriction map `D ↦ (imRep D)|Vsub` is a Lie-algebra
  homomorphism `colourCentralizer →ₗ⁅ℚ⁆ End ℚ Vsub` whose every value commutes with the endomorphism
  `chargeOpV` (which squares to `−id`), and is nonzero on the generator `DI`. No theorem STATEMENT
  needs a physics word.

  UNBROKEN. Imports only banked N247 (`chargeOp`/`colourCentralizer`/`imRep` chain), N245
  (`colour_mapsTo_range_chargeOp`/`range_chargeOp_map_eq_Vsub`/`finrank_range_chargeOp`/
  `colour_commute_chargeOp`/`colour_kills_sgl`), N244 (`chargeOp_ker`/`finrank_ker_chargeOp`), N242
  (`chargeOpV`/`chargeOpV_coe`/`chargeOpV_sq`), N42c (`Vsub`/`Vsub_le_ImO`/`singlet`/`singlet_disj_Vsub`),
  N22 (`ImO`/`imRep`/`imRep_coe`/`imRep_injective`/`finrank_ImO`), N202 (`DI`/`DI_mem_colour`/
  `DI_ne_zero`), and standard Mathlib Lie/restrict/finrank machinery. Ground = derived ℚ; nothing
  posited; no Mathlib number/algebra as content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.TowerGatherForcedChargeEigenvalues
import Phys.Algebra.DerivationColourIsospinNonNormalize

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## COLOUR PRESERVES THE CHARGED COMPLEMENT `Vsub` (as an `O ℚ`-submodule). -/

/-- ★ Colour su(3) maps the branching complement `Vsub` into itself. For `D ∈ colourCentralizer`,
    `(D : End (O ℚ))` maps `Vsub` into `Vsub`. Every `v ∈ Vsub` is `(w : O ℚ)` for some
    `w ∈ range chargeOp` (the charged complement pushes onto `Vsub`, N245
    `range_chargeOp_map_eq_Vsub`); colour maps `range chargeOp` into itself (N245
    `colour_mapsTo_range_chargeOp`); and `imRep D w` coincides with `(D : End) v`. So colour
    genuinely preserves the charged 6-space. -/
theorem colour_mapsTo_Vsub (D : derivationLieQ) (hD : D ∈ colourCentralizer) :
    Set.MapsTo (D : Module.End ℚ (O ℚ)) ↑Vsub ↑Vsub := by
  intro v hv
  simp only [SetLike.mem_coe] at hv ⊢
  rw [← range_chargeOp_map_eq_Vsub, Submodule.mem_map] at hv
  obtain ⟨w, hw, hwv⟩ := hv
  have hkey : imRep D w ∈ LinearMap.range chargeOp :=
    colour_mapsTo_range_chargeOp D hD (by simpa using hw)
  rw [← range_chargeOp_map_eq_Vsub, Submodule.mem_map]
  refine ⟨imRep D w, hkey, ?_⟩
  show ((imRep D w : ImO) : O ℚ) = (D : Module.End ℚ (O ℚ)) v
  rw [imRep_coe]; congr 1

/-! ## THE INDUCED COLOUR su(3)-REPRESENTATION ON THE CHARGED COMPLEMENT. -/

/-- The underlying function of the induced rep: colour `D` restricted to the invariant complement
    `Vsub`, as an endomorphism of `Vsub`. -/
def colourVFun (D : colourCentralizer) : Module.End ℚ Vsub :=
  (D.1 : Module.End ℚ (O ℚ)).restrict (colour_mapsTo_Vsub (D : derivationLieQ) D.2)

/-- The induced operator coincides, coordinate-free, with the ambient colour derivation on `Vsub`. -/
@[simp] theorem colourVFun_coe (D : colourCentralizer) (v : Vsub) :
    ((colourVFun D v : Vsub) : O ℚ) = (D.1 : Module.End ℚ (O ℚ)) (v : O ℚ) := rfl

/-- ★★★ THE INDUCED COLOUR su(3)-REPRESENTATION on the charged complement `Vsub = 3 ⊕ 3̄`, as a
    genuine LIE-ALGEBRA HOMOMORPHISM `colourCentralizer →ₗ⁅ℚ⁆ Module.End ℚ Vsub`: it sends a colour
    derivation `D` to `(imRep D)|Vsub` (its restriction to the invariant charged 6-space). It is
    additive and ℚ-linear in `D` (the restriction of a sum/scaling is the sum/scaling of the
    restrictions), and it respects the bracket because `Vsub` is colour-invariant (the restriction
    of a commutator is the commutator of the restrictions). The coloured matter carries a bona-fide
    su(3)-representation — DERIVED from the reductive gauge Lie algebra's own action, not posited. -/
def colourRepV : colourCentralizer →ₗ⁅ℚ⁆ Module.End ℚ Vsub where
  toFun := colourVFun
  map_add' D E := by
    apply LinearMap.ext; intro v; apply Subtype.ext
    show ((D : derivationLieQ) + (E : derivationLieQ) : Module.End ℚ (O ℚ)) (v : O ℚ)
       = (D.1 : Module.End ℚ (O ℚ)) (v : O ℚ) + (E.1 : Module.End ℚ (O ℚ)) (v : O ℚ)
    rfl
  map_smul' c D := by
    apply LinearMap.ext; intro v; apply Subtype.ext
    show ((c • (D : derivationLieQ) : derivationLieQ) : Module.End ℚ (O ℚ)) (v : O ℚ)
       = c • (D.1 : Module.End ℚ (O ℚ)) (v : O ℚ)
    rfl
  map_lie' {D E} := by
    apply LinearMap.ext; intro v; apply Subtype.ext
    show ((⁅(D : derivationLieQ), (E : derivationLieQ)⁆ : derivationLieQ) : Module.End ℚ (O ℚ)) (v : O ℚ)
       = ((colourVFun D * colourVFun E - colourVFun E * colourVFun D) v : Vsub)
    have hbr : ((⁅(D : derivationLieQ), (E : derivationLieQ)⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
        = (D.1 : Module.End ℚ (O ℚ)) * (E.1 : Module.End ℚ (O ℚ))
          - (E.1 : Module.End ℚ (O ℚ)) * (D.1 : Module.End ℚ (O ℚ)) := rfl
    rw [hbr]
    show ((D.1 : Module.End ℚ (O ℚ)) * (E.1 : Module.End ℚ (O ℚ))) (v : O ℚ)
         - ((E.1 : Module.End ℚ (O ℚ)) * (D.1 : Module.End ℚ (O ℚ))) (v : O ℚ)
       = (((colourVFun D * colourVFun E) v : Vsub) : O ℚ)
         - (((colourVFun E * colourVFun D) v : Vsub) : O ℚ)
    rw [Module.End.mul_apply, Module.End.mul_apply, Module.End.mul_apply, Module.End.mul_apply,
        colourVFun_coe, colourVFun_coe, colourVFun_coe, colourVFun_coe]

/-- The induced rep coincides, coordinate-free, with the ambient colour derivation on `Vsub`. -/
@[simp] theorem colourRepV_coe (D : colourCentralizer) (v : Vsub) :
    ((colourRepV D v : Vsub) : O ℚ) = (D.1 : Module.End ℚ (O ℚ)) (v : O ℚ) := rfl

/-! ## THE ℂ-LINEARITY — COLOUR COMMUTES WITH THE CHARGE COMPLEX STRUCTURE. -/

/-- ★★★ THE ℂ-LINEARITY: every value of the induced colour rep COMMUTES with the charge complex
    structure `chargeOpV` on the charged complement: `colourRepV D * chargeOpV = chargeOpV *
    colourRepV D`. This is the precise, ℚ-native content of the `3 ⊕ 3̄` naming — colour acts
    COMPLEX-LINEARLY on the charged 6-space. It descends from the N245 element-`Commute`
    `colour_commute_chargeOp` (`Commute (imRep D) chargeOp` on the whole `ImO`), read on `Vsub`:
    both operators restrict, and the ambient commuting `imRep D (chargeOp y) = chargeOp (imRep D y)`
    coincides, coordinate-free, with `(D : End)(crossOpO u1 v) = crossOpO u1 ((D : End) v)`. -/
theorem colourRepV_commute_chargeOpV (D : colourCentralizer) :
    colourRepV D * chargeOpV = chargeOpV * colourRepV D := by
  apply LinearMap.ext; intro v; apply Subtype.ext
  rw [Module.End.mul_apply, Module.End.mul_apply]
  show ((colourRepV D (chargeOpV v) : Vsub) : O ℚ) = ((chargeOpV (colourRepV D v) : Vsub) : O ℚ)
  rw [colourRepV_coe, chargeOpV_coe, chargeOpV_coe, colourRepV_coe]
  have hvIm : (v : O ℚ) ∈ ImO := Vsub_le_ImO v.2
  have hc : Commute (imRep (D : derivationLieQ)) chargeOp := colour_commute_chargeOp _ D.2
  have hcv : imRep (D : derivationLieQ) (chargeOp ⟨(v : O ℚ), hvIm⟩)
           = chargeOp (imRep (D : derivationLieQ) ⟨(v : O ℚ), hvIm⟩) := by
    calc imRep (D : derivationLieQ) (chargeOp ⟨(v : O ℚ), hvIm⟩)
        = (imRep (D : derivationLieQ) * chargeOp) ⟨(v : O ℚ), hvIm⟩ := rfl
      _ = (chargeOp * imRep (D : derivationLieQ)) ⟨(v : O ℚ), hvIm⟩ := by rw [hc.eq]
      _ = chargeOp (imRep (D : derivationLieQ) ⟨(v : O ℚ), hvIm⟩) := rfl
  have hcoe := congrArg (fun (z : ImO) => (z : O ℚ)) hcv
  simp only [imRep_coe] at hcoe
  simpa [crossOpO_apply] using hcoe

/-- The `Commute` phrasing of the ℂ-linearity: `Commute (colourRepV D) chargeOpV`. -/
theorem colourRepV_commute (D : colourCentralizer) : Commute (colourRepV D) chargeOpV :=
  colourRepV_commute_chargeOpV D

/-- ★★ THE CHARGE COMPLEX STRUCTURE ON THE CHARGED COMPLEMENT SQUARES TO `−id` (N242, re-exported):
    `chargeOpV.comp chargeOpV = −id`. So `(Vsub, chargeOpV)` is a genuine complex 3-space and the
    ℂ-linearity of `colourRepV` is content, not vacuity — there really is a complex structure the
    colour rep commutes with. -/
theorem chargeOpV_sq_id : chargeOpV.comp chargeOpV = -LinearMap.id := chargeOpV_sq

/-! ## THE CHARGE EIGENSPACE DECOMPOSITION OF THE FUNDAMENTAL 7 IS A DIRECT SUM. -/

/-- The neutral direction and the charged complement meet only in `⊥`: `ker chargeOp ⊓ range
    chargeOp = ⊥`. The kernel is the singlet line `span{sgl}` (N244 `chargeOp_ker`); a vector in
    the range pushes into `Vsub` (N245 `range_chargeOp_map_eq_Vsub`); and `singlet ⊓ Vsub = ⊥`
    (N42c `singlet_disj_Vsub`). The `0`-eigenspace and the charged part are genuinely transverse. -/
theorem ker_inf_range_chargeOp : LinearMap.ker chargeOp ⊓ LinearMap.range chargeOp = ⊥ := by
  rw [Submodule.eq_bot_iff]; intro y hy
  rw [Submodule.mem_inf] at hy; obtain ⟨hker, hrange⟩ := hy
  rw [chargeOp_ker, Submodule.mem_span_singleton] at hker
  obtain ⟨a, rfl⟩ := hker
  have hcoe : ((a • sgl : ImO) : O ℚ) ∈ Vsub := by
    rw [← range_chargeOp_map_eq_Vsub]; exact ⟨a • sgl, hrange, rfl⟩
  have hsing : ((a • sgl : ImO) : O ℚ) ∈ singlet := by
    show (a • (sgl : O ℚ)) ∈ singlet
    exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self u1)
  have hbot : ((a • sgl : ImO) : O ℚ) ∈ (⊥ : Submodule ℚ (O ℚ)) := by
    rw [← singlet_disj_Vsub.eq_bot, Submodule.mem_inf]; exact ⟨hsing, hcoe⟩
  rw [Submodule.mem_bot] at hbot
  apply Subtype.ext; simpa using hbot

/-- ★ THE FUNDAMENTAL 7 IS THE DIRECT SUM of the neutral line and the charged complement:
    `ker chargeOp ⊔ range chargeOp = ⊤`. By the transversality `ker_inf_range_chargeOp` and the
    dimension count `1 + 6 = 7` (N244 `finrank_ker_chargeOp`, N245 `finrank_range_chargeOp`, N22
    `finrank_ImO`). This is the eigenspace decomposition `ImO = 1 ⊕ (3 ⊕ 3̄)` at the submodule
    level, the platform for the faithfulness argument below. -/
theorem ker_sup_range_chargeOp : LinearMap.ker chargeOp ⊔ LinearMap.range chargeOp = ⊤ := by
  apply Submodule.eq_top_of_finrank_eq
  have h := Submodule.finrank_sup_add_finrank_inf_eq
    (LinearMap.ker chargeOp) (LinearMap.range chargeOp)
  rw [ker_inf_range_chargeOp, finrank_bot, finrank_ker_chargeOp, finrank_range_chargeOp] at h
  rw [finrank_ImO]; omega

/-! ## W8 NON-TRIVIALITY — COLOUR GENUINELY ACTS ON THE CHARGED COMPLEMENT. -/

/-- ★★ W8 NON-TRIVIALITY: the induced colour rep is NONTRIVIAL — the concrete colour generator `DI`
    (N202) genuinely MOVES some charged vector: `colourRepV ⟨DI, DI_mem_colour⟩ ≠ 0`. THE ONE LAW /
    no coordinate bash: if the induced rep of `DI` vanished, then `imRep DI` would kill all of
    `range chargeOp` (the charged complement, since `colourVFun` is its restriction) AND the singlet
    (`colour_kills_sgl`, `DI ∈ colourCentralizer`); with `ker chargeOp = span{sgl}` and
    `ker chargeOp ⊔ range chargeOp = ImO`, `imRep DI` would then vanish on all of `ImO`, so
    `imRep DI = 0`, so `DI = 0` by faithfulness (`imRep_injective`) — contradicting `DI ≠ 0`
    (`DI_ne_zero`, N202). Colour does not act trivially; the `3 ⊕ 3̄` is a genuine representation. -/
theorem colourRepV_ne_zero : colourRepV ⟨DI, DI_mem_colour⟩ ≠ 0 := by
  intro hzero
  -- Step 1: imRep DI vanishes on the charged complement `range chargeOp`.
  have hrange0 : ∀ y ∈ LinearMap.range chargeOp, imRep DI y = 0 := by
    intro y hy
    have hyV : (y : O ℚ) ∈ Vsub := by
      rw [← range_chargeOp_map_eq_Vsub]; exact ⟨y, hy, rfl⟩
    have h0 : colourRepV ⟨DI, DI_mem_colour⟩ ⟨(y : O ℚ), hyV⟩ = 0 := by rw [hzero]; rfl
    have hc := congrArg (fun (z : Vsub) => (z : O ℚ)) h0
    simp only [colourRepV_coe] at hc
    apply Subtype.ext
    rw [imRep_coe]
    show (DI : Module.End ℚ (O ℚ)) (y : O ℚ) = ((0 : ImO) : O ℚ)
    simpa using hc
  -- Step 2: imRep DI kills the singlet.
  have hsgl0 : imRep DI sgl = 0 := colour_kills_sgl DI DI_mem_colour
  -- Step 3: imRep DI vanishes on ker ⊔ range = ⊤, hence is 0.
  have hall : imRep DI = 0 := by
    rw [← LinearMap.ker_eq_top, eq_top_iff, ← ker_sup_range_chargeOp]
    apply sup_le
    · rw [chargeOp_ker, Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe,
          LinearMap.mem_ker]
      exact hsgl0
    · intro r hr
      rw [LinearMap.mem_ker]
      exact hrange0 r hr
  -- Step 4: faithfulness forces DI = 0, contradiction.
  have hDI0 : (DI : derivationLieQ) = 0 := imRep_injective (by rw [hall]; rfl)
  exact DI_ne_zero hDI0

/-! ## THE CAPSTONE. -/

/-- ★★★ THE INDUCED COLOUR su(3)-REPRESENTATION ON THE CHARGED COMPLEMENT `Vsub = 3 ⊕ 3̄`, from the
    gather obstruction. Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the
    branching complement `Vsub` (N42c), the Leibniz-derivation representation `imRep` (N22), colour
    `colourCentralizer = su(3)` (N201), and the charge complex structure `chargeOpV` on `Vsub` (N242):
    (i)   the restriction `D ↦ (imRep D)|Vsub` is a genuine LIE-ALGEBRA HOMOMORPHISM
          `colourRepV : colourCentralizer →ₗ⁅ℚ⁆ End ℚ Vsub` — the coloured matter carries a
          bona-fide su(3)-representation;
    (ii)  every value COMMUTES with the charge complex structure `chargeOpV`
          (`colourRepV_commute` — the ℂ-linearity, the ℚ-native meaning of `3 ⊕ 3̄`);
    (iii) `chargeOpV² = −id` — the complex structure is genuine, so (ii) is content;
    (iv)  the rep is NONTRIVIAL — a concrete colour generator `DI` moves some charged vector
          (`colourRepV_ne_zero`, via faithfulness on the eigenspace decomposition
          `ker chargeOp ⊔ range chargeOp = ⊤`).
    The `3 ⊕ 3̄` colour-representation content of the charged matter is DERIVED — the induced colour
    action on the charged 6-space is automatically complex-linear because colour su(3) is the
    centralizer of the charge complex structure (one cause, `u1`) — not a posited quantum-number
    assignment. -/
theorem induced_colour_rep_structure :
    (∀ D E : colourCentralizer, colourRepV (D + E) = colourRepV D + colourRepV E) ∧
    (∀ (D : colourCentralizer), Commute (colourRepV D) chargeOpV) ∧
    chargeOpV.comp chargeOpV = -LinearMap.id ∧
    colourRepV ⟨DI, DI_mem_colour⟩ ≠ 0 :=
  ⟨fun D E => map_add colourRepV D E, colourRepV_commute, chargeOpV_sq_id, colourRepV_ne_zero⟩

end

end Phys.Algebra
