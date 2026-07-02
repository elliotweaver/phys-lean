/-
  Phys.Algebra.TowerGatherIrreducible27 — N234: THE IRREDUCIBLE 27 — `tracelessSym` has NO
  proper nonzero g₂-invariant subspace, completing `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` into IRREDUCIBLES
  (the genuine Clebsch–Gordan), PLUS the Schur strengthening on the 27: every banked-commutant
  element preserving `tracelessSym` acts on it as an EXPLICIT SCALAR (`τ0 (T X0q)`) — the
  instrument that lets the successor node close the N235–N239 FFT arc as a corollary.
  ===========================================================================
  N233 banked the canonical internal direct sum `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`; N238 banked the
  irreducibility of the 1, the 7, the 14. The LAST atom — the 27 (`tracelessSym`) — measured a
  genuine W1 wall (the N28 dimension-pincer is vacuous at `14 ≤ C(d,2)+C(27−d,2)`), and the
  N235→N239 dissolution arc toward the g₂ First Fundamental Theorem kept landing on HARDER
  classical statements (a 2401-dimensional invariant-theory arena). THE ONE LAW (W5): the
  INSTRUMENT was fighting, not the theory. This node returns to the trunk's OWN instrument —
  the one that closed the 7 (N28) and the 14: the CONCRETE banked derivations acting, exactly,
  over the derived ℚ.

  ★ THE ROUTE (the Cartan pin + walk certificate — every constant exact, kernel-checked):
    (1) THE PIN. The banked D0E, D3E (N16 nullbasis) COMMUTE; on the 27 the operator
        `s1 = (ad D0)²` has exact spectrum {0,−1,−4} (likewise `s2 = (ad D3)²`), so
        `pk = (s²+5s+4)` is `4·(spectral projector onto ker s)`; one more banked generator D1E
        pins the joint kernel to a LINE: the composite integer chain
        `chainM = pk1∘pk2∘(ad D1)²∘pk2∘pk1` satisfies `chainM(B) = −256·τ(B)·X0` for every
        basis quadric `B` — the RANK-1 PIN onto the single integer quadric
        `X0 = diag(0,−1,1,1,−1,0,0)` with `τ = (1/4)·tr(X0·−)` (CERTIFICATE 1).
    (2) THE WALK. 27 explicit words of length ≤ 2 in the 14 banked generators carry `X0` to a
        BASIS of the 27 (CERTIFICATE 4: `wden/wcoef`), and the pin functional composed with the
        SAME words separates the basis — the 27×27 pairing matrix has an explicit integer
        left-inverse (CERTIFICATES 2–3: `pairM/qrow/sval`).
    (3) THE ASSEMBLY. `W` invariant, `0 ≠ w ∈ W` ⟹ some word sends `w` to `w'` with
        `τ0 w' ≠ 0` (else the left-invertible pairing kills every coordinate of `w`) ⟹
        `chainF w' = −1024·(τ0 w')·X0q ∈ W` (the pin chain is a POLYNOMIAL IN THE BANKED
        ACTION, so it preserves `W`) ⟹ `X0q ∈ W` ⟹ the walk forces `W = tracelessSym`.
        NO PROPER INVARIANT SUBSPACE: the 27 is IRREDUCIBLE (`tracelessSym_no_proper_invariant`).
    (4) THE SCHUR STRENGTHENING (`commutant_scalar_on_tracelessSym`). A g₂-commuting endomorphism
        `φ` of the 27 commutes with the pin chain, so `φ X0q = (τ0 (φ X0q))·X0q` is a scalar
        multiple; the walk propagates the scalar to all of `tracelessSym`: `φ = c·id`. Over ℚ
        abstract Schur yields only a division ALGEBRA; the pin yields the full scalar result.
    (5) THE ARC INVERTED. With all four atoms IRREDUCIBLE (`fourSummands_irreducible`) and the
        pin+walk Schur instrument banked, the N239 FFT generation lemma reverses from a wall
        into a corollary: the successor node repeats the (tiny) pin on the 7 and the 14 and
        assembles `commutantG2 ≤ commutantSpan` via the banked Peirce corners (N237) — the
        count follows from atomicity, not atomicity from the count. THIS node banks the
        atomicity; it asserts NOTHING about the commutant dimension.

  ★ THE TRANSPORT (how the kernel checks it): the integer 7×7 matrix calculus `qI` — the
  coordinate-shuffle endomorphisms of `Im(O ℚ)` in the banked `imBasis` coordinates — is a
  bridge respecting composition/addition/scaling/trace/Born-adjoint (`qI_comp`, `qI_add`,
  `qI_smul`, `trace_qI`, `qI_adjoint`); the banked `imRep (DkE)` EQUAL `qI (dm k)` (14 bridge
  lemmas, coordinate `ext+simp+ring`); every certificate identity is then `decide` on integer
  matrices — kernel-checked exact arithmetic, the kernel-internal decision procedure only, NO numeric axiom. The
  certificates were produced offline by exact-rational recon (never floats) and are VERIFIED
  from scratch by the kernel here.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). NO invariant theory, NO Weyl integration,
  NO posited `g₂`/weights/roots: the pin and walk are concrete words in the banked derivations
  D0E–D13E (N16) acting on the banked `tracelessSym` (N228) inside the banked `End ℚ ImO`
  (N22); irreducibility and Schur are proved by EXHIBITING explicit algebra elements — exactly
  the instrument that closed the 7 in N28.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "g₂ / Clebsch–Gordan / representation /
  matter": what remains is pure mathematics — the 27-dimensional space of traceless symmetric
  operators on the imaginary part of the Cayley–Dickson triple-double of ℚ admits no proper
  nonzero subspace invariant under all Leibniz derivations, and every derivation-commuting
  endomorphism preserving that space acts on it as an explicit scalar.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.TowerGatherFFTPeirceReduction
import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.DerivationStabilizerSplit

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-diamond ceiling for the ℚ-End synthesis (as in N227–N238); NOT a proof-search raise.
set_option synthInstance.maxHeartbeats 1000000
set_option maxRecDepth 4000

noncomputable section

/-! ## (A) THE INTEGER MATRIX CALCULUS `qI` in the banked `imBasis` coordinates. -/

abbrev M7 := Fin 7 → Fin 7 → ℤ

/-- The coordinate-shuffle endomorphism of an integer 7×7 matrix on the imaginary
    coordinates `c1..c7` (killing `c0`): row `i` of `M` gives output coordinate `i+1`. -/
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

/-- `qZ M` has vanishing real coordinate, hence lands in the banked `ImO` (N22). -/
theorem qZ_mem_ImO (M : M7) (z : O ℚ) : qZ M z ∈ ImO :=
  mem_ImO_of_reQ_zero rfl

/-- The restriction of `qZ M` to the fundamental 7-module `ImO`. -/
def qI (M : M7) : Module.End ℚ ImO :=
  (qZ M).restrict (fun z _ => qZ_mem_ImO M z)

@[simp] theorem qI_coe (M : M7) (x : ImO) : (qI M x : O ℚ) = qZ M (x : O ℚ) := rfl

/-- Integer 7×7 matrix product. -/
def mul7 (A B : M7) : M7 := fun i k =>
  A i 0 * B 0 k + A i 1 * B 1 k + A i 2 * B 2 k + A i 3 * B 3 k +
  A i 4 * B 4 k + A i 5 * B 5 k + A i 6 * B 6 k

def add7 (A B : M7) : M7 := fun i j => A i j + B i j
def sub7 (A B : M7) : M7 := fun i j => A i j - B i j
def smul7 (c : ℤ) (A : M7) : M7 := fun i j => c * A i j
/-- Transpose. -/
def transp (M : M7) : M7 := fun i j => M j i
/-- Integer trace. -/
def tr7 (M : M7) : ℤ := M 0 0 + M 1 1 + M 2 2 + M 3 3 + M 4 4 + M 5 5 + M 6 6
/-- Matrix bracket `[d, m] = d·m − m·d`. -/
def adm (d m : M7) : M7 := sub7 (mul7 d m) (mul7 m d)

/-- ★ Composition transports to the matrix product. -/
theorem qI_comp (M N : M7) : qI M * qI N = qI (mul7 M N) := by
  apply LinearMap.ext; intro x
  apply Subtype.ext
  show qZ M (qZ N (x : O ℚ)) = qZ (mul7 M N) (x : O ℚ)
  ext <;> simp only [qZ, mul7, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk,
    AddHom.coe_mk, Int.cast_add, Int.cast_mul] <;> ring

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

/-! ## (B) THE `ImO` BASIS TRANSPORT: coordinates, trace, Born-adjoint. -/

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

/-- The 7-element basis of `ImO` (the banked `imBasis`, packaged). -/
def bb : Module.Basis (Fin 7) ℚ ImO := Module.Basis.mk bvec_indep bvec_span

/-- The 7 coordinate functionals `c1..c7` on `ImO`, as linear maps. -/
def coordFn (i : Fin 7) : ImO →ₗ[ℚ] ℚ where
  toFun x := ![c1, c2, c3, c4, c5, c6, c7] i (x : O ℚ)
  map_add' a b := by
    fin_cases i <;>
      simp [c1, c2, c3, c4, c5, c6, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im]
  map_smul' r a := by
    fin_cases i <;>
      simp [c1, c2, c3, c4, c5, c6, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]

/-- The `bb`-representation is computed by the coordinate functionals. -/
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
    LinearMap.trace ℚ ImO (qI M) = (tr7 M : ℚ) := by
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
  rw [show (Finset.univ.sum fun i => LinearMap.toMatrix bb bb (qI M) i i)
      = Finset.univ.sum fun i : Fin 7 => (M i i : ℚ) from
    Finset.sum_congr rfl fun i _ => hentry i i]
  show _ = ((M 0 0 + M 1 1 + M 2 2 + M 3 3 + M 4 4 + M 5 5 + M 6 6 : ℤ) : ℚ)
  rw [Fin.sum_univ_seven]
  push_cast; ring

/-- The Born form in coordinates (the composition-norm polarization, N24). -/
theorem gForm_coords (v w : O ℚ) :
    gForm v w = c0 v * c0 w + c1 v * c1 w + c2 v * c2 w + c3 v * c3 w
      + c4 v * c4 w + c5 v * c5 w + c6 v * c6 w + c7 v * c7 w := by
  show reQ (v * star w) = _
  simp only [reQ, c0, c1, c2, c3, c4, c5, c6, c7, CD.mul_re, CD.mul_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im]
  ring

/-- ★ The Born-adjoint of `qI M` is `qI (transp M)`. -/
theorem qI_adjoint (M : M7) (x y : ImO) :
    bornBil (qI M x) y = bornBil x (qI (transp M) y) := by
  show gForm ((qI M x : O ℚ)) (y : O ℚ) = gForm (x : O ℚ) ((qI (transp M) y : O ℚ))
  rw [qI_coe, qI_coe, gForm_coords, gForm_coords]
  simp only [qZ, transp, c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk]
  ring

/-- A symmetric traceless integer matrix gives an element of the banked `tracelessSym` (N228). -/
theorem qI_mem_tracelessSym (M : M7) (hsym : transp M = M) (htr : tr7 M = 0) :
    qI M ∈ tracelessSym := by
  refine Submodule.mem_inf.mpr ⟨?_, ?_⟩
  · rw [LinearMap.mem_selfAdjointSubmodule]
    intro x y
    have h := qI_adjoint M x y
    rwa [hsym] at h
  · show LinearMap.trace ℚ ImO (qI M) = 0
    rw [trace_qI, htr]; norm_num

/-! ## (C) THE CERTIFICATE DATA (recon-emitted exact integers; verified by the kernel below). -/

/-- The 7×7 integer matrix of the banked `D0E` on the imaginary coordinates. -/
def d0m : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, -1, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, -1, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D1E` on the imaginary coordinates. -/
def d1m : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, -1, 0, 0, 0],
     ![0, 0, 0, 0, -1, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D2E` on the imaginary coordinates. -/
def d2m : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0],
     ![0, -1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, -1, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D3E` on the imaginary coordinates. -/
def d3m : M7 :=
  ![![0, 0, 0, 0, 0, -1, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, -1, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D4E` on the imaginary coordinates. -/
def d4m : M7 :=
  ![![0, 0, 0, 0, 1, 0, 0],
     ![0, 0, 0, 0, 0, -1, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![-1, 0, 0, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D5E` on the imaginary coordinates. -/
def d5m : M7 :=
  ![![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, -1, 0],
     ![-1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D6E` on the imaginary coordinates. -/
def d6m : M7 :=
  ![![0, 0, -1, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, -1, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D7E` on the imaginary coordinates. -/
def d7m : M7 :=
  ![![0, -1, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, -1, 0],
     ![0, 0, 0, 0, 1, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D8E` on the imaginary coordinates. -/
def d8m : M7 :=
  ![![0, 0, 0, 0, 0, 0, -1],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, -1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D9E` on the imaginary coordinates. -/
def d9m : M7 :=
  ![![0, 0, 0, -1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, -1],
     ![0, 0, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D10E` on the imaginary coordinates. -/
def d10m : M7 :=
  ![![0, 0, 0, 0, 1, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, -1],
     ![0, 0, 0, 0, 0, 0, 0],
     ![-1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D11E` on the imaginary coordinates. -/
def d11m : M7 :=
  ![![0, 1, 0, 0, 0, 0, 0],
     ![-1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, -1],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0]]

/-- The 7×7 integer matrix of the banked `D12E` on the imaginary coordinates. -/
def d12m : M7 :=
  ![![0, 0, -1, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, -1],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 1, 0, 0]]

/-- The 7×7 integer matrix of the banked `D13E` on the imaginary coordinates. -/
def d13m : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, -1, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, -1],
     ![0, 0, 0, 0, 0, 1, 0]]

/-- The 14 generator matrices, indexed. -/
def dm : Fin 14 → M7 :=
  ![d0m, d1m, d2m, d3m, d4m, d5m, d6m, d7m, d8m, d9m, d10m, d11m, d12m, d13m]

/-- ★ THE LANDING QUADRIC `X0 = diag(0,−1,1,1,−1,0,0)` — the rank-1 pin target. -/
def X0m : M7 :=
  ![![0, 0, 0, 0, 0, 0, 0],
     ![0, -1, 0, 0, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, -1, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]]

/-- The 27 basis quadrics of the traceless-symmetric space: 6 diagonal differences
    `Eᵢᵢ − Eᵢ₊₁,ᵢ₊₁` + 21 off-diagonal symmetric pairs `Eᵢⱼ + Eⱼᵢ`. -/
def bq : Fin 27 → M7 :=
  ![![![1, 0, 0, 0, 0, 0, 0],
     ![0, -1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, -1, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0],
     ![0, 0, 0, -1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, -1, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 1, 0, 0],
     ![0, 0, 0, 0, 0, -1, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 1, 0],
     ![0, 0, 0, 0, 0, 0, -1]],
    ![![0, 1, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 1, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 1, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 1, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 1],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![1, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 1, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 1, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 1],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 1, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 1, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 1, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 1],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 1, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 1, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 1, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 1],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 1, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 1, 0],
     ![0, 0, 0, 0, 1, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 1],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 1, 0, 0]],
    ![![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 1],
     ![0, 0, 0, 0, 0, 1, 0]]]

/-- `tau4 k = tr(bq k · X0m)` — the integer-scaled pin functional on the basis. -/
def tau4 : Fin 27 → ℤ :=
  ![1, -2, 0, 2, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

/-- The 27 walk words (≤ 2 letters, indices into `dm`). -/
def words : Fin 27 → List (Fin 14) :=
  ![[], [1], [2], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [8, 1], [13, 1], [8, 2], [13, 2], [4, 4], [8, 4], [9, 4], [10, 4], [11, 4], [12, 4], [13, 4], [8, 5], [13, 5], [9, 9]]

/-- Walk denominators (all nonzero). -/
def wden : Fin 27 → ℤ :=
  ![4, 4, 4, 4, 4, 4, 2, 2, 2, 2, 4, 2, 2, 2, 4, 2, 2, 4, 2, 2, 2, 2, 2, 2, 2, 2, 2]

/-- Walk coefficients: `wden k • bq k = Σ l, wcoef k l • (words l applied to X0m)`. -/
def wcoef : Fin 27 → Fin 27 → ℤ :=
  ![![-4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![-4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 2, 0, 0, -2, 0, 0, 0, 0, 0, 0],
    ![4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -2, 0, 0, 4, 0, 0, 0, 0, 0, 2],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    ![0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
    ![0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, 0, 0, 0, -4, 0, 0, 0, 0, 0],
    ![0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0],
    ![0, 0, 0, 0, -1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0],
    ![0, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
    ![0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    ![0, 0, 0, 0, 0, 0, -2, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    ![0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 0]]

/-- The pairing matrix `pairM j k = tr((words j applied to bq k) · X0m)`. -/
def pairM : Fin 27 → Fin 27 → ℤ :=
  ![![1, -2, 0, 2, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, -4, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -4, 0, 0, 0, 0, 0, 0, 0, 0, -4, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![4, -4, -4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -4, 0, 0, -4, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, -4, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![4, -8, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![-4, 2, 0, -2, 4, -2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, -2],
    ![-2, 0, 0, -2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -4, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 2, 2, -2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

/-- Integer left-inverse rows of the pairing matrix. -/
def qrow : Fin 27 → Fin 27 → ℤ :=
  ![![-16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 3, 2, 0, 0, -12, 0, 0, 0, 0, 0, 2],
    ![-4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 4, 0, 0, -10, 0, 0, 0, 0, 0, 4],
    ![4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1, 3, 0, 0, -4, 0, 0, 0, 0, 0, 3],
    ![10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 4, 0, 0, -3, 0, 0, 0, 0, 0, 4],
    ![4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 1, 10, 0, 0, -4, 0, 0, 0, 0, 0, 10],
    ![16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, -3, -2, 0, 0, 12, 0, 0, 0, 0, 0, 12],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    ![0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
    ![0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, 0, 0, 0, -4, 0, 0, 0, 0, 0],
    ![0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0],
    ![0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0],
    ![0, 0, 0, 2, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
    ![0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    ![0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    ![0, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0],
    ![0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, -2, 0, 0, 0, 0, 0, 0, 0]]

/-- The left-inverse diagonal scalars (all nonzero). -/
def sval : Fin 27 → ℤ :=
  ![28, 28, 14, 14, 28, 28, 4, 4, 4, 4, 8, 4, 4, 4, 8, 4, 4, 8, 4, 4, 4, 4, 4, 4, 4, 4, 4]


/-! ## (D) THE 14 BANKED GENERATORS AND THE ACTION BRIDGE. -/

/-- The banked explicit derivations D0E–D13E (N16) as elements of the banked Lie algebra
    `derivationLieQ` = g₂ = Der(O ℚ), the gauge-arc carrier. -/
def DL : Fin 14 → derivationLieQ :=
  ![⟨D0E, D0E_isDerivQ⟩, ⟨D1E, D1E_isDerivQ⟩, ⟨D2E, D2E_isDerivQ⟩, ⟨D3E, D3E_isDerivQ⟩,
    ⟨D4E, D4E_isDerivQ⟩, ⟨D5E, D5E_isDerivQ⟩, ⟨D6E, D6E_isDerivQ⟩, ⟨D7E, D7E_isDerivQ⟩,
    ⟨D8E, D8E_isDerivQ⟩, ⟨D9E, D9E_isDerivQ⟩, ⟨D10E, D10E_isDerivQ⟩, ⟨D11E, D11E_isDerivQ⟩,
    ⟨D12E, D12E_isDerivQ⟩, ⟨D13E, D13E_isDerivQ⟩]

theorem imRep_DL_0 : imRep (DL 0) = qI (dm 0) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D0E (x : O ℚ) = qZ (dm 0) (x : O ℚ)
  ext <;>
    simp [D0E, qZ, dm, d0m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_1 : imRep (DL 1) = qI (dm 1) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D1E (x : O ℚ) = qZ (dm 1) (x : O ℚ)
  ext <;>
    simp [D1E, qZ, dm, d1m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_2 : imRep (DL 2) = qI (dm 2) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D2E (x : O ℚ) = qZ (dm 2) (x : O ℚ)
  ext <;>
    simp [D2E, qZ, dm, d2m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_3 : imRep (DL 3) = qI (dm 3) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D3E (x : O ℚ) = qZ (dm 3) (x : O ℚ)
  ext <;>
    simp [D3E, qZ, dm, d3m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_4 : imRep (DL 4) = qI (dm 4) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D4E (x : O ℚ) = qZ (dm 4) (x : O ℚ)
  ext <;>
    simp [D4E, qZ, dm, d4m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_5 : imRep (DL 5) = qI (dm 5) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D5E (x : O ℚ) = qZ (dm 5) (x : O ℚ)
  ext <;>
    simp [D5E, qZ, dm, d5m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_6 : imRep (DL 6) = qI (dm 6) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D6E (x : O ℚ) = qZ (dm 6) (x : O ℚ)
  ext <;>
    simp [D6E, qZ, dm, d6m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_7 : imRep (DL 7) = qI (dm 7) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D7E (x : O ℚ) = qZ (dm 7) (x : O ℚ)
  ext <;>
    simp [D7E, qZ, dm, d7m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_8 : imRep (DL 8) = qI (dm 8) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D8E (x : O ℚ) = qZ (dm 8) (x : O ℚ)
  ext <;>
    simp [D8E, qZ, dm, d8m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_9 : imRep (DL 9) = qI (dm 9) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D9E (x : O ℚ) = qZ (dm 9) (x : O ℚ)
  ext <;>
    simp [D9E, qZ, dm, d9m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_10 : imRep (DL 10) = qI (dm 10) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D10E (x : O ℚ) = qZ (dm 10) (x : O ℚ)
  ext <;>
    simp [D10E, qZ, dm, d10m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_11 : imRep (DL 11) = qI (dm 11) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D11E (x : O ℚ) = qZ (dm 11) (x : O ℚ)
  ext <;>
    simp [D11E, qZ, dm, d11m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_12 : imRep (DL 12) = qI (dm 12) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D12E (x : O ℚ) = qZ (dm 12) (x : O ℚ)
  ext <;>
    simp [D12E, qZ, dm, d12m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring

theorem imRep_DL_13 : imRep (DL 13) = qI (dm 13) := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show D13E (x : O ℚ) = qZ (dm 13) (x : O ℚ)
  ext <;>
    simp [D13E, qZ, dm, d13m, c1, c2, c3, c4, c5, c6, c7,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    ring


/-- ★ THE ACTION BRIDGE: the banked 7-rep of each certificate generator IS its integer
    matrix in the `imBasis` coordinates. -/
theorem imRep_DL (k : Fin 14) : imRep (DL k) = qI (dm k) := by
  fin_cases k
  · exact imRep_DL_0
  · exact imRep_DL_1
  · exact imRep_DL_2
  · exact imRep_DL_3
  · exact imRep_DL_4
  · exact imRep_DL_5
  · exact imRep_DL_6
  · exact imRep_DL_7
  · exact imRep_DL_8
  · exact imRep_DL_9
  · exact imRep_DL_10
  · exact imRep_DL_11
  · exact imRep_DL_12
  · exact imRep_DL_13

/-- ★ The banked g₂-action on `7 ⊗ 7` (`adEnd`, N227) transports to the matrix bracket. -/
theorem adEnd_DL_qI (k : Fin 14) (M : M7) :
    adEnd (DL k) (qI M) = qI (adm (dm k) M) := by
  rw [adEnd_apply, imRep_DL]
  show qI (dm k) * qI M - qI M * qI (dm k) = qI (adm (dm k) M)
  rw [qI_comp, qI_comp, ← qI_sub]
  rfl

/-! ## (E) WORD APPLICATION (the walk operator) and its transport. -/

/-- Matrix-level word application (fold the bracket over the word). -/
def wapM : List (Fin 14) → M7 → M7
  | [], M => M
  | (g :: w), M => adm (dm g) (wapM w M)

/-- Abstract word application: iterated banked `adEnd` along a word. -/
def wapE : List (Fin 14) → Module.End ℚ ImO → Module.End ℚ ImO
  | [], X => X
  | (g :: w), X => adEnd (DL g) (wapE w X)

/-- ★ Word application transports along `qI`. -/
theorem wapE_qI (w : List (Fin 14)) (M : M7) : wapE w (qI M) = qI (wapM w M) := by
  induction w with
  | nil => rfl
  | cons g w ih => rw [wapE, ih, adEnd_DL_qI]; rfl

/-- Word application distributes over sums of operators. -/
theorem wapE_sum {ι : Type*} (s : Finset ι) (w : List (Fin 14))
    (f : ι → Module.End ℚ ImO) :
    wapE w (∑ k ∈ s, f k) = ∑ k ∈ s, wapE w (f k) := by
  induction w with
  | nil => rfl
  | cons g w ih => rw [wapE, ih, map_sum]; rfl

theorem wapE_smul (w : List (Fin 14)) (c : ℚ) (X : Module.End ℚ ImO) :
    wapE w (c • X) = c • wapE w X := by
  induction w with
  | nil => rfl
  | cons g w ih => rw [wapE, ih, map_smul]; rfl

/-- Word application preserves any `adEnd`-invariant submodule. -/
theorem wapE_mem (w : List (Fin 14)) (W : Submodule ℚ (Module.End ℚ ImO))
    (hWinv : ∀ (D : derivationLieQ) (X : Module.End ℚ ImO), X ∈ W → adEnd D X ∈ W)
    (X : Module.End ℚ ImO) (hX : X ∈ W) : wapE w X ∈ W := by
  induction w with
  | nil => exact hX
  | cons g w ih => exact hWinv (DL g) _ ih

/-! ## (F) THE PIN OPERATOR, FUNCTIONAL, AND CHAIN. -/

/-- The landing quadric as an abstract operator. -/
def X0q : Module.End ℚ ImO := qI X0m

/-- `X0q` is a traceless Born-symmetric operator (integer teeth by `decide`). -/
theorem X0q_mem_tracelessSym : X0q ∈ tracelessSym :=
  qI_mem_tracelessSym X0m (by decide) (by decide)

/-- `X0q ≠ 0` (it sends the banked `e2O` to `−e2O` — W8 non-vacuity). -/
theorem X0q_ne_zero : X0q ≠ 0 := by
  intro h
  have h2 : X0q ⟨e2O, imBasis_mem_ImO 1⟩ = 0 := by rw [h]; rfl
  have h3 : (X0q ⟨e2O, imBasis_mem_ImO 1⟩ : O ℚ) = 0 := by rw [h2]; rfl
  have h4 : c2 ((X0q ⟨e2O, imBasis_mem_ImO 1⟩ : O ℚ)) = c2 (0 : O ℚ) := by rw [h3]
  revert h4
  show c2 (qZ X0m e2O) = c2 (0 : O ℚ) → False
  simp [qZ, X0m, e2O, c1, c2, c3, c4, c5, c6, c7]

/-- The pin functional `τ0 = (1/4)·tr(− ∘ X0q)` (a linear functional on operators). -/
def tau0 : Module.End ℚ ImO →ₗ[ℚ] ℚ :=
  (1/4 : ℚ) • ((LinearMap.trace ℚ ImO).comp (LinearMap.mulRight ℚ X0q))

theorem tau0_apply (X : Module.End ℚ ImO) :
    tau0 X = (1/4 : ℚ) * LinearMap.trace ℚ ImO (X * X0q) := rfl

/-- `τ0` of a matrix operator is the integer trace pairing (over 4). -/
theorem tau0_qI (M : M7) : tau0 (qI M) = (tr7 (mul7 M X0m) : ℚ) / 4 := by
  rw [tau0_apply, show qI M * X0q = qI (mul7 M X0m) from qI_comp M X0m, trace_qI]
  ring

/-- Matrix stage `s1 = (ad d0)²` (spectrum `{0,−1,−4}` on the 27; NO negation, the sign is
    folded into the spectral polynomial: `x²+5x+4` on `s` equals `y²−5y+4` on `y=−s`). -/
def s1M (m : M7) : M7 := adm d0m (adm d0m m)
def s2M (m : M7) : M7 := adm d3m (adm d3m m)
/-- Matrix spectral stage `pk1 = s1² + 5·s1 + 4` = `4·(projector onto ker s1)`. -/
def pk1M (m : M7) : M7 := add7 (add7 (s1M (s1M m)) (smul7 5 (s1M m))) (smul7 4 m)
def pk2M (m : M7) : M7 := add7 (add7 (s2M (s2M m)) (smul7 5 (s2M m))) (smul7 4 m)
/-- ★ The integer pin chain (`= 256·`the true rank-1 projector, times `−4·τ`). -/
def chainM (m : M7) : M7 := pk1M (pk2M (adm d1m (adm d1m (pk2M (pk1M m)))))

/-- Abstract stage `s1 = (adEnd D0)²` — DOUBLE APPLICATION of the banked `adEnd` (N227).
    Kept as a plain function on operators: every proof below only ever APPLIES the banked
    linear-map structures (never forms products in `End ℚ (End ℚ ImO)`), keeping the
    instance-diamond out of every elaboration. -/
def s1F (X : Module.End ℚ ImO) : Module.End ℚ ImO := adEnd (DL 0) (adEnd (DL 0) X)
def s2F (X : Module.End ℚ ImO) : Module.End ℚ ImO := adEnd (DL 3) (adEnd (DL 3) X)
/-- Spectral stage `pk1 = s1² + 5·s1 + 4` (`4·`the projector onto `ker s1`; the spectrum of
    `s1` on the 27 is `{0,−1,−4}`, so `x²+5x+4` kills the nonzero part and scales the kernel). -/
def pk1F (X : Module.End ℚ ImO) : Module.End ℚ ImO :=
  s1F (s1F X) + (5 : ℚ) • s1F X + (4 : ℚ) • X
def pk2F (X : Module.End ℚ ImO) : Module.End ℚ ImO :=
  s2F (s2F X) + (5 : ℚ) • s2F X + (4 : ℚ) • X
/-- ★ THE ABSTRACT PIN CHAIN — a POLYNOMIAL IN THE BANKED `adEnd` ACTION (as a composite of
    stage applications). This single shape is what makes the pin (i) transportable to the
    integer calculus, (ii) invariant-subspace-preserving, (iii) additive/homogeneous,
    (iv) commutant-commuting. -/
def chainF (X : Module.End ℚ ImO) : Module.End ℚ ImO :=
  pk1F (pk2F (adEnd (DL 1) (adEnd (DL 1) (pk2F (pk1F X)))))

theorem dm_zero : dm 0 = d0m := rfl
theorem dm_one : dm 1 = d1m := rfl
theorem dm_three : dm 3 = d3m := rfl

theorem s1F_qI (M : M7) : s1F (qI M) = qI (s1M M) := by
  rw [s1F, adEnd_DL_qI, adEnd_DL_qI, dm_zero]; rfl

theorem s2F_qI (M : M7) : s2F (qI M) = qI (s2M M) := by
  rw [s2F, adEnd_DL_qI, adEnd_DL_qI, dm_three]; rfl

theorem pk1F_qI (M : M7) : pk1F (qI M) = qI (pk1M M) := by
  rw [pk1F, s1F_qI, s1F_qI, pk1M, qI_add, qI_add, qI_smul, qI_smul]
  norm_num

theorem pk2F_qI (M : M7) : pk2F (qI M) = qI (pk2M M) := by
  rw [pk2F, s2F_qI, s2F_qI, pk2M, qI_add, qI_add, qI_smul, qI_smul]
  norm_num

/-- ★ Chain transport: the abstract chain agrees with the integer chain on matrix operators. -/
theorem chainF_qI (M : M7) : chainF (qI M) = qI (chainM M) := by
  rw [chainF, pk1F_qI, pk2F_qI, adEnd_DL_qI, adEnd_DL_qI, dm_one, pk2F_qI, pk1F_qI, chainM]

set_option maxHeartbeats 1600000 in
/-- The chain preserves every `adEnd`-invariant submodule (it is a polynomial in the action). -/
theorem chainF_mem (W : Submodule ℚ (Module.End ℚ ImO))
    (hWinv : ∀ (D : derivationLieQ) (X : Module.End ℚ ImO), X ∈ W → adEnd D X ∈ W)
    (X : Module.End ℚ ImO) (hX : X ∈ W) : chainF X ∈ W := by
  have hs1 : ∀ Y, Y ∈ W → s1F Y ∈ W := fun Y hY => hWinv (DL 0) _ (hWinv (DL 0) _ hY)
  have hs2 : ∀ Y, Y ∈ W → s2F Y ∈ W := fun Y hY => hWinv (DL 3) _ (hWinv (DL 3) _ hY)
  have hpk1 : ∀ Y, Y ∈ W → pk1F Y ∈ W := fun Y hY =>
    W.add_mem (W.add_mem (hs1 _ (hs1 _ hY)) (W.smul_mem _ (hs1 _ hY))) (W.smul_mem _ hY)
  have hpk2 : ∀ Y, Y ∈ W → pk2F Y ∈ W := fun Y hY =>
    W.add_mem (W.add_mem (hs2 _ (hs2 _ hY)) (W.smul_mem _ (hs2 _ hY))) (W.smul_mem _ hY)
  exact hpk1 _ (hpk2 _ (hWinv (DL 1) _ (hWinv (DL 1) _ (hpk2 _ (hpk1 _ hX)))))

/-- Stage additivity over finite sums (each stage only applies linear maps). -/
theorem s1F_sum {ι : Type*} (s : Finset ι) (f : ι → Module.End ℚ ImO) :
    s1F (∑ k ∈ s, f k) = ∑ k ∈ s, s1F (f k) := by
  simp only [s1F, map_sum]

theorem s2F_sum {ι : Type*} (s : Finset ι) (f : ι → Module.End ℚ ImO) :
    s2F (∑ k ∈ s, f k) = ∑ k ∈ s, s2F (f k) := by
  simp only [s2F, map_sum]

theorem pk1F_sum {ι : Type*} (s : Finset ι) (f : ι → Module.End ℚ ImO) :
    pk1F (∑ k ∈ s, f k) = ∑ k ∈ s, pk1F (f k) := by
  simp only [pk1F, s1F_sum, Finset.smul_sum, ← Finset.sum_add_distrib]

theorem pk2F_sum {ι : Type*} (s : Finset ι) (f : ι → Module.End ℚ ImO) :
    pk2F (∑ k ∈ s, f k) = ∑ k ∈ s, pk2F (f k) := by
  simp only [pk2F, s2F_sum, Finset.smul_sum, ← Finset.sum_add_distrib]

/-- The chain is additive over finite sums. -/
theorem chainF_sum {ι : Type*} (s : Finset ι) (f : ι → Module.End ℚ ImO) :
    chainF (∑ k ∈ s, f k) = ∑ k ∈ s, chainF (f k) := by
  simp only [chainF, pk1F_sum, pk2F_sum, map_sum]

theorem s1F_smul (c : ℚ) (X : Module.End ℚ ImO) : s1F (c • X) = c • s1F X := by
  simp only [s1F, map_smul]

theorem s2F_smul (c : ℚ) (X : Module.End ℚ ImO) : s2F (c • X) = c • s2F X := by
  simp only [s2F, map_smul]

theorem pk1F_smul (c : ℚ) (X : Module.End ℚ ImO) : pk1F (c • X) = c • pk1F X := by
  simp only [pk1F, s1F_smul, smul_add, smul_comm c]

theorem pk2F_smul (c : ℚ) (X : Module.End ℚ ImO) : pk2F (c • X) = c • pk2F X := by
  simp only [pk2F, s2F_smul, smul_add, smul_comm c]

/-- The chain is ℚ-homogeneous. -/
theorem chainF_smul (c : ℚ) (X : Module.End ℚ ImO) : chainF (c • X) = c • chainF X := by
  simp only [chainF, pk1F_smul, pk2F_smul, map_smul]

set_option maxHeartbeats 1600000 in
/-- ★ The chain COMMUTES with every element of the banked commutant `commutantG2` (N236):
    each stage is a polynomial in the `adEnd` application. -/
theorem chainF_commutant (T : Module.End ℚ (Module.End ℚ ImO)) (hT : T ∈ commutantG2)
    (X : Module.End ℚ ImO) : T (chainF X) = chainF (T X) := by
  have had : ∀ (k : Fin 14) (Y : Module.End ℚ ImO),
      T (adEnd (DL k) Y) = adEnd (DL k) (T Y) := by
    intro k Y
    have h := congrArg (fun (S : Module.End ℚ (Module.End ℚ ImO)) => S Y) (hT (DL k))
    simpa using h.symm
  have hs1 : ∀ Y, T (s1F Y) = s1F (T Y) := by
    intro Y
    rw [s1F, had 0, had 0]; rfl
  have hs2 : ∀ Y, T (s2F Y) = s2F (T Y) := by
    intro Y
    rw [s2F, had 3, had 3]; rfl
  have hpk1 : ∀ Y, T (pk1F Y) = pk1F (T Y) := by
    intro Y
    rw [pk1F, map_add, map_add, map_smul, map_smul, hs1, hs1]
    rfl
  have hpk2 : ∀ Y, T (pk2F Y) = pk2F (T Y) := by
    intro Y
    rw [pk2F, map_add, map_add, map_smul, map_smul, hs2, hs2]
    rfl
  rw [chainF, hpk1, hpk2, had 1, had 1, hpk2, hpk1]
  rfl

/-! ## (G) THE KERNEL-CHECKED CERTIFICATES (`decide` — D2-clean, kernel-internal only;
    the kernel itself evaluates every integer matrix identity). -/

/-- The 27 basis quadrics as abstract operators. -/
def Bq (k : Fin 27) : Module.End ℚ ImO := qI (bq k)

set_option maxRecDepth 8000 in
set_option maxHeartbeats 4000000 in
/-- Each basis quadric is symmetric-traceless (integer facts by `decide`). -/
theorem Bq_mem_tracelessSym (k : Fin 27) : Bq k ∈ tracelessSym :=
  qI_mem_tracelessSym (bq k) (by revert k; decide) (by revert k; decide)

set_option maxRecDepth 8000 in
set_option maxHeartbeats 4000000 in
/-- ★★ CERTIFICATE 1 (THE PIN): the integer chain sends each basis quadric to
    `−256·tau4 k · X0m`. Kernel-checked. -/
theorem cert_pin : ∀ k : Fin 27, ∀ i j : Fin 7,
    chainM (bq k) i j = smul7 ((-256) * tau4 k) X0m i j := by decide

set_option maxRecDepth 8000 in
set_option maxHeartbeats 4000000 in
/-- ★★ CERTIFICATE 2 (THE PAIRING): `tr((words j applied to bq k) · X0m) = pairM j k`.
    Kernel-checked. -/
theorem cert_pair : ∀ j k : Fin 27,
    tr7 (mul7 (wapM (words j) (bq k)) X0m) = pairM j k := by decide

set_option maxRecDepth 8000 in
set_option maxHeartbeats 4000000 in
/-- ★★ CERTIFICATE 3 (THE PAIRING LEFT-INVERSE): `qrow · pairM = diag(sval)` with `sval ≠ 0` —
    the 27 separating functionals detect every basis coordinate. Kernel-checked. -/
theorem cert_qrow : ∀ i k : Fin 27,
    ∑ j : Fin 27, qrow i j * pairM j k = (if i = k then sval i else 0) := by decide

theorem cert_sval : ∀ i : Fin 27, sval i ≠ 0 := by decide

set_option maxRecDepth 8000 in
set_option maxHeartbeats 4000000 in
/-- ★★ CERTIFICATE 4 (THE WALK): `wden k • bq k = Σ l, wcoef k l • (words l applied to X0m)` —
    the pin target walks to a basis of the 27. Kernel-checked. -/
theorem cert_walk : ∀ k : Fin 27, ∀ i j : Fin 7,
    smul7 (wden k) (bq k) i j
      = ∑ l : Fin 27, wcoef k l * wapM (words l) X0m i j := by decide

theorem cert_wden : ∀ k : Fin 27, wden k ≠ 0 := by decide

/-- `tau4` is `4·τ0` on the basis (definitional consistency: `pairM 0 k = tau4 k` since
    `words 0 = []`). Kernel-checked. -/
theorem cert_tau4 : ∀ k : Fin 27, pairM 0 k = tau4 k := by decide

/-! ## (H) LIFTING THE CERTIFICATES TO THE ABSTRACT LEVEL. -/

/-- Matrix equality from entrywise equality. -/
theorem m7_ext {A B : M7} (h : ∀ i j : Fin 7, A i j = B i j) : A = B := by
  funext i j
  exact h i j

theorem tau0_Bq (k : Fin 27) : tau0 (Bq k) = (tau4 k : ℚ) / 4 := by
  rw [Bq, tau0_qI]
  congr 1
  have h := cert_pair 0 k
  rw [show words 0 = [] from rfl] at h
  rw [show wapM [] (bq k) = bq k from rfl] at h
  rw [h, cert_tau4]

/-- ★ The abstract pin identity on basis quadrics: `chainF (Bq k) = −1024·τ0(Bq k) · X0q`. -/
theorem chainF_Bq (k : Fin 27) : chainF (Bq k) = ((-1024 : ℚ) * tau0 (Bq k)) • X0q := by
  have hM : chainM (bq k) = smul7 ((-256) * tau4 k) X0m := m7_ext (cert_pin k)
  rw [tau0_Bq, Bq, chainF_qI, hM, qI_smul, X0q]
  congr 1
  push_cast
  ring

/-- The pairing functionals `ψ j := τ0 ∘ (words j applied)`. -/
def psi (j : Fin 27) (X : Module.End ℚ ImO) : ℚ := tau0 (wapE (words j) X)

/-- `ψ j (Bq k) = pairM j k / 4` (transport + kernel certificate). -/
theorem psi_Bq (j k : Fin 27) : psi j (Bq k) = (pairM j k : ℚ) / 4 := by
  rw [psi, Bq, wapE_qI, tau0_qI, cert_pair j k]

set_option maxHeartbeats 1600000 in
/-- ★ The basis quadrics are linearly independent (the pairing matrix is left-invertible). -/
theorem Bq_indep : LinearIndependent ℚ Bq := by
  rw [Fintype.linearIndependent_iff]
  intro g hg k
  -- ψ j kills the combination
  have hpsi : ∀ j : Fin 27, ∑ k' : Fin 27, g k' * (pairM j k' : ℚ) = 0 := by
    intro j
    have h1 : psi j (∑ k' : Fin 27, g k' • Bq k') = 0 := by
      rw [hg, psi]
      have : wapE (words j) (0 : Module.End ℚ ImO) = 0 := by
        rw [show (0 : Module.End ℚ ImO) = (0 : ℚ) • (0 : Module.End ℚ ImO) from by simp,
          wapE_smul]
        simp
      rw [this, map_zero]
    have h2 : psi j (∑ k' : Fin 27, g k' • Bq k')
        = ∑ k' : Fin 27, g k' * psi j (Bq k') := by
      rw [psi, wapE_sum, map_sum]
      refine Finset.sum_congr rfl fun k' _ => ?_
      rw [wapE_smul, map_smul, smul_eq_mul, psi]
    rw [h2] at h1
    calc ∑ k' : Fin 27, g k' * (pairM j k' : ℚ)
        = ∑ k' : Fin 27, 4 * (g k' * ((pairM j k' : ℚ) / 4)) := by
          refine Finset.sum_congr rfl fun k' _ => ?_; ring
      _ = ∑ k' : Fin 27, 4 * (g k' * psi j (Bq k')) := by
          refine Finset.sum_congr rfl fun k' _ => ?_; rw [psi_Bq]
      _ = 4 * ∑ k' : Fin 27, g k' * psi j (Bq k') := by rw [Finset.mul_sum]
      _ = 0 := by rw [h1]; ring
  -- contract with qrow k
  have hcontract : (sval k : ℚ) * g k = 0 := by
    have h3 : ∑ j : Fin 27, (qrow k j : ℚ) * ∑ k' : Fin 27, g k' * (pairM j k' : ℚ) = 0 := by
      simp only [hpsi, mul_zero, Finset.sum_const_zero]
    have hswap : ∑ j : Fin 27, (qrow k j : ℚ) * ∑ k' : Fin 27, g k' * (pairM j k' : ℚ)
        = ∑ k' : Fin 27, g k' * ((∑ j : Fin 27, qrow k j * pairM j k' : ℤ) : ℚ) := by
      calc ∑ j : Fin 27, (qrow k j : ℚ) * ∑ k' : Fin 27, g k' * (pairM j k' : ℚ)
          = ∑ j : Fin 27, ∑ k' : Fin 27, g k' * ((qrow k j : ℚ) * (pairM j k' : ℚ)) := by
            refine Finset.sum_congr rfl fun j _ => ?_
            rw [Finset.mul_sum]
            refine Finset.sum_congr rfl fun k' _ => ?_
            ring
        _ = ∑ k' : Fin 27, ∑ j : Fin 27, g k' * ((qrow k j : ℚ) * (pairM j k' : ℚ)) :=
            Finset.sum_comm
        _ = ∑ k' : Fin 27, g k' * ((∑ j : Fin 27, qrow k j * pairM j k' : ℤ) : ℚ) := by
            refine Finset.sum_congr rfl fun k' _ => ?_
            rw [← Finset.mul_sum]
            congr 1
            push_cast
            rfl
    rw [hswap] at h3
    have hdiag : ∀ k' : Fin 27,
        g k' * ((∑ j : Fin 27, qrow k j * pairM j k' : ℤ) : ℚ)
          = if k' = k then (sval k : ℚ) * g k else 0 := by
      intro k'
      rw [cert_qrow k k']
      by_cases hkk : k = k'
      · subst hkk; simp [mul_comm]
      · rw [if_neg hkk, if_neg fun h => hkk h.symm]
        simp
    rw [Finset.sum_congr rfl fun k' _ => hdiag k'] at h3
    rwa [Finset.sum_ite_eq' Finset.univ k (fun _ => (sval k : ℚ) * g k),
      if_pos (Finset.mem_univ k)] at h3
  have hs : ((sval k : ℤ) : ℚ) ≠ 0 := Int.cast_ne_zero.mpr (cert_sval k)
  exact (mul_eq_zero.mp hcontract).resolve_left hs

/-! ## (I) THE SPAN: the 27 basis quadrics EXHAUST `tracelessSym`. -/

/-- The span of the 27 independent basis quadrics is 27-dimensional, hence (inside the
    banked 27-dimensional `tracelessSym`, N228) is ALL of it. -/
theorem span_Bq_eq_tracelessSym :
    Submodule.span ℚ (Set.range Bq) = tracelessSym := by
  have hle : Submodule.span ℚ (Set.range Bq) ≤ tracelessSym := by
    rw [Submodule.span_le]
    rintro _ ⟨k, rfl⟩
    exact Bq_mem_tracelessSym k
  have hcard : Module.finrank ℚ (Submodule.span ℚ (Set.range Bq)) = 27 := by
    rw [finrank_span_eq_card Bq_indep, Fintype.card_fin]
  exact Submodule.eq_of_le_of_finrank_le hle
    (by rw [hcard, finrank_tracelessSym_eq_27])

/-- Every element of `tracelessSym` is a ℚ-combination of the basis quadrics. -/
theorem exists_Bq_combination {w : Module.End ℚ ImO} (hw : w ∈ tracelessSym) :
    ∃ g : Fin 27 → ℚ, ∑ k, g k • Bq k = w := by
  rw [← span_Bq_eq_tracelessSym] at hw
  exact (Submodule.mem_span_range_iff_exists_fun ℚ).mp hw

/-! ## (J) THE DETECTION: a nonzero element of the 27 is SEEN by some pairing functional. -/

set_option maxHeartbeats 1600000 in
/-- ★ THE SEPARATION LEMMA. If every pairing functional `ψ j = τ0 ∘ (words j applied)` kills
    `w ∈ tracelessSym`, then `w = 0`: expand `w` in the basis quadrics; `ψ j w = Σ g k'·pairM j k'/4`;
    contracting with the certificate left-inverse `qrow` isolates `sval k · g k = 0` with
    `sval k ≠ 0`, so every coordinate vanishes. -/
theorem eq_zero_of_psi_eq_zero {w : Module.End ℚ ImO} (hw : w ∈ tracelessSym)
    (hker : ∀ j : Fin 27, psi j w = 0) : w = 0 := by
  obtain ⟨g, hg⟩ := exists_Bq_combination hw
  have hcoord : ∀ k : Fin 27, g k = 0 := by
    -- ψ j w = (1/4)·Σ_k' g k' · pairM j k'
    have hpsi : ∀ j : Fin 27, ∑ k' : Fin 27, g k' * (pairM j k' : ℚ) = 0 := by
      intro j
      have h1 : psi j (∑ k' : Fin 27, g k' • Bq k') = 0 := by rw [hg]; exact hker j
      have h2 : psi j (∑ k' : Fin 27, g k' • Bq k')
          = ∑ k' : Fin 27, g k' * psi j (Bq k') := by
        rw [psi, wapE_sum, map_sum]
        refine Finset.sum_congr rfl fun k' _ => ?_
        rw [wapE_smul, map_smul, smul_eq_mul, psi]
      rw [h2] at h1
      calc ∑ k' : Fin 27, g k' * (pairM j k' : ℚ)
          = ∑ k' : Fin 27, 4 * (g k' * ((pairM j k' : ℚ) / 4)) := by
            refine Finset.sum_congr rfl fun k' _ => ?_; ring
        _ = ∑ k' : Fin 27, 4 * (g k' * psi j (Bq k')) := by
            refine Finset.sum_congr rfl fun k' _ => ?_; rw [psi_Bq]
        _ = 4 * ∑ k' : Fin 27, g k' * psi j (Bq k') := by rw [Finset.mul_sum]
        _ = 0 := by rw [h1]; ring
    intro k
    have hcontract : (sval k : ℚ) * g k = 0 := by
      have h3 : ∑ j : Fin 27, (qrow k j : ℚ) * ∑ k' : Fin 27, g k' * (pairM j k' : ℚ) = 0 := by
        simp only [hpsi, mul_zero, Finset.sum_const_zero]
      have hswap : ∑ j : Fin 27, (qrow k j : ℚ) * ∑ k' : Fin 27, g k' * (pairM j k' : ℚ)
          = ∑ k' : Fin 27, g k' * ((∑ j : Fin 27, qrow k j * pairM j k' : ℤ) : ℚ) := by
        calc ∑ j : Fin 27, (qrow k j : ℚ) * ∑ k' : Fin 27, g k' * (pairM j k' : ℚ)
            = ∑ j : Fin 27, ∑ k' : Fin 27, g k' * ((qrow k j : ℚ) * (pairM j k' : ℚ)) := by
              refine Finset.sum_congr rfl fun j _ => ?_
              rw [Finset.mul_sum]
              refine Finset.sum_congr rfl fun k' _ => ?_
              ring
          _ = ∑ k' : Fin 27, ∑ j : Fin 27, g k' * ((qrow k j : ℚ) * (pairM j k' : ℚ)) :=
              Finset.sum_comm
          _ = ∑ k' : Fin 27, g k' * ((∑ j : Fin 27, qrow k j * pairM j k' : ℤ) : ℚ) := by
              refine Finset.sum_congr rfl fun k' _ => ?_
              rw [← Finset.mul_sum]
              congr 1
              push_cast
              rfl
      rw [hswap] at h3
      have hdiag : ∀ k' : Fin 27,
          g k' * ((∑ j : Fin 27, qrow k j * pairM j k' : ℤ) : ℚ)
            = if k' = k then (sval k : ℚ) * g k else 0 := by
        intro k'
        rw [cert_qrow k k']
        by_cases hkk : k = k'
        · subst hkk; simp [mul_comm]
        · rw [if_neg hkk, if_neg fun h => hkk h.symm]
          simp
      rw [Finset.sum_congr rfl fun k' _ => hdiag k'] at h3
      rwa [Finset.sum_ite_eq' Finset.univ k (fun _ => (sval k : ℚ) * g k),
        if_pos (Finset.mem_univ k)] at h3
    have hs : ((sval k : ℤ) : ℚ) ≠ 0 := Int.cast_ne_zero.mpr (cert_sval k)
    exact (mul_eq_zero.mp hcontract).resolve_left hs
  rw [← hg]
  simp only [hcoord, zero_smul, Finset.sum_const_zero]

/-! ## (K) THE PIN, EXTENDED BY LINEARITY: `chainF = −1024·τ0(·)·X0q` on ALL of `tracelessSym`. -/

set_option maxHeartbeats 1600000 in
/-- ★ THE RANK-1 PIN on the whole 27: for every `w ∈ tracelessSym`,
    `chainF w = −1024·(τ0 w)·X0q`. Basis case = the kernel certificate (`chainF_Bq`);
    the general case follows because both sides are ℚ-linear in `w`. -/
theorem chainF_eq_pin {w : Module.End ℚ ImO} (hw : w ∈ tracelessSym) :
    chainF w = ((-1024 : ℚ) * tau0 w) • X0q := by
  obtain ⟨g, hg⟩ := exists_Bq_combination hw
  rw [← hg, chainF_sum]
  have hL : ∀ k : Fin 27, chainF (g k • Bq k) = ((-1024 : ℚ) * (g k * tau0 (Bq k))) • X0q := by
    intro k
    rw [chainF_smul, chainF_Bq, smul_smul]
    congr 1
    ring
  rw [Finset.sum_congr rfl fun k _ => hL k]
  have hT : tau0 (∑ k : Fin 27, g k • Bq k) = ∑ k : Fin 27, g k * tau0 (Bq k) := by
    rw [map_sum]
    refine Finset.sum_congr rfl fun k _ => ?_
    rw [map_smul, smul_eq_mul]
  rw [hT, Finset.mul_sum, ← Finset.sum_smul]

/-! ## (L) THE CAPTURE: every nonzero invariant subspace of the 27 contains the pin target. -/

set_option maxHeartbeats 1600000 in
/-- ★★ THE PIN CAPTURE. If `W ≤ tracelessSym` is `adEnd`-invariant and contains a nonzero
    element, then `X0q ∈ W`: some word carries the element to positive `τ0`-detection
    (separation lemma), and the pin chain — a polynomial in the banked action, hence
    `W`-preserving — maps that carrier to a NONZERO multiple of `X0q`. -/
theorem X0q_mem_of_invariant (W : Submodule ℚ (Module.End ℚ ImO)) (hWle : W ≤ tracelessSym)
    (hWinv : ∀ (D : derivationLieQ) (X : Module.End ℚ ImO), X ∈ W → adEnd D X ∈ W)
    {w : Module.End ℚ ImO} (hwW : w ∈ W) (hwne : w ≠ 0) : X0q ∈ W := by
  -- some pairing functional detects w
  have hdet : ∃ j : Fin 27, psi j w ≠ 0 := by
    by_contra hall
    exact hwne (eq_zero_of_psi_eq_zero (hWle hwW)
      fun j => not_not.mp fun hj => hall ⟨j, hj⟩)
  obtain ⟨j, hj⟩ := hdet
  -- the carried element w' = words j applied to w: in W, still in tracelessSym, τ0-detected
  set w' : Module.End ℚ ImO := wapE (words j) w with hw'
  have hw'W : w' ∈ W := wapE_mem (words j) W hWinv w hwW
  have hw'ts : w' ∈ tracelessSym := hWle hw'W
  have htau : tau0 w' ≠ 0 := hj
  -- pin: chainF w' = −1024·(τ0 w')·X0q ∈ W, with nonzero coefficient
  have hpin : chainF w' = ((-1024 : ℚ) * tau0 w') • X0q := chainF_eq_pin hw'ts
  have hchainW : chainF w' ∈ W := chainF_mem W hWinv w' hw'W
  rw [hpin] at hchainW
  have hc : ((-1024 : ℚ) * tau0 w') ≠ 0 :=
    mul_ne_zero (by norm_num) htau
  have := W.smul_mem ((-1024 : ℚ) * tau0 w')⁻¹ hchainW
  rwa [smul_smul, inv_mul_cancel₀ hc, one_smul] at this

/-! ## (M) THE WALK: from the pin target, the banked action REBUILDS all of the 27. -/

/-- `qI` of the zero matrix. -/
theorem qI_zero : qI (0 : M7) = 0 := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show qZ (0 : M7) (x : O ℚ) = ((0 : Module.End ℚ ImO) x : O ℚ)
  ext <;> simp [qZ, c1, c2, c3, c4, c5, c6, c7]

/-- Pointwise matrix addition IS pi-type addition. -/
theorem add7_eq (A B : M7) : add7 A B = A + B := rfl

set_option maxHeartbeats 1600000 in
/-- `qI` is additive over finite sums of integer matrices. -/
theorem qI_sumF {ι : Type*} (s : Finset ι) (f : ι → M7) :
    qI (∑ l ∈ s, f l) = ∑ l ∈ s, qI (f l) := by
  classical
  induction s using Finset.cons_induction with
  | empty => simpa using qI_zero
  | cons a s ha ih =>
    rw [Finset.sum_cons, Finset.sum_cons, ← ih, ← add7_eq, qI_add]

set_option maxHeartbeats 1600000 in
/-- ★ The walk identity, lifted: `wden k • Bq k = Σ l, wcoef k l • (words l applied to X0q)`
    (kernel certificate 4 transported through `qI`). -/
theorem walk_Bq (k : Fin 27) :
    (wden k : ℚ) • Bq k = ∑ l : Fin 27, (wcoef k l : ℚ) • wapE (words l) X0q := by
  -- matrix identity from the kernel certificate
  have hM : smul7 (wden k) (bq k)
      = ∑ l : Fin 27, smul7 (wcoef k l) (wapM (words l) X0m) := by
    refine m7_ext fun i j => ?_
    rw [cert_walk k i j]
    have : (∑ l : Fin 27, smul7 (wcoef k l) (wapM (words l) X0m)) i j
        = ∑ l : Fin 27, wcoef k l * wapM (words l) X0m i j := by
      rw [Finset.sum_apply, Finset.sum_apply]
      rfl
    rw [this]
  -- transport through qI
  have hq := congrArg qI hM
  rw [qI_smul, qI_sumF] at hq
  rw [show Bq k = qI (bq k) from rfl, hq]
  refine Finset.sum_congr rfl fun l _ => ?_
  rw [qI_smul, show X0q = qI X0m from rfl, wapE_qI]

set_option maxHeartbeats 1600000 in
/-- ★★ THE WALK CAPTURE. Any `adEnd`-invariant subspace containing `X0q` contains every basis
    quadric, hence all of `tracelessSym`. -/
theorem tracelessSym_le_of_X0q_mem (W : Submodule ℚ (Module.End ℚ ImO))
    (hWinv : ∀ (D : derivationLieQ) (X : Module.End ℚ ImO), X ∈ W → adEnd D X ∈ W)
    (hX0 : X0q ∈ W) : tracelessSym ≤ W := by
  have hBq : ∀ k : Fin 27, Bq k ∈ W := by
    intro k
    have hsum : (∑ l : Fin 27, (wcoef k l : ℚ) • wapE (words l) X0q) ∈ W :=
      Submodule.sum_mem W fun l _ =>
        W.smul_mem _ (wapE_mem (words l) W hWinv X0q hX0)
    have hwd : ((wden k : ℤ) : ℚ) ≠ 0 := Int.cast_ne_zero.mpr (cert_wden k)
    have hin : (wden k : ℚ) • Bq k ∈ W := by rw [walk_Bq k]; exact hsum
    have := W.smul_mem ((wden k : ℚ))⁻¹ hin
    rwa [smul_smul, inv_mul_cancel₀ hwd, one_smul] at this
  intro w hw
  obtain ⟨g, hg⟩ := exists_Bq_combination hw
  rw [← hg]
  exact Submodule.sum_mem W fun k _ => W.smul_mem _ (hBq k)

/-! ## (N) ★★★ THE HEADLINE: THE 27 IS IRREDUCIBLE. -/

set_option maxHeartbeats 1600000 in
/-- ★★★ N234 HEADLINE — THE IRREDUCIBLE 27. The banked traceless-symmetric summand
    `tracelessSym` (N228, dim 27) has NO proper nonzero `adEnd`-invariant subspace: any
    invariant `W ≤ tracelessSym` with `0 < dim W < 27` is impossible. PIN + WALK: a nonzero
    element is τ0-detected after some banked word (separation), the pin chain — a polynomial
    in the banked g₂-action — collapses the carrier onto the single quadric `X0q ∈ W`, and
    the walk rebuilds ALL 27 dimensions inside `W`, contradicting `dim W < 27`. -/
theorem tracelessSym_no_proper_invariant
    (W : Submodule ℚ (Module.End ℚ ImO)) (hWle : W ≤ tracelessSym)
    (hWinv : ∀ (D : derivationLieQ) (X : Module.End ℚ ImO), X ∈ W → adEnd D X ∈ W)
    (hd0 : 0 < Module.finrank ℚ W) (hdlt : Module.finrank ℚ W < 27) : False := by
  -- a nonzero element exists
  have hbot : W ≠ ⊥ := by
    intro h
    rw [h, finrank_bot] at hd0
    exact lt_irrefl 0 hd0
  obtain ⟨w, hwW, hwne⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hbot
  -- pin capture then walk capture
  have hX0 : X0q ∈ W := X0q_mem_of_invariant W hWle hWinv hwW hwne
  have hle : tracelessSym ≤ W := tracelessSym_le_of_X0q_mem W hWinv hX0
  have heq : W = tracelessSym := le_antisymm hWle hle
  rw [heq, finrank_tracelessSym_eq_27] at hdlt
  exact lt_irrefl 27 hdlt

set_option maxHeartbeats 1600000 in
/-- ★★★ THE COMPLETE CLEBSCH–GORDAN ATOMICITY: all FOUR summands of the banked internal
    direct sum `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` (N233 `fourSummands`) are IRREDUCIBLE `adEnd`-modules —
    the three known atoms by the banked N238 toolkit, the 27 by THIS node's pin+walk. The
    gather's tear decomposes into EXACTLY four irreducible g₂-utterances, none further divisible. -/
theorem fourSummands_irreducible
    (i : Fin 4)
    (W : Submodule ℚ (Module.End ℚ ImO)) (hWle : W ≤ fourSummands i)
    (hWinv : ∀ (D : derivationLieQ) (X : Module.End ℚ ImO), X ∈ W → adEnd D X ∈ W)
    (hd0 : 0 < Module.finrank ℚ W)
    (hdlt : Module.finrank ℚ W < Module.finrank ℚ (fourSummands i)) : False := by
  by_cases hi : i = 3
  · subst hi
    have e : fourSummands (3 : Fin 4) = tracelessSym := rfl
    rw [e] at hWle hdlt
    rw [show Module.finrank ℚ tracelessSym = 27 from finrank_tracelessSym_eq_27] at hdlt
    exact tracelessSym_no_proper_invariant W hWle hWinv hd0 hdlt
  · exact three_known_summands_no_proper_invariant i hi W hWle hWinv hd0 hdlt

/-! ## (O) ★★ THE SCHUR STRENGTHENING: commutant elements act on the 27 as EXPLICIT scalars. -/

set_option maxHeartbeats 1600000 in
/-- ★★ SCHUR ON THE 27, CONSTRUCTIVE FORM. Every element `T` of the banked commutant
    `commutantG2` (N236) that PRESERVES `tracelessSym` acts on it as the EXPLICIT scalar
    `τ0 (T X0q)`: `T` commutes with the pin chain, so `T X0q` is pinned back to
    `(τ0 (T X0q))·X0q`; the walk propagates the scalar to every basis quadric; linearity to
    all of the 27. Over ℚ abstract Schur yields only a division algebra — the PIN yields the
    full scalar theorem, constructively. -/
theorem commutant_scalar_on_tracelessSym
    (T : Module.End ℚ (Module.End ℚ ImO)) (hT : T ∈ commutantG2)
    (hpres : ∀ w ∈ tracelessSym, T w ∈ tracelessSym) :
    ∀ w ∈ tracelessSym, T w = tau0 (T X0q) • w := by
  -- Step 1: T X0q is itself pinned: chainF X0q = −1024·τ0(X0q)·X0q with τ0(X0q)=1... use
  -- the cleaner route: T X0q ∈ tracelessSym, and chainF (T X0q) = T (chainF X0q).
  have hX0ts : X0q ∈ tracelessSym := X0q_mem_tracelessSym
  have hTX0 : T X0q ∈ tracelessSym := hpres X0q hX0ts
  -- τ0(X0q) = 1 (kernel: tr(X0m·X0m) = 4)
  have htau0X0 : tau0 X0q = 1 := by
    rw [show X0q = qI X0m from rfl, tau0_qI,
      show tr7 (mul7 X0m X0m) = 4 from by decide]
    norm_num
  -- chainF X0q = −1024·X0q
  have hchainX0 : chainF X0q = (-1024 : ℚ) • X0q := by
    rw [chainF_eq_pin hX0ts, htau0X0, mul_one]
  -- pin T X0q: chainF (T X0q) = −1024·τ0(T X0q)·X0q; also = T (chainF X0q) = −1024·T X0q
  have hpinT : ((-1024 : ℚ) * tau0 (T X0q)) • X0q = (-1024 : ℚ) • T X0q := by
    have h1 : chainF (T X0q) = ((-1024 : ℚ) * tau0 (T X0q)) • X0q := chainF_eq_pin hTX0
    have h2 : chainF (T X0q) = T (chainF X0q) := (chainF_commutant T hT X0q).symm
    rw [h2, hchainX0, map_smul] at h1
    exact h1.symm
  -- so T X0q = τ0(T X0q)·X0q
  set c : ℚ := tau0 (T X0q) with hc
  have hTX0eq : T X0q = c • X0q := by
    have h := hpinT
    rw [mul_smul] at h
    have := smul_right_injective (Module.End ℚ ImO) (by norm_num : (-1024 : ℚ) ≠ 0)
    exact (this h).symm
  -- Step 2: propagate along the walk: T (wapE w X0q) = c • wapE w X0q for every word
  have hword : ∀ w : List (Fin 14), T (wapE w X0q) = c • wapE w X0q := by
    intro w
    induction w with
    | nil => exact hTX0eq
    | cons g w ih =>
      have hcomm : T (adEnd (DL g) (wapE w X0q)) = adEnd (DL g) (T (wapE w X0q)) := by
        have h := congrArg (fun (S : Module.End ℚ (Module.End ℚ ImO)) => S (wapE w X0q))
          (hT (DL g))
        simpa using h.symm
      show T (adEnd (DL g) (wapE w X0q)) = c • adEnd (DL g) (wapE w X0q)
      rw [hcomm, ih, map_smul]
  -- Step 3: propagate to the basis quadrics through the walk identity
  have hBq : ∀ k : Fin 27, T (Bq k) = c • Bq k := by
    intro k
    have hwd : ((wden k : ℤ) : ℚ) ≠ 0 := Int.cast_ne_zero.mpr (cert_wden k)
    have h1 : T ((wden k : ℚ) • Bq k) = c • ((wden k : ℚ) • Bq k) := by
      rw [walk_Bq k, map_sum, Finset.smul_sum]
      refine Finset.sum_congr rfl fun l _ => ?_
      rw [map_smul, hword (words l), smul_comm]
    rw [map_smul] at h1
    have h2 : (wden k : ℚ) • T (Bq k) = (wden k : ℚ) • (c • Bq k) := by
      rw [h1, smul_comm]
    exact smul_right_injective (Module.End ℚ ImO) hwd h2
  -- Step 4: linearity to all of tracelessSym
  intro w hw
  obtain ⟨g, hg⟩ := exists_Bq_combination hw
  rw [← hg, map_sum, Finset.smul_sum]
  refine Finset.sum_congr rfl fun k _ => ?_
  rw [map_smul, hBq k, smul_comm]

/-! ## (P) W8 NON-VACUITY TEETH. -/

/-- The pin functional genuinely detects: `τ0 X0q = 1 ≠ 0`. -/
theorem tau0_X0q_ne_zero : tau0 X0q ≠ 0 := by
  rw [show X0q = qI X0m from rfl, tau0_qI,
    show tr7 (mul7 X0m X0m) = 4 from by decide]
  norm_num

set_option maxHeartbeats 1600000 in
/-- The pin chain genuinely moves: `chainF X0q = −1024·X0q ≠ 0` (the banked action is
    NOT vacuous on the 27). -/
theorem chainF_X0q_ne_zero : chainF X0q ≠ 0 := by
  have h : chainF X0q = ((-1024 : ℚ) * tau0 X0q) • X0q := chainF_eq_pin X0q_mem_tracelessSym
  rw [h]
  intro hz
  have hc : ((-1024 : ℚ) * tau0 X0q) ≠ 0 :=
    mul_ne_zero (by norm_num) tau0_X0q_ne_zero
  rcases smul_eq_zero.mp hz with h1 | h2
  · exact hc h1
  · exact X0q_ne_zero h2

/-! ## CAPSTONE. -/

/-- ★★★ N234 CAPSTONE — THE GENUINE CLEBSCH–GORDAN. On the banked tower (`O ℚ = CD (H ℚ)`,
    `ImO` the fundamental 7, `adEnd` the banked g₂ = Der(O ℚ) action on `End ℚ ImO = 7 ⊗ 7`):
    (1) the 27 (`tracelessSym`) is IRREDUCIBLE — no proper nonzero invariant subspace;
    (2) ALL FOUR summands of the banked internal direct sum `1 ⊕ 7 ⊕ 14 ⊕ 27` are irreducible;
    (3) every banked-commutant element preserving the 27 acts on it as an explicit scalar
    (constructive Schur). The gather's tear at the octonion rung decomposes into EXACTLY four
    irreducible g₂-utterances. -/
theorem irreducible27_structure :
    (∀ (W : Submodule ℚ (Module.End ℚ ImO)), W ≤ tracelessSym →
      (∀ (D : derivationLieQ) (X : Module.End ℚ ImO), X ∈ W → adEnd D X ∈ W) →
      0 < Module.finrank ℚ W → Module.finrank ℚ W < 27 → False) ∧
    (∀ (i : Fin 4) (W : Submodule ℚ (Module.End ℚ ImO)), W ≤ fourSummands i →
      (∀ (D : derivationLieQ) (X : Module.End ℚ ImO), X ∈ W → adEnd D X ∈ W) →
      0 < Module.finrank ℚ W → Module.finrank ℚ W < Module.finrank ℚ (fourSummands i) → False) ∧
    (∀ (T : Module.End ℚ (Module.End ℚ ImO)), T ∈ commutantG2 →
      (∀ w ∈ tracelessSym, T w ∈ tracelessSym) →
      ∀ w ∈ tracelessSym, T w = tau0 (T X0q) • w) :=
  ⟨tracelessSym_no_proper_invariant, fourSummands_irreducible,
    commutant_scalar_on_tracelessSym⟩

end

end Phys.Algebra
