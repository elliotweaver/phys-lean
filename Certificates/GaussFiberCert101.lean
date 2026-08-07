/-
  Certificates.GaussFiberCert101 — fiber-h=101 EXCLUSION certificate for
  D = −11758843 (first odd-disc fundamental above X₀(101)).
  101 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −11758843 has size > 101,
  so h(−11758843) ≥ 102 — D is excluded from every fiber ≤ 101.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert101
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [7, 11, 37, 41, 43, 61, 67, 73, 83, 97, 101, 103, 107, 113, 127, 137, 139, 149, 157, 163, 167, 173, 179, 181, 191, 229, 233, 239, 241, 251, 263, 277, 283, 293, 311, 337, 347, 349, 353, 359, 367, 383, 397, 401, 421, 439, 443, 449, 457, 479, 487, 503, 521, 523, 547, 557, 569, 571, 593, 601, 607, 613, 641, 647, 659, 673, 709, 733, 739, 743, 761, 769, 787, 797, 809, 811, 823, 827, 829, 863, 877, 883, 911, 919, 929, 937, 941, 947, 953, 971, 977, 983, 997, 1021, 1033, 1039, 1061, 1063, 1069, 1097, 1109]

theorem ps_pairwise : List.Pairwise (· ≠ ·) ps := by
  apply chain_lt_pairwise_ne
  unfold ps
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -11758843) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -11758843 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    101 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -11758843) (c₀ := 2939711) (ps := ps) (h := 101)
  · norm_num
  · norm_num
  · exact hpw
  · exact hmem
  · exact hcomplete
  · exact hpfL
  · exact hpfa
  · exact ps_pairwise
  · intro p hp
    unfold ps at hp
    fin_cases hp <;> norm_num
  · intro p hp
    unfold ps at hp
    fin_cases hp <;> norm_num
  · intro p hp
    unfold ps at hp
    fin_cases hp <;> [exact ⟨1, 419959, by norm_num⟩; exact ⟨2, 267247, by norm_num⟩; exact ⟨16, 79459, by norm_num⟩; exact ⟨5, 71701, by norm_num⟩; exact ⟨12, 68369, by norm_num⟩; exact ⟨17, 48197, by norm_num⟩; exact ⟨13, 43879, by norm_num⟩; exact ⟨8, 40271, by norm_num⟩; exact ⟨39, 35437, by norm_num⟩; exact ⟨25, 30313, by norm_num⟩; exact ⟨26, 29113, by norm_num⟩; exact ⟨3, 28541, by norm_num⟩; exact ⟨27, 27481, by norm_num⟩; exact ⟨14, 26017, by norm_num⟩; exact ⟨38, 23159, by norm_num⟩; exact ⟨67, 21491, by norm_num⟩; exact ⟨0, 21149, by norm_num⟩; exact ⟨22, 19733, by norm_num⟩; exact ⟨32, 18731, by norm_num⟩; exact ⟨62, 18059, by norm_num⟩; exact ⟨31, 17609, by norm_num⟩; exact ⟨56, 17011, by norm_num⟩; exact ⟨2, 16423, by norm_num⟩; exact ⟨16, 16243, by norm_num⟩; exact ⟨75, 15421, by norm_num⟩; exact ⟨20, 12839, by norm_num⟩; exact ⟨101, 12661, by norm_num⟩; exact ⟨112, 12353, by norm_num⟩; exact ⟨74, 12221, by norm_num⟩; exact ⟨117, 11767, by norm_num⟩; exact ⟨118, 11231, by norm_num⟩; exact ⟨9, 10613, by norm_num⟩; exact ⟨105, 10427, by norm_num⟩; exact ⟨102, 10069, by norm_num⟩; exact ⟨109, 9491, by norm_num⟩; exact ⟨77, 8741, by norm_num⟩; exact ⟨20, 8473, by norm_num⟩; exact ⟨139, 8479, by norm_num⟩; exact ⟨123, 8371, by norm_num⟩; exact ⟨134, 8239, by norm_num⟩; exact ⟨122, 8051, by norm_num⟩; exact ⟨165, 7747, by norm_num⟩; exact ⟨116, 7439, by norm_num⟩; exact ⟨4, 7331, by norm_num⟩; exact ⟨11, 6983, by norm_num⟩; exact ⟨16, 6697, by norm_num⟩; exact ⟨164, 6697, by norm_num⟩; exact ⟨179, 6619, by norm_num⟩; exact ⟨86, 6449, by norm_num⟩; exact ⟨29, 6139, by norm_num⟩; exact ⟨47, 6041, by norm_num⟩; exact ⟨91, 5861, by norm_num⟩; exact ⟨103, 5663, by norm_num⟩; exact ⟨8, 5621, by norm_num⟩; exact ⟨271, 5509, by norm_num⟩; exact ⟨42, 5281, by norm_num⟩; exact ⟨84, 5179, by norm_num⟩; exact ⟨51, 5153, by norm_num⟩; exact ⟨46, 4961, by norm_num⟩; exact ⟨221, 4973, by norm_num⟩; exact ⟨98, 4859, by norm_num⟩; exact ⟨114, 4817, by norm_num⟩; exact ⟨149, 4621, by norm_num⟩; exact ⟨240, 4633, by norm_num⟩; exact ⟨37, 4463, by norm_num⟩; exact ⟨202, 4429, by norm_num⟩; exact ⟨217, 4213, by norm_num⟩; exact ⟨353, 4181, by norm_num⟩; exact ⟨146, 4007, by norm_num⟩; exact ⟨244, 4037, by norm_num⟩; exact ⟨123, 3883, by norm_num⟩; exact ⟨136, 3847, by norm_num⟩; exact ⟨271, 3829, by norm_num⟩; exact ⟨312, 3811, by norm_num⟩; exact ⟨103, 3647, by norm_num⟩; exact ⟨121, 3643, by norm_num⟩; exact ⟨64, 3577, by norm_num⟩; exact ⟨168, 3589, by norm_num⟩; exact ⟨252, 3623, by norm_num⟩; exact ⟨47, 3409, by norm_num⟩; exact ⟨29, 3353, by norm_num⟩; exact ⟨411, 3521, by norm_num⟩; exact ⟨420, 3421, by norm_num⟩; exact ⟨439, 3409, by norm_num⟩; exact ⟨65, 3169, by norm_num⟩; exact ⟨449, 3353, by norm_num⟩; exact ⟨191, 3163, by norm_num⟩; exact ⟨442, 3311, by norm_num⟩; exact ⟨227, 3139, by norm_num⟩; exact ⟨205, 3071, by norm_num⟩; exact ⟨356, 3139, by norm_num⟩; exact ⟨404, 3157, by norm_num⟩; exact ⟨210, 2993, by norm_num⟩; exact ⟨118, 2893, by norm_num⟩; exact ⟨57, 2849, by norm_num⟩; exact ⟨318, 2927, by norm_num⟩; exact ⟨432, 2947, by norm_num⟩; exact ⟨301, 2851, by norm_num⟩; exact ⟨505, 2989, by norm_num⟩; exact ⟨59, 2683, by norm_num⟩; exact ⟨95, 2659, by norm_num⟩]
  · show 101 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert101
