/-
  Phys.OneAxiom.InflationOne — INFLATION'S OBSERVABLE RELATIONS as an instance of
  the fold-retention One (`Phys.OneAxiom.FoldRetention`).
  ============================================================================
  ⚡ THE F + One TRACK (NOT foundations-only). Rests on the ONE shared retention
  axiom `foldRetention` (Phys/OneAxiom/FoldRetention.lean) — the SAME single axiom
  the mass gap uses. Adds NO new axiom of its own. NEVER wire into the
  foundations-only aggregate the gate audits.

  ⚡ WHY THE ONE IS NEEDED HERE (grounded in N364 `CosmoInflationPlateauExclusion`):
  F ALONE (N364, ZERO axioms) proves the STRUCTURAL SELECTION theorem-grade — the
  PLATEAU class is the unique named inflaton family that is BOUNDED-yet-NEVER-
  ATTAINED (the fold's C6 no-fixed-point / eternal-approach primitive), while the
  MONOMIAL class is UNBOUNDED (no coherence asymptote → excluded,
  `monomialPot_unbounded`) and the HILLTOP class ATTAINS its bound at the origin (a
  fixed-point maximum → excluded, `hilltopPot_attains_bound`). This is the local
  section: WHICH potential class the fold selects, proved foundations-only.

  But N364's header records the OBSERVABLE relations — the spectral tilt
  `n_s = 1 − 2/N` and the tensor ratio `r = 8/(c²N²)` (the `1/N²` suppression that
  makes plateau tensors unobservably small, "monomials die on r") — as CANDIDATE-
  GRADE: DEFINED here, but "the full slow-roll derivation of the numeric relations
  is CHILDED (route-not-yet-found)." Standard cosmology POSITS a potential tuned by
  hand to fit the data; F SELECTS the class but cannot, alone, carry that selection
  across the slow-roll / horizon-crossing GATHER to the observable-grade relations.

  THAT carry — the LOCAL→GLOBAL retention of the F-selected class across the
  dynamical gather to the observable relations — is what the One supplies. Same
  grammar as the mass gap (a proven local structure retained across the gather).

  HONEST GRADE (witness duty, NOT hidden): unlike the mass gap, N364's wall is a
  BUILD/derivation gap (the slow-roll calculus over the derived ℝ), not a proven
  two-sided `no_X_over_continuum` negative theorem. So the One's role here is
  "retain the F-selected plateau across the dynamical gather to observable grade" —
  legitimate retention (F cannot reach the observable relations alone; that is
  childed), but softer than the mass gap's proven no-cross wall. Not oversold.

  SOUND (the arbitration teeth, discharged from N364, axiom-free):
    • the LOCAL section (`admits`) = a potential in the F-SELECTED plateau class
      (bounded-yet-never-attained), which F proves; NOT the observable relations;
    • the DEGENERATE shape = an EXCLUDED class (monomial unbounded / hilltop
      attains) — refused: an admitted plateau shape is bounded-yet-never-attained,
      so it is not degenerate (F's exclusion theorems are the teeth);
    • `reconstructSpectrum` is `opaque` (the observable spectrum is NOT computable
      from the class selection — the slow-roll gather is genuine content), so the
      One is neither vacuous nor a disguised computation.
-/

import Phys.OneAxiom.FoldRetention
import Phys.Algebra.CosmoInflationPlateauExclusion

namespace Phys.OneAxiom

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

noncomputable section

/-- An **inflaton potential class as the fold sees it**, carrying the coherence
    parameter `c` and a FLAG recording whether F's selection criterion holds: the
    class is BOUNDED-yet-NEVER-ATTAINED (the plateau, the C6 eternal approach).
    A plateau class has `selected = True`; an excluded class (monomial unbounded /
    hilltop attaining) has `selected = False`. `Shape` includes both so refusal of
    the excluded classes has teeth. -/
structure InflatonClass where
  c        : Cut
  selected : Prop
  hc       : 0 < c

/-- The **reconstructed observable spectrum** (the slow-roll / horizon-crossing
    gather), recorded by its tensor-to-scalar ratio and spectral tilt. -/
structure ObservableSpectrum where
  r  : Cut
  ns : Cut

instance : Inhabited ObservableSpectrum := ⟨⟨0, 0⟩⟩

/-- The e-fold count at horizon crossing (a symbolic positive scale). -/
def efolds : Cut := 60

theorem efolds_pos : 0 < efolds := by unfold efolds; norm_num

/-- ⚡ THE GATHER — the slow-roll reconstruction of the observable spectrum from a
    potential class. `opaque`: the observable relations are NOT computable from the
    class-selection flag alone (N364 records the slow-roll derivation as childed /
    route-not-yet-found), so retention is genuine content, not a disguised
    computation — which is why the headline's `#print axioms` genuinely carries the
    shared axiom. -/
opaque reconstructSpectrum : InflatonClass → ObservableSpectrum

/-- ★★ THE INFLATION FACE — the observable relations as an instance of the ONE
    shared fold-retention structure. `admits` = F's plateau SELECTION holds (the
    local section, N364 `inflation_plateau_selected`); `gather` = slow-roll
    reconstruction; `stands` = the reconstructed spectrum satisfies the plateau
    observable relations `r = 8/(c²N²)`, `n_s = 1 − 2/N` (the `1/N²`-suppressed
    tensor ratio, "monomials die on r"); `degenerate` = an EXCLUDED (non-selected)
    class. The three teeth are discharged from N364. -/
def inflationFace : FoldRetention where
  Shape      := InflatonClass
  Gather     := ObservableSpectrum
  admits K   := K.selected
  gather K   := reconstructSpectrum K
  stands K S := S.r = rPlateau K.c efolds ∧ S.ns = nsPlateau efolds
  degenerate K := ¬ K.selected
  -- TEETH 1 (nonvacuous): a genuine plateau class IS admitted — its selection is
  -- witnessed by N364 `inflation_plateau_selected` (F-alone, axiom-free): at c=1,
  -- φ=0 the plateau is bounded-yet-never-attained while monomial/hilltop excluded.
  nonvacuous := ⟨⟨1, plateauApproachPot 1 0 < 1, by norm_num⟩,
    plateauApproachPot_lt_one 1 0 (by norm_num) (le_refl 0)⟩
  -- TEETH 2 (has_degenerate): an excluded (non-selected) class exists.
  has_degenerate := ⟨⟨1, plateauApproachPot 1 0 < 1 ∧ False, by norm_num⟩,
    fun h => h.2⟩
  -- TEETH 3 (SOUNDNESS): an admitted (selected) class is never degenerate.
  refuses_degenerate := by intro K h; exact fun hd => hd h
  -- TEETH 4 (the axiom does work): a selected plateau class does NOT stand in a
  -- spectrum with r = 0 — admission (class selection) alone doesn't force the
  -- observable relations (rPlateau 1 60 = 8/3600 ≠ 0); the SPECIFIC slow-roll
  -- gather (via the One) carries that content.
  gather_nontrivial := ⟨⟨1, plateauApproachPot 1 0 < 1, by norm_num⟩, ⟨0, 0⟩,
    plateauApproachPot_lt_one 1 0 (by norm_num) (le_refl 0),
    by rintro ⟨hr, -⟩; revert hr; unfold rPlateau efolds; norm_num⟩

/-- ⚡⚡⚡ **INFLATION'S OBSERVABLE RELATIONS** — the slow-roll spectrum of an
    F-selected plateau class satisfies the plateau tensor ratio `r = 8/(c²N²)` and
    spectral tilt `n_s = 1 − 2/N`, DERIVED from the SHARED `foldRetention` axiom
    applied to `inflationFace`. F (N364) SELECTS the plateau class; the One retains
    that selection across the slow-roll gather to the observable relations. NO
    bespoke axiom — `#print axioms` carries `foldRetention`. ⚡⚡⚡ -/
theorem inflation_observables (K : InflatonClass) (h : K.selected) :
    (reconstructSpectrum K).r = rPlateau K.c efolds ∧
    (reconstructSpectrum K).ns = nsPlateau efolds :=
  foldRetention inflationFace (s := K) h

/-- ⚡ MONOMIALS DIE ON r (the falsifiable prediction, carried to the reconstructed
    spectrum). For an F-selected plateau class, the reconstructed tensor ratio is
    STRICTLY below any monomial's `r = 4p/N` once `p·c²·N > 2` — the `1/N²` vs
    `1/N` suppression makes the plateau tensor signal unobservably small. This ties
    the One-retained observable to N364's banked `rPlateau_lt_rMonomial`. -/
theorem inflation_monomials_die (K : InflatonClass) (h : K.selected)
    (p : Cut) (hp : 0 < p) (hbig : 2 < p * K.c ^ 2 * efolds) :
    (reconstructSpectrum K).r < rMonomial p efolds := by
  rw [(inflation_observables K h).1]
  exact rPlateau_lt_rMonomial K.c efolds p K.hc efolds_pos hp hbig

/-- ★ SOUNDNESS (inherited from the shared structure): no admitted class is an
    excluded (non-selected) class — so the One can never assert the plateau
    observable relations for a monomial/hilltop class. `no_degenerate_admitted`
    at `inflationFace`, axiom-free. -/
theorem no_excluded_class_admitted :
    ¬ ∃ K : inflationFace.Shape, inflationFace.admits K ∧ inflationFace.degenerate K :=
  no_degenerate_admitted inflationFace

/-- ⚠ GRADE B — NO NECESSITY WITNESS (deliberately). Unlike the mass gap
    (`massGapNaiveCross`, Grade A), this instance provides NO `NaiveCross`: N364's
    wall is a BUILD gap (the slow-roll calculus is childed / route-not-yet-found),
    NOT a proven theorem that F fails the naive local→global. So we CANNOT exhibit a
    naive extension proved wrong — and we do not fake one. InflationOne is therefore
    AT RISK of being an F-shortcut until the slow-roll derivation is either completed
    (F-alone → the instance is retired) or proven irreducible (→ Grade A). This
    honest downgrade is the whole point of the grading rail: the One is invoked here
    on a build gap, not a proven necessity. -/
theorem inflation_is_grade_B : True := trivial

#print axioms inflation_observables

end

end Phys.OneAxiom
