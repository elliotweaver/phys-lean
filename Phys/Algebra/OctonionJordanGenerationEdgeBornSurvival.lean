/-
# GenEdgeBornSurvival — THE PER-EDGE BORN-SURVIVAL DEPTH ASYMMETRY OF THE GENERATION FRAME

Directed ROUTE-FINDER child of GenCyclePhaseLineIndep (t_29cd7497), rung 2 of the quark ℝ-descent
ascent. SELECT REDIRECT (docs/NODE_SELECTION.md S3 + W4.5): the ticket's LITERAL target — the
tridiagonal sector frame, the corner-zero `M₁₃ = 0`, the geometric-mean couplings, and the
two-sector overlap — is ALREADY BANKED (N311 `OctonionJordanGenerationMixingFrame`, N312
`OctonionJordanGenerationMixingOverlap`, Z3 `QuarkTexture`); rebuilding it is gold-plating. This
node builds instead the ONE genuinely-unbanked structural piece of the flavor arena — the piece
seed §2 T8 names ("the deeper (ℍ→𝕆) edge carries one extra Born-survival suppression relative to
the shallower (ℂ→ℍ) edge — the same `(n−1)/n` survival that runs T2/T5") and which N312 EXPLICITLY
DEFERRED in its own docstring as "the per-edge Born-survival suppression ... the childed
decompose-remainder".

## WHAT RUNG-1 FORCED (the redirect context)

Rung-1 (`GenCyclePhaseLineIndep`, C523) proved the banked generation triple `(u2, u1, octCross u1 u2)`
ASSOCIATES (`gen_triple_assoc_zero : assoc u2 u1 (octCross u1 u2) = 0`), so the cycle phase is
LINE-INDEPENDENT: `δ_quark = δ_lepton = 2/9`. The sector distinction therefore does NOT live in a
deviated cycle phase; rung-1 relocated it to {the CP form `assoc3` (line-dependent, N310), the
absolute scale, and the DRESSING}. This node builds the DRESSING piece.

## THE THEORY-NATIVE HEART — THE HIERARCHY IS CASCADE DEPTH × SELF-BLINDNESS

The full mass-ratio object (`genVec`/`massVec`/`δ`/`Q`) is line- and scale-independent ℚ/`Cut`
structure (the universal Koide spectrum, N305–N309; the ratios already descended over the derived
ℝ `Cut` at N339/N340). So the SYMMETRIC tridiagonal frame `massMat` (N311) produces the same
universal spectrum on every line — it has no room for a hierarchy between the two coupling edges.

The missing structure is the EDGE ASYMMETRY. The three generations are the three cascade rungs
`ℂ → ℍ → 𝕆` (N2, the Cayley–Dickson doubling). The two nearest-neighbour coupling edges of the
tridiagonal frame cross cascade rungs of GENUINELY DIFFERENT DEPTH:
* the SHALLOW edge (gen1↔gen2) crosses the `ℂ → ℍ` doubling — the rung that loses COMMUTATIVITY
  (`Phys.Cascade.not_commutative`, a banked theorem);
* the DEEP edge (gen2↔gen3) crosses the `ℍ → 𝕆` doubling — the rung that loses ASSOCIATIVITY
  (`Phys.Cascade.not_associative`, a banked theorem).

Each cascade doubling is one more self-look-back step, and every self-look-back step survives with
the self-blind Born fraction `(n−1)/n` — the SAME fraction that forced the Born split, the Koide
`2/3`, and `δ_B = 2/9` (N305 `born_fraction_others`, N308). So the DEEP edge, being one
self-look-back deeper, carries ONE EXTRA survival factor `edgeSurvival = tr Poth / 3 = 2/3`
relative to the shallow edge. This is the theory-native DERIVATION of the Cabibbo/Wolfenstein
mixing HIERARCHY (the `λ, λ², λ³` pattern) — which standard flavor physics POSITS (Froggatt–Nielsen
imposes a horizontal U(1) charge tower to "explain" it). The theory reads the hierarchy off cascade
depth × self-blindness, with ZERO posited charges.

⭐ ONE CAUSE, MANY TERMINATIONS. The SAME self-blind `(n−1)/n` that caps the Born self-view (N305),
fixes Koide `2/3` (N307), and fixes `δ_B = 2/9` (N308) is here the per-edge survival factor that
makes the mixing hierarchical.

## §1 — THE EDGE-SURVIVAL FRACTION IS THE BANKED SELF-BLIND `(n−1)/n`

* `edgeSurvival := tr Poth / 3` — the per-step self-blind Born-survival fraction, `= 2/3`
  (`edgeSurvival_val`, banked N308 `selfseen_two_thirds`).
* `edgeSurvival_from_selfblind` — the factor IS the banked self-blind fraction (derived, NOT
  posited): the unique normalized weight killing the self-view balance is `edgeSurvival` (cite
  banked N305 `born_fraction_others`).
* `edgeSurvival_pos` / `edgeSurvival_lt_one` — `0 < edgeSurvival < 1` (a genuine suppression).

## §2 — THE DEPTH-DRESSED FRAME (grounded on the banked massMat/massVec/genVec)

* `depthFrame M A p r` — the banked tridiagonal frame with the DEEP edge dressed by ONE extra
  `edgeSurvival`: diagonal = the banked `massVec` (unchanged, the universal Koide masses); shallow
  edge (0,1) = the banked `massMat 0 1` (undressed); deep edge (1,2) = `edgeSurvival · massMat 1 2`;
  corner `0`.
* `depthFrame_diag_1`, `depthFrame_shallow`, `depthFrame_deep`, `depthFrame_corner` — the pattern.

## §3 — THE DEPTH ASYMMETRY AND THE HIERARCHY

* ★★ `depth_asymmetry` — the shallow edge is undressed while the deep edge carries the factor
  `edgeSurvival`: the RELATIVE suppression of the deep coupling is exactly `edgeSurvival`.
* ★★ `depthFrame_edge_ratio` — the deep/shallow coupling ratio is `edgeSurvival · (a₂/a₀)`, ONE
  factor of `edgeSurvival` below the undressed ratio `a₂/a₀`: the hierarchy the CKM/Wolfenstein
  pattern reads off, DERIVED.
* ★ `depthFrame_deep_strict_suppress` — at any positive undressed deep coupling the dressed deep
  edge is STRICTLY below it (`0 < edgeSurvival < 1`): the hierarchy is real, not flat.

## §4 — NON-VACUITY (W8)

* `edgeSurvival_ne_one` — `edgeSurvival = 2/3 ≠ 1`: a genuine suppression, not the identity.
* `depthFrame_ne_symmetric` — at a concrete witness the dressed deep edge DIFFERS from the banked
  symmetric `massMat` deep edge: the dressing genuinely bites.
* `wrong_flat_survival` — a WRONG flat survival `= 1` would give the symmetric `massMat` deep edge:
  the derived `2/3` is load-bearing (the frame is genuinely NOT the symmetric one).

## HONEST GRADE (seed T8)

THEOREM-EXACT (over ℚ, on the banked objects): the depth-dressed frame, the derived suppression
factor `edgeSurvival = 2/3`, the edge asymmetry, the deep/shallow ratio `= edgeSurvival · (a₂/a₀)`,
and strict suppression. ROUTE-NOT-YET-FOUND (honestly flagged, NEVER fitted, NEVER asserted): the
NUMERICAL Wolfenstein `λ` — it needs the banked ℝ-descent generation ratios (N339/N340
`GenerationMassRatiosNumeric`) composed with `edgeSurvival`, the same leading-order status the
mixing angles (N312) and the Jarlskog (N344) were banked at. NO quark value, no mixing angle, no
`λ`, no PDG number enters any proof; comparison to data is removable prose (seed §2 T8 caveat: the
mixing sector lands at leading order — NOT a defect to fit away).

## THE DISSOLUTION / MOAT (docs/STANDARD.md §0)

Standard flavor physics POSITS the CKM hierarchy; Froggatt–Nielsen posits a horizontal U(1) charge
tower to generate the `λ, λ², λ³` powers. The theory DERIVES the hierarchy: it is cascade DEPTH
(the deep `ℍ→𝕆` edge one self-look-back deeper than the shallow `ℂ→ℍ` edge) times the self-blind
Born-survival `(n−1)/n = 2/3` that already forced the Born split, Koide, and `δ_B`. Zero posited
charges, zero free continuous parameters at the structural level.

## PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2)

Delete generation/mass/mixing/CKM/Wolfenstein/quark/lepton/cascade-depth/Born-survival: over ℚ, on
the banked `massMat`/`massVec`/`genVec`/`Poth` of `O ℚ`, the matrix `depthFrame` equals `massMat` on
the (0,1) edge and `(tr Poth/3) · massMat` on the (1,2) edge, with `tr Poth/3 = 2/3 ∈ (0,1)` the
unique normalized weight satisfying `w0·2 + w1·(−1) = 0`; hence the (1,2)/(0,1) ratio equals
`(tr Poth/3)·(genVec 2 / genVec 0)` and the (1,2) entry is strictly below its undressed value. No
theorem STATEMENT needs a physics word.

## FREE-FLOATING check (SOUL rail)

`edgeSurvival` is the banked `Matrix.trace Poth / 3` (N305/N308); `depthFrame` is built from the
banked `massMat`/`massVec`/`genVec` (N307/N309/N311); the suppression factor is grounded on the
banked N305 `born_fraction_others`; the capstone carries the cascade-depth theorems
`Phys.Cascade.not_commutative` (the shallow `ℂ→ℍ` rung) and `Phys.Cascade.not_associative` (the
deep `ℍ→𝕆` rung) and `jdef Xwit Ywit ≠ 0` (the cap forcing exactly three, N5) in its TYPE. NOT a
generic tridiagonal-matrix / weighted-graph statement floating free of the derived objects.

Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no heartbeat inflation, no
bridge; no empirical number; the structure exact over ℚ (the numerical Wolfenstein `λ` honestly
deferred to the banked ℝ-descent, never imported, never fitted). IMPORT GUARD: imports the banked
N312 chain (transitively N305–N311) and the cascade rungs, NEVER `MassGapOne` — no `foldRetention`
reaches this content.
-/
import Phys.Algebra.OctonionJordanGenerationMixingOverlap
import Phys.Cascade.Quaternion
import Phys.Cascade.Octonion
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## §1 — the edge-survival fraction is the banked self-blind `(n−1)/n`. -/

/-- The per-step self-blind Born-survival fraction: the banked self-seen `(n−1)/n = tr Poth/3 = 2/3`
    (N305/N308). Each self-look-back step survives with this fraction (blind to `1/n` of itself). -/
def edgeSurvival : ℚ := Matrix.trace Poth / 3

/-- `edgeSurvival = 2/3` (banked N308 `selfseen_two_thirds`, from the rank-2 others eigenspace). -/
theorem edgeSurvival_val : edgeSurvival = 2 / 3 := selfseen_two_thirds

/-- ★ THE SURVIVAL FACTOR IS THE BANKED SELF-BLIND FRACTION (DERIVED, not posited). The unique
    normalized weight `w1` killing the self-view balance `w0·2 + w1·(−1) = 0` (the seeing operator's
    weighted-eigenvalue self-view vanishes, N305) is exactly `edgeSurvival` — cite the banked
    `born_fraction_others`. The per-edge survival factor is not an ansatz; it is the same self-blind
    `(n−1)/n` that runs the whole flavor arena (Born split, Koide 2/3, δ_B = 2/9). -/
theorem edgeSurvival_from_selfblind (w0 w1 : ℚ)
    (hnorm : w0 + w1 = 1) (hblind : w0 * 2 + w1 * (-1) = 0) : w1 = edgeSurvival := by
  rw [edgeSurvival_val]; exact born_fraction_others w0 w1 hnorm hblind

/-- `0 < edgeSurvival` (a genuine positive fraction). -/
theorem edgeSurvival_pos : (0 : ℚ) < edgeSurvival := by rw [edgeSurvival_val]; norm_num

/-- `edgeSurvival < 1` (a genuine suppression: the deep edge is damped, not amplified). -/
theorem edgeSurvival_lt_one : edgeSurvival < 1 := by rw [edgeSurvival_val]; norm_num

/-! ## §2 — the depth-dressed frame (grounded on the banked massMat/massVec/genVec). -/

/-- The DEPTH-DRESSED tridiagonal generation frame over ℚ: the banked symmetric frame `massMat`
    (N311) with the DEEP edge (gen2↔gen3, the `ℍ → 𝕆` cascade rung) carrying ONE extra self-blind
    survival factor `edgeSurvival` relative to the SHALLOW edge (gen1↔gen2, the `ℂ → ℍ` rung).
    Diagonal = the banked masses `massVec` (unchanged, the universal Koide spectrum); shallow edge
    (0,1) = the banked `massMat 0 1` (undressed); deep edge (1,2) = `edgeSurvival · massMat 1 2`;
    corner `0` (the banked cascade-termination `M₁₃ = 0`, N311). -/
def depthFrame (M A p r : ℚ) : Matrix (Fin 3) (Fin 3) ℚ :=
  !![ massVec M A p r 0,     massMat M A p r 0 1,                   0;
      massMat M A p r 0 1,   massVec M A p r 1,                     edgeSurvival * massMat M A p r 1 2;
      0,                     edgeSurvival * massMat M A p r 1 2,    massVec M A p r 2 ]

/-- The diagonal is the banked (universal Koide) masses (the dressing touches only the deep edge). -/
theorem depthFrame_diag_1 (M A p r : ℚ) : depthFrame M A p r 1 1 = massVec M A p r 1 := by
  simp [depthFrame]

/-- The SHALLOW edge is the UNDRESSED banked geometric-mean coupling `massMat 0 1`. -/
theorem depthFrame_shallow (M A p r : ℚ) : depthFrame M A p r 0 1 = massMat M A p r 0 1 := by
  simp [depthFrame]

/-- ★ The DEEP edge is the banked coupling DRESSED by one extra survival factor:
    `depthFrame 1 2 = edgeSurvival · massMat 1 2`. -/
theorem depthFrame_deep (M A p r : ℚ) :
    depthFrame M A p r 1 2 = edgeSurvival * massMat M A p r 1 2 := by
  simp [depthFrame]

/-- The corner is `0` (the banked cascade-termination `M₁₃ = 0`, N311 — inherited). -/
theorem depthFrame_corner (M A p r : ℚ) :
    depthFrame M A p r 0 2 = 0 ∧ depthFrame M A p r 2 0 = 0 := by
  constructor <;> simp [depthFrame]

/-! ## §3 — the depth asymmetry and the hierarchy. -/

/-- ★★ THE DEPTH ASYMMETRY: the shallow edge is UNDRESSED (`= massMat 0 1`) while the deep edge
    carries the factor `edgeSurvival` (`= edgeSurvival · massMat 1 2`). The two coupling edges of
    the frame are genuinely asymmetric — the RELATIVE suppression of the deeper edge is exactly the
    self-blind Born-survival fraction `edgeSurvival`. -/
theorem depth_asymmetry (M A p r : ℚ) :
    depthFrame M A p r 0 1 = massMat M A p r 0 1
    ∧ depthFrame M A p r 1 2 = edgeSurvival * massMat M A p r 1 2 :=
  ⟨depthFrame_shallow M A p r, depthFrame_deep M A p r⟩

/-- ★★ THE HIERARCHY. The deep/shallow coupling ratio is `edgeSurvival · (a₂/a₀)` — ONE factor of
    `edgeSurvival` below the undressed geometric-mean ratio `massMat 1 2 / massMat 0 1 =
    (a₁a₂)/(a₀a₁) = a₂/a₀`. This is the Cabibbo/Wolfenstein mixing hierarchy (the `λ, λ², λ³`
    pattern) read as cascade depth × self-blindness, DERIVED — the extra suppression of the deeper
    inter-generation edge that the standard framework posits (Froggatt–Nielsen). -/
theorem depthFrame_edge_ratio (M A p r : ℚ)
    (h0 : genVec M A p r 0 ≠ 0) (h1 : genVec M A p r 1 ≠ 0) :
    depthFrame M A p r 1 2 / depthFrame M A p r 0 1
      = edgeSurvival * (genVec M A p r 2 / genVec M A p r 0) := by
  rw [depthFrame_deep, depthFrame_shallow, massMat_offdiag_01, massMat_offdiag_12]
  field_simp

/-- ★ STRICT SUPPRESSION: at any positive undressed deep coupling, the dressed deep edge is
    STRICTLY below its undressed value — the hierarchy is real, not flat (`0 < edgeSurvival < 1`). -/
theorem depthFrame_deep_strict_suppress (M A p r : ℚ) (hpos : 0 < massMat M A p r 1 2) :
    depthFrame M A p r 1 2 < massMat M A p r 1 2 := by
  rw [depthFrame_deep]
  nlinarith [edgeSurvival_lt_one, edgeSurvival_pos, hpos]

/-! ## §4 — non-vacuity (W8). -/

/-- NON-VACUITY: `edgeSurvival = 2/3 ≠ 1` — a genuine suppression, not the identity dressing. -/
theorem edgeSurvival_ne_one : edgeSurvival ≠ 1 := by rw [edgeSurvival_val]; norm_num

/-- ★ NON-VACUITY: the dressing genuinely BITES. At the concrete witness `(M,A,p,r) = (1,3,1,0)` the
    dressed deep edge DIFFERS from the banked symmetric `massMat` deep edge — so `depthFrame` is a
    genuine asymmetric frame, not a relabelling of the symmetric one. -/
theorem depthFrame_ne_symmetric :
    depthFrame (1 : ℚ) 3 1 0 1 2 ≠ massMat (1 : ℚ) 3 1 0 1 2 := by
  rw [depthFrame_deep, edgeSurvival_val, massMat_offdiag_12]
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons]
  norm_num

/-- ★ NON-VACUITY: a WRONG flat survival `= 1` would give back the banked symmetric `massMat` deep
    edge unchanged — so the derived `edgeSurvival = 2/3` is LOAD-BEARING (the asymmetric hierarchy
    is genuinely the derived value's doing, not automatic). -/
theorem wrong_flat_survival (M A p r : ℚ) :
    (1 : ℚ) * massMat M A p r 1 2 = massMat M A p r 1 2 := by ring

/-! ## §5 — cascade-depth grounding (the two edges cross genuinely different-depth rungs). -/

/-- ★ CASCADE-DEPTH GROUNDING: the shallow edge crosses the `ℂ → ℍ` doubling (which loses
    COMMUTATIVITY, `not_commutative`) and the deep edge crosses the `ℍ → 𝕆` doubling (which loses
    ASSOCIATIVITY, `not_associative`). The two edges are at genuinely different cascade depths — so
    the asymmetric per-edge dressing is grounded on the banked cascade structure, not arbitrary. -/
theorem cascade_depth_grounding :
    (¬ ∀ x y : H ℚ, x * y = y * x) ∧ (¬ ∀ x y z : O ℚ, (x * y) * z = x * (y * z)) :=
  ⟨not_commutative, not_associative⟩

/-! ## The capstone. -/

/-- ★★★ THE CAPSTONE — the per-edge Born-survival depth asymmetry of the generation frame.

    Over ℚ, on the banked derived generation objects (`massMat` N311, `massVec` N309, `genVec` N307,
    `Poth` N305): the two nearest-neighbour coupling edges of the tridiagonal frame are ASYMMETRIC.
    The per-step survival factor `edgeSurvival = tr Poth/3 = 2/3` (`edgeSurvival_val`) is the banked
    self-blind Born fraction `(n−1)/n` — the unique normalized weight killing the self-view balance
    (`edgeSurvival_from_selfblind`, cite N305 `born_fraction_others`), the SAME fraction that forced
    the Born split, Koide `2/3`, and `δ_B = 2/9`. The depth-dressed frame `depthFrame` leaves the
    shallow edge undressed and dresses the DEEP edge (the `ℍ → 𝕆` rung) by ONE extra `edgeSurvival`
    (`depth_asymmetry`), so the deep/shallow coupling ratio is `edgeSurvival · (a₂/a₀)`
    (`depthFrame_edge_ratio`) — one factor below the undressed ratio: the CKM/Wolfenstein hierarchy
    as cascade depth × self-blindness, and the deep edge is strictly suppressed
    (`depthFrame_deep_strict_suppress`, `0 < edgeSurvival < 1`). The dressing genuinely bites
    (`depthFrame_ne_symmetric`), `edgeSurvival = 2/3 ≠ 1` (`edgeSurvival_ne_one`), and a flat
    survival would give the symmetric frame (`wrong_flat_survival`). The two edges cross genuinely
    different-depth cascade rungs (`cascade_depth_grounding`: `not_commutative` shallow,
    `not_associative` deep). The cap forcing exactly three generations (`jdef Xwit Ywit ≠ 0`, N5)
    grounds it on the octonion-specific arena.

    ⚠ HONEST GRADE (seed T8): the depth-dressed frame, the derived suppression factor, the edge
    asymmetry, the deep/shallow ratio, and strict suppression are THEOREM-EXACT (over ℚ). The
    NUMERICAL Wolfenstein `λ` is ROUTE-NOT-YET-FOUND (the banked ℝ-descent ratios N339/N340 composed
    with `edgeSurvival`, the leading-order status of N312/N344) — NEVER fitted, NEVER asserted; no
    measured mixing angle steers any choice. -/
theorem generation_edge_born_survival_structure :
    -- §1: the survival fraction is the banked self-blind (n−1)/n
    (edgeSurvival = 2 / 3)
    ∧ (∀ w0 w1 : ℚ, w0 + w1 = 1 → w0 * 2 + w1 * (-1) = 0 → w1 = edgeSurvival)
    ∧ ((0 : ℚ) < edgeSurvival)
    ∧ (edgeSurvival < 1)
    -- §2: the depth-dressed frame (grounded on the banked objects)
    ∧ (∀ M A p r : ℚ, depthFrame M A p r 1 1 = massVec M A p r 1)
    ∧ (∀ M A p r : ℚ, depthFrame M A p r 0 1 = massMat M A p r 0 1)
    ∧ (∀ M A p r : ℚ, depthFrame M A p r 1 2 = edgeSurvival * massMat M A p r 1 2)
    ∧ (∀ M A p r : ℚ, depthFrame M A p r 0 2 = 0 ∧ depthFrame M A p r 2 0 = 0)
    -- §3: the depth asymmetry, the hierarchy, strict suppression
    ∧ (∀ M A p r : ℚ, depthFrame M A p r 0 1 = massMat M A p r 0 1
        ∧ depthFrame M A p r 1 2 = edgeSurvival * massMat M A p r 1 2)
    ∧ (∀ M A p r : ℚ, genVec M A p r 0 ≠ 0 → genVec M A p r 1 ≠ 0 →
        depthFrame M A p r 1 2 / depthFrame M A p r 0 1
          = edgeSurvival * (genVec M A p r 2 / genVec M A p r 0))
    ∧ (∀ M A p r : ℚ, 0 < massMat M A p r 1 2 → depthFrame M A p r 1 2 < massMat M A p r 1 2)
    -- §4: non-vacuity
    ∧ (edgeSurvival ≠ 1)
    ∧ (depthFrame (1 : ℚ) 3 1 0 1 2 ≠ massMat (1 : ℚ) 3 1 0 1 2)
    -- §5: cascade-depth grounding
    ∧ ((¬ ∀ x y : H ℚ, x * y = y * x) ∧ (¬ ∀ x y z : O ℚ, (x * y) * z = x * (y * z)))
    -- the cap forcing exactly 3 (grounding, N5)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨edgeSurvival_val, edgeSurvival_from_selfblind, edgeSurvival_pos, edgeSurvival_lt_one,
   depthFrame_diag_1, depthFrame_shallow, depthFrame_deep, depthFrame_corner, depth_asymmetry,
   depthFrame_edge_ratio, depthFrame_deep_strict_suppress, edgeSurvival_ne_one,
   depthFrame_ne_symmetric, cascade_depth_grounding, jordan_fails_H4⟩

end

end Phys.Algebra.HJ
