/-
  Phys.Algebra.DerivationRep7IsotypicSchur — N196: THE CANONICAL / MULTIPLICITY-FREE ISOTYPIC
  DECOMPOSITION of the joint `so(4)` bigrading `7 = (3,1) ⊕ (2,2)` — there is NO nonzero
  `su(2)_T`-equivariant linear map carrying either summand into the other (BOTH cross-Hom-spaces
  vanish), so the splitting is FORCED / unique up to the order of the summands, over the DERIVED ℚ
  and the octonion rung `O ℚ = CD (H ℚ)`.

  ===========================================================================
  THE STATE OF THE ARC. N189–N193 banked the THREE actions on the `7` (`ImO`, N22) and the joint
  bigrading `7 = (3,1) ⊕ (2,2)` (N193); N194/N195 banked that BOTH summands are IRREDUCIBLE under
  `so(4)`. The remaining genuinely-NEW question that turns "both irreducible" into a genuine
  Schur/isotypic statement is the INTERTWINER-VANISHING: is there a nonzero `su(2)_T`-equivariant
  linear map between the two summands? The "both irreducible + dim mismatch" route is a mechanical
  juxtaposition with NO new lever (REJECTED at N195, W8); THIS node supplies the genuinely-NEW lever
  and does NOT invoke either summand's irreducibility.

  THE MECHANISM (THE ONE LAW — the trunk's Born positivity / quaternionic DIVISION at the `H` rung).
  The `(2,2) = κO(⊤)` is the LEFT-REGULAR `H ℚ`-module, `su(2)_T` acting by `leftImDeriv Q (κO b) =
  κO (Q·b)` — left-multiplication by an imaginary `Q` (N192). Because `H ℚ` is a DIVISION algebra
  (associative, `hI² = −1`), left-multiplication by `hI` is BIJECTIVE: `hI·b = 0 ⟹ b = 0`
  (`left_mul_hI_eq_zero`, via `(−hI)·(hI·b) = b`) and `hI·((−hI)·c) = c` (`left_mul_hI_surjective`).
  The IMMEDIATE consequence (`kappaTop_no_su2T_fixed`): the `(2,2)` has NO nonzero `su(2)_T`-FIXED
  vector — a `κO b` annihilated by every imaginary `leftImDeriv` has `hI·b = 0`, hence `b = 0`. By
  contrast the `(3,1) = ιO(ImH)` is entirely `su(2)_T`-TRIVIAL (annihilated, N192 `leftImDeriv_iotaO`).
  These two facts FORCE both cross-intertwiners to vanish:
    • `hom_iotaImH_to_kappaTop_eq_zero` (DIRECTION A): an equivariant `f` mapping the `(3,1)` into
      the `(2,2)` sends `ιO a` to a `su(2)_T`-FIXED vector of the `(2,2)` (source trivial), which
      must be `0`.
    • `hom_kappaTop_to_iotaImH_eq_zero` (DIRECTION B): an equivariant `f` mapping the `(2,2)` into
      the `(3,1)` has `f(κO(hI·b)) = leftImDeriv hI (f(κO b)) = 0` (target annihilated by N192);
      `L_hI` surjective ⟹ `f(κO c) = 0` for all `c`.
  Packaged: `isotypic_decomposition_canonical` — any `su(2)_T`-equivariant operator carrying each
  summand into the OTHER vanishes on both. The SAME quaternionic division survival (Born positivity)
  that stops the cascade at the octonions forbids any intertwiner mixing the two summands; the
  decomposition `7 = (3,1) ⊕ (2,2)` is canonical / multiplicity-free.

  W8 NON-VACUITY. `kappaO_one_not_su2T_fixed` + `w8_coord`: the `(2,2)` singlet element `κO 1` is
  GENUINELY moved by `su(2)_T` (`leftImDeriv hI (κO 1) = κO hI ≠ 0`, deep coordinate `= 1`), so the
  "no nonzero fixed vector" dichotomy has teeth (the module is not pointwise-fixed); and
  `iotaO_hJ_ne_zero` exhibits a NONZERO element of the `(3,1)` forced to `0` by any equivariant
  cross-map (Direction A kills a genuinely nonzero vector, not a vacuous one).

  THE MOAT (docs/STANDARD §0). The division-algebra-physics field reads the multiplicity-free /
  Schur structure off `so(4) ≅ su(2)×su(2)` rep theory by hand; here the intertwiner-vanishing is
  FORCED by the trunk's quaternionic division (Born = self-overlap = positivity = division survival)
  at the `H` rung — the SAME cause that stops the cascade — NOT a posited rep theory, NOT a
  mechanical juxtaposition of N194/N195 (neither irreducibility is used), NOT a re-pin. Over a field
  where `H` fails to be a division algebra the left-regular module acquires fixed vectors and the
  argument fails — a DIVISION fact, not base associativity.

  Physics-words-removable (STANDARD §2): delete "colour/isospin/7/g₂/su(2)/so(3)/so(4)/singlet/
  adjoint/branching/bigrading/rep/gauge/irreducible/isotypic/Schur/multiplicity" → over the derived
  field ℚ and the Cayley–Dickson double `O ℚ = CD (H ℚ)`, left-multiplication by the
  conjugation-antifixed unit `hI` on `H ℚ` is bijective, so the second-slot image `κO(⊤)` has no
  nonzero vector annihilated by every imaginary `leftImDeriv`; consequently any ℚ-linear `f` of
  `O ℚ` intertwining the family `leftImDeriv Q` and carrying the first-slot image `ιO(ImH)` into the
  second-slot image (or vice versa) vanishes on it. No theorem statement needs a physics word.

  DERIVED from the trunk: N192 `leftImDeriv`/`leftImDeriv_iotaO`/`leftImDeriv_kappaO`; N190/N189
  `iotaO`/`iotaO_apply`/`iotaO_injective`/`kappaO`/`kappaO_apply`/`kappaO_injective`; N184 `hI` +
  `star hI = −hI`; `H_associative`/`mul_assoc` (Quaternion); `Module.End`/`LinearMap` MACHINERY on
  the DERIVED objects (STANDARD §3). NOT a posited `su(2)/so(3)/so(4)/g₂/Lie-group/rep/division-ring`
  as content, NOT Mathlib ℝ/ℂ as content, NOT a bridge.
-/
import Phys.Algebra.DerivationRep7SU2TBranching
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

/-! ## Quaternionic division at the `H` rung: left-multiplication by `hI` is bijective. -/

/-- `hI · hI = −1` (a coordinate identity on `H ℚ = CD (Dbl ℚ)`). -/
theorem hI_mul_hI : (hI : H ℚ) * hI = -1 := by
  ext <;> simp [hI, CD.iota, Dbl.J]

/-- ★ LEFT-MULTIPLICATION BY `hI` IS INJECTIVE: `hI · b = 0 ⟹ b = 0`. The trunk's quaternionic
    DIVISION at the `H` rung — `H ℚ` is associative with `hI² = −1`, so `(−hI)·(hI·b) = b`. -/
theorem left_mul_hI_eq_zero {b : H ℚ} (h : (hI : H ℚ) * b = 0) : b = 0 := by
  have hb : (-hI : H ℚ) * (hI * b) = b := by
    rw [← mul_assoc]
    have h1 : (-hI : H ℚ) * hI = 1 := by rw [neg_mul, hI_mul_hI, neg_neg]
    rw [h1, one_mul]
  rw [h, mul_zero] at hb
  exact hb.symm

/-- ★ LEFT-MULTIPLICATION BY `hI` IS SURJECTIVE: every `c = hI · ((−hI)·c)`. -/
theorem left_mul_hI_surjective (c : H ℚ) : (hI : H ℚ) * ((-hI) * c) = c := by
  rw [← mul_assoc]
  have h1 : (hI : H ℚ) * (-hI) = 1 := by rw [mul_neg, hI_mul_hI, neg_neg]
  rw [h1, one_mul]

/-! ## The `(2,2) = κO(⊤)` has no nonzero `su(2)_T`-fixed vector. -/

/-- ★★ THE `(2,2)` HAS NO NONZERO `su(2)_T`-FIXED VECTOR: a `κO b` annihilated by every imaginary
    `leftImDeriv Q` is zero. The left-regular `H ℚ`-module is fixed-point-free under imaginary
    left-multiplication BECAUSE `H ℚ` is a DIVISION algebra (`L_hI` injective). -/
theorem kappaTop_no_su2T_fixed (b : H ℚ)
    (hfix : ∀ (Q : H ℚ), star Q = -Q → leftImDeriv Q (kappaO b) = 0) :
    kappaO b = 0 := by
  have hImem : star (hI : H ℚ) = -hI := by rw [hI]; ext <;> simp [CD.iota, Dbl.J]
  have h := hfix hI hImem
  rw [leftImDeriv_kappaO] at h
  have hb : (hI : H ℚ) * b = 0 := kappaO_injective (by rw [h, map_zero])
  rw [left_mul_hI_eq_zero hb, map_zero]

/-! ## Both cross-intertwiners vanish — the canonical / multiplicity-free decomposition. -/

/-- ★★ DIRECTION A — NO `(3,1) → (2,2)` CROSS-MAP: any `su(2)_T`-equivariant `f` carrying the
    `(3,1) = ιO(ImH)` into the `(2,2) = κO(⊤)` vanishes on the `(3,1)`. `f(ιO a)` is `su(2)_T`-FIXED
    (the source `(3,1)` is `su(2)_T`-trivial, N192 `leftImDeriv_iotaO`) and lands in the `(2,2)`,
    which has no nonzero fixed vector (`kappaTop_no_su2T_fixed`). -/
theorem hom_iotaImH_to_kappaTop_eq_zero (f : O ℚ →ₗ[ℚ] O ℚ)
    (hf : ∀ (Q : H ℚ), star Q = -Q → ∀ x, f (leftImDeriv Q x) = leftImDeriv Q (f x))
    (hmaps : ∀ a : H ℚ, ∃ b : H ℚ, f (iotaO a) = kappaO b) (a : H ℚ) :
    f (iotaO a) = 0 := by
  obtain ⟨b, hb⟩ := hmaps a
  rw [hb]
  apply kappaTop_no_su2T_fixed
  intro Q hQ
  rw [← hb, ← hf Q hQ, leftImDeriv_iotaO, map_zero]

/-- ★★ DIRECTION B — NO `(2,2) → (3,1)` CROSS-MAP: any `su(2)_T`-equivariant `f` carrying the
    `(2,2) = κO(⊤)` into the `(3,1) = ιO(ImH)` vanishes on the `(2,2)`. `leftImDeriv hI` annihilates
    the `(3,1)` (N192 `leftImDeriv_iotaO`), so `f(κO(hI·b)) = leftImDeriv hI (f(κO b)) = 0`; with
    `L_hI` surjective (`left_mul_hI_surjective`) this gives `f(κO c) = 0` for every `c`. -/
theorem hom_kappaTop_to_iotaImH_eq_zero (f : O ℚ →ₗ[ℚ] O ℚ)
    (hf : ∀ (Q : H ℚ), star Q = -Q → ∀ x, f (leftImDeriv Q x) = leftImDeriv Q (f x))
    (hmaps : ∀ b : H ℚ, ∃ a : H ℚ, f (kappaO b) = iotaO a) (c : H ℚ) :
    f (kappaO c) = 0 := by
  have hImem : star (hI : H ℚ) = -hI := by rw [hI]; ext <;> simp [CD.iota, Dbl.J]
  have key : ∀ b : H ℚ, f (kappaO ((hI : H ℚ) * b)) = 0 := by
    intro b
    have h1 : f (leftImDeriv hI (kappaO b)) = leftImDeriv hI (f (kappaO b)) := hf hI hImem _
    rw [leftImDeriv_kappaO] at h1
    obtain ⟨a, ha⟩ := hmaps b
    rw [ha, leftImDeriv_iotaO] at h1
    exact h1
  have hc := key ((-hI) * c)
  rwa [left_mul_hI_surjective] at hc

/-- ★★★ THE CANONICAL / MULTIPLICITY-FREE ISOTYPIC DECOMPOSITION: there is NO nonzero
    `su(2)_T`-equivariant "off-diagonal" operator on the `7` — any `su(2)_T`-equivariant `f`
    carrying EACH summand of `7 = (3,1) ⊕ (2,2)` into the OTHER vanishes on both. So the splitting
    into the `(3,1)` and the `(2,2)` carries no intertwiner mixing the two pieces: the decomposition
    is canonical / unique up to the order of summands (multiplicity-free). The SAME quaternionic
    division survival (Born positivity) that stops the cascade forbids the cross-maps. -/
theorem isotypic_decomposition_canonical (f : O ℚ →ₗ[ℚ] O ℚ)
    (hf : ∀ (Q : H ℚ), star Q = -Q → ∀ x, f (leftImDeriv Q x) = leftImDeriv Q (f x))
    (hcross31 : ∀ a : H ℚ, ∃ b : H ℚ, f (iotaO a) = kappaO b)
    (hcross22 : ∀ b : H ℚ, ∃ a : H ℚ, f (kappaO b) = iotaO a) :
    (∀ a : H ℚ, f (iotaO a) = 0) ∧ (∀ b : H ℚ, f (kappaO b) = 0) :=
  ⟨hom_iotaImH_to_kappaTop_eq_zero f hf hcross31,
   hom_kappaTop_to_iotaImH_eq_zero f hf hcross22⟩

/-! ## W8 — non-vacuity: the dichotomy and the cross-vanishing have teeth. -/

/-- ★ W8: the `(2,2)` singlet element `κO 1` is NOT `su(2)_T`-fixed —
    `leftImDeriv hI (κO 1) = κO hI ≠ 0`. So `kappaTop_no_su2T_fixed`'s "no nonzero fixed vector"
    dichotomy is non-vacuous: the module is genuinely MOVED by `su(2)_T`, not pointwise-fixed. -/
theorem kappaO_one_not_su2T_fixed :
    ¬ (∀ (Q : H ℚ), star Q = -Q → leftImDeriv Q (kappaO (1 : H ℚ)) = 0) := by
  intro h
  have hImem : star (hI : H ℚ) = -hI := by rw [hI]; ext <;> simp [CD.iota, Dbl.J]
  have hz := h hI hImem
  rw [leftImDeriv_kappaO, mul_one] at hz
  have hI0 : (hI : H ℚ) = 0 := kappaO_injective (by rw [hz, map_zero])
  have hcoord := congrArg (fun z : H ℚ => z.re.im) hI0
  simp [hI, CD.iota, Dbl.J] at hcoord

/-- ★ W8 witness coordinate: `leftImDeriv hI (κO 1) = κO hI` has nonzero deep coordinate `= 1`. -/
theorem w8_coord : (leftImDeriv (hI : H ℚ) (kappaO 1)).im.re.im = 1 := by
  rw [leftImDeriv_kappaO, mul_one]
  simp [kappaO, hI, CD.iota, Dbl.J]

/-- ★ W8: a NONZERO element of the `(3,1)` (`ιO hJ ≠ 0`, since `ιO` is injective and `hJ ≠ 0`) is
    what Direction A forces to `0` — the cross-vanishing kills a genuinely nonzero vector. -/
theorem iotaO_hJ_ne_zero : iotaO (hJ : H ℚ) ≠ 0 := by
  intro h
  have hJ0 : (hJ : H ℚ) = 0 := iotaO_injective (by rw [h, map_zero])
  have hcoord := congrArg (fun z : H ℚ => z.im.re) hJ0
  simp [hJ, CD.e2] at hcoord

end Phys.Algebra
