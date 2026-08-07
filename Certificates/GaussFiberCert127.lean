/-
  Certificates.GaussFiberCert127 — fiber-h=127 EXCLUSION certificate for
  D = −19593699 (first odd-disc fundamental above X₀(127)).
  127 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −19593699 has size > 127,
  so h(−19593699) ≥ 128 — D is excluded from every fiber ≤ 127.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert127
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 5, 7, 17, 23, 29, 37, 41, 43, 47, 67, 71, 73, 83, 107, 113, 127, 131, 157, 167, 181, 191, 199, 211, 223, 227, 229, 233, 241, 251, 263, 283, 293, 307, 311, 331, 337, 347, 353, 359, 367, 373, 379, 419, 433, 443, 449, 467, 479, 487, 491, 509, 521, 523, 547, 563, 587, 593, 599, 619, 641, 647, 661, 673, 677, 683, 691, 709, 719, 733, 761, 787, 809, 821, 827, 829, 853, 859, 877, 883, 911, 929, 947, 967, 971, 977, 983, 991, 1009, 1013, 1021, 1039, 1049, 1051, 1061, 1063, 1087, 1097, 1103, 1117, 1129, 1151, 1153, 1181, 1187, 1193, 1213, 1217, 1231, 1237, 1259, 1279, 1283, 1289, 1291, 1361, 1373, 1381, 1427, 1433, 1439, 1447, 1451, 1459, 1471, 1499, 1543]

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
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
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
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -19593699) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -19593699 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    127 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -19593699) (c₀ := 4898425) (ps := ps) (h := 127)
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
    fin_cases hp <;> [exact ⟨1, 1632809, by norm_num⟩; exact ⟨0, 979685, by norm_num⟩; exact ⟨0, 699775, by norm_num⟩; exact ⟨2, 288143, by norm_num⟩; exact ⟨0, 212975, by norm_num⟩; exact ⟨10, 168915, by norm_num⟩; exact ⟨6, 132391, by norm_num⟩; exact ⟨11, 119477, by norm_num⟩; exact ⟨2, 113917, by norm_num⟩; exact ⟨7, 104223, by norm_num⟩; exact ⟨3, 73111, by norm_num⟩; exact ⟨30, 69005, by norm_num⟩; exact ⟨15, 67105, by norm_num⟩; exact ⟨25, 59025, by norm_num⟩; exact ⟨40, 45795, by norm_num⟩; exact ⟨3, 43349, by norm_num⟩; exact ⟨24, 38575, by norm_num⟩; exact ⟨43, 37407, by norm_num⟩; exact ⟨11, 31201, by norm_num⟩; exact ⟨56, 29351, by norm_num⟩; exact ⟨26, 27067, by norm_num⟩; exact ⟨92, 25691, by norm_num⟩; exact ⟨27, 24619, by norm_num⟩; exact ⟨64, 23235, by norm_num⟩; exact ⟨104, 22015, by norm_num⟩; exact ⟨21, 21581, by norm_num⟩; exact ⟨53, 21403, by norm_num⟩; exact ⟨36, 21029, by norm_num⟩; exact ⟨111, 20377, by norm_num⟩; exact ⟨18, 19517, by norm_num⟩; exact ⟨127, 18687, by norm_num⟩; exact ⟨106, 17349, by norm_num⟩; exact ⟨133, 16779, by norm_num⟩; exact ⟨141, 16021, by norm_num⟩; exact ⟨71, 15767, by norm_num⟩; exact ⟨96, 14827, by norm_num⟩; exact ⟨43, 14541, by norm_num⟩; exact ⟨47, 14123, by norm_num⟩; exact ⟨12, 13877, by norm_num⟩; exact ⟨85, 13665, by norm_num⟩; exact ⟨179, 13435, by norm_num⟩; exact ⟨30, 13135, by norm_num⟩; exact ⟨83, 12943, by norm_num⟩; exact ⟨161, 11753, by norm_num⟩; exact ⟨141, 11359, by norm_num⟩; exact ⟨162, 11117, by norm_num⟩; exact ⟨181, 10983, by norm_num⟩; exact ⟨42, 10493, by norm_num⟩; exact ⟨94, 10245, by norm_num⟩; exact ⟨47, 10063, by norm_num⟩; exact ⟨95, 9995, by norm_num⟩; exact ⟨246, 9743, by norm_num⟩; exact ⟨88, 9417, by norm_num⟩; exact ⟨181, 9429, by norm_num⟩; exact ⟨158, 9001, by norm_num⟩; exact ⟨126, 8729, by norm_num⟩; exact ⟨9, 8345, by norm_num⟩; exact ⟨62, 8267, by norm_num⟩; exact ⟨56, 8183, by norm_num⟩; exact ⟨115, 7935, by norm_num⟩; exact ⟨177, 7691, by norm_num⟩; exact ⟨3, 7571, by norm_num⟩; exact ⟨321, 7567, by norm_num⟩; exact ⟨18, 7279, by norm_num⟩; exact ⟨291, 7361, by norm_num⟩; exact ⟨94, 7185, by norm_num⟩; exact ⟨105, 7105, by norm_num⟩; exact ⟨7, 6909, by norm_num⟩; exact ⟨39, 6815, by norm_num⟩; exact ⟨251, 6769, by norm_num⟩; exact ⟨11, 6437, by norm_num⟩; exact ⟨25, 6225, by norm_num⟩; exact ⟨57, 6059, by norm_num⟩; exact ⟨284, 6065, by norm_num⟩; exact ⟨134, 5945, by norm_num⟩; exact ⟨333, 6043, by norm_num⟩; exact ⟨271, 5829, by norm_num⟩; exact ⟨302, 5809, by norm_num⟩; exact ⟨295, 5685, by norm_num⟩; exact ⟨353, 5689, by norm_num⟩; exact ⟨85, 5385, by norm_num⟩; exact ⟨236, 5333, by norm_num⟩; exact ⟨340, 5295, by norm_num⟩; exact ⟨251, 5131, by norm_num⟩; exact ⟨394, 5205, by norm_num⟩; exact ⟨485, 5255, by norm_num⟩; exact ⟨300, 5075, by norm_num⟩; exact ⟨45, 4945, by norm_num⟩; exact ⟨196, 4893, by norm_num⟩; exact ⟨253, 4899, by norm_num⟩; exact ⟨425, 4975, by norm_num⟩; exact ⟨122, 4729, by norm_num⟩; exact ⟨118, 4683, by norm_num⟩; exact ⟨485, 4885, by norm_num⟩; exact ⟨332, 4721, by norm_num⟩; exact ⟨438, 4789, by norm_num⟩; exact ⟨396, 4651, by norm_num⟩; exact ⟨508, 4701, by norm_num⟩; exact ⟨450, 4625, by norm_num⟩; exact ⟨92, 4393, by norm_num⟩; exact ⟨17, 4339, by norm_num⟩; exact ⟨373, 4377, by norm_num⟩; exact ⟨241, 4299, by norm_num⟩; exact ⟨62, 4151, by norm_num⟩; exact ⟨207, 4163, by norm_num⟩; exact ⟨198, 4139, by norm_num⟩; exact ⟨284, 4105, by norm_num⟩; exact ⟨0, 4025, by norm_num⟩; exact ⟨522, 4201, by norm_num⟩; exact ⟨36, 3961, by norm_num⟩; exact ⟨53, 3893, by norm_num⟩; exact ⟨265, 3885, by norm_num⟩; exact ⟨492, 4007, by norm_num⟩; exact ⟨407, 3929, by norm_num⟩; exact ⟨455, 3955, by norm_num⟩; exact ⟨172, 3621, by norm_num⟩; exact ⟨520, 3765, by norm_num⟩; exact ⟨203, 3577, by norm_num⟩; exact ⟨288, 3491, by norm_num⟩; exact ⟨241, 3459, by norm_num⟩; exact ⟨113, 3413, by norm_num⟩; exact ⟨308, 3451, by norm_num⟩; exact ⟨205, 3405, by norm_num⟩; exact ⟨373, 3453, by norm_num⟩; exact ⟨101, 3337, by norm_num⟩; exact ⟨42, 3269, by norm_num⟩; exact ⟨24, 3175, by norm_num⟩]
  · show 127 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert127
