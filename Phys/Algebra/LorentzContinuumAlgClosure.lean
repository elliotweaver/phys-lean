/-
# N82 — THE FULL ARTIN–SCHREIER ALGEBRAIC CLOSURE `IsAlgClosed Cut[i]`

The heavy group-manifold core: that the quadratic extension `Cut[i] = Cut[X]/(X²+1)` of the
derived ℝ `Cut` is ALGEBRAICALLY CLOSED — the classical Artin–Schreier theorem (a real closed
field `R` has `R[i]` algebraically closed).  Mathlib genuinely LACKS this content (the
`Sylow`-in-field-theory glue: `grep Sylow FieldTheory/` returns NOTHING; `IsRealClosed` is a
127-line stub with no algebraic closure, no degree-≤2 factorization over abstract real-closed
fields).  We BUILD it (RUNBOOK W1 — build-don't-posit), over the banked trunk:

  - N77 `cut_odd_degree_has_root` / `cut_isRealClosed` : every monic ODD-degree polynomial over
    the derived ℝ `Cut` has a root (the intermediate value theorem riding order-completeness).
  - N81 `cuti_quadratic_has_root` : `Cut[i]` is DEGREE-2-CLOSED (every quadratic has a root,
    since every element of `Cut[i]` is a square — the trunk-native half of Artin–Schreier).

The argument (route a — the classical algebraic Artin–Schreier route, measured the SMALLER
route since route b needs Heine–Borel/sphere-compactness over abstract `Cut` that Mathlib lacks):

  1. (`cut_no_odd_ext`)  Every finite ODD-degree field extension of `Cut` is trivial (degree 1).
     The primitive element's minimal polynomial is monic of odd degree, so it has a root in `Cut`
     (N77), and being irreducible with a root it has degree 1.
  2. (`cut_galois_finrank_two_power`)  Every finite Galois extension `M/Cut` has degree a power
     of 2: a 2-Sylow `P ≤ Gal(M/Cut)` has fixed field of degree `[G : P]` (odd) over `Cut`, hence
     by (1) degree 1, forcing `P = G`, so `|G|` is a 2-power.
  3. (`cuti_no_deg_two_ext`, `cuti_galois_two_group_trivial`)  The descent: a nontrivial finite
     2-group `Gal(M/Cut[i])` has an index-2 subgroup, giving a degree-2 extension of `Cut[i]` —
     impossible by N81 degree-2-closure.
  4. (`cuti_isAlgClosed`)  `IsAlgClosed Cut[i]` via `IsAlgClosed.of_exists_root`: the normal
     closure of `Cut[i][X]/(p)` over `Cut` is finite Galois of 2-power degree, trivial over
     `Cut[i]` by (3), forcing `deg p = 1`.

PHYSICS-WORDS-REMOVABLE: delete every physics word — over the derived complete ordered field
`Cut` (every nonnegative element a square, every odd-degree polynomial with a root) and its
quadratic extension `Cut[i]` (every element a square), every finite odd-degree extension of
`Cut` is trivial; pure field/polynomial/group math.  No physics word does logical work.

NO posited algebraic closure, NO Mathlib ℝ/ℂ as content, NO bridge — every object descends
from the banked N49–N81 + the derived ℝ `Cut`.
-/
import Phys.Algebra.LorentzContinuumAdjoinI
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.PrimitiveElement
import Mathlib.FieldTheory.Normal.Closure
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.GroupTheory.Sylow
import Mathlib.RingTheory.AdjoinRoot

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Polynomial

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- **The odd-degree extension obstruction.**  Every finite field extension `E` of the derived
ℝ `Cut` of ODD degree is trivial (degree 1).  Rides N77 `cut_odd_degree_has_root`: a primitive
element `α` generates `E` over `Cut`, its minimal polynomial is monic of odd degree
`= finrank Cut E`, hence (N77) has a root in `Cut`; being irreducible with a root it has degree 1,
so `finrank Cut E = 1`.  (Separability is automatic: `Cut` is `CharZero` hence `PerfectField`, so
every finite extension is separable, supplying the primitive element.) -/
theorem cut_no_odd_ext (E : Type*) [Field E] [Algebra Cut E] [FiniteDimensional Cut E]
    (hodd : Odd (Module.finrank Cut E)) : Module.finrank Cut E = 1 := by
  obtain ⟨α, hα⟩ := Field.exists_primitive_element Cut E
  have hint : IsIntegral Cut α := IsIntegral.of_finite Cut α
  have hfr : Module.finrank Cut E = (minpoly Cut α).natDegree := by
    rw [← IntermediateField.adjoin.finrank hint, hα]
    exact (IntermediateField.finrank_top').symm
  rw [hfr] at hodd ⊢
  have hmon : (minpoly Cut α).Monic := minpoly.monic hint
  obtain ⟨x, hx⟩ := cut_odd_degree_has_root hmon hodd
  have hirr : Irreducible (minpoly Cut α) := minpoly.irreducible hint
  have hdeg1 : (minpoly Cut α).degree = 1 := degree_eq_one_of_irreducible_of_root hirr hx
  exact natDegree_eq_of_degree_eq_some hdeg1

/-- **The 2-power-degree step** (the heart of Artin–Schreier route a).  Every finite GALOIS
extension `M` of the derived ℝ `Cut` has degree a power of `2`.  A `2`-Sylow `P` of the Galois
group `G = Gal(M/Cut)` has index `[G:P]` indivisible by `2` (Sylow), so the fixed field of `P`
has ODD degree `[G:P]` over `Cut`, hence (`cut_no_odd_ext`) degree `1`, forcing `[G:P] = 1`,
i.e. `P = G`; thus `|G| = |P|` is a power of `2`, and `finrank Cut M = |G|` (Galois). -/
theorem cut_galois_finrank_two_power (M : Type) [Field M] [Algebra Cut M]
    [FiniteDimensional Cut M] [IsGalois Cut M] :
    ∃ n : ℕ, Module.finrank Cut M = 2 ^ n := by
  haveI : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩
  set G := M ≃ₐ[Cut] M with hG
  haveI : Finite G := (AlgEquiv.fintype Cut M).finite
  obtain ⟨P⟩ : Nonempty (Sylow 2 G) := Sylow.nonempty
  haveI : Finite P := Subtype.finite
  have hcard : Module.finrank Cut (IntermediateField.fixedField (P : Subgroup G)) *
      Module.finrank (IntermediateField.fixedField (P : Subgroup G)) M = Module.finrank Cut M :=
    Module.finrank_mul_finrank Cut _ M
  have hfixcard : Module.finrank (IntermediateField.fixedField (P : Subgroup G)) M =
      Nat.card (P : Subgroup G) := IntermediateField.finrank_fixedField_eq_card _
  have hGcard : Nat.card G = Module.finrank Cut M := IsGalois.card_aut_eq_finrank Cut M
  have hPidx : Nat.card (P : Subgroup G) * (P : Subgroup G).index = Nat.card G :=
    Subgroup.card_mul_index _
  have hcardP_pos : 0 < Nat.card (P : Subgroup G) := Nat.card_pos
  have hidx_eq : Module.finrank Cut (IntermediateField.fixedField (P : Subgroup G)) =
      (P : Subgroup G).index := by
    have h1 : Module.finrank Cut (IntermediateField.fixedField (P : Subgroup G)) *
        Nat.card (P : Subgroup G) = (P : Subgroup G).index * Nat.card (P : Subgroup G) := by
      rw [hfixcard] at hcard
      rw [hcard, ← hGcard, ← hPidx]; ring
    exact Nat.eq_of_mul_eq_mul_right hcardP_pos h1
  have hodd_idx : Odd (P : Subgroup G).index := by
    rw [← Nat.not_even_iff_odd, even_iff_two_dvd]
    exact P.not_dvd_index
  have hfinrank1 : Module.finrank Cut (IntermediateField.fixedField (P : Subgroup G)) = 1 :=
    cut_no_odd_ext _ (hidx_eq ▸ hodd_idx)
  have hidx1 : (P : Subgroup G).index = 1 := by rw [← hidx_eq]; exact hfinrank1
  have hGeqP : Nat.card G = Nat.card (P : Subgroup G) := by rw [← hPidx, hidx1, mul_one]
  obtain ⟨n, hn⟩ := IsPGroup.iff_card.mp P.2
  exact ⟨n, by rw [← hGcard, hGeqP, hn]⟩

/-- **No degree-2 extension of `Cut[i]`** (the descent target — the degree-2-closure half of
Artin–Schreier, riding N81 `cuti_quadratic_has_root`).  `Cut[i]` has no field extension of
degree `2`: a degree-2 extension `L/Cut[i]` has a primitive element whose minimal polynomial is
a monic IRREDUCIBLE quadratic over `Cut[i]`, but every monic quadratic over `Cut[i]` has a root
(N81 — `Cut[i]` is DEGREE-2-CLOSED), hence is reducible — contradiction. -/
theorem cuti_no_deg_two_ext (L : Type) [Field L] [Algebra Cuti L] [FiniteDimensional Cuti L] :
    Module.finrank Cuti L ≠ 2 := by
  intro h2
  obtain ⟨α, hα⟩ := Field.exists_primitive_element Cuti L
  have hint : IsIntegral Cuti α := IsIntegral.of_finite Cuti α
  have hfr : (minpoly Cuti α).natDegree = 2 := by
    have e : Module.finrank Cuti L = (minpoly Cuti α).natDegree := by
      rw [← IntermediateField.adjoin.finrank hint, hα]
      exact (IntermediateField.finrank_top').symm
    rw [e] at h2; exact h2
  have hmon : (minpoly Cuti α).Monic := minpoly.monic hint
  have hirr : Irreducible (minpoly Cuti α) := minpoly.irreducible hint
  have hroot : ∃ x : Cuti, (minpoly Cuti α).IsRoot x := by
    set p := minpoly Cuti α with hp
    have hcoeff2 : p.coeff 2 = 1 := by
      have := hmon
      rw [Polynomial.Monic, Polynomial.leadingCoeff, hfr] at this
      exact this
    obtain ⟨x, hx⟩ := cuti_quadratic_has_root (p.coeff 2) (p.coeff 1) (p.coeff 0)
      (by rw [hcoeff2]; exact one_ne_zero)
    refine ⟨x, ?_⟩
    have heval : p.eval x = p.coeff 2 * x ^ 2 + p.coeff 1 * x + p.coeff 0 := by
      have hpdeg : p.natDegree = 2 := hfr
      rw [Polynomial.eval_eq_sum_range, hpdeg]
      simp [Finset.sum_range_succ]
      ring
    rw [Polynomial.IsRoot, heval]
    linear_combination hx
  obtain ⟨x, hx⟩ := hroot
  have hdeg1 : (minpoly Cuti α).degree = 1 := degree_eq_one_of_irreducible_of_root hirr hx
  have : (minpoly Cuti α).natDegree = 1 := natDegree_eq_of_degree_eq_some hdeg1
  omega

/-- **A 2-group Galois extension of `Cut[i]` is trivial.**  If `M/Cut[i]` is finite Galois with
`finrank Cut[i] M = 2 ^ n`, then `n = 0`.  For `n ≥ 1` the Galois group `Gal(M/Cut[i])` (of order
`2 ^ n`) has a subgroup `K` of index `2` (Sylow's first theorem, order `2 ^ (n-1)`), whose fixed
field is a degree-`2` extension of `Cut[i]` — impossible by `cuti_no_deg_two_ext`. -/
theorem cuti_galois_two_group_trivial (M : Type) [Field M] [Algebra Cuti M]
    [FiniteDimensional Cuti M] [IsGalois Cuti M]
    (n : ℕ) (hn : Module.finrank Cuti M = 2 ^ n) : n = 0 := by
  haveI : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩
  by_contra hne
  have hn1 : 1 ≤ n := Nat.one_le_iff_ne_zero.mpr hne
  set G := M ≃ₐ[Cuti] M with hG
  haveI : Finite G := (AlgEquiv.fintype Cuti M).finite
  have hGcard : Nat.card G = 2 ^ n := by
    rw [IsGalois.card_aut_eq_finrank Cuti M, hn]
  haveI : Fintype G := Fintype.ofFinite G
  have hdvd : 2 ^ (n - 1) ∣ Nat.card G := by
    rw [hGcard]; exact pow_dvd_pow 2 (Nat.sub_le n 1)
  obtain ⟨K, hKcard⟩ := Sylow.exists_subgroup_card_pow_prime (G := G) 2 (n := n - 1) hdvd
  have hfix : Module.finrank (IntermediateField.fixedField K) M = Nat.card K :=
    IntermediateField.finrank_fixedField_eq_card K
  have hKcard' : Nat.card (K : Subgroup G) = 2 ^ (n - 1) := hKcard
  have htower : Module.finrank Cuti (IntermediateField.fixedField K) *
      Module.finrank (IntermediateField.fixedField K) M = Module.finrank Cuti M :=
    Module.finrank_mul_finrank Cuti _ M
  rw [hfix, hKcard', hn] at htower
  have h2pos : 0 < 2 ^ (n - 1) := pow_pos (by norm_num) _
  have hfin2 : Module.finrank Cuti (IntermediateField.fixedField K) = 2 := by
    have : Module.finrank Cuti (IntermediateField.fixedField K) * 2 ^ (n - 1) =
        2 * 2 ^ (n - 1) := by
      rw [htower]; rw [← pow_succ']; congr 1; omega
    exact Nat.eq_of_mul_eq_mul_right h2pos this
  exact cuti_no_deg_two_ext (IntermediateField.fixedField K) hfin2

/-- **THE FULL ARTIN–SCHREIER ALGEBRAIC CLOSURE.**  The quadratic extension
`Cut[i] = Cut[X]/(X²+1)` of the derived ℝ `Cut` is ALGEBRAICALLY CLOSED — the classical
Artin–Schreier theorem (a real closed field `R` has `R[i]` algebraically closed), BUILT over the
banked trunk (RUNBOOK W1 — Mathlib genuinely lacks the Sylow-in-field-theory glue: `IsRealClosed`
is a 127-line stub with no algebraic closure, no degree-≤2 factorization over abstract real-closed
fields).

The assembly of the four banked bricks: for a monic irreducible `p` over `Cut[i]`, let
`K := Cut[i][X]/(p)` (finite over `Cut[i]`, hence over `Cut`), `Ω` an algebraic closure of `K`
(Galois over `Cut` since `Cut` is `CharZero`), and `M` the normal closure of `K` over `Cut`
inside `Ω` — a finite GALOIS extension of `Cut`.  By `cut_galois_finrank_two_power`,
`finrank Cut M = 2 ^ n`; the degree-2 tower `Cut ⊆ Cut[i] ⊆ M` (`cuti_finrank_eq_two`) gives
`finrank Cut[i] M = 2 ^ (n-1)`, and `M` is GALOIS over `Cut[i]` (tower-top), so
`cuti_galois_two_group_trivial` forces `finrank Cut[i] M = 1`.  The intermediate tower
`Cut[i] ⊆ K ⊆ M` then forces `finrank Cut[i] K = 1`, i.e. `p.natDegree = 1`, so `p` has a root
`-(p.coeff 0)` in `Cut[i]`.  `IsAlgClosed.of_exists_root` concludes. -/
instance cuti_isAlgClosed : IsAlgClosed Cuti := by
  apply IsAlgClosed.of_exists_root
  intro p hmon hirr
  haveI : Fact (Irreducible p) := ⟨hirr⟩
  -- K := AdjoinRoot p, finite over Cut[i] and over Cut
  let K := AdjoinRoot p
  haveI : FiniteDimensional Cuti K :=
    (AdjoinRoot.powerBasis hirr.ne_zero).finite
  haveI : FiniteDimensional Cut Cuti := Module.finite_of_finrank_eq_succ cuti_finrank_eq_two
  haveI : FiniteDimensional Cut K := FiniteDimensional.trans Cut Cuti K
  -- Ω = AlgebraicClosure K, algebraic & Galois over Cut
  let Ω := AlgebraicClosure K
  haveI h1 : Algebra.IsAlgebraic Cut K := Algebra.IsAlgebraic.of_finite Cut K
  haveI : Algebra.IsAlgebraic Cut Ω := Algebra.IsAlgebraic.trans Cut K Ω
  haveI : IsGalois Cut Ω := IsAlgClosure.isGalois Cut Ω
  -- M = normal closure of K over Cut: finite Galois over Cut
  let M := IntermediateField.normalClosure Cut K Ω
  haveI : FiniteDimensional Cut M := normalClosure.is_finiteDimensional Cut K Ω
  haveI : IsGalois Cut M := IsGalois.normalClosure Cut K Ω
  -- build Algebra Cut[i] M via Cut[i] → K → M, compatible with the existing Algebra Cut M
  letI algCutiM : Algebra Cuti M := ((algebraMap K M).comp (algebraMap Cuti K)).toAlgebra
  haveI towCutiKM : IsScalarTower Cuti K M := IsScalarTower.of_algebraMap_eq (fun _ => rfl)
  haveI towCutCutiM : IsScalarTower Cut Cuti M := by
    apply IsScalarTower.of_algebraMap_eq
    intro x
    have e1 : algebraMap Cut M x = algebraMap K M (algebraMap Cut K x) :=
      IsScalarTower.algebraMap_apply Cut K M x
    have e2 : algebraMap Cut K x = algebraMap Cuti K (algebraMap Cut Cuti x) :=
      IsScalarTower.algebraMap_apply Cut Cuti K x
    rw [e1, e2]; rfl
  haveI : FiniteDimensional Cuti M := Module.Finite.right Cut Cuti M
  haveI : IsGalois Cuti M := IsGalois.tower_top_of_isGalois Cut Cuti M
  -- finrank arithmetic: 2^n over Cut, factor out the degree-2 Cut[i]
  obtain ⟨n, hn⟩ := cut_galois_finrank_two_power M
  have htower2 : Module.finrank Cut Cuti * Module.finrank Cuti M = Module.finrank Cut M :=
    Module.finrank_mul_finrank Cut Cuti M
  rw [cuti_finrank_eq_two, hn] at htower2
  have hpos : 0 < Module.finrank Cuti M := Module.finrank_pos
  have hn1 : 1 ≤ n := by
    rcases Nat.eq_zero_or_pos n with h0 | hp
    · rw [h0, pow_zero] at htower2; omega
    · exact hp
  have hfr_cuti : Module.finrank Cuti M = 2 ^ (n - 1) := by
    have : 2 * Module.finrank Cuti M = 2 * 2 ^ (n - 1) := by
      rw [htower2, ← pow_succ']; congr 1; omega
    exact Nat.eq_of_mul_eq_mul_left (by norm_num) this
  -- brick D: a 2-group Galois extension of Cut[i] is trivial
  have hexp0 : n - 1 = 0 := cuti_galois_two_group_trivial M (n - 1) hfr_cuti
  have hMone : Module.finrank Cuti M = 1 := by rw [hfr_cuti, hexp0, pow_zero]
  -- Cut[i] → K → M tower: finrank Cut[i] K ∣ finrank Cut[i] M = 1
  have htowerK : Module.finrank Cuti K * Module.finrank K M = Module.finrank Cuti M :=
    Module.finrank_mul_finrank Cuti K M
  rw [hMone] at htowerK
  have hKone : Module.finrank Cuti K = 1 := Nat.eq_one_of_mul_eq_one_right htowerK
  -- finrank Cut[i] (AdjoinRoot p) = natDegree p
  have hdeg : (AdjoinRoot.powerBasis hirr.ne_zero).dim = Module.finrank Cuti K :=
    (AdjoinRoot.powerBasis hirr.ne_zero).finrank.symm
  rw [hKone, AdjoinRoot.powerBasis_dim hirr.ne_zero] at hdeg
  have hp1 : p.natDegree = 1 := hdeg
  -- monic degree-1 polynomial p = X + C (p.coeff 0); root is -(p.coeff 0)
  have hpform : p = X + C (p.coeff 0) := by
    have h := eq_X_add_C_of_natDegree_le_one (p := p) (by omega)
    have hlc : p.coeff 1 = 1 := by
      have := hmon.coeff_natDegree; rwa [hp1] at this
    rw [hlc, C_1, one_mul] at h
    exact h
  refine ⟨-(p.coeff 0), ?_⟩
  rw [hpform]; simp

end
end Phys.Algebra
