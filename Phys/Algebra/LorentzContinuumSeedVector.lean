/-
  Phys.Algebra.LorentzContinuumSeedVector — N76: THE EIGENVECTOR HALF OF THE 3-DIM SEED — a
  NONZERO eigenvector at the cubic-root eigenvalue, over the DERIVED ℝ `Cut` and the terminal
  algebra `O Cut := CD (H Cut)`, completing the seed eigenpair the N70/N74 deflation descent consumes.
  ===========================================================================
  THE NEXT FORCED NODE after the ODD-DEGREE ROOT ENGINE node (N75). N49–N75 banked, over the derived
  ℝ `Cut`: the continuum Born form `QvC` / isometry monoid `qvIsomMonoidC` (N49), the tangent Lie
  algebra `infIsomLieAlg` + `BvC` (N51), the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with
  `biMulFun u u'` (N52–N55), the BORN POSITIVITY + (1,9) signature (N56), the degree-2 scalar square
  root `cutSqrt` (N57), the INFINITESIMAL CARTAN reference form `EvC` (N58), the OPERATOR form-adjoint
  `IsEvCAdjoint` (N59), the operator square roots (N60–N65), the concrete polar factorization (N66),
  the rank-3 / GENERAL rank-`n` spectral operator `specOpN` with `specOpN_op_sqrt` (N67–N68), the
  concrete eigenbasis-existence witness `txMix` (N69), the DEFLATION / PEEL-OFF ENGINE `deflateC`
  (N70), the SEED EIGENPAIR EXTRACTION — the vector eigen-equation `specOpN_eigen` (N71), the
  CONSTRUCTED octonion-coupling 2×2 seed via the discriminant radical (N72), the FIRST CLOSED MULTI-STEP
  DEFLATION DESCENT (N73), the GENERAL ITERATED DEFLATION DESCENT `deflateList`/`specOpN_full_descent`
  (N74), AND the ODD-DEGREE ROOT ENGINE — the cube root `cutCbrt` and the GENERAL MONIC-CUBIC ROOT
  lever `cut_cubic_has_root` (every monic cubic over `Cut` has a root, via the same IVT engine that
  built N57 `cutSqrt` escalated degree-2→odd — the SEED-EIGENVALUE half at dimension ≥ 3) (N75).

  ── THE TARGET (N76) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the HEAVY group-manifold core: the EIGENVECTOR half of the seed, the FULL n-dim
  spectral EXISTENCE `∀ g, ∃ c u, g = specOpN c u`, the GLOBAL polar/KAK assembly for an arbitrary `g`,
  CONNECTEDNESS, the GLOBAL reverse KAK surjectivity, and the full `Spin(9)→SO(9)` exhaustion. N75
  banked the EIGENVALUE half of the 3-dim seed (a root of the characteristic CUBIC). MEASURE-FIRST
  (ROADMAP §N76 priority (i)) confirms: this node banks the EIGENVECTOR half — given the cubic-root
  eigenvalue `λ`, a NONZERO vector `v` with `T v = λ • v` — completing the seed eigenPAIR; the full
  existence assembly / connectedness / surjectivity / exhaustion need group-manifold machinery (the
  global remainder, childed N77).

  ── THE TRUNK REFRAME (THE ONE LAW): the eigenvector DISSOLVES through the eigenspace machinery ──
  The eigenvector half is NOT a determinant-cofactor coordinate grind. It DISSOLVES through Mathlib's
  general eigenspace machinery APPLIED TO THE DERIVED FIELD `Cut` (STANDARD §3: Mathlib as MACHINERY
  on a DERIVED object, NOT as content). A root `λ` of the characteristic polynomial gives a NONZERO
  eigenvector by two standard levers, both over an arbitrary field — here the DERIVED `Cut`:
    `Module.End.hasEigenvalue_iff_isRoot_charpoly` : `f.HasEigenvalue μ ↔ f.charpoly.IsRoot μ`
    `HasEigenvalue.exists_hasEigenvector`          : `HasEigenvalue ⟹ ∃ nonzero eigenvector`.
  The eigenvalue is supplied by N75 (the cubic root); the eigenvector is the nonzero eigenspace
  element this machinery produces. The chain joint: a monic degree-3 charpoly has a root via N75
  `cut_cubic_has_root` (`monic_cubic_poly_has_root`), so an endomorphism of a 3-dim `Cut`-space has a
  nonzero eigenvector (`dim3_has_eigenvector`) — and any charpoly root of an endomorphism of the
  10-dim `STVC` yields a nonzero eigenvector (`stvc_eigenvector_of_charpoly_root`).

  ── THE PREREQUISITE FINITE-DIMENSIONALITY LEVER ── the charpoly route REQUIRES `Module.Finite Cut`
  on the product space. `Module.Free Cut STVC` and `Nontrivial STVC` already resolve, but the
  finiteness of `O Cut` over `Cut` was not registered (only the `Module Cut (O Cut)` action). It is
  DERIVED STRUCTURALLY (no coordinate basis matrix) through the product equivalences mirroring the
  banked ℚ route (`DerivationFinrank.cdProdEquiv`), now over `Cut`: `Dbl Cut ≃ₗ Cut × Cut`,
  `H Cut ≃ₗ Dbl Cut × Dbl Cut`, `O Cut ≃ₗ H Cut × H Cut` — the rung dimensions `2 → 4 → 8` — giving
  `Module.Finite Cut (O Cut)` and hence `Module.Finite Cut STVC`.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    dblProdEquivCut / hProdEquivCut / oProdEquivCut — the structural `Cut`-linear product equivalences.
    instFiniteDblCut / instFiniteHCut / instFiniteOCut — `Module.Finite Cut` for `Dbl/H/O Cut`.
    monic_cubic_poly_has_root — the N75 chain joint: a monic degree-3 polynomial over `Cut` has a root
                          (from `cut_cubic_has_root` via `eval_eq_sum_range`).
    dim3_has_eigenvector — ★★ THE NON-VACUOUS SEED AT DIMENSION 3: every endomorphism of a 3-dim
                          `Cut`-vector space has a NONZERO eigenvector — the eigenvalue a root of its
                          degree-3 characteristic polynomial (supplied by N75), the `natDegree = 3`
                          DERIVED from `finrank`, not assumed. The seed eigenPAIR completed at the
                          dimension where the cubic root first bites.
    stvc_eigenvector_of_charpoly_root — ★ THE EIGENVECTOR HALF over the 10-dim `STVC`: given any
                          charpoly root `λ` of an endomorphism `T` of `STVC`, a NONZERO `v` with
                          `T v = λ • v` exists — the eigenvalue→eigenvector closure over the genuine
                          product space, the entry the N70 `deflateC` / N74 iterated descent consumes.

  ── THE W1 HEAVY REMAINDER (childed N77, an honest dissolution ticket, NOT closed here) ──
  Assembling the seed (N75 eigenvalue × N76 eigenvector) + the N74 iterated descent into the FULL
  existence `∀ g, ∃ c u, g = specOpN c u`, the GLOBAL polar/KAK assembly for an arbitrary `g`, the
  compact part via CONNECTEDNESS, the GLOBAL reverse KAK surjectivity, and the full `Spin(9)→SO(9)`
  exhaustion are the genuine HEAVY group-manifold core, childed onto the chain tail. THIS node banks
  the EIGENVECTOR half of the seed and the finite-dimensionality lever the charpoly route needs.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a root of the characteristic polynomial
  yields a nonzero eigenvector is standard linear algebra. Here it is applied to the DERIVED field
  `Cut` and the DERIVED product space `STVC = Cut × Cut × O Cut` whose finite-dimensionality DESCENDS
  STRUCTURALLY from the cascade rungs `2 → 4 → 8`, and the eigenvalue it consumes is the N75 cubic
  root that DESCENDS from the order-completeness the continuum was built with. `Module.End.charpoly`,
  `hasEigenvalue_iff_isRoot_charpoly`, `exists_hasEigenvector`, `Module.Finite.equiv` are standard
  MACHINERY operating on the DERIVED objects. NO posited ℝ/ℂ as content, NO posited operator calculus,
  NO posited Lorentz group.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenvalue / eigenvector / eigenpair / characteristic / cubic / seed / dimension / rank / Spin /
  SO(9) / KAK / polar / Cartan / isometry": what remains is the theorem that, over the derived complete
  ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, the product space `STVC` is a
  finite-dimensional `Cut`-vector space, every monic degree-3 polynomial over `Cut` has a root, every
  endomorphism of a 3-dim `Cut`-space has a nonzero `v` with `T v = λ • v`, and any characteristic-
  polynomial root of an endomorphism of `STVC` yields a nonzero `v` with `T v = λ • v` — pure
  mathematics about endomorphisms of finite-dimensional vector spaces over the derived field. No
  theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group,
  NO posited operator calculus, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumSeedCubic
import Mathlib.LinearAlgebra.Eigenspace.Charpoly
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Charpoly.Basic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The structural finite-dimensionality of `STVC` over the derived ℝ `Cut`.

    `STVC = Cut × Cut × O Cut`. `Module.Free Cut STVC` and `Nontrivial STVC` already resolve; what
    the charpoly route additionally needs is `Module.Finite Cut STVC`, i.e. the finiteness of
    `O Cut` over `Cut`. It descends STRUCTURALLY (no coordinate basis matrix) through the product
    equivalences of the cascade rungs `2 → 4 → 8`, mirroring the banked ℚ route
    (`DerivationFinrank.cdProdEquiv`), now over the derived `Cut`. -/

/-- The rung-1 product equivalence over `Cut`: `Dbl Cut ≃ₗ[Cut] Cut × Cut`. -/
def dblProdEquivCut : Dbl Cut ≃ₗ[Cut] Cut × Cut where
  toFun z := (z.re, z.im)
  invFun p := ⟨p.1, p.2⟩
  map_add' a b := by ext <;> simp [Dbl.add_re, Dbl.add_im]
  map_smul' q z := by ext <;> simp [Dbl.smul_re, Dbl.smul_im]
  left_inv z := by cases z; rfl
  right_inv p := by cases p; rfl

/-- The rung-2 product equivalence over `Cut`: `H Cut ≃ₗ[Cut] Dbl Cut × Dbl Cut`. -/
def hProdEquivCut : H Cut ≃ₗ[Cut] Dbl Cut × Dbl Cut where
  toFun z := (z.re, z.im)
  invFun p := ⟨p.1, p.2⟩
  map_add' a b := by ext <;> simp [CD.add_re, CD.add_im]
  map_smul' q z := by ext <;> simp
  left_inv z := by cases z; rfl
  right_inv p := by cases p; rfl

/-- ★ The rung-3 product equivalence over `Cut`: the TERMINAL algebra is, as a `Cut`-vector space,
    the product of its two `H Cut` components — `O Cut ≃ₗ[Cut] H Cut × H Cut`. -/
def oProdEquivCut : O Cut ≃ₗ[Cut] H Cut × H Cut where
  toFun z := (z.re, z.im)
  invFun p := ⟨p.1, p.2⟩
  map_add' a b := by ext <;> simp [CD.add_re, CD.add_im]
  map_smul' q z := by ext <;> simp
  left_inv z := by cases z; rfl
  right_inv p := by cases p; rfl

/-- `Dbl Cut` is a finite-dimensional `Cut`-vector space (rung-1, dimension 2). -/
instance instFiniteDblCut : Module.Finite Cut (Dbl Cut) :=
  Module.Finite.equiv dblProdEquivCut.symm

/-- `H Cut` is a finite-dimensional `Cut`-vector space (rung-2, dimension 4). -/
instance instFiniteHCut : Module.Finite Cut (H Cut) :=
  Module.Finite.equiv hProdEquivCut.symm

/-- ★ `O Cut` — THE TERMINAL ALGEBRA — is a finite-dimensional `Cut`-vector space (rung-3,
    dimension 8). The finiteness the charpoly route over `STVC` requires, derived structurally. -/
instance instFiniteOCut : Module.Finite Cut (O Cut) :=
  Module.Finite.equiv oProdEquivCut.symm

/-! ## The chain joint to N75 — a monic degree-3 polynomial over `Cut` has a root. -/

/-- ★ THE N75 CHAIN JOINT: a monic degree-3 polynomial over the derived ℝ `Cut` has a root —
    `cut_cubic_has_root` (N75) consumed in `Polynomial` form. Evaluating via `eval_eq_sum_range`
    expands the polynomial to its monic-cubic normal form `x³ + (coeff 2)x² + (coeff 1)x + coeff 0`,
    and N75 supplies a root. The bridge from the characteristic-polynomial abstraction (Mathlib
    machinery) to the trunk's odd-degree root engine. -/
theorem monic_cubic_poly_has_root (p : Polynomial Cut) (hmon : p.Monic) (hdeg : p.natDegree = 3) :
    ∃ x : Cut, p.IsRoot x := by
  obtain ⟨x, hx⟩ := cut_cubic_has_root (p.coeff 2) (p.coeff 1) (p.coeff 0)
  refine ⟨x, ?_⟩
  rw [Polynomial.IsRoot.def, Polynomial.eval_eq_sum_range, hdeg]
  have hc3 : p.coeff 3 = 1 := by
    have := hmon; rw [Polynomial.Monic, Polynomial.leadingCoeff, hdeg] at this; exact this
  simp [Finset.sum_range_succ]
  rw [hc3]
  ring_nf
  ring_nf at hx
  linarith [hx]

/-! ## The eigenVECTOR half of the seed. -/

/-- ★★ THE NON-VACUOUS SEED AT DIMENSION 3: every endomorphism `T` of a 3-dimensional `Cut`-vector
    space has a NONZERO eigenvector — a `λ` and a `v ≠ 0` with `T v = λ • v`. The eigenvalue is a
    root of the degree-3 characteristic polynomial of `T`, supplied by the N75 odd-degree root
    engine (`monic_cubic_poly_has_root`); the eigenvector is the nonzero eigenspace element the
    eigenspace machinery (`hasEigenvalue_iff_isRoot_charpoly` + `exists_hasEigenvector`) produces
    over the DERIVED field `Cut`. The `natDegree = 3` is DERIVED (`charpoly_natDegree` +
    `finrank (Fin 3 → Cut) = 3`), NOT assumed — so the statement is non-vacuous: it is the seed
    eigenPAIR completed exactly at the dimension where the cubic root first bites (beyond the 2×2
    discriminant radical that topped out N65/N72). -/
theorem dim3_has_eigenvector (T : Module.End Cut (Fin 3 → Cut)) :
    ∃ (lam : Cut) (v : Fin 3 → Cut), v ≠ 0 ∧ T v = lam • v := by
  have hdeg : T.charpoly.natDegree = 3 := by
    rw [LinearMap.charpoly_natDegree]
    simp
  obtain ⟨lam, hroot⟩ := monic_cubic_poly_has_root T.charpoly (LinearMap.charpoly_monic T) hdeg
  have hev : T.HasEigenvalue lam :=
    (Module.End.hasEigenvalue_iff_isRoot_charpoly T lam).mpr hroot
  obtain ⟨v, hv⟩ := hev.exists_hasEigenvector
  exact ⟨lam, v, hv.2, hv.apply_eq_smul⟩

/-- ★ THE EIGENVECTOR HALF OVER THE 10-DIM `STVC`: given any characteristic-polynomial root `λ` of
    an endomorphism `T` of `STVC = Cut × Cut × O Cut`, a NONZERO vector `v` with `T v = λ • v`
    exists — the eigenvalue→eigenvector closure over the genuine product space. Combined with the
    N75 eigenvalue (`cut_cubic_has_root`, supplying the cubic charpoly root) this COMPLETES the seed
    eigenPAIR `(λ, v)` the N70 `deflateC` engine and N74 iterated descent consume: `deflateC` takes
    exactly the hypothesis `T v = λ • v`, and now the eigenvector that satisfies it is produced
    constructively from the root, over the DERIVED field `Cut` and the terminal algebra `O Cut`. -/
theorem stvc_eigenvector_of_charpoly_root (T : Module.End Cut STVC) (lam : Cut)
    (hroot : T.charpoly.IsRoot lam) :
    ∃ v : STVC, v ≠ 0 ∧ T v = lam • v := by
  have hev : T.HasEigenvalue lam :=
    (Module.End.hasEigenvalue_iff_isRoot_charpoly T lam).mpr hroot
  obtain ⟨v, hv⟩ := hev.exists_hasEigenvector
  exact ⟨v, hv.2, hv.apply_eq_smul⟩

end

end Phys.Algebra
