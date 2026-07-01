/-
  Phys.Algebra.TowerGatherObstruction — N219: THE EXPLICIT GLUING-OBSTRUCTION COCYCLE.
  ===========================================================================
  A DEEPER CUT of the N218T gather frontier. N218T (`TowerGatherCoherence.lean`)
  determined RUNG BY RUNG *which* inter-world pairs glue across the derived
  Cayley–Dickson tower `Dbl ℚ → H ℚ → O ℚ → S ℚ` — where a fold-generated INNER
  WORLD is the left regular action `worldMap a = (a··) = L_a` and two worlds GLUE
  when `L_a ∘ L_b = L_{a·b}` (the regular representation is multiplicative). This
  node makes the OBSTRUCTION to that gluing EXPLICIT and identifies it.

  THE OBJECT (derived, not posited — the deeper cut). The obstruction to
  `WorldsGlue a b` is not a yes/no; it is a MAP, the failure of the two
  reorganizations to compose into the composite reorganization:

        gluingDefect a b  :  x ↦ (a·b)·x − a·(b·x).

  `WorldsGlue a b ↔ gluingDefect a b = 0` (`worlds_glue_iff_gluingDefect_zero`):
  the inter-world coherence question IS the vanishing of this explicit obstruction
  cocycle. And on the octonion shape it is EXACTLY THE BANKED ASSOCIATOR:

        gluingDefect a b = [a, b, ·]   (`o_gluingDefect_eq_assoc`, definitional).

  This is the sheaf-like local→global seam made concrete: the obstruction to
  gluing the local worlds into one global world is the algebra's own associator.

  WHAT THE TOWER ANSWERS ABOUT THE OBSTRUCTION (each clause a proved theorem,
  each a citation of a banked cascade / alternativity fact):

    RUNG `Dbl ℚ` / `H ℚ` (the associative rungs).  The obstruction is the
      IDENTICALLY-ZERO cocycle (`dbl_gluingDefect_zero`, `h_gluingDefect_zero`):
      associativity ⟹ every world glues with every other, no obstruction.

    RUNG `O ℚ` (the octonion rung).  The obstruction is a NONZERO but ALTERNATING
      trilinear form — the octonion associator:
        • genuinely nonzero (`o_gluingDefect_ne_zero`, banked `assoc_nonvanishing`)
          — so distinct worlds NO LONGER glue pairwise;
        • its DIAGONAL vanishes (`o_gluingDefect_self`, banked `alt_left`) — a
          world still SELF-glues, because left-alternativity = the associator
          alternates in its first two slots;
        • ANTISYMMETRIC in the two standpoints (`o_gluingDefect_antisymm`, banked
          `assoc_swap12`) — the alternating structure of the obstruction.

    RUNG `S ℚ` (past the stop).  The obstruction LOSES its alternating diagonal:
      even the SELF-obstruction is nonzero (`s_gluingDefect_self_ne_zero`, the
      banked sedenion coordinate defect at `zdX`) — a world no longer self-glues.

  THE DISCOVERED CONTENT — WHY THE STAIRCASE (ROADMAP §N218T-superseded frontier).
  N218T said WHICH worlds glue; N219 says WHY, with ONE object. The coherence
  question is the vanishing of the associator obstruction `[a,b,·]`, and
  SELF-coherence survives EXACTLY as long as that obstruction stays ALTERNATING
  (its diagonal `[a,a,·]` vanishes). The last rung where it alternates is `O ℚ`
  — the cascade stop. N218T's observation that self-gluing is the shadow of the
  Born self-overlap composition law is now EXPLAINED at the level of the
  obstruction: self-gluing = the diagonal-vanishing (alternating) property of the
  associator cocycle, and it is lost at `S ℚ` precisely where left-alternativity
  is lost — the same structural fact at which the Born composition law fails.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "world / gather / glue /
  cocycle / obstruction": `gluingDefect a b = [a,b,·] = (a·b)·(−) − a·(b·(−))` is
  the associator of the tower's left regular representation, and the clauses are
  the pure algebraic statement that this associator is identically zero on the
  associative rungs `Dbl/H ℚ`, a NONZERO ALTERNATING trilinear form on `O ℚ`
  (diagonal `[a,a,·]=0` + antisymmetric `[a,b,·]+[b,a,·]=0`), and non-alternating
  on `S ℚ` (`[a,a,·]≠0`). Every theorem STATEMENT stands as associator algebra
  with no physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
  Uses ONLY the banked derived tower `Dbl/H/O/S ℚ`, the banked associator
  (`Phys.Algebra.Alternative`), the banked N218T `WorldsGlue`, and the banked
  sedenion self-defect `s_self_glue_fail_coord`.
-/
import Phys.Cascade.Sedenion
import Phys.Algebra.Alternative
import Phys.Algebra.TowerGatherCoherence

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

/-! ## THE EXPLICIT GLUING OBSTRUCTION. -/

/-- THE EXPLICIT GLUING OBSTRUCTION `gluingDefect a b : x ↦ (a·b)·x − a·(b·x)`: the map
    whose vanishing is exactly `WorldsGlue a b`. It measures the failure of the two
    world-reorganizations `L_a`, `L_b` to compose into the composite reorganization
    `L_{a·b}`. Physics-words-removable: on the octonion shape this is the associator
    `[a, b, ·]`. -/
def gluingDefect {A : Type*} [Mul A] [Sub A] (a b : A) : A → A :=
  fun x => (a * b) * x - a * (b * x)

section AnyRing
variable {A : Type*} [NonAssocRing A]

/-- ★ THE N218T PREDICATE IS THE VANISHING OF THE EXPLICIT OBSTRUCTION: two worlds glue
    iff their gluing defect is the zero map. The inter-world coherence question of N218T
    is exactly the vanishing of this explicit obstruction cocycle. -/
theorem worlds_glue_iff_gluingDefect_zero (a b : A) :
    WorldsGlue a b ↔ gluingDefect a b = 0 := by
  constructor
  · intro h
    funext x
    have hx := congrFun h x
    simp only [worldMap, Function.comp_apply] at hx
    simp only [gluingDefect, Pi.zero_apply]
    rw [hx, sub_self]
  · intro h
    funext x
    have hx := congrFun h x
    simp only [gluingDefect, Pi.zero_apply, sub_eq_zero] at hx
    simp only [worldMap, Function.comp_apply]
    exact hx.symm

end AnyRing

/-! ## RUNGS `Dbl ℚ`, `H ℚ` — the obstruction is the IDENTICALLY-ZERO cocycle. -/

/-- `Dbl ℚ`: the gluing obstruction vanishes identically (associativity — the floor of
    the staircase, every world glues with every other). -/
theorem dbl_gluingDefect_zero (a b : Dbl ℚ) : gluingDefect a b = 0 := by
  funext x; simp only [gluingDefect, Pi.zero_apply]; rw [mul_assoc, sub_self]

/-- `H ℚ`: the gluing obstruction vanishes identically (associativity survives the
    doubling — the trivial cocycle). -/
theorem h_gluingDefect_zero (a b : H ℚ) : gluingDefect a b = 0 := by
  funext x; simp only [gluingDefect, Pi.zero_apply]; rw [mul_assoc, sub_self]

/-! ## RUNG `O ℚ` — the obstruction IS the associator: nonzero but ALTERNATING. -/

attribute [local instance] CD.narCD CD.srCD

/-- ★ THE IDENTIFICATION: on the octonion shape the gluing obstruction IS the banked
    associator `[a, b, ·]`. The sheaf-like local→global obstruction to gluing the worlds
    is the algebra's own associator. Definitional. -/
theorem o_gluingDefect_eq_assoc (a b : O ℚ) :
    gluingDefect a b = fun x => Phys.Algebra.assoc a b x := by
  funext x; rfl

/-- ★ THE OBSTRUCTION SELF-VANISHES on `O ℚ`: `gluingDefect a a = 0`, so a world still
    SELF-glues. Caused by LEFT-ALTERNATIVITY (`alt_left`: the associator's diagonal
    `[a,a,·]` vanishes) — the octonion rung keeps this even though it is non-associative. -/
theorem o_gluingDefect_self (a : O ℚ) : gluingDefect a a = 0 := by
  funext x
  have h := Phys.Algebra.alt_left a x
  simp only [Phys.Algebra.assoc] at h
  simp only [gluingDefect, Pi.zero_apply]
  exact h

/-- ★ THE OBSTRUCTION IS ANTISYMMETRIC in the two standpoints:
    `gluingDefect a b x + gluingDefect b a x = 0` (banked `assoc_swap12` — the associator
    is alternating in its first two slots). The alternating structure of the obstruction. -/
theorem o_gluingDefect_antisymm (a b x : O ℚ) :
    gluingDefect a b x + gluingDefect b a x = 0 := by
  have h := Phys.Algebra.assoc_swap12 a b x
  simp only [Phys.Algebra.assoc] at h
  simp only [gluingDefect]
  exact h

/-- ★ THE OBSTRUCTION IS GENUINELY NONZERO on `O ℚ`: some two distinct worlds fail to
    glue (banked `assoc_nonvanishing`, the cascade's own non-associating triple). So the
    obstruction cocycle is a NONZERO alternating form — pairwise glue genuinely fails. -/
theorem o_gluingDefect_ne_zero :
    ∃ a b : O ℚ, gluingDefect a b ≠ 0 := by
  refine ⟨CD.iota (ιJ ℚ), CD.iota (CD.e2 : H ℚ), ?_⟩
  intro h
  have hx := congrFun h (CD.e2 : O ℚ)
  simp only [gluingDefect, Pi.zero_apply] at hx
  exact Phys.Algebra.assoc_nonvanishing hx

/-! ## RUNG `S ℚ` — the obstruction LOSES its alternating diagonal. -/

/-- ★ PAST THE STOP the obstruction is no longer alternating: the SELF-obstruction
    `gluingDefect a a` is nonzero for the banked zero-divisor standpoint `zdX` (via the
    banked sedenion coordinate defect `s_self_glue_fail_coord` at `wY`). Left-alternativity
    is lost at `S ℚ` — the same rung, the same structural fact, at which the Born
    self-overlap composition law fails — so even a world's self-obstruction survives. -/
theorem s_gluingDefect_self_ne_zero :
    ∃ a : S ℚ, gluingDefect a a ≠ 0 := by
  refine ⟨zdX, ?_⟩
  intro h
  have hx := congrFun h wY
  simp only [gluingDefect, Pi.zero_apply, sub_eq_zero] at hx
  exact s_self_glue_fail_coord (congrArg (fun z : S ℚ => z.im.im.im.im) hx.symm)

/-! ## THE CAPSTONE — the single explicit obstruction cocycle degrading across the tower. -/

/-- ★★★ THE GLUING-OBSTRUCTION STAIRCASE. The SINGLE explicit obstruction cocycle
    `gluingDefect a b : x ↦ (a·b)·x − a·(b·x)` — the associator `[a,b,·]` — degrades in
    a forced staircase as the cascade climbs:

      `Dbl ℚ` : the IDENTICALLY-ZERO cocycle          (associative — full coherence)
      `H ℚ`  : the IDENTICALLY-ZERO cocycle           (associative — full coherence)
      `O ℚ`  : NONZERO but ALTERNATING                (diagonal `[a,a,·]=0` + antisymmetric)
      `S ℚ`  : NON-ALTERNATING                        (diagonal `[a,a,·]≠0`)

    A single rung-uniform statement cannot express this — the obstruction's behaviour is
    genuinely RUNG-DEPENDENT. The last rung where the obstruction ALTERNATES (its diagonal
    vanishes, so a world self-glues) is `O ℚ`, exactly the rung where the cascade stops:
    self-coherence = the alternating property of the associator cocycle, lost at `S ℚ`
    precisely where left-alternativity is lost. Physics-words-removable: this is the
    statement that the associator of the tower's left regular representation is identically
    zero on the associative rungs, a nonzero alternating trilinear form on `O ℚ`, and
    non-alternating on `S ℚ`. -/
theorem gluing_obstruction_staircase :
    -- Dbl ℚ, H ℚ: the obstruction is the identically-zero cocycle
    (∀ a b : Dbl ℚ, gluingDefect a b = 0) ∧
    (∀ a b : H ℚ, gluingDefect a b = 0) ∧
    -- O ℚ: nonzero, but ALTERNATING (diagonal vanishes + antisymmetric)
    (∃ a b : O ℚ, gluingDefect a b ≠ 0) ∧
    (∀ a : O ℚ, gluingDefect a a = 0) ∧
    (∀ a b x : O ℚ, gluingDefect a b x + gluingDefect b a x = 0) ∧
    -- S ℚ: the obstruction loses alternation — even the self-obstruction is nonzero
    (∃ a : S ℚ, gluingDefect a a ≠ 0) :=
  ⟨dbl_gluingDefect_zero, h_gluingDefect_zero, o_gluingDefect_ne_zero,
    o_gluingDefect_self, o_gluingDefect_antisymm, s_gluingDefect_self_ne_zero⟩

end Phys.Algebra
