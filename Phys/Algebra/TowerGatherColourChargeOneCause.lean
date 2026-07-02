/-
  Phys.Algebra.TowerGatherColourChargeOneCause — N251 (MANAGER TAKEOVER, theory-native consolidation).
  ===========================================================================
  THE ONE-CAUSE CONSOLIDATION: `u1` (the derived fold-root √−1, N2 `mulJ_isFoldRoot`) is ONE cause
  wearing FOUR faces, from which the entire colour-representation structure on the charged matter
  descends. Owner-authorized gather-side hypercharge front, under the TEMPORARY PRIORITY LOCK
  (docs/ROADMAP.md, owner authorization 2026-07-01). Gather-native, NOT the parked ascent.

  WHY THIS NODE (the theory-native correction). N240–N250 banked the colour-charge structure as a
  chain of nodes each proving one adjacent property (the induced rep; its ℂ-linearity; its
  faithfulness; its dim-8 image). Every one is foundations-only and correct, and each is retained.
  But the chain BURIED the moat: it never exhibited the SINGLE derived cause that forces the whole
  package at once. This node adds NO new coordinate work — it CITES the banked lemmas — and states
  the one thing they were each a shadow of:

    `u1`, the fold's own √−1 (the FIRST doubling's imaginary unit, N2), is SIMULTANEOUSLY
      FACE 1 — the gather-tear input:            `chargeOp = crossOp u1`                      (rfl)
      FACE 2 — the complex structure:            `chargeOpV² = −id` on the charged 6-space    (N242)
      FACE 3 — what colour is the centralizer of: `chargeStabilizer = colourCentralizer`      (rfl)
      FACE 4 — the axis the induced colour rep    `∀ D, Commute (colourRepV D) chargeOpV`
               is complex-linear about:                                                        (N248)

  THE MOAT / "ONE CAUSE, MANY TERMINATIONS" (docs/STANDARD §0). The ℂ-linearity of the coloured
  matter (FACE 4) is NOT an independently discovered coincidence — it is FORCED by FACE 3: colour
  `su(3)` is DEFINED (N201 `colourCentralizer`) as the g₂-stabilizer of `JO = L_{u1}`, and the
  charge operator is `crossOp u1` built from the SAME `u1`; so colour AUTOMATICALLY commutes with
  the charge complex structure. And the FAITHFULNESS of the colour rep (N249) is nothing but the
  faithfulness of the parent fundamental-7 representation (`imRep_injective`, N22 — simplicity of
  Der(O)) read through the `u1`-charge eigenspace split `ImO = ker chargeOp ⊕ range chargeOp =
  1 ⊕ 6`. The field POSITS that coloured matter transforms in the `3 ⊕ 3̄` of `SU(3)` with these
  quantum numbers; here EVERY piece — the rep, its complex structure, its faithfulness, its
  dimension — descends from ONE derived element, the fold-root, with no separate posit at any face.

  ⚠ THE COMPLEX FIELD IS METALANGUAGE, NOT CONTENT (docs/ROADMAP.md N242 warning light, still lit).
  `u1`, `chargeOp`, `chargeOpV`, `colourRepV`, `colourCentralizer`, `colourRepImg` stay DERIVED REAL
  objects; `crossOp`, `Commute`, `LinearMap.comp`, `LieHom`, `finrank` are Mathlib machinery on them.
  The "complex structure / ℂ-linear" content is the REAL theorems `chargeOpV² = −id` and
  `Commute (colourRepV D) chargeOpV`. NO `Algebra ℚ (Dbl ℚ)`, NO `TensorProduct`, NO `ℚ[i]`-as-ground.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / colour / su(3) / complex / triplet /
  gauge / hypercharge / fold-root / representation": over the derived field ℚ and `O ℚ = CD (H ℚ)`,
  for the imaginary unit `u1`, the endomorphism `crossOp u1` of `ImO`, its restriction `chargeOpV`
  to the invariant complement `Vsub`, the centralizer `colourCentralizer` of `L_{u1}`, and the
  restriction map `colourRepV`: `crossOp u1 = crossOp u1`, `chargeOpV² = −id`, the centralizer
  equals `colourCentralizer`, every `colourRepV D` commutes with `chargeOpV`, `colourRepV` is
  injective with a dim-8 image lying in the commutant of `chargeOpV`. No theorem STATEMENT needs a
  physics word.

  UNBROKEN. Imports and CITES only banked lemmas: N250 (`colourRepImg`/`finrank_colourRepImg`/
  `colourRepImg_le_commutant`), N249 (`colourRepV_faithful`), N248 (`colourRepV`/`colourRepV_commute`/
  `chargeOpV_sq_id`), N240 (`chargeOp`/`chargeStabilizer_eq_colour`), N223 (`crossOp`), N42c/N2
  (`u1`). Ground = derived ℚ; nothing posited; no Mathlib number/algebra as content; no bridge. This
  node adds ONE capstone theorem ABOVE the retained chain — it extends, it does not fork.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherImageColourSubalgebra

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

noncomputable section

/-! ## THE FOUR FACES OF `u1` — each a one-line citation of a banked fact. -/

/-- FACE 1 — `u1` (the derived fold-root √−1, N2) IS the gather-tear input of the charge operator:
    `chargeOp = crossOp u1`. Definitional (N240 `chargeOp := crossOp u1`). -/
theorem chargeOp_eq_crossOp_u1 : chargeOp = crossOp u1 := rfl

/-- FACE 2 — the same `u1` squares to the complex structure on the charged 6-space:
    `chargeOpV² = −id` (N242, re-exported N248 `chargeOpV_sq_id`). -/
theorem u1_charge_complex_structure : chargeOpV.comp chargeOpV = -LinearMap.id := chargeOpV_sq_id

/-- FACE 3 — colour `su(3)` IS EXACTLY what the same `u1` is the (charge-operator) stabilizer of:
    `chargeStabilizer = colourCentralizer`. Definitional (N240 + N201 `colourCentralizer` =
    stabilizer of `JO = L_{u1}`). -/
theorem colour_is_u1_stabilizer : chargeStabilizer = colourCentralizer := chargeStabilizer_eq_colour

/-- FACE 4 — the induced colour rep is complex-linear about the same `u1`-charge structure:
    every `colourRepV D` commutes with `chargeOpV`. FORCED by FACE 3 — colour is DEFINED as the
    centralizer of `u1` — not an independent coincidence (N248 `colourRepV_commute`). -/
theorem colour_rep_u1_complex_linear (D : colourCentralizer) :
    Commute (colourRepV D) chargeOpV := colourRepV_commute D

/-! ## THE SINGLE-CAUSE CAPSTONE. -/

/-- ★★★ THE ONE-CAUSE CONSOLIDATION. Over the derived `ℚ` and the banked octonion rung
    `O ℚ = CD (H ℚ)`, the SINGLE derived element `u1` — the fold's own √−1 (N2) — is the one cause
    from which the entire colour-representation structure of the charged matter descends, wearing
    four faces that force the package together:

      (a) `chargeOp = crossOp u1`                     — u1 IS the gather-tear charge input;
      (b) `chargeOpV² = −id`                          — u1's square is the charged 6-space's
                                                        complex structure;
      (c) `chargeStabilizer = colourCentralizer`      — colour su(3) IS the centralizer of u1;
      (d) `∀ D, Commute (colourRepV D) chargeOpV`     — the induced colour rep is ℂ-linear,
                                                        FORCED by (c) (colour = centralizer of u1);
      (e) `Function.Injective colourRepV`             — FAITHFUL: the parent 7-rep faithfulness
                                                        (simplicity of Der(O), N22) read through
                                                        the u1-charge eigenspace split;
      (f) `finrank colourRepImg = 8`                  — the faithful image is the full dim-8 su(3);
      (g) `∀ M ∈ colourRepImg, Commute M chargeOpV`   — the image lands in the ℂ-linear commutant.

    ONE CAUSE, MANY TERMINATIONS: the complex structure (b), the ℂ-linearity (d), and the dimension
    (f) are not four posits and not four coincidences — they are the four faces of the single
    derived fold-root `u1`, with (d) forced by (c) and (e) inherited from the parent representation.
    The `3 ⊕ 3̄` colour content of the charged matter is DERIVED from the fold, not assigned. -/
theorem colour_charge_one_cause_u1 :
    chargeOp = crossOp u1 ∧
    chargeOpV.comp chargeOpV = -LinearMap.id ∧
    chargeStabilizer = colourCentralizer ∧
    (∀ D : colourCentralizer, Commute (colourRepV D) chargeOpV) ∧
    Function.Injective colourRepV ∧
    Module.finrank ℚ colourRepImg.toSubmodule = 8 ∧
    (∀ M ∈ colourRepImg, Commute M chargeOpV) :=
  ⟨rfl, chargeOpV_sq_id, chargeStabilizer_eq_colour, colourRepV_commute,
   colourRepV_faithful, finrank_colourRepImg, colourRepImg_le_commutant⟩

end

end Phys.Algebra
