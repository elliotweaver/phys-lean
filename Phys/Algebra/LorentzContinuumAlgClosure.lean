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
  2. (`cut_ext_two_power`)  Every finite Galois extension `M/Cut` has degree a power of 2: a
     2-Sylow `P ≤ Gal(M/Cut)` has fixed field of degree `[G : P]` (odd) over `Cut`, hence by (1)
     degree 1, forcing `P = G`, so `|G|` is a 2-power.  [building, may child]
  3. The descent: a nontrivial finite 2-group `Gal(M/Cut[i])` has an index-2 subgroup, giving a
     degree-2 extension of `Cut[i]` — impossible by N81 degree-2-closure.  [building, may child]
  4. (`cuti_isAlgClosed`)  `IsAlgClosed Cut[i]` via `IsAlgClosed.of_exists_root`.  [building, may child]

PHYSICS-WORDS-REMOVABLE: delete every physics word — over the derived complete ordered field
`Cut` (every nonnegative element a square, every odd-degree polynomial with a root) and its
quadratic extension `Cut[i]` (every element a square), every finite odd-degree extension of
`Cut` is trivial; pure field/polynomial/group math.  No physics word does logical work.

NO posited algebraic closure, NO Mathlib ℝ/ℂ as content, NO bridge — every object descends
from the banked N49–N81 + the derived ℝ `Cut`.
-/
import Phys.Algebra.LorentzContinuumAdjoinI
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.PrimitiveElement
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.GroupTheory.Sylow

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

end
end Phys.Algebra
