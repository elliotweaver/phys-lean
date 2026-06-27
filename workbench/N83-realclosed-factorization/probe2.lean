import Phys.Algebra.LorentzContinuumAlgClosure
import Phys.Algebra.LorentzContinuumEvenSeed
import Mathlib.LinearAlgebra.Eigenspace.Charpoly
import Mathlib.RingTheory.Polynomial.UniqueFactorization

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Polynomial

section

-- PROBE 0: the real-closed irreducible-degree bound.
theorem probe_cut_irreducible_natDegree_le_two {p : Cut[X]} (hp : Irreducible p) :
    p.natDegree ≤ 2 := by
  have hsplit : ((p.map (algebraMap Cut Cuti))).Splits := IsAlgClosed.splits _
  have hdvd : p.natDegree ∣ Module.finrank Cut Cuti := hp.natDegree_dvd_finrank hsplit
  rw [cuti_finrank_eq_two] at hdvd
  exact Nat.le_of_dvd (by norm_num) hdvd

-- PROBE 2: the real-closed factorization (no-root case).
-- A monic p ∈ Cut[X] with NO root in Cut factors as a product of neg-disc monic quadratics.
theorem probe_no_root_factors_negDisc {p : Cut[X]} (hmon : p.Monic)
    (hnoroot : ∀ μ : Cut, ¬ p.IsRoot μ) :
    ∃ qs : List (Cut × Cut), (∀ pr ∈ qs, pr.1^2 < 4*pr.2) ∧
      p = (qs.map (fun pr => X^2 + C pr.1 * X + C pr.2)).prod := by
  -- strong induction on natDegree
  induction hd : p.natDegree using Nat.strong_induction_on generalizing p with
  | _ n ih =>
  subst hd
  rcases Nat.eq_zero_or_pos p.natDegree with h0 | hpos
  · -- degree 0 monic ⟹ p = 1 ⟹ empty list
    refine ⟨[], by simp, ?_⟩
    rw [hmon.natDegree_eq_zero.mp h0]; simp
  · -- positive degree: extract a monic irreducible factor q
    have hnotunit : ¬ IsUnit p := by
      intro hu; have := natDegree_eq_zero_of_isUnit hu; omega
    obtain ⟨q, hqmon, hqirr, hqdvd⟩ := Polynomial.exists_monic_irreducible_factor _ hnotunit
    have hqle : q.natDegree ≤ 2 := probe_cut_irreducible_natDegree_le_two hqirr
    have hq1 : 1 ≤ q.natDegree := hqirr.natDegree_pos
    -- q has no root (a root of q would be a root of p since q ∣ p)
    have hqnoroot : ∀ μ : Cut, ¬ q.IsRoot μ := by
      intro μ hμ
      obtain ⟨r, hr⟩ := hqdvd
      exact hnoroot μ (by rw [IsRoot, hr, eval_mul, (IsRoot.def.mp hμ), zero_mul])
    -- q.natDegree ≠ 1: a monic deg-1 poly has a root
    have hqne1 : q.natDegree ≠ 1 := by
      intro h1
      obtain ⟨a, b, hab⟩ := exists_eq_X_add_C_of_natDegree_le_one (p := q) (by omega)
      -- monic ⟹ a = 1, root is -b
      have ha : a = 1 := by
        have := hqmon
        rw [hab] at this
        have hlc : (C a * X + C b).leadingCoeff = a := by
          rw [leadingCoeff]
          have hnd : (C a * X + C b).natDegree = 1 := by rw [← hab, h1]
          rw [hnd]
          simp [coeff_add, coeff_C_mul, coeff_X, coeff_C]
        rw [Monic, hlc] at this; exact this
      apply hqnoroot (-b)
      rw [IsRoot, hab, ha]; simp
    have hq2 : q.natDegree = 2 := by omega
    obtain ⟨bb, cc, hq⟩ := isMonicOfDegree_two_iff.mp ⟨hqmon, by rw [hq2]⟩
    have hdisc : bb^2 < 4*cc := by
      have hirr2 : Irreducible (cutQuad bb cc) := by rw [cutQuad, ← hq]; exact hqirr
      exact (cut_monic_quad_irreducible_iff_negDisc bb cc).mp hirr2
    -- p = q * r, r monic, r has no root, deg r < deg p
    obtain ⟨r, hr⟩ := hqdvd
    have hrmon : r.Monic := hqmon.of_mul_monic_left (hr ▸ hmon)
    have hrnoroot : ∀ μ : Cut, ¬ r.IsRoot μ := by
      intro μ hμ
      exact hnoroot μ (by rw [IsRoot, hr, eval_mul, (IsRoot.def.mp hμ), mul_zero])
    have hdegsum : p.natDegree = q.natDegree + r.natDegree := by
      rw [hr]; exact hqmon.natDegree_mul hrmon
    have hrdeg_lt : r.natDegree < p.natDegree := by omega
    -- recurse on r
    obtain ⟨qs, hqsdisc, hqsprod⟩ := ih r.natDegree hrdeg_lt hrmon hrnoroot rfl
    refine ⟨(bb, cc) :: qs, ?_, ?_⟩
    · intro pr hpr
      rcases List.mem_cons.mp hpr with h | h
      · subst h; exact hdisc
      · exact hqsdisc pr h
    · rw [hr, hq, hqsprod]; simp [List.map_cons, List.prod_cons]

-- THE EVEN-DIM SEED: a self-adjoint g on STVC has a real eigenvalue.
theorem probe_selfadj_has_eigenvalue {g : Module.End Cut STVC} (hg : IsEvCSymm g) :
    ∃ μ : Cut, g.HasEigenvalue μ := by
  by_contra hno
  push_neg at hno
  have hnoroot : ∀ μ : Cut, ¬ g.charpoly.IsRoot μ := by
    intro μ hμ
    exact hno μ ((Module.End.hasEigenvalue_iff_isRoot_charpoly g μ).mpr hμ)
  obtain ⟨qs, hqsdisc, hqsprod⟩ := probe_no_root_factors_negDisc g.charpoly_monic hnoroot
  exact selfadj_no_pure_quad_charpoly hg qs hqsdisc hqsprod

end

end Phys.Algebra
