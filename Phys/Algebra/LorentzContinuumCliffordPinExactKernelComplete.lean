/-
  Phys.Algebra.LorentzContinuumCliffordPinExactKernelComplete — N150 (THE GLOBAL LEMMA Z and
  the FULL EXACT KERNEL): an element of the Clifford algebra `CliffC = CliffordAlgebra QvCQuad`
  killed by EVERY polar-dual interior product is a SCALAR `algebraMap μ` — and hence the exact
  kernel of the unit-normalized Pin double cover is `{1, -1}`.

  Over the derived ℝ `Cut`, the spacetime `STVC = Cut × Cut × O Cut`, the indefinite Minkowski
  form `BvC`, the Clifford algebra `CliffC`, the exterior algebra `ExteriorAlgebra Cut STVC`.
  ===========================================================================
  CONTEXT — THE LAST LINK OF THE EXACT KERNEL `MonoidHom.mker coverMapPinUnit = {1, -1}`.

  N148 (the centralizer dissolution core) banked the CONDITIONAL ASSEMBLY
  `coverMapPinUnit_exactKernel_of_contractScalar`, whose ONE remaining hypothesis `hZ` is the
  GLOBAL LEMMA Z: every `x : CliffC` killed by every `contractLeft (polarBilin QvCQuad v)` is a
  scalar. N149 (the nondegeneracy keystone) banked `polarBilin_separating` — the SEPARATING
  property of the polar-dual family — the precise nondegeneracy datum the global degree argument
  consumes. This file DISCHARGES `hZ` and so CLOSES the full exact kernel.

  THE STRUCTURAL ROUTE (reframe through the trunk — NOT a 2^10 coordinate brute):
  • Piece 1 — DUAL SURJECTIVITY: `polarBilin QvCQuad` is injective (`polarBilin_separating`
    + polar symmetry), hence surjective onto `Module.Dual Cut STVC` (equal finrank). So the
    polar-dual family is ALL of the dual space.
  • Piece 2 — CONTRACTION-UNIVERSAL: x killed by all `contractLeft (polarBilin v)` ⟹ x killed
    by all `contractLeft d` (Piece 1 surjectivity).
  • Piece 3 — TRANSPORT to the exterior algebra: `equivExterior` (char ≠ 2, `Invertible 2` over
    `Cut`) intertwines the Clifford contraction with the exterior contraction
    (`changeForm_contractLeft`) and fixes scalars (`changeForm_algebraMap`).
  • Piece 4 — THE EXTERIOR NUMBER OPERATOR: `N = Σᵢ ι(eᵢ)· ∘ contractLeft(eⁱ)` over the chosen
    10-dim basis (NOT 2^10 monomials). Its Leibniz rule `N(ι w · x) − ι w · N x = ι w · x`
    (the per-basis super-commutator summed against basis completeness) gives the GRADE EIGENVALUE
    `N = n` on `⋀ⁿ`. An element killed by all contractions has `N y = 0`, so every grade-`n`
    component with `n ≥ 1` vanishes (char 0 / ordered field `Cut`), leaving the grade-0 = scalar
    part. THIS is the structural degree argument that dissolves the W9 risk.
  • Piece 5 — ASSEMBLY: Lemma Z, then `mker coverMapPinUnit = {1, -1}` (Lemma Z + N148 ⊆ +
    N146 ⊇).

  STANDARD. DERIVED from the banked chain (N49–N149) + the derived ℝ `ContinuumQ.Cut` + the
  terminal algebra `O Cut` + `STVC` + `BvC` + `CliffC` + the cover/Pin family (N134–N148) + the
  nondegeneracy keystone (N149). Foundations-only. `QuadraticMap` / `contractLeft` /
  `equivExterior` / `ExteriorAlgebra` / `Module.Dual` are MACHINERY operating on the DERIVED
  form `QvCQuad` over the DERIVED field `Cut`; no Mathlib ℝ/ℂ as content. No posited grading,
  no posited centralizer, no posited kernel, no bridge.

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (Clifford / Pin / Spin / cover / spinor /
  Minkowski / metric / nondegeneracy / separating / interior-product / contraction / scalar /
  grade / degree / exterior / exact-kernel / kernel / isometry / Lorentz): the statements stand
  as pure algebra over the derived field `Cut` — the polar bilinear of the quadratic form
  `QvCQuad` on `STVC = Cut × Cut × O Cut` is a bijection onto the dual; an element of
  `CliffordAlgebra QvCQuad` annihilated by every interior product is in the range of
  `algebraMap`; and the units `u` with `(u : CliffCˣ) ∈ {1, -1}` are exactly those in
  `MonoidHom.mker coverMapPinUnit`.
-/
import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction
import Mathlib.LinearAlgebra.Dual.Basis
import Mathlib.LinearAlgebra.ExteriorAlgebra.Grading

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## Piece 1 — DUAL SURJECTIVITY (consumes N149 `polarBilin_separating`). -/

/-- The polar bilinear map `STVC →ₗ Module.Dual Cut STVC` is INJECTIVE: a vector whose polar
    pairing with everything vanishes is `0` (`polarBilin_separating` + polar symmetry). -/
theorem polarBilin_injective : Function.Injective (QuadraticMap.polarBilin QvCQuad) := by
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro v hv
  apply polarBilin_separating v
  intro u
  have : QuadraticMap.polarBilin QvCQuad v u = 0 := by rw [hv]; rfl
  rw [QuadraticMap.polarBilin_apply_apply, QuadraticMap.polar_comm,
      ← QuadraticMap.polarBilin_apply_apply] at this
  exact this

/-- The polar bilinear map is SURJECTIVE onto `Module.Dual Cut STVC`: injective on a finite
    dimensional space of equal dimension to its dual. The polar-dual family is ALL of the dual. -/
theorem polarBilin_surjective : Function.Surjective (QuadraticMap.polarBilin QvCQuad) := by
  have hdim : Module.finrank Cut STVC = Module.finrank Cut (Module.Dual Cut STVC) :=
    (Subspace.dual_finrank_eq).symm
  exact (LinearMap.injective_iff_surjective_of_finrank_eq_finrank hdim).mp polarBilin_injective

/-! ## Piece 2 — CONTRACTION-UNIVERSAL. -/

/-- An element killed by every polar-dual interior product is killed by EVERY interior product
    (Piece 1 surjectivity: every dual functional is `polarBilin QvCQuad v` for some `v`). -/
theorem contract_all_of_polar {x : CliffC}
    (h : ∀ v : STVC, CliffordAlgebra.contractLeft (QuadraticMap.polarBilin QvCQuad v) x = 0) :
    ∀ d : Module.Dual Cut STVC, CliffordAlgebra.contractLeft d x = 0 := by
  intro d
  obtain ⟨v, hv⟩ := polarBilin_surjective d
  rw [← hv]; exact h v

/-! ## Piece 4 — THE EXTERIOR NUMBER OPERATOR and its grade eigenvalue. -/

/-- The exterior algebra of `STVC` over the derived field `Cut`. -/
abbrev EXT := ExteriorAlgebra Cut STVC
/-- The index set of a chosen basis of `STVC`. -/
abbrev IdxN := Module.Free.ChooseBasisIndex Cut STVC
/-- A chosen basis of `STVC`. -/
noncomputable abbrev bST : Module.Basis IdxN Cut STVC := Module.Free.chooseBasis Cut STVC

local notation "ιe" => ExteriorAlgebra.ι (R := Cut)
local notation "ctr" => CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm Cut STVC))

/-- The exterior generators anticommute (`polar 0 = 0`). -/
theorem ext_anticomm (a c : STVC) :
    ιe a * ιe c = - (ιe c * ιe a) := by
  have h := CliffordAlgebra.ι_mul_ι_add_swap (Q := (0 : QuadraticForm Cut STVC)) a c
  rw [QuadraticMap.polar] at h
  simp only [map_sub] at h
  have h0 : ExteriorAlgebra.ι (R := Cut) (M := STVC) a * ExteriorAlgebra.ι (R := Cut) (M := STVC) c
      + ExteriorAlgebra.ι (R := Cut) (M := STVC) c * ExteriorAlgebra.ι (R := Cut) (M := STVC) a = 0 := by
    rw [h]; simp
  exact eq_neg_of_add_eq_zero_left h0

/-- THE PER-BASIS SUPER-COMMUTATOR: the building block of the number operator's Leibniz rule. -/
theorem per_i_comm (i : IdxN) (w : STVC) (x : EXT) :
    ιe (bST i) * (ctr (bST.dualBasis i) (ιe w * x))
      - ιe w * (ιe (bST i) * (ctr (bST.dualBasis i) x))
      = (bST.dualBasis i w) • (ιe (bST i) * x) := by
  rw [CliffordAlgebra.contractLeft_ι_mul]
  rw [mul_sub, mul_smul_comm]
  have hswap : ιe (bST i) * (ιe w * (ctr (bST.dualBasis i) x))
        = - (ιe w * (ιe (bST i) * (ctr (bST.dualBasis i) x))) := by
    apply eq_neg_of_add_eq_zero_left
    rw [← mul_assoc, ← mul_assoc, ← add_mul]
    have hsum : ιe (bST i) * ιe w + ιe w * ιe (bST i) = 0 := by
      have h := ext_anticomm (bST i) w
      rw [h]; abel
    rw [hsum, zero_mul]
  rw [hswap, sub_neg_eq_add]
  abel

/-- THE NUMBER OPERATOR `N = Σᵢ ι(eᵢ)·∘ contractLeft(eⁱ)` over the chosen basis. -/
noncomputable def numOp : EXT →ₗ[Cut] EXT :=
  ∑ i : IdxN, (LinearMap.mulLeft Cut (ιe (bST i))).comp (ctr (bST.dualBasis i))

theorem numOp_apply (x : EXT) :
    numOp x = ∑ i : IdxN, ιe (bST i) * (ctr (bST.dualBasis i) x) := by
  simp only [numOp, LinearMap.coe_sum, Finset.sum_apply, LinearMap.comp_apply,
    LinearMap.mulLeft_apply]

/-- Basis completeness in vector form: `Σᵢ (eⁱ w) • eᵢ = w`. -/
theorem basis_complete (w : STVC) : (∑ i : IdxN, (bST.dualBasis i w) • bST i) = w := by
  conv_rhs => rw [← bST.sum_repr w]
  apply Finset.sum_congr rfl
  intro i _
  rw [bST.dualBasis_apply]

/-- The number operator kills scalars. -/
theorem numOp_algebraMap (r : Cut) : numOp (algebraMap Cut EXT r) = 0 := by
  rw [numOp_apply]
  apply Finset.sum_eq_zero
  intro i _
  rw [CliffordAlgebra.contractLeft_algebraMap, mul_zero]

/-- THE LEIBNIZ RULE for the number operator: `N(ι w · x) − ι w · N x = ι w · x`. -/
theorem numOp_comm_iota (w : STVC) (x : EXT) :
    numOp (ιe w * x) - ιe w * numOp x = ιe w * x := by
  rw [numOp_apply, numOp_apply, Finset.mul_sum, ← Finset.sum_sub_distrib]
  rw [Finset.sum_congr rfl (fun i _ => per_i_comm i w x)]
  rw [show (∑ i : IdxN, (bST.dualBasis i w) • (ιe (bST i) * x))
        = ιe (∑ i : IdxN, (bST.dualBasis i w) • bST i) * x from by
        rw [map_sum, Finset.sum_mul]
        apply Finset.sum_congr rfl
        intro i _
        rw [map_smul, smul_mul_assoc]]
  rw [basis_complete]

/-- THE GRADE EIGENVALUE: on `⋀ⁿ` (= `range(ι)^n`), `N` acts as multiplication by `n`. -/
theorem numOp_eigen (n : ℕ) (x : EXT)
    (hx : x ∈ (ExteriorAlgebra.ι (R := Cut) (M := STVC)).range ^ n) :
    numOp x = (n : Cut) • x := by
  induction hx using Submodule.pow_induction_on_left' with
  | algebraMap r =>
      simp only [Nat.cast_zero, zero_smul]
      exact numOp_algebraMap r
  | add i x y _ _ hx hy =>
      rw [map_add, hx, hy, smul_add]
  | mem_mul m hm i x hx ih =>
      obtain ⟨w, rfl⟩ := hm
      have hc := numOp_comm_iota w x
      rw [sub_eq_iff_eq_add] at hc
      rw [hc, ih, Nat.cast_succ, add_smul, one_smul]
      rw [mul_smul_comm]
      abel

/-! ## The grade-0 extraction: `N y = 0 ⟹ y` is a scalar. -/

/-- The graded family `n ↦ ⋀ⁿ STVC` (definitionally the powers of `range ι`). -/
abbrev grF : ℕ → Submodule Cut EXT := fun i => ⋀[Cut]^i STVC

/-- The homogeneous-component-`j` projection, as a linear map. -/
noncomputable def prjLM (j : ℕ) : EXT →ₗ[Cut] EXT :=
  (grF j).subtype.comp
    ((DirectSum.component Cut ℕ (fun i => (grF i : Submodule Cut EXT)) j).comp
      (DirectSum.decomposeLinearEquiv grF).toLinearMap)

theorem prjLM_apply (j : ℕ) (x : EXT) :
    prjLM j x = ((DirectSum.decompose grF x j : grF j) : EXT) := rfl

theorem prjLM_homog_ne {n j : ℕ} {x : EXT} (hx : x ∈ grF n) (hnj : n ≠ j) :
    prjLM j x = 0 := by
  rw [prjLM_apply]
  exact DirectSum.decompose_of_mem_ne grF hx hnj

/-- THE EIGEN-PROJECTION IDENTITY: `prjⱼ (N x) = j • prjⱼ x` for all `x`. -/
theorem prjLM_numOp (j : ℕ) (x : EXT) :
    prjLM j (numOp x) = (j : Cut) • prjLM j x := by
  induction x using DirectSum.Decomposition.inductionOn grF with
  | zero => simp
  | @homogeneous i m =>
      have hmem : (m : EXT) ∈ grF i := m.2
      have heig : numOp (m : EXT) = (i : Cut) • (m : EXT) := numOp_eigen i _ hmem
      rw [heig, map_smul]
      rcases eq_or_ne i j with h | h
      · subst h; rfl
      · rw [prjLM_homog_ne hmem h, smul_zero, smul_zero]
  | add x y hx hy =>
      rw [map_add, map_add, hx, hy, map_add, smul_add]

/-- THE EXTERIOR LEMMA Z′: an exterior element killed by every interior product is a scalar.
    `N y = 0`, so every grade-`n` (`n ≥ 1`) component vanishes (the ordered field `Cut` has
    `(n : Cut) > 0`), leaving the grade-0 = scalar part. -/
theorem exterior_lemmaZ (y : EXT)
    (hy : ∀ d : Module.Dual Cut STVC, ctr d y = 0) :
    ∃ mu : Cut, y = algebraMap Cut EXT mu := by
  classical
  -- N y = 0
  have hNy : numOp y = 0 := by
    rw [numOp_apply]
    apply Finset.sum_eq_zero
    intro i _
    rw [hy (bST.dualBasis i), mul_zero]
  -- every grade-j (j ≥ 1) component vanishes
  have hcj : ∀ j : ℕ, j ≠ 0 → prjLM j y = 0 := by
    intro j hj
    have key : (j : Cut) • prjLM j y = 0 := by
      rw [← prjLM_numOp, hNy, map_zero]
    have hjpos : (0 : Cut) < (j : Cut) := by
      exact_mod_cast Nat.pos_of_ne_zero hj
    exact (smul_eq_zero.mp key).resolve_left (ne_of_gt hjpos)
  -- so y lies in grade-0: every component of its decomposition lands in grF 0
  have hsum := DirectSum.sum_support_decompose grF y
  have hmemAll : ∀ i ∈ (DirectSum.decompose grF y).support,
      ((DirectSum.decompose grF y i : grF i) : EXT) ∈ grF 0 := by
    intro i _
    rcases eq_or_ne i 0 with rfl | hi
    · exact (DirectSum.decompose grF y 0).2
    · have h0 : prjLM i y = 0 := hcj i hi
      rw [prjLM_apply] at h0
      rw [h0]
      exact Submodule.zero_mem _
  have hy0mem : y ∈ grF 0 := by
    rw [← hsum]
    exact Submodule.sum_mem _ hmemAll
  -- grF 0 = ⋀⁰ = range^0 = 1 = scalars
  have h10 : grF 0 = (1 : Submodule Cut EXT) := pow_zero _
  rw [h10] at hy0mem
  obtain ⟨mu, hmu⟩ := Submodule.mem_one.mp hy0mem
  exact ⟨mu, hmu.symm⟩

/-! ## Piece 3 — TRANSPORT and the CliffC Lemma Z. -/

/-- The linear equivalence `CliffC ≃ₗ ExteriorAlgebra Cut STVC` (char ≠ 2). -/
noncomputable abbrev clf2ext : CliffC ≃ₗ[Cut] EXT :=
  CliffordAlgebra.equivExterior QvCQuad

/-- The equivalence intertwines the Clifford contraction with the exterior contraction. -/
theorem clf2ext_contractLeft (d : Module.Dual Cut STVC) (x : CliffC) :
    clf2ext (CliffordAlgebra.contractLeft d x) = ctr d (clf2ext x) :=
  CliffordAlgebra.changeForm_contractLeft
    (Q := QvCQuad) (Q' := (0 : QuadraticForm Cut STVC))
    (B := QuadraticMap.associated (-QvCQuad)) CliffordAlgebra.changeForm.associated_neg_proof d x

/-- The inverse equivalence sends an exterior scalar back to a Clifford scalar. -/
theorem clf2ext_symm_algebraMap (mu : Cut) :
    clf2ext.symm (algebraMap Cut EXT mu) = algebraMap Cut CliffC mu := by
  rw [LinearEquiv.symm_apply_eq]
  simp only [clf2ext, CliffordAlgebra.equivExterior, CliffordAlgebra.changeFormEquiv_apply]
  rw [CliffordAlgebra.changeForm_algebraMap]

/-- ★★ THE GLOBAL LEMMA Z — an element of `CliffC` killed by every polar-dual interior product
    is a scalar. Discharges `hZ` of N148's `coverMapPinUnit_exactKernel_of_contractScalar`. -/
theorem lemmaZ (x : CliffC)
    (h : ∀ v : STVC, CliffordAlgebra.contractLeft (QuadraticMap.polarBilin QvCQuad v) x = 0) :
    ∃ mu : Cut, x = algebraMap Cut CliffC mu := by
  have hall : ∀ d : Module.Dual Cut STVC, CliffordAlgebra.contractLeft d x = 0 :=
    contract_all_of_polar h
  -- transport to EXT
  have hy : ∀ d : Module.Dual Cut STVC, ctr d (clf2ext x) = 0 := by
    intro d
    rw [← clf2ext_contractLeft, hall d, map_zero]
  obtain ⟨mu, hmu⟩ := exterior_lemmaZ (clf2ext x) hy
  refine ⟨mu, ?_⟩
  have : clf2ext.symm (clf2ext x) = clf2ext.symm (algebraMap Cut EXT mu) := by rw [hmu]
  rw [LinearEquiv.symm_apply_apply, clf2ext_symm_algebraMap] at this
  exact this

/-! ## Piece 5 — THE FULL EXACT KERNEL. -/

/-- ★★ THE EXACT KERNEL of the unit-normalized Pin double cover: `mker coverMapPinUnit = {1,-1}`.
    A kernel element is `±1`, and both `1` and `-1` lie in the kernel. The `⊆` direction is
    N148's conditional assembly with `hZ` discharged by `lemmaZ`; the `⊇` direction is the
    trivial `1` and N146's `negOne_mem_mker_coverMapPinUnit`. -/
theorem coverMapPinUnit_mker_eq (u : PinUnitSub) :
    u ∈ MonoidHom.mker coverMapPinUnit ↔ (u : CliffCˣ) = 1 ∨ (u : CliffCˣ) = -1 := by
  constructor
  · intro hu
    exact coverMapPinUnit_exactKernel_of_contractScalar lemmaZ u hu
  · rintro (h | h)
    · have hu1 : u = 1 := by
        apply Subtype.ext
        simpa using h
      rw [hu1]; exact Submonoid.one_mem _
    · have hum : u = (⟨(-1 : CliffCˣ), negOne_mem_pinUnitSub⟩ : PinUnitSub) := by
        apply Subtype.ext
        simpa using h
      rw [hum]; exact negOne_mem_mker_coverMapPinUnit

end

end Phys.Algebra
