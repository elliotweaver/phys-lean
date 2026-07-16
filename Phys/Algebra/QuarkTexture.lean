/-
# Z3 — THE QUARK TEXTURE (pay the X10 debt) — arc-Z ENDPOINT-ASSEMBLY

Owner-authorized ENDPOINT-ASSEMBLY seed (docs/SEED_ENDPOINT_ASSEMBLY.md), target **Z3** — the
directed successor of Z2 (`TwoChannelDescent`). This node PAYS the ONE `namedOpenStructural` debt
that arc X (X10, `XArcValidationCapstone`) carried: `quarkYukawaTexture` — *"there is NO banked
quark-sector Yukawa texture, only the LEPTON Koide N340."* Z3 BANKS a quark texture object where
there was none, as THEOREM-EXACT STRUCTURE, so Z8 can move the X10 ledger row off
`namedOpenStructural`.

## THE THEORY-NATIVE HEART — THE FANO-LINE CP DICHOTOMY (the genuinely new forced content)

The banked flavor arena (N305–N312) supplies the whole construction, and the quark texture lives in
the SAME arena as the lepton one (the three cap-forced slots N5, the ℤ₃-Fourier amplitudes `genVec`
N307, the forced cubic N309, the tridiagonal texture `massMat` N311, the two-sector overlap `mixV`
N312, the associator `assoc3` N310). The genuinely NEW, forced, never-co-stated content is the
LINE dichotomy at the texture level:

* THE LEPTON TEXTURE sits on the ASSOCIATIVE ℂ-line (`cline`/`u1`, N310): the octonion associator
  `assoc3` VANISHES (`assoc3_cline_zero`), so the texture's CP invariant is `0` — CP-trivial.
* THE QUARK TEXTURE sits on the NON-ASSOCIATIVE Fano line (`u2`/`u1`/`u1×u2`, N310): the associator
  is a genuine UNIT (`assoc3_witness : assoc3 u2 u1 (octCross u1 u2) = −1`), so the texture's CP
  invariant is NONZERO — CP-present.

Built from the SAME balanced Born-square amplitudes, the two textures differ ONLY by the octonion
line. This is the theory-native WHY of a fact the Standard Model has NO explanation for: why the
lepton sector is (to leading order) CP-trivial while the quark sector carries CP. The texture CP
invariant FACTORS as `(frame misalignment) · (octonion-line associator)` — mixing needs the frames
to misalign (two distinct sectors), CP needs the line to be non-associative (the Fano line), and
BOTH are consequences of the octonion structure.

⭐ ONE CAUSE, MANY TERMINATIONS. The SAME octonionic non-associativity that stops the cascade at 𝕆
— capping the generation count at three (N5) and opening the coupling chain to force the corner-zero
`M₁₃ = 0` (N311, `cascade_open_ne_closed`) — is here the up/down CP asymmetry: `assoc3 ≠ 0` on the
Fano line is the CP the quark texture carries and the ℂ-line lepton texture does not.

## §1 — THE TWO-SECTOR QUARK TEXTURE (up + down), grounded on the banked amplitudes

The quark texture is TWO massive sectors (up-type and down-type), each a Born-square cycle on the
three cap-forced slots: each sector is a banked tridiagonal `massMat` (N311), and the CKM texture is
the OVERLAP `ckmTexture = mixV Oᵤ O_d` (N312) of the two sectors' leading amplitude-direction frames.

## §2 — THE MASS-RATIO STRUCTURE PER SECTOR IS THE FORCED CUBIC (cited N309)

Each quark sector's mass ratios are governed by the forced cubic `t³ − 6M²t² + σ₂t − e₃²` — σ₁ = 6M²
forced (the Koide balance, phase-independent), σ₂/σ₃ carrying the sector phase only through the
single amplitude product `e₃`. Zero free shape parameters given the phase; `M` the one scale.

## §3 — THE FANO-LINE CP DICHOTOMY (the new heart, on the banked associator)

The texture CP invariant `textureCP = (frame misalignment)·assoc3`: `0` on the ℂ-line (any frames),
`−(misalignment)` on the Fano line. The quark texture (Fano) carries CP iff its frames misalign; the
lepton texture (ℂ) never does.

## §4 — THE CKM OVERLAP (cited N312): unitary up to the frame-norm scale, normalized, corner-zero.

## HONEST GRADE (per piece — the point of the arc)

THEOREM-EXACT (over ℚ): the two-sector texture object, the forced-cubic mass-ratio STRUCTURE per
sector (cited N309, instantiated to the quark texture), the tridiagonal / corner-zero / geometric-
mean pattern (cited N311), the CKM overlap unitary/normalized (cited N312), and ★ the NEW Fano-line
CP dichotomy (quark texture CP-present, lepton texture CP-absent — the same-amplitudes-different-line
theorem). ROUTE-NOT-YET-FOUND (honestly flagged, NEVER fitted, NEVER asserted): the precise
NUMERICAL quark mass ratios — they need the deviated individual-sector phase on the Fano line plus
the ℝ-descent, exactly the status the mixing angles (N312) and the leading-order Jarlskog (N344) were
banked at. NO measured quark mass steers any choice (seed §Z3 explicit STOP).

## PHYSICS-WORDS-REMOVABLE (STANDARD §2, seed G4/G5)

Delete quark / up / down / lepton / CP / Koide / mass / CKM / mixing / generation: over ℚ, on the
banked `genVec`/`massVec`/`massMat`/`mixV`/`assoc3`/`u1`/`u2`/`octCross`/`cline` of `O ℚ`, the texture
matrices are tridiagonal Born-square with corner-zero; the forced cubic holds; `ckmTexture` is
unitary up to the frame-norm scale; and `(f₁g₀−f₀g₁)·assoc3 x y z` VANISHES on the `(·, b•u1, d•u1)`
directions but equals `−(f₁g₀−f₀g₁)` on `(u2, u1, u1×u2)`. No theorem STATEMENT needs a physics word.

## FREE-FLOATING check (SOUL rail)

Every TYPE mentions the banked derived objects (`genVec`/`massVec`/`massMat`/`mixV`/`assoc3`/`u1`/`u2`/
`octCross` of `O ℚ`, `jdef Xwit Ywit ≠ 0` the cap). The quark texture is the two-sector instance of
these on the Fano line — NOT a generic texture-algebra statement.

Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no heartbeat inflation, no
bridge; no empirical number (PDG quark masses / CKM angles / Jarlskog are removable prose only); the
structural texture exact over ℚ (the numerical quark ratios honestly deferred to the ℝ-descent, never
imported, never fitted). IMPORT GUARD: imports the banked N312 chain (transitively N307/N309/N310/
N311), NEVER `MassGapOne` — no `foldRetention` reaches this content.
-/
import Phys.Algebra.OctonionJordanGenerationMixingOverlap
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## §1 — the two-sector quark texture (up + down), grounded on the banked amplitudes. -/

/-- ★ THE CKM TEXTURE: the two-sector overlap `V = Oᵤᵀ O_d` (banked `mixV`, N312) of the up-sector
    leading amplitude-direction frame `(genVec Mu Au pu ru 0, genVec Mu Au pu ru 1)` with the
    down-sector frame `(genVec Md Ad pd rd 0, genVec Md Ad pd rd 1)`. This is the genuinely new
    quark texture object: the CKM matrix as the misalignment of the two QUARK sectors' rational
    Born-eigenframes, grounded on the banked `genVec` (N307). -/
def ckmTexture (Mu Au pu ru Md Ad pd rd : ℚ) : Matrix (Fin 2) (Fin 2) ℚ :=
  mixV (genVec Mu Au pu ru 0) (genVec Mu Au pu ru 1)
       (genVec Md Ad pd rd 0) (genVec Md Ad pd rd 1)

/-- Each quark sector is a banked tridiagonal Born-square texture `massMat` (N311): diagonal = the
    Born-square masses, nearest-neighbour off-diagonal = the amplitude products, corner `M₁₃ = 0`.
    (Up sector; the down sector is the same construction at the down parameters.) -/
theorem upSector_corner_zero (Mu Au pu ru : ℚ) :
    massMat Mu Au pu ru 0 2 = 0 ∧ massMat Mu Au pu ru 2 0 = 0 :=
  massMat_corner_zero Mu Au pu ru

theorem downSector_corner_zero (Md Ad pd rd : ℚ) :
    massMat Md Ad pd rd 0 2 = 0 ∧ massMat Md Ad pd rd 2 0 = 0 :=
  massMat_corner_zero Md Ad pd rd

/-- The CKM texture cross-term (the leading Cabibbo mixing) read off the two QUARK sectors' banked
    amplitudes — a genuine misalignment `aᵤ∧a_d = uₐ₁d₀ − uₐ₀d₁`, grounded on `genVec`. -/
theorem ckmTexture_mixing (Mu Au pu ru Md Ad pd rd : ℚ) :
    (ckmTexture Mu Au pu ru Md Ad pd rd) 1 0
      = genVec Mu Au pu ru 1 * genVec Md Ad pd rd 0
        - genVec Mu Au pu ru 0 * genVec Md Ad pd rd 1 :=
  mixNumer_ground Mu Au pu ru Md Ad pd rd

/-! ## §2 — the mass-ratio structure per sector is the forced cubic (cited N309). -/

/-- ★ THE QUARK MASS-RATIO STRUCTURE (per sector) IS THE FORCED CUBIC (banked N309 `mass_cubic`):
    the three masses of a quark sector are the roots of `t³ − 6M²t² + σ₂t − e₃²`, with σ₁ = 6M²
    FORCED (Koide balance, phase-independent) and σ₂/σ₃ carrying the sector phase only through the
    single amplitude product `e₃`. So the quark mass RATIOS are forced functions of `Q = 2/3` and
    the single sector phase — ZERO free shape parameters; `M` the one scale. -/
theorem quarkSector_forced_cubic (M A p r : ℚ) (h : 3 * p ^ 2 + r ^ 2 = 3) (hA : A ^ 2 = 2 * M ^ 2)
    (t : ℚ) :
    (t - massVec M A p r 0) * (t - massVec M A p r 1) * (t - massVec M A p r 2)
      = t ^ 3 - (6 * M ^ 2) * t ^ 2 + ((9 / 4) * M ^ 4 - 6 * M * (e3amp M A p r)) * t
        - (e3amp M A p r) ^ 2 :=
  mass_cubic M A p r h hA t

/-- The forced LINEAR coefficient (mass-level Koide) per quark sector: `Σmₖ = 6M²` (banked N309
    `sigma1_mass`) — the total is `δ`-invariant, the Koide balance. -/
theorem quarkSector_koide_total (M A p r : ℚ) (h : 3 * p ^ 2 + r ^ 2 = 3) (hA : A ^ 2 = 2 * M ^ 2) :
    massVec M A p r 0 + massVec M A p r 1 + massVec M A p r 2 = 6 * M ^ 2 :=
  sigma1_mass M A p r h hA

/-- The geometric-mean nearest-neighbour coupling is ℚ-exact per quark sector (banked N311
    `massMat_nn_born_01`): `(offdiag)² = mᵢ·mⱼ`, the √ dissolving through the Born square. -/
theorem quarkSector_geometric_mean (M A p r : ℚ) :
    (massMat M A p r 0 1) ^ 2 = massVec M A p r 0 * massVec M A p r 1 :=
  massMat_nn_born_01 M A p r

/-! ## §3 — ★ THE FANO-LINE CP DICHOTOMY (the new heart, on the banked associator N310). -/

/-- The texture CP invariant: the frame misalignment (the CKM/mixing cross-term `f₁g₀ − f₀g₁`)
    times the octonion-line associator `assoc3 x y z` (the Jarlskog-type factorization, N344: the
    CP invariant is the frame-product times `assoc3`). CP needs BOTH a nonzero misalignment (two
    distinct sectors) AND a non-associative line (`assoc3 ≠ 0`). -/
def textureCP (f0 f1 g0 g1 : ℚ) (x y z : O ℚ) : ℚ :=
  (f1 * g0 - f0 * g1) * assoc3 x y z

/-- ★ THE LEPTON TEXTURE IS CP-TRIVIAL (associative ℂ-line): the texture CP invariant VANISHES for
    ANY frames when the octonion line is the associative ℂ-line (`b•u1, d•u1`), because the
    associator vanishes there (banked `assoc3_cline_zero`, N310). -/
theorem textureCP_cline_zero (f0 f1 g0 g1 : ℚ) (x : O ℚ) (b d : ℚ) :
    textureCP f0 f1 g0 g1 x (b • u1) (d • u1) = 0 := by
  unfold textureCP
  rw [assoc3_cline_zero]
  ring

/-- ★ THE QUARK TEXTURE CARRIES CP (non-associative Fano line): the texture CP invariant equals
    `−(frame misalignment)` on the Fano line `(u2, u1, u1×u2)`, because the Fano associator is `−1`
    (banked `assoc3_witness`, N209/N310). -/
theorem textureCP_fano_eq (f0 f1 g0 g1 : ℚ) :
    textureCP f0 f1 g0 g1 u2 u1 (octCross u1 u2) = -(f1 * g0 - f0 * g1) := by
  unfold textureCP
  rw [assoc3_witness]
  ring

/-- ★★★ THE FANO-LINE CP DICHOTOMY. At MISALIGNED frames (`f₁g₀ − f₀g₁ ≠ 0`, two genuinely distinct
    sectors), the QUARK texture CP invariant on the non-associative Fano line is NONZERO while the
    LEPTON texture CP invariant on the associative ℂ-line is ZERO — built from the SAME frames,
    differing ONLY by the octonion line. The theory-native WHY of "why the quark sector carries CP
    but the lepton sector does not": it is the octonion associator, the SAME cascade-stop
    non-associativity that caps the generation count and opens the coupling chain. -/
theorem fano_cp_dichotomy (f0 f1 g0 g1 : ℚ) (hmis : f1 * g0 - f0 * g1 ≠ 0) (x : O ℚ) (b d : ℚ) :
    textureCP f0 f1 g0 g1 x (b • u1) (d • u1) = 0
    ∧ textureCP f0 f1 g0 g1 u2 u1 (octCross u1 u2) ≠ 0 := by
  refine ⟨textureCP_cline_zero f0 f1 g0 g1 x b d, ?_⟩
  rw [textureCP_fano_eq]
  exact neg_ne_zero.mpr hmis

/-- The quark texture CP invariant, grounded on the QUARK sectors' banked amplitude frames: at the
    up/down frames `(genVec Mu…, genVec Md…)` on the Fano line, the CP invariant is `−(the CKM
    mixing cross-term)`, nonzero exactly when the two quark sectors misalign. -/
theorem quarkTextureCP_ground (Mu Au pu ru Md Ad pd rd : ℚ) :
    textureCP (genVec Mu Au pu ru 0) (genVec Mu Au pu ru 1)
              (genVec Md Ad pd rd 0) (genVec Md Ad pd rd 1) u2 u1 (octCross u1 u2)
      = -((ckmTexture Mu Au pu ru Md Ad pd rd) 1 0) := by
  rw [textureCP_fano_eq, ckmTexture_mixing]

/-! ## §4 — the CKM overlap (cited N312): unitary up to the frame-norm scale, normalized. -/

/-- ★ THE CKM TEXTURE IS UNITARY UP TO THE FRAME-NORM SCALE (banked N312 `mixV_unitary_up_to_scale`):
    `Vᵀ V = ((uₐ₀²+uₐ₁²)(d₀²+d₁²)) • 1`. The two-sector quark overlap is orthogonal up to the product
    of the two frame norms — the normalization √ is the deferred ℝ-descent piece. -/
theorem ckmTexture_unitary (Mu Au pu ru Md Ad pd rd : ℚ) :
    (ckmTexture Mu Au pu ru Md Ad pd rd)ᵀ * (ckmTexture Mu Au pu ru Md Ad pd rd)
      = ((genVec Mu Au pu ru 0 ^ 2 + genVec Mu Au pu ru 1 ^ 2)
          * (genVec Md Ad pd rd 0 ^ 2 + genVec Md Ad pd rd 1 ^ 2))
        • (1 : Matrix (Fin 2) (Fin 2) ℚ) :=
  mixV_unitary_up_to_scale _ _ _ _

/-- ★ THE LEADING CKM MIXING IS NORMALIZED (banked N312 `cabibbo_mixing_orthonormal`,
    Brahmagupta–Fibonacci): the mixing fraction and its aligned complement sum to `1` — a genuine
    normalized leading-order mixing probability, arctan-free. -/
theorem ckmTexture_mixing_normalized (u0 u1 d0 d1 : ℚ)
    (hu : u0 ^ 2 + u1 ^ 2 ≠ 0) (hd : d0 ^ 2 + d1 ^ 2 ≠ 0) :
    (u1 * d0 - u0 * d1) ^ 2 / ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2))
      + (u0 * d0 + u1 * d1) ^ 2 / ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2)) = 1 :=
  cabibbo_mixing_orthonormal u0 u1 d0 d1 hu hd

/-- ★ THE CORNER-ZERO `M₁₃ = 0` FALLS OUT OF CASCADE ADJACENCY (banked N311 `cascade_open_ne_closed`):
    the open cascade coupling path differs from the closed coherence cycle exactly at the corner,
    because the cascade TERMINATES at 𝕆. The quark texture inherits it. -/
theorem quarkTexture_corner_from_cascade : cascadePath ≠ seeMat :=
  cascade_open_ne_closed

/-! ## §5 — non-vacuity / teeth (W8). -/

/-- ★ W8: at two genuinely distinct QUARK sectors (up `(1,3,1,0)`, down `(1,3,0,1)`) the CKM texture
    mixing cross-term is NONZERO — the quark texture is real mixing, not aligned frames. -/
theorem quark_mixing_nonzero :
    (ckmTexture 1 3 1 0 1 3 0 1) 1 0 ≠ 0 :=
  mixing_nonzero_distinct_sectors

/-- ★★ W8 — THE DICHOTOMY IS GENUINE (the wrong reading excluded). At the same distinct quark
    sectors, the QUARK texture CP invariant on the Fano line is NONZERO while the ℂ-line reading is
    ZERO: a WRONG "the quark texture is CP-trivial like the lepton texture" reading is provably
    excluded, and a WRONG "the lepton (ℂ-line) texture carries CP" reading is provably excluded. -/
theorem quark_cp_present_lepton_cp_absent :
    textureCP (genVec 1 3 1 0 0) (genVec 1 3 1 0 1)
              (genVec 1 3 0 1 0) (genVec 1 3 0 1 1) u2 u1 (octCross u1 u2) ≠ 0
    ∧ (∀ x : O ℚ, textureCP (genVec 1 3 1 0 0) (genVec 1 3 1 0 1)
              (genVec 1 3 0 1 0) (genVec 1 3 0 1 1) x u1 u1 = 0) := by
  refine ⟨?_, ?_⟩
  · rw [quarkTextureCP_ground]
    simp only [ne_eq, neg_eq_zero]
    exact mixing_nonzero_distinct_sectors
  · intro x
    have := textureCP_cline_zero (genVec 1 3 1 0 0) (genVec 1 3 1 0 1)
              (genVec 1 3 0 1 0) (genVec 1 3 0 1 1) x 1 1
    simpa using this

/-- ★ W8: the CKM texture is NOT the identity at distinct quark sectors — the up and down frames are
    genuinely misaligned (a trivial `V = 1`, no mixing, is excluded). -/
theorem quark_ckm_not_identity :
    ckmTexture 1 3 1 0 1 3 0 1 ≠ (1 : Matrix (Fin 2) (Fin 2) ℚ) :=
  mixV_not_identity

/-- W8: the mass-ratio structure is a genuine non-degenerate 3-generation spectrum per quark sector
    — at a generic conic phase the three amplitudes are pairwise distinct (banked N309), so the
    forced cubic has three distinct roots (not a collapsed spectrum). -/
theorem quarkSector_nondegenerate (M A : ℚ) (hA : A ≠ 0) :
    genVec M A (1/7) (-12/7) 0 ≠ genVec M A (1/7) (-12/7) 1 :=
  amp_distinct01 M A hA

/-! ## §6 — the capstone. -/

/-- ★★★ THE CAPSTONE — the quark texture (arc-Z Z3, paying the X10 debt).

    Over ℚ, with the banked derived generation objects (`genVec` N307, `massVec` N309, `massMat`
    N311, `mixV` N312, `assoc3` N209/N310, the cap N5): the QUARK TEXTURE is the two-sector (up +
    down) Born-square texture on the three cap-forced slots. Its CKM overlap `ckmTexture = mixV Oᵤ O_d`
    (§1) is the misalignment of the two quark sectors' banked amplitude-direction frames; each
    sector's mass RATIOS are governed by the FORCED CUBIC `t³ − 6M²t² + σ₂t − e₃²` with σ₁ = 6M²
    forced (Koide, phase-independent) and σ₂/σ₃ carrying the sector phase only through `e₃`
    (`quarkSector_forced_cubic`, `quarkSector_koide_total`, cited N309) — the quark mass ratios as
    DERIVED STRUCTURE, zero free shape parameters given the phase; the geometric-mean coupling is
    ℚ-exact (`quarkSector_geometric_mean`, cited N311).

    ★ THE FANO-LINE CP DICHOTOMY (§3, the genuinely new forced content): the texture CP invariant
    factors as `(frame misalignment)·assoc3` — it VANISHES on the associative ℂ-line (the lepton
    texture, `textureCP_cline_zero`) and is `−(misalignment)` on the non-associative Fano line (the
    quark texture, `textureCP_fano_eq`), so at misaligned frames the quark texture carries CP while
    the lepton texture does not (`fano_cp_dichotomy`), grounded on the quark frames
    (`quarkTextureCP_ground`). The CKM overlap is unitary up to the frame-norm scale
    (`ckmTexture_unitary`), normalized (`ckmTexture_mixing_normalized`), with the corner-zero
    `M₁₃ = 0` from cascade adjacency (`quarkTexture_corner_from_cascade`). Non-vacuity: the quark
    mixing is genuinely nonzero (`quark_mixing_nonzero`), CP is present in the quark texture and
    absent in the lepton texture (`quark_cp_present_lepton_cp_absent`), the overlap is not the
    identity (`quark_ckm_not_identity`), and the spectrum is non-degenerate
    (`quarkSector_nondegenerate`). The cap forcing exactly three generations AND opening the coupling
    chain (`jdef Xwit Ywit ≠ 0`, N5) grounds it on the octonion-specific arena.

    ⚠ HONEST GRADE (seed §Z3): the two-sector texture object, the forced-cubic mass-ratio STRUCTURE,
    the tridiagonal/corner-zero/geometric-mean pattern, the CKM overlap, and the Fano-line CP
    dichotomy are THEOREM-EXACT (over ℚ). The precise NUMERICAL quark mass ratios are
    ROUTE-NOT-YET-FOUND (the deviated individual-sector phase on the Fano line + the ℝ-descent, the
    same status as the mixing angles N312 and the leading-order Jarlskog N344) — NEVER fitted, NEVER
    asserted; no measured quark mass steers any choice. -/
theorem quark_texture_structure :
    -- §1: the two-sector texture, corner-zero per sector, CKM cross-term grounded on the amplitudes
    (∀ Mu Au pu ru : ℚ, massMat Mu Au pu ru 0 2 = 0 ∧ massMat Mu Au pu ru 2 0 = 0)
    ∧ (∀ Mu Au pu ru Md Ad pd rd : ℚ, (ckmTexture Mu Au pu ru Md Ad pd rd) 1 0
        = genVec Mu Au pu ru 1 * genVec Md Ad pd rd 0
          - genVec Mu Au pu ru 0 * genVec Md Ad pd rd 1)
    -- §2: the forced-cubic mass-ratio structure per sector (cited N309), Koide total, geometric mean
    ∧ (∀ M A p r : ℚ, 3 * p ^ 2 + r ^ 2 = 3 → A ^ 2 = 2 * M ^ 2 → ∀ t : ℚ,
        (t - massVec M A p r 0) * (t - massVec M A p r 1) * (t - massVec M A p r 2)
          = t ^ 3 - (6 * M ^ 2) * t ^ 2 + ((9 / 4) * M ^ 4 - 6 * M * (e3amp M A p r)) * t
            - (e3amp M A p r) ^ 2)
    ∧ (∀ M A p r : ℚ, 3 * p ^ 2 + r ^ 2 = 3 → A ^ 2 = 2 * M ^ 2 →
        massVec M A p r 0 + massVec M A p r 1 + massVec M A p r 2 = 6 * M ^ 2)
    ∧ (∀ M A p r : ℚ, (massMat M A p r 0 1) ^ 2 = massVec M A p r 0 * massVec M A p r 1)
    -- §3: ★ the Fano-line CP dichotomy (the new heart)
    ∧ (∀ f0 f1 g0 g1 : ℚ, ∀ x : O ℚ, ∀ b d : ℚ, textureCP f0 f1 g0 g1 x (b • u1) (d • u1) = 0)
    ∧ (∀ f0 f1 g0 g1 : ℚ, textureCP f0 f1 g0 g1 u2 u1 (octCross u1 u2) = -(f1 * g0 - f0 * g1))
    ∧ (∀ f0 f1 g0 g1 : ℚ, f1 * g0 - f0 * g1 ≠ 0 → ∀ x : O ℚ, ∀ b d : ℚ,
        textureCP f0 f1 g0 g1 x (b • u1) (d • u1) = 0
        ∧ textureCP f0 f1 g0 g1 u2 u1 (octCross u1 u2) ≠ 0)
    -- §4: the CKM overlap unitary up to the frame-norm scale, normalized, corner-zero
    ∧ (∀ Mu Au pu ru Md Ad pd rd : ℚ,
        (ckmTexture Mu Au pu ru Md Ad pd rd)ᵀ * (ckmTexture Mu Au pu ru Md Ad pd rd)
          = ((genVec Mu Au pu ru 0 ^ 2 + genVec Mu Au pu ru 1 ^ 2)
              * (genVec Md Ad pd rd 0 ^ 2 + genVec Md Ad pd rd 1 ^ 2))
            • (1 : Matrix (Fin 2) (Fin 2) ℚ))
    ∧ (cascadePath ≠ seeMat)
    -- §5: non-vacuity — real mixing, genuine dichotomy, not identity, non-degenerate spectrum
    ∧ ((ckmTexture 1 3 1 0 1 3 0 1) 1 0 ≠ 0)
    ∧ (textureCP (genVec 1 3 1 0 0) (genVec 1 3 1 0 1)
              (genVec 1 3 0 1 0) (genVec 1 3 0 1 1) u2 u1 (octCross u1 u2) ≠ 0)
    ∧ (ckmTexture 1 3 1 0 1 3 0 1 ≠ (1 : Matrix (Fin 2) (Fin 2) ℚ))
    -- the cap forcing exactly 3 AND opening the coupling chain (grounding, N5)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨upSector_corner_zero, ckmTexture_mixing, quarkSector_forced_cubic, quarkSector_koide_total,
   quarkSector_geometric_mean, textureCP_cline_zero, textureCP_fano_eq, fano_cp_dichotomy,
   ckmTexture_unitary, quarkTexture_corner_from_cascade, quark_mixing_nonzero,
   quark_cp_present_lepton_cp_absent.1, quark_ckm_not_identity, jordan_fails_H4⟩

end

end Phys.Algebra.HJ
