/-
  Certificates.GaussFiberCert109 — fiber-h=109 EXCLUSION certificate for
  D = −13184571 (first odd-disc fundamental above X₀(109)).
  109 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −13184571 has size > 109,
  so h(−13184571) ≥ 110 — D is excluded from every fiber ≤ 109.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert109
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 5, 13, 17, 19, 23, 31, 37, 41, 59, 67, 71, 73, 79, 89, 101, 107, 127, 131, 151, 157, 163, 181, 193, 223, 227, 229, 233, 251, 263, 271, 277, 283, 311, 313, 349, 353, 367, 379, 383, 397, 419, 421, 431, 439, 443, 457, 463, 487, 509, 521, 541, 547, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 641, 643, 647, 659, 661, 677, 683, 691, 701, 709, 719, 727, 733, 739, 751, 773, 787, 809, 821, 823, 853, 857, 877, 881, 887, 907, 967, 977, 991, 997, 1009, 1013, 1033, 1051, 1069, 1091, 1097, 1109, 1123, 1151, 1153, 1163, 1181, 1187]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -13184571) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -13184571 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    109 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -13184571) (c₀ := 3296143) (ps := ps) (h := 109)
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
    fin_cases hp <;> [exact ⟨1, 1098715, by norm_num⟩; exact ⟨1, 659229, by norm_num⟩; exact ⟨4, 253551, by norm_num⟩; exact ⟨8, 193895, by norm_num⟩; exact ⟨8, 173485, by norm_num⟩; exact ⟨7, 143313, by norm_num⟩; exact ⟨7, 106329, by norm_num⟩; exact ⟨1, 89085, by norm_num⟩; exact ⟨19, 80403, by norm_num⟩; exact ⟨24, 55877, by norm_num⟩; exact ⟨7, 49197, by norm_num⟩; exact ⟨24, 46433, by norm_num⟩; exact ⟨27, 45163, by norm_num⟩; exact ⟨11, 41725, by norm_num⟩; exact ⟨22, 37041, by norm_num⟩; exact ⟨37, 32649, by norm_num⟩; exact ⟨20, 30809, by norm_num⟩; exact ⟨25, 25959, by norm_num⟩; exact ⟨14, 25163, by norm_num⟩; exact ⟨60, 21853, by norm_num⟩; exact ⟨8, 20995, by norm_num⟩; exact ⟨46, 20235, by norm_num⟩; exact ⟨57, 18229, by norm_num⟩; exact ⟨56, 17095, by norm_num⟩; exact ⟨4, 14781, by norm_num⟩; exact ⟨80, 14549, by norm_num⟩; exact ⟨92, 14431, by norm_num⟩; exact ⟨75, 14171, by norm_num⟩; exact ⟨15, 13133, by norm_num⟩; exact ⟨56, 12545, by norm_num⟩; exact ⟨5, 12163, by norm_num⟩; exact ⟨90, 11929, by norm_num⟩; exact ⟨103, 11685, by norm_num⟩; exact ⟨106, 10635, by norm_num⟩; exact ⟨79, 10551, by norm_num⟩; exact ⟨47, 9451, by norm_num⟩; exact ⟨98, 9365, by norm_num⟩; exact ⟨145, 9039, by norm_num⟩; exact ⟨4, 8697, by norm_num⟩; exact ⟨75, 8621, by norm_num⟩; exact ⟨191, 8395, by norm_num⟩; exact ⟨42, 7871, by norm_num⟩; exact ⟨178, 7905, by norm_num⟩; exact ⟨104, 7673, by norm_num⟩; exact ⟨183, 7585, by norm_num⟩; exact ⟨152, 7493, by norm_num⟩; exact ⟨142, 7257, by norm_num⟩; exact ⟨42, 7123, by norm_num⟩; exact ⟨100, 6789, by norm_num⟩; exact ⟨25, 6477, by norm_num⟩; exact ⟨141, 6365, by norm_num⟩; exact ⟨246, 6205, by norm_num⟩; exact ⟨170, 6079, by norm_num⟩; exact ⟨76, 5865, by norm_num⟩; exact ⟨175, 5847, by norm_num⟩; exact ⟨15, 5773, by norm_num⟩; exact ⟨156, 5755, by norm_num⟩; exact ⟨290, 5759, by norm_num⟩; exact ⟨282, 5693, by norm_num⟩; exact ⟨50, 5507, by norm_num⟩; exact ⟨18, 5485, by norm_num⟩; exact ⟨127, 5457, by norm_num⟩; exact ⟨242, 5473, by norm_num⟩; exact ⟨41, 5345, by norm_num⟩; exact ⟨179, 5377, by norm_num⟩; exact ⟨115, 5163, by norm_num⟩; exact ⟨315, 5281, by norm_num⟩; exact ⟨301, 5235, by norm_num⟩; exact ⟨93, 5015, by norm_num⟩; exact ⟨209, 5053, by norm_num⟩; exact ⟨337, 5037, by norm_num⟩; exact ⟨78, 4835, by norm_num⟩; exact ⟨335, 4933, by norm_num⟩; exact ⟨173, 4745, by norm_num⟩; exact ⟨106, 4665, by norm_num⟩; exact ⟨306, 4715, by norm_num⟩; exact ⟨47, 4537, by norm_num⟩; exact ⟨67, 4503, by norm_num⟩; exact ⟨70, 4467, by norm_num⟩; exact ⟨268, 4485, by norm_num⟩; exact ⟨26, 4265, by norm_num⟩; exact ⟨24, 4189, by norm_num⟩; exact ⟨332, 4211, by norm_num⟩; exact ⟨292, 4119, by norm_num⟩; exact ⟨194, 4051, by norm_num⟩; exact ⟨26, 3865, by norm_num⟩; exact ⟨49, 3849, by norm_num⟩; exact ⟨262, 3837, by norm_num⟩; exact ⟨365, 3893, by norm_num⟩; exact ⟨232, 3777, by norm_num⟩; exact ⟨409, 3819, by norm_num⟩; exact ⟨78, 3415, by norm_num⟩; exact ⟨371, 3515, by norm_num⟩; exact ⟨129, 3343, by norm_num⟩; exact ⟨250, 3369, by norm_num⟩; exact ⟨373, 3405, by norm_num⟩; exact ⟨344, 3371, by norm_num⟩; exact ⟨380, 3331, by norm_num⟩; exact ⟨433, 3315, by norm_num⟩; exact ⟨41, 3085, by norm_num⟩; exact ⟨336, 3125, by norm_num⟩; exact ⟨18, 3005, by norm_num⟩; exact ⟨207, 3011, by norm_num⟩; exact ⟨250, 2991, by norm_num⟩; exact ⟨156, 2885, by norm_num⟩; exact ⟨296, 2935, by norm_num⟩; exact ⟨212, 2873, by norm_num⟩; exact ⟨426, 2945, by norm_num⟩; exact ⟨12, 2777, by norm_num⟩]
  · show 109 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert109
