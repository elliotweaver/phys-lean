/-
  Certificates.GaussFiberCert132 — fiber-h=132 EXCLUSION certificate for
  D = −20169771 (first odd-disc fundamental above X₀(132)).
  132 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −20169771 has size > 132,
  so h(−20169771) ≥ 133 — D is excluded from every fiber ≤ 132.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert132
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 5, 7, 11, 17, 31, 43, 53, 59, 61, 83, 89, 101, 109, 113, 127, 149, 157, 173, 181, 191, 223, 227, 229, 233, 241, 263, 269, 271, 277, 281, 293, 307, 311, 331, 337, 349, 367, 373, 389, 401, 409, 421, 433, 449, 457, 463, 479, 487, 499, 503, 509, 523, 569, 571, 577, 593, 601, 617, 619, 631, 641, 643, 647, 661, 673, 677, 683, 701, 719, 727, 733, 739, 743, 751, 773, 787, 811, 823, 827, 829, 859, 877, 883, 919, 967, 991, 1009, 1049, 1061, 1069, 1087, 1091, 1103, 1117, 1151, 1163, 1187, 1193, 1201, 1213, 1223, 1229, 1231, 1259, 1277, 1279, 1283, 1289, 1301, 1303, 1319, 1321, 1367, 1381, 1399, 1409, 1427, 1433, 1439, 1451, 1459, 1481, 1499, 1523, 1543, 1553, 1559, 1597, 1601, 1621, 1627]

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
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -20169771) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -20169771 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    132 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -20169771) (c₀ := 5042443) (ps := ps) (h := 132)
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
    fin_cases hp <;> [exact ⟨1, 1680815, by norm_num⟩; exact ⟨1, 1008489, by norm_num⟩; exact ⟨0, 720349, by norm_num⟩; exact ⟨3, 458405, by norm_num⟩; exact ⟨3, 296615, by norm_num⟩; exact ⟨10, 162663, by norm_num⟩; exact ⟨14, 117271, by norm_num⟩; exact ⟨5, 95141, by norm_num⟩; exact ⟨10, 85467, by norm_num⟩; exact ⟨0, 82663, by norm_num⟩; exact ⟨7, 60753, by norm_num⟩; exact ⟨5, 56657, by norm_num⟩; exact ⟨31, 49935, by norm_num⟩; exact ⟨2, 46261, by norm_num⟩; exact ⟨13, 44625, by norm_num⟩; exact ⟨24, 39709, by norm_num⟩; exact ⟨21, 33845, by norm_num⟩; exact ⟨15, 32119, by norm_num⟩; exact ⟨52, 29163, by norm_num⟩; exact ⟨33, 27865, by norm_num⟩; exact ⟨81, 26435, by norm_num⟩; exact ⟨26, 22615, by norm_num⟩; exact ⟨59, 22229, by norm_num⟩; exact ⟨79, 22047, by norm_num⟩; exact ⟨88, 21675, by norm_num⟩; exact ⟨0, 20923, by norm_num⟩; exact ⟨7, 19173, by norm_num⟩; exact ⟨51, 18755, by norm_num⟩; exact ⟨57, 18619, by norm_num⟩; exact ⟨18, 18205, by norm_num⟩; exact ⟨106, 17985, by norm_num⟩; exact ⟨19, 17211, by norm_num⟩; exact ⟨35, 16429, by norm_num⟩; exact ⟨81, 16235, by norm_num⟩; exact ⟨18, 15235, by norm_num⟩; exact ⟨166, 15045, by norm_num⟩; exact ⟨48, 14455, by norm_num⟩; exact ⟨96, 13765, by norm_num⟩; exact ⟨116, 13555, by norm_num⟩; exact ⟨145, 13017, by norm_num⟩; exact ⟨11, 12575, by norm_num⟩; exact ⟨200, 12427, by norm_num⟩; exact ⟨132, 12019, by norm_num⟩; exact ⟨57, 11653, by norm_num⟩; exact ⟨54, 11237, by norm_num⟩; exact ⟨23, 11035, by norm_num⟩; exact ⟨9, 10891, by norm_num⟩; exact ⟨169, 10587, by norm_num⟩; exact ⟨198, 10435, by norm_num⟩; exact ⟨225, 10207, by norm_num⟩; exact ⟨11, 10025, by norm_num⟩; exact ⟨47, 9911, by norm_num⟩; exact ⟨43, 9645, by norm_num⟩; exact ⟨244, 8967, by norm_num⟩; exact ⟨147, 8869, by norm_num⟩; exact ⟨58, 8745, by norm_num⟩; exact ⟨113, 8525, by norm_num⟩; exact ⟨260, 8503, by norm_num⟩; exact ⟨296, 8315, by norm_num⟩; exact ⟨206, 8215, by norm_num⟩; exact ⟨309, 8143, by norm_num⟩; exact ⟨308, 8015, by norm_num⟩; exact ⟨43, 7845, by norm_num⟩; exact ⟨268, 7905, by norm_num⟩; exact ⟨54, 7633, by norm_num⟩; exact ⟨117, 7513, by norm_num⟩; exact ⟨319, 7599, by norm_num⟩; exact ⟨117, 7403, by norm_num⟩; exact ⟨144, 7223, by norm_num⟩; exact ⟨173, 7055, by norm_num⟩; exact ⟨27, 6937, by norm_num⟩; exact ⟨278, 6985, by norm_num⟩; exact ⟨100, 6837, by norm_num⟩; exact ⟨349, 6951, by norm_num⟩; exact ⟨213, 6775, by norm_num⟩; exact ⟨260, 6611, by norm_num⟩; exact ⟨78, 6415, by norm_num⟩; exact ⟨368, 6385, by norm_num⟩; exact ⟨190, 6171, by norm_num⟩; exact ⟨218, 6155, by norm_num⟩; exact ⟨208, 6135, by norm_num⟩; exact ⟨398, 6055, by norm_num⟩; exact ⟨68, 5755, by norm_num⟩; exact ⟨238, 5775, by norm_num⟩; exact ⟨10, 5487, by norm_num⟩; exact ⟨21, 5215, by norm_num⟩; exact ⟨27, 5089, by norm_num⟩; exact ⟨468, 5215, by norm_num⟩; exact ⟨480, 5027, by norm_num⟩; exact ⟨515, 5003, by norm_num⟩; exact ⟨5, 4717, by norm_num⟩; exact ⟨387, 4777, by norm_num⟩; exact ⟨357, 4739, by norm_num⟩; exact ⟨61, 4575, by norm_num⟩; exact ⟨28, 4515, by norm_num⟩; exact ⟨68, 4385, by norm_num⟩; exact ⟨356, 4445, by norm_num⟩; exact ⟨483, 4445, by norm_num⟩; exact ⟨372, 4343, by norm_num⟩; exact ⟨584, 4483, by norm_num⟩; exact ⟨98, 4165, by norm_num⟩; exact ⟨539, 4361, by norm_num⟩; exact ⟨374, 4217, by norm_num⟩; exact ⟨218, 4135, by norm_num⟩; exact ⟨388, 4125, by norm_num⟩; exact ⟨368, 4055, by norm_num⟩; exact ⟨126, 3955, by norm_num⟩; exact ⟨78, 3935, by norm_num⟩; exact ⟨139, 3927, by norm_num⟩; exact ⟨149, 3893, by norm_num⟩; exact ⟨524, 4081, by norm_num⟩; exact ⟨370, 3927, by norm_num⟩; exact ⟨495, 4003, by norm_num⟩; exact ⟨20, 3689, by norm_num⟩; exact ⟨71, 3655, by norm_num⟩; exact ⟨393, 3715, by norm_num⟩; exact ⟨700, 3927, by norm_num⟩; exact ⟨305, 3599, by norm_num⟩; exact ⟨651, 3815, by norm_num⟩; exact ⟨642, 3791, by norm_num⟩; exact ⟨538, 3675, by norm_num⟩; exact ⟨481, 3615, by norm_num⟩; exact ⟨110, 3413, by norm_num⟩; exact ⟨494, 3527, by norm_num⟩; exact ⟨14, 3311, by norm_num⟩; exact ⟨366, 3355, by norm_num⟩; exact ⟨315, 3311, by norm_num⟩; exact ⟨128, 3245, by norm_num⟩; exact ⟨776, 3535, by norm_num⟩; exact ⟨365, 3233, by norm_num⟩; exact ⟨83, 3115, by norm_num⟩; exact ⟨459, 3229, by norm_num⟩]
  · show 132 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert132
