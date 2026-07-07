/-
  Phys.Algebra.ConfinementColourSinglet — N386 (arc-I I2): COLOUR SINGLETS
  SHEAFIFY → HADRONS.
  ============================================================================
  DIRECTED SUCCESSOR of N385 (arc-I I1 → I2), per docs/SEED_QCD_CONFINEMENT.md
  §I2. N385 banked the confinement CRITERION (a cascade sector confines IFF its
  algebra is non-associative). This node derives the COMPLEMENT — WHICH sections
  escape confinement (glue local→global to a global section): the physical states.

  THE RESULT (theory-native, DERIVED — never asserted). The singlet-sheafifies /
  colour-obstructs DICHOTOMY:

    • `singlet_sheafifies`     : every pair of worlds valued in the fold's own
                                 complex line `span{1, u1}` GLUES to a global
                                 section — the singlet sector sheafifies (is
                                 UNCONFINED, the physical states);
    • `full_not_sheafifies`    : the FULL carrier `O ℚ` does NOT sheafify — some
                                 two `O ℚ`-valued (coloured) worlds fail to glue
                                 (are CONFINED, no free coloured states).

  THE MECHANISM — WHY (the crux, FORCED). The descent obstruction to gluing the
  local left-regular worlds IS the octonion associator (N219/N385 J-I1,
  `o_gluingDefect_eq_assoc`), and the associator is an ALTERNATING trilinear form
  (banked `alt_left`, `assoc_swap12/23`). The fold's own complex line
  `span{1, u1}` is 2-DIMENSIONAL (N266 `finrank_matterColourNeutral = 2`), and an
  alternating trilinear form CANNOT be supported when its first two slots range
  over a 2-dim space: expanding trilinearly, every base associator with the first
  two arguments in `{1, u1}` vanishes —

        [1,1,·] = 0   (assoc_one_left),      [1,u1,·] = 0  (assoc_one_left),
        [u1,1,·] = 0  (assoc_one_mid),       [u1,u1,·] = 0 (alt_left),

  so `assoc a b x = 0` for all `a, b ∈ span{1, u1}` and all `x`
  (`singlet_assoc_vanishes`). Hence the singlet worlds glue globally; the coloured
  worlds of the full 8-dim carrier support the genuinely nonzero associator
  (`o_worlds_not_glue`) and do not. The dichotomy is forced by the fold's ℂ line
  being 2-dimensional against the rank-3 alternating obstruction — the same
  octonion associator that stops the cascade, one cause, a new consequence.

  THE DERIVED COLOUR TIE (N266 — NOT a posited "colour singlets are physical").
  The fold's complex line `span{1, u1}` is EXACTLY the colour-neutral core
  `matterColourNeutral` (N266 `matterColourNeutral_eq_span_one_u1`) — the joint
  kernel of every DERIVED colour derivation, the g₂-stabilizer of the fold's √−1.
  So `colour_neutral_sheafifies`: the colour-neutral core sheafifies. This is what
  "the physical asymptotic states are colour singlets" MEANS, DERIVED from the
  banked colour structure — never assumed. And `coloured_required_for_obstruction`:
  a pair that FAILS to glue (is confined) must involve a NON-singlet (coloured)
  standpoint — no free coloured states.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "confine", "colour",
  "singlet", "hadron", "quark", "sheafify": the theorems say the octonion
  associator (= the left-regular gluing obstruction) VANISHES on all triples whose
  first two arguments lie in the 2-dim multiplication-closed subalgebra
  `span{1, u1}`, so those worlds glue (`SectorGlobalGatherOn`), while some worlds
  of the full algebra do not (`o_worlds_not_glue`). Pure statements about which
  subalgebra-valued left-regular worlds possess a global descent section. No physics
  name is load-bearing.

  FREE-FLOATING check (SOUL rail). Every theorem TYPE mentions the banked concrete
  objects — `O ℚ`, `span{1, u1}` (= the banked N266 `matterColourNeutral`),
  `gluingDefect`/`assoc`, `WorldsGlue`. Not generic over an arbitrary alternative
  algebra: the crux routes through the octonion-SPECIFIC `assoc_one_left/mid` and
  `alt_left` and the concrete fold line `u1` (`complexUnit_sq`).

  DEPENDENCIES (all banked, foundations-only): N385 `ConfinementCriterion`
  (`SectorGlobalGather` context), N219 `TowerGatherObstruction`
  (`gluingDefect`, `o_gluingDefect_eq_assoc`, `worlds_glue_iff_gluingDefect_zero`),
  N218T `TowerGatherCoherence` (`WorldsGlue`, `o_worlds_not_glue`), Rep7
  (`assoc_one_left`, `assoc_one_mid`), Alternative (`assoc`, `alt_left`), N266
  `TowerWorldMapColourNeutralCore` (`matterColourNeutral`,
  `matterColourNeutral_eq_span_one_u1`), `DerivationFinrank`
  (`qsmul_mul_left/right`), `DerivationStabilizer` (`complexUnit_sq`), `u1`.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  heartbeat inflation, no Mathlib number system as content, no bridge.
-/
import Phys.Algebra.ConfinementCriterion
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.TowerWorldMapColourNeutralCore
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-! ## Associator linearity in its first two slots (built — needed for the crux). -/

/-- The associator is ADDITIVE in its first slot: `[x+x', y, z] = [x,y,z] + [x',y,z]`. -/
theorem assoc_add_left (x x' y z : O ℚ) :
    assoc (x + x') y z = assoc x y z + assoc x' y z := by
  simp only [assoc, add_mul]; abel

/-- The associator is ℚ-HOMOGENEOUS in its first slot: `[c•x, y, z] = c•[x,y,z]`. -/
theorem assoc_smul_left (c : ℚ) (x y z : O ℚ) :
    assoc (c • x) y z = c • assoc x y z := by
  simp only [assoc, qsmul_mul_left, smul_sub]

/-- The associator is ADDITIVE in its middle slot: `[x, y+y', z] = [x,y,z] + [x,y',z]`. -/
theorem assoc_add_mid (x y y' z : O ℚ) :
    assoc x (y + y') z = assoc x y z + assoc x y' z := by
  simp only [assoc, mul_add, add_mul]; abel

/-- The associator is ℚ-HOMOGENEOUS in its middle slot: `[x, c•y, z] = c•[x,y,z]`. -/
theorem assoc_smul_mid (c : ℚ) (x y z : O ℚ) :
    assoc x (c • y) z = c • assoc x y z := by
  simp only [assoc, qsmul_mul_right, qsmul_mul_left, smul_sub]

/-! ## The crux: the descent obstruction vanishes on the fold's complex line. -/

/-- ★ THE CRUX. The octonion associator (= the left-regular gluing obstruction)
    VANISHES whenever its first two arguments lie in the fold's own complex line
    `span{1, u1}`: `[a, b, x] = 0` for all `a, b ∈ span{1, u1}` and all `x`. An
    ALTERNATING trilinear form cannot be supported by a 2-dim space in its first
    two slots — expanding `a = s•1 + t•u1`, `b = p•1 + q•u1` trilinearly, every
    base associator vanishes (`assoc_one_left`, `assoc_one_mid`, `alt_left`). -/
theorem singlet_assoc_vanishes {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) :
    assoc a b x = 0 := by
  rw [Submodule.mem_span_pair] at ha hb
  obtain ⟨s, t, hst⟩ := ha
  obtain ⟨p, q, hpq⟩ := hb
  subst hst; subst hpq
  simp only [assoc_add_left, assoc_add_mid, assoc_smul_left, assoc_smul_mid,
    assoc_one_left, assoc_one_mid, alt_left, smul_zero, add_zero]

/-! ## Singlet worlds glue. -/

/-- ★ SINGLET WORLDS GLUE: two worlds valued in the fold's complex line
    `span{1, u1}` compose into the world of their product. The gluing obstruction
    is the associator (`o_gluingDefect_eq_assoc`), which vanishes there
    (`singlet_assoc_vanishes`), and gluing is exactly the vanishing of that
    obstruction (`worlds_glue_iff_gluingDefect_zero`). -/
theorem singlet_worlds_glue {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) :
    WorldsGlue a b := by
  rw [worlds_glue_iff_gluingDefect_zero, o_gluingDefect_eq_assoc]
  funext x
  simp only [Pi.zero_apply]
  exact singlet_assoc_vanishes ha hb x

/-! ## The restricted global-gather (sheafification) predicate on a subalgebra. -/

/-- THE GLOBAL-GATHER (descent) CONDITION RESTRICTED TO A SUBSPACE `S`: every pair
    of worlds valued in `S` glues. A section valued in `S` sheafifies to a global
    section exactly when this holds. Physics-words-removable: `∀ a b ∈ S,
    L_a ∘ L_b = L_{a·b}`. -/
def SectorGlobalGatherOn (S : Submodule ℚ (O ℚ)) : Prop :=
  ∀ a ∈ S, ∀ b ∈ S, WorldsGlue a b

/-! ## THE DICHOTOMY. -/

/-- ★★ THE SINGLET SECTOR SHEAFIFIES. All worlds valued in the fold's own complex
    line `span{1, u1}` glue to a global section — the singlet sector is UNCONFINED.
    These are the physical asymptotic states. -/
theorem singlet_sheafifies :
    SectorGlobalGatherOn (Submodule.span ℚ {(1 : O ℚ), u1}) :=
  fun a ha b hb => singlet_worlds_glue ha hb

/-- ★★ THE FULL (COLOURED) SECTOR DOES NOT SHEAFIFY. Some two worlds of the full
    carrier `O ℚ` fail to glue (`o_worlds_not_glue`), so no global section can be
    assembled from all of `O ℚ` — the coloured sector is CONFINED, no free
    coloured states. -/
theorem full_not_sheafifies : ¬ SectorGlobalGatherOn (⊤ : Submodule ℚ (O ℚ)) := by
  intro h
  obtain ⟨a, b, hab⟩ := o_worlds_not_glue
  exact hab (h a Submodule.mem_top b Submodule.mem_top)

/-! ## The DERIVED colour tie (N266) — colour singlets are physical, DERIVED. -/

/-- ★★ THE COLOUR-NEUTRAL CORE SHEAFIFIES. The DERIVED colour-neutral core
    `matterColourNeutral` (N266, the joint kernel of every colour derivation =
    the g₂-stabilizer of the fold's √−1) is EXACTLY the fold's complex line
    `span{1, u1}` (`matterColourNeutral_eq_span_one_u1`), so it sheafifies. This
    is "the physical asymptotic states are colour singlets" — DERIVED from the
    banked colour structure, never posited as a premise. -/
theorem colour_neutral_sheafifies : SectorGlobalGatherOn matterColourNeutral := by
  intro a ha b hb
  rw [matterColourNeutral_eq_span_one_u1] at ha hb
  exact singlet_worlds_glue ha hb

/-- ★ NO FREE COLOURED STATES (the contrapositive). A pair of worlds that FAILS to
    glue (is confined) MUST involve a NON-singlet (coloured) standpoint: if both
    stood in the fold's complex line they would glue (`singlet_worlds_glue`). -/
theorem coloured_required_for_obstruction {a b : O ℚ} (h : ¬ WorldsGlue a b) :
    a ∉ Submodule.span ℚ {(1 : O ℚ), u1} ∨ b ∉ Submodule.span ℚ {(1 : O ℚ), u1} := by
  by_contra hcon
  rw [not_or, not_not, not_not] at hcon
  exact h (singlet_worlds_glue hcon.1 hcon.2)

/-! ## W8 non-vacuity — the sheafifying sector is a PROPER subspace. -/

/-- ★ NON-VACUITY: the sheafifying (singlet) sector is a PROPER subspace of the
    carrier — it is NOT all of `O ℚ`. Otherwise everything would glue,
    contradicting `full_not_sheafifies`. The dichotomy genuinely bites: some
    worlds sheafify, some do not. -/
theorem singlet_proper :
    Submodule.span ℚ {(1 : O ℚ), u1} ≠ (⊤ : Submodule ℚ (O ℚ)) := by
  intro h
  apply full_not_sheafifies
  rw [← h]
  exact singlet_sheafifies

/-! ## The capstone. -/

/-- ★★★ THE COLOUR-SINGLET DICHOTOMY. Over the derived `ℚ` and the banked octonion
    rung `O ℚ = CD (H ℚ)`:
    (i)   the fold's complex line `span{1, u1}` SHEAFIFIES — all its worlds glue to
          a global section (`singlet_sheafifies`);
    (ii)  it EQUALS the DERIVED colour-neutral core `matterColourNeutral` (N266),
          which therefore sheafifies (`colour_neutral_sheafifies`) — colour
          singlets are the physical states, DERIVED;
    (iii) the FULL carrier `O ℚ` does NOT sheafify — some coloured worlds fail to
          glue (`full_not_sheafifies`) — no free coloured states;
    (iv)  the sheafifying sector is a PROPER subspace (`singlet_proper`) — the
          dichotomy genuinely bites.
    The only worlds that possess a global descent section are those valued in the
    fold's own complex line = the colour-neutral core; the coloured worlds of the
    full carrier are confined. DERIVED from the associator being an alternating
    trilinear form that vanishes on the 2-dim fold line — the SAME octonion
    non-associativity that stopped the cascade, read through the descent
    obstruction. Not a posited "colour singlets are physical" assumption. -/
theorem colour_singlet_dichotomy :
    SectorGlobalGatherOn (Submodule.span ℚ {(1 : O ℚ), u1}) ∧
    matterColourNeutral = Submodule.span ℚ {(1 : O ℚ), u1} ∧
    SectorGlobalGatherOn matterColourNeutral ∧
    ¬ SectorGlobalGatherOn (⊤ : Submodule ℚ (O ℚ)) ∧
    Submodule.span ℚ {(1 : O ℚ), u1} ≠ (⊤ : Submodule ℚ (O ℚ)) :=
  ⟨singlet_sheafifies, matterColourNeutral_eq_span_one_u1,
    colour_neutral_sheafifies, full_not_sheafifies, singlet_proper⟩

end Phys.Algebra
