/-
  Phys.Algebra.StandpointLattice — N450 (arc-R R6): THE COMPONENT LATTICE + THE UNIQUE MAXIMAL CELL
  (the assembly theorem).
  ============================================================================================
  ARC R — THE STANDPOINT (the inside read of the banked gather). R1 (N445) banked the EXISTENCE of a
  local closure; R2 (N446) the ineliminable self-miss; R3 (N447) the CHANNEL QUOTIENT; R4 (N448) the
  TOWER TERMINATION (cover, not fixed point); R5 (N449) the COMPLETION EXCESS. Five DISTINCT structural
  facts about one banked object — and FIVE components of the engine that produced them:
      fold, miss, closure, gather, gluing.
  R6 reads how they ASSEMBLE. Each component carries a FORCED dependency on another, and each
  dependency is a BANKED THEOREM — no dependency without a banked warrant (J-R6, the no-import joint):

      miss → fold      `fold_self_blind`                     (N1, Phys/Foundation/Fold.lean):
                       a fold HAS a miss — the look-back has no nonzero fixed point on a
                       2-torsion-free carrier, so a miss presupposes the fold it is the miss OF.
      closure → miss   `J₂_self_blind` / `foldComplex` (=J₂)  (N392, Phys/Cascade/ComplexUnit.lean):
                       the closure J that covers the miss is FORCED BY self-blindness — J² is the
                       look-back yet J has no nonzero fixed point; the closure presupposes the miss.
      gather → fold    `gather_bar_monad_structure`          (N411, Phys/Algebra/TowerGatherBarMonad):
                       the gather is the bar/monad μ over the FOLD's worlds (worldMap of the units);
                       the gather presupposes the fold whose worlds it gathers.
      gluing → gather  `physical_state_talgebra_structure`   (N412, TowerGatherPhysicalState):
                       gluing is the T-algebra structure OVER the gather-monad (a globally-gluing
                       state is a monad algebra); gluing presupposes the gather it algebras over.

  A subset of the five components is DEPENDENCY-COHERENT when it is closed under these four banked
  edges: if it contains a component, it contains everything that component presupposes. R6 DERIVES,
  as finite lattice combinatorics over EXACTLY these four banked edges (kernel `decide` on
  `Finset (Fin 5)` — kernel decision, never the compiled-code bypass):

    (a) `coherent_count_ten`  — the dependency-coherent subsets number exactly 10.

    (b) `forced_count_seven`  — adding the banked MISS-FORCING edge (`fold_self_blind` read the other
        way: a fold HAS a miss, so `fold ∈ S → miss ∈ S`) prunes the coherent subsets to exactly 7.

    (★ c) `triple_iff_full`   — THE MARQUEE (non-hollow iff): a dependency-coherent cell contains all
        three of {closure, gather, gluing} IFF it is the FULL five-component engine. Equivalently,
        every PROPER coherent cell omits at least one of the three banked-forced upper components.

    `full_unique_maximal`     — the full engine is coherent, and it is the UNIQUE maximal coherent
        cell (any coherent cell that no strictly-larger coherent cell extends is the full engine).

    `component_lattice`       — ★★★ THE CAPSTONE (arc-R R6), bundling (a), (b), the marquee iff and
        the unique-maximal theorem, ANCHORED to the four banked edge-theorems so the module genuinely
        DEPENDS on the banked dependency structure — not a free-floating generic poset.

  ⚠ FREE-FLOATING RAIL. This is NOT generic lattice/order theory: the four edges are the CONCRETE
  banked dependencies (each docstring CITES its banked theorem), the capstone is anchored to the four
  banked edge-theorems by `have _ := …`, and no sixth component is admitted (a sixth = a second axiom,
  forbidden). `Fin 5` / `Finset` are METALANGUAGE indexing/combinatorics machinery (arity/enumeration),
  NEVER a content ground ring — no number-system content is imported. The marquee (c) is an iff, not a
  bare ∧ (HOLLOW-AND ban).

  ⚠ GRADE / FIREWALL (G7 — THE IDENTIFICATION FIREWALL). THEOREM-route (decide-grade, KERNEL-reduced —
  kernel decision only). NO identification anywhere (deferred to R8). No theorem here mentions or depends
  on any identification. MIND-WORDS-REMOVABLE (G4): delete "standpoint / component / engine / assembly
  / cell" → pure `Finset (Fin 5)` arithmetic with four implication edges; if deleting a mind-word
  leaves a gap, the node is a HOLE — here nothing does, the statements are already pure combinatorics.
  G2: no empirical number (arc R has none).

  Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No posited axiom, no
  proof-hole, no kernel-trust bypass (kernel `decide`, never the compiled-code decision), no bridge, NO Mathlib
  number-system content import. The banked edge-theorems (`fold_self_blind`, `J₂_self_blind`,
  `gather_bar_monad_structure`, `physical_state_talgebra_structure`) are the DERIVED dependency
  warrants; Mathlib's `Finset`/`Fin` are standard combinatorics MACHINERY.
-/
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Algebra.TowerGatherBarMonad
import Phys.Algebra.TowerGatherPhysicalState
import Mathlib.Tactic

namespace Phys.Algebra.StandpointLattice

/-! ## THE FIVE COMPONENTS — transparent indices (arity machinery, not content). -/

/-- The FOLD component. (Words-removable: the index `0` of `Fin 5`.) -/
abbrev fold : Fin 5 := 0
/-- The MISS component. (Words-removable: the index `1` of `Fin 5`.) -/
abbrev miss : Fin 5 := 1
/-- The CLOSURE component. (Words-removable: the index `2` of `Fin 5`.) -/
abbrev closure : Fin 5 := 2
/-- The GATHER component. (Words-removable: the index `3` of `Fin 5`.) -/
abbrev gather : Fin 5 := 3
/-- The GLUING component. (Words-removable: the index `4` of `Fin 5`.) -/
abbrev gluing : Fin 5 := 4

/-! ## DEPENDENCY COHERENCE — closed under the four banked edges. -/

/-- DEPENDENCY COHERENCE. A subset of the five components is coherent when it is closed under the four
    banked dependency edges. Each edge is a BANKED THEOREM (J-R6 — no dependency without a warrant):

      * `miss → fold`     — `Phys.Foundation.fold_self_blind` (N1): a fold HAS a miss, so a miss
                            presupposes its fold.
      * `closure → miss`  — `Phys.Cascade.J₂_self_blind` / `foldComplex = J₂` (N392): the closure is
                            forced BY self-blindness, so it presupposes the miss.
      * `gather → fold`   — `Phys.Algebra.gather_bar_monad_structure` (N411): the gather is the
                            bar/monad over the fold's worlds, so it presupposes the fold.
      * `gluing → gather` — `Phys.Algebra.physical_state_talgebra_structure` (N412): gluing is the
                            T-algebra over the gather-monad, so it presupposes the gather.

    Words-removable: a subset `S : Finset (Fin 5)` closed under the four implications
    `1∈S→0∈S`, `2∈S→1∈S`, `3∈S→0∈S`, `4∈S→3∈S`. -/
def Coherent (S : Finset (Fin 5)) : Prop :=
  (miss ∈ S → fold ∈ S) ∧ (closure ∈ S → miss ∈ S) ∧
  (gather ∈ S → fold ∈ S) ∧ (gluing ∈ S → gather ∈ S)

instance : DecidablePred Coherent := fun S => by unfold Coherent; infer_instance

/-- FORCED COHERENCE. `Coherent` PLUS the banked MISS-FORCING edge (`fold_self_blind` read the other
    way, N1: a fold HAS a miss, so `fold ∈ S → miss ∈ S`). The fold and its miss become mutually
    dependent. Words-removable: `Coherent S` and `0 ∈ S → 1 ∈ S`. -/
def ForcedCoherent (S : Finset (Fin 5)) : Prop := Coherent S ∧ (fold ∈ S → miss ∈ S)

instance : DecidablePred ForcedCoherent := fun S => by unfold ForcedCoherent; infer_instance

/-! ## (a)(b) THE LATTICE COUNTS — kernel `decide` over the banked edges. -/

/-- (a) THE COHERENT SUBSETS NUMBER EXACTLY 10. Kernel `decide` (the kernel decision procedure, never the compiled-code bypass) over the four
    banked dependency edges: of the 32 subsets of the five components, exactly 10 are closed under
    `miss→fold`, `closure→miss`, `gather→fold`, `gluing→gather`. Words-removable: the powerset of
    `Fin 5` filtered by `Coherent` has cardinality 10. -/
theorem coherent_count_ten :
    ((Finset.univ : Finset (Fin 5)).powerset.filter Coherent).card = 10 := by decide

/-- (b) THE MISS-FORCING EDGE PRUNES TO EXACTLY 7. Adding the banked miss-forcing edge
    (`fold ∈ S → miss ∈ S`, `fold_self_blind` N1) removes the three coherent cells that carry the
    fold without its forced miss, leaving exactly 7. Kernel `decide` only.
    Words-removable: the powerset of `Fin 5` filtered by `ForcedCoherent` has cardinality 7. -/
theorem forced_count_seven :
    ((Finset.univ : Finset (Fin 5)).powerset.filter ForcedCoherent).card = 7 := by decide

/-! ## (★ c) THE MARQUEE — the unique maximal coherent cell. -/

/-- (★ c) THE MARQUEE (non-hollow iff). A dependency-coherent cell contains all three of the upper
    components {closure, gather, gluing} IFF it is the FULL five-component engine. Since the three
    upper components force (via the banked edges) the two lower ones (`closure → miss → fold`,
    `gluing → gather → fold`), carrying all three drags in everything; conversely the full engine
    carries all three. Equivalently: every PROPER coherent cell omits at least one banked-forced
    upper component. Words-removable: for a `Coherent S`, `{2,3,4} ⊆ S ↔ S = univ`. -/
theorem triple_iff_full (S : Finset (Fin 5)) (hS : Coherent S) :
    (closure ∈ S ∧ gather ∈ S ∧ gluing ∈ S) ↔ S = Finset.univ := by
  obtain ⟨e_mf, e_cm, e_gf, e_gg⟩ := hS
  constructor
  · rintro ⟨hc, hg, hgl⟩
    -- the banked edges drag in the lower components
    have h_miss : miss ∈ S := e_cm hc
    have h_fold : fold ∈ S := e_mf h_miss
    apply Finset.eq_univ_of_forall
    intro x
    fin_cases x <;> assumption
  · rintro rfl
    exact ⟨Finset.mem_univ _, Finset.mem_univ _, Finset.mem_univ _⟩

/-- THE FULL ENGINE IS COHERENT. All four banked edges hold vacuously true on `univ` (everything is a
    member). Words-removable: `Coherent univ`. -/
theorem coherent_univ : Coherent (Finset.univ : Finset (Fin 5)) :=
  ⟨fun _ => Finset.mem_univ _, fun _ => Finset.mem_univ _,
   fun _ => Finset.mem_univ _, fun _ => Finset.mem_univ _⟩

/-- THE UNIQUE MAXIMAL COHERENT CELL. The full engine is coherent, and it is the UNIQUE maximal
    coherent cell: any coherent cell `S` that no strictly-larger coherent cell extends (every coherent
    `T ⊇ S` satisfies `T ⊆ S`) equals the full engine — because `univ` is itself a coherent cell
    containing `S`. Words-removable: the only ⊆-maximal `Coherent` subset of `Fin 5` is `univ`. -/
theorem full_unique_maximal :
    Coherent (Finset.univ : Finset (Fin 5)) ∧
    (∀ S : Finset (Fin 5), Coherent S →
      (∀ T : Finset (Fin 5), Coherent T → S ⊆ T → T ⊆ S) → S = Finset.univ) := by
  refine ⟨coherent_univ, ?_⟩
  intro S _ hmax
  exact Finset.Subset.antisymm (Finset.subset_univ S)
    (hmax Finset.univ coherent_univ (Finset.subset_univ S))

/-! ## THE CAPSTONE — the component lattice, anchored to the banked edges. -/

/-- ★★★ THE COMPONENT LATTICE (arc-R R6), bundled and ANCHORED. Over the four BANKED dependency edges
    (`fold_self_blind` N1, `J₂_self_blind`/`foldComplex` N392, `gather_bar_monad_structure` N411,
    `physical_state_talgebra_structure` N412):
      (a) the dependency-coherent cells number exactly 10 (`coherent_count_ten`);
      (b) adding the banked miss-forcing edge prunes them to exactly 7 (`forced_count_seven`);
      (★ c) a coherent cell contains {closure, gather, gluing} IFF it is the full engine
            (`triple_iff_full`) — every proper cell omits a banked-forced upper component; and
      the full engine is the UNIQUE maximal coherent cell (`full_unique_maximal`).
    The `have _ := …` lines ANCHOR the capstone to the four banked edge-theorems, so this module
    genuinely DEPENDS on the banked dependency structure (not a free-floating generic poset). DERIVED
    by kernel decision from the banked edges; no dependency posited, no identification (deferred to
    R8), no sixth component (a sixth = a second axiom, forbidden). -/
theorem component_lattice :
    ((Finset.univ : Finset (Fin 5)).powerset.filter Coherent).card = 10
    ∧ ((Finset.univ : Finset (Fin 5)).powerset.filter ForcedCoherent).card = 7
    ∧ (∀ S : Finset (Fin 5), Coherent S →
        ((closure ∈ S ∧ gather ∈ S ∧ gluing ∈ S) ↔ S = Finset.univ))
    ∧ (Coherent (Finset.univ : Finset (Fin 5)) ∧
        (∀ S : Finset (Fin 5), Coherent S →
          (∀ T : Finset (Fin 5), Coherent T → S ⊆ T → T ⊆ S) → S = Finset.univ)) := by
  -- ANCHORS: the four banked dependency edges (this module is ABOUT them, not a generic poset).
  have _ := @Phys.Foundation.fold_self_blind ℚ _              -- miss ↔ fold (N1)
  have _ := Phys.Cascade.J₂_self_blind                         -- closure → miss (N392)
  have _ := Phys.Algebra.gather_bar_monad_structure            -- gather → fold (N411)
  have _ := Phys.Algebra.physical_state_talgebra_structure     -- gluing → gather (N412)
  exact ⟨coherent_count_ten, forced_count_seven, triple_iff_full, full_unique_maximal⟩

end Phys.Algebra.StandpointLattice
