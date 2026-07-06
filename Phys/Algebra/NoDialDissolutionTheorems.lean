/-
  Phys.Algebra.NoDialDissolutionTheorems — N372: THE NO-DIAL DISSOLUTION THEOREMS (arc-F F6).
  ============================================================================================
  arc-F F6 (per docs/SEED_SM_COMPLETION.md §F6). DIRECTED SINGLE SUCCESSOR of N371 (arc-F F5,
  the PMNS neutrino mixing completion). This is the arc-F CAPSTONE.

  THE STANDARD PICTURE (dissolved here). Standard physics carries FOUR separate "fine-tuning"
  problems, each treated as an independent puzzle demanding its own posited mechanism:
    · the STRONG-CP problem — θ̄ < 10⁻¹⁰ (posit: an axion / Peccei–Quinn dial);
    · the COSMOLOGICAL-CONSTANT problem — Λ ≈ 0 to ~120 orders (posit: anthropics / a landscape);
    · the HIERARCHY problem — m_H² not driven to the cutoff (posit: SUSY / technicolor);
    · Penrose's INITIAL-ENTROPY problem — S_initial ≈ 0 against a generic high-entropy start
      (posit: the Weyl-curvature hypothesis, a special initial condition).

  THE ONE SHAPE (the theory-native reading). All four are the SAME shape: a "problem" that
  assumes a DIAL the framework provably lacks. The ONE CAUSE is the trunk primitive
  Born = self-overlap = positivity: the fold's forced observables are REAL, self-adjoint,
  Born SELF-OVERLAP forms evaluated at the self-blind origin (the look-back's no-nonzero-fixed
  point). A self-overlap form
    (a) is REAL — it is the real part `reQ`/a square, carrying no imaginary/phase component
        ⇒ there is NO θ-phase channel to shuffle           [strong CP: θ̄ = 0];
    (b) is a PURE SQUARE with an EXACT-ZERO minimum at closure — no additive term
        ⇒ there is NO bare additive constant to tune       [Λ: the vacuum energy is exactly 0];
    (c) has a FORCED curvature at that minimum (`V″(0) = 2c²`, fixed by derivative-uniqueness)
        ⇒ there is NO independent mass² to dial            [hierarchy: m² is forced];
    (d) is evaluated at the self-blind origin, where the fold's own distortion (coherence gap)
        VANISHES — a blank slate with no prior structure    [initial entropy: S_init identification].
  Each of the four standard "dials" (imaginary-phase / additive-constant / free-second-order /
  prior-structure) lives in a channel the Born self-overlap structure at the self-blind origin
  PROVABLY excludes or forces. Four walls collapse into one theorem-shape: the "problems" are
  artifacts of assuming a parameter the framework does not have.

  A sharp face of the unification: θ̄ = 0 and the vanishing vacuum energy are LITERALLY the same
  fact read on the two faces of `reQ ⊕ square`. θ̄ = 0 is "the determinant is `reQ`-only — no
  imaginary part" (§1). The vanishing vacuum energy is "the potential is a pure square `g²` with
  `g(0) = 0` — no additive part" (§2). One structure (Born self-overlap), two faces (no phase /
  no additive constant).

  HONEST GRADE (carry it, SEED §F6: "a gorgeous theorem-SHAPE but each leg cites banked
  structure — flag what's identification vs theorem"):
    · §1 STRONG CP (θ̄ = 0)  — THEOREM (re-cites banked N367 `theta_det_phase_zero`).
    · §2 COSMOLOGICAL CONSTANT (no bare Λ, vacuum energy exactly 0) — THEOREM (banked N370
      `V = g²`, `V(0) = 0`, `V′ > 0` for φ > 0, unique critical point) + the NEW additive-dial
      rigidity (`V(0) + Λ₀ = 0 ↔ Λ₀ = 0`).
    · §3 HIERARCHY (no free m²) — THEOREM (banked N370 `V″(0) = 2c²`) + the NEW curvature-dial
      rigidity (any admissible `m²` equals `2c²` by derivative-uniqueness).
    · §4 INITIAL ENTROPY (S_init = 0) — IDENTIFICATION, FLAGGED. The minimal genuine fact is
      that the coherence gap (the fold's distortion from closure) vanishes at the self-blind
      origin — `g(0) = 0`, the blank slate has zero initial distortion. The physical
      Penrose `S_initial = 0` (Weyl-curvature-hypothesis strength) leans on arc-H blank-slate
      structure and is NOT claimed at theorem strength here.
  NO empirical number in any proof: the measured θ̄ bound, the Λ magnitude, `m_H`, and any
  entropy figure are REMOVABLE PROSE only. NEVER a proof step; the dark-energy VALUE is arc-H's.

  PHYSICS-WORDS-REMOVABLE. Delete strong/CP/θ/Λ/vacuum/hierarchy/mass/entropy/dial: over the
  derived ℝ `Cut` and the derived rung `O ℚ`, (§0) a square `s²` is `0` iff `s = 0` and `s² + d`
  returns the vacuum value iff `d = 0`; (§1) the `reQ`-embedding of a ℚ-valued cubic form has zero
  imaginary component; (§2) `plateauApproachPot c 0 = 0` and a nonzero additive `d` displaces it;
  (§3) any `m²` with `CutHasDerivAt (foldPotentialDeriv c) m² 0` equals `2c²`; (§4)
  `foldCoherenceGap c 0 = 0`. Pure algebra / order / limit statements; no name is load-bearing.

  NOT FREE-FLOATING. Every leg's TYPE mentions the banked derived objects: `detArena`/`reQ`/`ocR`
  (N367, over `O ℚ`), `plateauApproachPot`/`foldPotentialDeriv`/`foldCoherenceGap`/`CutHasDerivAt`
  (N364/N369/N370, over the derived ℝ `Cut`). The abstract §0 "one shape" lemmas are MACHINERY,
  instantiated to the banked potential at every leg — never left as a generic statement.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.FoldPotentialCriticality
import Phys.Algebra.StrongCPTheta
import Mathlib.Tactic

namespace Phys.Algebra.NoDial

open Phys.Algebra
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Foundation.ContinuumQ
open Phys.Algebra.HJ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD

/-! ## §0 — THE COMMON SHAPE: a Born self-overlap square has a pinned unique vacuum and no
    additive dial. (Machinery — instantiated to the banked fold potential at every leg.) -/

/-- THE SELF-OVERLAP SKELETON: the Born self-overlap of a magnitude `s`, i.e. its square. This is
    the logical skeleton every leg instantiates — the positivity/reality/pinned-zero structure the
    fold forces on its observables. -/
noncomputable def selfOverlap (s : Cut) : Cut := s ^ 2

/-- A self-overlap is `≥ 0` (Born positivity). -/
theorem selfOverlap_nonneg (s : Cut) : 0 ≤ selfOverlap s := by
  unfold selfOverlap; positivity

/-- THE PINNED VACUUM: a self-overlap vanishes EXACTLY at the self-blind point `s = 0` — its
    unique zero. (No degenerate direction, no second zero to slide a dial into.) -/
theorem selfOverlap_zero_iff (s : Cut) : selfOverlap s = 0 ↔ s = 0 := by
  unfold selfOverlap
  constructor
  · intro h; exact pow_eq_zero_iff (by norm_num) |>.mp h
  · intro h; rw [h]; ring

/-- THE NO-ADDITIVE-DIAL SHAPE: at the self-blind point the self-overlap is `0`, so adding a dial
    `d` returns the vacuum value `0` IFF the dial is trivial. A nonzero additive constant provably
    displaces the vacuum — there is no room for a bare additive term. -/
theorem selfOverlap_no_additive_dial (d : Cut) : selfOverlap 0 + d = 0 ↔ d = 0 := by
  have h0 : selfOverlap (0 : Cut) = 0 := by unfold selfOverlap; ring
  rw [h0]; constructor <;> intro h <;> linarith

/-! ## §1 — THE STRONG-CP LEG (θ̄ = 0): the determinant is `reQ`-only, no imaginary/phase channel.
    THEOREM (banked N367). -/

/-- ★★★ THE STRONG-CP LEG (θ̄ = 0). The matter-arena determinant `detArena` (the `reQ`-embedding
    of the ℚ-valued Freudenthal reduced determinant, N367) has EXACTLY ZERO imaginary component:
    `detArena − ocR (reQ (detArena)) = 0`. It is a pure real self-overlap form — there is no
    imaginary/phase channel, hence NO θ-phase to rotate away. The dial the strong-CP "problem"
    assumes does not exist. (Re-cites banked `theta_det_phase_zero`.) -/
theorem strongCP_leg (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    detArena d0 d1 d2 a b c - ocR (reQ (detArena d0 d1 d2 a b c)) = 0 :=
  theta_det_phase_zero d0 d1 d2 a b c

/-- THE CP CONTENT IS GENUINELY NONZERO (θ̄ = 0 is NOT vacuous): the orthogonal imaginary channel
    the determinant discards is genuinely nonzero (`phaseChannel u1 u2 1 ≠ 0`, N367). CP violation
    EXISTS — it lives in the channel θ̄ is blind to. So θ̄ = 0 coexists with `J ≠ 0`. -/
theorem strongCP_cp_channel_nonzero : phaseChannel u1 u2 1 ≠ 0 := phaseChannel_witness

/-! ## §2 — THE COSMOLOGICAL-CONSTANT LEG (no bare Λ): the potential is a pure square with an
    exact-zero minimum; an additive Λ-dial displaces it. THEOREM (banked N370 + NEW rigidity). -/

/-- The fold vacuum energy at the coherence-closure origin is EXACTLY ZERO. The potential is the
    Born self-overlap `V = g²` (N370 `plateauApproachPot_eq_gap_sq`) and `g(0) = 0`, so
    `V(0) = 0`: the vacuum energy is not tuned to zero — it is FORCED to zero by the self-overlap
    structure at the self-blind origin. -/
theorem lambda_vacuum_zero (c : Cut) : plateauApproachPot c 0 = 0 := by
  rw [plateauApproachPot_eq_gap_sq]
  have hg : foldCoherenceGap c 0 = 0 := by
    unfold foldCoherenceGap; rw [mul_zero, neg_zero, cutExp_zero]; ring
  rw [hg]; ring

/-- The fold potential IS a Born self-overlap `V = g²` — it is `selfOverlap (foldCoherenceGap c φ)`.
    This is the structural reason there is no additive constant: `V` is a pure square, with no room
    for a bare additive term. -/
theorem lambda_potential_is_selfOverlap (c φ : Cut) :
    plateauApproachPot c φ = selfOverlap (foldCoherenceGap c φ) := by
  unfold selfOverlap; exact plateauApproachPot_eq_gap_sq c φ

/-- ★★★ THE COSMOLOGICAL-CONSTANT LEG (no bare Λ), the rigidity. The vacuum energy at the origin
    returns `0` under an additive dial `Λ₀` IFF `Λ₀ = 0`: a nonzero bare cosmological constant
    PROVABLY displaces the exact-zero vacuum. There is no additive-Λ dial in the fold's self-overlap
    potential — the Λ "problem" assumes a term the structure lacks. (The dark-energy VALUE is arc-H's;
    this is the structural no-dial statement, never a fit.) -/
theorem lambda_leg (c Λ₀ : Cut) : plateauApproachPot c 0 + Λ₀ = 0 ↔ Λ₀ = 0 := by
  rw [lambda_vacuum_zero c]; constructor <;> intro h <;> linarith

/-! ## §3 — THE HIERARCHY LEG (no free m²): the curvature at the minimum is forced to `2c²`.
    THEOREM (banked N370 + derivative-uniqueness rigidity). -/

/-- The fold potential's curvature (second derivative) at the critical origin is `2c²` (banked N370
    `foldPotential_secondDeriv_origin`) — the radial-mode mass² is a FORCED positive multiple of
    the self-coupling scale², not an independent parameter. -/
theorem hierarchy_curvature_forced (c : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (foldPotentialDeriv c) (2 * c ^ 2) 0 :=
  foldPotential_secondDeriv_origin c hc

/-- ★★★ THE HIERARCHY LEG (no free m²), the rigidity. ANY `m²` that is the curvature of the fold
    potential at the origin (`CutHasDerivAt (foldPotentialDeriv c) m² 0`) is EQUAL to `2c²` — by
    the uniqueness of the derived-ℝ derivative. There is no independent mass² to dial: the
    curvature is pinned by the potential's shape. The hierarchy "problem" assumes a free m² the
    structure forces. -/
theorem hierarchy_leg (c : Cut) (hc : c ≠ 0) (m2 : Cut)
    (h : CutHasDerivAt (foldPotentialDeriv c) m2 0) : m2 = 2 * c ^ 2 :=
  h.unique (foldPotential_secondDeriv_origin c hc)

/-- The forced curvature is strictly POSITIVE (`2c² > 0`) — the origin is a genuine minimum
    (a positive mass²), not a saddle or a flat/tachyonic direction. -/
theorem hierarchy_mass_pos (c : Cut) (hc : 0 < c) : 0 < 2 * c ^ 2 := by positivity

/-! ## §4 — THE INITIAL-ENTROPY LEG (S_init = 0): the coherence gap vanishes at the self-blind
    origin — the blank slate. IDENTIFICATION (FLAGGED — not theorem-strength). -/

/-- THE INITIAL-ENTROPY LEG (IDENTIFICATION, FLAGGED). The minimal genuine fact: the fold's
    coherence gap `g` — its distortion from closure — VANISHES at the self-blind origin
    (`foldCoherenceGap c 0 = 0`). The origin carries no prior distortion: a blank slate, zero
    initial structure. This is the structural seed of Penrose's `S_initial = 0`; the full
    physical statement (against a generic high-entropy start) leans on arc-H blank-slate structure
    and is NOT claimed at theorem strength here. -/
theorem initialEntropy_leg (c : Cut) : foldCoherenceGap c 0 = 0 := by
  unfold foldCoherenceGap; rw [mul_zero, neg_zero, cutExp_zero]; ring

/-! ## §5 — THE UNIFICATION: the four legs, one shape. -/

/-- ★★★ THE NO-DIAL DISSOLUTION (the unified theorem-shape). For any `c > 0` and any Hermitian
    matter-arena data, the four standard fine-tuning "dials" have no representative in the fold's
    Born self-overlap structure at the self-blind origin:

    (1) STRONG CP (θ̄ = 0): the determinant is `reQ`-only — its imaginary/phase component is `0`;
    (2) COSMOLOGICAL CONSTANT (no bare Λ): the vacuum energy is exactly `0`, and a nonzero additive
        dial `Λ₀` provably displaces it;
    (3) HIERARCHY (no free m²): any admissible curvature `m²` equals the forced value `2c²`;
    (4) INITIAL ENTROPY (identification): the coherence gap vanishes at the origin (blank slate).

    ONE CAUSE (Born self-overlap = positivity, at the self-blind origin), FOUR terminations. The
    four "problems" are artifacts of assuming a parameter — an imaginary-phase / an additive
    constant / a free second-order term / a prior distortion — that the structure provably lacks
    or forces. -/
theorem no_dial_dissolution (c : Cut) (hc : 0 < c)
    (d0 d1 d2 : ℚ) (a b cc : O ℚ) (Λ₀ m2 : Cut)
    (hm : CutHasDerivAt (foldPotentialDeriv c) m2 0) :
    (detArena d0 d1 d2 a b cc - ocR (reQ (detArena d0 d1 d2 a b cc)) = 0)
    ∧ (plateauApproachPot c 0 = 0)
    ∧ (plateauApproachPot c 0 + Λ₀ = 0 ↔ Λ₀ = 0)
    ∧ (m2 = 2 * c ^ 2)
    ∧ (foldCoherenceGap c 0 = 0) :=
  ⟨strongCP_leg d0 d1 d2 a b cc,
   lambda_vacuum_zero c,
   lambda_leg c Λ₀,
   hierarchy_leg c (ne_of_gt hc) m2 hm,
   initialEntropy_leg c⟩

/-! ## §6 — NON-VACUITY TEETH (W8). -/

/-- ★★ W8 TEETH: the no-dial dissolution is NON-VACUOUS and load-bearing. For the concrete `c = 1`:
    (a) the vacuum energy is exactly `0` (`plateauApproachPot 1 0 = 0`), YET a UNIT additive dial is
        genuinely DETECTABLE (`plateauApproachPot 1 0 + 1 ≠ 0`) — the Λ-rigidity is not vacuous
        (a nonzero dial really does displace the vacuum, it is not "every dial is undetectable");
    (b) the discarded CP channel is genuinely nonzero (`phaseChannel u1 u2 1 ≠ 0`) — θ̄ = 0 is not
        vacuous (CP content EXISTS in the orthogonal channel).
    A WRONG mis-reading — that a nonzero dial leaves the vacuum at `0`, or that the CP channel is
    trivial — fails here. This is the fact the C397 costume rejects. -/
theorem no_dial_nonvacuous :
    (plateauApproachPot 1 0 = 0) ∧ (plateauApproachPot (1 : Cut) 0 + 1 ≠ 0)
    ∧ (phaseChannel u1 u2 1 ≠ 0) := by
  refine ⟨lambda_vacuum_zero 1, ?_, phaseChannel_witness⟩
  rw [lambda_vacuum_zero 1]; norm_num

end Phys.Algebra.NoDial
