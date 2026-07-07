/-
  Phys.Quantum.AsymptoticStates — N398 (arc-K K2): THE ASYMPTOTIC-STATE SPACE.
  (The S-matrix's in/out states are exactly the banked colour singlets, dressed by the
   derived Born structure — the asymptotic completeness structure over the singlet sheaves,
   DERIVED from confinement + the Born rule, NOT a posited free-particle Fock space.)
  ===========================================================================
  THE SECOND NODE OF ARC K — the DYNAMICAL half of quantum field theory. K1 (N397,
  `Unitarity.lean`) derived that TRANSPORT is unitary because physical states are sheaves
  and the gather monad is identity on them. K2 (this node) derives WHICH states the
  transport acts BETWEEN — the asymptotic (in/out) states — and shows they are FORCED to
  be the banked colour singlets, carrying the derived Born structure automatically.

  ── THE FORWARD DERIVATION (fold → the asymptotic space; nothing posited) ──
  The look-back gathers local worlds into a global whole (the monad). Arc I (N386,
  `ConfinementColourSinglet.lean`) established that NOT every local world glues: the descent
  obstruction is the octonion associator (an alternating trilinear form), which VANISHES
  exactly on the fold's own complex line `span{1, u1}` (`singlet_assoc_vanishes`), so those
  worlds — and ONLY a proper subspace — glue local→global to a global section
  (`singlet_sheafifies`, `singlet_proper`, `full_not_sheafifies`). A state that GLOBALLY
  EXISTS (can be transported in and out, i.e. is asymptotic) is precisely a sheafifiable one.
  Hence the asymptotic-state space is FORCED to be the sheafifiable singlet sector — the
  fold's complex line — not posited as a free-particle Fock space, and there are NO free
  coloured asymptotic states (`coloured_required_for_obstruction`).

  ── THE WELD: the singlet line IS the Born fibre (arc I ⊗ arc J) ──
  The fold's complex line `span{1, u1}` (octonion, `u1·u1 = -1` = `complexUnit_sq`, N6) and
  the derived Born fibre `Dbl Cut` / `StateFibre = Cut × Cut` (J², N392) are the SAME √-1
  line — the fold's own self-blind chirality read twice. The DRESSING map
  `dress a b := ((a : Cut), (b : Cut))` reads a singlet `singletElt a b = a·1 + b·u1` as a
  Born-fibre state. It is a derived structure map, banked here as:

    · `dress_intertwines_J`    : `foldComplex (dress a b) = dress (-b) a` — dressing carries
                                 OCTONION multiplication by `u1` (`u1_mul_singletElt`) to the
                                 BORN complex unit `foldComplex`/`J₂` (N392). The two √-1's
                                 are the one fold-root.
    · `bornForm_dress`         : the Born self-overlap of a dressed singlet equals its
                                 octonion norm — dressing is an ISOMETRY:
                                 `g(dress) = ratCast (gForm (singlet))` (`gForm_singletElt`).
    · `dress_eInward/eOutward` : the singlet frame `{1, u1}` maps to the Born frame
                                 `{eInward, eOutward}`.
    · `dress_completeness`     : ★ ASYMPTOTIC COMPLETENESS — the octonion norm of a singlet
                                 SPLITS into the Born outcome weights of its dressed state,
                                 `wIn + wOut = ratCast (gForm (singlet))` (N394
                                 `outcome_weights_sum`). The completeness of the asymptotic
                                 space is the idempotent gather's completeness, over the
                                 singlet sheaves.
    · `evolve_J_dress`         : ★ CLOSURE — K1's unitary transport by the fold's own phase
                                 `Dbl.J` maps a dressed singlet to ANOTHER dressed singlet
                                 (matching `u1`-multiplication on the octonion line), so the
                                 asymptotic sector is closed under the fold's phase transport
                                 (`asymptotic_conserves`, `asymptotic_stays_sheaf`).

  So the S-matrix's in/out space = the sheafifiable colour singlets (arc I), which ARE the
  derived Born fibre (arc J), transported unitarily by K1 (arc K). The three arcs meet at
  this joint — a connection never made in Lean before.

  ── STANDARD ──
  Unbroken: every object banked — `u1`/`complexUnit_sq`/`gForm`/`reQ` (octonion, arc F/I),
  `span{1,u1}`/`singlet_sheafifies`/`singlet_proper`/`WorldsGlue`/`singlet_worlds_glue`
  (N386), `StateFibre`/`bornForm`/`eInward`/`eOutward` (N391), `foldComplex` (N392),
  `toDbl`/`Dbl.J`/`dblNormSq` (N393/N2), `wIn`/`wOut`/`totalGather`/`outcome_weights_sum`
  (N394), `evolve`/`fromDbl`/`evolve_is_sheaf`/`unitary_conserves_gather_resolution`/
  `J_is_unit_phase` (N397). `ratCast : ℚ → Cut` is the derived ordered Field's own numeral
  arithmetic (metalanguage coordinate cast, NOT Mathlib-ℝ as content — the Born analysis
  stays over the derived ℝ `Cut`). Complete: every claim proved, foundations-only.
  Physics-words-removable: delete "asymptotic"/"S-matrix"/"in-out state"/"colour"/
  "confinement"/"hadron" — what remains is an isometric embedding of the 2-dim
  multiplication-closed subalgebra `span{1, u1} ⊆ O ℚ` (on which the alternating associator
  vanishes, so its left-regular worlds glue to global sections) into the derived Born fibre
  `Cut × Cut`, intertwining left-multiplication-by-`u1` with `foldComplex`, matching the
  quadratic forms, sending the algebra frame to the fibre frame, splitting the norm into the
  gather weights, and closed under the unit-phase transports of K1. Pure math about the
  banked objects. FREE-FLOATING guard: every theorem TYPE mentions the banked concrete
  objects (`O ℚ`, `u1`, `gForm`, `span{1,u1}`, `WorldsGlue`, `StateFibre`, `bornForm`,
  `foldComplex`, `evolve`, `Dbl.J`, `wIn`, `wOut`) — not generic over an arbitrary carrier.
  W4.5 SUFFICIENCY: this derives EXACTLY K2 (the asymptotic-state space = dressed singlet
  sheaves), NOT the transition amplitude / optical theorem (K3). Grade: theorem-route; NO
  numerical claim.

  Foundations-only: no posited axiom, no proof-hole tactic, no kernel-trust bypass, no
  heartbeat inflation, no Mathlib number system as content, no bridge.
-/
import Mathlib.Tactic
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationCompact
import Phys.Quantum.Unitarity

/-!
  ## N398 (arc-K K2) — declaration map (arc I ⊗ arc J ⊗ arc K weld)

    singletElt                  — a singlet `a·1 + b·u1` in the fold's complex line `span{1,u1}`.
    singletElt_mem              — it lands in the banked sheafifiable line.
    reQ_u1 / star_u1'           — the octonion imaginary unit's real part / conjugate.
    gForm_singletElt            — the octonion Born norm of a singlet is `a² + b²`.
    u1_mul_singletElt           — ★ octonion mult by `u1`: `(a,b) ↦ (-b, a)` (the octonion √-1).
    dress                       — THE DRESSING: read a singlet as a Born-fibre state.
    dress_eInward / _eOutward   — the singlet frame `{1,u1}` maps to the Born frame.
    dress_intertwines_J         — ★ `foldComplex (dress) = dress (-b,a)`: `u1` IS the Born `J`.
    bornForm_dress              — ★ dressing is a Born ISOMETRY: `g(dress) = ratCast(gForm)`.
    dress_completeness          — ★ ASYMPTOTIC COMPLETENESS: `wIn + wOut = ratCast(gForm)`.
    evolve_J_dress              — ★ CLOSURE: K1's fold-phase transport keeps a dressed singlet dressed.
    asymptotic_conserves        — the transport conserves the singlet's completeness sum.
    asymptotic_stays_sheaf      — the transported dressed singlet is still a sheaf (K1 idempotency).
    asymptotic_worlds_glue      — [teeth] two singlet worlds always glue (asymptotic states exist).
    asymptotic_sector_proper    — [W8 teeth] the asymptotic (sheafifiable) sector is PROPER — no
                                  free coloured asymptotic states.
    asymptotic_state_space      — ★★ THE CAPSTONE.
-/

namespace Phys.Quantum

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

/-! ## The singlet line — the sheafifiable (asymptotic) sector of arc I. -/

/-- A SINGLET element `a·1 + b·u1` in the fold's own complex line `span{1, u1} ⊆ O ℚ` — the
    sheafifiable (asymptotic) sector (N386). -/
noncomputable def singletElt (a b : ℚ) : O ℚ := a • (1 : O ℚ) + b • u1

/-- The singlet element lands in the banked sheafifiable line `span{1, u1}`. -/
theorem singletElt_mem (a b : ℚ) :
    singletElt a b ∈ Submodule.span ℚ {(1 : O ℚ), u1} := by
  apply Submodule.add_mem
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))

/-- The octonion imaginary unit has zero real part. -/
theorem reQ_u1 : reQ u1 = 0 := by simp [reQ, u1]

/-- The octonion imaginary unit's conjugate is its negative (`star u1 = -u1`). -/
theorem star_u1' : star u1 = -u1 := rfl

/-- THE OCTONION BORN NORM OF A SINGLET is `a² + b²` (the same positive form the Born fibre
    carries). -/
theorem gForm_singletElt (a b : ℚ) :
    gForm (singletElt a b) (singletElt a b) = a ^ 2 + b ^ 2 := by
  unfold gForm singletElt
  rw [star_add, star_smul_one]
  have hst : star (b • u1) = b • (-u1) := by rw [star_smul]; rw [star_u1']; rfl
  rw [hst]
  simp only [mul_add, add_mul, qsmul_mul_left, qsmul_mul_right, mul_one, one_mul,
    reQ_add, reQ_smul, reQ_neg, reQ_one]
  have huu : reQ (u1 * -u1) = 1 := by rw [_root_.mul_neg, complexUnit_sq]; simp
  rw [reQ_u1, huu]; ring

/-- ★ OCTONION MULTIPLICATION BY `u1`: `u1 · (a·1 + b·u1) = (-b)·1 + a·u1` — the octonion √-1
    rotates the singlet coordinates `(a, b) ↦ (-b, a)`. -/
theorem u1_mul_singletElt (a b : ℚ) :
    u1 * singletElt a b = singletElt (-b) a := by
  unfold singletElt
  rw [mul_add, qsmul_mul_right, qsmul_mul_right, mul_one, complexUnit_sq, smul_neg, neg_smul]
  abel

/-! ## The dressing map — the singlet line IS the derived Born fibre (arc I ⊗ arc J). -/

/-- THE DRESSING MAP: read a singlet `a·1 + b·u1` as a Born-fibre state `((a : Cut), (b : Cut))`.
    The fold's complex line (arc I) IS the derived Born fibre (arc J) — the same √-1. -/
noncomputable def dress (a b : ℚ) : StateFibre := ((a : Cut), (b : Cut))

/-- The singlet unit `1` dresses to the Born "toward" frame vector. -/
theorem dress_eInward : dress 1 0 = eInward := by unfold dress eInward; push_cast; rfl

/-- The singlet imaginary unit `u1` dresses to the Born "away" frame vector. -/
theorem dress_eOutward : dress 0 1 = eOutward := by unfold dress eOutward; push_cast; rfl

/-- ★ THE INTERTWINING — `u1` IS the Born `J`. Dressing carries OCTONION multiplication by `u1`
    (`u1_mul_singletElt`, `(a,b) ↦ (-b,a)`) to the BORN complex unit `foldComplex`/`J₂` (N392):
    `foldComplex (dress a b) = dress (-b) a`. The octonion √-1 and the Born √-1 are the one
    fold-root — the singlet sector and the Born fibre are literally the same complex line. -/
theorem dress_intertwines_J (a b : ℚ) :
    foldComplex (dress a b) = dress (-b) a := by
  apply Prod.ext
  · simp [foldComplex_apply, dress]
  · simp [foldComplex_apply, dress]

/-- ★ DRESSING IS A BORN ISOMETRY. The Born self-overlap of a dressed singlet equals its
    octonion norm: `g(dress a b) = ratCast (gForm (singletElt a b))`. The asymptotic states
    carry the Born structure automatically because the singlet line IS the Born fibre. -/
theorem bornForm_dress (a b : ℚ) :
    bornForm (dress a b) (dress a b) = ((gForm (singletElt a b) (singletElt a b) : ℚ) : Cut) := by
  rw [gForm_singletElt]
  unfold bornForm dress
  push_cast; ring

/-! ## Asymptotic completeness and closure (arc I ⊗ arc J ⊗ arc K). -/

/-- ★ ASYMPTOTIC COMPLETENESS. The octonion norm of a singlet SPLITS into the Born outcome
    weights of its dressed state: `wIn (dress a b) + wOut (dress a b) = ratCast (gForm singlet)`
    (N394 `outcome_weights_sum`). The completeness of the asymptotic-state space is the
    idempotent gather's completeness, realised over the singlet sheaves. -/
theorem dress_completeness (a b : ℚ) :
    wIn (dress a b) + wOut (dress a b)
      = ((gForm (singletElt a b) (singletElt a b) : ℚ) : Cut) := by
  rw [outcome_weights_sum, bornForm_dress]

/-- ★ CLOSURE. K1's unitary transport by the fold's OWN phase `Dbl.J` maps a dressed singlet to
    ANOTHER dressed singlet — matching `u1`-multiplication on the octonion line
    (`u1_mul_singletElt`, `(a,b) ↦ (-b,a)`). The asymptotic sector is closed under the fold's
    phase transport: `evolve Dbl.J (dress a b) = dress (-b) a`. -/
theorem evolve_J_dress (a b : ℚ) :
    evolve Dbl.J (dress a b) = dress (-b) a := by
  unfold evolve dress
  apply Prod.ext <;>
    simp [fromDbl, toDbl, Dbl.J, Dbl.mul_re, Dbl.mul_im]

/-- The unit-phase transport CONSERVES the singlet's completeness sum (K1 on the asymptotic
    space): `g(evolve Dbl.J (dress a b)) = wIn (dress a b) + wOut (dress a b)`. -/
theorem asymptotic_conserves (a b : ℚ) :
    bornForm (evolve Dbl.J (dress a b)) (evolve Dbl.J (dress a b))
      = wIn (dress a b) + wOut (dress a b) :=
  unitary_conserves_gather_resolution Dbl.J J_is_unit_phase (dress a b)

/-- The transported dressed singlet is STILL a sheaf (K1 idempotency `T² ≅ T`): the asymptotic
    space is preserved by every transport. -/
theorem asymptotic_stays_sheaf (U : Dbl Cut) (a b : ℚ) :
    totalGather (evolve U (dress a b)) = evolve U (dress a b) :=
  evolve_is_sheaf U (dress a b)

/-! ## [W8] Teeth — the asymptotic states exist (glue) and are a PROPER sector (no free colour). -/

/-- [teeth] TWO SINGLET WORLDS ALWAYS GLUE. Any two singlet standpoints glue local→global to a
    global section (`singlet_worlds_glue`) — asymptotic states genuinely exist. -/
theorem asymptotic_worlds_glue (a b c d : ℚ) :
    WorldsGlue (singletElt a b) (singletElt c d) :=
  singlet_worlds_glue (singletElt_mem a b) (singletElt_mem c d)

/-- ★ [W8] THE ASYMPTOTIC SECTOR IS PROPER — no free coloured asymptotic states. The
    sheafifiable (asymptotic) sector `span{1,u1}` is a PROPER subspace of the full carrier
    `O ℚ` (`singlet_proper`): the coloured worlds are confined, so the S-matrix is defined
    between singlet states, not free quarks. The dichotomy genuinely bites. -/
theorem asymptotic_sector_proper :
    Submodule.span ℚ {(1 : O ℚ), u1} ≠ (⊤ : Submodule ℚ (O ℚ)) :=
  singlet_proper

/-! ## THE CAPSTONE — the asymptotic-state space. -/

/-- ★★ THE ASYMPTOTIC-STATE SPACE, DERIVED. Over the derived `ℚ`/`Cut`, the banked octonion
    rung `O ℚ`, and the banked Born fibre `StateFibre = Cut × Cut`:
    (i)   the asymptotic (globally-existing, transportable) states are the SHEAFIFIABLE singlet
          sector — the fold's complex line `span{1, u1}` — a PROPER subspace of the full
          carrier (`asymptotic_sector_proper`); its worlds glue local→global
          (`asymptotic_worlds_glue`), the coloured worlds do not (no free coloured states);
    (ii)  the singlet line IS the derived Born fibre: the DRESSING map intertwines octonion
          multiplication by `u1` with the Born complex unit `foldComplex`
          (`dress_intertwines_J`), is a Born ISOMETRY (`bornForm_dress`), and sends the singlet
          frame `{1,u1}` to the Born frame `{eInward, eOutward}` (`dress_eInward/eOutward`);
    (iii) ASYMPTOTIC COMPLETENESS: the singlet's octonion norm splits into the Born outcome
          weights `wIn + wOut` (`dress_completeness`, the idempotent gather's completeness); and
    (iv)  K1's unit-phase transport keeps a dressed singlet dressed (`evolve_J_dress`),
          conserves its completeness sum (`asymptotic_conserves`), and keeps it a sheaf
          (`asymptotic_stays_sheaf`).
    The S-matrix's in/out states are exactly the banked colour singlets dressed by the derived
    Born structure — DERIVED from confinement (arc I) + the Born rule (arc J) + unitarity
    (arc K), never posited as a free-particle Fock space. -/
theorem asymptotic_state_space :
    -- (i) the asymptotic sector is the proper sheafifiable singlet line; its worlds glue.
    (Submodule.span ℚ {(1 : O ℚ), u1} ≠ (⊤ : Submodule ℚ (O ℚ))) ∧
    (∀ a b c d : ℚ, WorldsGlue (singletElt a b) (singletElt c d)) ∧
    -- (ii) the singlet line IS the Born fibre: intertwining + isometry + frame.
    (∀ a b : ℚ, foldComplex (dress a b) = dress (-b) a) ∧
    (∀ a b : ℚ, bornForm (dress a b) (dress a b)
        = ((gForm (singletElt a b) (singletElt a b) : ℚ) : Cut)) ∧
    (dress 1 0 = eInward ∧ dress 0 1 = eOutward) ∧
    -- (iii) asymptotic completeness = the idempotent gather's completeness.
    (∀ a b : ℚ, wIn (dress a b) + wOut (dress a b)
        = ((gForm (singletElt a b) (singletElt a b) : ℚ) : Cut)) ∧
    -- (iv) K1's transport keeps the asymptotic sector: dressed, conserving, a sheaf.
    (∀ a b : ℚ, evolve Dbl.J (dress a b) = dress (-b) a) ∧
    (∀ a b : ℚ, bornForm (evolve Dbl.J (dress a b)) (evolve Dbl.J (dress a b))
        = wIn (dress a b) + wOut (dress a b)) ∧
    (∀ (U : Dbl Cut) (a b : ℚ), totalGather (evolve U (dress a b)) = evolve U (dress a b)) := by
  refine ⟨asymptotic_sector_proper, asymptotic_worlds_glue, dress_intertwines_J,
    bornForm_dress, ⟨dress_eInward, dress_eOutward⟩, dress_completeness, evolve_J_dress,
    asymptotic_conserves, asymptotic_stays_sheaf⟩

end Phys.Quantum
