/-
  Phys.Algebra.LorentzContinuumRealFactor — N83: THE REAL-CLOSED FACTORIZATION → THE EVEN-DIM
  REAL-EIGENVALUE SEED over the derived ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.

  THE CROWN that USES the banked N82 `cuti_isAlgClosed : IsAlgClosed Cut[i]`: an arbitrary monic
  characteristic polynomial over the derived ℝ `Cut` factors into LINEAR × NEGATIVE-DISCRIMINANT-
  QUADRATIC factors, and consequently EVERY `EvC`-self-adjoint operator on `STVC` has a REAL
  eigenvalue — completing the spectral SEED at EVERY rung (odd already via N77
  `dim_odd_has_eigenvector`, even now via this).
  ===========================================================================
  THE NEXT FORCED NODE after the FULL ARTIN–SCHREIER ALGEBRAIC CLOSURE node (N82). N49–N82 banked,
  over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, isometry monoid `qvIsomMonoidC`, forward soundness, the
      positive-definite Cartan form `EvC`, the operator form-adjoint `IsEvCSymm` (N49–N65);
    • the rank-`n` spectral operator `specOpN`, deflation `deflateC`, seed extraction, iterated
      descent `deflateList`/`specOpN_full_descent` (N67–N74);
    • the ODD-DEGREE ROOT ENGINE `cutCbrt`/`cut_cubic_has_root`, `Module.Finite Cut STVC`,
      `stvc_eigenvector_of_charpoly_root`, `dim3_has_eigenvector` (N75–N76);
    • THE DERIVED ℝ `Cut` IS A REAL CLOSED FIELD — `cut_odd_degree_has_root`, `cut_isRealClosed`,
      `dim_odd_has_eigenvector` (N77);
    • the EVEN-RUNG OBSTRUCTION REMOVER `selfadj_negDisc_quad_isUnit` + the conditional existence
      `selfadj_no_pure_quad_charpoly` — a self-adjoint `g`'s charpoly is NOT a pure product of
      negative-discriminant monic quadratics (N78);
    • the DEFLATION RE-SEEDING INDUCTION LEVER `uPerp`/`uPerp_finrank`/`deflateRestrict`/
      `deflateRestrict_odd_reseed` (N79);
    • THE REAL-CLOSED QUADRATIC-IRREDUCIBILITY CLASSIFICATION `cutQuad`/
      `cut_monic_quad_irreducible_iff_negDisc` — a monic quadratic over `Cut` is irreducible iff
      `b² < 4c` (N80);
    • the TRUNK-NATIVE ARTIN–SCHREIER DEGREE-2 INPUT `Cuti = Cut[X]/(X²+1)`, `cutiI_sq`,
      `cuti_finrank_eq_two`, `cuti_quadratic_has_root` (N81);
    • ★ THE FULL ARTIN–SCHREIER ALGEBRAIC CLOSURE `cuti_isAlgClosed : IsAlgClosed Cut[i]` (N82).

  ── WHAT THIS NODE ADDS ──
    cut_irreducible_natDegree_le_two — ★ THE REAL-CLOSED IRREDUCIBLE-DEGREE BOUND: every irreducible
        `p ∈ Cut[X]` has `natDegree ≤ 2`. Maps `p` to `Cut[i][X]`, which SPLITS over the now-
        algebraically-closed `Cut[i]` (N82 `cuti_isAlgClosed`, `IsAlgClosed.splits`); by
        `Polynomial.Irreducible.natDegree_dvd_finrank`, `p.natDegree ∣ finrank Cut Cut[i] = 2`
        (N81 `cuti_finrank_eq_two`), hence `≤ 2`. The degree-≤2 factorization over an abstract
        real-closed field — the content Mathlib genuinely LACKS (`Analysis/Polynomial/Factorization`
        is concrete-ℝ-only, `-- TODO: generalize to real closed fields`).
    cut_no_root_factors_negDisc — ★★ THE REAL-CLOSED FACTORIZATION: a monic `p ∈ Cut[X]` with NO root
        in `Cut` factors as a `List`-product of NEGATIVE-DISCRIMINANT monic quadratics
        `X² + C b·X + C c` (`b² < 4c`). Strong induction on `natDegree`: extract a monic irreducible
        factor `q` (`exists_monic_irreducible_factor`); `q.natDegree ≤ 2` (the bound above) and `≥ 1`
        (irreducible) and `≠ 1` (a monic degree-1 factor would give a root of `p`), so EXACTLY 2;
        degree-2 irreducible ⟹ negative discriminant (N80 `cut_monic_quad_irreducible_iff_negDisc`);
        the cofactor `r = p / q` is monic of strictly smaller degree with no root — recurse.
    cut_selfadj_has_eigenvalue — ★★★ THE EVEN-DIM REAL-EIGENVALUE SEED: every `EvC`-self-adjoint
        `g : Module.End Cut STVC` has a REAL eigenvalue `∃ μ, g.HasEigenvalue μ`. If not, its
        characteristic polynomial has no root in `Cut` (`hasEigenvalue_iff_isRoot_charpoly`), so by
        the factorization it is a pure product of negative-discriminant monic quadratics — exactly
        what N78 `selfadj_no_pure_quad_charpoly` FORBIDS for a self-adjoint operator. The seed is now
        complete at EVERY finrank: odd via N77 `dim_odd_has_eigenvector`, even via THIS.

  DERIVED from the trunk (the splitting DESCENDS from `cuti_isAlgClosed` N82 — itself descending from
  `cut_isRealClosed` N77, the order-completeness of the derived ℝ `Cut`; the eigenvalue obstruction is
  N78, descending from the positive-definite Born form `EvC`). `IsAlgClosed.splits`,
  `Polynomial.Irreducible.natDegree_dvd_finrank`, `exists_monic_irreducible_factor`,
  `isMonicOfDegree_two_iff`, `Module.End.hasEigenvalue_iff_isRoot_charpoly`, `aeval_self_charpoly`
  are standard MACHINERY operating on the DERIVED `Cut`/`Cut[i]`/`STVC`. NO posited algebraic closure,
  NO Mathlib ℝ/ℂ as content, NO posited Lorentz group, NO bridge (STANDARD §3).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / spectral / eigenvalue / eigenvector /
  self-adjoint / characteristic / factorization / irreducible / discriminant / real-closed /
  Artin-Schreier / algebraic-closure / algebraically-closed / seed / even-dim / Spin / SO(9) / isometry":
  what remains is the theorem that, over the derived complete ordered field `Cut` whose degree-2 extension
  `Cut[X]/(X²+1)` is algebraically closed, every irreducible `p ∈ Cut[X]` has `natDegree ≤ 2`, every monic
  `p` with no root factors as a product of negative-discriminant monic quadratics, and every
  `EvC`-symmetric endomorphism of the finite-dimensional `Cut`-space `STVC` has a `μ : Cut` and a nonzero
  `v` with `g v = μ • v` — pure field/polynomial/linear-algebra mathematics over the derived field. No
  theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group,
  NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumAlgClosure
import Phys.Algebra.LorentzContinuumEvenSeed
import Mathlib.LinearAlgebra.Eigenspace.Charpoly
import Mathlib.RingTheory.Polynomial.UniqueFactorization

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators
open Polynomial

/-! ## The real-closed irreducible-degree bound. -/

/-- ★ THE REAL-CLOSED IRREDUCIBLE-DEGREE BOUND: every irreducible `p ∈ Cut[X]` has `natDegree ≤ 2`.
    Maps `p` to `Cut[i][X]`, which SPLITS over the now-algebraically-closed `Cut[i]` (N82
    `cuti_isAlgClosed`, `IsAlgClosed.splits`); by `Polynomial.Irreducible.natDegree_dvd_finrank`,
    `p.natDegree ∣ finrank Cut Cut[i] = 2` (N81 `cuti_finrank_eq_two`), hence `≤ 2`. The degree-≤2
    factorization over an abstract real-closed field — the content Mathlib lacks. -/
theorem cut_irreducible_natDegree_le_two {p : Cut[X]} (hp : Irreducible p) :
    p.natDegree ≤ 2 := by
  have hsplit : ((p.map (algebraMap Cut Cuti))).Splits := IsAlgClosed.splits _
  have hdvd : p.natDegree ∣ Module.finrank Cut Cuti := hp.natDegree_dvd_finrank hsplit
  rw [cuti_finrank_eq_two] at hdvd
  exact Nat.le_of_dvd (by norm_num) hdvd

/-! ## The real-closed factorization (no-root case). -/

/-- ★★ THE REAL-CLOSED FACTORIZATION: a monic `p ∈ Cut[X]` with NO root in `Cut` factors as a
    `List`-product of NEGATIVE-DISCRIMINANT monic quadratics `X² + C b·X + C c` (`b² < 4c`). Strong
    induction on `natDegree`: extract a monic irreducible factor `q`; it has `natDegree ≤ 2`
    (`cut_irreducible_natDegree_le_two`), `≥ 1` (irreducible), `≠ 1` (a degree-1 factor would give a
    root of `p`), so EXACTLY 2; degree-2 irreducible ⟹ negative discriminant (N80
    `cut_monic_quad_irreducible_iff_negDisc`); the cofactor is monic of strictly smaller degree with
    no root — recurse. -/
theorem cut_no_root_factors_negDisc {p : Cut[X]} (hmon : p.Monic)
    (hnoroot : ∀ μ : Cut, ¬ p.IsRoot μ) :
    ∃ qs : List (Cut × Cut), (∀ pr ∈ qs, pr.1^2 < 4*pr.2) ∧
      p = (qs.map (fun pr => X^2 + C pr.1 * X + C pr.2)).prod := by
  induction hd : p.natDegree using Nat.strong_induction_on generalizing p with
  | _ n ih =>
  subst hd
  rcases Nat.eq_zero_or_pos p.natDegree with h0 | hpos
  · refine ⟨[], by simp, ?_⟩
    rw [hmon.natDegree_eq_zero.mp h0]; simp
  · have hnotunit : ¬ IsUnit p := by
      intro hu; have := natDegree_eq_zero_of_isUnit hu; omega
    obtain ⟨q, hqmon, hqirr, hqdvd⟩ := Polynomial.exists_monic_irreducible_factor _ hnotunit
    have hqle : q.natDegree ≤ 2 := cut_irreducible_natDegree_le_two hqirr
    have hq1 : 1 ≤ q.natDegree := hqirr.natDegree_pos
    have hqnoroot : ∀ μ : Cut, ¬ q.IsRoot μ := by
      intro μ hμ
      obtain ⟨r, hr⟩ := hqdvd
      exact hnoroot μ (by rw [IsRoot, hr, eval_mul, (IsRoot.def.mp hμ), zero_mul])
    have hqne1 : q.natDegree ≠ 1 := by
      intro h1
      obtain ⟨a, b, hab⟩ := exists_eq_X_add_C_of_natDegree_le_one (p := q) (by omega)
      have ha : a = 1 := by
        have hmon' := hqmon
        rw [hab] at hmon'
        have hlc : (C a * X + C b).leadingCoeff = a := by
          rw [leadingCoeff]
          have hnd : (C a * X + C b).natDegree = 1 := by rw [← hab, h1]
          rw [hnd]
          simp [coeff_add, coeff_C, coeff_X]
        rw [Monic, hlc] at hmon'; exact hmon'
      apply hqnoroot (-b)
      rw [IsRoot, hab, ha]; simp
    have hq2 : q.natDegree = 2 := by omega
    obtain ⟨bb, cc, hq⟩ := isMonicOfDegree_two_iff.mp ⟨hq2, hqmon⟩
    have hdisc : bb^2 < 4*cc := by
      have hirr2 : Irreducible (cutQuad bb cc) := by rw [cutQuad]; rw [← hq]; exact hqirr
      exact (cut_monic_quad_irreducible_iff_negDisc bb cc).mp hirr2
    obtain ⟨r, hr⟩ := hqdvd
    have hrmon : r.Monic := hqmon.of_mul_monic_left (hr ▸ hmon)
    have hrnoroot : ∀ μ : Cut, ¬ r.IsRoot μ := by
      intro μ hμ
      exact hnoroot μ (by rw [IsRoot, hr, eval_mul, (IsRoot.def.mp hμ), mul_zero])
    have hdegsum : p.natDegree = q.natDegree + r.natDegree := by
      rw [hr]; exact hqmon.natDegree_mul hrmon
    have hrdeg_lt : r.natDegree < p.natDegree := by omega
    obtain ⟨qs, hqsdisc, hqsprod⟩ := ih r.natDegree hrdeg_lt hrmon hrnoroot rfl
    refine ⟨(bb, cc) :: qs, ?_, ?_⟩
    · intro pr hpr
      rcases List.mem_cons.mp hpr with h | h
      · subst h; exact hdisc
      · exact hqsdisc pr h
    · rw [hr, hq, hqsprod]; simp [List.map_cons, List.prod_cons]

/-! ## The even-dimensional real-eigenvalue seed. -/

/-- ★★★ THE EVEN-DIM REAL-EIGENVALUE SEED: every `EvC`-self-adjoint `g : Module.End Cut STVC` has a
    REAL eigenvalue. If not, its characteristic polynomial has no root in `Cut`
    (`hasEigenvalue_iff_isRoot_charpoly`), so by `cut_no_root_factors_negDisc` it is a pure product of
    negative-discriminant monic quadratics — exactly what N78 `selfadj_no_pure_quad_charpoly` FORBIDS
    for a self-adjoint operator. The seed is now complete at EVERY finrank: odd via N77
    `dim_odd_has_eigenvector`, even via THIS. -/
theorem cut_selfadj_has_eigenvalue {g : Module.End Cut STVC} (hg : IsEvCSymm g) :
    ∃ μ : Cut, g.HasEigenvalue μ := by
  by_contra hno
  push_neg at hno
  have hnoroot : ∀ μ : Cut, ¬ g.charpoly.IsRoot μ := by
    intro μ hμ
    exact hno μ ((Module.End.hasEigenvalue_iff_isRoot_charpoly g μ).mpr hμ)
  obtain ⟨qs, hqsdisc, hqsprod⟩ := cut_no_root_factors_negDisc g.charpoly_monic hnoroot
  exact selfadj_no_pure_quad_charpoly hg qs hqsdisc hqsprod

end

end Phys.Algebra
