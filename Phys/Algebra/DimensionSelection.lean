/-
  Phys.Algebra.DimensionSelection — N441 (arc-Q Q7): WHY (1,3) — THE DIMENSION-SELECTION
  THEOREM. The physical spacetime arena is the ℍ/ℂ level because ℍ is the LAST rung on which
  the fold's look-back gather composes coherently (transport glues everywhere); the next
  doubling `CD (H ℚ) = O ℚ` breaks coherence, and that break IS confinement — the gauge/matter
  obstruction, NOT lost spatial extent. Nothing is compactified; "the extra dimensions" ARE the
  obstruction content.
  ============================================================================================
  THE STRING-THEORY EMBARRASSMENT DISSOLVED (docs/SEED_OWED_FACES.md §Q7). O4 (N419,
  `Phys.Algebra.SpacetimeReduction`) derived the CONTAINMENT `(1,3) ⊂ (1,9)`: the physical
  Minkowski form sits form-isometrically inside the banked octonionic `(1,9)` via the cascade's
  first-fold complex rung `Dbl ℚ ⊂ O ℚ` (`emb4`, `emb4_preserves_form`, `signature_one_three`).
  Q7 derives the SELECTION — WHY the experienced arena is exactly that level and not the full
  octonionic `(1,9)`. The standard route asks "where did the extra dimensions go?" and answers
  "compactify them on a chosen manifold with moduli". Here the question DISSOLVES: the octonionic
  excess was never spatial arena; its NON-arena-ness IS the gauge/matter obstruction.

  THE THEORY-NATIVE MECHANISM — arena = coherent transport (all banked):
    • The fold's look-back `η = worldMap` (`a ↦ L_a`, N218T) is the gather. It composes
      COHERENTLY — the local worlds all glue into one global world — exactly when the μ-comparison
      defect vanishes on every pair, i.e. `SectorGlobalGather A := ∀ a b, WorldsGlue a b` (N219/I1).
      This is the ARENA predicate: a rung is a coherent-transport arena iff its gather totalizes.
    • `globalGather_iff_assoc` (I1): coherent transport ⟺ associativity. So the arena rungs are
      exactly the ASSOCIATIVE rungs of the derived Cayley–Dickson tower.
    • `SectorConfines A := ¬ SectorGlobalGather A` (I1). Hence "NOT an arena" and "CONFINES
      (gauge/matter)" are LITERALLY THE SAME PROPOSITION — `nonarena_iff_confines` is `Iff.rfl`.
      The one-cause tie is not a weld of two facts; it is one fact read two ways.
    • The associative rungs `Dbl ℚ` (ℂ) and `H ℚ` (ℍ) ARE arenas (`dbl_worlds_glue`,
      `h_worlds_glue`); the next doubling `O ℚ = CD (H ℚ)` is NOT (`o_confines`). ℍ is the LAST
      coherent rung — `arena_maximal_at_H`. The break is the banked cascade stop `not_associative`
      (the same associator that stopped the cascade, N2), and on `O ℚ` the descent obstruction IS
      that associator (`o_confinement_obstruction_eq_associator`, N219), which genuinely bites
      (`o_gluingDefect_ne_zero`).
    • So the octonionic excess beyond the maximal arena is INTERNALIZED as the confinement
      (gauge/matter) obstruction, NOT experienced as extra spatial extent
      (`excess_is_obstruction_not_extent`). And the physical `(1,3)` from O4 embeds through the
      coherent ℂ rung `Dbl ℚ` (`physical_arena_on_coherent_rung`): the experienced arena lives in
      the coherent-transport locus; the obstruction lives strictly outside it.

  GRADE (docs/SEED_OWED_FACES §Q7). THEOREM-route for the strict/obstructed dichotomy, the
  maximality (ℍ coheres, its double does not), and the ONE-CAUSE cross fact (¬arena ≡ confines,
  same associator, genuinely nonzero) — all full theorems on the banked derived rungs. MECHANISM
  (flagged honestly) for the ARENA IDENTIFICATION: welding the maximal-coherent-rung selection to
  O4's `(1,3)` containment as "the experienced spatial arena" is an identification of the physical
  arena with the maximal coherent-transport rung — the theorem content is that the physical `(1,3)`
  embeds through a coherent rung and the excess is the obstruction; the reading of that as "why we
  experience 4 dimensions" is the mechanism layer. NO empirical number enters any proof; the
  observed 4-dimensionality is REMOVABLE PROSE (NO-FIT).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "dimension / spacetime / arena /
  compactified / extra / gauge / matter / confine": what remains is that the derived
  Cayley–Dickson rungs `Dbl ℚ`, `H ℚ` have the left-regular gather as a strict monoid morphism
  (its local worlds all glue) while the doubling `CD (H ℚ)` does not, that "the gather does not
  totalize" and "no global descent section exists" are the same proposition, that `H ℚ` is the
  maximal rung with a totalizing gather, that the doubling's non-totalization is measured by the
  banked associator and is genuinely nonzero, and that the two-square form on the image of the
  double base-embedding of `Dbl ℚ` in `O ℚ` — the rung whose gather totalizes — restricts the
  banked `(1,9)` form to the `(1,3)` form. No theorem statement needs a physics word.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The division-algebra spacetime ladder is
  standard (Sudbery, Baez, Manogue–Dray); string theory POSITS 4 large + 6 compactified. Here the
  selection of the maximal arena is DERIVED as the last coherent-transport rung, and the octonionic
  excess is DERIVED to be the (already-banked) confinement obstruction — one cause, `not_associative`
  — never posited, never compactified, no Mathlib ℝ/ℂ as content (ℚ ground, banked derived objects).

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.

  DEPENDENCIES (all banked): I1 `Phys.Algebra.ConfinementCriterion` (`SectorGlobalGather`,
  `SectorConfines`, `SectorAssoc`, `globalGather_iff_assoc`, `dbl/h_not_confines`, `o_confines`,
  `o_confines_from_cascade_stop`, `o_confinement_obstruction_eq_associator`), N218T
  `TowerGatherCoherence` (`WorldsGlue`, `dbl/h_worlds_glue`), N219 `TowerGatherObstruction`
  (`gluingDefect`, `o_gluingDefect_ne_zero`), the banked associator `Phys.Algebra.assoc`, and O4
  `Phys.Algebra.SpacetimeReduction` (`STV4`, `emb4`, `Qv`, `Q4v`, `emb4_preserves_form`).
-/
import Phys.Algebra.ConfinementCriterion
import Phys.Algebra.SpacetimeReduction

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-! ## The arena predicate — coherent global transport. -/

/-- THE COHERENT-TRANSPORT ARENA. A rung is an ARENA when the fold's look-back gather
    `η = worldMap` (`a ↦ L_a`, N218T) composes COHERENTLY: its local worlds all glue into one
    global world (`SectorGlobalGather`, I1). This is the condition for the rung to be experienced
    as spatial extent — transport around it totalizes. Physics-words-removable: the left-regular
    representation `a ↦ L_a` is a strict monoid morphism into `(A → A, ∘, id)` (its worlds glue). -/
def CoherentArena (A : Type*) [Mul A] : Prop := SectorGlobalGather A

/-- THE ARENA DICHOTOMY: a rung is a coherent-transport arena IFF it is associative
    (`globalGather_iff_assoc`, I1). The arena rungs are exactly the associative rungs of the
    derived Cayley–Dickson tower. -/
theorem coherentArena_iff_assoc (A : Type*) [Mul A] :
    CoherentArena A ↔ SectorAssoc A := globalGather_iff_assoc A

/-- ★ THE ONE-EVENT-TWO-READINGS IDENTITY. On ANY rung, "NOT a coherent-transport arena" and
    "CONFINES (the gauge/matter obstruction)" are LITERALLY THE SAME PROPOSITION — `Iff.rfl`,
    because `SectorConfines A := ¬ SectorGlobalGather A` (I1). The dimension selection and the
    gauge/matter content are one fact read two ways, not two facts welded. -/
theorem nonarena_iff_confines (A : Type*) [Mul A] :
    ¬ CoherentArena A ↔ SectorConfines A := Iff.rfl

/-! ## The rungs of the derived tower as arenas — and the maximal arena. -/

/-- RUNG (ℂ) — `Dbl ℚ` IS a coherent-transport arena: its local worlds all glue
    (`dbl_worlds_glue`). The cascade's first fold is an arena. -/
theorem dbl_isArena : CoherentArena (Dbl ℚ) := dbl_worlds_glue

/-- RUNG (ℍ) — `H ℚ` IS a coherent-transport arena: its local worlds all glue
    (`h_worlds_glue`). -/
theorem h_isArena : CoherentArena (H ℚ) := h_worlds_glue

/-- THE DOUBLING BREAKS THE ARENA. The next Cayley–Dickson doubling of the quaternion rung,
    `CD (H ℚ) = O ℚ`, is NOT a coherent-transport arena: its local worlds fail to all glue
    (`o_confines`). Transport past the quaternion rung does not totalize. -/
theorem doubled_h_not_arena : ¬ CoherentArena (CD (H ℚ)) := o_confines

/-- ★★ MAXIMALITY — ℍ IS THE LAST COHERENT-TRANSPORT ARENA. The quaternion rung `H ℚ` is an
    arena, and its Cayley–Dickson double `CD (H ℚ) = O ℚ` is NOT. So the maximal rung on which the
    fold's gather composes coherently — the maximal experienced spatial arena — is the quaternion
    rung. The selection is DERIVED (the last associative rung), never posited. -/
theorem arena_maximal_at_H :
    CoherentArena (H ℚ) ∧ ¬ CoherentArena (CD (H ℚ)) :=
  ⟨h_worlds_glue, o_confines⟩

/-! ## The cross fact — the octonionic excess is the obstruction content, not lost extent. -/

/-- ★★★ THE CROSS FACT (never co-stated). The SAME doubling that FAILS to extend the arena past
    the quaternion rung IS the one that PRODUCES the confinement (gauge/matter) obstruction, and by
    the SAME banked associator that stopped the cascade. Read together (never separately in the
    field):
      • `¬ CoherentArena (CD (H ℚ))` — the doubling is not spatial arena;
      • `SectorConfines (O ℚ)` — the doubling confines (from the cascade stop `not_associative`);
      • the obstruction on `O ℚ` IS the banked octonion associator (`gluingDefect = [a,b,·]`, N219);
      • and it GENUINELY bites (some defect is nonzero — W8).
    So the octonionic excess beyond the maximal arena is INTERNALIZED as the gauge/matter
    obstruction, NOT experienced as extra spatial extent — the "extra dimensions" ARE the
    obstruction content. Nothing is compactified. -/
theorem excess_is_obstruction_not_extent :
    ¬ CoherentArena (CD (H ℚ)) ∧
    SectorConfines (O ℚ) ∧
    (∀ a b : O ℚ, gluingDefect a b = fun x => Phys.Algebra.assoc a b x) ∧
    (∃ a b : O ℚ, gluingDefect a b ≠ 0) :=
  ⟨o_confines, o_confines_from_cascade_stop,
    o_confinement_obstruction_eq_associator, o_gluingDefect_ne_zero⟩

/-! ## The experienced arena lives in the coherent-transport locus. -/

/-- ★ THE PHYSICAL ARENA IS ON A COHERENT RUNG. The physical `(1,3)` form (O4) embeds through the
    cascade's first-fold complex rung `Dbl ℚ` — which IS a coherent-transport arena — and the
    banked octonionic `(1,9)` form restricted to that rung's image IS the `(1,3)` form
    (`emb4_preserves_form`). The experienced spatial arena sits in the coherent locus; the
    obstruction (confinement) lives strictly outside it, on the non-arena octonionic excess. -/
theorem physical_arena_on_coherent_rung :
    CoherentArena (Dbl ℚ) ∧ (∀ p : STV4, Qv (emb4 p) = Q4v p) :=
  ⟨dbl_worlds_glue, emb4_preserves_form⟩

/-! ## The capstone. -/

/-- ★★★ THE DIMENSION-SELECTION THEOREM. Assembling the selection on the banked derived rungs:
      • the arena dichotomy — a rung is a coherent-transport arena IFF associative;
      • the one-event-two-readings identity — "not an arena" ≡ "confines" (Iff.rfl);
      • MAXIMALITY — `H ℚ` (ℍ) is an arena, its double `CD (H ℚ) = O ℚ` is not (the last coherent
        rung, the selected level);
      • THE CROSS FACT — the arena-breaking doubling IS the confinement (gauge/matter) obstruction,
        by the same banked associator, genuinely nonzero (the octonionic excess is obstruction
        content, not lost extent);
      • the physical `(1,3)` (O4) lives on the coherent ℂ rung `Dbl ℚ`, form-isometrically inside
        the banked `(1,9)`.
    The physical spacetime arena is DERIVED as the maximal coherent-transport rung; the octonionic
    excess is DERIVED to be the gauge/matter obstruction — one cause, `not_associative` — never
    posited as 4D, never compactified. Physics-words-removable throughout. -/
theorem dimension_selection :
    (∀ A : Type, ∀ _ : Mul A, CoherentArena A ↔ SectorAssoc A) ∧
    (∀ A : Type, ∀ _ : Mul A, ¬ CoherentArena A ↔ SectorConfines A) ∧
    (CoherentArena (H ℚ) ∧ ¬ CoherentArena (CD (H ℚ))) ∧
    (¬ CoherentArena (CD (H ℚ)) ∧ SectorConfines (O ℚ) ∧
      (∀ a b : O ℚ, gluingDefect a b = fun x => Phys.Algebra.assoc a b x) ∧
      (∃ a b : O ℚ, gluingDefect a b ≠ 0)) ∧
    (CoherentArena (Dbl ℚ) ∧ (∀ p : STV4, Qv (emb4 p) = Q4v p)) :=
  ⟨fun A _ => coherentArena_iff_assoc A,
   fun A _ => nonarena_iff_confines A,
   arena_maximal_at_H,
   excess_is_obstruction_not_extent,
   physical_arena_on_coherent_rung⟩

end Phys.Algebra
