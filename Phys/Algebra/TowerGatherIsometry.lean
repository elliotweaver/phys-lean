/-
  N257 — THE GATHER ISOMETRY: `crossEmb` pulls the fold's Born self-overlap form back to the
  so(7) endomorphism trace form up to the universal scale −6.

  Over the fundamental 7 = `ImO` of the DERIVED octonion rung `O ℚ = CD (H ℚ)`, the gather
  embedding `crossEmb : ImO →ₗ End ℚ ImO`, `a ↦ crossOp a` (N225, faithful — Born positivity /
  self-blindness), is a SCALED ISOMETRY from the fold's Born self-overlap form
  `gForm (v,w) = reQ (v · star w)` to the so(7) trace form `traceForm7 A C = trace (A ∘ C)`:

      ★★★  gather_isometry :  ∀ a b : ImO,
             traceForm7 (crossOp ↑a) (crossOp ↑b) = -6 * gForm ↑a ↑b        (`crossEmb^* B = −6·gForm`)

  THE ONE CAUSE (docs/SOUL — one fold cause forces several properties AT ONCE). N253/N255/N256 read
  off INDIVIDUAL invariant lengths / orthogonalities of the two forced U(1) generators one
  operator-pair at a time. Those are all SHADOWS of ONE identity: the gather embedding inherits the
  fold's Born metric with a single universal scale −6. From `gather_isometry` the whole neutral-sector
  Gram collapses instantly:
    ★  `B_chargeOp_chargeOp_via_isometry` : `traceForm7 chargeOp chargeOp = -6`  (a=b=u1, |u1|²=1;
       RE-DERIVES N253's specific value as the `a=b=u1` instance — unifies, does not re-pin: the
       general `∀ a b` identity is the NEW object),
    ★  `B_hyperOp_hyperOp` : `traceForm7 hyperOp hyperOp = -6`   (a=b=κO 1, |κO 1|²=1; hyperOp's
       invariant length EQUALS chargeOp's — the two forced U(1)s equinormalized),
    ★  `B_chargeOp_hyperOp` : `traceForm7 chargeOp hyperOp = 0`   (u1 ⟂ κO 1 in gForm; the two
       forced U(1) directions ORTHOGONAL) — so charge and hypercharge are an ORTHONORMAL pair,
       forced by the fold metric, not chosen.
    ★★★ capstone `gather_isometry_structure` (isometry ∧ hyperOp length −6 ∧ charge⟂hyper ∧ −6 ≠ 0).

  WHY (fold-causal, one arrow per step). fold = self-look-back → Born self-overlap `gForm` is the
  fold's positive metric (N5b/N24) → self-blindness forces the gather tear `crossEmb`, FAITHFUL from
  Born positivity (N225) → the invariant trace form on so(7) is unique-up-to-scale (Schur, `ImO`
  g₂-irreducible N234) → `crossEmb` must pull `B` back to a scalar multiple of the ONLY invariant
  form on the 7 = `gForm`; the scale −6 is FORCED (computed on the banked integer structure matrices,
  not chosen).

  THE ROUTE (THE ONE LAW / W9-DECOMPOSED — banked machinery only, mirrors N253/N256). Both sides are
  ℚ-BILINEAR forms on `ImO`: LHS `lhsBil` = `traceBil` (the bundled `trace ∘ mul`) precomposed with
  `crossEmb` on both arguments; RHS `rhsBil` = `-6 • bornBil` (the banked bundled Born form,
  `bornBil a b = gForm ↑a ↑b`). Equal bilinear forms iff equal on the banked basis `bb` (N234). On
  basis vectors `crossOp (imBasis i) = qI (Km i)` for 7 explicit integer structure matrices `Km i`
  (the 7 bridges `br0..br6`, each the banked `chargeOp_eq_qI` coordinate tactic — decomposed into
  SEVEN separate lemmas to stay inside the compile budget, W9; a single `fin_cases i <;> ·` over all
  7 blows the heartbeat ceiling), and `traceForm7 (qI (Km i)) (qI (Km j)) = tr7 (mul7 (Km i) (Km j))`
  (banked `traceForm7_qI`) `= -6·δ_ij` by `decide` on integers, matched to `gForm (imBasis i)
  (imBasis j) = δ_ij` (`gForm_imBasis`). NO coordinate bash of the non-associative `O ℚ` product
  beyond the banked per-unit bridge tactic; NO compiled-kernel decision bypass; `decide` only on
  integer 7×7 `tr7 (mul7 …)`; NO proof-kernel `maxHeartbeats` raise (the `synthInstance.maxHeartbeats`
  bump is instance-search only, the banked N253/N256 precedent).

  SCOPE — HONESTY CLAUSE (respects the ≥6× hypercharge-normalization deferral). Banks the
  convention-free pullback SCALE (−6) + the collapsed neutral Gram (equal length + orthogonality of
  the two forced U(1)s) ONLY. Does NOT claim the physical weak MIXING ANGLE / running couplings /
  Gell-Mann–Nishijima `Q = T3 + Y/2` (numerically FALSE as a span here: `chargeOp ∉ span{imRep DI,
  hyperOp}`, `⁅chargeOp, hyperOp⁆ ≠ 0`). This node supplies the convention-free METRIC the angle will
  eventually sit in, without positing it.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / hypercharge / isospin / gauge / weak /
  U(1) / normalization / mixing": what remains — over the derived field ℚ and `O ℚ = CD (H ℚ)`, for
  `ImO = ker (star + 1)`, the Born form `gForm v w = reQ (v · star w)`, and the cross-product
  embedding `crossOp a = (octCross a ·)|ImO` — is the pure statement that the endomorphism trace form
  `trace (crossOp a ∘ crossOp b)` equals `-6 · gForm ↑a ↑b` for all `a b ∈ ImO`, hence
  `trace (crossOp u1 ∘ crossOp u1) = trace (crossOp (κO 1) ∘ crossOp (κO 1)) = -6` and
  `trace (crossOp u1 ∘ crossOp (κO 1)) = 0`. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N256 (`TowerGatherUniqueIsospinFixedAxis`), which transitively
  supplies `crossOp`/`crossEmb`/`crossEmb_apply` (N223/N225), `qI`/`qZ`/`M7`/`qI_comp`/`tr7`/`mul7`/
  `trace_qI` (N234), `traceForm7`/`traceForm7_qI` (N253), `imBasis`/`e2O..e7O`/`u1` (N223/N40),
  `bb`/`bvec` (N234), `bornBil`/`bornBil_apply` (N225), `chargeOp` (N240), `hyperOp`/`kappaO` (N255/
  N189), `reQ_ImO_zero` (N208), `gForm` (N24), and standard Mathlib linear-algebra / bilinear /
  trace / `Fin`-matrix MACHINERY. Ground = derived ℚ; NO Mathlib number/algebra as content; nothing
  posited but the fold; no bridge. Owner-authorized gather-side hypercharge front (ROADMAP
  §TEMPORARY PRIORITY LOCK, owner authorization 2026-07-01); gather-native (`crossEmb` = the N225
  gather-tear embedding); did NOT resume the parked J₃(O) invariant-tower ASCENT.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no native-kernel bypass, no bridge.
-/
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

noncomputable section

/-! ## (A) The 7 integer structure matrices `Km i` = matrix of `crossOp (imBasis i)`. -/

def Km0 : M7 := ![![0,0,0,0,0,0,0],![0,0,-1,0,0,0,0],![0,1,0,0,0,0,0],![0,0,0,0,-1,0,0],![0,0,0,1,0,0,0],![0,0,0,0,0,0,1],![0,0,0,0,0,-1,0]]
def Km1 : M7 := ![![0,0,1,0,0,0,0],![0,0,0,0,0,0,0],![-1,0,0,0,0,0,0],![0,0,0,0,0,-1,0],![0,0,0,0,0,0,-1],![0,0,0,1,0,0,0],![0,0,0,0,1,0,0]]
def Km2 : M7 := ![![0,-1,0,0,0,0,0],![1,0,0,0,0,0,0],![0,0,0,0,0,0,0],![0,0,0,0,0,0,-1],![0,0,0,0,0,1,0],![0,0,0,0,-1,0,0],![0,0,0,1,0,0,0]]
def Km3 : M7 := ![![0,0,0,0,1,0,0],![0,0,0,0,0,1,0],![0,0,0,0,0,0,1],![0,0,0,0,0,0,0],![-1,0,0,0,0,0,0],![0,-1,0,0,0,0,0],![0,0,-1,0,0,0,0]]
def Km4 : M7 := ![![0,0,0,-1,0,0,0],![0,0,0,0,0,0,1],![0,0,0,0,0,-1,0],![1,0,0,0,0,0,0],![0,0,0,0,0,0,0],![0,0,1,0,0,0,0],![0,-1,0,0,0,0,0]]
def Km5 : M7 := ![![0,0,0,0,0,0,-1],![0,0,0,-1,0,0,0],![0,0,0,0,1,0,0],![0,1,0,0,0,0,0],![0,0,-1,0,0,0,0],![0,0,0,0,0,0,0],![1,0,0,0,0,0,0]]
def Km6 : M7 := ![![0,0,0,0,0,1,0],![0,0,0,0,-1,0,0],![0,0,0,-1,0,0,0],![0,0,1,0,0,0,0],![0,1,0,0,0,0,0],![-1,0,0,0,0,0,0],![0,0,0,0,0,0,0]]

/-- `Km : Fin 7 → M7`, the structure-matrix family. -/
def Km : Fin 7 → M7 := ![Km0, Km1, Km2, Km3, Km4, Km5, Km6]

/-! ## (B) The 7 bridges `crossOp (imBasis i) = qI (Km i)` — decomposed per-`i` (W9 compile budget). -/

theorem br0 : crossOp (imBasis 0) = qI Km0 := by
  show crossOp u1 = qI Km0
  apply LinearMap.ext; intro x; apply Subtype.ext
  have hx0 : ((x : O ℚ)).re.re.re = 0 := reQ_ImO_zero x.2
  show (crossOpO u1 (x : O ℚ)) = qZ Km0 (x : O ℚ)
  ext <;>
    simp only [crossOpO, octCross, qZ, Km0, u1, e2O, e3O, e4O, e5O, e6O, e7O,
      c0, c1, c2, c3, c4, c5, c6, c7, gForm, reQ, hx0, CD.iota, Dbl.J,
      sub_eq_add_neg, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, smul_eq_mul,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

theorem br1 : crossOp (imBasis 1) = qI Km1 := by
  show crossOp e2O = qI Km1
  apply LinearMap.ext; intro x; apply Subtype.ext
  have hx0 : ((x : O ℚ)).re.re.re = 0 := reQ_ImO_zero x.2
  show (crossOpO e2O (x : O ℚ)) = qZ Km1 (x : O ℚ)
  ext <;>
    simp only [crossOpO, octCross, qZ, Km1, u1, e2O, e3O, e4O, e5O, e6O, e7O,
      c0, c1, c2, c3, c4, c5, c6, c7, gForm, reQ, hx0, CD.iota, Dbl.J,
      sub_eq_add_neg, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, smul_eq_mul,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

theorem br2 : crossOp (imBasis 2) = qI Km2 := by
  show crossOp e3O = qI Km2
  apply LinearMap.ext; intro x; apply Subtype.ext
  have hx0 : ((x : O ℚ)).re.re.re = 0 := reQ_ImO_zero x.2
  show (crossOpO e3O (x : O ℚ)) = qZ Km2 (x : O ℚ)
  ext <;>
    simp only [crossOpO, octCross, qZ, Km2, u1, e2O, e3O, e4O, e5O, e6O, e7O,
      c0, c1, c2, c3, c4, c5, c6, c7, gForm, reQ, hx0, CD.iota, Dbl.J,
      sub_eq_add_neg, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, smul_eq_mul,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

theorem br3 : crossOp (imBasis 3) = qI Km3 := by
  show crossOp e4O = qI Km3
  apply LinearMap.ext; intro x; apply Subtype.ext
  have hx0 : ((x : O ℚ)).re.re.re = 0 := reQ_ImO_zero x.2
  show (crossOpO e4O (x : O ℚ)) = qZ Km3 (x : O ℚ)
  ext <;>
    simp only [crossOpO, octCross, qZ, Km3, u1, e2O, e3O, e4O, e5O, e6O, e7O,
      c0, c1, c2, c3, c4, c5, c6, c7, gForm, reQ, hx0, CD.iota, Dbl.J,
      sub_eq_add_neg, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, smul_eq_mul,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

theorem br4 : crossOp (imBasis 4) = qI Km4 := by
  show crossOp e5O = qI Km4
  apply LinearMap.ext; intro x; apply Subtype.ext
  have hx0 : ((x : O ℚ)).re.re.re = 0 := reQ_ImO_zero x.2
  show (crossOpO e5O (x : O ℚ)) = qZ Km4 (x : O ℚ)
  ext <;>
    simp only [crossOpO, octCross, qZ, Km4, u1, e2O, e3O, e4O, e5O, e6O, e7O,
      c0, c1, c2, c3, c4, c5, c6, c7, gForm, reQ, hx0, CD.iota, Dbl.J,
      sub_eq_add_neg, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, smul_eq_mul,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

theorem br5 : crossOp (imBasis 5) = qI Km5 := by
  show crossOp e6O = qI Km5
  apply LinearMap.ext; intro x; apply Subtype.ext
  have hx0 : ((x : O ℚ)).re.re.re = 0 := reQ_ImO_zero x.2
  show (crossOpO e6O (x : O ℚ)) = qZ Km5 (x : O ℚ)
  ext <;>
    simp only [crossOpO, octCross, qZ, Km5, u1, e2O, e3O, e4O, e5O, e6O, e7O,
      c0, c1, c2, c3, c4, c5, c6, c7, gForm, reQ, hx0, CD.iota, Dbl.J,
      sub_eq_add_neg, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, smul_eq_mul,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

theorem br6 : crossOp (imBasis 6) = qI Km6 := by
  show crossOp e7O = qI Km6
  apply LinearMap.ext; intro x; apply Subtype.ext
  have hx0 : ((x : O ℚ)).re.re.re = 0 := reQ_ImO_zero x.2
  show (crossOpO e7O (x : O ℚ)) = qZ Km6 (x : O ℚ)
  ext <;>
    simp only [crossOpO, octCross, qZ, Km6, u1, e2O, e3O, e4O, e5O, e6O, e7O,
      c0, c1, c2, c3, c4, c5, c6, c7, gForm, reQ, hx0, CD.iota, Dbl.J,
      sub_eq_add_neg, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, smul_eq_mul,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

/-- The assembled family bridge: `crossOp (imBasis i) = qI (Km i)` for all `i`. -/
theorem crossOp_imBasis_eq_qI (i : Fin 7) : crossOp (imBasis i) = qI (Km i) := by
  fin_cases i
  · exact br0
  · exact br1
  · exact br2
  · exact br3
  · exact br4
  · exact br5
  · exact br6

/-! ## (C) `gForm` orthonormality on the imaginary basis. -/

/-- The imaginary coordinate frame is `gForm`-orthonormal: `gForm (imBasis i) (imBasis j) = δ_ij`. -/
theorem gForm_imBasis (i j : Fin 7) :
    gForm (imBasis i) (imBasis j) = (if i = j then 1 else 0) := by
  fin_cases i <;> fin_cases j <;>
    simp only [imBasis, Matrix.cons_val_zero, Matrix.cons_val, Matrix.head_cons, gForm, reQ,
      u1, e2O, e3O, e4O, e5O, e6O, e7O, CD.iota, Dbl.J,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im] <;> norm_num

/-! ## (D) The two sides as bundled bilinear forms on `ImO`. -/

/-- The endomorphism trace form `trace (A ∘ C)` bundled as a bilinear map. -/
def traceBil : Module.End ℚ ImO →ₗ[ℚ] Module.End ℚ ImO →ₗ[ℚ] ℚ :=
  LinearMap.compr₂ (LinearMap.mul ℚ (Module.End ℚ ImO)) (LinearMap.trace ℚ ImO)

theorem traceBil_apply (A C : Module.End ℚ ImO) : traceBil A C = traceForm7 A C := rfl

/-- LHS bilinear form: `a b ↦ traceForm7 (crossEmb a) (crossEmb b)`. -/
def lhsBil : ImO →ₗ[ℚ] ImO →ₗ[ℚ] ℚ := (traceBil.comp crossEmb).compl₂ crossEmb

theorem lhsBil_apply (a b : ImO) : lhsBil a b = traceForm7 (crossEmb a) (crossEmb b) := rfl

/-- RHS bilinear form: `-6 • bornBil` (the banked Born form, `bornBil a b = gForm ↑a ↑b`). -/
def rhsBil : ImO →ₗ[ℚ] ImO →ₗ[ℚ] ℚ := (-6 : ℚ) • (bornBil : ImO →ₗ[ℚ] ImO →ₗ[ℚ] ℚ)

theorem rhsBil_apply (a b : ImO) : rhsBil a b = -6 * gForm (a : O ℚ) (b : O ℚ) := by
  simp only [rhsBil, LinearMap.smul_apply, bornBil_apply, smul_eq_mul]

/-- `(bb i : O ℚ) = imBasis i` (the banked basis `bb = Basis.mk bvec` unfolds to `imBasis`). -/
theorem bb_coe (i : Fin 7) : ((bb i : ImO) : O ℚ) = imBasis i := by
  have hb : bb i = bvec i := Module.Basis.mk_apply bvec_indep bvec_span i
  rw [hb]; rfl

/-! ## (E) THE REDUCTION and THE HEADLINE. -/

/-- The two bilinear forms agree — proved on the banked basis `bb` (bilinearity + basis extension). -/
theorem lhsBil_eq_rhsBil : lhsBil = rhsBil := by
  apply Module.Basis.ext bb; intro i
  apply Module.Basis.ext bb; intro j
  show traceForm7 (crossEmb (bb i)) (crossEmb (bb j)) = (-6 : ℚ) • bornBil (bb i) (bb j)
  rw [crossEmb_apply, crossEmb_apply, bb_coe, bb_coe, bornBil_apply, bb_coe, bb_coe,
      crossOp_imBasis_eq_qI, crossOp_imBasis_eq_qI, traceForm7_qI, gForm_imBasis]
  fin_cases i <;> fin_cases j <;> simp only [Km, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val, Matrix.head_cons] <;> norm_num <;> decide

/-- ★★★ THE GATHER ISOMETRY: `crossEmb` pulls the Born form back to the trace form, scale −6. -/
theorem gather_isometry (a b : ImO) :
    traceForm7 (crossOp (a : O ℚ)) (crossOp (b : O ℚ)) = -6 * gForm (a : O ℚ) (b : O ℚ) := by
  have h : lhsBil a b = rhsBil a b := by rw [lhsBil_eq_rhsBil]
  rw [lhsBil_apply] at h
  rw [crossEmb_apply, crossEmb_apply] at h
  rw [h, rhsBil_apply]

/-! ## (F) The neutral-sector Gram collapse — corollaries of the ONE cause. -/

/-- `κO 1 ∈ ImO` (the banked isospin-fixed unit as an `ImO` element). -/
noncomputable def kap1O : ImO := ⟨kappaO 1, kappaO_one_mem_ImO⟩

theorem kap1O_coe : (kap1O : O ℚ) = kappaO 1 := rfl

/-- `u1 ∈ ImO` (the banked colour-fixed unit as an `ImO` element). -/
noncomputable def u1I : ImO := ⟨u1, u1_mem_ImO⟩

theorem u1I_coe : (u1I : O ℚ) = u1 := rfl

/-- ★ RE-DERIVATION of N253's charge length as the `a = b = u1` instance of the isometry. -/
theorem B_chargeOp_chargeOp_via_isometry : traceForm7 chargeOp chargeOp = -6 := by
  have h := gather_isometry u1I u1I
  rw [u1I_coe] at h
  show traceForm7 (crossOp u1) (crossOp u1) = -6
  rw [h]
  have : gForm u1 u1 = 1 := by
    have := gForm_imBasis 0 0; simpa [imBasis] using this
  rw [this]; ring

/-- ★ hyperOp's invariant length EQUALS chargeOp's: `B(hyperOp, hyperOp) = -6`. -/
theorem B_hyperOp_hyperOp : traceForm7 hyperOp hyperOp = -6 := by
  have h := gather_isometry kap1O kap1O
  rw [kap1O_coe] at h
  show traceForm7 (crossOp (kappaO 1)) (crossOp (kappaO 1)) = -6
  rw [h]
  have : gForm (kappaO 1) (kappaO 1) = 1 := by
    have := gForm_imBasis 3 3; simpa [imBasis] using this
  rw [this]; ring

/-- ★ THE ORTHOGONALITY: the two forced U(1)s are trace-orthogonal, `B(chargeOp, hyperOp) = 0`. -/
theorem B_chargeOp_hyperOp : traceForm7 chargeOp hyperOp = 0 := by
  have h := gather_isometry u1I kap1O
  rw [u1I_coe, kap1O_coe] at h
  show traceForm7 (crossOp u1) (crossOp (kappaO 1)) = 0
  rw [h]
  have : gForm u1 (kappaO 1) = 0 := by
    have := gForm_imBasis 0 3; simpa [imBasis] using this
  rw [this]; ring

/-- ★★★ CAPSTONE: `crossEmb` is a scaled isometry, and the two forced U(1)s are an orthonormal pair
    of equal invariant length −6 ≠ 0 — the whole neutral-sector Gram forced by the fold metric. -/
theorem gather_isometry_structure :
    (∀ a b : ImO, traceForm7 (crossOp (a : O ℚ)) (crossOp (b : O ℚ)) = -6 * gForm (a : O ℚ) (b : O ℚ)) ∧
    traceForm7 hyperOp hyperOp = -6 ∧
    traceForm7 chargeOp chargeOp = -6 ∧
    traceForm7 chargeOp hyperOp = 0 ∧
    (-6 : ℚ) ≠ 0 :=
  ⟨gather_isometry, B_hyperOp_hyperOp, B_chargeOp_chargeOp_via_isometry, B_chargeOp_hyperOp, by norm_num⟩

end
end Phys.Algebra
