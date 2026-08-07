/-
  Certificates.GaussFiberCert110 — fiber-h=110 EXCLUSION certificate for
  D = −13947439 (first odd-disc fundamental above X₀(110)).
  110 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −13947439 has size > 110,
  so h(−13947439) ≥ 111 — D is excluded from every fiber ≤ 110.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert110
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [5, 11, 13, 19, 29, 31, 37, 41, 43, 79, 89, 97, 103, 107, 127, 131, 137, 139, 149, 157, 163, 173, 181, 193, 197, 211, 227, 257, 269, 281, 283, 293, 311, 317, 331, 349, 383, 397, 421, 431, 457, 463, 487, 499, 509, 523, 547, 557, 563, 569, 577, 587, 593, 601, 617, 641, 643, 647, 673, 677, 683, 701, 709, 727, 743, 761, 769, 797, 821, 823, 827, 853, 859, 877, 881, 883, 907, 911, 937, 947, 953, 971, 1009, 1013, 1019, 1021, 1031, 1033, 1049, 1051, 1061, 1063, 1069, 1093, 1097, 1109, 1129, 1153, 1163, 1187, 1213, 1217, 1223, 1249, 1279, 1289, 1297, 1319, 1321, 1367]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -13947439) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -13947439 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    110 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -13947439) (c₀ := 3486860) (ps := ps) (h := 110)
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
    fin_cases hp <;> [exact ⟨0, 697372, by norm_num⟩; exact ⟨5, 316990, by norm_num⟩; exact ⟨0, 268220, by norm_num⟩; exact ⟨4, 183520, by norm_num⟩; exact ⟨6, 120238, by norm_num⟩; exact ⟨4, 112480, by norm_num⟩; exact ⟨4, 94240, by norm_num⟩; exact ⟨16, 85052, by norm_num⟩; exact ⟨13, 81094, by norm_num⟩; exact ⟨6, 44138, by norm_num⟩; exact ⟨37, 39194, by norm_num⟩; exact ⟨35, 35960, by norm_num⟩; exact ⟨46, 33874, by norm_num⟩; exact ⟨7, 32588, by norm_num⟩; exact ⟨17, 27458, by norm_num⟩; exact ⟨65, 26650, by norm_num⟩; exact ⟨47, 25468, by norm_num⟩; exact ⟨25, 25090, by norm_num⟩; exact ⟨73, 23438, by norm_num⟩; exact ⟨10, 22210, by norm_num⟩; exact ⟨54, 21410, by norm_num⟩; exact ⟨50, 20170, by norm_num⟩; exact ⟨62, 19286, by norm_num⟩; exact ⟨25, 18070, by norm_num⟩; exact ⟨56, 17716, by norm_num⟩; exact ⟨55, 16540, by norm_num⟩; exact ⟨101, 15406, by norm_num⟩; exact ⟨72, 13588, by norm_num⟩; exact ⟨45, 12970, by norm_num⟩; exact ⟨87, 12436, by norm_num⟩; exact ⟨90, 12350, by norm_num⟩; exact ⟨75, 11920, by norm_num⟩; exact ⟨8, 11212, by norm_num⟩; exact ⟨80, 11020, by norm_num⟩; exact ⟨76, 10552, by norm_num⟩; exact ⟨122, 10034, by norm_num⟩; exact ⟨151, 9164, by norm_num⟩; exact ⟨181, 8866, by norm_num⟩; exact ⟨158, 8342, by norm_num⟩; exact ⟨185, 8170, by norm_num⟩; exact ⟨186, 7706, by norm_num⟩; exact ⟨64, 7540, by norm_num⟩; exact ⟨209, 7250, by norm_num⟩; exact ⟨105, 7010, by norm_num⟩; exact ⟨118, 6878, by norm_num⟩; exact ⟨220, 6760, by norm_num⟩; exact ⟨28, 6376, by norm_num⟩; exact ⟨176, 6316, by norm_num⟩; exact ⟨147, 6232, by norm_num⟩; exact ⟨154, 6170, by norm_num⟩; exact ⟨257, 6158, by norm_num⟩; exact ⟨96, 5956, by norm_num⟩; exact ⟨48, 5884, by norm_num⟩; exact ⟨92, 5816, by norm_num⟩; exact ⟨154, 5690, by norm_num⟩; exact ⟨152, 5476, by norm_num⟩; exact ⟨228, 5504, by norm_num⟩; exact ⟨131, 5416, by norm_num⟩; exact ⟨202, 5242, by norm_num⟩; exact ⟨131, 5176, by norm_num⟩; exact ⟨100, 5120, by norm_num⟩; exact ⟨105, 4990, by norm_num⟩; exact ⟨1, 4918, by norm_num⟩; exact ⟨92, 4808, by norm_num⟩; exact ⟨356, 4864, by norm_num⟩; exact ⟨6, 4582, by norm_num⟩; exact ⟨53, 4538, by norm_num⟩; exact ⟨28, 4376, by norm_num⟩; exact ⟨63, 4252, by norm_num⟩; exact ⟨245, 4310, by norm_num⟩; exact ⟨55, 4220, by norm_num⟩; exact ⟨280, 4180, by norm_num⟩; exact ⟨423, 4268, by norm_num⟩; exact ⟨355, 4120, by norm_num⟩; exact ⟨157, 3986, by norm_num⟩; exact ⟨52, 3952, by norm_num⟩; exact ⟨309, 3950, by norm_num⟩; exact ⟨429, 4030, by norm_num⟩; exact ⟨360, 3860, by norm_num⟩; exact ⟨61, 3686, by norm_num⟩; exact ⟨325, 3770, by norm_num⟩; exact ⟨173, 3622, by norm_num⟩; exact ⟨394, 3610, by norm_num⟩; exact ⟨424, 3620, by norm_num⟩; exact ⟨442, 3614, by norm_num⟩; exact ⟨177, 3446, by norm_num⟩; exact ⟨244, 3440, by norm_num⟩; exact ⟨295, 3460, by norm_num⟩; exact ⟨102, 3334, by norm_num⟩; exact ⟨361, 3442, by norm_num⟩; exact ⟨318, 3382, by norm_num⟩; exact ⟨63, 3284, by norm_num⟩; exact ⟨139, 3280, by norm_num⟩; exact ⟨455, 3380, by norm_num⟩; exact ⟨291, 3256, by norm_num⟩; exact ⟨225, 3190, by norm_num⟩; exact ⟨132, 3104, by norm_num⟩; exact ⟨106, 3034, by norm_num⟩; exact ⟨484, 3200, by norm_num⟩; exact ⟨224, 2980, by norm_num⟩; exact ⟨153, 2894, by norm_num⟩; exact ⟨428, 3016, by norm_num⟩; exact ⟨104, 2860, by norm_num⟩; exact ⟨618, 3098, by norm_num⟩; exact ⟨510, 2930, by norm_num⟩; exact ⟨381, 2818, by norm_num⟩; exact ⟨45, 2690, by norm_num⟩; exact ⟨76, 2648, by norm_num⟩; exact ⟨474, 2810, by norm_num⟩; exact ⟨259, 2600, by norm_num⟩]
  · show 110 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert110
