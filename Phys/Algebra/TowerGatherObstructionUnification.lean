/-
  Phys.Algebra.TowerGatherObstructionUnification — arc-N N3 (the ★ capstone joint):
  THE OBSTRUCTION UNIFICATION.
  ============================================================================================
  Arc N (docs/SEED_GATHER_TELOS.md, the physics TELOS) reads physics as the local→global
  (sheaf-like) obstruction of the gather trying, and failing, to totalize. N411 (N1) built the
  gather MONAD with a single controlled obstruction (η = worldMap, the μ-comparison defect =
  the banked N219 gluing obstruction = the banked associator `assoc` on `O ℚ`); N412 (N2) cut to
  the STATE level (physical states = T-algebras = the left nucleus). THIS node (N3) makes the
  UNIFYING statement: the physics TERMINATIONS the chain has banked SEPARATELY — confinement
  (arc I), curvature (arc E), the cascade stop (N2), and CP (arc F2) — are ALL instances of the
  SAME object, the octonion associator `assoc` on `O ℚ`, indexed by WHERE / HOW the gather fails.

  THE ONE OBSTRUCTION. The banked N219/N411 gluing obstruction (= the banked associator `assoc`)
  is the single object. `AssocLocusNonempty := ∃ a b c : O ℚ, assoc a b c ≠ 0` is the common
  obstruction locus.

  THE FOUR INDICES (each termination = a reading of the SAME `assoc`; each CITES its banked theorem):
    · CONFINEMENT (arc I, `confines_iff_not_assoc`/`o_confines`): the SECTOR-GLOBAL ∃ index —
      `SectorConfines (O ℚ) ↔ AssocLocusNonempty` (`confinement_is_obstruction`).
    · THE CASCADE STOP (N2, `not_associative`): the SAME ∃ index, from the doubling —
      `(¬ SectorAssoc (O ℚ)) ↔ AssocLocusNonempty` (`cascade_stop_is_obstruction`).
    · CURVATURE (arc E, `flat_iff_curvature_zero`/`coloured_witness_not_flat`): the PAIRWISE index
      — `(¬ WorldsGlue a b) ↔ ∃ x, assoc a b x ≠ 0` (`curvature_is_obstruction`), and globally
      `(∃ a b, ¬ WorldsGlue a b) ↔ AssocLocusNonempty` (`curvature_somewhere_is_obstruction`).
    · CP (arc F2, `reQ_mul_assoc3`/`assoc3_witness_ne_zero`): the reQ⊕Im CHANNEL index — the
      associator's REAL channel always gathers (`cp_real_channel_gathers`: `∀ a b c, reQ (assoc
      a b c) = 0`, the θ̄ = 0 face) while the IMAGINARY channel carries the nonzero obstruction
      (`AssocLocusNonempty`, the flavor-CP face).

  THE UNIFICATION (the new content — NOT a bare ∧ of the banked capstones): the four terminations
  are literally EQUIVALENT through the ONE locus (`four_terminations_one_obstruction`), and ONE
  banked triple `(ι(ιJ), ι(e₂), e₂)` realizes all four at once (`one_witness_four_faces`): the
  same object is the cascade-stop witness (`assoc_nonvanishing`), the curvature-nonflat witness
  (`coloured_witness_not_flat`), the confinement witness (it puts the locus in `AssocLocusNonempty`),
  and it sits in the CP-obstructed imaginary channel (`reQ (assoc …) = 0` yet `≠ 0`).

  ⚠ GRADE (honest, docs/SEED_GATHER_TELOS.md §N3). The STRUCTURE — the four index characterizations,
  the four-way equivalence, the channel split, the one-witness realization — is THEOREM-route,
  proved on the banked concrete objects. The reading "therefore confinement, curvature, the cascade
  stop, and CP are ONE obstruction — physics is where the gather fails" is the MECHANISM-grade telos
  statement: it is the physics-words-removable prose over the cited banked instances, NEVER a
  load-bearing theorem. Arc N is structural — no numerical claim, no empirical number (G2). The
  ground posit (self-reference is the ground) is NOT touched here — that is N4, an IDENTIFICATION
  flagged, never derived-from-below (the category-error guard).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "confinement / curvature / cascade / CP /
  gather / obstruction / physics": the theorems say that for the octonion algebra `O ℚ`, a single
  trilinear map `assoc` (the banked associator) has: its global non-vanishing equivalent to the
  algebra's non-associativity and to the non-composition of some left-regular pair; its pairwise
  non-vanishing equivalent to the non-composition of that specific pair; a real part that vanishes
  identically (via `reQ_mul_assoc3`) while the map itself is nonzero on a concrete triple; and one
  concrete triple realizing all of these at once. Pure statements about ONE trilinear form.

  FREE-FLOATING check (SOUL rail). Every theorem TYPE mentions the banked concrete objects — the
  banked associator `assoc` on `O ℚ`, `SectorConfines`/`SectorAssoc`/`WorldsGlue` on `O ℚ`, the
  banked `reQ`, the concrete non-associating witness `(ι(ιJ), ι(e₂), e₂)`. NOT generic over an
  arbitrary carrier / an abstract `CategoryTheory` cocycle: the unification routes through the
  octonion-SPECIFIC associator and the concrete banked witnesses.

  DEPENDENCIES (all banked, foundations-only): N5b `Alternative` (`assoc`, `assoc_nonvanishing`,
  `alt_left`); N385 `ConfinementCriterion` (`SectorConfines`, `SectorAssoc`, `confines_iff_not_assoc`);
  arc-E `ConfinementMassGap` (`flat_iff_curvature_zero`, `coloured_witness_not_flat`, `WorldsGlue`);
  N2 `Cascade.Octonion` (`not_associative`); arc-F2 `OctonionAssociative3Form` (`reQ_mul_assoc3`,
  `assoc3_witness_ne_zero`); N24 `DerivationCompact` (`reQ`, `reQ_add`, `reQ_neg`). Ground field the
  cascade ring ℚ; NOT Mathlib-ℝ as content; Mathlib is MACHINERY only.

  Foundations-only: no posited axiom, no proof-hole, no kernel-trust bypass, no heartbeat inflation,
  no Mathlib number system as content, no bridge.
-/
import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementCriterion
import Phys.Algebra.ConfinementMassGap
import Phys.Algebra.OctonionAssociative3Form
import Phys.Cascade.Octonion
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## The deep-real part is subtractive (helper). -/

/-- `reQ (a − b) = reQ a − reQ b` — from the banked additivity/negation of `reQ` (N24). -/
theorem reQ_sub_O (a b : O ℚ) : reQ (a - b) = reQ a - reQ b := by
  rw [sub_eq_add_neg, reQ_add, reQ_neg, ← sub_eq_add_neg]

/-! ## §1 — THE ONE OBSTRUCTION LOCUS. -/

/-- ★ THE COMMON OBSTRUCTION LOCUS. The single object every banked physics termination is an
    index of: the octonion associator `assoc` (the banked N219/N411 gluing obstruction) fails
    to vanish somewhere on `O ℚ`. Physics-words-removable: `∃ a b c, [a,b,c] ≠ 0`. -/
def AssocLocusNonempty : Prop := ∃ a b c : O ℚ, assoc a b c ≠ 0

/-- W8 / N2 NON-VACUITY: the locus is genuinely nonempty (the banked non-associating witness). -/
theorem assocLocus_nonempty : AssocLocusNonempty :=
  ⟨_, _, _, assoc_nonvanishing⟩

/-! ## §2 — THE FOUR INDICES: each banked termination is a reading of the SAME `assoc`. -/

/-- ★ CONFINEMENT (arc I) = the SECTOR-GLOBAL ∃ INDEX of the obstruction. The colour sector
    `O ℚ` confines (the banked `SectorConfines`, N385) IFF the associator locus is nonempty.
    Cites the banked `confines_iff_not_assoc`. -/
theorem confinement_is_obstruction :
    SectorConfines (O ℚ) ↔ AssocLocusNonempty := by
  rw [confines_iff_not_assoc]
  unfold SectorAssoc AssocLocusNonempty assoc
  constructor
  · intro h
    by_contra hc
    push_neg at hc
    exact h (fun a b c => sub_eq_zero.mp (hc a b c))
  · rintro ⟨a, b, c, h⟩ hall
    exact h (sub_eq_zero.mpr (hall a b c))

/-- ★ THE CASCADE STOP (N2) = the SAME ∃ INDEX, arising from the doubling. `O ℚ` fails to be
    associative (the banked `not_associative`) IFF the associator locus is nonempty. -/
theorem cascade_stop_is_obstruction :
    (¬ SectorAssoc (O ℚ)) ↔ AssocLocusNonempty := by
  unfold SectorAssoc AssocLocusNonempty assoc
  constructor
  · intro h
    by_contra hc
    push_neg at hc
    exact h (fun a b c => sub_eq_zero.mp (hc a b c))
  · rintro ⟨a, b, c, h⟩ hall
    exact h (sub_eq_zero.mpr (hall a b c))

/-- ★ CURVATURE (arc E) = the PAIRWISE INDEX of the obstruction. A local pair `(a,b)` fails to
    glue (the banked `WorldsGlue`, N218T — "not flat") IFF the associator fails at that pair.
    Cites the banked `flat_iff_curvature_zero`. -/
theorem curvature_is_obstruction (a b : O ℚ) :
    (¬ WorldsGlue a b) ↔ ∃ x, assoc a b x ≠ 0 := by
  rw [flat_iff_curvature_zero]
  push_neg
  rfl

/-- ★ CURVATURE, GLOBALLY = the SAME ∃ INDEX. Some pair fails to glue (curvature nonzero
    somewhere) IFF the associator locus is nonempty. -/
theorem curvature_somewhere_is_obstruction :
    (∃ a b : O ℚ, ¬ WorldsGlue a b) ↔ AssocLocusNonempty := by
  constructor
  · rintro ⟨a, b, h⟩
    obtain ⟨x, hx⟩ := (curvature_is_obstruction a b).mp h
    exact ⟨a, b, x, hx⟩
  · rintro ⟨a, b, c, h⟩
    exact ⟨a, b, (curvature_is_obstruction a b).mpr ⟨c, h⟩⟩

/-- ★ CP (arc F2), the REAL CHANNEL: the obstruction's real part ALWAYS gathers. For EVERY
    triple, `reQ (assoc a b c) = 0` — the associator lives entirely in the imaginary channel.
    This is the θ̄ = 0 face: the obstruction is invisible to the real/trace/determinant channel.
    Grounded on the banked `reQ_mul_assoc3` (the real part of the octonion product is associative
    even though the product is not) — the SAME lever the banked strong-CP structure rests on. -/
theorem cp_real_channel_gathers (a b c : O ℚ) : reQ (assoc a b c) = 0 := by
  unfold assoc
  rw [reQ_sub_O, reQ_mul_assoc3, sub_self]

/-- ★ CP (arc F2), the IMAGINARY CHANNEL: the obstruction is genuinely nonzero. The banked
    calibration 3-form witness `assoc3 u2 u1 (u1×u2) = −1 ≠ 0` (`assoc3_witness_ne_zero`,
    the banked strong-CP / flavor-CP source) confirms the imaginary channel carries a nonzero
    obstruction while the real channel vanishes — CP is violated in flavor even as θ̄ = 0. -/
theorem cp_imaginary_channel_obstructed :
    assoc3 u2 u1 (octCross u1 u2) ≠ 0 := assoc3_witness_ne_zero

/-! ## §3 — THE UNIFICATION: the four terminations are ONE obstruction. -/

/-- ★★ THE FOUR-WAY EQUIVALENCE. Three of the banked terminations are the SAME sector-global
    ∃ index of the ONE associator locus (confinement ⟺ cascade-stop ⟺ curvature-somewhere ⟺
    the locus), and CP is the reQ⊕Im channel REFINEMENT of that same locus (the real channel
    gathers everywhere while the locus — the imaginary channel — is nonempty). This is the
    unification: not a bare ∧ of the banked capstones, but the identity of their obstruction. -/
theorem four_terminations_one_obstruction :
    (SectorConfines (O ℚ) ↔ AssocLocusNonempty)
    ∧ ((¬ SectorAssoc (O ℚ)) ↔ AssocLocusNonempty)
    ∧ ((∃ a b : O ℚ, ¬ WorldsGlue a b) ↔ AssocLocusNonempty)
    ∧ ((∀ a b c : O ℚ, reQ (assoc a b c) = 0) ∧ AssocLocusNonempty) :=
  ⟨confinement_is_obstruction,
   cascade_stop_is_obstruction,
   curvature_somewhere_is_obstruction,
   ⟨cp_real_channel_gathers, assocLocus_nonempty⟩⟩

/-- ★ CONFINEMENT ⟺ CURVATURE (a direct never-banked cross-tie, through the shared locus). The
    colour sector confines IFF some local pair fails to glide — two separately-banked terminations
    (arc I and arc E) proven equivalent through the ONE associator. -/
theorem confinement_iff_curvature :
    SectorConfines (O ℚ) ↔ (∃ a b : O ℚ, ¬ WorldsGlue a b) := by
  rw [confinement_is_obstruction, curvature_somewhere_is_obstruction]

/-- ★ CONFINEMENT ⟺ THE CASCADE STOP (through the shared locus). -/
theorem confinement_iff_cascade_stop :
    SectorConfines (O ℚ) ↔ ¬ SectorAssoc (O ℚ) := by
  rw [confinement_is_obstruction, cascade_stop_is_obstruction]

/-! ## §4 — THE ONE WITNESS: a single triple realizes all four terminations. -/

/-- ★★ ONE WITNESS, FOUR FACES. The single banked non-associating triple `(ι(ιJ), ι(e₂), e₂)`
    realizes ALL FOUR terminations at once:
      (1) THE CASCADE STOP — its associator is nonzero (`assoc_nonvanishing`, N2);
      (2) CURVATURE — the pair `(ι(ιJ), ι(e₂))` is NOT flat (`coloured_witness_not_flat`, arc E);
      (3) CONFINEMENT — that same nonzero associator puts the locus in `AssocLocusNonempty`, so
          `O ℚ` confines (`confinement_is_obstruction`, arc I);
      (4) CP — the associator's REAL channel vanishes (`reQ = 0`, θ̄ = 0) while the associator
          itself is nonzero (the imaginary channel, flavor CP).
    One object, four physics terminations — the obstruction unification made concrete. -/
theorem one_witness_four_faces :
    (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0)
    ∧ (¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)))
    ∧ SectorConfines (O ℚ)
    ∧ (reQ (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) = 0
        ∧ assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0) :=
  ⟨assoc_nonvanishing,
   coloured_witness_not_flat,
   confinement_is_obstruction.mpr ⟨_, _, _, assoc_nonvanishing⟩,
   ⟨cp_real_channel_gathers _ _ _, assoc_nonvanishing⟩⟩

/-! ## §5 — NON-VACUITY: the obstruction is a genuine PROPER selection. -/

/-- W8 THE OBSTRUCTION IS PROPER. The associator locus is genuinely nonempty (it obstructs —
    `assoc_nonvanishing`) AND the associator genuinely vanishes somewhere (the left-alternative
    law `[x,x,y] = 0`, `alt_left`) — so the obstruction is a real SELECTION, not the whole space
    (not vacuous) and not empty (not trivial). A mis-reading where everything obstructed (or
    nothing did) would collapse the unification. -/
theorem obstruction_proper :
    (∃ a b c : O ℚ, assoc a b c ≠ 0) ∧ (∃ a b c : O ℚ, assoc a b c = 0) :=
  ⟨⟨_, _, _, assoc_nonvanishing⟩, ⟨1, 1, 1, alt_left 1 1⟩⟩

/-! ## §6 — THE CAPSTONE. -/

/-- ★★★ THE OBSTRUCTION UNIFICATION (arc-N N3). The banked physics terminations — confinement
    (arc I), the cascade stop (N2), curvature (arc E), and CP (arc F2) — are ONE obstruction, the
    octonion associator `assoc` on `O ℚ`, indexed by WHERE / HOW the gather fails:
      • the SECTOR-GLOBAL ∃ index — confinement ⟺ cascade-stop ⟺ curvature-somewhere ⟺ the locus;
      • the reQ⊕Im CHANNEL index — CP: the real channel gathers (`reQ = 0`, θ̄ = 0) while the
        locus (the imaginary channel) is nonempty (flavor CP);
      • ONE banked triple realizes all four at once;
      • the obstruction is a PROPER selection (nonempty and not the whole space).
    ⚠ THEOREM-route for the STRUCTURE; the reading "physics is where the gather fails" is the
    MECHANISM-grade telos statement (physics-words-removable prose over the cited banked
    instances), never a load-bearing theorem. The axiom (N4) is NOT touched here. -/
theorem obstruction_unification :
    ((SectorConfines (O ℚ) ↔ AssocLocusNonempty)
      ∧ ((¬ SectorAssoc (O ℚ)) ↔ AssocLocusNonempty)
      ∧ ((∃ a b : O ℚ, ¬ WorldsGlue a b) ↔ AssocLocusNonempty)
      ∧ ((∀ a b c : O ℚ, reQ (assoc a b c) = 0) ∧ AssocLocusNonempty))
    ∧ (SectorConfines (O ℚ) ↔ (∃ a b : O ℚ, ¬ WorldsGlue a b))
    ∧ ((assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0)
        ∧ (¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)))
        ∧ SectorConfines (O ℚ)
        ∧ (reQ (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) = 0
            ∧ assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0))
    ∧ ((∃ a b c : O ℚ, assoc a b c ≠ 0) ∧ (∃ a b c : O ℚ, assoc a b c = 0)) :=
  ⟨four_terminations_one_obstruction,
   confinement_iff_curvature,
   one_witness_four_faces,
   obstruction_proper⟩

end

end Phys.Algebra
