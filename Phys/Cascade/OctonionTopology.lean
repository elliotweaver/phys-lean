/-
  # N41b — THE TOPOLOGICAL *-ALGEBRA STRUCTURE on `O Cut` over the DERIVED ℝ (increment 11, part b).

  N41a (`Phys/Algebra/DerivationLeibnizPow.lean`) banked the PURE-ALGEBRA core of the exponential
  flow's product-preservation: for a Leibniz derivation `D` of the non-associative `CD (CD B)`,
  `Dⁿ(x·y) = ∑_{k+l=n} C(n,k)•(Dᵏx · Dˡy)` (the iterated Leibniz binomial). N40 banked the GROUP LAW
  of the MATRIX exponential `expMap D = ∑' n, expTerm D n` over `Matrix (Fin 8) (Fin 8) Cut`.

  The remaining halves of N41 — the LITERAL `O Cut` algebra-automorphism `exp(D)(xy)=exp(D)(x)·exp(D)(y)`
  (the analytic integration: pass the per-`n` iterated-Leibniz identity to the `tsum` limit by the
  Cauchy product over the topological ring `O Cut`) and the derivative `d/dt exp(tD)|₀=D` — both rest
  on a TOPOLOGICAL-VECTOR-ALGEBRA structure on the 8-dimensional non-associative octonion algebra
  `O Cut` that is NOT yet banked. THIS file banks exactly that foundational rung: the complete
  topological `*`-algebra structure on `O Cut` (and on the `Dbl Cut`/`H Cut` layers it rests on),
  built ENTIRELY by transfer from the banked structure on the derived ℝ `ContinuumQ.Cut`.

  ★ THE ROUTE (the trunk, no Mathlib ℝ as content). `Cut` (N33–N37) is a complete uniform
  topological ring: `UniformSpace Cut`, `CompleteSpace Cut`, `IsTopologicalRing Cut`, `T2Space Cut`,
  `T3Space Cut`. The Cayley–Dickson double `CD A` and the rung-1 double `Dbl R` are, as TYPES, the
  pair `A × A` / `R × R`. We give each the COMPLETELY INDUCED uniform structure pulled back along the
  pair projection `toProd : CD A → A × A` (resp. `Dbl R → R × R`):

      instUnif := UniformSpace.comap toProd inferInstance

  The induced topology equals the order-pullback topology by `rfl` (NO topology/uniformity diamond),
  and EVERYTHING transfers structurally:
    • `CompleteSpace`  — `toProd` is a uniform-inducing bijection onto the complete `A × A`
      (`completeSpace_iff_isComplete_range` + range = univ).
    • `T2Space` / `T3Space` — `toProd` is a topological embedding into the Hausdorff/regular `A × A`.
    • `ContinuousAdd` / `ContinuousNeg` / `ContinuousMul` / `ContinuousStar` — each coordinate of the
      Cayley–Dickson product/sum/conjugation is a `Cut`-polynomial in the input coordinates, so its
      continuity reduces to `Continuous.add/mul/neg/star` on the (continuous) projections. ★ THE
      NON-ASSOCIATIVITY IS NO OBSTRUCTION: continuity is a statement about the BILINEAR product map,
      not the associative structure — exactly as the derivation Lie algebra (N6) and the iterated
      Leibniz binomial (N41a) survive non-associativity, the topological-ring structure does too.
    • `ContinuousSMul R` / `Module R` — the componentwise scalar action.
    • `IsTopologicalSemiring` — from `ContinuousAdd` + `ContinuousMul` (the hypothesis shape the
      trunk-native Cauchy product `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` consumes, with NO
      ℝ-valued norm — STANDARD §3).

  ★ THE ONE CAUSE (THE ONE LAW). The SAME Born-positivity completion that made `Cut` a complete
  uniform topological ring (N33–N37 — the C6 eternal-approach realised as Cauchy-completeness) makes
  every Cayley–Dickson double over it a complete topological `*`-algebra: the completeness and
  continuity of the base propagate up every rung of the cascade unchanged, because the doubled
  operations are continuous polynomials in the base operations. One cause (the completion of the
  derived ℝ), the whole analytic ground for the automorphism flow.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "octonion / derivation / automorphism / exp /
  gauge / G₂": the file is a complete proof that the iterated Cayley–Dickson double of a complete
  uniform topological commutative `*`-ring is itself a complete uniform topological `*`-ring (with
  continuous componentwise scalar action). No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO posited
  topology/metric/norm, NO Mathlib ℝ as content, NO ℝ-valued `Norm`.
-/
import Phys.Cascade.ForcedStop
import Phys.Foundation.ContinuumComplete
import Phys.Foundation.ContinuumUniform
import Mathlib.Topology.Constructions
import Mathlib.Topology.Algebra.Ring.Basic
import Mathlib.Topology.Algebra.IsUniformGroup.Basic
import Mathlib.Topology.UniformSpace.Cauchy
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Algebra.MulAction

namespace Phys.Cascade

open Phys.Foundation Phys.Foundation.ContinuumQ
open scoped Topology

noncomputable section

/-! ## The rung-1 double `Dbl R` as a complete uniform topological `*`-ring. -/

namespace Dbl
-- The pure topological-transfer lemmas below need only the structure projections, not the ring
-- axioms; the section carries `[CommRing R]` for the operation-continuity instances, so silence the
-- (correct) unused-section-variable advisory on the purely topological lemmas.
set_option linter.unusedSectionVars false
variable {R : Type*} [CommRing R]

/-- The pair projection of the rung-1 double onto `R × R`. -/
def toProd (z : Dbl R) : R × R := (z.re, z.im)

theorem toProd_injective : Function.Injective (toProd : Dbl R → R × R) := by
  intro a b h; simp only [toProd, Prod.mk.injEq] at h; cases a; cases b; simp_all

/-- THE UNIFORM STRUCTURE: completely induced (pulled back) along the pair projection from the
    product uniformity on `R × R`. Machinery on the DERIVED base, NOT a posited metric. -/
instance instUniformSpace [UniformSpace R] : UniformSpace (Dbl R) :=
  UniformSpace.comap toProd inferInstance

/-- The induced topology is the pullback (`induced toProd`) topology — by `rfl`, so there is no
    topology/uniformity diamond. -/
theorem topology_eq_induced [UniformSpace R] :
    (instUniformSpace : UniformSpace (Dbl R)).toTopologicalSpace
      = TopologicalSpace.induced toProd inferInstance := rfl

theorem isUniformInducing_toProd [UniformSpace R] :
    IsUniformInducing (toProd : Dbl R → R × R) := ⟨rfl⟩

theorem continuous_toProd [UniformSpace R] : Continuous (toProd : Dbl R → R × R) :=
  isUniformInducing_toProd.uniformContinuous.continuous

theorem continuous_re [UniformSpace R] : Continuous (Dbl.re : Dbl R → R) :=
  continuous_fst.comp continuous_toProd

theorem continuous_im [UniformSpace R] : Continuous (Dbl.im : Dbl R → R) :=
  continuous_snd.comp continuous_toProd

/-- Continuity INTO `Dbl R`: a map is continuous iff its two component maps are. -/
theorem continuous_mk [UniformSpace R] {X : Type*} [TopologicalSpace X]
    (f g : X → R) (hf : Continuous f) (hg : Continuous g) :
    Continuous (fun x => (⟨f x, g x⟩ : Dbl R)) := by
  rw [continuous_def]; intro s hs
  rw [topology_eq_induced, isOpen_induced_iff] at hs
  obtain ⟨t, ht, rfl⟩ := hs
  exact (hf.prodMk hg).isOpen_preimage t ht

/-- The double of a Cauchy-complete base is Cauchy-complete: `toProd` is a uniform-inducing
    bijection onto the complete product `R × R`. -/
instance instCompleteSpace [UniformSpace R] [CompleteSpace R] : CompleteSpace (Dbl R) := by
  rw [completeSpace_iff_isComplete_range isUniformInducing_toProd]
  have hr : Set.range (toProd : Dbl R → R × R) = Set.univ := by
    rw [Set.eq_univ_iff_forall]; intro p; exact ⟨⟨p.1, p.2⟩, rfl⟩
  rw [hr]; exact complete_univ

theorem isEmbedding_toProd [UniformSpace R] :
    Topology.IsEmbedding (toProd : Dbl R → R × R) :=
  ⟨⟨topology_eq_induced⟩, toProd_injective⟩

/-- The double of a Hausdorff base is Hausdorff. -/
instance instT2Space [UniformSpace R] [T2Space R] : T2Space (Dbl R) :=
  isEmbedding_toProd.t2Space

/-- The double of a regular base is regular. -/
instance instT3Space [UniformSpace R] [T3Space R] : T3Space (Dbl R) :=
  isEmbedding_toProd.t3Space

/-- Addition is continuous: `(z+w) = (z.re+w.re, z.im+w.im)`. -/
instance instContinuousAdd [UniformSpace R] [ContinuousAdd R] : ContinuousAdd (Dbl R) :=
  ⟨continuous_mk _ _
    ((continuous_re.comp continuous_fst).add (continuous_re.comp continuous_snd))
    ((continuous_im.comp continuous_fst).add (continuous_im.comp continuous_snd))⟩

/-- Negation is continuous: `(-z) = (-z.re, -z.im)`. -/
instance instContinuousNeg [UniformSpace R] [ContinuousNeg R] : ContinuousNeg (Dbl R) :=
  ⟨continuous_mk _ _ continuous_re.neg continuous_im.neg⟩

/-- Conjugation is continuous: `star z = (z.re, -z.im)`. -/
instance instContinuousStar [UniformSpace R] [ContinuousNeg R] : ContinuousStar (Dbl R) :=
  ⟨continuous_mk _ _ continuous_re continuous_im.neg⟩

/-- ★ Multiplication is continuous: each coordinate of
    `(z*w) = (z.re·w.re − z.im·w.im, z.re·w.im + z.im·w.re)` is a continuous polynomial in the
    (continuous) coordinates of `z`, `w`. -/
instance instContinuousMul [UniformSpace R] [ContinuousMul R] [ContinuousAdd R] [ContinuousNeg R] :
    ContinuousMul (Dbl R) := by
  constructor
  apply continuous_mk
  · have hzre : Continuous (fun p : Dbl R × Dbl R => p.1.re) := continuous_re.comp continuous_fst
    have hzim : Continuous (fun p : Dbl R × Dbl R => p.1.im) := continuous_im.comp continuous_fst
    have hwre : Continuous (fun p : Dbl R × Dbl R => p.2.re) := continuous_re.comp continuous_snd
    have hwim : Continuous (fun p : Dbl R × Dbl R => p.2.im) := continuous_im.comp continuous_snd
    simp only [sub_eq_add_neg]
    exact (hzre.mul hwre).add (hzim.mul hwim).neg
  · have hzre : Continuous (fun p : Dbl R × Dbl R => p.1.re) := continuous_re.comp continuous_fst
    have hzim : Continuous (fun p : Dbl R × Dbl R => p.1.im) := continuous_im.comp continuous_fst
    have hwre : Continuous (fun p : Dbl R × Dbl R => p.2.re) := continuous_re.comp continuous_snd
    have hwim : Continuous (fun p : Dbl R × Dbl R => p.2.im) := continuous_im.comp continuous_snd
    exact (hzre.mul hwim).add (hzim.mul hwre)

/-- Continuity of the componentwise scalar action `r • z = (r·z.re, r·z.im)` (here the `R`-self
    action used by the cascade's `SMul R (Dbl R)`). -/
instance instContinuousSMul [UniformSpace R] [ContinuousMul R] : ContinuousSMul R (Dbl R) := by
  constructor
  apply continuous_mk
  · exact continuous_fst.mul (continuous_re.comp continuous_snd)
  · exact continuous_fst.mul (continuous_im.comp continuous_snd)

end Dbl

/-! ## The Cayley–Dickson double `CD A` as a complete uniform topological `*`-algebra. -/

namespace CD
variable {A : Type*}

/-- The pair projection of the double onto `A × A`. -/
def toProd (z : CD A) : A × A := (z.re, z.im)

theorem toProd_injective : Function.Injective (toProd : CD A → A × A) := by
  intro a b h; simp only [toProd, Prod.mk.injEq] at h; cases a; cases b; simp_all

/-- THE UNIFORM STRUCTURE on the double: completely induced along the pair projection from the
    product uniformity on `A × A`. -/
instance instUniformSpace [UniformSpace A] : UniformSpace (CD A) :=
  UniformSpace.comap toProd inferInstance

theorem topology_eq_induced [UniformSpace A] :
    (instUniformSpace : UniformSpace (CD A)).toTopologicalSpace
      = TopologicalSpace.induced toProd inferInstance := rfl

theorem isUniformInducing_toProd [UniformSpace A] :
    IsUniformInducing (toProd : CD A → A × A) := ⟨rfl⟩

theorem continuous_toProd [UniformSpace A] : Continuous (toProd : CD A → A × A) :=
  isUniformInducing_toProd.uniformContinuous.continuous

theorem continuous_re [UniformSpace A] : Continuous (CD.re : CD A → A) :=
  continuous_fst.comp continuous_toProd

theorem continuous_im [UniformSpace A] : Continuous (CD.im : CD A → A) :=
  continuous_snd.comp continuous_toProd

/-- Continuity INTO `CD A`: a map is continuous iff its two component maps are. -/
theorem continuous_mk [UniformSpace A] {X : Type*} [TopologicalSpace X]
    (f g : X → A) (hf : Continuous f) (hg : Continuous g) :
    Continuous (fun x => (⟨f x, g x⟩ : CD A)) := by
  rw [continuous_def]; intro s hs
  rw [topology_eq_induced, isOpen_induced_iff] at hs
  obtain ⟨t, ht, rfl⟩ := hs
  exact (hf.prodMk hg).isOpen_preimage t ht

/-- The double of a Cauchy-complete base is Cauchy-complete. -/
instance instCompleteSpace [UniformSpace A] [CompleteSpace A] : CompleteSpace (CD A) := by
  rw [completeSpace_iff_isComplete_range isUniformInducing_toProd]
  have hr : Set.range (toProd : CD A → A × A) = Set.univ := by
    rw [Set.eq_univ_iff_forall]; intro p; exact ⟨⟨p.1, p.2⟩, rfl⟩
  rw [hr]; exact complete_univ

theorem isEmbedding_toProd [UniformSpace A] :
    Topology.IsEmbedding (toProd : CD A → A × A) :=
  ⟨⟨topology_eq_induced⟩, toProd_injective⟩

/-- The double of a Hausdorff base is Hausdorff. -/
instance instT2Space [UniformSpace A] [T2Space A] : T2Space (CD A) :=
  isEmbedding_toProd.t2Space

/-- The double of a regular base is regular. -/
instance instT3Space [UniformSpace A] [T3Space A] : T3Space (CD A) :=
  isEmbedding_toProd.t3Space

/-- Addition is continuous: `(z+w) = (z.re+w.re, z.im+w.im)`. -/
instance instContinuousAdd [UniformSpace A] [Add A] [ContinuousAdd A] : ContinuousAdd (CD A) :=
  ⟨continuous_mk _ _
    ((continuous_re.comp continuous_fst).add (continuous_re.comp continuous_snd))
    ((continuous_im.comp continuous_fst).add (continuous_im.comp continuous_snd))⟩

/-- Negation is continuous: `(-z) = (-z.re, -z.im)`. -/
instance instContinuousNeg [UniformSpace A] [Neg A] [ContinuousNeg A] : ContinuousNeg (CD A) :=
  ⟨continuous_mk _ _ continuous_re.neg continuous_im.neg⟩

/-- Conjugation is continuous: `star z = (star z.re, -z.im)`. -/
instance instContinuousStar [UniformSpace A] [Star A] [Neg A] [ContinuousStar A] [ContinuousNeg A] :
    ContinuousStar (CD A) :=
  ⟨continuous_mk _ _ (continuous_star.comp continuous_re) continuous_im.neg⟩

/-- ★ Multiplication is continuous: each coordinate of the Cayley–Dickson product
    `(z*w) = (z.re·w.re − (star w.im)·z.im, w.im·z.re + z.im·(star w.re))` is a continuous polynomial
    in the (continuous) coordinates of `z`, `w` — so continuity reduces to `Continuous.add/mul/neg/
    star` on the projections. The NON-ASSOCIATIVITY of the product is no obstruction: continuity is a
    statement about the BILINEAR product map, never about reassociation. -/
instance instContinuousMul [UniformSpace A] [Mul A] [Add A] [Neg A] [Star A]
    [ContinuousMul A] [ContinuousAdd A] [ContinuousNeg A] [ContinuousStar A] :
    ContinuousMul (CD A) := by
  constructor
  apply continuous_mk
  · have hzre : Continuous (fun p : CD A × CD A => p.1.re) := continuous_re.comp continuous_fst
    have hzim : Continuous (fun p : CD A × CD A => p.1.im) := continuous_im.comp continuous_fst
    have hwre : Continuous (fun p : CD A × CD A => p.2.re) := continuous_re.comp continuous_snd
    have hwim : Continuous (fun p : CD A × CD A => p.2.im) := continuous_im.comp continuous_snd
    exact (hzre.mul hwre).add ((hwim.star.mul hzim).neg)
  · have hzre : Continuous (fun p : CD A × CD A => p.1.re) := continuous_re.comp continuous_fst
    have hzim : Continuous (fun p : CD A × CD A => p.1.im) := continuous_im.comp continuous_fst
    have hwre : Continuous (fun p : CD A × CD A => p.2.re) := continuous_re.comp continuous_snd
    have hwim : Continuous (fun p : CD A × CD A => p.2.im) := continuous_im.comp continuous_snd
    exact (hwim.mul hzre).add (hzim.mul hwre.star)

/-- The generic componentwise scalar action on the double `r • z = (r • z.re, r • z.im)`. -/
instance instSMul {R : Type*} [SMul R A] : SMul R (CD A) := ⟨fun r z => ⟨r • z.re, r • z.im⟩⟩

@[simp] theorem genSmul_re {R : Type*} [SMul R A] (r : R) (z : CD A) : (r • z).re = r • z.re := rfl
@[simp] theorem genSmul_im {R : Type*} [SMul R A] (r : R) (z : CD A) : (r • z).im = r • z.im := rfl

/-- Continuity of the componentwise scalar action by a topological monoid `R`. -/
instance instContinuousSMul {R : Type*} [TopologicalSpace R] [UniformSpace A] [SMul R A]
    [ContinuousSMul R A] : ContinuousSMul R (CD A) := by
  constructor
  apply continuous_mk
  · exact continuous_fst.smul (continuous_re.comp continuous_snd)
  · exact continuous_fst.smul (continuous_im.comp continuous_snd)

end CD

/-! ## `IsTopologicalSemiring` — the Cauchy-product hypothesis (NO ℝ-valued norm). -/

/-- A `NonUnitalNonAssocSemiring` with continuous `+` and `*` is a topological semiring — the exact
    hypothesis shape the trunk-native Cauchy product `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal`
    consumes (it needs `[T3Space] [NonUnitalNonAssocSemiring] [IsTopologicalSemiring]`, with NO
    ℝ-valued `Norm` — STANDARD §3). Generic; applies to the non-associative `O Cut`. -/
instance instIsTopologicalSemiring {S : Type*} [TopologicalSpace S] [NonUnitalNonAssocSemiring S]
    [ContinuousAdd S] [ContinuousMul S] : IsTopologicalSemiring S := ⟨⟩

/-! ## Assembly on the terminal algebra `O Cut`. -/

attribute [local instance] CD.narCD CD.srCD

/-- `O Cut` is a Hausdorff (`T2`) topological space. -/
theorem oCut_t2Space : T2Space (O Cut) := inferInstance

/-- `O Cut` is a regular (`T3`) topological space — the separation axiom the Cauchy product needs. -/
theorem oCut_t3Space : T3Space (O Cut) := inferInstance

/-- `O Cut` is Cauchy-complete — the completeness the `tsum` of the exponential series needs. -/
theorem oCut_completeSpace : CompleteSpace (O Cut) := inferInstance

/-- Addition on `O Cut` is continuous. -/
theorem oCut_continuousAdd : ContinuousAdd (O Cut) := inferInstance

/-- ★ Multiplication on the non-associative `O Cut` is continuous — the lever that lets the bilinear
    product pass through the `tsum` limit in the analytic integration (childed N41c). -/
theorem oCut_continuousMul : ContinuousMul (O Cut) := inferInstance

/-- Conjugation on `O Cut` is continuous. -/
theorem oCut_continuousStar : ContinuousStar (O Cut) := inferInstance

/-- The `Cut`-scalar action on `O Cut` is continuous (the `(1/n!)•` of the exponential series). -/
theorem oCut_continuousSMul : ContinuousSMul Cut (O Cut) := inferInstance

/-- ★★ `O Cut` is a topological semiring — the precise hypothesis the trunk-native Cauchy product
    `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` requires, established with NO ℝ-valued norm.
    Together with `oCut_t3Space` + `oCut_completeSpace` this is the complete topological ground the
    analytic integration of the iterated-Leibniz binomial (N41a) to the exponential flow stands on. -/
theorem oCut_isTopologicalSemiring : IsTopologicalSemiring (O Cut) := inferInstance

/-! ## NON-VACUITY (W8): the structure is genuine, not the indiscrete/trivial topology. -/

/-- NON-VACUITY: `O Cut` is genuinely Hausdorff — distinct points are topologically separated. This
    rules out the trivial (indiscrete) topology, under which `ContinuousMul`/`T2` would be hollow.
    Witnesses that the transferred structure is the real product-of-completions topology. -/
theorem oCut_t2_nonvacuous : T2Space (O Cut) := oCut_t2Space

/-- NON-VACUITY: the projection `toProd` on the OUTER double is genuinely continuous and injective
    (a topological embedding), so the topology on `O Cut` is the honest pullback of the product
    topology, not a collapsed one. -/
theorem oCut_isEmbedding :
    Topology.IsEmbedding (CD.toProd : O Cut → H Cut × H Cut) :=
  CD.isEmbedding_toProd

end

end Phys.Cascade
