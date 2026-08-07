/-
  Certificates.GaussFiberCert125 — fiber-h=125 EXCLUSION certificate for
  D = −18631079 (first odd-disc fundamental above X₀(125)).
  125 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −18631079 has size > 125,
  so h(−18631079) ≥ 126 — D is excluded from every fiber ≤ 125.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert125
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 5, 7, 13, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 73, 79, 97, 101, 103, 109, 113, 131, 137, 139, 149, 157, 181, 191, 197, 227, 229, 239, 251, 257, 263, 277, 281, 293, 317, 353, 359, 383, 389, 397, 401, 409, 419, 439, 449, 461, 479, 491, 499, 509, 521, 541, 563, 571, 577, 587, 593, 599, 613, 631, 659, 661, 691, 727, 733, 743, 757, 761, 769, 773, 809, 811, 823, 827, 829, 853, 857, 863, 881, 883, 907, 911, 919, 929, 953, 983, 997, 1039, 1049, 1051, 1061, 1087, 1091, 1093, 1097, 1109, 1117, 1171, 1181, 1187, 1193, 1223, 1237, 1259, 1279, 1289, 1291, 1297, 1303, 1319, 1327, 1373, 1399, 1409, 1423, 1433, 1451, 1471, 1487, 1489, 1499]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -18631079) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -18631079 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    125 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -18631079) (c₀ := 4657770) (ps := ps) (h := 125)
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
    fin_cases hp <;> [exact ⟨0, 1552590, by norm_num⟩; exact ⟨0, 931554, by norm_num⟩; exact ⟨1, 665396, by norm_num⟩; exact ⟨0, 358290, by norm_num⟩; exact ⟨6, 245148, by norm_num⟩; exact ⟨2, 202512, by norm_num⟩; exact ⟨14, 160620, by norm_num⟩; exact ⟨6, 150252, by norm_num⟩; exact ⟨3, 125886, by norm_num⟩; exact ⟨15, 113610, by norm_num⟩; exact ⟨20, 108330, by norm_num⟩; exact ⟨17, 99108, by norm_num⟩; exact ⟨22, 87892, by norm_num⟩; exact ⟨29, 78960, by norm_num⟩; exact ⟨22, 63812, by norm_num⟩; exact ⟨26, 58968, by norm_num⟩; exact ⟨41, 48036, by norm_num⟩; exact ⟨23, 46122, by norm_num⟩; exact ⟨36, 45234, by norm_num⟩; exact ⟨44, 42750, by norm_num⟩; exact ⟨9, 41220, by norm_num⟩; exact ⟨46, 35572, by norm_num⟩; exact ⟨54, 34020, by norm_num⟩; exact ⟨65, 33540, by norm_num⟩; exact ⟨51, 31278, by norm_num⟩; exact ⟨20, 29670, by norm_num⟩; exact ⟨47, 25746, by norm_num⟩; exact ⟨93, 24432, by norm_num⟩; exact ⟨91, 23686, by norm_num⟩; exact ⟨103, 20566, by norm_num⟩; exact ⟨9, 20340, by norm_num⟩; exact ⟨99, 19530, by norm_num⟩; exact ⟨115, 18610, by norm_num⟩; exact ⟨40, 18130, by norm_num⟩; exact ⟨114, 17760, by norm_num⟩; exact ⟨106, 16856, by norm_num⟩; exact ⟨136, 16642, by norm_num⟩; exact ⟨30, 15900, by norm_num⟩; exact ⟨63, 14706, by norm_num⟩; exact ⟨101, 13224, by norm_num⟩; exact ⟨36, 12978, by norm_num⟩; exact ⟨152, 12222, by norm_num⟩; exact ⟨49, 11980, by norm_num⟩; exact ⟨175, 11810, by norm_num⟩; exact ⟨51, 11622, by norm_num⟩; exact ⟨69, 11400, by norm_num⟩; exact ⟨75, 11130, by norm_num⟩; exact ⟨4, 10610, by norm_num⟩; exact ⟨12, 10374, by norm_num⟩; exact ⟨129, 10140, by norm_num⟩; exact ⟨214, 9820, by norm_num⟩; exact ⟨214, 9580, by norm_num⟩; exact ⟨43, 9338, by norm_num⟩; exact ⟨93, 9168, by norm_num⟩; exact ⟨241, 9052, by norm_num⟩; exact ⟨15, 8610, by norm_num⟩; exact ⟨127, 8302, by norm_num⟩; exact ⟨237, 8256, by norm_num⟩; exact ⟨260, 8190, by norm_num⟩; exact ⟨192, 7998, by norm_num⟩; exact ⟨127, 7882, by norm_num⟩; exact ⟨49, 7780, by norm_num⟩; exact ⟨47, 7602, by norm_num⟩; exact ⟨16, 7382, by norm_num⟩; exact ⟨6, 7068, by norm_num⟩; exact ⟨124, 7070, by norm_num⟩; exact ⟨80, 6750, by norm_num⟩; exact ⟨268, 6506, by norm_num⟩; exact ⟨250, 6440, by norm_num⟩; exact ⟨251, 6354, by norm_num⟩; exact ⟨218, 6216, by norm_num⟩; exact ⟨369, 6300, by norm_num⟩; exact ⟨159, 6090, by norm_num⟩; exact ⟨345, 6180, by norm_num⟩; exact ⟨45, 5760, by norm_num⟩; exact ⟨249, 5820, by norm_num⟩; exact ⟨168, 5694, by norm_num⟩; exact ⟨284, 5730, by norm_num⟩; exact ⟨322, 5744, by norm_num⟩; exact ⟨373, 5624, by norm_num⟩; exact ⟨364, 5590, by norm_num⟩; exact ⟨217, 5452, by norm_num⟩; exact ⟨390, 5460, by norm_num⟩; exact ⟨220, 5330, by norm_num⟩; exact ⟨149, 5160, by norm_num⟩; exact ⟨91, 5122, by norm_num⟩; exact ⟨39, 5070, by norm_num⟩; exact ⟨462, 5244, by norm_num⟩; exact ⟨460, 5110, by norm_num⟩; exact ⟨362, 4872, by norm_num⟩; exact ⟨90, 4680, by norm_num⟩; exact ⟨438, 4668, by norm_num⟩; exact ⟨354, 4560, by norm_num⟩; exact ⟨200, 4470, by norm_num⟩; exact ⟨4, 4390, by norm_num⟩; exact ⟨410, 4440, by norm_num⟩; exact ⟨446, 4452, by norm_num⟩; exact ⟨421, 4424, by norm_num⟩; exact ⟨468, 4446, by norm_num⟩; exact ⟨5, 4200, by norm_num⟩; exact ⟨347, 4278, by norm_num⟩; exact ⟨120, 3990, by norm_num⟩; exact ⟨175, 3970, by norm_num⟩; exact ⟨84, 3930, by norm_num⟩; exact ⟨153, 3924, by norm_num⟩; exact ⟨520, 4030, by norm_num⟩; exact ⟨134, 3780, by norm_num⟩; exact ⟨293, 3768, by norm_num⟩; exact ⟨295, 3710, by norm_num⟩; exact ⟨419, 3750, by norm_num⟩; exact ⟨535, 3830, by norm_num⟩; exact ⟨311, 3666, by norm_num⟩; exact ⟨370, 3680, by norm_num⟩; exact ⟨273, 3588, by norm_num⟩; exact ⟨0, 3510, by norm_num⟩; exact ⟨643, 3694, by norm_num⟩; exact ⟨161, 3348, by norm_num⟩; exact ⟨131, 3318, by norm_num⟩; exact ⟨604, 3530, by norm_num⟩; exact ⟨417, 3372, by norm_num⟩; exact ⟨178, 3232, by norm_num⟩; exact ⟨151, 3182, by norm_num⟩; exact ⟨312, 3198, by norm_num⟩; exact ⟨180, 3150, by norm_num⟩; exact ⟨33, 3108, by norm_num⟩]
  · show 125 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert125
