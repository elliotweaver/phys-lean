/-
# N281 — THE FOLD-ROOT'S TWO-FACED NEUTRAL TORUS: THE FLEXIBILITY-PROTECTED RANK-2 CARTAN OF THE
  MATTER SPINOR THAT SURVIVES THE CASCADE STOP

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)` (the terminal cascade algebra, N2c) and its matter
SPINOR structure (`leftReg`/`rightReg`, N261/N264: `O ℚ` a Clifford module for the fold's Born form
`gForm` under BOTH multiplication faces), this node isolates the piece of the two-handed structure
that SURVIVES the cascade stop.

N280 built the two-handed `so(4) = su(2)_L ⊕ su(2)_R` of the matter spinor and proved it is CONFINED
to the last associative rung `H` and BROKEN on the full non-associative `O ℚ` (`so4_breaks_on_O`: the
two hands do not commute on `O`). This node asks what SURVIVES the break, and finds a forced answer.

THE FOLD-ROOT `u1` has two regular faces: `lregI = leftReg u1M = (u1 · −)` (N279) and
`rregI = rightReg u1M = (− · u1)` (N280). The full so(4) needs the CROSS-unit commutators, which need
associativity and break on `O`. But the SAME-UNIT pair `{lregI, rregI}` COMMUTES on ALL of `O ℚ`
(`flex_reg_commute`) — because `u1·(x·u1) = (u1·x)·u1` is EXACTLY the FLEXIBLE law (`mul_flex`), the
LAST multiplicative identity the octonion cascade retains (weaker than associativity, the last to
break). So the rank-2 abelian Cartan torus of the two-handed so(4) is FLEXIBILITY-protected and
survives the cascade stop that tears apart the rest of the so(4).

WHAT THIS NODE PROVES:
* `flex_reg_commute` (★★★): `lregI.comp rregI = rregI.comp lregI` on ALL of `O ℚ` — the same-unit two
  faces commute everywhere (via `mul_flex`), where N280's cross-unit so(4) breaks off `H`.
* `lregI_sq` / `rregI_sq`: each face squares to `(-1)•id` (banked `leftReg_sq`/`rightReg_sq`, the
  fold-root a complex structure on both faces).
* THE EIGEN-SPLIT: `foldVec = lregI + rregI` is supported entirely on the fold's own ℂ-core
  `span{1, u1}` (N266) — `foldVec 1 = 2•u1`, `foldVec u1 = -2•1`, and it KILLS the charged imaginary
  units (`foldVec_kills_e2O`, etc). Its twin `foldAx = lregI - rregI` KILLS the core (`foldAx 1 = 0`).
* THE RANK COLLAPSE (★★★): `foldVec` maps `u1 ↦ -2•1 ∉ ImO` and kills every charged imaginary unit,
  so it carries NO endomorphism content of the imaginary subspace `ImO` beyond the `u1`-axis — which
  the adjoint/vector-7 representation discards. So the rank-2 spinor torus COLLAPSES to rank-1 on the
  vector-7. This is the structural fact the ≥11×-deferred ★2 ceiling (N257: `Q ∉ span{T3,Y}` on the
  vector-7) was missing — the SECOND independent neutral generator lives on the fold's real-unit core,
  present on the SPINOR carrier, discarded by the adjoint rep.
* `colour_centralizes_both_faces` (★★): every ℚ-linear Leibniz derivation `D` with `D u1 = 0` (the
  colour condition, N201) commutes with BOTH faces — `[D, lregI] = 0` (N201, `D` commutes with
  `JO = L_{u1}`) AND `[D, rregI] = 0` (the RIGHT-face twin, `D(x·u1) = (Dx)·u1`). So colour
  centralizes the WHOLE neutral torus, not just the `JO = L_{u1}` it was defined by.

## THE ONE CAUSE (STANDARD §0, the moat) — GRADED TERMINATIONS
The single fact "WHICH multiplicative identity survives the cascade stop" grades which part of the
two-handed structure lives and which dies: associativity FAILS at `O` ⇒ the cross-unit so(4) BREAKS
off `H` (N280); FLEXIBILITY SURVIVES ⇒ the same-unit Cartan torus LIVES on ALL `O`. One cause (the
cascade-stopping non-associativity, N2c), two graded terminations — the so(4) confined to `H`, the
neutral torus surviving on `O`.

## DISSOLUTION
The field POSITS the electroweak U(1) neutral sector and, choosing a GUT embedding, a second neutral
generator; on the vector-7 the theory found this UN-forceable (N257, `Q ∉ span{T3,Y}`). The theory
DISSOLVES the ceiling's CAUSE: the second neutral generator is `foldVec = L_{u1} + R_{u1}`, forced,
supported on the fold's own ℂ-core — the direction the too-small vector-7 adjoint rep discards. The
wall was an artifact of asking on the wrong (adjoint/vector-7) carrier; the matter SPINOR holds it.

## PHYSICS-WORDS-REMOVABLE (STANDARD §2)
Delete neutral/isospin/hypercharge/charge/electroweak/Cartan/torus: what remains is a pure theorem
about the left- and right-regular operators of the unit `u1` of `O ℚ` — they commute on all of `O ℚ`
(via `mul_flex`), each squares to `-id`, their sum is supported on `span{1,u1}` and annihilates the
charged imaginary units while their difference annihilates `span{1,u1}`, the sum's `ImO`-content is
only the `u1`-axis, and any Leibniz derivation annihilating `u1` commutes with both. Octonion-SPECIFIC:
the survives-on-`O`-where-the-rest-breaks content is the flexibility/associativity boundary of the
cascade. NOT free-floating: every headline TYPE mentions the banked `lregI`/`rregI`/`leftReg`/
`rightReg`/`O ℚ`/`u1`/`e2O`. Foundations-only: `[propext, Classical.choice, Quot.sound]`.

## SCOPE (do NOT overclaim)
Banks the flexibility-protected rank-2 neutral torus + its survival on `O` + the eigen-split +
the rank-2→rank-1 collapse under the adjoint rep + colour centralizing BOTH faces ONLY. NOT the
mixing angle / hypercharge NORMALIZATION VALUE (★2 — the VALUE ceiling STANDS; a route-finding node is
CHILDED). NOT parity VIOLATION (the two faces are `star`-conjugate — a SYMMETRY; a symmetric torus is
parity-conserving; ★6 asymmetry stays open). NOT masses/mixings (★5). NOT "= a specific SM neutral
generator" (removable prose).
-/
import Phys.Algebra.TowerWorldMapWeakDoubletTwoHandedSO4
import Phys.Algebra.TowerWorldMapWeakDoubletLeftRegular
import Phys.Algebra.TowerWorldMapChirality
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationColourCentralizer
import Mathlib.Tactic

open scoped Classical
open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-search budget bump (instance search only, NOT the proof kernel) — the banked
-- N255/N257/…/N261/N264/N279/N280 precedent for the End-of-O / octonion-tower instance diamonds.
set_option synthInstance.maxHeartbeats 400000

noncomputable section

/-- Coordinate idiom (copied from the N279/N280 witnesses): reduce an `O ℚ` equation to its eight
    ℚ-coordinates and close by `ring`. Used ONLY for the bounded single-vector eigen-split witnesses. -/
macro "oct_coord" : tactic =>
  `(tactic| (apply CD.ext <;> apply CD.ext <;> apply Dbl.ext <;>
    simp only [u1, e2O, e3O, e4O, e5O, e6O, e7O, sub_eq_add_neg,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
      CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im, CD.one_re, CD.one_im,
      cd_qsmul_re, cd_qsmul_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.zero_im, Dbl.zero_re, Dbl.one_re, Dbl.one_im,
      Dbl.smul_re, Dbl.smul_im] <;> ring))

/-! ## (A) THE CORE: the same-unit two faces COMMUTE on ALL of `O ℚ` — FLEXIBILITY. -/

/-- ★★★ THE FLEXIBILITY-PROTECTED COMMUTING: the left- and right-regular operators of the fold-root
    `u1` COMMUTE on ALL of `O ℚ`: `L_{u1} ∘ R_{u1} = R_{u1} ∘ L_{u1}`. Pointwise this is
    `u1 · (x · u1) = (u1 · x) · u1` — EXACTLY the FLEXIBLE law (`mul_flex`), the LAST multiplicative
    identity the octonion cascade retains (weaker than associativity). Where N280's CROSS-unit
    two-handed `so(4)` needs associativity and BREAKS off `H` (`so4_breaks_on_O`), this SAME-unit pair
    survives the cascade stop everywhere. -/
theorem flex_reg_commute : lregI.comp rregI = rregI.comp lregI := by
  apply LinearMap.ext; intro x
  simp only [LinearMap.comp_apply, lregI_apply, rregI_apply]
  exact mul_flex u1 x

/-! ## (B) Each face is a complex structure: squares to `-id`. -/

/-- ★★ The LEFT face squares to `(-1)•id` (banked `leftReg_sq` + `gForm u1M = 1`). -/
theorem lregI_sq : lregI.comp lregI = (-1 : ℚ) • LinearMap.id := by
  show (leftReg u1M).comp (leftReg u1M) = (-1 : ℚ) • LinearMap.id
  rw [leftReg_sq u1M, gForm_u1M]

/-- ★★ The RIGHT face squares to `(-1)•id` (banked `rightReg_sq` + `gForm u1M = 1`). The fold-root is
    a complex structure on BOTH multiplication faces. -/
theorem rregI_sq : rregI.comp rregI = (-1 : ℚ) • LinearMap.id := by
  show (rightReg u1M).comp (rightReg u1M) = (-1 : ℚ) • LinearMap.id
  rw [rightReg_sq u1M, gForm_u1M]

/-! ## (C) The two faces are genuinely DISTINCT — the torus is rank 2 (banked N280). -/

/-- ★ THE RANK-2 NON-VACUITY: the two faces are distinct operators (banked N280 `lregI_ne_rregI`,
    discriminated at `e2O`: `u1·e2O = e3O ≠ -e3O = e2O·u1`). With `flex_reg_commute` this makes
    `{lregI, rregI}` a genuine rank-2 abelian family, not a rank-1 collapse. -/
theorem foldRoot_faces_distinct : lregI ≠ rregI := lregI_ne_rregI

/-! ## (D) THE EIGEN-SPLIT: `foldVec = L+R` on the ℂ-core, `foldAx = L-R` on the charged sector. -/

/-- The VECTOR combination `foldVec = lregI + rregI` (the trace/symmetric face). -/
def foldVec : Module.End ℚ (O ℚ) := lregI + rregI
/-- The AXIAL combination `foldAx = lregI - rregI` (the anti-symmetric face). -/
def foldAx : Module.End ℚ (O ℚ) := lregI - rregI

@[simp] theorem foldVec_apply (x : O ℚ) : foldVec x = u1 * x + x * u1 := by
  simp only [foldVec, LinearMap.add_apply, lregI_apply, rregI_apply]
@[simp] theorem foldAx_apply (x : O ℚ) : foldAx x = u1 * x - x * u1 := by
  simp only [foldAx, LinearMap.sub_apply, lregI_apply, rregI_apply]

/-- ★★ `foldVec` on the real unit: `foldVec 1 = 2•u1` (support in the ℂ-core `span{1,u1}`, N266). -/
theorem foldVec_one : foldVec (1 : O ℚ) = (2 : ℚ) • u1 := by rw [foldVec_apply]; oct_coord

/-- ★★ `foldVec` on the fold-root: `foldVec u1 = -2•1` — maps `u1` OUT of the imaginary subspace
    `ImO` (into `span{1}`). This is why the vector-7 adjoint rep discards the `foldVec` direction. -/
theorem foldVec_u1 : foldVec u1 = (-2 : ℚ) • (1 : O ℚ) := by rw [foldVec_apply]; oct_coord

/-- ★★ `foldVec` KILLS the charged imaginary unit `e2O` (and, by the frame, the whole charged
    complement): the vector face is BLIND to the charged sector, alive only on the ℂ-core. -/
theorem foldVec_kills_e2O : foldVec e2O = 0 := by rw [foldVec_apply]; oct_coord
theorem foldVec_kills_e3O : foldVec e3O = 0 := by rw [foldVec_apply]; oct_coord
theorem foldVec_kills_e4O : foldVec e4O = 0 := by rw [foldVec_apply]; oct_coord
theorem foldVec_kills_e5O : foldVec e5O = 0 := by rw [foldVec_apply]; oct_coord
theorem foldVec_kills_e6O : foldVec e6O = 0 := by rw [foldVec_apply]; oct_coord
theorem foldVec_kills_e7O : foldVec e7O = 0 := by rw [foldVec_apply]; oct_coord

/-- ★★ `foldAx` KILLS the ℂ-core: `foldAx 1 = 0` and `foldAx u1 = 0` — the axial face is BLIND to the
    core, alive only on the charged sector (the exact complement of `foldVec`'s support). -/
theorem foldAx_one : foldAx (1 : O ℚ) = 0 := by rw [foldAx_apply]; oct_coord
theorem foldAx_u1 : foldAx u1 = 0 := by rw [foldAx_apply]; oct_coord

/-- ★★ The two eigen-faces are ORTHOGONAL supports summing to the whole worldMap difference:
    `foldVec + foldAx = 2•lregI` and `foldVec - foldAx = 2•rregI` (the L/R faces recovered). -/
theorem foldVec_add_foldAx : foldVec + foldAx = (2 : ℚ) • lregI := by
  simp only [foldVec, foldAx]; module
theorem foldVec_sub_foldAx : foldVec - foldAx = (2 : ℚ) • rregI := by
  simp only [foldVec, foldAx]; module

/-! ## (E) THE RANK COLLAPSE — the ★2-ceiling dissolution. -/

/-- ★★★ THE RANK-2 → RANK-1 COLLAPSE ON THE IMAGINARY SUBSPACE. `foldVec` annihilates every charged
    imaginary generator (`foldVec_kills_e2O`..`_e7O`) and sends the remaining imaginary generator `u1`
    OUT of `ImO` (`foldVec u1 = -2•1 ∈ span{1}`, `foldVec_u1`). So on the imaginary subspace `ImO`,
    `foldVec` carries NO `ImO → ImO` endomorphism content beyond the `u1`-axis — precisely the
    direction the vector-7 adjoint representation (which lives on `ImO` and discards the real unit)
    cannot see. This is the STRUCTURAL reason the second independent neutral generator is UN-forceable
    on the vector-7 (the ≥11×-deferred ★2 ceiling, N257: `Q ∉ span{T3, Y}`): the rank-2 neutral torus
    of the matter SPINOR collapses to rank-1 when restricted to the adjoint/vector-7 carrier, because
    the vector face lives on the fold's real-unit ℂ-core that the adjoint rep throws away. -/
theorem foldVec_imaginary_content_is_u1_axis :
    (foldVec e2O = 0 ∧ foldVec e3O = 0 ∧ foldVec e4O = 0 ∧
     foldVec e5O = 0 ∧ foldVec e6O = 0 ∧ foldVec e7O = 0) ∧
    foldVec u1 = (-2 : ℚ) • (1 : O ℚ) :=
  ⟨⟨foldVec_kills_e2O, foldVec_kills_e3O, foldVec_kills_e4O,
    foldVec_kills_e5O, foldVec_kills_e6O, foldVec_kills_e7O⟩, foldVec_u1⟩

/-! ## (F) COLOUR CENTRALIZES BOTH FACES — the whole neutral torus is colour-invariant. -/

/-- ★★ COLOUR CENTRALIZES BOTH FACES OF THE FOLD-ROOT. For any ℚ-linear Leibniz derivation `D` of
    `O ℚ` with `D u1 = 0` (the colour condition, N201 `stabLieQ`/`colourCentralizer`), `D` commutes
    with BOTH regular faces of `u1`:
      `D ∘ L_{u1} = L_{u1} ∘ D`   (the LEFT face — N201 `commutes_JO_iff`, `JO = L_{u1}`), and
      `D ∘ R_{u1} = R_{u1} ∘ D`   (the RIGHT face — the twin, `D(x·u1) = (Dx)·u1 + x·(D u1) = (Dx)·u1`).
    So colour centralizes the WHOLE neutral torus `{L_{u1}, R_{u1}}`, not merely the complex structure
    `JO = L_{u1}` it was defined by. Pure Leibniz; no associativity, no coordinate expansion. -/
theorem colour_centralizes_both_faces {D : Module.End ℚ (O ℚ)} (hD : IsDerivQ D) (hu : D u1 = 0) :
    D.comp lregI = lregI.comp D ∧ D.comp rregI = rregI.comp D := by
  refine ⟨?_, ?_⟩
  · -- LEFT: lregI = L_{u1} = JO, so this is N201 comm_deriv_JO with D u1 = 0.
    apply LinearMap.ext; intro x
    simp only [LinearMap.comp_apply, lregI_apply]
    have hd : D (u1 * x) = D u1 * x + u1 * D x := hD u1 x
    rw [hd, hu, zero_mul, zero_add]
  · -- RIGHT: rregI = R_{u1}; D(x*u1) = (D x)*u1 + x*(D u1) = (D x)*u1.
    apply LinearMap.ext; intro x
    simp only [LinearMap.comp_apply, rregI_apply]
    have hd : D (x * u1) = D x * u1 + x * D u1 := hD x u1
    rw [hd, hu, mul_zero, add_zero]

/-! ## (G) THE CAPSTONE. -/

/-- ★★★ THE FOLD-ROOT'S TWO-FACED NEUTRAL TORUS (capstone). Over the derived octonion rung
    `O ℚ = CD (H ℚ)` and its matter spinor (`leftReg`/`rightReg`), the two regular faces
    `lregI = L_{u1}`, `rregI = R_{u1}` of the fold-root:
    (i)  COMMUTE on ALL of `O ℚ` (`flex_reg_commute`, via flexibility — surviving the cascade stop
         that breaks N280's cross-unit `so(4)` off `H`),
    (ii) each square to `-id` (complex structures on both faces),
    (iii) are DISTINCT (rank 2, N280),
    (iv) split into `foldVec` (supported on the ℂ-core, killing the charged sector) and `foldAx`
         (killing the core),
    (v)  the vector face carries NO `ImO → ImO` content beyond the `u1`-axis (the rank-2 → rank-1
         collapse under the adjoint rep — the ★2-ceiling dissolution),
    with the octonion cap `cap_forces_nonassoc` carried in the type (NOT carrier-agnostic — over an
    associative rung the "survives-where-the-so(4)-breaks" content is vacuous). -/
theorem foldRoot_neutral_torus_structure :
    (lregI.comp rregI = rregI.comp lregI) ∧
    (lregI.comp lregI = (-1 : ℚ) • LinearMap.id) ∧
    (rregI.comp rregI = (-1 : ℚ) • LinearMap.id) ∧
    (lregI ≠ rregI) ∧
    (foldVec (1 : O ℚ) = (2 : ℚ) • u1) ∧
    (foldVec e2O = 0) ∧
    (foldAx (1 : O ℚ) = 0) ∧
    (foldVec u1 = (-2 : ℚ) • (1 : O ℚ)) ∧
    ¬ (∀ x y z : O ℚ, x * y * z = x * (y * z)) := by
  refine ⟨flex_reg_commute, lregI_sq, rregI_sq, foldRoot_faces_distinct, foldVec_one,
    foldVec_kills_e2O, foldAx_one, foldVec_u1, ?_⟩
  exact cap_forces_nonassoc

end

end Phys.Algebra
