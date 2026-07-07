/-
  Phys.Algebra.TowerGatherPhysicalState — N412 (arc-N N2): PHYSICAL STATES ARE
  T-ALGEBRAS ARE GLUED GLOBAL SECTIONS OVER THE BANKED GATHER-MONAD.
  ===========================================================================
  DIRECTED SUCCESSOR of N411 (arc-N N1 → arc-N N2), per docs/SEED_GATHER_TELOS.md
  §N2. Arc N is the CAPSTONE arc — the physics TELOS: physics is the local→global
  (sheaf-like) obstruction of the gather trying, and failing, to totalize. N411
  banked the gather AS a monad-with-a-single-controlled-obstruction at the
  SECTOR / obstruction-OBJECT level. This node cuts to the STATE level: WHICH
  standpoints survive the totalization.

  THE RESULT (theory-native, DERIVED — never posited). A STANDPOINT (state) is
  PHYSICAL iff it GLUES GLOBALLY — iff its fold-generated world composes strictly
  with EVERY other world:

        GluesGlobally a  :≡  ∀ b, WorldsGlue a b
                         =   ∀ b, worldMap a ∘ worldMap b = worldMap (a·b)
                         =   ∀ b, L_a ∘ L_b = L_{a·b}.

  This is exactly the T-ALGEBRA / GLOBAL-SECTION condition on the banked
  gather-monad (N411), read at the level of an individual state: `a` is a global
  section iff the monad μ-comparison defect `barMultDefect a b` (N411) vanishes
  against every `b` — iff the gather totalizes `a`'s world with the whole. The
  standard non-associative-algebra name for exactly this set is the LEFT NUCLEUS
  (the elements that associate with all others); the theory reads it as the
  PHYSICAL STRATUM — the states the gather keeps.

  WHAT THE TOWER SAYS ABOUT THE PHYSICAL STRATUM (each clause a proved theorem):

    THREE CHARACTERIZATIONS (generic, formal — like ring identities):
      • physical ⟺ the N219 gluing obstruction vanishes universally
        (`gluesGlobally_iff_defect`);
      • physical ⟺ the N411 monad μ-comparison defect vanishes universally — the
        T-algebra structure map is strict (`gluesGlobally_iff_barDefect`);
      • the trivial standpoint `1` is ALWAYS physical (`one_gluesGlobally`): η
        (the miss's re-entry) is always a global section.

    THE SMOOTH / NO-PHYSICS RUNGS (`dbl_all_physical`, `h_all_physical`): on the
      associative rungs `Dbl ℚ`, `H ℚ` EVERY state glues globally — the whole
      space is physical, there is NO selection rule, no physics. (The seed's
      "trivial / one-probe case is smooth = no physics", made concrete: when the
      gather totalizes everything, no state is forbidden.)

    THE OCTONION STRATUM IS THE LEFT NUCLEUS, PROPER AND NONEMPTY:
      • `o_gluesGlobally_iff_nucleus`: on `O ℚ` the physical stratum IS exactly
        the left nucleus — the states whose associator `[a,b,·]` vanishes for all
        `b` (the banked N219 identification of the obstruction with the associator);
      • `o_not_all_physical` (W8): the stratum is PROPER — some octonion states
        are NOT physical (banked `o_worlds_not_glue`, the non-associating triple);
      • `o_stratum_proper_nonempty`: NONEMPTY (contains `1`) AND proper — a genuine
        SELECTION RULE. This is the physics: the gather forbids some states.

    THE SECTOR ⟺ STATE TIE (N385):
      • `sectorGather_iff_all_physical`: the whole sector totalizes (has a global
        section, N385 `SectorGlobalGather`) IFF EVERY state is a T-algebra/global
        section — definitional tie between the sector-level and state-level readings;
      • `confines_iff_some_unphysical`: the sector CONFINES (N385) IFF some state
        fails to be a global section. Confinement is exactly the existence of an
        unphysical (un-gluable) standpoint.

  THE DISSOLUTION (STANDARD §0). Standard non-associative-algebra theory computes
  the LEFT NUCLEUS of the octonions as a structureless curiosity (the associative
  center of a non-associative algebra), with no physical content. The theory
  INVERTS this: the nucleus IS the physical stratum — the T-algebras / global
  sections over the gather-monad — and its being PROPER (not all of `O ℚ`) yet
  NONEMPTY (contains `1`) is the SELECTION RULE that says which states are
  physical. What the field reads as a structureless subset the theory reads as the
  answer to "what states survive the totalization."

  ONE CAUSE. The octonion associator `[a,b,·]` — the same object that stopped the
  cascade (N2), capped the Jordan tower at 3 (N5), forced strong-CP (F2), confines
  colour (N385), and is the sole obstruction to the gather being a strict monad
  (N411) — is EXACTLY the obstruction that makes the physical stratum PROPER: a
  state is unphysical precisely when the associator does not vanish against it. The
  selection rule on states and every banked termination are ONE object read at the
  totalization seam.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "physical / state / gather /
  glue / world / T-algebra / global section / selection / confine": over derived ℚ
  and `O ℚ = CD (H ℚ)`, `GluesGlobally a = ∀ b, L_a∘L_b = L_{a·b}` is membership in
  the left nucleus; it holds iff the associator `[a,b,·]` vanishes for all `b`;
  every element of the associative rungs `Dbl/H ℚ` is in the nucleus; on `O ℚ` the
  nucleus is a proper (banked non-associating triple) nonempty (contains `1`)
  subset; and the whole space is nuclear iff the product associates iff no element
  fails. Every theorem STATEMENT stands as left-nucleus / regular-representation
  algebra with no physics word.

  NOT FREE-FLOATING (STANDARD §3). This is NOT an abstract
  `CategoryTheory.Monad.Algebra` over an arbitrary carrier (which would sail
  through words-removable having no physics words, yet float free of the banked
  tower). The generic backbone (`gluesGlobally_iff_defect`, `_barDefect`,
  `one_gluesGlobally`, `sectorGather_iff_all_physical`,
  `confines_iff_some_unphysical`) are formal unit/composition identities (like ring
  identities); ALL magnitude theorems + the capstone are stated ON the banked
  `O ℚ / Dbl ℚ / H ℚ` referencing banked `WorldsGlue` / `gluingDefect` /
  `barMultDefect` / `assoc` / `SectorGlobalGather` / `SectorConfines` — the physics
  content is literally ABOUT the banked objects.

  NOT A RE-PIN. N385 (`ConfinementCriterion`) worked at the SECTOR level
  (`SectorGlobalGather A = ∀ a b, WorldsGlue a b`); N411 (`TowerGatherBarMonad`) at
  the obstruction-OBJECT level (`barMultDefect`, the monad structure). NEITHER
  banked the STATE-level physicality predicate `GluesGlobally a` (a single
  standpoint's world gluing with all others = the left nucleus = the T-algebra
  stratum), its three characterizations, the proper-nonempty selection rule on
  `O ℚ`, or the sector⟺state tie. This node is the state-level cut: which
  standpoints are the T-algebras / global sections the gather keeps.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  no Mathlib ℝ/ℂ as content (ℚ is the coefficient field; the OBJECTS are the
  derived tower `Dbl/H/O ℚ` and the banked gather machinery).
-/
import Phys.Algebra.TowerGatherBarMonad
import Phys.Algebra.ConfinementCriterion

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

/-! ## THE STATE-LEVEL PHYSICALITY PREDICATE — the physical stratum / left nucleus. -/

/-- A STANDPOINT (state) `a` GLUES GLOBALLY when its fold-generated world composes
    strictly with EVERY other world: `∀ b, worldMap a ∘ worldMap b = worldMap (a·b)`,
    i.e. `∀ b, L_a ∘ L_b = L_{a·b}`. This is the T-ALGEBRA / GLOBAL-SECTION condition
    on the banked gather-monad, at the level of an individual state — the state the
    gather totalizes with the whole. Physics-words-removable: `a` lies in the LEFT
    NUCLEUS (associates with all others). -/
def GluesGlobally {A : Type*} [Mul A] (a : A) : Prop := ∀ b : A, WorldsGlue a b

/-! ## THREE CHARACTERIZATIONS (generic formal identities). -/

/-- PHYSICAL ⟺ THE OBSTRUCTION VANISHES UNIVERSALLY. `a` is a global section iff its
    N219 gluing obstruction `gluingDefect a b` is the zero map for every `b`. -/
theorem gluesGlobally_iff_defect {A : Type*} [NonAssocRing A] (a : A) :
    GluesGlobally a ↔ ∀ b : A, gluingDefect a b = 0 := by
  simp only [GluesGlobally, worlds_glue_iff_gluingDefect_zero]

/-- PHYSICAL ⟺ THE MONAD μ-COMPARISON IS FIXED. `a` is a T-algebra over the gather-monad
    iff the N411 μ-comparison defect `barMultDefect a b` vanishes for every `b` — the
    T-algebra structure map is strict at `a`. -/
theorem gluesGlobally_iff_barDefect {A : Type*} [NonAssocRing A] (a : A) :
    GluesGlobally a ↔ ∀ b : A, barMultDefect a b = 0 := by
  simp only [GluesGlobally, worlds_glue_iff_gluingDefect_zero, barMultDefect_eq_gluingDefect]

/-- η IS ALWAYS A GLOBAL SECTION: the trivial standpoint `1` glues globally
    (`worldMap 1 = id`). The monad unit is always physical. -/
theorem one_gluesGlobally {A : Type*} [MulOneClass A] : GluesGlobally (1 : A) := by
  intro b
  funext x
  simp only [worldMap, Function.comp_apply, one_mul]

/-! ## THE SMOOTH / NO-PHYSICS RUNGS — every state physical, no selection rule. -/

/-- SMOOTH RUNG `Dbl ℚ`: EVERY state glues globally — the whole space is physical, no
    selection = no physics (associative rung, banked `dbl_worlds_glue`). -/
theorem dbl_all_physical : ∀ a : Dbl ℚ, GluesGlobally a := fun a b => dbl_worlds_glue a b

/-- SMOOTH RUNG `H ℚ`: EVERY state glues globally — the whole space is physical, no
    selection = no physics (associative rung, banked `h_worlds_glue`). -/
theorem h_all_physical : ∀ a : H ℚ, GluesGlobally a := fun a b => h_worlds_glue a b

/-! ## THE OCTONION STRATUM — the left nucleus, proper and nonempty. -/

attribute [local instance] CD.narCD CD.srCD

/-- ★ THE OCTONION PHYSICAL STRATUM IS THE LEFT NUCLEUS. On `O ℚ` a state glues
    globally iff its associator `[a,b,·]` vanishes for every `b` — the physical
    stratum is EXACTLY the left nucleus (banked N219 `o_gluingDefect_eq_assoc`). -/
theorem o_gluesGlobally_iff_nucleus (a : O ℚ) :
    GluesGlobally a ↔ ∀ b : O ℚ, (fun x => Phys.Algebra.assoc a b x) = 0 := by
  simp only [GluesGlobally, worlds_glue_iff_gluingDefect_zero, o_gluingDefect_eq_assoc]

/-- ★ THE OCTONION STRATUM IS PROPER (W8 non-vacuity): some octonion state is NOT
    physical — its world fails to glue with some other (banked `o_worlds_not_glue`,
    the non-associating triple). The selection rule genuinely forbids states. -/
theorem o_not_all_physical : ¬ ∀ a : O ℚ, GluesGlobally a := by
  intro h
  obtain ⟨a, b, hab⟩ := o_worlds_not_glue
  exact hab (h a b)

/-- ★★ THE SELECTION RULE. On `O ℚ` the physical stratum is NONEMPTY (contains the
    trivial standpoint `1`) AND PROPER (some state is forbidden). A genuine selection
    rule on states — the physics: the gather keeps `1` and forbids the non-associating
    standpoints. On the smooth rungs the stratum is the WHOLE space (no selection);
    here it is a proper nonempty subset (physics). -/
theorem o_stratum_proper_nonempty :
    GluesGlobally (1 : O ℚ) ∧ ¬ ∀ a : O ℚ, GluesGlobally a :=
  ⟨one_gluesGlobally, o_not_all_physical⟩

/-! ## THE SECTOR ⟺ STATE TIE (N385). -/

/-- THE SECTOR TOTALIZES IFF EVERY STATE IS PHYSICAL. The whole sector has a global
    section (N385 `SectorGlobalGather`) iff every standpoint is a T-algebra/global
    section (`GluesGlobally`). Definitional tie between the sector-level and
    state-level readings of the gather. -/
theorem sectorGather_iff_all_physical (A : Type*) [Mul A] :
    SectorGlobalGather A ↔ ∀ a : A, GluesGlobally a := by
  simp only [SectorGlobalGather, GluesGlobally]

/-- ★ CONFINEMENT IS THE EXISTENCE OF AN UNPHYSICAL STATE. The sector CONFINES (N385
    `SectorConfines`, no global section) iff some standpoint FAILS to be a global
    section (`¬ GluesGlobally a`). Confinement = the selection rule forbidding at
    least one state. -/
theorem confines_iff_some_unphysical (A : Type*) [Mul A] :
    SectorConfines A ↔ ∃ a : A, ¬ GluesGlobally a := by
  simp only [SectorConfines, SectorGlobalGather, GluesGlobally, not_forall]

/-! ## THE CAPSTONE — physical states = T-algebras = glued global sections. -/

/-- ★★★ THE PHYSICAL-STATE / T-ALGEBRA STRUCTURE on the banked gather-monad. A state
    is PHYSICAL (`GluesGlobally`) iff it is a T-algebra / global section over the
    gather-monad (N411):
      • physical ⟺ the N219 gluing obstruction vanishes universally;
      • physical ⟺ the N411 monad μ-comparison defect vanishes universally;
      • the trivial standpoint `1` is always physical (η is a global section);
      • on the smooth rungs `Dbl ℚ`, `H ℚ` EVERY state is physical (no selection);
      • on `O ℚ` the physical stratum IS the left nucleus, PROPER and NONEMPTY
        (a genuine selection rule = physics);
      • the sector totalizes iff EVERY state is physical, and confines iff some
        state is not (N385 tie).
    Physics-words-removable: pure left-nucleus / regular-representation algebra on
    the derived tower `Dbl/H/O ℚ`. -/
theorem physical_state_talgebra_structure :
    -- physical ⟺ the obstruction / the monad μ-comparison vanishes universally
    (∀ a : O ℚ, GluesGlobally a ↔ ∀ b : O ℚ, gluingDefect a b = 0) ∧
    (∀ a : O ℚ, GluesGlobally a ↔ ∀ b : O ℚ, barMultDefect a b = 0) ∧
    -- η (trivial standpoint) is always a global section
    GluesGlobally (1 : O ℚ) ∧
    -- smooth rungs: every state physical (no selection = no physics)
    (∀ a : Dbl ℚ, GluesGlobally a) ∧
    (∀ a : H ℚ, GluesGlobally a) ∧
    -- octonion stratum = the left nucleus
    (∀ a : O ℚ, GluesGlobally a ↔ ∀ b : O ℚ, (fun x => Phys.Algebra.assoc a b x) = 0) ∧
    -- the selection rule: the stratum is PROPER and NONEMPTY
    (GluesGlobally (1 : O ℚ) ∧ ¬ ∀ a : O ℚ, GluesGlobally a) ∧
    -- the sector ⟺ state tie (N385)
    (SectorGlobalGather (O ℚ) ↔ ∀ a : O ℚ, GluesGlobally a) ∧
    (SectorConfines (O ℚ) ↔ ∃ a : O ℚ, ¬ GluesGlobally a) :=
  ⟨fun a => gluesGlobally_iff_defect a, fun a => gluesGlobally_iff_barDefect a,
    one_gluesGlobally, dbl_all_physical, h_all_physical,
    o_gluesGlobally_iff_nucleus, o_stratum_proper_nonempty,
    sectorGather_iff_all_physical (O ℚ), confines_iff_some_unphysical (O ℚ)⟩

end Phys.Algebra
