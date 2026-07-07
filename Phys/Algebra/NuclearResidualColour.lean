/-
  Phys.Algebra.NuclearResidualColour — N402 (arc-L L1): NUCLEAR BINDING =
  RESIDUAL COLOUR.
  ============================================================================
  DIRECTED SUCCESSOR of N401 (arc-K K5 → arc-L L1), per docs/SEED_MATTER_LADDER.md
  §L1. This OPENS arc L — the emergent matter ladder (nuclei → atoms → chemistry →
  condensed matter). Arc I (N385–N390) derived the strong force as octonion
  NON-ASSOCIATIVITY read through the sheafification descent obstruction: the banked
  associator `assoc` on the top rung `O ℚ = CD (H ℚ)` IS the gluing obstruction
  (N219), non-zero on coloured worlds (`assoc_nonvanishing`), and VANISHING on the
  fold's own complex line `span{1, u1}` (= the DERIVED colour-neutral core, N266/
  N386, `singlet_assoc_vanishes`). This node derives the RESIDUAL force between
  colour-neutral composites: the leakage of the confinement coherence through their
  coloured constituents — the fold-native origin of the nuclear force.

  THE RESULT (theory-native, DERIVED — never asserted). On the banked concrete
  objects:

    • `singlet_pair_no_obstruction`   : for `a, b ∈ span{1, u1}`, both the
                                        obstruction `assoc a b x` and the Born
                                        action `bornAction a b x` VANISH — the
                                        DIRECT confining channel is OFF between
                                        colour-neutral standpoints (colour
                                        neutrality forced by N386);
    • `residual_obstruction_decomp`   : ★ THE MECHANISM. For singlet cores
                                        `aS, bS ∈ span{1, u1}` and arbitrary
                                        complements `aC, bC`, the inter-composite
                                        obstruction is carried ENTIRELY by the
                                        residual (cross- and coloured-) channels:
                                        `assoc (aS+aC) (bS+bC) x =
                                          assoc aS bC x + assoc aC bS x
                                            + assoc aC bC x`
                                        — the pure-singlet term drops. By the
                                        bilinearity of the associator in its first
                                        two slots, the confinement coherence
                                        between two composites LEAKS through their
                                        coloured constituents;
    • `composite_obstruction_is_residual` : ★ THE WELD. With identity singlet cores
                                        the cross-terms ALSO vanish
                                        (`assoc_one_left/mid`), so
                                        `assoc (1+aC) (1+bC) x = assoc aC bC x`
                                        EXACTLY — two colour-neutral-cored
                                        composites interact through their coloured
                                        constituents alone;
    • `composite_residual_nonvanishing`   : TEETH. The residual between the two
                                        composites `1 + ι(ιJ)`, `1 + ι(e₂)` at `e₂`
                                        is genuinely NONZERO (= `assoc_nonvanishing`)
                                        — the leakage is real, not vacuous;
    • `residual_bornAction_pos`       : the residual leakage energy is a strictly
                                        POSITIVE Born self-overlap;
    • `residual_short_ranged`         : the residual channel is AREA-SUPPRESSED
                                        (`wilsonArea < 1`) — short-ranged, unlike
                                        the massless direct channel;
    • `residual_decays_with_separation` : the residual weight DECAYS strictly with
                                        the enclosed area (separation);
    • `direct_singlet_channel_unit_weight` : the direct singlet channel carries
                                        UNIT weight (no obstruction) — it is not
                                        the source of the short-ranged binding.

  THE MECHANISM — WHY A RESIDUAL FORCE (the crux, FORCED). The associator `assoc`
  is the confinement obstruction (arc I) and is BILINEAR in its first two slots
  (`assoc_add_left`, `assoc_add_mid`; banked in N386). It VANISHES whenever its
  first two arguments lie in the fold's own 2-dim complex line `span{1, u1}`
  (`singlet_assoc_vanishes` — an alternating trilinear form cannot be supported by
  a 2-dim space in its first two slots). So the obstruction between two composites
  whose colour-neutral cores stand in `span{1, u1}` cannot come from the cores; it
  is ENTIRELY the residual — the coloured constituents. With the trivial (identity)
  core the residual is EXACTLY the coloured-constituent associator, which is the
  SAME nonzero object that confines (`assoc_nonvanishing`) and carries positive,
  area-suppressed Born action (arc I). The "derive the nuclear force from QCD" wall
  the field grinds (a posited Yukawa/meson EFT, phenomenological/lattice-fit)
  DISSOLVES into the bilinearity of the confinement associator: colour neutrality
  turns the direct channel off; the binding is the leftover coloured leakage. One
  cause (octonion non-associativity, the SAME that stopped the cascade), a new
  consequence (the residual nuclear force).

  ⚠ GRADE (honest, docs/SEED_MATTER_LADDER.md §0, §L1 — BEYOND-KEY). The residual-
  force MECHANISM — colour neutrality kills the direct channel, bilinearity routes
  the obstruction through the coloured constituents, the residual is nonzero,
  positive, and area-suppressed — is a FULL theorem-route on the banked concrete
  objects. ⚠⚠ The IDENTIFICATION that this residual leakage IS the physical nuclear
  force binding physical nucleons into nuclei is MECHANISM/candidate-grade PROSE
  only. NO binding-energy number, NO nuclear-physics number (2.2 MeV deuteron,
  8 MeV/A, ~1 fm range) appears in any statement or proof — removable prose only
  (G2 NO-FIT, LOUD here). The win is: the SAME fold engine (the confinement
  associator) climbs to the internucleon scale as its own residual — not a computed
  binding energy.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2, G4). Delete "nuclear", "binding",
  "nucleon", "residual", "colour", "leakage", "short-ranged": the theorems say the
  alternating trilinear form `assoc` on `O ℚ` vanishes on `span{1, u1}²`,
  decomposes bilinearly with the `span{1,u1}²` term dropping, equals its
  coloured-complement value under identity cores, is nonzero at a concrete triple
  with strictly-positive Born self-overlap `gForm`, whose `cutExp`-area weight is
  `< 1` and strictly decreasing in the area, while the `span{1,u1}²` weight is `1`.
  Pure statements about a bilinear alternating form and a positive quadratic weight
  accumulated over a 2-dim index region. No physics name is load-bearing.

  FREE-FLOATING check (SOUL rail, STANDARD §3). Every theorem TYPE mentions the
  banked concrete objects — the banked associator `assoc` on `O ℚ`, `bornAction`/
  `gForm`, `wilsonArea`/`plaqFactor`/`cutExp` on the derived ℝ `Cut`, `span{1, u1}`
  (= N386 colour-neutral core), and the concrete non-associating witness
  `(ι(ιJ), ι(e₂), e₂)`. Not generic over an arbitrary carrier: the mechanism routes
  through the octonion-SPECIFIC `assoc`, `assoc_one_left/mid`, `assoc_nonvanishing`,
  and the concrete witness.

  DEPENDENCIES (all banked, foundations-only): N387 `ConfinementAreaLaw`
  (`bornAction`, `wilsonArea`, `plaqFactor`, `bornAction_singlet_zero`,
  `bornAction_coloured_pos`, `wilsonArea_lt_one`, `wilsonArea_strictAnti`), N386
  `ConfinementColourSinglet` (`singlet_assoc_vanishes`, `assoc_add_left`,
  `assoc_add_mid`, `u1`), Rep7 (`assoc_one_left`, `assoc_one_mid`), Alternative
  (`assoc`, `assoc_nonvanishing`), N175 `ContinuumExp` (`cutExp_zero`). Ground
  field the DERIVED ℝ `Cut` — NOT Mathlib-ℝ as content; Mathlib is MACHINERY only.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  heartbeat inflation, no Mathlib number system as content, no bridge.

  Successor: ONE directed child → `SEED_MATTER_LADDER.md` target L2 (atomic
  structure from the banked Pauli exclusion + the derived Coulomb coupling).
-/
import Phys.Algebra.ConfinementAreaLaw
import Mathlib.Tactic

namespace Phys.Algebra.NuclearResidual

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## §1 — Colour neutrality: the direct channel is OFF between singlets. -/

/-- ★ COLOUR NEUTRALITY. For two standpoints `a, b` in the fold's own complex line
    `span{1, u1}` (= the DERIVED colour-neutral core, N386) BOTH the descent
    obstruction `assoc a b x` and the per-plaquette Born action `bornAction a b x`
    vanish: the DIRECT confining channel carries no coherence between two
    colour-neutral standpoints (N386 `singlet_assoc_vanishes` +
    `bornAction_singlet_zero`). -/
theorem singlet_pair_no_obstruction {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) :
    assoc a b x = 0 ∧ bornAction a b x = 0 :=
  ⟨singlet_assoc_vanishes ha hb x, bornAction_singlet_zero ha hb x⟩

/-! ## §2 — THE MECHANISM: the inter-composite obstruction is the residual. -/

/-- ★★ THE RESIDUAL DECOMPOSITION (the mechanism). Split two composites into a
    colour-neutral core (`aS, bS ∈ span{1, u1}`) plus coloured complements
    (`aC, bC`). The associator is bilinear in its first two slots
    (`assoc_add_left`, `assoc_add_mid`, banked N386) and its pure-core term
    `assoc aS bS x` VANISHES (`singlet_assoc_vanishes`), so the WHOLE
    inter-composite obstruction is carried by the residual channels:
      `assoc (aS+aC) (bS+bC) x = assoc aS bC x + assoc aC bS x + assoc aC bC x`.
    The confinement coherence between two colour-neutral composites LEAKS through
    their coloured constituents. This is the residual (nuclear) force, DERIVED from
    the bilinearity of the confinement obstruction — no potential posited. -/
theorem residual_obstruction_decomp {aS bS : O ℚ}
    (haS : aS ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hbS : bS ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (aC bC x : O ℚ) :
    assoc (aS + aC) (bS + bC) x
      = assoc aS bC x + assoc aC bS x + assoc aC bC x := by
  rw [assoc_add_left, assoc_add_mid, assoc_add_mid, singlet_assoc_vanishes haS hbS x]
  abel

/-- ★★ THE WELD. With the trivial (identity) singlet core the residual cross-terms
    ALSO vanish (`assoc_one_left`, `assoc_one_mid`), so the entire obstruction
    between two colour-neutral-cored composites `1 + aC`, `1 + bC` is EXACTLY the
    coloured-constituent associator:
      `assoc (1+aC) (1+bC) x = assoc aC bC x`.
    Two colour-neutral composites interact through their coloured constituents
    alone — the residual IS the coloured leakage. -/
theorem composite_obstruction_is_residual (aC bC x : O ℚ) :
    assoc (1 + aC) (1 + bC) x = assoc aC bC x := by
  simp only [assoc_add_left, assoc_add_mid, assoc_one_left, assoc_one_mid,
    zero_add]

/-- The composite Born action equals the residual Born action (the weld, at the
    level of the per-plaquette action). -/
theorem composite_bornAction_is_residual (aC bC x : O ℚ) :
    bornAction (1 + aC) (1 + bC) x = bornAction aC bC x := by
  unfold bornAction
  rw [composite_obstruction_is_residual]

/-! ## §3 — TEETH: the residual is genuinely nonzero, positive, short-ranged. -/

/-- ★ TEETH (non-vacuity). The residual between the two colour-neutral-cored
    composites `1 + ι(ιJ)`, `1 + ι(e₂)` at `e₂` is genuinely NONZERO — it equals
    the banked non-associating witness (`assoc_nonvanishing`). The leakage is a
    real interaction, not a vacuous zero. -/
theorem composite_residual_nonvanishing :
    assoc (1 + (CD.iota (ιJ ℚ) : O ℚ)) (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ))
      (CD.e2 : O ℚ) ≠ 0 := by
  rw [composite_obstruction_is_residual]
  exact assoc_nonvanishing

/-- ★ THE RESIDUAL LEAKAGE ENERGY IS POSITIVE. The Born self-overlap of the
    residual obstruction between the two composites is STRICTLY POSITIVE — a
    genuine binding coherence, in the derived ℝ `Cut`. -/
theorem residual_bornAction_pos :
    0 < bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ)) (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ))
      (CD.e2 : O ℚ) := by
  rw [composite_bornAction_is_residual]
  exact bornAction_coloured_pos

/-- ★ THE RESIDUAL FORCE IS SHORT-RANGED. The residual channel's area weight is
    strictly `< 1` for any nonempty enclosed region (`wilsonArea_lt_one`, since the
    residual Born action is positive) — area-suppressed, hence short-ranged, unlike
    the massless (unsuppressed) direct singlet channel. -/
theorem residual_short_ranged (m n : ℕ) (hA : 0 < m * n) :
    wilsonArea (bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ))
      (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ)) (CD.e2 : O ℚ)) m n < 1 :=
  wilsonArea_lt_one _ m n residual_bornAction_pos hA

/-- ★ THE RESIDUAL WEIGHT DECAYS WITH SEPARATION. For a larger enclosed area
    `A₂ > A₁` the residual channel is suppressed strictly more
    (`wilsonArea_strictAnti`) — the force falls off with separation. -/
theorem residual_decays_with_separation {A1 A2 : ℕ} (h : A1 < A2) :
    plaqFactor (bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ))
      (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ)) (CD.e2 : O ℚ)) ^ A2
    < plaqFactor (bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ))
      (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ)) (CD.e2 : O ℚ)) ^ A1 :=
  wilsonArea_strictAnti _ residual_bornAction_pos h

/-- ★ THE DIRECT SINGLET CHANNEL CARRIES UNIT WEIGHT. Between two colour-neutral
    standpoints the per-plaquette action is `0` (`bornAction_singlet_zero`), so the
    area weight is `cutExp(0)^{mn} = 1` — NO suppression. The direct channel is
    long-range/unsuppressed and is NOT the source of the short-ranged residual
    force; only the coloured leakage is. -/
theorem direct_singlet_channel_unit_weight {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) (m n : ℕ) :
    wilsonArea (bornAction a b x) m n = 1 := by
  rw [bornAction_singlet_zero ha hb x]
  unfold wilsonArea plaqFactor
  rw [neg_zero, cutExp_zero, one_pow]

/-! ## §4 — THE CAPSTONE: the residual-colour mechanism. -/

/-- ★★★ THE RESIDUAL-COLOUR MECHANISM (arc-L L1), on the banked derived objects.
    The nuclear force is the RESIDUAL octonion-coherence leakage between colour
    singlets:
      (1) COLOUR NEUTRALITY — the direct channel between two `span{1, u1}`
          standpoints carries no per-plaquette action (`bornAction = 0`);
      (2) THE WELD — the obstruction between two colour-neutral-cored composites is
          EXACTLY the coloured-constituent associator
          (`assoc (1+aC) (1+bC) x = assoc aC bC x`);
      (3) TEETH — that residual is genuinely NONZERO at the concrete witness;
      (4) POSITIVE — its Born self-overlap is strictly positive (a real binding
          coherence);
      (5) SHORT-RANGED — its area weight is `< 1` (area-suppressed), whereas the
          direct singlet channel carries unit weight (unsuppressed).
    THE ONE CAUSE, spelled: the fold loses associativity at `O ℚ`
    (`not_associative`); the associator is the confinement/descent obstruction
    (arc I), bilinear and vanishing on the fold's 2-dim complex line; colour
    neutrality turns the direct channel off, so the coherence between composites
    leaks through their coloured constituents — the residual nuclear force. DERIVED
    from the confinement associator, never a posited nuclear potential. ⚠ MECHANISM
    grade: the identification with the physical internucleon force is removable
    prose; no binding-energy number appears. -/
theorem residual_colour_mechanism :
    (∀ {a b : O ℚ}, a ∈ Submodule.span ℚ {(1 : O ℚ), u1} →
      b ∈ Submodule.span ℚ {(1 : O ℚ), u1} → ∀ x, bornAction a b x = 0) ∧
    (∀ aC bC x : O ℚ, assoc (1 + aC) (1 + bC) x = assoc aC bC x) ∧
    (assoc (1 + (CD.iota (ιJ ℚ) : O ℚ)) (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ))
      (CD.e2 : O ℚ) ≠ 0) ∧
    (0 < bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ)) (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ))
      (CD.e2 : O ℚ)) ∧
    (∀ m n : ℕ, 0 < m * n →
      wilsonArea (bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ))
        (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ)) (CD.e2 : O ℚ)) m n < 1) :=
  ⟨fun ha hb x => bornAction_singlet_zero ha hb x,
   composite_obstruction_is_residual,
   composite_residual_nonvanishing,
   residual_bornAction_pos,
   fun m n hA => residual_short_ranged m n hA⟩

end

end Phys.Algebra.NuclearResidual
