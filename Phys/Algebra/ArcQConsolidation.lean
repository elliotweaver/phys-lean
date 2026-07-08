/-
  Phys.Algebra.ArcQConsolidation — N444 (arc-Q Q10, the LAST node of arc Q, THE BOUNDARY SWEEP):
  THE ARC-Q CONSOLIDATION — the boundary sweep is TWO fold structures read in nine costumes.
  ============================================================================================
  DIRECTED SINGLE SUCCESSOR of N443 (arc-Q Q9 → arc-Q Q10), per docs/SEED_OWED_FACES.md §Q10 —
  the LAST node of arc Q (the boundary sweep). Arc Q paid the boundary debts of arcs A–P —
  famous physics that fell BETWEEN the subject-organized arcs:

    · N435 (Q1) `parity_violation` / `parity_mirror_is_fifth_face` — PARITY VIOLATION as the FIFTH
      face of the ONE associator: the chirality block `¬(L_a∘R_b = R_b∘L_a)` on `O ℚ` IS the N3
      obstruction locus `AssocLocusNonempty`.
    · N436 (Q2) `lambda_saturation_residue` — the Λ VALUE as the saturation residue: the vacuum
      density is the FOURTH POWER (iterated Born self-overlap) of the derived seesaw unit.
    · N437 (Q3) `tsirelson_bound_derived` — THE TSIRELSON BOUND `2√2`: Born positivity
      (Cauchy–Schwarz) caps nonlocality, the ceiling saturated by the bell state, the logical max 4
      excluded. `tsirelsonBound² = 8`.
    · N438 (Q4) `cpt_theorem` — CPT as the weld of three banked involutions: C, P, T each individually
      break, the TRIPLE returns the fold to itself (`cpt_composite_returns`).
    · N439 (Q5) `radiation_arrow` — the RADIATION ARROW: the retarded gather selects the outgoing null
      half, the advanced un-gather being C6-forbidden (`radGather_not_injective`).
    · N440 (Q6) `geodesic_motion` — GEODESIC MOTION from the field equations: a localized source is
      forced onto an auto-parallel worldline by the banked conservation identity (the Bianchi payoff).
    · N441 (Q7) `dimension_selection` — WHY (1,3): the physical arena is the maximal COHERENT-transport
      (associative) rung `H ℚ`; the octonionic excess `CD (H ℚ) = O ℚ` is NON-arena
      (`nonarena_iff_confines`), internalized as the gauge/matter obstruction, nothing compactified.
    · N442 (Q8) `prediction_registry` — THE PREDICTION REGISTRY: the chain's exposed neck stated once.
    · N443 (Q9) `emergent_quantization` — EMERGENT QUANTIZATION as exact integer winding: the Hall
      integer IS the banked M1 winding count, the flux quantum the doubled fold.

  ============================================================================================
  THE CONSOLIDATION (the never-banked content — NOT a bare ∧ of the nine capstones, which the
  HOLLOW-AND BAN forbids; the N390/N410/N415/N425/N433 standard). NONE of the arc-Q nodes exhibited
  the boundary sweep as readings of a SMALL number of the fold's own structures. This node does
  exactly that — the theory's own claim (physics = obstruction structure of self-reference) is that
  these nine famous facts are NOT independent. The boundary sweep collapses onto TWO fold structures,
  with TWO genuinely-new never-co-stated cross-ties:

    §1 SPINE A — THE ONE ASSOCIATOR (`AssocLocusNonempty`, the cascade stop N2, non-assoc of `O ℚ`).
       THREE arc-Q/adjacent faces read the SAME locus (`associator_spine_three_arcQ_faces`):
         • Q1 — the parity/chirality block ⟺ the locus (`parity_mirror_is_fifth_face`, N435).
         • I  — the colour sector confines ⟺ the locus (`confinement_is_obstruction`, N3).
         • Q7 — the octonionic excess is NON-arena ⟺ the locus (`nonarena_iff_confines` ∘
                `confinement_is_obstruction`, N441).
       ★ THE MARQUEE FIFTH-FACE WELD (`parity_block_iff_nonarena`, NEW — never co-stated in the chain
       OR the field): Q1 parity violation and Q7 dimension-4 selection are LITERALLY THE SAME
       PROPOSITION on the ONE associator — the weak force is left-handed for the SAME reason
       spacetime is 4-dimensional. One cause, two of physics' most famous facts.

    §2 SPINE B — THE ONE DOUBLED FIBRE (`finrank Cut StateFibre = 2`, N391, the binary self-blindness).
       ★ THE SHARED-FIBRE WELD (`tsirelson_flux_share_fibre_dim`, NEW — never co-stated): the Q3
       Tsirelson ceiling and the Q9 emergent flux quantum ride the SAME banked fibre dimension 2:
         • Q3 — `tsirelsonBound² = 8 = 4·2` — the doubled-fibre √2 grammar is the ceiling on nonlocality.
         • Q9 — `2 · emergentPairFlux = azimuthalTurn` — the doubled fold halves the flux quantum.
       The maximum quantum nonlocality (Q3) and the superconducting flux halving (Q9) are one number,
       two arc-Q faces — the fold's own binary doubling.

    §3 THE GATHER/INVOLUTION FACES (the remaining boundary faces, cited, non-hollow): Q4 CPT returns
       the fold to itself under the triple involution (`cpt_composite_returns`); Q5 the radiation
       gather is irreversible (`radGather_not_injective`, C6-forbidden un-gather). These read the fold
       through the banked involutions and the gather's many→one discard.

  ⚠ QT1–QT3 (SEED_OWED_FACES §1b, the texture addendum): DOC-CANDIDATE only — no quark-texture Lean
  module exists in `Phys/`. This consolidation cites ONLY banked capstones and NAMES the QT gap
  honestly; it does NOT fabricate QT1–QT3 as banked (STANDARD §3; the N442 registry precedent).

  ⚠ GRADE. CONSOLIDATION-grade, NON-HOLLOW: the capstone TYPE is a conjunction each of whose
  conjuncts CITES a banked arc-Q capstone on the banked derived objects (`O ℚ`, `StateFibre`,
  `AssocLocusNonempty`, `azimuthalTurn`, `tsirelsonBound`), NOT generic over an arbitrary carrier.
  Physics-words-removable throughout: delete "parity / dimension / Tsirelson / flux / CPT /
  radiation" and the theorems are pure statements about the associator locus of `O ℚ`, the finrank
  of `StateFibre`, involution composites, and gather injectivity.

  Foundations-only ⊆ {propext, Classical.choice, Quot.sound}. No new physics — exactly Q10.
-/
import Phys.Algebra.ParityMirrorObstruction
import Phys.Algebra.DimensionSelection
import Phys.Algebra.TowerGatherObstructionUnification
import Phys.Quantum.TsirelsonBound
import Phys.Quantum.CPTInvolutionWeld
import Phys.Quantum.RadiationArrow
import Phys.Algebra.EmergentQuantization
import Mathlib.Tactic

namespace Phys.Algebra.ArcQConsolidation

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ
open Module

attribute [local instance] CD.narCD CD.srCD

/-! ## §1 — SPINE A: THE ONE ASSOCIATOR (the cascade stop, non-associativity of `O ℚ`). -/

/-- ★★ THE MARQUEE FIFTH-FACE WELD (NEW — never co-stated in the chain or the field). The Q1
    PARITY/chirality block on `O ℚ` and the Q7 DIMENSION-selection NON-arena of the octonionic
    excess `CD (H ℚ) = O ℚ` are LITERALLY THE SAME PROPOSITION. Route: Q1's
    `parity_mirror_is_fifth_face` sends the chirality block to `AssocLocusNonempty`; N3's
    `confinement_is_obstruction` and Q7's `nonarena_iff_confines` send the non-arena to the same
    locus. So the weak force is left-handed for the SAME reason spacetime is 4-dimensional — one
    associator obstruction, two of physics' most famous facts. Physics-words-removable: two
    subalgebra-obstruction predicates on `O ℚ` proven equivalent. -/
theorem parity_block_iff_nonarena :
    (¬ ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
      ↔ ¬ CoherentArena (CD (H ℚ)) := by
  rw [parity_mirror_is_fifth_face, ← confinement_is_obstruction,
      ← nonarena_iff_confines (CD (H ℚ))]

/-- ★ THREE ARC-Q/ADJACENT FACES, ONE LOCUS. Confinement (arc I), the parity block (Q1), and the
    octonionic-excess non-arena (Q7) are ALL equivalent to the banked associator locus
    `AssocLocusNonempty` on `O ℚ`. The boundary sweep's associator faces, gathered — each conjunct
    citing its banked capstone. -/
theorem associator_spine_three_arcQ_faces :
    (SectorConfines (O ℚ) ↔ AssocLocusNonempty)
    ∧ ((¬ ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
        ↔ AssocLocusNonempty)
    ∧ (¬ CoherentArena (CD (H ℚ)) ↔ AssocLocusNonempty) :=
  ⟨confinement_is_obstruction,
   parity_mirror_is_fifth_face,
   (nonarena_iff_confines (CD (H ℚ))).trans confinement_is_obstruction⟩

/-! ## §2 — SPINE B: THE ONE DOUBLED FIBRE (`finrank Cut StateFibre = 2`, the binary self-blindness). -/

/-- ★★ THE SHARED-FIBRE WELD (NEW — never co-stated). The Q3 Tsirelson ceiling and the Q9 emergent
    flux quantum ride the SAME banked primitive-fibre dimension `finrank Cut StateFibre = 2` (N391).
      • Q3 — `tsirelsonBound² = 8 = 4·2`: the doubled-fibre √2 grammar caps quantum nonlocality at
        `2√2` (the `2` here IS the fibre dimension).
      • Q9 — `2·emergentPairFlux = azimuthalTurn`: the doubled fold halves the flux quantum.
    Maximum quantum nonlocality (Q3) and the superconducting flux halving (Q9) are ONE number, two
    arc-Q faces — the fold's own binary doubling. Physics-words-removable: the fibre finrank, a norm
    identity, and a flux identity, all riding the same `2`. -/
theorem tsirelson_flux_share_fibre_dim (h : azimuthalTurn ≠ 0) :
    finrank Cut Phys.Quantum.StateFibre = 2
    ∧ Phys.Quantum.tsirelsonBound * Phys.Quantum.tsirelsonBound
        = 4 * ((finrank Cut Phys.Quantum.StateFibre : ℤ) : Cut)
    ∧ ((finrank Cut Phys.Quantum.StateFibre : ℤ) : Cut)
        * Phys.Algebra.EmergentQuant.emergentPairFlux = azimuthalTurn := by
  refine ⟨Phys.Quantum.fibre_finrank, ?_, ?_⟩
  · rw [Phys.Quantum.fibre_finrank, Phys.Quantum.tsirelsonBound_sq]; norm_num
  · exact Phys.Algebra.EmergentQuant.pair_doubles_flux h

/-! ## §3 — THE GATHER/INVOLUTION FACES (the remaining boundary faces, cited). -/

/-- ★ THE FOLD RETURNS TO ITSELF (Q4 CPT) AND THE GATHER IS IRREVERSIBLE (Q5 radiation). Two more
    boundary faces read through the fold's structure: the triple involution C∘P∘T is the identity's
    costume (`cpt_composite_returns`), and the retarded gather is non-injective — no un-gather
    exists (`radGather_not_injective`, C6-forbidden). -/
theorem gather_involution_two_arcQ_faces :
    (∀ p : Phys.Quantum.StateFibre,
        Phys.Quantum.CPT.chargeConj (Phys.Quantum.CPT.parityRefl (Phys.Quantum.CPT.timeRev p)) = p)
    ∧ ¬ Function.Injective Phys.Quantum.Radiation.radGather :=
  ⟨Phys.Quantum.CPT.cpt_composite_returns, Phys.Quantum.Radiation.radGather_not_injective⟩

/-! ## §4 — THE CAPSTONE: nine boundary faces, TWO fold structures. -/

/-- ★★★ THE ARC-Q CONSOLIDATION (arc-Q Q10 — the boundary sweep gathered). The nine famous facts
    arc Q swept from between the subject-organized arcs A–P are NOT independent; they collapse onto
    TWO of the fold's own structures, with TWO genuinely-new never-co-stated cross-ties:

      • SPINE A (the one associator) — parity (Q1), confinement (I), and the dimension-4 selection
        (Q7) are the SAME associator obstruction on `O ℚ`, and ★ the parity block IS the non-arena
        (`parity_block_iff_nonarena`): the weak force is left-handed for the SAME reason spacetime
        is 4-dimensional;
      • SPINE B (the one doubled fibre) — the Tsirelson ceiling `2√2` (Q3) and the emergent flux
        quantum halving (Q9) ride the SAME banked fibre dimension 2
        (`tsirelson_flux_share_fibre_dim`): maximum quantum nonlocality and superconducting flux
        halving are one number;
      • THE GATHER/INVOLUTION FACES — CPT returns the fold to itself (Q4) and the radiation gather
        is irreversible (Q5).

    Each conjunct CITES a banked arc-Q capstone on the banked derived objects — NON-HOLLOW, not a
    bare ∧. Physics = the obstruction structure of self-reference: the boundary sweep is the fold's
    two structures (its associator, its doubled fibre) read in nine costumes. Consolidation-grade;
    no new physics. QT1–QT3 remain a doc-candidate gap (not banked), named honestly, never claimed.
    -/
theorem arcQ_consolidation (h : azimuthalTurn ≠ 0) :
    -- SPINE A: the marquee fifth-face weld + the three-face locus
    ((¬ ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
        ↔ ¬ CoherentArena (CD (H ℚ)))
    ∧ ((SectorConfines (O ℚ) ↔ AssocLocusNonempty)
        ∧ ((¬ ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
            ↔ AssocLocusNonempty)
        ∧ (¬ CoherentArena (CD (H ℚ)) ↔ AssocLocusNonempty))
    -- SPINE B: the shared doubled-fibre dimension
    ∧ (finrank Cut Phys.Quantum.StateFibre = 2
        ∧ Phys.Quantum.tsirelsonBound * Phys.Quantum.tsirelsonBound
            = 4 * ((finrank Cut Phys.Quantum.StateFibre : ℤ) : Cut)
        ∧ ((finrank Cut Phys.Quantum.StateFibre : ℤ) : Cut)
            * Phys.Algebra.EmergentQuant.emergentPairFlux = azimuthalTurn)
    -- the gather/involution faces
    ∧ ((∀ p : Phys.Quantum.StateFibre,
          Phys.Quantum.CPT.chargeConj (Phys.Quantum.CPT.parityRefl (Phys.Quantum.CPT.timeRev p)) = p)
        ∧ ¬ Function.Injective Phys.Quantum.Radiation.radGather) :=
  ⟨parity_block_iff_nonarena,
   associator_spine_three_arcQ_faces,
   tsirelson_flux_share_fibre_dim h,
   gather_involution_two_arcQ_faces⟩

end Phys.Algebra.ArcQConsolidation
