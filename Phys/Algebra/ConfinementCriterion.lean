/-
  Phys.Algebra.ConfinementCriterion — N385 (arc-I I1): THE CONFINEMENT CRITERION.
  ============================================================================
  DIRECTED SUCCESSOR of N384 (arc-H complete → arc-I opens), per
  docs/SEED_QCD_CONFINEMENT.md §I1. The anchor of the QCD arc.

  THE RESULT (theory-native, DERIVED — never asserted). A cascade sector CONFINES
  IFF its algebra is NON-ASSOCIATIVE:

        confines_iff_not_assoc :  SectorConfines A  ↔  ¬ SectorAssoc A.

  Concretely along the derived Cayley–Dickson tower:
    • `Dbl ℚ` (level 1, associative)  → does NOT confine (`dbl_not_confines`);
    • `H ℚ`   (level 2, associative)  → does NOT confine (`h_not_confines`);
    • `O ℚ`   (level 3, NON-associative) → DOES confine (`o_confines`).

  THE MECHANISM — the sheafification / descent obstruction (the banked gather side,
  N218T `TowerGatherCoherence` + N219 `TowerGatherObstruction`). A fold-generated
  INNER WORLD is the left regular action `worldMap a = (a··) = L_a`. A consistent
  GLOBAL section — a single global world assembled from the local ones — requires
  every pair of local worlds to GLUE: `L_a ∘ L_b = L_{a·b}` (the banked
  `WorldsGlue`). This is exactly a descent condition: agreement of the local
  reorganizations on their overlaps. We prove it glues globally IFF the sector is
  associative (`globalGather_iff_assoc`); so NO global section exists — the sector
  is CONFINED — precisely when it is non-associative.

  THE LOAD-BEARING JOINT J-I1 (DERIVED, not asserted). On `O ℚ` the descent
  obstruction to gluing IS the banked octonion associator:
        gluingDefect a b = fun x => assoc a b x         (`o_gluingDefect_eq_assoc`),
  and it is genuinely nonzero (`o_worlds_not_glue`, the banked
  `not_associative_witness`). So the octonion associator — the SAME obstruction that
  stopped the cascade (N2 `not_associative`), capped the Jordan tower at 3 (N5), and
  forced strong-CP (F2) — is EXACTLY the obstruction to sheafifying colour-valued
  sections. One cause, a new termination: `o_confines_from_cascade_stop` derives
  confinement of the level-3 sector directly from `not_associative`.

  This is NOT an SU(3) gauge-cocycle statement and does NOT assume "SU(3) confines".
  Gauge transition functions compose associatively; the coherence obstruction lives
  in the octonion VALUES (the associator), not in the group. The criterion is a
  purely structural fact about which subalgebra-valued sections possess a global
  descent section.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "confine", "colour",
  "quark", "hadron", "sector": `SectorGlobalGather A = ∀ a b, L_a∘L_b = L_{a·b}`,
  `SectorConfines A = ¬ that`, and the theorems say a rung's local regular actions
  assemble into one global multiplicative action IFF the rung is associative — a
  pure statement about the descent of the left regular representation. No physics
  name is load-bearing.

  DEPENDENCIES (all banked, foundations-only): N219
  `Phys.Algebra.TowerGatherObstruction` (`gluingDefect`, `o_gluingDefect_eq_assoc`,
  the staircase), N218T `Phys.Algebra.TowerGatherCoherence` (`worldMap`,
  `WorldsGlue`, `dbl/h_worlds_glue`, `o_worlds_not_glue`), the banked associator
  `Phys.Algebra.assoc` and the cascade stop `Phys.Cascade.not_associative`.
-/
import Phys.Algebra.TowerGatherObstruction
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

/-! ## The descent / gather predicate and the confinement predicate. -/

/-- THE GLOBAL-GATHER (descent) CONDITION: every pair of local worlds glues into one
    global world — i.e. the left-regular world-assignment `a ↦ L_a` is a homomorphism
    into `(A → A, ∘)` on ALL of `A`. A consistent GLOBAL section exists exactly when
    this holds. Physics-words-removable: it is `∀ a b, L_a ∘ L_b = L_{a·b}`. -/
def SectorGlobalGather (A : Type*) [Mul A] : Prop := ∀ a b : A, WorldsGlue a b

/-- A SECTOR CONFINES when its local worlds do NOT all glue — no global section can be
    assembled. Physics-words-removable: `¬ (∀ a b, L_a ∘ L_b = L_{a·b})`. -/
def SectorConfines (A : Type*) [Mul A] : Prop := ¬ SectorGlobalGather A

/-- Associativity of the sector's product. -/
def SectorAssoc (A : Type*) [Mul A] : Prop := ∀ a b c : A, (a * b) * c = a * (b * c)

/-! ## The criterion. -/

/-- The local worlds gather into ONE global world (a global section exists) IFF the
    sector is associative. This is the descent condition made explicit: the left
    regular representation is a global homomorphism exactly when the product
    associates. -/
theorem globalGather_iff_assoc (A : Type*) [Mul A] :
    SectorGlobalGather A ↔ SectorAssoc A := by
  constructor
  · intro hg a b c
    have := congrFun (hg a b) c
    simp only [worldMap, Function.comp_apply] at this
    exact this.symm
  · intro ha a b
    funext x
    simp only [worldMap, Function.comp_apply]
    exact (ha a b x).symm

/-- ★ THE CONFINEMENT CRITERION. A cascade sector CONFINES iff its algebra is
    NON-ASSOCIATIVE. Derived from the descent condition `globalGather_iff_assoc`:
    no global section exists precisely when the product fails to associate, and the
    obstruction to gluing is the sector's associator (`gluingDefect`, N219). -/
theorem confines_iff_not_assoc (A : Type*) [Mul A] :
    SectorConfines A ↔ ¬ SectorAssoc A := by
  simp only [SectorConfines, globalGather_iff_assoc]

/-! ## The three concrete rungs of the derived tower. -/

/-- RUNG 1 — `Dbl ℚ` (associative) does NOT confine: its local worlds all glue, so a
    global section exists. -/
theorem dbl_not_confines : ¬ SectorConfines (Dbl ℚ) := by
  simp only [SectorConfines, not_not]
  exact dbl_worlds_glue

/-- RUNG 2 — `H ℚ` (associative) does NOT confine: its local worlds all glue, so a
    global section exists. -/
theorem h_not_confines : ¬ SectorConfines (H ℚ) := by
  simp only [SectorConfines, not_not]
  exact h_worlds_glue

attribute [local instance] CD.narCD CD.srCD

/-- ★ RUNG 3 — `O ℚ` (NON-associative) DOES confine: some two local worlds fail to
    glue (`o_worlds_not_glue`), so no global section can be assembled. -/
theorem o_confines : SectorConfines (O ℚ) := by
  simp only [SectorConfines, SectorGlobalGather]
  intro hg
  obtain ⟨a, b, hab⟩ := o_worlds_not_glue
  exact hab (hg a b)

/-! ## The load-bearing joint J-I1 and the ONE-CAUSE tie. -/

/-- J-I1 (THE CONFINEMENT JOINT). On `O ℚ` the descent obstruction to gluing the
    local worlds IS the banked octonion associator: `gluingDefect a b = [a,b,·]`.
    So the confinement of the level-3 sector is caused by the octonion associator —
    the same object that stopped the cascade — not by any posited gauge assumption. -/
theorem o_confinement_obstruction_eq_associator (a b : O ℚ) :
    gluingDefect a b = fun x => Phys.Algebra.assoc a b x :=
  o_gluingDefect_eq_assoc a b

/-- ★ ONE CAUSE, A NEW TERMINATION. The level-3 sector confines DIRECTLY BECAUSE the
    cascade lost associativity at `O ℚ` (`Phys.Cascade.not_associative`). The strong
    force is the same octonion non-associativity read through the descent obstruction. -/
theorem o_confines_from_cascade_stop : SectorConfines (O ℚ) :=
  (confines_iff_not_assoc (O ℚ)).mpr not_associative

/-! ## The staircase capstone. -/

/-- ★★ THE CONFINEMENT STAIRCASE. Along the derived Cayley–Dickson tower: the two
    associative rungs (`Dbl ℚ`, `H ℚ`) do NOT confine; the non-associative rung
    (`O ℚ`) DOES; and on that rung confinement IS non-associativity. The confinement
    criterion, banked as one bundle over the concrete banked objects. -/
theorem confinement_staircase :
    (¬ SectorConfines (Dbl ℚ)) ∧
    (¬ SectorConfines (H ℚ)) ∧
    (SectorConfines (O ℚ)) ∧
    (SectorConfines (O ℚ) ↔ ¬ SectorAssoc (O ℚ)) :=
  ⟨dbl_not_confines, h_not_confines, o_confines, confines_iff_not_assoc (O ℚ)⟩

end Phys.Algebra
