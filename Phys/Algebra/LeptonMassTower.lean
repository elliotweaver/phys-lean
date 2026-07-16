/-
  Phys.Algebra.LeptonMassTower — N467 (SEED_EXACT_DRESSING.md, arc X, target X8).
  ============================================================================================
  THE ABSOLUTE LEPTON MASSES AS THE COUPLING BAND TOWER'S ELECTROWEAK EDGE × THE FLAVOR RATIOS.

  ── THE THEORY-NATIVE READING (seed §X8, the arc-X frame). ──────────────────────────────────
  Arc X reads the running coupling as the gather's per-channel Born self-overlap RESOLVED AT A
  SCALE: at the octonion ceiling the gather resolves all 42 channels → 1/α* = 42; descending the
  FINITE band tower it is screened up to 1/α(0) (X6, `invAlphaZero`). The tower's ELECTROWEAK band
  edge is the banked exact rung `v/M = ewClosureRatio = cutExp(−28·cutPi/3)` (arc B / N332); the
  coupling tower's top-band scale ratio is its inverse `topBandRatio = ewClosureRatio⁻¹ =
  cutExp(28·cutPi/3)` (X6 `topBandRatio_eq`), and the coupling READING at that edge is the EXACT
  cutPi-free `invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582/27` (X6
  `invAlphaZero_topBand_value`).

  The absolute mass sector (arc P) supplies a DETERMINED parameter-free absolute scale
  `massScale = absScaleChainDerived` (N417, discharge of arc M) which FACTORS THROUGH THE SAME
  electroweak rung: `massScale = ewClosureRatio · (cutCos foldPhase · s1BornProb · 1 · cutCos(2/3))`
  (banked `absScaleChainDerived_eq_anchor_mul`). Combined with the forced flavor eigenvalue ratios
  `mass_k = b_k²` at the derived cycle phase δ_B = 2/9 (N340), the banked absolute spectrum is
  `absMass k = massScale · mass_k` (N427).

  ── WHAT THIS NODE ADDS (the arc-X weld, genuinely new over the banked modules). ──────────────
  N427 (`AbsoluteMassSpectrum`) already banks `absMass k = massScale · mass_k`, the ordering, the
  ratio inheritance, the scale-invariant Koide, the breaking direction — this node IMPORTS and CITES
  all of it, it does NOT re-derive it. X6 banks the coupling tower's `topBandRatio` and the exact
  reading 1582/27. NEITHER module connects the two.

  THE NEW CONTENT is the WELD: the absolute lepton mass scale and the fine-structure coupling are
  BOTH readings of the ONE finite tower from the octonion ceiling, AT THE SAME electroweak band edge
  `ewClosureRatio = topBandRatio⁻¹`. Concretely:
    • `leptonBundle := massScale · topBandRatio` — the mass scale measured IN the coupling tower's
      electroweak-edge units — equals the pure DERIVED suppression bundle
      `cutCos foldPhase · s1BornProb · cutCos(2/3)` (`leptonBundle_eq_bundle`): the exact scale rung
      `ewClosureRatio` CANCELS against the coupling tower's `topBandRatio = ewClosureRatio⁻¹`, so the
      mass scale, read in coupling-tower edge units, is exactly the fold-phase / gear-survival /
      ℝ-descent suppression — no exponential, no free parameter.
    • `massScale = ewClosureRatio · leptonBundle` (`massScale_eq_edge_bundle`): the mass scale is the
      electroweak band edge times the suppression bundle — the SAME edge the coupling reads.
    • `absMass k = ewClosureRatio · leptonBundle · mass_k` (`absMass_tower`): the absolute masses in
      the tower frame — band edge × suppression × forced flavor ratio.
    • the coupling reading `invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582/27` and the mass
      reading `massScale · topBandRatio = leptonBundle` SHARE the one `topBandRatio` — one tower, two
      observables, one edge (the ONE-CAUSE weld).

  ── THE DISSOLUTION / MOAT. ────────────────────────────────────────────────────────────────────
  The Standard Model treats α and the fermion masses as UNRELATED inputs, measured separately at
  unrelated scales (α at zero momentum / M_Z, masses from Yukawa couplings), with the electroweak
  scale `v` and a free Yukawa per fermion. The theory forces BOTH from the ONE finite band tower from
  the octonion ceiling: the coupling reads the SCREENING across the top band (1582/27), the masses
  read the SCALE of the same band edge (ewClosureRatio) times the derived suppression bundle times
  the forced flavor ratios (δ_B = 2/9, ZERO shape parameters). One tower, one edge, two readings.

  ── HONEST GRADE (per piece). ──────────────────────────────────────────────────────────────────
    • THEOREM-EXACT (no error bar, foundations-only, grounded on the banked derived objects): the
      weld `massScale · topBandRatio = leptonBundle` (`weld_eq`); the bundle identity `leptonBundle =
      cutCos foldPhase · s1BornProb · cutCos(2/3)` (`leptonBundle_eq_bundle`); the strict suppression
      `0 < leptonBundle < 1` (`leptonBundle_pos`/`leptonBundle_lt_one`); the tower-frame absolute mass
      `absMass k = ewClosureRatio · leptonBundle · mass_k` (`absMass{0,1,2}_tower`); the coupling
      reading `invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582/27` (`coupling_reading`, cited
      X6); the flavor ratios / ordering / Koide (`abs_ratio_*`, `absMass_order_*`, `koide_abs`, cited
      N427).
    • ANCHORED-ON-DERIVED-SCALE (theorem-grade determined Cut object, parameter-free): the absolute
      masses `absMass k = massScale · mass_k` themselves as derived reals, `0 < massScale <
      ewClosureRatio < 1` — the absolute (non-ratio) spectrum in the arena's natural unit M_oct := 1.
    • MECHANISM / REMOVABLE PROSE (enumerated for X10, NEVER asserted/fitted): the physical GeV value
      of each mass (needs the M_oct → MeV unit conversion, one human unit choice); the e/μ/τ labelling
      of the three ordered eigenvalues. The measured PDG masses (0.511, 105.7, 1776.9 MeV) are
      REMOVABLE PROSE only — in no proof (NO-FIT loudest).

  ── PHYSICS-WORDS-REMOVABLE (STANDARD §2, seed G5). ───────────────────────────────────────────
  Delete "mass / lepton / coupling / electroweak / fine-structure / Yukawa / band / screening":
  over the derived ℝ `Cut`, with `S = absScaleChainDerived` and `t = ewClosureRatio⁻¹`, one has
  `S·t = cutCos foldPhase · (2/3) · cutCos(2/3)`, `0 < S·t < 1` (since `S < ewClosureRatio` and
  `ewClosureRatio·t = 1`), `S = ewClosureRatio · (S·t)`, `S·mass_k = ewClosureRatio · (S·t) · mass_k`,
  the products `S·mass_k` carry the banked N340 brackets, and `invAlphaZero [(d, t)] = 1582/27`. Pure
  real analysis on `Cut`. No name is load-bearing.

  ⚠ FREE-FLOATING RAIL (SOUL). Every theorem is stated at the BANKED objects: `massScale`/`absMass k`
  (N427), `topBandRatio`/`ewClosureRatio`/`invAlphaZero`/`chargeTraceDepth` (X6/N465, arc B/N332),
  `mass0/1/2`/`abs_ratio_*`/`absMass_order_*`/`koide_abs` (N340/N427), `foldPhase` (N416), `s1BornProb`
  (N408), `cutCos`/`cutExp`/`cutPi`/`Cut` (derived ℝ). `leptonBundle` is literally `massScale ·
  topBandRatio`, never a generic real. Grounded on the tower.

  UNBROKEN: `massScale`/`massScale_pos`/`absMass{0,1,2}`/`absMass_order_*`/`abs_ratio_*`/`koide_abs`
  (N427, AbsoluteMassSpectrum), `absScaleChainDerived_eq_anchor_mul`/`absScaleChainDerived_lt_anchor`
  (N417, ScaleTowerDischargeArcM), `topBandRatio`/`topBandRatio_eq`/`invAlphaZero_topBand_value`/
  `chargeTraceDepth`/`ewClosureRatio_pos` (X6/N465, arc B), `mass0/1/2` (N340), `foldPhase` (N416),
  `s1BornProb` (N408); standard Mathlib MACHINERY (`field_simp`/`ring`/`mul_lt_mul_of_pos_right`/
  `inv_pos`/`mul_inv_cancel₀`) on the derived objects. Ground = derived `Cut` + arena; nothing posited;
  no bridge.

  IMPORT GUARD (foundations firewall, seed §X4/X6): imports the banked X6 coupling module
  (`FineStructureZeroMomentum`, NOT `MassGapOne`) and the audited-foundations-only N427
  (`AbsoluteMassSpectrum`, no `foldRetention`). `#print axioms` on the capstone must be
  ⊆ {propext, Classical.choice, Quot.sound}, NOT carry `foldRetention`.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no kernel-compilation bypass, no heartbeat inflation.
-/
import Phys.Algebra.FineStructureZeroMomentum
import Phys.Algebra.AbsoluteMassSpectrum
import Mathlib.Tactic

namespace Phys.Algebra.LeptonMassTower

open Phys.Algebra
open Phys.Algebra.AbsMass
open Phys.Algebra.DischargeArcM
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.FoldPhase
open Phys.Algebra.Gear
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (A) THE COUPLING TOWER'S ELECTROWEAK-EDGE UNIT AND THE MASS SCALE IN THOSE UNITS. -/

/-- ★ THE LEPTON MASS BUNDLE `leptonBundle = massScale · topBandRatio`: the absolute mass scale
    (N417, arc-P) measured in the COUPLING band tower's electroweak-edge units `topBandRatio =
    ewClosureRatio⁻¹` (X6/N465). This is the arc-X weld object — it ties the arc-P mass sector to the
    arc-X coupling band tower through their SHARED electroweak band edge. -/
def leptonBundle : Cut := massScale * topBandRatio

/-- The coupling tower's electroweak-edge unit is a genuine positive derived scale (`topBandRatio =
    ewClosureRatio⁻¹ > 0`, from `ewClosureRatio > 0`). -/
theorem topBandRatio_pos : (0 : Cut) < topBandRatio := by
  unfold topBandRatio; exact inv_pos.mpr ewClosureRatio_pos

/-! ## (B) THE WELD — the exact scale rung CANCELS: mass scale in coupling-tower units = the pure
    derived suppression bundle (fold-phase × gear-survival × ℝ-descent), no exponential, no free slot. -/

/-- ★★★ THE WELD IDENTITY (T1): `leptonBundle = cutCos foldPhase · s1BornProb · 1 · cutCos(2/3)`. The
    banked mass scale factors through the electroweak rung `ewClosureRatio = cutExp(−28·cutPi/3)`
    (`absScaleChainDerived_eq_anchor_mul`, N417); multiplying by the coupling tower's edge unit
    `topBandRatio = ewClosureRatio⁻¹` (X6) CANCELS the exponential rung, leaving exactly the DERIVED
    suppression bundle — the fold-phase Born amplitude `cutCos foldPhase` (N416), the gear survival
    `s1BornProb = 2/3` (N408), and the ℝ-descent cosine `cutCos(2/3)` (N309-genre). The mass scale,
    read in the coupling tower's own edge units, IS the pure suppression — no free parameter. -/
theorem leptonBundle_eq_bundle :
    leptonBundle
      = (cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3) := by
  unfold leptonBundle massScale topBandRatio
  rw [absScaleChainDerived_eq_anchor_mul]
  have hne : ewClosureRatio ≠ 0 := ne_of_gt ewClosureRatio_pos
  field_simp

/-- ★★ THE MASS SCALE IS THE ELECTROWEAK BAND EDGE × THE SUPPRESSION BUNDLE (T2): `massScale =
    ewClosureRatio · leptonBundle`. The absolute mass scale is the electroweak band edge (the SAME
    `ewClosureRatio` the coupling tower reads at) times the derived suppression bundle — placing the
    lepton mass scale AT the coupling tower's electroweak band edge, not at an unrelated scale. -/
theorem massScale_eq_edge_bundle : massScale = ewClosureRatio * leptonBundle := by
  unfold leptonBundle massScale topBandRatio
  have hne : ewClosureRatio ≠ 0 := ne_of_gt ewClosureRatio_pos
  field_simp

/-! ## (C) POSITIVITY AND STRICT SUPPRESSION (the bundle genuinely bites below the edge). -/

/-- The lepton bundle is a genuine positive derived scale (`massScale > 0`, `topBandRatio > 0`). -/
theorem leptonBundle_pos : (0 : Cut) < leptonBundle :=
  mul_pos massScale_pos topBandRatio_pos

/-- ★★ STRICT SUPPRESSION (T3): `leptonBundle < 1`. The mass scale sits genuinely BELOW the electroweak
    band edge (`massScale < ewClosureRatio`, N417 `absScaleChainDerived_lt_anchor`), so measured in the
    edge units `topBandRatio = ewClosureRatio⁻¹` (with `ewClosureRatio · topBandRatio = 1`) it is
    strictly below `1` — the suppression bundle (fold-phase × 2/3 × ℝ-descent) genuinely bites, the
    masses are a real fraction of the edge, not pinned at it. -/
theorem leptonBundle_lt_one : leptonBundle < 1 := by
  have h1 : massScale < ewClosureRatio := absScaleChainDerived_lt_anchor
  have h2 : (0 : Cut) < topBandRatio := topBandRatio_pos
  have h3 : ewClosureRatio * topBandRatio = 1 := by
    unfold topBandRatio; exact mul_inv_cancel₀ (ne_of_gt ewClosureRatio_pos)
  calc leptonBundle = massScale * topBandRatio := rfl
    _ < ewClosureRatio * topBandRatio := mul_lt_mul_of_pos_right h1 h2
    _ = 1 := h3

/-! ## (D) THE TOWER-FRAME ABSOLUTE MASSES — band edge × suppression × forced flavor ratio. -/

/-- ★★ THE TOWER-FRAME ABSOLUTE MASS (T4, k=0): `absMass0 = ewClosureRatio · leptonBundle · mass0`.
    The banked absolute mass (N427 `absMass0 = massScale · mass0`) written in the coupling-tower
    frame: the electroweak band edge `ewClosureRatio` (shared with the coupling reading) times the
    derived suppression bundle times the forced flavor eigenvalue `mass0 = b0²` (N340, δ_B = 2/9). -/
theorem absMass0_tower : absMass0 = ewClosureRatio * leptonBundle * mass0 := by
  unfold absMass0; rw [massScale_eq_edge_bundle]

theorem absMass1_tower : absMass1 = ewClosureRatio * leptonBundle * mass1 := by
  unfold absMass1; rw [massScale_eq_edge_bundle]

theorem absMass2_tower : absMass2 = ewClosureRatio * leptonBundle * mass2 := by
  unfold absMass2; rw [massScale_eq_edge_bundle]

/-! ## (E) THE COUPLING READING AT THE SAME EDGE (cited X6) — the shared `topBandRatio`. -/

/-- ★★ THE COUPLING READING AT THE SHARED EDGE (T5, cited X6/N465): `invAlphaZero
    [(chargeTraceDepth, topBandRatio)] = 1582/27`. The fine-structure coupling read at the electroweak
    band edge of the SAME finite tower — the exact cutPi-free rational (cutPi cancels between the
    derived loop normalization κ and the derived scale ratio, X6). The mass reading
    (`massScale · topBandRatio = leptonBundle`) and this coupling reading SHARE the one `topBandRatio`. -/
theorem coupling_reading :
    invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 :=
  invAlphaZero_topBand_value

/-! ## (F) THE FLAVOR RATIOS / ORDERING / KOIDE INHERITED (cited N427). -/

/-- The absolute mass ratio `m₁/m₂` carries the banked N340 bracket (cited N427 `abs_ratio_12`). -/
theorem ratio_12 :
    (483 : Cut) / 100000 * absMass2 ≤ absMass1 ∧ absMass1 ≤ (485 : Cut) / 100000 * absMass2 :=
  abs_ratio_12

/-- The absolute mass ratio `m₂/m₀` carries the banked N340 bracket (cited N427 `abs_ratio_20`). -/
theorem ratio_20 :
    (594 : Cut) / 10000 * absMass0 ≤ absMass2 ∧ absMass2 ≤ (595 : Cut) / 10000 * absMass0 :=
  abs_ratio_20

/-- The absolute spectrum is strictly ordered `absMass1 < absMass2 < absMass0` (cited N427). -/
theorem spectrum_ordered : absMass1 < absMass2 ∧ absMass2 < absMass0 :=
  ⟨absMass_order_12, absMass_order_20⟩

/-- The scale-invariant Koide holds at the absolute scale (cited N427 `koide_abs`). -/
theorem koide_absolute :
    (absMass0 + absMass1 + absMass2) / (absAmp0 + absAmp1 + absAmp2) ^ 2 = 2 / 3 :=
  koide_abs

/-! ## (G) NON-VACUITY / TEETH (W8). -/

/-- W8 TEETH: the suppression genuinely bites — `leptonBundle ≠ 1`, so the mass scale is strictly
    below the electroweak band edge, not degenerate with it (a vacuous "all links = 1" reading would
    give `leptonBundle = 1`). -/
theorem leptonBundle_ne_one : leptonBundle ≠ 1 := ne_of_lt leptonBundle_lt_one

/-- W8 TEETH: the lepton bundle is genuinely nonzero — a real determined value, not a collapse to `0`
    (which would make the tower-frame absolute masses vacuous). -/
theorem leptonBundle_ne_zero : leptonBundle ≠ 0 := ne_of_gt leptonBundle_pos

/-- W8 TEETH: the mass scale is genuinely BELOW the coupling tower's electroweak edge (`massScale ≠
    ewClosureRatio`, cited N417) — the weld is a real suppression of the edge, not the edge itself. -/
theorem massScale_ne_edge : massScale ≠ ewClosureRatio :=
  ne_of_lt absScaleChainDerived_lt_anchor

/-- W8 TEETH: the coupling reading at the shared edge genuinely screens above the octonion ceiling
    (`1582/27 > 42`) — the electroweak-edge coupling is not pinned at the un-screened ceiling. -/
theorem coupling_reading_gt_42 : (42 : Cut) < invAlphaZero [(chargeTraceDepth, topBandRatio)] := by
  rw [coupling_reading]; norm_num

/-! ## (H) THE CAPSTONE. -/

/-- ★★★ N467 — THE ABSOLUTE LEPTON MASSES AS THE COUPLING BAND TOWER'S ELECTROWEAK EDGE × THE FLAVOR
    RATIOS (arc-X X8, theorem-grade weld). The absolute lepton mass sector (arc P) and the
    fine-structure coupling (arc X) are BOTH readings of the ONE finite band tower from the octonion
    ceiling, at the SAME electroweak band edge `ewClosureRatio = topBandRatio⁻¹`:
      (T1) the weld identity `leptonBundle = cutCos foldPhase · s1BornProb · 1 · cutCos(2/3)`
           (`leptonBundle_eq_bundle`) — the exact scale rung cancels against the coupling tower's edge
           unit, leaving the pure derived suppression bundle;
      (T2) `massScale = ewClosureRatio · leptonBundle` (`massScale_eq_edge_bundle`) — the mass scale is
           the electroweak band edge (shared with the coupling) times the suppression bundle;
      (T3) strict suppression `0 < leptonBundle < 1` (`leptonBundle_pos`/`leptonBundle_lt_one`);
      (T4) the tower-frame absolute masses `absMass k = ewClosureRatio · leptonBundle · mass_k`
           (`absMass{0,1,2}_tower`) — band edge × suppression × forced flavor ratio;
      (T5) the coupling reading at the SAME edge `invAlphaZero [(chargeTraceDepth, topBandRatio)] =
           1582/27` (`coupling_reading`, X6) — the shared `topBandRatio` welds the two observables;
      (T6) the flavor ratios / ordering / scale-invariant Koide inherited (`ratio_12`/`ratio_20`/
           `spectrum_ordered`/`koide_absolute`, N427).
    Every input banked/derived (N417 scale, X6 coupling tower, N340 eigenvalues); nothing posited; no
    free parameter. HONEST GRADE: T1–T5 theorem-exact (no error bar); the absolute masses `absMass k =
    massScale · mass_k` anchored-on-derived-scale (parameter-free determined Cut); the physical GeV
    numeral (needs the M_oct → MeV unit) and the e/μ/τ labelling are REMOVABLE PROSE / route-NOT-YET-
    FOUND (enumerated for X10), never asserted, never fitted. NO empirical number in any proof. -/
theorem leptonMassTower_landing :
    -- T1: the weld identity — mass scale in coupling-tower units = the derived suppression bundle
    (leptonBundle = (cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3))
    -- T2: the mass scale is the shared electroweak band edge × the suppression bundle
    ∧ (massScale = ewClosureRatio * leptonBundle)
    -- T3: strict suppression below the edge
    ∧ (0 < leptonBundle ∧ leptonBundle < 1)
    -- T4: the tower-frame absolute masses (band edge × suppression × forced flavor ratio)
    ∧ (absMass0 = ewClosureRatio * leptonBundle * mass0
        ∧ absMass1 = ewClosureRatio * leptonBundle * mass1
        ∧ absMass2 = ewClosureRatio * leptonBundle * mass2)
    -- T5: the coupling reading at the SAME edge (shared topBandRatio) — one tower, two observables
    ∧ (invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27)
    -- T6: the forced flavor ratios / ordering / scale-invariant Koide inherited (N427)
    ∧ (((483 : Cut) / 100000 * absMass2 ≤ absMass1 ∧ absMass1 ≤ (485 : Cut) / 100000 * absMass2)
        ∧ (absMass1 < absMass2 ∧ absMass2 < absMass0)
        ∧ (absMass0 + absMass1 + absMass2) / (absAmp0 + absAmp1 + absAmp2) ^ 2 = 2 / 3) :=
  ⟨leptonBundle_eq_bundle,
   massScale_eq_edge_bundle,
   ⟨leptonBundle_pos, leptonBundle_lt_one⟩,
   ⟨absMass0_tower, absMass1_tower, absMass2_tower⟩,
   coupling_reading,
   ⟨abs_ratio_12, ⟨absMass_order_12, absMass_order_20⟩, koide_abs⟩⟩

end

end Phys.Algebra.LeptonMassTower
