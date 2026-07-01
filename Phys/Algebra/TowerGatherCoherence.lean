/-
  Phys.Algebra.TowerGatherCoherence — N218T: THE GATHER ON THE TOWER.
  ===========================================================================
  The rung-by-rung behaviour of INTER-WORLD GLUING across the derived
  Cayley–Dickson tower `Dbl ℚ → H ℚ → O ℚ → S ℚ`.

  THE OBJECT (derived, not posited). A fold-generated INNER WORLD is a standpoint
  `a` of a rung TOGETHER WITH the whole algebra reorganized through it — the left
  regular action `worldMap a := (a · ·) : A → A` (the world that standpoint `a`
  opens; the banked algebra viewed AS a world). A GATHER is a family of such
  worlds. The INTER-WORLD GLUING question (the local→global / sheaf-like seam) is
  whether two distinct worlds COMPOSE into the world of the composite standpoint:
        `WorldsGlue a b  :≡  worldMap a ∘ worldMap b = worldMap (a · b)`,
  i.e. whether the world-assignment `a ↦ worldMap a` is a homomorphism into the
  composition monoid `(End A, ∘)` (the LEFT REGULAR REPRESENTATION being
  multiplicative). This is NOT the interior grammar of one algebra (whether its
  own elements associate): the objects GATHERED are whole-world transformations,
  and the coherence asked of them is an INTER-world fact — do the separate worlds
  glue into one shared global world.

  WHAT THE TOWER ANSWERS (discovered rung by rung; each clause a proved theorem,
  each positive a citation of a banked cascade fact):

    RUNG Dbl ℚ (the doubled line).  EVERY pair of worlds glues, and glues
      SYMMETRICALLY: `worldMap a ∘ worldMap b = worldMap b ∘ worldMap a`.
      (Cause: `Dbl ℚ` is commutative & associative — the regular rep is an abelian
      monoid homomorphism.)                                    [FULL coherence]

    RUNG H ℚ (the double of the line's double).  EVERY pair still glues, but NO
      LONGER symmetrically: some two worlds compose order-dependently.
      (Cause: `H ℚ` is associative — glue survives — but non-commutative
      — `not_commutative_witness` — so the glue is order-dependent.)  [ORDER-DEPENDENT glue]

    RUNG O ℚ (the octonion rung).  Distinct worlds NO LONGER glue pairwise, but a
      world still SELF-glues: `worldMap a ∘ worldMap a = worldMap (a·a)`.
      (Cause: `O ℚ` is NOT associative — `not_associative_witness` kills pairwise
      glue — yet it stays LEFT-ALTERNATIVE — `Phys.Algebra.mul_mul_left` — so the
      regular rep is still an idempotent-consistent self-map.)     [SELF-glue only]

    RUNG S ℚ (past the stop).  Even SELF-gluing FAILS: some world does not compose
      with itself into the world of its square.
      (Cause: `S ℚ` has LOST left-alternativity — the same rung, and the same
      structural fact, at which the Born self-overlap / composition law fails,
      `Phys.Cascade.born_law_fails`.)                              [NO coherence]

  THE DISCOVERED CONTENT — RUNG-DEPENDENCE (ROADMAP §HUMAN-GATED FRONTIER TURN).
  Gather-coherence does not hold uniformly and does not fail uniformly: it DEGRADES
  in a FORCED FOUR-STEP STAIRCASE as the cascade climbs
      symmetric-glue  ⟶  ordered-glue  ⟶  self-glue-only  ⟶  no-glue,
  one step lost at each doubling, each loss caused by exactly the algebraic property
  that doubling destroys (commutativity → associativity → left-alternativity). The
  LAST rung at which a world still coheres WITH ITSELF is `O ℚ` — the SAME terminal
  rung at which the cascade stops (the Born self-overlap law holds through `O` and
  fails at `S`, `Phys/Cascade/Sedenion.lean`). Self-gluing IS the regular-rep shadow
  of the composition / Born = self-overlap law; the gather coheres with itself
  exactly as far as the self-overlap norm stays multiplicative. Nothing here is
  posited: the staircase is read off the banked cascade losses, and the capstone
  `gather_staircase` exhibits all four DISTINCT behaviours in one statement (a
  single rung-uniform theorem could not).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "world / gather / glue":
  `worldMap a = leftAct a` is left multiplication `L_a`, `WorldsGlue a b` is
  `L_a ∘ L_b = L_{a·b}` (the regular representation is multiplicative), and the
  four clauses become the pure algebraic statement that the left regular
  representation of the tower is, rung by rung, an abelian-monoid hom, then a
  monoid hom, then only left-alternative, then not even that. Every theorem
  STATEMENT stands as regular-representation algebra with no physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
  Uses ONLY the banked derived tower `Dbl/H/O/S ℚ` and banked cascade theorems.
-/
import Phys.Cascade.Sedenion
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

/-! ## THE INTER-WORLD GLUING PREDICATE. -/

/-- THE WORLD a standpoint `a` opens: the whole algebra reorganized through `a`, the
    LEFT REGULAR ACTION `x ↦ a · x`. Physics-words-removable: `worldMap = leftAct`,
    left multiplication `L_a`. -/
def worldMap {A : Type*} [Mul A] (a : A) : A → A := fun x => a * x

/-- TWO WORLDS GLUE when the composite of their reorganizations IS the reorganization
    of the composite standpoint — i.e. the world-assignment `a ↦ worldMap a` is a
    homomorphism into `(End A, ∘)`: `L_a ∘ L_b = L_{a·b}`. The inter-world / local→global
    coherence question, asked of the gathered whole-world maps (NOT of an algebra's own
    interior elements). -/
def WorldsGlue {A : Type*} [Mul A] (a b : A) : Prop :=
  worldMap a ∘ worldMap b = worldMap (a * b)

/-! ## RUNG `Dbl ℚ` — worlds glue AND glue symmetrically (commutative associative). -/

/-- `Dbl ℚ` worlds always glue: the regular rep is a monoid homomorphism (associativity). -/
theorem dbl_worlds_glue (a b : Dbl ℚ) : WorldsGlue a b := by
  funext x; simp only [WorldsGlue, worldMap, Function.comp_apply]; exact (mul_assoc a b x).symm

/-- `Dbl ℚ` worlds glue SYMMETRICALLY: order of composition does not matter (commutativity).
    The full inter-world coherence — the abelian regular representation. -/
theorem dbl_worlds_symm (a b : Dbl ℚ) :
    worldMap a ∘ worldMap b = worldMap b ∘ worldMap a := by
  funext x; simp only [worldMap, Function.comp_apply]
  rw [← mul_assoc, mul_comm a b, mul_assoc]

/-! ## RUNG `H ℚ` — worlds glue but NOT symmetrically (associative, non-commutative). -/

/-- `H ℚ` worlds still always glue: associativity survives the doubling, so the regular
    rep stays a monoid homomorphism. -/
theorem h_worlds_glue (a b : H ℚ) : WorldsGlue a b := by
  funext x; simp only [WorldsGlue, worldMap, Function.comp_apply]; exact (mul_assoc a b x).symm

/-- ★ `H ℚ` worlds glue ORDER-DEPENDENTLY: some two worlds do NOT compose symmetrically.
    The first coherence step lost — caused by the loss of commutativity
    (`not_commutative_witness`), the rung-2 seed. -/
theorem h_worlds_not_symm :
    ∃ a b : H ℚ, worldMap a ∘ worldMap b ≠ worldMap b ∘ worldMap a := by
  refine ⟨ιJ ℚ, CD.e2, ?_⟩
  intro h
  have := congrFun h 1
  simp only [worldMap, Function.comp_apply, mul_one] at this
  exact not_commutative_witness this

/-! ## RUNG `O ℚ` — distinct worlds do NOT glue pairwise, but a world SELF-glues. -/

attribute [local instance] CD.narCD CD.srCD

/-- ★ `O ℚ` worlds SELF-glue: a world composes with ITSELF into the world of its square,
    `worldMap a ∘ worldMap a = worldMap (a·a)`. Caused by LEFT-ALTERNATIVITY
    (`Phys.Algebra.mul_mul_left`), which the octonion rung keeps even though it is no longer
    associative. -/
theorem o_world_self_glue (a : O ℚ) : WorldsGlue a a := by
  funext x; simp only [WorldsGlue, worldMap, Function.comp_apply]
  exact Phys.Algebra.mul_mul_left a x

/-- ★ `O ℚ` distinct worlds NO LONGER glue pairwise: some two worlds fail to compose into
    the world of their product. The second coherence step lost — caused by the loss of
    associativity (`not_associative_witness`), the rung-3 seed. -/
theorem o_worlds_not_glue :
    ∃ a b : O ℚ, ¬ WorldsGlue a b := by
  refine ⟨CD.iota (ιJ ℚ), CD.iota (CD.e2 : H ℚ), ?_⟩
  intro h
  have := congrFun h (CD.e2 : O ℚ)
  simp only [worldMap, Function.comp_apply] at this
  exact not_associative_witness this.symm

/-! ## RUNG `S ℚ` — even SELF-gluing fails (left-alternativity lost, past the stop). -/

/-- The self-glue-failure witness point in `S ℚ` (`e₄` in flat coordinates; measured by
    exact rational arithmetic, workbench/N218T-gather-on-tower/probes/probe2.py). -/
def wY : S ℚ := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨1, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩⟩

set_option maxHeartbeats 1000000 in
/-- The self-gluing defect is genuine at a single coordinate: for the banked zero-divisor
    standpoint `zdX` and the point `wY`, `(zdX·(zdX·wY))` and `((zdX·zdX)·wY)` disagree in
    their `.im.im.im.im` coordinate (`-2 ≠ 0`). One exact-arithmetic octonion-double
    computation over the cascade ground ring `ℚ`. -/
theorem s_self_glue_fail_coord :
    (zdX * (zdX * wY)).im.im.im.im ≠ ((zdX * zdX) * wY).im.im.im.im := by
  simp only [zdX, wY, CD.mul_re, CD.mul_im,
    Dbl.mul_re, Dbl.mul_im]
  norm_num

set_option maxHeartbeats 1000000 in
/-- ★ `S ℚ` — EVEN SELF-GLUING FAILS: some world does NOT compose with itself into the
    world of its square. The third (final) coherence step lost — caused by the loss of
    LEFT-ALTERNATIVITY at the same rung, and by the same structural fact, at which the
    cascade's Born self-overlap / composition law fails (`Phys.Cascade.born_law_fails`).
    The gather no longer coheres even with itself. -/
theorem s_world_not_self_glue : ∃ a : S ℚ, ¬ WorldsGlue a a := by
  refine ⟨zdX, ?_⟩
  intro h
  have := congrFun h wY
  simp only [worldMap, Function.comp_apply] at this
  exact s_self_glue_fail_coord (congrArg (fun z : S ℚ => z.im.im.im.im) this)

/-! ## THE CAPSTONE — the rung-dependent staircase, all four behaviours in one statement. -/

/-- ★★★ THE GATHER STAIRCASE (rung-dependent). Inter-world gluing across the derived tower
    DEGRADES in a forced four-step staircase, one coherence step lost at each doubling:

      `Dbl ℚ` : every pair glues, and glues SYMMETRICALLY          (abelian regular rep)
      `H ℚ`  : every pair glues, but NOT all symmetrically         (non-abelian regular rep)
      `O ℚ`  : not every pair glues, but every world SELF-glues     (left-alternative rep)
      `S ℚ`  : not even every world self-glues                      (left-alternativity lost)

    A single rung-UNIFORM theorem cannot express this — the behaviour is genuinely
    RUNG-DEPENDENT. The last rung where a world coheres with itself is `O ℚ`, exactly the
    rung where the cascade stops: self-gluing is the regular-representation shadow of the
    Born = self-overlap composition law. Physics-words-removable: this is the statement that
    the tower's left regular representation is, rung by rung, an abelian-monoid hom, a monoid
    hom, only left-alternative, then not even left-alternative. -/
theorem gather_staircase :
    -- Dbl ℚ: full coherence (glue + symmetric)
    (∀ a b : Dbl ℚ, WorldsGlue a b) ∧
    (∀ a b : Dbl ℚ, worldMap a ∘ worldMap b = worldMap b ∘ worldMap a) ∧
    -- H ℚ: glue survives, symmetry lost
    (∀ a b : H ℚ, WorldsGlue a b) ∧
    (∃ a b : H ℚ, worldMap a ∘ worldMap b ≠ worldMap b ∘ worldMap a) ∧
    -- O ℚ: pairwise glue lost, self-glue survives
    (∃ a b : O ℚ, ¬ WorldsGlue a b) ∧
    (∀ a : O ℚ, WorldsGlue a a) ∧
    -- S ℚ: even self-glue lost
    (∃ a : S ℚ, ¬ WorldsGlue a a) :=
  ⟨dbl_worlds_glue, dbl_worlds_symm, h_worlds_glue, h_worlds_not_symm,
    o_worlds_not_glue, o_world_self_glue, s_world_not_self_glue⟩

end Phys.Algebra
