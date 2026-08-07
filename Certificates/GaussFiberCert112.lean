/-
  Certificates.GaussFiberCert112 — fiber-h=112 EXCLUSION certificate for
  D = −15164915 (first odd-disc fundamental above X₀(112)).
  112 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −15164915 has size > 112,
  so h(−15164915) ≥ 113 — D is excluded from every fiber ≤ 112.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert112
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 5, 7, 11, 13, 19, 37, 41, 43, 53, 73, 79, 97, 101, 131, 139, 149, 167, 173, 179, 181, 191, 199, 223, 227, 233, 239, 241, 251, 257, 271, 277, 311, 337, 353, 367, 383, 401, 421, 433, 461, 467, 479, 491, 499, 503, 509, 521, 541, 547, 557, 571, 617, 641, 643, 653, 659, 673, 677, 739, 743, 769, 787, 797, 823, 827, 839, 853, 859, 877, 911, 919, 929, 937, 983, 991, 1009, 1013, 1019, 1031, 1033, 1039, 1049, 1061, 1069, 1087, 1103, 1117, 1129, 1171, 1201, 1213, 1217, 1223, 1231, 1237, 1249, 1259, 1277, 1279, 1321, 1381, 1399, 1429, 1433, 1459, 1471, 1489, 1499, 1511, 1523, 1531]

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
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -15164915) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -15164915 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    112 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -15164915) (c₀ := 3791229) (ps := ps) (h := 112)
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
    fin_cases hp <;> [exact ⟨0, 1263743, by norm_num⟩; exact ⟨2, 758247, by norm_num⟩; exact ⟨2, 541605, by norm_num⟩; exact ⟨4, 344659, by norm_num⟩; exact ⟨0, 291633, by norm_num⟩; exact ⟨3, 199539, by norm_num⟩; exact ⟨16, 102473, by norm_num⟩; exact ⟨0, 92469, by norm_num⟩; exact ⟨14, 88173, by norm_num⟩; exact ⟨4, 71533, by norm_num⟩; exact ⟨27, 51945, by norm_num⟩; exact ⟨38, 48009, by norm_num⟩; exact ⟨14, 39087, by norm_num⟩; exact ⟨14, 37539, by norm_num⟩; exact ⟨6, 28941, by norm_num⟩; exact ⟨23, 27279, by norm_num⟩; exact ⟨46, 25459, by norm_num⟩; exact ⟨22, 22705, by norm_num⟩; exact ⟨72, 21945, by norm_num⟩; exact ⟨83, 21219, by norm_num⟩; exact ⟨64, 20969, by norm_num⟩; exact ⟨82, 19885, by norm_num⟩; exact ⟨86, 19089, by norm_num⟩; exact ⟨36, 17007, by norm_num⟩; exact ⟨35, 16707, by norm_num⟩; exact ⟨19, 16273, by norm_num⟩; exact ⟨22, 15865, by norm_num⟩; exact ⟨48, 15741, by norm_num⟩; exact ⟨87, 15135, by norm_num⟩; exact ⟨53, 14763, by norm_num⟩; exact ⟨115, 14039, by norm_num⟩; exact ⟨137, 13755, by norm_num⟩; exact ⟨109, 12229, by norm_num⟩; exact ⟨95, 11277, by norm_num⟩; exact ⟨160, 10813, by norm_num⟩; exact ⟨49, 10337, by norm_num⟩; exact ⟨114, 9933, by norm_num⟩; exact ⟨81, 9471, by norm_num⟩; exact ⟨39, 9009, by norm_num⟩; exact ⟨23, 8757, by norm_num⟩; exact ⟨188, 8301, by norm_num⟩; exact ⟨134, 8157, by norm_num⟩; exact ⟨7, 7915, by norm_num⟩; exact ⟨68, 7731, by norm_num⟩; exact ⟨213, 7689, by norm_num⟩; exact ⟨62, 7545, by norm_num⟩; exact ⟨73, 7459, by norm_num⟩; exact ⟨221, 7371, by norm_num⟩; exact ⟨41, 7011, by norm_num⟩; exact ⟨33, 6933, by norm_num⟩; exact ⟨224, 6897, by norm_num⟩; exact ⟨129, 6669, by norm_num⟩; exact ⟨106, 6163, by norm_num⟩; exact ⟨212, 5985, by norm_num⟩; exact ⟨83, 5907, by norm_num⟩; exact ⟨264, 5913, by norm_num⟩; exact ⟨195, 5811, by norm_num⟩; exact ⟨288, 5757, by norm_num⟩; exact ⟨304, 5737, by norm_num⟩; exact ⟨308, 5259, by norm_num⟩; exact ⟨177, 5145, by norm_num⟩; exact ⟨261, 5019, by norm_num⟩; exact ⟨354, 4977, by norm_num⟩; exact ⟨211, 4813, by norm_num⟩; exact ⟨337, 4745, by norm_num⟩; exact ⟨373, 4753, by norm_num⟩; exact ⟨164, 4551, by norm_num⟩; exact ⟨383, 4617, by norm_num⟩; exact ⟨68, 4419, by norm_num⟩; exact ⟨6, 4323, by norm_num⟩; exact ⟨390, 4329, by norm_num⟩; exact ⟨280, 4211, by norm_num⟩; exact ⟨4, 4081, by norm_num⟩; exact ⟨444, 4257, by norm_num⟩; exact ⟨160, 3883, by norm_num⟩; exact ⟨242, 3885, by norm_num⟩; exact ⟨87, 3765, by norm_num⟩; exact ⟨415, 3913, by norm_num⟩; exact ⟨335, 3831, by norm_num⟩; exact ⟨511, 3931, by norm_num⟩; exact ⟨370, 3803, by norm_num⟩; exact ⟨381, 3789, by norm_num⟩; exact ⟨161, 3639, by norm_num⟩; exact ⟨379, 3709, by norm_num⟩; exact ⟨51, 3549, by norm_num⟩; exact ⟨144, 3507, by norm_num⟩; exact ⟨252, 3495, by norm_num⟩; exact ⟨399, 3537, by norm_num⟩; exact ⟨347, 3465, by norm_num⟩; exact ⟨40, 3239, by norm_num⟩; exact ⟨392, 3285, by norm_num⟩; exact ⟨161, 3147, by norm_num⟩; exact ⟨526, 3343, by norm_num⟩; exact ⟨571, 3367, by norm_num⟩; exact ⟨38, 3081, by norm_num⟩; exact ⟨165, 3087, by norm_num⟩; exact ⟨516, 3249, by norm_num⟩; exact ⟨110, 3021, by norm_num⟩; exact ⟨335, 3057, by norm_num⟩; exact ⟨269, 3021, by norm_num⟩; exact ⟨254, 2919, by norm_num⟩; exact ⟨475, 2909, by norm_num⟩; exact ⟨277, 2765, by norm_num⟩; exact ⟨297, 2715, by norm_num⟩; exact ⟨459, 2793, by norm_num⟩; exact ⟨401, 2709, by norm_num⟩; exact ⟨253, 2621, by norm_num⟩; exact ⟨167, 2565, by norm_num⟩; exact ⟨589, 2761, by norm_num⟩; exact ⟨538, 2701, by norm_num⟩; exact ⟨638, 2757, by norm_num⟩; exact ⟨648, 2751, by norm_num⟩]
  · show 112 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert112
