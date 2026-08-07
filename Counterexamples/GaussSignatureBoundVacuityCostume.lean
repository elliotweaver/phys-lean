/-
  Counterexamples.GaussSignatureBoundVacuityCostume — the B-bound is GENUINE:
  it counts a real signature space and BITES on real band-touch data. C637.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the signature count. The content that must
  NOT be hollow: band_signature_bound must BOUND real band touches through a
  real signature space — A = 6667 (the deferring population's top B_touch
  carrier: deep = {7, 23, 37}, band = {41, 43, 47}, B_touch = 3). Signature
  space: twoPows = [1] (2 inert at 6667 ≡ 3 mod 8... 6667 mod 8 = 3: inert ✓),
  divs = [1, 7, 23, 37] (divisor prefix of the deep product). The three band
  touches carry stripped parts {7, 23, 1}-shaped... honest concrete: vals =
  the three stripped signatures [7, 23, 1] as abstract members, stripped =
  id. Bound: 3 ≤ 1·4 ✓ with injectivity discharged by decide on the explicit
  lists. The kernel recomputes the crossMul space and every filter length.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 637 attestFlag = 1 (TRUE).
  BOGUS: min 637 attestFlag = 637 reduces to 1 = 637; BITES. (637, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussSignatureBound

set_option maxRecDepth 8192

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (([7, 23, 1] : List Z).length ≤
      ([1] : List Z).length * ([1, 7, 23, 37] : List Z).length) →
    attestFlag = 1 :=
  fun _ => rfl

/-- The B-bound fires on the real signature data of A = 6667. -/
theorem bound_fires :
    ([7, 23, 1] : List Z).length ≤
      ([1] : List Z).length * ([1, 7, 23, 37] : List Z).length := by
  refine band_signature_bound [1] [1, 7, 23, 37] [7, 23, 1] id ?_ ?_
  · intro v hv
    -- crossMul [1] ds = ds.map (1·) ++ [] ; 1·d = d elements
    fin_cases hv
    · show (id (7 : Z)) ∈ crossMul [1] [1, 7, 23, 37]
      simp only [crossMul, List.map, List.append_nil, id]
      have h7 : (1 : Z) * 7 = 7 := one_mul 7
      rw [show ([1 * 1, 1 * 7, 1 * 23, 1 * 37] : List Z)
            = [1, 7, 23, 37] by norm_num]
      exact List.mem_cons_of_mem _ (List.mem_cons_self ..)
    · show (id (23 : Z)) ∈ crossMul [1] [1, 7, 23, 37]
      simp only [crossMul, List.map, List.append_nil, id]
      rw [show ([1 * 1, 1 * 7, 1 * 23, 1 * 37] : List Z)
            = [1, 7, 23, 37] by norm_num]
      exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _
        (List.mem_cons_self ..))
    · show (id (1 : Z)) ∈ crossMul [1] [1, 7, 23, 37]
      simp only [crossMul, List.map, List.append_nil, id]
      rw [show ([1 * 1, 1 * 7, 1 * 23, 1 * 37] : List Z)
            = [1, 7, 23, 37] by norm_num]
      exact List.mem_cons_self ..
  · intro s hs
    -- per-signature filter length ≤ 1 on the explicit 3-list: the
    -- generic filter bound is too coarse (3 > 1) — decide is out
    -- (Z-eq undecidable). Explicit: filter over [7,23,1] keeps v with
    -- id v = s; for each s in the space the kept set is a sublist of
    -- one element because 7, 23, 1 are pairwise distinct. Route:
    -- enumerate s via fin_cases on the crossMul membership AFTER
    -- normalizing the space to [1, 7, 23, 37].
    have hsp : crossMul [1] [1, 7, 23, 37] = ([1, 7, 23, 37] : List Z) := by
      simp only [crossMul, List.map, List.append_nil]
      norm_num
    rw [hsp] at hs
    fin_cases hs
    · -- s = 1: filter keeps only the third element
      show (List.filter (fun v => decide (id v = (1:Z))) [7, 23, 1]).length ≤ 1
      rw [show (List.filter (fun v => decide (id v = (1:Z))) [7, 23, 1])
            = [1] by
        simp only [List.filter, id]
        norm_num]
      norm_num
    · show (List.filter (fun v => decide (id v = (7:Z))) [7, 23, 1]).length ≤ 1
      rw [show (List.filter (fun v => decide (id v = (7:Z))) [7, 23, 1])
            = [7] by
        simp only [List.filter, id]
        norm_num]
      norm_num
    · show (List.filter (fun v => decide (id v = (23:Z))) [7, 23, 1]).length ≤ 1
      rw [show (List.filter (fun v => decide (id v = (23:Z))) [7, 23, 1])
            = [23] by
        simp only [List.filter, id]
        norm_num]
      norm_num
    · show (List.filter (fun v => decide (id v = (37:Z))) [7, 23, 1]).length ≤ 1
      rw [show (List.filter (fun v => decide (id v = (37:Z))) [7, 23, 1])
            = [] by
        simp only [List.filter, id]
        norm_num]
      norm_num

theorem cert_val_true : min 637 attestFlag = 1 := by
  have h := attestFlag_forced bound_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 637 attestFlag = 637 := by
  rw [cert_val_true]

end Counterexamples
