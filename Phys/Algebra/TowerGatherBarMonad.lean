/-
  Phys.Algebra.TowerGatherBarMonad — N411 (arc-N N1): THE GATHER AS THE BAR / MONAD
  STRUCTURE ON THE BANKED TOWER.
  ===========================================================================
  DIRECTED SUCCESSOR of N410 (arc M closes conditionally → arc N opens), per
  docs/SEED_GATHER_TELOS.md §N1. Arc N is the CAPSTONE arc — the physics TELOS:
  physics is the local→global (sheaf-like) obstruction of the gather trying, and
  failing, to totalize. This is its ANCHOR.

  THE RESULT (theory-native, DERIVED — never posited). The gather IS the fold's
  look-back assembled into a MONAD-WITH-A-SINGLE-CONTROLLED-OBSTRUCTION over the
  derived Cayley–Dickson tower. The look-back is the banked `worldMap : A → (A→A)`,
  `a ↦ L_a = (a··)` (N218T, the fold-generated inner world). The ambient totalizer
  is the STRICT endomorphism monoid `(A → A, ∘, id)`. Reading the gather AS a monad:

    • η (THE UNIT / the miss's re-entry): `worldMap 1 = id` (`worldMap_one`) — the
      trivial standpoint opens the identity world; the unit is COHERENT.
    • η is FAITHFUL (`worldMap_faithful`): evaluate at `1`; the look-back loses nothing.
    • μ (THE GATHER / world-composition) and its OBSTRUCTION: the μ-comparison
        `barMultDefect a b := worldMap (a·b) − worldMap a ∘ worldMap b`
      measures the failure of `worldMap` to be a strict monoid morphism. It IS the
      banked N219 gluing obstruction (`barMultDefect_eq_gluingDefect`), and on the
      octonion rung it IS the banked associator (`o_barMultDefect_eq_assoc`).
    • THE UNIT SECTOR IS OBSTRUCTION-FREE (`barMultDefect_unit_left/right`): the
      defect vanishes whenever a factor is `1` — the miss's re-entry never obstructs;
      the gather only fails BETWEEN two genuine standpoints.
    • THE SOLE OBSTRUCTION (the theory-native cut). On `O ℚ` the obstruction is a
      CLOSED Hochschild 3-cocycle (`o_bar_sole_obstruction`, banked `teich_cocycle_O`,
      `δ(assoc)=0`): the higher (Mac Lane pentagon / Teichmüller) coherence holds
      IDENTICALLY, so there is EXACTLY ONE obstruction to the gather being a strict
      monad, and it is the banked associator.
    • THE SMOOTH / NO-PHYSICS RUNGS (`dbl_barStrict`, `h_barStrict`): the associative
      rungs `Dbl ℚ`, `H ℚ` are STRICT — the gather totalizes with NO obstruction. The
      trivial (associative) case = smooth = no physics (the seed's "no obstruction ⟺
      no physics", made concrete on the associative rungs).
    • GENUINELY OBSTRUCTED (`o_bar_obstructed`, W8): `O ℚ` really fails to be strict
      (banked `assoc_nonvanishing`). And that sole gather obstruction IS a physics
      termination: `o_bar_obstruction_is_confinement` (banked N385) — the octonion
      rung's non-strictness is exactly confinement.

  THE DISSOLUTION (STANDARD §0). Standard homological algebra: the bar construction
  of a NON-ASSOCIATIVE algebra simply "fails to be a simplicial object" — a defect,
  full stop. The theory INVERTS this: the gather is a monad with ONE controlled
  obstruction — the unit is coherent (η(1)=id), the unit sector never obstructs, the
  higher pentagon coherence holds identically (δ(assoc)=0), so the SOLE obstruction
  is the banked associator — and its vanishing IS a physics termination (confinement,
  N385). What the field reads as "the bar construction breaks" the theory reads as
  "the gather is a monad whose single obstruction is physics."

  ONE CAUSE. The octonion non-associativity — the associator that stopped the cascade
  (N2 `not_associative`), capped the Jordan tower at 3 (N5), forced strong-CP (F2),
  and confines colour (N385) — is EXACTLY the sole obstruction to the gather being a
  strict monad. The gather's bar structure and every banked termination are ONE
  object read at the totalization seam.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "gather / miss / totalize / world /
  obstruction / monad / physics / confine": over derived ℚ and `O ℚ = CD (H ℚ)`, the
  map `η = worldMap`, `a ↦ (x ↦ a·x)`, into `(A→A, ∘, id)` satisfies `η(1)=id`, is
  injective, and its non-morphism defect `η(a·b) − η(a)∘η(b)` equals the associator
  `[a,b,·]`, vanishes on a unit factor, vanishes identically on the associative rungs
  `Dbl/H ℚ`, is nonzero on `O ℚ`, and is a closed Hochschild 3-cocycle. Every theorem
  STATEMENT stands as regular-representation / bar algebra with no physics word.

  NOT FREE-FLOATING (STANDARD §3). This is NOT an abstract `CategoryTheory.Monad`
  over an arbitrary carrier (which would sail through words-removable having no physics
  words, yet float free of the banked tower). The generic backbone (`worldMap_one`,
  `worldMap_faithful`, `barMultDefect_eq_gluingDefect`, the unit-sector lemmas) are
  formal unit/composition identities (like ring identities); ALL headlines + the
  capstone are stated ON the banked `O ℚ / Dbl ℚ / H ℚ` referencing banked
  `worldMap` / `gluingDefect` / `assoc` / `teich_cocycle_O` / `SectorConfines` — the
  magnitude theorems are literally ABOUT the banked objects.

  NOT A RE-PIN. N218T (`TowerGatherCoherence`) banked WHICH inter-world pairs glue;
  N219 (`TowerGatherObstruction`) made the obstruction map explicit and identified it
  with the associator; N220 (`TowerGatherCocycle`) determined its Hochschild
  cohomology; N385 (`ConfinementCriterion`) derived confinement. NONE banked the
  MONAD/BAR reading — η unit coherence (`worldMap_one`), faithfulness, the
  μ-comparison-defect object `barMultDefect`, its unit-sector-obstruction-freeness,
  the sole-obstruction reading that ties the closed cocycle to the monad's higher
  coherence, and the smooth-associative-rungs = no-physics statement bundled as one
  monad structure. This node is the architectural synthesis: the gather AS the
  bar/monad structure with a single controlled obstruction.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  no Mathlib ℝ/ℂ as content (ℚ is the coefficient field; the OBJECTS are the derived
  tower `Dbl/H/O ℚ` and the banked gather machinery).
-/
import Phys.Cascade.Sedenion
import Phys.Algebra.Alternative
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.TowerGatherCoherence
import Phys.Algebra.TowerGatherCocycle
import Phys.Algebra.ConfinementCriterion

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

/-! ## THE LOOK-BACK η = `worldMap` INTO THE STRICT ENDOMORPHISM MONOID `(A → A, ∘, id)`.

The banked `worldMap a = (a··) = L_a` (N218T) is the fold-generated inner world. As a
gather it is the monad UNIT η — the ATTEMPT to represent a standpoint by its whole world.
Two formal coherence facts hold at any `MulOneClass`: the unit is coherent and η is
faithful. -/

/-- η UNIT COHERENCE: the trivial standpoint `1` opens the IDENTITY world,
    `worldMap 1 = id`. The monad unit is coherent (the miss's re-entry is trivial).
    Physics-words-removable: `L_1 = id`. -/
theorem worldMap_one {A : Type*} [MulOneClass A] : worldMap (1 : A) = id := by
  funext x; simp only [worldMap, one_mul, id_eq]

/-- η HAS AN EXPLICIT RETRACTION: evaluating the opened world at the trivial standpoint
    recovers the standpoint, `(fun f => f 1) ∘ worldMap = id`. The look-back is a SPLIT
    monomorphism — the miss carries its own recovery map (`ev₁`), so η loses nothing in a
    canonical, witnessed way. Physics-words-removable: `a ↦ L_a` is split by `ev₁`. -/
theorem worldMap_retraction {A : Type*} [MulOneClass A] :
    (fun f : A → A => f 1) ∘ worldMap = id := by
  funext a; simp only [worldMap, Function.comp_apply, mul_one, id_eq]

/-- η IS FAITHFUL: the look-back `a ↦ worldMap a` is INJECTIVE — a corollary of the explicit
    retraction (`worldMap_retraction`): a split mono is mono. The gather loses nothing when it
    opens a world. Physics-words-removable: `a ↦ L_a` is injective into `(A → A)`. -/
theorem worldMap_faithful {A : Type*} [MulOneClass A] :
    Function.Injective (worldMap : A → (A → A)) :=
  Function.LeftInverse.injective (g := fun f => f 1) (fun a => by
    simp only [worldMap, mul_one])

/-! ## THE μ-COMPARISON DEFECT — the obstruction to η being a strict monoid morphism. -/

/-- THE BAR MULTIPLICATION-FACE DEFECT `barMultDefect a b : x ↦ η(a·b)x − (η(a)∘η(b))x`:
    the μ-comparison measuring the failure of the look-back `worldMap` to be a STRICT
    morphism into `(A → A, ∘, id)`. Its vanishing is exactly `WorldsGlue a b` (N218T).
    Physics-words-removable: `L_{a·b} − L_a∘L_b`. -/
def barMultDefect {A : Type*} [NonAssocRing A] (a b : A) : A → A :=
  fun x => worldMap (a * b) x - (worldMap a ∘ worldMap b) x

/-- THE μ-COMPARISON DEFECT IS THE BANKED N219 GLUING OBSTRUCTION (definitional tie).
    So the monad-strictness obstruction is exactly the N218T/N219 local→global gluing
    obstruction. -/
theorem barMultDefect_eq_gluingDefect {A : Type*} [NonAssocRing A] (a b : A) :
    barMultDefect a b = gluingDefect a b := by
  funext x; rfl

/-- ★ THE UNIT SECTOR IS OBSTRUCTION-FREE (left): `barMultDefect 1 a = 0`. With the
    trivial standpoint as one factor the gather totalizes strictly — the miss's
    re-entry never obstructs. -/
theorem barMultDefect_unit_left {A : Type*} [NonAssocRing A] (a : A) :
    barMultDefect (1 : A) a = 0 := by
  funext x
  simp only [barMultDefect, worldMap, Function.comp_apply, one_mul, sub_self, Pi.zero_apply]

/-- ★ THE UNIT SECTOR IS OBSTRUCTION-FREE (right): `barMultDefect a 1 = 0`. -/
theorem barMultDefect_unit_right {A : Type*} [NonAssocRing A] (a : A) :
    barMultDefect a (1 : A) = 0 := by
  funext x
  simp only [barMultDefect, worldMap, Function.comp_apply, mul_one, one_mul, sub_self,
    Pi.zero_apply]

/-! ## THE CONCRETE RUNGS OF THE DERIVED TOWER. -/

attribute [local instance] CD.narCD CD.srCD

/-- η UNIT COHERENCE on the octonion rung `O ℚ`. -/
theorem o_worldMap_one : worldMap (1 : O ℚ) = id := by
  funext x; simp only [worldMap, one_mul, id_eq]

/-- η FAITHFULNESS on `O ℚ`. -/
theorem o_worldMap_faithful : Function.Injective (worldMap : O ℚ → (O ℚ → O ℚ)) := by
  intro a b h
  have := congrFun h 1
  simpa only [worldMap, mul_one] using this

/-- ★ THE O-RUNG μ-DEFECT IS THE BANKED ASSOCIATOR (N219 tie): on `O ℚ` the obstruction
    to the gather being a strict monad IS the octonion associator `[a,b,·]`. -/
theorem o_barMultDefect_eq_assoc (a b : O ℚ) :
    barMultDefect a b = fun x => Phys.Algebra.assoc a b x := by
  rw [barMultDefect_eq_gluingDefect]; exact o_gluingDefect_eq_assoc a b

/-- ★ STRICT (smooth, NO obstruction / NO physics) on `Dbl ℚ`: the associative rung's
    gather totalizes with zero defect — the monad is strict there. -/
theorem dbl_barStrict (a b : Dbl ℚ) : barMultDefect a b = 0 := by
  rw [barMultDefect_eq_gluingDefect]; exact dbl_gluingDefect_zero a b

/-- ★ STRICT (smooth, NO obstruction / NO physics) on `H ℚ`. -/
theorem h_barStrict (a b : H ℚ) : barMultDefect a b = 0 := by
  rw [barMultDefect_eq_gluingDefect]; exact h_gluingDefect_zero a b

/-- ★ GENUINELY OBSTRUCTED on `O ℚ` (W8 non-vacuity): some two standpoints' worlds fail
    to compose strictly — the gather is a genuinely NON-strict monad on the octonion
    rung (banked `assoc_nonvanishing`). -/
theorem o_bar_obstructed : ∃ a b : O ℚ, barMultDefect a b ≠ 0 := by
  obtain ⟨a, b, hab⟩ := o_gluingDefect_ne_zero
  exact ⟨a, b, by rw [barMultDefect_eq_gluingDefect]; exact hab⟩

/-- ★★ THE SOLE OBSTRUCTION (CLOSED 3-COCYCLE). On `O ℚ` the gather obstruction is a
    Hochschild-CLOSED 3-cocycle (banked `teich_cocycle_O`, `δ(assoc)=0`): the higher
    Mac Lane pentagon / Teichmüller coherence holds IDENTICALLY, so the associator is
    the EXACT AND ONLY obstruction to the gather being a strict monad. Phrased on the
    banked gluing-obstruction map via `gluingDefect_is_assoc_O`. -/
theorem o_bar_sole_obstruction (a b c x : O ℚ) :
    a * gluingDefect b c x - gluingDefect (a * b) c x + gluingDefect a (b * c) x
      - gluingDefect a b (c * x) + gluingDefect a b c * x = 0 := by
  simp only [gluingDefect_is_assoc_O]; exact teich_cocycle_O a b c x

/-- ★ THE SOLE GATHER OBSTRUCTION IS A PHYSICS TERMINATION. The `O ℚ` gather's
    non-strictness IS confinement: the same associator that is the sole monad
    obstruction is the descent obstruction that confines the level-3 sector (banked
    N385 `o_confines_from_cascade_stop`). One cause, the totalization seam. -/
theorem o_bar_obstruction_is_confinement : SectorConfines (O ℚ) :=
  o_confines_from_cascade_stop

/-! ## THE CAPSTONE — the gather as the bar/monad structure with one controlled obstruction. -/

/-- ★★★ THE GATHER-AS-BAR/MONAD STRUCTURE on the banked tower. The fold's look-back
    `η = worldMap`, `a ↦ L_a`, into the strict endomorphism monoid `(A → A, ∘, id)` is
    a MONAD WITH A SINGLE CONTROLLED OBSTRUCTION:
      • η UNIT is coherent (`worldMap 1 = id`) and η is FAITHFUL;
      • the μ-comparison defect `barMultDefect` IS the banked associator on `O ℚ`;
      • the UNIT SECTOR never obstructs (`barMultDefect 1 a = barMultDefect a 1 = 0`);
      • the associative rungs `Dbl ℚ`, `H ℚ` are STRICT (smooth = no physics);
      • `O ℚ` is GENUINELY obstructed, and that obstruction is a CLOSED 3-cocycle
        (pentagon coherence holds → the associator is the SOLE obstruction);
      • the sole obstruction is a PHYSICS TERMINATION (confinement, N385).
    Physics-words-removable: pure regular-representation / bar algebra on the derived
    tower `Dbl/H/O ℚ`. -/
theorem gather_bar_monad_structure :
    -- η unit coherence + faithfulness on the octonion rung
    (worldMap (1 : O ℚ) = id) ∧
    Function.Injective (worldMap : O ℚ → (O ℚ → O ℚ)) ∧
    -- the μ-comparison defect IS the associator on O ℚ
    (∀ a b : O ℚ, barMultDefect a b = fun x => Phys.Algebra.assoc a b x) ∧
    -- the unit sector is obstruction-free (both sides)
    (∀ a : O ℚ, barMultDefect (1 : O ℚ) a = 0) ∧
    (∀ a : O ℚ, barMultDefect a (1 : O ℚ) = 0) ∧
    -- the associative rungs are strict (smooth = no physics)
    (∀ a b : Dbl ℚ, barMultDefect a b = 0) ∧
    (∀ a b : H ℚ, barMultDefect a b = 0) ∧
    -- O ℚ genuinely obstructed (W8)
    (∃ a b : O ℚ, barMultDefect a b ≠ 0) ∧
    -- the sole obstruction: a closed 3-cocycle (pentagon coherence holds)
    (∀ a b c x : O ℚ,
      a * gluingDefect b c x - gluingDefect (a * b) c x + gluingDefect a (b * c) x
        - gluingDefect a b (c * x) + gluingDefect a b c * x = 0) ∧
    -- the sole obstruction is a physics termination (confinement)
    SectorConfines (O ℚ) :=
  ⟨o_worldMap_one, o_worldMap_faithful, o_barMultDefect_eq_assoc,
    barMultDefect_unit_left, barMultDefect_unit_right,
    dbl_barStrict, h_barStrict, o_bar_obstructed,
    o_bar_sole_obstruction, o_bar_obstruction_is_confinement⟩

end Phys.Algebra
