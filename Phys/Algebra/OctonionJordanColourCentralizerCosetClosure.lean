import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

/-
  Phys.Algebra.OctonionJordanColourCentralizerCosetClosure —
  N293: THE su(3)/so(3) SYMMETRIC-PAIR CLOSURE — the fold-root-dressed family-breaking coset of the
        derived colour-centralizer closes BACK into the family symmetry.

  ------------------------------------------------------------------------------
  THE STORY (theory-native; the directed W1/W9 dissolution N292 childed).
  N292 built the fold-root-DRESSED family-BREAKING coset of the derived colour-centralizer `su(3) =
  Z_{f₄}(colour)` inside the fold-forced `f₄ = Der(H₃(O)) = derH3`:

      kAB = innerMul (slotA u1)(slotB 1),  kBC = innerMul (slotB u1)(slotC 1),
      kCA = innerMul (slotC u1)(slotA 1)      (u1 = the fold-root √−1, imaginary),

  each ∈ `f₄`, colour-neutral, moving the three cap-forced generations (N267) through the fold's
  √−1. N292 SCOPED OUT the CLOSURE — that bracketing two of these fold-root-dressed family-BREAKING
  directions REGENERATES a family-symmetry generator:

      ★★★  ⁅kAB, kBC⁆ = famB,   ⁅kBC, kCA⁆ = famC,   ⁅kCA, kAB⁆ = −famA   (cyclic),

  where famA/famB/famC = innerMul(slotB 1)(slotC 1) / innerMul(slotC 1)(slotA 1) /
  innerMul(slotA 1)(slotB 1) are the banked family-so(3) generators (N288/N289). Together the
  family-so(3) [3, the maximal compact] and this fold-root-dressed coset [5] close the dim-8 SIMPLE
  su(3) = Z_{f₄}(colour): the family-breaking is the "square-root" of the family so(3). THIS node
  banks the closure — the exact N288→N289 analog (N288 built the family generators, N289 the so(3)
  closure; N292 built the coset, N293 its symmetric-pair closure).

  ------------------------------------------------------------------------------
  THE DISSOLUTION (docs/RUNBOOK.md W1 step 2 — reframe through the theory; THE ONE LAW). The closure
  is an OPERATOR identity in `Module.End`. The direct `LinearMap.ext` over the arena is an octonion
  coordinate bash (W9); the Jacobi/lie_lie route the task first proposed is CIRCULAR (the base
  bracket `⁅L(slotB 1), innerMul(slotA u1)(slotC 1)⁆` reduces back through the very
  `⁅kAB, L(slotC 1)⁆` lemma). The theory DISSOLVES it, extending N289's nuclear-collapse to the
  fold-root:

    (1) THE COSET GENERATORS ARE MATRIX-COMMUTATOR ENDOMORPHISMS. Because one slot of each carries
        the CENTRAL real unit (`slotB 1 = ocRM pB`, N289), the Jordan inner-multiplication collapses
        (RIGHT-central `innerMul_ocRM_right`, generalizing N289 `collapse`):
            kAB = adE (slotA u1 * slotB 1 − slotB 1 * slotA u1) = adE (u1M P_AB),
        where `u1M P` is the "fold-root-line" matrix `(u1M P) i j = ocR (P i j) * u1` and `P_AB`,
        `P_BC`, `P_CA` are explicit 0/±1 rational patterns. The u1-dressed coset lives on the
        fold-root line.
    (2) THE FOLD-ROOT ALTERNATIVITY LIE-HOM. `⁅adE (u1M P), adE (u1M Q)⁆ = adE (u1M P * u1M Q −
        u1M Q * u1M P)` (`adE_bracket_u1`) — valid because every entry of `u1M P`, `u1M Q` lies on
        the fold-root line `ℚ·u1`, so the matrix associators reduce ENTRYWISE to
            [p•u1, q•u1, x] = 0  (left alt),  [x, p•u1, q•u1] = 0  (right alt),
            [p•u1, x, q•u1] = 0  (flexible)
        — the SAME octonion alternativity that stops the cascade (N2/N5), now closing the u1-dressed
        coset. No coordinate bash.
    (3) THE FOLD-ROOT'S OWN SQUARE CLOSES IT. `u1 * u1 = −1` (N6 `complexUnit_sq`) makes two
        fold-root-line matrices multiply to a REAL (central) matrix: `u1M P * u1M Q = − ocRM (P*Q)`
        (`u1M_mul`). So the bracket lands back in the CENTRAL family:
            ⁅adE(u1M P_AB), adE(u1M P_BC)⁆ = adE (ocRM (P_BC*P_AB − P_AB*P_BC)),
        and the pure-ℚ matrix identity `P_BC*P_AB − P_AB*P_BC = pC*pA − pA*pC` (`decide`-closable
        0/±1 structure constants) equals the famB source (N289 `famB_eq_adE`).

  So the heavy operator identity over the non-associative arena becomes a light chain of fold-root
  alternativity reassociations + the fold-root's own square + a constant-matrix commutator. THE
  PHYSICS: the fold-root's own relation `u1² = −1` is WHY bracketing two fold-root-dressed
  family-BREAKING directions regenerates the real-unit family so(3) — one cause (u1²=−1), the coset
  closes into the family.

  ------------------------------------------------------------------------------
  THE ONE CAUSE, MANY TERMINATIONS. The SAME octonion non-associativity that stops the cascade (N2c),
  caps the Hermitian Jordan tower at order 3 (N5), and furnishes exactly three matter-carrier slots
  (N267) — here, in its ALTERNATIVE (`alt_left/right/flex`) guise plus the fold-root's `u1² = −1`,
  closes the fold-root-dressed coset back into the family so(3), completing the dim-8 simple su(3).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete colour/family/generation/flavour/breaking:
  three inner-multiplication commutators built from a fold-root-line-dressed and a real-unit slot
  satisfy `⁅kAB, kBC⁆ = famB` cyclically as endomorphisms of `Matrix (Fin 3) (Fin 3) (O ℚ)`, so the
  fold-root-line coset and the real-unit generators together span the dim-8 simple Lie algebra. Pure
  math; physics lives only in identifiers.

  SCOPE (docs/RUNBOOK.md W4.5). BANKS the three cyclic closures + the collapse/Lie-hom/product
  machinery + non-vacuity (`famB ≠ 0`, N289). Does NOT bank: the full dim-8 `su(3)` as a bundled
  `LieSubalgebra` (optional hardening); the (7,5) module character; the ★2 mixing VALUE
  (route-not-yet-found — a FORCED build target); `= physical SU(3)_flavour` (removable prose).

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 1200000

/-! ## R0 — the fold-root-line matrices `u1M P` and their nuclearity. -/

/-- The FOLD-ROOT-LINE matrix: `(u1M P) i j = ocR (P i j) * u1`. Its entries lie on the line
    `ℚ·u1 ⊆ O ℚ` (the fold-root `√−1` scaled by ground rationals) — the u1-dressed analog of the
    central `ocRM P` (N289). -/
noncomputable def u1M (P : Matrix (Fin 3) (Fin 3) ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => ocR (P i j) * u1)

@[simp] theorem u1M_apply (P : Matrix (Fin 3) (Fin 3) ℚ) (i j : Fin 3) :
    u1M P i j = ocR (P i j) * u1 := rfl

/-- MATRIX MIDDLE NUCLEARITY for the central `ocRM P` (the handle N289 did not need but the
    right-central collapse does): `Y * (ocRM P * Z) = (Y * ocRM P) * Z`, entrywise by the banked
    middle nuclearity `ocR_assocM`. -/
theorem ocRM_assoc_M (P : Matrix (Fin 3) (Fin 3) ℚ) (Y Z : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Y * (ocRM P * Z) = (Y * ocRM P) * Z := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, ocRM_apply, Fin.sum_univ_three, mul_add, add_mul, ocR_assocM]
  abel

/-! ### The fold-root alternativity — the entry-level associator vanishing. -/

/-- LEFT ALTERNATIVE on the fold-root line: `((p•u1)(q•u1))x = (p•u1)((q•u1)x)`. Scalars pull out
    (`qsmul_mul_left/right`), leaving the pure octonion left-alternative law `u1(u1 x) = (u1 u1)x`
    (`mul_mul_left`). -/
theorem u1_alt_L (p q : ℚ) (x : O ℚ) :
    ((ocR p * u1) * (ocR q * u1)) * x = (ocR p * u1) * ((ocR q * u1) * x) := by
  simp only [ocRmulL, qsmul_mul_left, qsmul_mul_right, smul_smul]; rw [mul_mul_left]

/-- RIGHT ALTERNATIVE on the fold-root line: `(x(p•u1))(q•u1) = x((p•u1)(q•u1))` (`mul_mul_right`). -/
theorem u1_alt_R (p q : ℚ) (x : O ℚ) :
    (x * (ocR p * u1)) * (ocR q * u1) = x * ((ocR p * u1) * (ocR q * u1)) := by
  simp only [ocRmulL, qsmul_mul_left, qsmul_mul_right, smul_smul]; rw [mul_mul_right]

/-- FLEXIBLE law on the fold-root line: `((p•u1)x)(q•u1) = (p•u1)(x(q•u1))` (`mul_flex`). -/
theorem u1_alt_M (p q : ℚ) (x : O ℚ) :
    ((ocR p * u1) * x) * (ocR q * u1) = (ocR p * u1) * (x * (ocR q * u1)) := by
  simp only [ocRmulL, qsmul_mul_left, qsmul_mul_right, smul_smul]; rw [mul_flex]

/-- MATRIX NUCLEARITY (left) for two fold-root-line factors: `u1M P * (u1M Q * X) = (u1M P * u1M Q)
    * X`, entrywise by the fold-root left-alternative law `u1_alt_L`. -/
theorem u1M_assoc_L (P Q : Matrix (Fin 3) (Fin 3) ℚ) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    u1M P * (u1M Q * X) = (u1M P * u1M Q) * X := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, u1M_apply, Fin.sum_univ_three, mul_add, add_mul]
  rw [u1_alt_L, u1_alt_L, u1_alt_L, u1_alt_L, u1_alt_L, u1_alt_L, u1_alt_L, u1_alt_L, u1_alt_L]
  abel

/-- MATRIX NUCLEARITY (right): `(X * u1M P) * u1M Q = X * (u1M P * u1M Q)` (via `u1_alt_R`). -/
theorem u1M_assoc_R (P Q : Matrix (Fin 3) (Fin 3) ℚ) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (X * u1M P) * u1M Q = X * (u1M P * u1M Q) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, u1M_apply, Fin.sum_univ_three, mul_add, add_mul]
  rw [u1_alt_R, u1_alt_R, u1_alt_R, u1_alt_R, u1_alt_R, u1_alt_R, u1_alt_R, u1_alt_R, u1_alt_R]
  abel

/-- MATRIX NUCLEARITY (middle): `(u1M P * X) * u1M Q = u1M P * (X * u1M Q)` (via `u1_alt_M`). -/
theorem u1M_assoc_M (P Q : Matrix (Fin 3) (Fin 3) ℚ) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (u1M P * X) * u1M Q = u1M P * (X * u1M Q) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, u1M_apply, Fin.sum_univ_three, mul_add, add_mul]
  rw [u1_alt_M, u1_alt_M, u1_alt_M, u1_alt_M, u1_alt_M, u1_alt_M, u1_alt_M, u1_alt_M, u1_alt_M]
  abel

/-! ## R1 — the fold-root Lie-hom and the fold-root product law (`u1² = −1`). -/

/-- ★★ THE FOLD-ROOT LIE-HOM: `⁅adE (u1M P), adE (u1M Q)⁆ = adE (u1M P * u1M Q − u1M Q * u1M P)`.
    The bracket of two matrix-commutator endomorphisms is the endomorphism of the commutator — valid
    on the fold-root line because the fold-root-line factors reassociate freely (`u1M_assoc_L/M/R`),
    the Jacobi/telescoping being purely the alternativity identity. The direct N289 `adE_bracket`
    analog, u1-dressed. -/
theorem adE_bracket_u1 (P Q : Matrix (Fin 3) (Fin 3) ℚ) :
    ⁅adE (u1M P), adE (u1M Q)⁆ = adE (u1M P * u1M Q - u1M Q * u1M P) := by
  apply LinearMap.ext; intro X
  rw [show (⁅adE (u1M P), adE (u1M Q)⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = adE (u1M P) * adE (u1M Q) - adE (u1M Q) * adE (u1M P) from Ring.lie_def _ _]
  simp only [LinearMap.sub_apply, Module.End.mul_apply, adE_apply]
  simp only [mul_sub, sub_mul]
  rw [u1M_assoc_L P Q X, u1M_assoc_M P Q X, u1M_assoc_R P Q X,
      u1M_assoc_L Q P X, u1M_assoc_M Q P X, u1M_assoc_R Q P X]
  abel

/-- The fold-root's own square, at the entry level: `(p•u1)(q•u1) = −(pq)•1` — because `u1 u1 = −1`
    (N6 `complexUnit_sq`), two fold-root-line elements multiply to a REAL scalar. -/
theorem u1_entry_prod (p q : ℚ) : (ocR p * u1) * (ocR q * u1) = - ocR (p*q) := by
  rw [ocRmulL, ocRmulL, qsmul_mul_left, qsmul_mul_right, smul_smul, complexUnit_sq]
  rw [show ((p*q) • (-1 : O ℚ)) = - ocR (p*q) from by
        rw [smul_neg]; congr 1; rw [show ocR (p*q) = (p*q) • (1:O ℚ) from by
              rw [← ocRmulL, mul_one]]]

/-- ★★ THE FOLD-ROOT PRODUCT LAW: `u1M P * u1M Q = − ocRM (P*Q)`. Two fold-root-line matrices
    multiply to a CENTRAL (real) matrix, negated — the fold-root's `u1² = −1` sending the dressed
    coset back to the real family. This is WHY the family-breaking is the "square-root" of the
    family so(3). -/
theorem u1M_mul (P Q : Matrix (Fin 3) (Fin 3) ℚ) : u1M P * u1M Q = - ocRM (P * Q) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, u1M_apply, u1_entry_prod, Fin.sum_univ_three,
    Matrix.neg_apply, ocRM_apply, neg_smul, one_smul]
  rw [← neg_add, ← neg_add, ocR_add, ocR_add]

/-! ## R2 — the coset generators as `adE` of fold-root-line matrices (the collapse). -/

/-- The entry product `(p•u1)(q_real) = (pq)•u1` — a fold-root-line element times a central real is
    fold-root-line (central reassociation `ocR_assocL/R` + centrality `ocR_comm`). -/
theorem u1_ocR_entry (p q : ℚ) : (ocR p * u1) * ocR q = ocR (p*q) * u1 := by
  rw [← ocR_assocR, ← ocR_comm q u1, ocR_assocL, ← ocR_mul]

/-- The entry product `q_real (p•u1) = (qp)•u1`. -/
theorem ocR_u1_entry (p q : ℚ) : ocR p * (ocR q * u1) = ocR (p*q) * u1 := by
  rw [ocR_assocL, ← ocR_mul]

/-- `u1M P * ocRM Q = u1M (P*Q)`: fold-root-line times central is fold-root-line. -/
theorem u1M_ocRM (P Q : Matrix (Fin 3) (Fin 3) ℚ) : u1M P * ocRM Q = u1M (P * Q) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, u1M_apply, ocRM_apply, Fin.sum_univ_three]
  rw [u1_ocR_entry, u1_ocR_entry, u1_ocR_entry, ← add_mul, ← add_mul, ocR_add, ocR_add]

/-- `ocRM P * u1M Q = u1M (P*Q)`: central times fold-root-line is fold-root-line. -/
theorem ocRM_u1M (P Q : Matrix (Fin 3) (Fin 3) ℚ) : ocRM P * u1M Q = u1M (P * Q) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, u1M_apply, ocRM_apply, Fin.sum_univ_three]
  rw [ocR_u1_entry, ocR_u1_entry, ocR_u1_entry, ← add_mul, ← add_mul, ocR_add, ocR_add]

/-- `u1M P − u1M Q = u1M (P − Q)`. -/
theorem u1M_sub (P Q : Matrix (Fin 3) (Fin 3) ℚ) : u1M P - u1M Q = u1M (P - Q) := by
  apply Matrix.ext; intro i j
  simp only [Matrix.sub_apply, u1M_apply, ocR_sub, sub_mul]

/-- RIGHT-CENTRAL COLLAPSE (generalizing N289 `collapse`, which is both-central): for ARBITRARY `A`
    and CENTRAL `ocRM Q`, the Jordan inner-multiplication commutator collapses to the ordinary
    matrix-commutator endomorphism `innerMul A (ocRM Q) = adE (A * ocRM Q − ocRM Q * A)`. The four
    `jb` products reassociate past the SINGLE central factor (`ocRM_assoc_L/M/R`) and telescope. -/
theorem innerMul_ocRM_right (A : Matrix (Fin 3) (Fin 3) (O ℚ)) (Q : Matrix (Fin 3) (Fin 3) ℚ) :
    innerMul A (ocRM Q) = adE (A * ocRM Q - ocRM Q * A) := by
  apply LinearMap.ext; intro X
  rw [innerMul_apply, adE_apply]
  simp only [jb, mul_add, add_mul, sub_mul, mul_sub]
  rw [ocRM_assoc_L Q X A, ocRM_assoc_R Q A X, ocRM_assoc_M Q A X, ocRM_assoc_M Q X A,
      ocRM_assoc_L Q A X, ocRM_assoc_R Q X A]
  abel

/-! ### The fold-root-dressed slot patterns. -/

/-- The fold-root-dressed `(0,1)`-slot pattern: `slotA u1 = u1M qA`. -/
def qA : Matrix (Fin 3) (Fin 3) ℚ := !![0,1,0; -1,0,0; 0,0,0]
/-- The fold-root-dressed `(0,2)`-slot pattern: `slotB u1 = u1M qB`. -/
def qB : Matrix (Fin 3) (Fin 3) ℚ := !![0,0,1; 0,0,0; -1,0,0]
/-- The fold-root-dressed `(1,2)`-slot pattern: `slotC u1 = u1M qC`. -/
def qC : Matrix (Fin 3) (Fin 3) ℚ := !![0,0,0; 0,0,1; 0,-1,0]

theorem slotA_u1_u1M : slotA u1 = u1M qA := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotA, Xz, u1M, qA, ocR_one, ocR_zero, star_u1, ocR_neg, one_mul, neg_one_mul,
      zero_mul, neg_mul]
theorem slotB_u1_u1M : slotB u1 = u1M qB := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotB, Xz, u1M, qB, ocR_one, ocR_zero, star_u1, ocR_neg, one_mul, neg_one_mul,
      zero_mul, neg_mul]
theorem slotC_u1_u1M : slotC u1 = u1M qC := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotC, Xz, u1M, qC, ocR_one, ocR_zero, star_u1, ocR_neg, one_mul, neg_one_mul,
      zero_mul, neg_mul]

/-- `kAB = innerMul (slotA u1)(slotB 1) = adE (u1M (qA*pB − pB*qA))`: the fold-root-dressed coset
    generator IS a matrix-commutator endomorphism, on the fold-root line. Via the right-central
    collapse (`slotB 1 = ocRM pB` central) + the slot=u1M/ocRM identities. -/
theorem kAB_eq_adE : innerMul (slotA u1) (slotB (1:O ℚ)) = adE (u1M (qA * pB - pB * qA)) := by
  rw [slotB_one_ocRM, innerMul_ocRM_right, slotA_u1_u1M, u1M_ocRM, ocRM_u1M, u1M_sub]
theorem kBC_eq_adE : innerMul (slotB u1) (slotC (1:O ℚ)) = adE (u1M (qB * pC - pC * qB)) := by
  rw [slotC_one_ocRM, innerMul_ocRM_right, slotB_u1_u1M, u1M_ocRM, ocRM_u1M, u1M_sub]
theorem kCA_eq_adE : innerMul (slotC u1) (slotA (1:O ℚ)) = adE (u1M (qC * pA - pA * qC)) := by
  rw [slotA_one_ocRM, innerMul_ocRM_right, slotC_u1_u1M, u1M_ocRM, ocRM_u1M, u1M_sub]

/-! ## R3 — the pure-ℚ structure constants (0/±1 matrix identities, `decide`-closable). -/

/-- The (AB,BC)→famB pure-ℚ structure constant. `(qB*pC−pC*qB)*(qA*pB−pB*qA) − (qA*pB−pB*qA)*
    (qB*pC−pC*qB) = pC*pA − pA*pC` — the famB source (N289 `famB_eq_adE`). -/
theorem q_close_AB_BC :
    (qB * pC - pC * qB) * (qA * pB - pB * qA) - (qA * pB - pB * qA) * (qB * pC - pC * qB)
      = pC * pA - pA * pC := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [qA, qB, qC, pA, pB, pC, Matrix.sub_apply]

/-- The (BC,CA)→famC pure-ℚ structure constant. -/
theorem q_close_BC_CA :
    (qC * pA - pA * qC) * (qB * pC - pC * qB) - (qB * pC - pC * qB) * (qC * pA - pA * qC)
      = pA * pB - pB * pA := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [qA, qB, qC, pA, pB, pC, Matrix.sub_apply]

/-- The (CA,AB)→−famA pure-ℚ structure constant. -/
theorem q_close_CA_AB :
    (qA * pB - pB * qA) * (qC * pA - pA * qC) - (qC * pA - pA * qC) * (qA * pB - pB * qA)
      = - (pB * pC - pC * pB) := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [qA, qB, qC, pA, pB, pC, Matrix.sub_apply]

/-! ## THE CLOSURE — the fold-root-dressed coset closes back into the family. -/

/-- Helper: the bracket of two fold-root-line `adE` generators lands in the CENTRAL family:
    `⁅adE(u1M P), adE(u1M Q)⁆ = adE (ocRM (Q*P − P*Q))`. Combines `adE_bracket_u1` (Lie-hom) with
    `u1M_mul` (the `u1²=−1` product law), so the u1-dressed bracket becomes a real-matrix commutator. -/
theorem adE_u1_bracket_ocRM (P Q : Matrix (Fin 3) (Fin 3) ℚ) :
    ⁅adE (u1M P), adE (u1M Q)⁆ = adE (ocRM (Q * P - P * Q)) := by
  rw [adE_bracket_u1, u1M_mul, u1M_mul, ← ocRM_sub, neg_sub_neg]

/-- ★★★ THE (AB,BC)→famB CLOSURE: `⁅kAB, kBC⁆ = famB`. Via the collapse to fold-root-line commutators
    (`kAB/kBC_eq_adE`), the fold-root Lie-hom + product law (`adE_u1_bracket_ocRM`), the pure-ℚ
    structure constant (`q_close_AB_BC`), and the banked `famB_eq_adE` (N289). NO octonion coordinate
    expansion — the fold-root's own square `u1² = −1` closes the dressed coset into the family. -/
theorem coset_close_AB_BC :
    ⁅innerMul (slotA u1) (slotB (1:O ℚ)), innerMul (slotB u1) (slotC (1:O ℚ))⁆
      = innerMul (slotC (1:O ℚ)) (slotA 1) := by
  rw [kAB_eq_adE, kBC_eq_adE, adE_u1_bracket_ocRM, q_close_AB_BC, famB_eq_adE]

/-- ★★★ THE (BC,CA)→famC CLOSURE: `⁅kBC, kCA⁆ = famC`. -/
theorem coset_close_BC_CA :
    ⁅innerMul (slotB u1) (slotC (1:O ℚ)), innerMul (slotC u1) (slotA (1:O ℚ))⁆
      = innerMul (slotA (1:O ℚ)) (slotB 1) := by
  rw [kBC_eq_adE, kCA_eq_adE, adE_u1_bracket_ocRM, q_close_BC_CA, famC_eq_adE]

/-- `ocRM (-P) = - ocRM P`. -/
theorem ocRM_neg (P : Matrix (Fin 3) (Fin 3) ℚ) : ocRM (-P) = - ocRM P := by
  apply Matrix.ext; intro i j
  simp only [ocRM_apply, Matrix.neg_apply, ocR_neg]

/-- `adE (-K) = - adE K` (the endomorphism `adE` is additive-inverse compatible). -/
theorem adE_neg (K : Matrix (Fin 3) (Fin 3) (O ℚ)) : adE (-K) = - adE K := by
  apply LinearMap.ext; intro X
  simp only [adE_apply, LinearMap.neg_apply, neg_mul, mul_neg]
  abel

/-- ★★★ THE (CA,AB)→−famA CLOSURE: `⁅kCA, kAB⁆ = −famA`. -/
theorem coset_close_CA_AB :
    ⁅innerMul (slotC u1) (slotA (1:O ℚ)), innerMul (slotA u1) (slotB (1:O ℚ))⁆
      = - innerMul (slotB (1:O ℚ)) (slotC 1) := by
  rw [kCA_eq_adE, kAB_eq_adE, adE_u1_bracket_ocRM, q_close_CA_AB, famA_eq_adE, ocRM_neg, adE_neg]

/-! ## THE CAPSTONE — the fold-root-dressed coset closes into the family so(3). -/

/-- ★★★ CAPSTONE — THE su(3)/so(3) SYMMETRIC-PAIR CLOSURE. The three fold-root-dressed
    family-BREAKING coset generators of the derived colour-centralizer `su(3) = Z_{f₄}(colour)`
    inside the fold-forced arena `f₄ = derH3` (N292),
        `kAB = innerMul (slotA u1)(slotB 1)`, `kBC = innerMul (slotB u1)(slotC 1)`,
        `kCA = innerMul (slotC u1)(slotA 1)`,
    CLOSE back into the banked family-so(3) generators (N288/N289):
        `⁅kAB, kBC⁆ = famB`,  `⁅kBC, kCA⁆ = famC`,  `⁅kCA, kAB⁆ = −famA`  (cyclic),
    with the closure genuinely NON-abelian (`famB ≠ 0`, N289). Together the family-so(3) [the maximal
    compact] and this fold-root-dressed coset span the dim-8 simple `su(3)`: the family-breaking is
    the "square-root" of the family so(3), the fold-root's own `u1² = −1` regenerating the real
    family from two dressed breaking directions.

    Also carries `jdef Xwit Ywit ≠ 0` (`jordan_fails_H4`) in the TYPE — the arena is genuine only at
    the cap-forced terminal order 3, NOT carrier-agnostic. -/
theorem coset_symmetric_pair_closure :
    ⁅innerMul (slotA u1) (slotB (1:O ℚ)), innerMul (slotB u1) (slotC (1:O ℚ))⁆
        = innerMul (slotC (1:O ℚ)) (slotA 1)
    ∧ ⁅innerMul (slotB u1) (slotC (1:O ℚ)), innerMul (slotC u1) (slotA (1:O ℚ))⁆
        = innerMul (slotA (1:O ℚ)) (slotB 1)
    ∧ ⁅innerMul (slotC u1) (slotA (1:O ℚ)), innerMul (slotA u1) (slotB (1:O ℚ))⁆
        = - innerMul (slotB (1:O ℚ)) (slotC 1)
    ∧ innerMul (slotC (1:O ℚ)) (slotA 1) ≠ 0
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨coset_close_AB_BC, coset_close_BC_CA, coset_close_CA_AB, famB_ne_zero, jordan_fails_H4⟩

end Phys.Algebra.HJ
