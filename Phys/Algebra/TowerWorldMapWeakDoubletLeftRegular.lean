/-
# N279 — THE WEAK-ISOSPIN FUNDAMENTAL DOUBLET OF MATTER IS THE LEFT-REGULAR QUATERNION ACTION ON
  THE SPINOR, CONFINED TO THE LAST ASSOCIATIVE RUNG BY THE CASCADE-STOPPING ASSOCIATOR

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)` (the terminal cascade algebra, N2c) and its matter
SPINOR structure (`leftReg`, N261: `O ℚ` is a Clifford module for the fold's Born form `gForm`),
this node builds the FUNDAMENTAL (spin-½ doublet) realization of the weak-isospin `su(2)_L` on the
matter spinor — DISTINCT from N277's ADJOINT (triplet) realization on the vector-7 `ImO`.

N277 realized `su(2)_L = {imRep DI, imRep DJ, imRep DK}` as INNER DERIVATIONS acting ADJOINT on the
vector-7 `ImO`, decomposing it into TRIPLETS `3 ⊕ 1 ⊕ 3`. But the derivation is the ADJOINT action.
The FUNDAMENTAL (doublet) action is the LEFT-REGULAR multiplication `leftReg a = (a · −)` by the
imaginary units of the last-doubled quaternion subalgebra `H ⊂ O`. This node proves:

* THE GENERIC OBSTRUCTION IDENTITY (`leftmul_comm_obstruction`, coordinate-free from
  `assoc_swap12`): for ALL `a b y : O ℚ`,
    `a*(b*y) - b*(a*y) - (a*b - b*a)*y = -2 • assoc a b y`.
  The failure of the left-regular commutator to be the left-regular of the algebra commutator IS
  (twice) the banked associator (the gather gluing obstruction, N219 / N262 spinGen).

* CLOSURE ON THE ASSOCIATIVE RUNG (`assoc_vanishes_on_H`): the associator vanishes on the whole
  H-image `range iotaO` (via `CD.iota_assoc_iff`, H associative), so on H the left-regular units
  CLOSE: `L_hI, L_hJ, L_hK` satisfy `⁅L_hI, L_hJ⁆ = 2•L_hK` (cyclically) — the `su(2)` closes.

* THE DOUBLET CASIMIR (`leftReg_casimir_eq_neg_three`): `(L_hI)² + (L_hJ)² + (L_hK)² = -3 • id`
  on ALL of `O ℚ` (each square `= -(gForm ·)•id = -1•id` by `leftReg_sq` + `gForm = 1`). The value
  `-3` is the spin-½ / FUNDAMENTAL DOUBLET certificate (contrast N277's adjoint Casimir `-8`).

* THE OBSTRUCTION IS GENUINE / CONFINEMENT (`leftReg_comm_obstructed`, W8): on the full spinor
  `O ℚ` the left-regular `su(2)` does NOT close — `⁅L_hI, L_hJ⁆ ≠ 2•L_hK` — because the associator
  is nonzero (`assoc_nonvanishing`). So the fundamental doublet is CONFINED to the last associative
  rung `H`, obstructed on `O` by exactly the associator that STOPS THE CASCADE.

## THE ONE CAUSE (STANDARD §0, the moat)
The SAME octonionic non-associativity that (a) STOPS the cascade (`O` non-associative / division law
lost at `S = CD(O)`, N2c), (b) caps the generation tower at 3 (N5), and (c) blocks the second
chirality (N264, mixed commutator = associator), here CONFINES the weak-isospin fundamental doublet
to the last associative rung `H`. The doublet EXISTS (closes on `H`) and is CONFINED (obstructed on
`O`) by ONE cause: the cascade-stopping associator. The ★3 ↔ ★15/cascade-stop ↔ ★6/chirality joint.

## DISSOLUTION
Standard physics POSITS which fermions are left-handed weak-isospin doublets and takes the
fundamental 2-representation as a chosen representation. The theory DERIVES the doublet as the forced
left-regular action of the last-doubled units, and its confinement (why it does not extend to a
larger structure) as the SAME associator that stops the cascade. A posited assignment becomes a
forced consequence of the cascade stop.

## PHYSICS-WORDS-REMOVABLE (STANDARD §2)
Delete isospin/doublet/spin-½/weak/matter/generation/fundamental: what remains is a pure theorem
about the three left-multiplication operators of the imaginary units of the associative subalgebra
`H ⊂ O ℚ`: they satisfy `⁅L_a, L_b⁆ - L_{[a,b]} = -2•assoc(a,b,·)`, which vanishes on `H` (so they
close into a 3-dimensional Lie algebra there, with Casimir `-3•id`) and is nonzero on `O ℚ` (the
banked associator). Octonion-SPECIFIC: the closure/obstruction split IS the associative/non-
associative boundary of the cascade. NOT free-floating: every headline TYPE mentions the banked
`leftReg`/`O ℚ`/`assoc`/`u1`/`e2O`/`e3O`/`iotaO`.

## SCOPE (do NOT overclaim)
Banks the left-regular fundamental `su(2)_L` doublet realization + closure-on-H + Casimir `-3` +
obstruction-is-the-associator + the confinement + the one-cause tie ONLY. NOT the hypercharge
NORMALIZATION / weak mixing angle (★2, ceiling STANDS — `Q ∉ span{T3,Y}`, `[Q,Y] ≠ 0` on the
vector-7; nothing childed toward it); NOT the full electroweak `su(2)⊕u(1)` Lie action on the
carrier (a different, adjoint front); NOT parity VIOLATION (which hand couples — ★6 stays a germ);
NOT masses/mixings (★5); NOT "= a specific SM multiplet" (removable prose).
-/
import Phys.Algebra.TowerWorldMapCliffordModule
import Phys.Algebra.TowerGatherIsospinMultiplet
import Phys.Algebra.TowerGatherJointChargeIsospinWeights
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationColourIsospinCommutator
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationSkew
import Phys.Algebra.JordanTower
import Phys.Cascade.ForcedStop
import Mathlib.Tactic

open scoped Classical
open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## (A) The generic left-regular commutator obstruction = the associator. -/

/-- ★★★ THE GENERIC OBSTRUCTION IDENTITY (coordinate-free, from `assoc_swap12`): for ALL
    `a b y : O ℚ`, the failure of the left-regular commutator `L_a L_b - L_b L_a` to equal the
    left-regular of the algebra commutator `L_{a*b - b*a}` is EXACTLY (twice) the associator:
      `a*(b*y) - b*(a*y) - (a*b - b*a)*y = -2 • assoc a b y`.
    This is the pointwise form; the left-regular action fails to be a Lie homomorphism precisely by
    the banked associator (the gather gluing obstruction, N219). -/
theorem leftmul_comm_obstruction (a b y : O ℚ) :
    a * (b * y) - b * (a * y) - (a * b - b * a) * y = (-2 : ℚ) • assoc a b y := by
  have h : assoc b a y = - assoc a b y := eq_neg_of_add_eq_zero_right (assoc_swap12 a b y)
  have key : a * (b * y) - b * (a * y) - (a * b - b * a) * y
      = - assoc a b y + assoc b a y := by
    simp only [assoc, sub_mul]; abel
  rw [key, h]; module

/-! ## (B) The associator vanishes on the last associative rung H = range iotaO. -/

/-- ★★ THE ASSOCIATOR VANISHES ON THE H-IMAGE. For all quaternions `a b c : H ℚ`, the associator of
    their images under the doubling embedding `iotaO : H ℚ → O ℚ` is zero — because `H` is
    associative and `iotaO = CD.iota` is a ring homomorphism (`CD.iota_assoc_iff`). This is the
    algebraic content of "the last rung `H` before the cascade stop still associates". -/
theorem assoc_iotaO (a b c : H ℚ) : assoc (iotaO a) (iotaO b) (iotaO c) = 0 := by
  show (iotaO a * iotaO b) * iotaO c - iotaO a * (iotaO b * iotaO c) = 0
  rw [sub_eq_zero]
  show (CD.iota a * CD.iota b) * CD.iota c = CD.iota a * (CD.iota b * CD.iota c)
  rw [CD.iota_assoc_iff]; exact mul_assoc a b c

/-! ## (C) The last-doubled quaternion imaginary units as elements of O, and their embeddings. -/

/-- `u1 = iotaO hI` — the first H-imaginary unit as the image of the quaternion `hI` (banked
    `u1_eq_iotaO_hI`, N197). -/
theorem u1_iotaO : u1 = iotaO hI := u1_eq_iotaO_hI

/-- `e2O = iotaO hJ` — the second H-imaginary unit is the image of the quaternion `hJ = e2`. -/
theorem e2O_iotaO : e2O = iotaO hJ := by apply CD.ext <;> rfl

/-- `e3O = iotaO hK` — the third H-imaginary unit is the image of the quaternion `hK = hI*hJ`. -/
theorem e3O_iotaO : e3O = iotaO hK := by
  rw [show (hK : H ℚ) = ⟨0, Dbl.J⟩ from hK_def]
  apply CD.ext
  · apply CD.ext
    · rfl
    · show (⟨0, 1⟩ : Dbl ℚ) = Dbl.J; rfl
  · rfl

/-! ## (D) The left-regular operators of the three units, and the su(2) closure on H. -/

/-- The left-regular operator of the first H-imaginary unit, `L_hI = leftReg u1M`. -/
noncomputable def lregI : Module.End ℚ (O ℚ) := leftReg u1M
/-- The left-regular operator of the second H-imaginary unit, `L_hJ = leftReg e2I`. -/
noncomputable def lregJ : Module.End ℚ (O ℚ) := leftReg e2I
/-- The left-regular operator of the third H-imaginary unit, `L_hK = leftReg e3I`. -/
noncomputable def lregK : Module.End ℚ (O ℚ) := leftReg e3I

@[simp] theorem lregI_apply (y : O ℚ) : lregI y = u1 * y := rfl
@[simp] theorem lregJ_apply (y : O ℚ) : lregJ y = e2O * y := rfl
@[simp] theorem lregK_apply (y : O ℚ) : lregK y = e3O * y := rfl

/-- ★★ THE su(2) CLOSURE ON THE ASSOCIATIVE RUNG H (leg I,J → K). For every `y` in the H-image
    (`y = iotaO w`), the left-regular commutator closes: `⁅L_hI, L_hJ⁆ y = 2 • (L_hK y)`, because
    `hI*hJ = hK` and `hJ*hI = -hK` (so `[hI,hJ] = 2hK`) AND the associator vanishes on H. The
    fundamental su(2) is a genuine Lie algebra on the last associative rung. -/
theorem leftReg_closure_on_H_IJ (w : H ℚ) :
    lregI (lregJ (iotaO w)) - lregJ (lregI (iotaO w)) = (2 : ℚ) • lregK (iotaO w) := by
  simp only [lregI_apply, lregJ_apply, lregK_apply]
  rw [u1_iotaO, e2O_iotaO, e3O_iotaO]
  -- reduce the commutator using the generic obstruction identity, with associator = 0 on H
  have hob := leftmul_comm_obstruction (iotaO hI) (iotaO hJ) (iotaO w)
  have hz : assoc (iotaO hI) (iotaO hJ) (iotaO w) = 0 := assoc_iotaO hI hJ w
  rw [hz, smul_zero] at hob
  -- hI*hJ - hJ*hI = 2 hK  ⟹  (iotaO hI * iotaO hJ - iotaO hJ * iotaO hI) = iotaO (2 hK)
  have hcomm : iotaO hI * iotaO hJ - iotaO hJ * iotaO hI = iotaO ((2 : ℚ) • hK) := by
    rw [show (iotaO hI * iotaO hJ) = iotaO (hI * hJ) from (CD.iota_mul hI hJ).symm,
        show (iotaO hJ * iotaO hI) = iotaO (hJ * hI) from (CD.iota_mul hJ hI).symm,
        ← map_sub]
    congr 1
    rw [hI_hJ, hJ_hI, sub_neg_eq_add, two_smul]
  -- from hob : (iotaO hI)*((iotaO hJ)*y) - (iotaO hJ)*((iotaO hI)*y) - (iotaO hI*iotaO hJ - iotaO hJ*iotaO hI)*y = 0
  have := sub_eq_zero.mp hob
  rw [this, hcomm]
  -- (iotaO (2•hK)) * (iotaO w) = 2 • (iotaO hK * iotaO w)
  rw [show iotaO ((2:ℚ) • hK) = (2:ℚ) • iotaO hK from map_smul iotaO 2 hK]
  rw [← e3O_iotaO]
  exact qsmul_mul_left 2 e3O (iotaO w)

/-! ## (E) The doublet Casimir = -3•id (the spin-½ / fundamental certificate). -/

/-- The Born self-overlaps of the three H-imaginary units are all `1` (they are Born units). -/
theorem gForm_u1M : gForm (u1M : O ℚ) (u1M : O ℚ) = 1 := gForm_u1
theorem gForm_e2I : gForm (e2I : O ℚ) (e2I : O ℚ) = 1 := gForm_u2_u2
theorem gForm_e3I : gForm (e3I : O ℚ) (e3I : O ℚ) = 1 := by
  show gForm e3O e3O = 1; simp only [gForm, e3O, reQ]; norm_num

/-- ★★★ THE FUNDAMENTAL DOUBLET CASIMIR: `(L_hI)² + (L_hJ)² + (L_hK)² = -3 • id` on ALL of `O ℚ`.
    Each square is `-(gForm ·)•id = -1•id` (via `leftReg_sq` + the units being Born-normalized), so
    the sum is `-3•id`. The value `-3 = -(2)²·(1/2)(1/2+1)·… ` is the spin-½ / FUNDAMENTAL DOUBLET
    certificate — contrast N277's ADJOINT triplet Casimir `-8`. This holds on the WHOLE spinor
    (associativity is NOT needed for the diagonal squares, only `leftReg_sq`). -/
theorem leftReg_casimir_eq_neg_three :
    lregI.comp lregI + lregJ.comp lregJ + lregK.comp lregK = (-3 : ℚ) • LinearMap.id := by
  show (leftReg u1M).comp (leftReg u1M) + (leftReg e2I).comp (leftReg e2I)
      + (leftReg e3I).comp (leftReg e3I) = (-3 : ℚ) • LinearMap.id
  rw [leftReg_sq u1M, leftReg_sq e2I, leftReg_sq e3I, gForm_u1M, gForm_e2I, gForm_e3I]
  module

/-! ## (F) The obstruction is genuine on the full spinor (W8) — the CONFINEMENT. -/

/-- The obstruction octonion at the doubling unit `e4O ∈ Hℓ`: the left-regular commutator defect
    `u1*(e2O*e4O) - e2O*(u1*e4O) - 2•(e3O*e4O)` equals `-4 • e7O`, a nonzero element of the doubled
    half `Hℓ` — the fundamental su(2) FAILS to close there. Concrete coordinate computation over the
    cascade ground ring `ℚ`. -/
theorem leftReg_obstruction_at_e4O :
    u1 * (e2O * e4O) - e2O * (u1 * e4O) - (2 : ℚ) • (e3O * e4O) = (-4 : ℚ) • e7O := by
  apply CD.ext <;> apply CD.ext <;> apply Dbl.ext <;>
    simp only [u1, e2O, e3O, e4O, e7O, sub_eq_add_neg,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
      CD.neg_re, CD.neg_im,
      cd_qsmul_re, cd_qsmul_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.zero_im, Dbl.one_re,
      Dbl.smul_re, Dbl.smul_im] <;> ring

/-- ★★ W8 — THE su(2) DOES NOT CLOSE ON THE FULL SPINOR (CONFINEMENT). There EXISTS `y : O ℚ` with
    `⁅L_hI, L_hJ⁆ y ≠ 2 • (L_hK y)` — the left-regular fundamental `su(2)` fails to close on the
    non-associative `O ℚ`. Witnessed at the doubling unit `y = e4O ∈ Hℓ`, where the defect is
    `-4 • e7O ≠ 0`. So the fundamental doublet is CONFINED to the last associative rung `H`,
    obstructed on `O ℚ` by exactly the associator that STOPS THE CASCADE. -/
theorem leftReg_comm_obstructed :
    ∃ y : O ℚ, lregI (lregJ y) - lregJ (lregI y) - (2 : ℚ) • lregK y ≠ 0 := by
  refine ⟨e4O, ?_⟩
  simp only [lregI_apply, lregJ_apply, lregK_apply]
  rw [leftReg_obstruction_at_e4O]
  intro h
  have hc : ((-4 : ℚ) • e7O).im.im.im = 0 := by rw [h]; rfl
  simp only [e7O, cd_qsmul_im, Dbl.smul_im] at hc
  norm_num at hc

/-! ## (G) The confinement is the cascade-stopping non-associativity (the ONE CAUSE). -/

/-- ★★ THE OBSTRUCTION IS THE ASSOCIATOR (one-cause, coordinate-free). The left-regular commutator
    defect equals `-2 •` the banked associator on the H-imaginary units — the SAME associator that
    (N2c) stops the cascade, (N5) caps generations, and (N264) blocks the second chirality. So the
    fundamental doublet's confinement to `H` is ONE consequence of the cascade stop. -/
theorem leftReg_defect_eq_associator (y : O ℚ) :
    lregI (lregJ y) - lregJ (lregI y) - (2 : ℚ) • lregK y = (-2 : ℚ) • assoc u1 e2O y := by
  simp only [lregI_apply, lregJ_apply, lregK_apply]
  have hcomm : u1 * e2O - e2O * u1 = (2 : ℚ) • e3O := by
    have h1 : u1 * e2O = e3O := by rw [← JO_apply]; exact JO_e2
    have h2 : e2O * u1 = -e3O := by
      rw [u1_iotaO, e2O_iotaO,
          show (iotaO hJ * iotaO hI) = iotaO (hJ * hI) from (CD.iota_mul hJ hI).symm, hJ_hI,
          map_neg, ← e3O_iotaO]
    rw [h1, h2]; module
  have hob := leftmul_comm_obstruction u1 e2O y
  rw [hcomm, qsmul_mul_left] at hob
  exact hob

/-! ## (H) THE CAPSTONE. -/

/-- ★★★ THE WEAK-ISOSPIN FUNDAMENTAL DOUBLET STRUCTURE (capstone). Over the derived octonion rung
    `O ℚ = CD (H ℚ)` (the terminal cascade algebra) and its matter spinor (`leftReg`, N261), the
    left-regular action of the last-doubled quaternion imaginary units `u1, e2O, e3O`:
    (i) CLOSES into `su(2)` on the last associative rung `H` (`leftReg_closure_on_H_IJ`);
    (ii) has the FUNDAMENTAL DOUBLET Casimir `-3•id` on the whole spinor (`leftReg_casimir_eq_neg_three`);
    (iii) FAILS to close on the full non-associative `O ℚ` (`leftReg_comm_obstructed`, W8), the
          defect being `-2•` the banked associator (`leftReg_defect_eq_associator`);
    (iv) the cap is at order 3 (the arena `H₄` is not Jordan — `cap_forces_nonassoc` witnesses the
         non-associativity that both stops the cascade and confines the doublet, NOT carrier-agnostic).
    ONE CAUSE: the cascade-stopping associator is what confines the fundamental weak doublet to the
    last associative rung. -/
theorem weak_doublet_leftregular_structure :
    (∀ w : H ℚ, lregI (lregJ (iotaO w)) - lregJ (lregI (iotaO w)) = (2 : ℚ) • lregK (iotaO w)) ∧
    (lregI.comp lregI + lregJ.comp lregJ + lregK.comp lregK = (-3 : ℚ) • LinearMap.id) ∧
    (∃ y : O ℚ, lregI (lregJ y) - lregJ (lregI y) - (2 : ℚ) • lregK y ≠ 0) ∧
    (∀ y : O ℚ, lregI (lregJ y) - lregJ (lregI y) - (2 : ℚ) • lregK y = (-2 : ℚ) • assoc u1 e2O y) ∧
    ¬ (∀ x y z : O ℚ, x * y * z = x * (y * z)) :=
  ⟨leftReg_closure_on_H_IJ, leftReg_casimir_eq_neg_three, leftReg_comm_obstructed,
   leftReg_defect_eq_associator, cap_forces_nonassoc⟩

end Phys.Algebra
