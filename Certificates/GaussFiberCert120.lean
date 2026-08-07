/-
  Certificates.GaussFiberCert120 — fiber-h=120 EXCLUSION certificate for
  D = −16678307 (first odd-disc fundamental above X₀(120)).
  120 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −16678307 has size > 120,
  so h(−16678307) ≥ 121 — D is excluded from every fiber ≤ 120.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert120
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 11, 13, 17, 19, 29, 41, 43, 59, 71, 73, 101, 109, 113, 131, 137, 139, 157, 163, 167, 181, 191, 197, 211, 223, 227, 233, 241, 257, 269, 281, 283, 293, 311, 331, 353, 359, 367, 389, 431, 433, 449, 461, 491, 509, 521, 541, 569, 587, 593, 599, 613, 631, 641, 653, 659, 661, 673, 677, 683, 709, 719, 739, 751, 757, 769, 811, 827, 829, 863, 883, 887, 907, 911, 937, 947, 953, 971, 977, 991, 997, 1013, 1019, 1021, 1031, 1039, 1049, 1061, 1069, 1087, 1091, 1097, 1109, 1117, 1123, 1151, 1153, 1171, 1181, 1187, 1193, 1201, 1213, 1229, 1231, 1259, 1279, 1289, 1291, 1297, 1303, 1319, 1321, 1327, 1373, 1423, 1427, 1429, 1433, 1439]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -16678307) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -16678307 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    120 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -16678307) (c₀ := 4169577) (ps := ps) (h := 120)
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
    fin_cases hp <;> [exact ⟨0, 1389859, by norm_num⟩; exact ⟨2, 379053, by norm_num⟩; exact ⟨5, 320739, by norm_num⟩; exact ⟨5, 245271, by norm_num⟩; exact ⟨5, 219453, by norm_num⟩; exact ⟨8, 143781, by norm_num⟩; exact ⟨0, 101697, by norm_num⟩; exact ⟨9, 96969, by norm_num⟩; exact ⟨3, 70671, by norm_num⟩; exact ⟨13, 58729, by norm_num⟩; exact ⟨10, 57119, by norm_num⟩; exact ⟨2, 41283, by norm_num⟩; exact ⟨0, 38253, by norm_num⟩; exact ⟨21, 36903, by norm_num⟩; exact ⟨36, 31839, by norm_num⟩; exact ⟨57, 30459, by norm_num⟩; exact ⟨2, 29997, by norm_num⟩; exact ⟨45, 26571, by norm_num⟩; exact ⟨79, 25619, by norm_num⟩; exact ⟨72, 24999, by norm_num⟩; exact ⟨74, 23067, by norm_num⟩; exact ⟨94, 21877, by norm_num⟩; exact ⟨55, 21181, by norm_num⟩; exact ⟨35, 19767, by norm_num⟩; exact ⟨58, 18713, by norm_num⟩; exact ⟨109, 18421, by norm_num⟩; exact ⟨74, 17919, by norm_num⟩; exact ⟨43, 17309, by norm_num⟩; exact ⟨107, 16269, by norm_num⟩; exact ⟨42, 15507, by norm_num⟩; exact ⟨13, 14839, by norm_num⟩; exact ⟨39, 14739, by norm_num⟩; exact ⟨49, 14239, by norm_num⟩; exact ⟨0, 13407, by norm_num⟩; exact ⟨5, 12597, by norm_num⟩; exact ⟨158, 11883, by norm_num⟩; exact ⟨55, 11623, by norm_num⟩; exact ⟨104, 11391, by norm_num⟩; exact ⟨115, 10753, by norm_num⟩; exact ⟨210, 9777, by norm_num⟩; exact ⟨160, 9689, by norm_num⟩; exact ⟨185, 9363, by norm_num⟩; exact ⟨75, 9057, by norm_num⟩; exact ⟨49, 8497, by norm_num⟩; exact ⟨190, 8263, by norm_num⟩; exact ⟨45, 8007, by norm_num⟩; exact ⟨31, 7709, by norm_num⟩; exact ⟨119, 7353, by norm_num⟩; exact ⟨199, 7171, by norm_num⟩; exact ⟨31, 7033, by norm_num⟩; exact ⟨35, 6963, by norm_num⟩; exact ⟨193, 6863, by norm_num⟩; exact ⟨26, 6609, by norm_num⟩; exact ⟨72, 6513, by norm_num⟩; exact ⟨124, 6409, by norm_num⟩; exact ⟨320, 6483, by norm_num⟩; exact ⟨172, 6353, by norm_num⟩; exact ⟨108, 6213, by norm_num⟩; exact ⟨90, 6171, by norm_num⟩; exact ⟨111, 6123, by norm_num⟩; exact ⟨255, 5973, by norm_num⟩; exact ⟨173, 5841, by norm_num⟩; exact ⟨24, 5643, by norm_num⟩; exact ⟨152, 5583, by norm_num⟩; exact ⟨228, 5577, by norm_num⟩; exact ⟨261, 5511, by norm_num⟩; exact ⟨97, 5153, by norm_num⟩; exact ⟨300, 5151, by norm_num⟩; exact ⟨33, 5031, by norm_num⟩; exact ⟨80, 4839, by norm_num⟩; exact ⟨397, 4901, by norm_num⟩; exact ⟨14, 4701, by norm_num⟩; exact ⟨332, 4719, by norm_num⟩; exact ⟨43, 4579, by norm_num⟩; exact ⟨126, 4467, by norm_num⟩; exact ⟨234, 4461, by norm_num⟩; exact ⟨314, 4479, by norm_num⟩; exact ⟨167, 4323, by norm_num⟩; exact ⟨418, 4447, by norm_num⟩; exact ⟨329, 4317, by norm_num⟩; exact ⟨473, 4407, by norm_num⟩; exact ⟨54, 4119, by norm_num⟩; exact ⟨34, 4093, by norm_num⟩; exact ⟨420, 4257, by norm_num⟩; exact ⟨123, 4059, by norm_num⟩; exact ⟨136, 4031, by norm_num⟩; exact ⟨263, 4041, by norm_num⟩; exact ⟨98, 3939, by norm_num⟩; exact ⟨337, 4007, by norm_num⟩; exact ⟨492, 4059, by norm_num⟩; exact ⟨392, 3963, by norm_num⟩; exact ⟨444, 3981, by norm_num⟩; exact ⟨381, 3891, by norm_num⟩; exact ⟨95, 3741, by norm_num⟩; exact ⟨134, 3729, by norm_num⟩; exact ⟨547, 3883, by norm_num⟩; exact ⟨360, 3729, by norm_num⟩; exact ⟨175, 3587, by norm_num⟩; exact ⟨539, 3777, by norm_num⟩; exact ⟨538, 3757, by norm_num⟩; exact ⟨521, 3723, by norm_num⟩; exact ⟨211, 3509, by norm_num⟩; exact ⟨494, 3639, by norm_num⟩; exact ⟨20, 3393, by norm_num⟩; exact ⟨429, 3537, by norm_num⟩; exact ⟨539, 3543, by norm_num⟩; exact ⟨305, 3333, by norm_num⟩; exact ⟨640, 3553, by norm_num⟩; exact ⟨619, 3527, by norm_num⟩; exact ⟨381, 3327, by norm_num⟩; exact ⟨501, 3393, by norm_num⟩; exact ⟨303, 3231, by norm_num⟩; exact ⟨392, 3273, by norm_num⟩; exact ⟨444, 3291, by norm_num⟩; exact ⟨54, 3039, by norm_num⟩; exact ⟨698, 3273, by norm_num⟩; exact ⟨445, 3061, by norm_num⟩; exact ⟨439, 3053, by norm_num⟩; exact ⟨218, 2943, by norm_num⟩; exact ⟨329, 2973, by norm_num⟩]
  · show 120 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert120
