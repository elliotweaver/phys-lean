/- N234 probe 3 — the transport layer:
   qZ (ℤ-matrix → End (O ℚ)), qI (restriction to ImO), bvec basis, qI_apply_bvec,
   Basis.mk, trace_qI, gForm coordinate expansion, adjoint-transpose lemma. -/
import Phys.Algebra.TowerGatherFFTPeirceReduction
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.DerivationStabilizerSplit

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

abbrev M7 := Fin 7 → Fin 7 → ℤ

/-- The coordinate-shuffle endomorphism of an integer 7×7 matrix on the imaginary
    coordinates `c1..c7` (killing `c0`). -/
def qZ (M : M7) : Module.End ℚ (O ℚ) where
  toFun z :=
    ⟨⟨⟨0, (M 0 0 : ℚ) * c1 z + (M 0 1 : ℚ) * c2 z + (M 0 2 : ℚ) * c3 z + (M 0 3 : ℚ) * c4 z + (M 0 4 : ℚ) * c5 z + (M 0 5 : ℚ) * c6 z + (M 0 6 : ℚ) * c7 z⟩,
      ⟨(M 1 0 : ℚ) * c1 z + (M 1 1 : ℚ) * c2 z + (M 1 2 : ℚ) * c3 z + (M 1 3 : ℚ) * c4 z + (M 1 4 : ℚ) * c5 z + (M 1 5 : ℚ) * c6 z + (M 1 6 : ℚ) * c7 z,
       (M 2 0 : ℚ) * c1 z + (M 2 1 : ℚ) * c2 z + (M 2 2 : ℚ) * c3 z + (M 2 3 : ℚ) * c4 z + (M 2 4 : ℚ) * c5 z + (M 2 5 : ℚ) * c6 z + (M 2 6 : ℚ) * c7 z⟩⟩,
     ⟨⟨(M 3 0 : ℚ) * c1 z + (M 3 1 : ℚ) * c2 z + (M 3 2 : ℚ) * c3 z + (M 3 3 : ℚ) * c4 z + (M 3 4 : ℚ) * c5 z + (M 3 5 : ℚ) * c6 z + (M 3 6 : ℚ) * c7 z,
       (M 4 0 : ℚ) * c1 z + (M 4 1 : ℚ) * c2 z + (M 4 2 : ℚ) * c3 z + (M 4 3 : ℚ) * c4 z + (M 4 4 : ℚ) * c5 z + (M 4 5 : ℚ) * c6 z + (M 4 6 : ℚ) * c7 z⟩,
      ⟨(M 5 0 : ℚ) * c1 z + (M 5 1 : ℚ) * c2 z + (M 5 2 : ℚ) * c3 z + (M 5 3 : ℚ) * c4 z + (M 5 4 : ℚ) * c5 z + (M 5 5 : ℚ) * c6 z + (M 5 6 : ℚ) * c7 z,
       (M 6 0 : ℚ) * c1 z + (M 6 1 : ℚ) * c2 z + (M 6 2 : ℚ) * c3 z + (M 6 3 : ℚ) * c4 z + (M 6 4 : ℚ) * c5 z + (M 6 5 : ℚ) * c6 z + (M 6 6 : ℚ) * c7 z⟩⟩⟩
  map_add' a b := by
    ext <;>
      simp only [c1, c2, c3, c4, c5, c6, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;>
      ring
  map_smul' r z := by
    ext <;>
      simp only [c1, c2, c3, c4, c5, c6, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re,
        Dbl.smul_im, RingHom.id_apply] <;>
      ring

/-- `qZ M` output has vanishing real part, hence lands in `ImO`. -/
theorem qZ_mem_ImO (M : M7) (z : O ℚ) : qZ M z ∈ ImO :=
  mem_ImO_of_reQ_zero rfl

/-- The restriction of `qZ M` to the fundamental 7-module. -/
def qI (M : M7) : Module.End ℚ ImO :=
  (qZ M).restrict (fun z _ => qZ_mem_ImO M z)

@[simp] theorem qI_coe (M : M7) (x : ImO) : (qI M x : O ℚ) = qZ M (x : O ℚ) := rfl

/-- Integer matrix product. -/
def mul7 (A B : M7) : M7 := fun i k =>
  A i 0 * B 0 k + A i 1 * B 1 k + A i 2 * B 2 k + A i 3 * B 3 k +
  A i 4 * B 4 k + A i 5 * B 5 k + A i 6 * B 6 k

/-- Composition transports to matrix product. -/
theorem qI_comp (M N : M7) : qI M * qI N = qI (mul7 M N) := by
  apply LinearMap.ext; intro x
  apply Subtype.ext
  show qZ M (qZ N (x : O ℚ)) = qZ (mul7 M N) (x : O ℚ)
  ext <;> simp only [qZ, mul7, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk,
    AddHom.coe_mk, Int.cast_add, Int.cast_mul] <;> ring

def add7 (A B : M7) : M7 := fun i j => A i j + B i j
def sub7 (A B : M7) : M7 := fun i j => A i j - B i j
def smul7 (c : ℤ) (A : M7) : M7 := fun i j => c * A i j

theorem qI_add (M N : M7) : qI (add7 M N) = qI M + qI N := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show qZ (add7 M N) (x : O ℚ) = qZ M (x : O ℚ) + qZ N (x : O ℚ)
  ext <;> simp only [qZ, add7, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk,
    AddHom.coe_mk, Int.cast_add, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring

theorem qI_sub (M N : M7) : qI (sub7 M N) = qI M - qI N := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show qZ (sub7 M N) (x : O ℚ) = qZ M (x : O ℚ) - qZ N (x : O ℚ)
  rw [sub_eq_add_neg]
  ext <;> simp only [qZ, sub7, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk,
    AddHom.coe_mk, Int.cast_sub, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

theorem qI_smul (c : ℤ) (M : M7) : qI (smul7 c M) = (c : ℚ) • qI M := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show qZ (smul7 c M) (x : O ℚ) = (c : ℚ) • qZ M (x : O ℚ)
  ext <;> simp only [qZ, smul7, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk,
    AddHom.coe_mk, Int.cast_mul, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-! ## The ImO basis (from the banked `imBasis`). -/

/-- The banked 7 imaginary units as elements of `ImO`. -/
def bvec (i : Fin 7) : ImO := ⟨imBasis i, imBasis_mem_ImO i⟩

theorem bvec_indep : LinearIndependent ℚ bvec := by
  have h := imBasis_indep
  have : imBasis = fun i => (ImO.subtype) (bvec i) := by funext i; rfl
  rw [this] at h
  exact h.of_comp ImO.subtype

theorem bvec_span : ⊤ ≤ Submodule.span ℚ (Set.range bvec) := by
  intro x _
  have hx : (x : O ℚ) ∈ Submodule.span ℚ (Set.range imBasis) := by
    rw [span_imBasis_eq_ImO]; exact x.2
  have himg : Set.range imBasis = ImO.subtype '' Set.range bvec := by
    ext y; constructor
    · rintro ⟨i, rfl⟩; exact ⟨bvec i, ⟨i, rfl⟩, rfl⟩
    · rintro ⟨b, ⟨i, rfl⟩, rfl⟩; exact ⟨i, rfl⟩
  rw [himg, ← Submodule.map_span] at hx
  obtain ⟨y, hy, hyx⟩ := hx
  have : y = x := Subtype.ext hyx
  rwa [← this]

/-- The 7-element basis of `ImO`. -/
def bb : Module.Basis (Fin 7) ℚ ImO := Module.Basis.mk bvec_indep bvec_span

/-- The 8 coordinate functionals of `O ℚ` as linear maps (c1..c7 on `ImO`). -/
def coordFn (i : Fin 7) : ImO →ₗ[ℚ] ℚ where
  toFun x := ![c1, c2, c3, c4, c5, c6, c7] i (x : O ℚ)
  map_add' a b := by
    fin_cases i <;>
      simp [c1, c2, c3, c4, c5, c6, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im]
  map_smul' r a := by
    fin_cases i <;>
      simp [c1, c2, c3, c4, c5, c6, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]

/-- The coordinate functionals compute the `bb`-representation. -/
theorem repr_eq_coordFn (i : Fin 7) :
    (Finsupp.lapply i).comp (bb.repr : ImO →ₗ[ℚ] (Fin 7 →₀ ℚ)) = coordFn i := by
  apply bb.ext; intro j
  have hb : bb j = bvec j := Module.Basis.mk_apply bvec_indep bvec_span j
  rw [LinearMap.comp_apply, hb]
  have hrepr : bb.repr (bvec j) = Finsupp.single j 1 := by
    rw [← hb]; exact bb.repr_self j
  show Finsupp.lapply i (bb.repr (bvec j)) = coordFn i (bvec j)
  rw [hrepr]
  fin_cases i <;> fin_cases j <;>
    simp [coordFn, Finsupp.single_apply, bvec, imBasis, u1, e2O, e3O, e4O, e5O, e6O, e7O,
      c1, c2, c3, c4, c5, c6, c7]

theorem repr_apply_eq_coordFn (x : ImO) (i : Fin 7) :
    bb.repr x i = coordFn i x := by
  have h := congrArg (fun (f : ImO →ₗ[ℚ] ℚ) => f x) (repr_eq_coordFn i)
  simpa using h

/-- ★ The trace of `qI M` is the integer matrix trace. -/
theorem trace_qI (M : M7) :
    LinearMap.trace ℚ ImO (qI M) = ∑ i : Fin 7, (M i i : ℚ) := by
  classical
  rw [LinearMap.trace_eq_matrix_trace ℚ bb (qI M)]
  have hentry : ∀ i j, LinearMap.toMatrix bb bb (qI M) i j = (M i j : ℚ) := by
    intro i j
    rw [LinearMap.toMatrix_apply, repr_apply_eq_coordFn]
    have hb : bb j = bvec j := Module.Basis.mk_apply bvec_indep bvec_span j
    rw [hb]
    fin_cases i <;> fin_cases j <;>
      simp [coordFn, qZ, bvec, imBasis, u1, e2O, e3O, e4O, e5O, e6O, e7O,
        c1, c2, c3, c4, c5, c6, c7]
  unfold Matrix.trace
  simp only [Matrix.diag]
  exact Finset.sum_congr rfl fun i _ => hentry i i

/-! ## The Born form in coordinates + the adjoint-transpose law. -/

/-- The Born form in coordinates (the composition-norm polarization). -/
theorem gForm_coords (v w : O ℚ) :
    gForm v w = c0 v * c0 w + c1 v * c1 w + c2 v * c2 w + c3 v * c3 w
      + c4 v * c4 w + c5 v * c5 w + c6 v * c6 w + c7 v * c7 w := by
  show reQ (v * star w) = _
  simp only [reQ, c0, c1, c2, c3, c4, c5, c6, c7, CD.mul_re, CD.mul_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im]
  ring

/-- Transpose. -/
def transp (M : M7) : M7 := fun i j => M j i

/-- ★ The adjoint-transpose law for the Born form. -/
theorem qI_adjoint (M : M7) (x y : ImO) :
    bornBil (qI M x) y = bornBil x (qI (transp M) y) := by
  show gForm ((qI M x : O ℚ)) (y : O ℚ) = gForm (x : O ℚ) ((qI (transp M) y : O ℚ))
  rw [qI_coe, qI_coe, gForm_coords, gForm_coords]
  simp only [qZ, transp, c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk]
  ring

end

end Phys.Algebra
