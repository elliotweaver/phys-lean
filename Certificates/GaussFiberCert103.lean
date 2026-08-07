/-
  Certificates.GaussFiberCert103 — fiber-h=103 EXCLUSION certificate for
  D = −12197335 (first odd-disc fundamental above X₀(103)).
  103 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −12197335 has size > 103,
  so h(−12197335) ≥ 104 — D is excluded from every fiber ≤ 103.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert103
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [5, 7, 11, 19, 23, 29, 31, 37, 41, 61, 67, 73, 97, 101, 103, 107, 113, 131, 137, 139, 149, 163, 167, 179, 193, 229, 233, 239, 277, 281, 283, 293, 313, 337, 359, 367, 373, 379, 397, 409, 431, 433, 439, 443, 449, 463, 479, 487, 499, 521, 523, 547, 557, 569, 577, 587, 599, 601, 607, 613, 617, 643, 653, 673, 683, 691, 701, 709, 719, 733, 739, 743, 769, 787, 823, 829, 839, 863, 881, 883, 907, 941, 947, 953, 977, 983, 1019, 1063, 1069, 1087, 1091, 1109, 1123, 1129, 1187, 1193, 1201, 1223, 1249, 1277, 1283, 1291, 1297]

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
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -12197335) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -12197335 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    103 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -12197335) (c₀ := 3049334) (ps := ps) (h := 103)
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
    fin_cases hp <;> [exact ⟨2, 609868, by norm_num⟩; exact ⟨2, 435620, by norm_num⟩; exact ⟨4, 277214, by norm_num⟩; exact ⟨9, 160496, by norm_num⟩; exact ⟨2, 132580, by norm_num⟩; exact ⟨11, 105154, by norm_num⟩; exact ⟨3, 98366, by norm_num⟩; exact ⟨11, 82418, by norm_num⟩; exact ⟨0, 74374, by norm_num⟩; exact ⟨7, 49990, by norm_num⟩; exact ⟨22, 45520, by norm_num⟩; exact ⟨34, 41788, by norm_num⟩; exact ⟨33, 31448, by norm_num⟩; exact ⟨21, 30196, by norm_num⟩; exact ⟨26, 29612, by norm_num⟩; exact ⟨19, 28502, by norm_num⟩; exact ⟨43, 27002, by norm_num⟩; exact ⟨29, 23284, by norm_num⟩; exact ⟨3, 22258, by norm_num⟩; exact ⟨50, 21956, by norm_num⟩; exact ⟨55, 20486, by norm_num⟩; exact ⟨48, 18722, by norm_num⟩; exact ⟨20, 18262, by norm_num⟩; exact ⟨10, 17036, by norm_num⟩; exact ⟨59, 15818, by norm_num⟩; exact ⟨5, 13316, by norm_num⟩; exact ⟨69, 13108, by norm_num⟩; exact ⟨17, 12760, by norm_num⟩; exact ⟨51, 11018, by norm_num⟩; exact ⟨123, 10906, by norm_num⟩; exact ⟨37, 10780, by norm_num⟩; exact ⟨14, 10408, by norm_num⟩; exact ⟨111, 9782, by norm_num⟩; exact ⟨34, 9052, by norm_num⟩; exact ⟨3, 8494, by norm_num⟩; exact ⟨103, 8338, by norm_num⟩; exact ⟨42, 8180, by norm_num⟩; exact ⟨103, 8074, by norm_num⟩; exact ⟨20, 7682, by norm_num⟩; exact ⟨42, 7460, by norm_num⟩; exact ⟨184, 7154, by norm_num⟩; exact ⟨49, 7048, by norm_num⟩; exact ⟨167, 7010, by norm_num⟩; exact ⟨80, 6898, by norm_num⟩; exact ⟨45, 6796, by norm_num⟩; exact ⟨221, 6692, by norm_num⟩; exact ⟨229, 6476, by norm_num⟩; exact ⟨140, 6302, by norm_num⟩; exact ⟨50, 6116, by norm_num⟩; exact ⟨24, 5854, by norm_num⟩; exact ⟨206, 5912, by norm_num⟩; exact ⟨157, 5620, by norm_num⟩; exact ⟨86, 5488, by norm_num⟩; exact ⟨22, 5360, by norm_num⟩; exact ⟨142, 5320, by norm_num⟩; exact ⟨43, 5198, by norm_num⟩; exact ⟨107, 5110, by norm_num⟩; exact ⟨155, 5114, by norm_num⟩; exact ⟨263, 5138, by norm_num⟩; exact ⟨203, 5042, by norm_num⟩; exact ⟨201, 5008, by norm_num⟩; exact ⟨297, 4880, by norm_num⟩; exact ⟨38, 4672, by norm_num⟩; exact ⟨26, 4532, by norm_num⟩; exact ⟨102, 4480, by norm_num⟩; exact ⟨191, 4466, by norm_num⟩; exact ⟨167, 4390, by norm_num⟩; exact ⟨309, 4436, by norm_num⟩; exact ⟨59, 4246, by norm_num⟩; exact ⟨93, 4172, by norm_num⟩; exact ⟨206, 4184, by norm_num⟩; exact ⟨237, 4180, by norm_num⟩; exact ⟨148, 3994, by norm_num⟩; exact ⟨51, 3878, by norm_num⟩; exact ⟨251, 3782, by norm_num⟩; exact ⟨266, 3764, by norm_num⟩; exact ⟨241, 3704, by norm_num⟩; exact ⟨276, 3622, by norm_num⟩; exact ⟨49, 3464, by norm_num⟩; exact ⟨369, 3608, by norm_num⟩; exact ⟨0, 3362, by norm_num⟩; exact ⟨266, 3316, by norm_num⟩; exact ⟨2, 3220, by norm_num⟩; exact ⟨214, 3248, by norm_num⟩; exact ⟨391, 3278, by norm_num⟩; exact ⟨396, 3262, by norm_num⟩; exact ⟨420, 3166, by norm_num⟩; exact ⟨290, 2948, by norm_num⟩; exact ⟨518, 3104, by norm_num⟩; exact ⟨85, 2812, by norm_num⟩; exact ⟨456, 2986, by norm_num⟩; exact ⟨309, 2836, by norm_num⟩; exact ⟨159, 2738, by norm_num⟩; exact ⟨130, 2716, by norm_num⟩; exact ⟨124, 2582, by norm_num⟩; exact ⟨365, 2668, by norm_num⟩; exact ⟨247, 2590, by norm_num⟩; exact ⟨374, 2608, by norm_num⟩; exact ⟨522, 2660, by norm_num⟩; exact ⟨202, 2420, by norm_num⟩; exact ⟨40, 2378, by norm_num⟩; exact ⟨124, 2374, by norm_num⟩; exact ⟨510, 2552, by norm_num⟩]
  · show 103 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert103
