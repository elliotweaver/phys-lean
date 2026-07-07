# N412 (arc-N N2) — PREREG: PHYSICAL STATES = T-ALGEBRAS = GLUED GLOBAL SECTIONS

## Target (theory-native, DERIVED — theorem-route, no numbers)
A STATE is PHYSICAL iff it GLUES globally — iff it is a T-algebra / global section over the
banked gather-monad (N411). On the smooth (associative) rungs EVERY state glues (no selection =
no physics); on O ℚ the physical stratum is PROPER and NONEMPTY (a genuine selection rule = physics).

Module: `Phys/Algebra/TowerGatherPhysicalState.lean` (ns `Phys.Algebra`).

## The object (NEW; not banked by N385/N411)
`GluesGlobally a := ∀ b, WorldsGlue a b` — the STATE-level physicality predicate: standpoint `a`'s
world composes strictly with EVERY other world (a lies in the left nucleus). This is the T-algebra /
global-section condition on the gather-monad, at the level of individual states (N385 works at the
SECTOR level `∀ a b`, N411 at the obstruction-OBJECT level; neither banks the per-state stratum).

## Theorems (each cites banked objects; every magnitude theorem on concrete banked rungs)
1. `gluesGlobally_iff_defect` (generic NonAssocRing): `GluesGlobally a ↔ ∀ b, gluingDefect a b = 0`
   — physical = gluing obstruction vanishes universally. [N219 worlds_glue_iff_gluingDefect_zero]
2. `gluesGlobally_iff_barDefect` (generic NonAssocRing): `GluesGlobally a ↔ ∀ b, barMultDefect a b = 0`
   — physical = fixed point of the monad μ-comparison (the T-algebra structure map is strict). [N411]
3. `one_gluesGlobally` (generic MulOneClass): `GluesGlobally (1 : A)` — η (trivial standpoint) is
   always a global section. [N411 worldMap_one]
4. `dbl_all_physical` / `h_all_physical`: `∀ a : Dbl/H ℚ, GluesGlobally a` — smooth/associative
   rung: EVERY state physical, no selection = no physics. [N218T dbl/h_worlds_glue]
5. `o_gluesGlobally_iff_nucleus (a : O ℚ)`: `GluesGlobally a ↔ ∀ b, (fun x => assoc a b x) = 0` —
   on the octonion rung the physical stratum IS the left nucleus (associator vanishes). [N219]
6. `o_not_all_physical`: `¬ ∀ a : O ℚ, GluesGlobally a` — the stratum is PROPER (physics forbids
   some states). [N218T o_worlds_not_glue]  W8 non-vacuity.
7. `o_stratum_proper_nonempty`: `(GluesGlobally (1 : O ℚ)) ∧ (¬ ∀ a : O ℚ, GluesGlobally a)` — the
   physical stratum on O ℚ is NONEMPTY and PROPER = the genuine selection rule.
8. `sectorGather_iff_all_physical (A)`: `SectorGlobalGather A ↔ ∀ a, GluesGlobally a` — the whole
   sector totalizes iff EVERY state is a T-algebra/global section. [N385 def tie]
9. `confines_iff_some_unphysical (A)`: `SectorConfines A ↔ ∃ a, ¬ GluesGlobally a` — the sector
   confines iff some state fails to be a global section. [N385]
10. capstone `physical_state_talgebra_structure`.

## Standard checks
- UNBROKEN: imports only banked N411/N385/N219/N218T + derived tower. Standard Mathlib machinery
  (NonAssocRing/MulOneClass/Function) on derived objects.
- COMPLETE: foundations-only ⊆ {propext, Classical.choice, Quot.sound}; no sorry/axiom/native_decide.
- WORDS-REMOVABLE: delete physical/state/gather/glue/T-algebra → `∀b, L_a∘L_b=L_{ab}`; iff obstruction
  vanishes; smooth rungs all elements; O ℚ proper nonempty left nucleus; sector ⟺ all elements.
- NOT FREE-FLOATING: every headline TYPE on banked WorldsGlue/gluingDefect/barMultDefect/assoc/
  SectorGlobalGather on Dbl/H/O ℚ; NOT an abstract CategoryTheory.Monad.Algebra.
- HOLLOW-AND BAN: new predicate + 3 characterizations + unit-physicality + all-physical-smooth +
  proper-nonempty stratum + sector⟺state tie; NOT a bare ∧ of N385/N411.
- W8: costume C437 (proper-nonempty stratum genuine); bites 1=437.

## Cost budget / KILL
All obligations are short structural rewrites (unfold + funext + banked lemma). Budget: any single
obligation > 60s in a bounded probe = decompose. Expected all < 5s (no coordinate expansion).

## Successor (ONE): arc-N N3 (obstruction unification — the ★ capstone joint), per SEED §N2→§N3.
