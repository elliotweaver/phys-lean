/-
  Certificates.GaussFiberCert124 — fiber-h=124 EXCLUSION certificate for
  D = −17755251 (first odd-disc fundamental above X₀(124)).
  124 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −17755251 has size > 124,
  so h(−17755251) ≥ 125 — D is excluded from every fiber ≤ 124.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert124
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 5, 7, 11, 17, 23, 29, 41, 61, 67, 71, 83, 89, 113, 149, 151, 157, 167, 173, 179, 181, 191, 193, 199, 211, 223, 241, 283, 293, 307, 311, 313, 317, 349, 367, 379, 419, 421, 431, 439, 449, 461, 463, 467, 479, 487, 491, 499, 503, 509, 523, 541, 569, 577, 599, 601, 607, 617, 631, 647, 659, 661, 673, 677, 701, 709, 719, 727, 757, 761, 769, 773, 787, 797, 809, 827, 829, 853, 859, 863, 877, 919, 937, 941, 967, 971, 977, 991, 997, 1013, 1019, 1021, 1049, 1061, 1063, 1069, 1087, 1091, 1097, 1109, 1117, 1123, 1151, 1163, 1193, 1213, 1223, 1229, 1231, 1237, 1279, 1291, 1297, 1301, 1303, 1307, 1321, 1327, 1361, 1367, 1381, 1399, 1427, 1429]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -17755251) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -17755251 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    124 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -17755251) (c₀ := 4438813) (ps := ps) (h := 124)
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
    fin_cases hp <;> [exact ⟨1, 1479605, by norm_num⟩; exact ⟨1, 887763, by norm_num⟩; exact ⟨2, 634117, by norm_num⟩; exact ⟨2, 403529, by norm_num⟩; exact ⟨2, 261107, by norm_num⟩; exact ⟨8, 192995, by norm_num⟩; exact ⟨8, 153065, by norm_num⟩; exact ⟨19, 108273, by norm_num⟩; exact ⟨21, 72775, by norm_num⟩; exact ⟨16, 66255, by norm_num⟩; exact ⟨21, 62525, by norm_num⟩; exact ⟨10, 53481, by norm_num⟩; exact ⟨15, 49877, by norm_num⟩; exact ⟨51, 39305, by norm_num⟩; exact ⟨71, 29825, by norm_num⟩; exact ⟨50, 29413, by norm_num⟩; exact ⟨75, 28309, by norm_num⟩; exact ⟨67, 26607, by norm_num⟩; exact ⟨68, 25685, by norm_num⟩; exact ⟨40, 24807, by norm_num⟩; exact ⟨67, 24549, by norm_num⟩; exact ⟨24, 23243, by norm_num⟩; exact ⟨19, 23001, by norm_num⟩; exact ⟨76, 22335, by norm_num⟩; exact ⟨35, 21043, by norm_num⟩; exact ⟨1, 19905, by norm_num⟩; exact ⟨59, 18433, by norm_num⟩; exact ⟨6, 15685, by norm_num⟩; exact ⟨138, 15215, by norm_num⟩; exact ⟨131, 14515, by norm_num⟩; exact ⟨9, 14273, by norm_num⟩; exact ⟨54, 14191, by norm_num⟩; exact ⟨37, 14007, by norm_num⟩; exact ⟨147, 12781, by norm_num⟩; exact ⟨171, 12175, by norm_num⟩; exact ⟨144, 11767, by norm_num⟩; exact ⟨134, 10637, by norm_num⟩; exact ⟨173, 10615, by norm_num⟩; exact ⟨7, 10299, by norm_num⟩; exact ⟨50, 10117, by norm_num⟩; exact ⟨165, 9947, by norm_num⟩; exact ⟨12, 9629, by norm_num⟩; exact ⟨187, 9663, by norm_num⟩; exact ⟨68, 9515, by norm_num⟩; exact ⟨193, 9345, by norm_num⟩; exact ⟨171, 9175, by norm_num⟩; exact ⟨224, 9143, by norm_num⟩; exact ⟨121, 8925, by norm_num⟩; exact ⟨123, 8855, by norm_num⟩; exact ⟨247, 8841, by norm_num⟩; exact ⟨44, 8491, by norm_num⟩; exact ⟨47, 8209, by norm_num⟩; exact ⟨245, 7907, by norm_num⟩; exact ⟨83, 7705, by norm_num⟩; exact ⟨163, 7455, by norm_num⟩; exact ⟨265, 7503, by norm_num⟩; exact ⟨223, 7395, by norm_num⟩; exact ⟨54, 7199, by norm_num⟩; exact ⟨16, 7035, by norm_num⟩; exact ⟨96, 6875, by norm_num⟩; exact ⟨29, 6737, by norm_num⟩; exact ⟨243, 6805, by norm_num⟩; exact ⟨60, 6601, by norm_num⟩; exact ⟨310, 6699, by norm_num⟩; exact ⟨293, 6455, by norm_num⟩; exact ⟨160, 6297, by norm_num⟩; exact ⟨49, 6177, by norm_num⟩; exact ⟨260, 6199, by norm_num⟩; exact ⟨31, 5865, by norm_num⟩; exact ⟨289, 5943, by norm_num⟩; exact ⟨46, 5775, by norm_num⟩; exact ⟨292, 5853, by norm_num⟩; exact ⟨385, 5829, by norm_num⟩; exact ⟨111, 5585, by norm_num⟩; exact ⟨81, 5495, by norm_num⟩; exact ⟨236, 5435, by norm_num⟩; exact ⟨305, 5467, by norm_num⟩; exact ⟨246, 5275, by norm_num⟩; exact ⟨320, 5287, by norm_num⟩; exact ⟨382, 5313, by norm_num⟩; exact ⟨56, 5065, by norm_num⟩; exact ⟨414, 5017, by norm_num⟩; exact ⟨211, 4785, by norm_num⟩; exact ⟨370, 4863, by norm_num⟩; exact ⟨134, 4609, by norm_num⟩; exact ⟨301, 4665, by norm_num⟩; exact ⟨387, 4697, by norm_num⟩; exact ⟨390, 4633, by norm_num⟩; exact ⟨417, 4627, by norm_num⟩; exact ⟨56, 4385, by norm_num⟩; exact ⟨474, 4577, by norm_num⟩; exact ⟨215, 4393, by norm_num⟩; exact ⟨457, 4431, by norm_num⟩; exact ⟨233, 4235, by norm_num⟩; exact ⟨334, 4281, by norm_num⟩; exact ⟨116, 4165, by norm_num⟩; exact ⟨236, 4135, by norm_num⟩; exact ⟨69, 4073, by norm_num⟩; exact ⟨297, 4127, by norm_num⟩; exact ⟨195, 4037, by norm_num⟩; exact ⟨111, 3985, by norm_num⟩; exact ⟨51, 3955, by norm_num⟩; exact ⟨432, 4019, by norm_num⟩; exact ⟨412, 3963, by norm_num⟩; exact ⟨71, 3725, by norm_num⟩; exact ⟨44, 3661, by norm_num⟩; exact ⟨444, 3791, by norm_num⟩; exact ⟨80, 3617, by norm_num⟩; exact ⟨153, 3625, by norm_num⟩; exact ⟨181, 3615, by norm_num⟩; exact ⟨227, 3511, by norm_num⟩; exact ⟨293, 3505, by norm_num⟩; exact ⟨77, 3427, by norm_num⟩; exact ⟨308, 3485, by norm_num⟩; exact ⟨240, 3451, by norm_num⟩; exact ⟨472, 3567, by norm_num⟩; exact ⟨412, 3489, by norm_num⟩; exact ⟨1, 3345, by norm_num⟩; exact ⟨243, 3305, by norm_num⟩; exact ⟨467, 3407, by norm_num⟩; exact ⟨620, 3493, by norm_num⟩; exact ⟨630, 3457, by norm_num⟩; exact ⟨334, 3189, by norm_num⟩; exact ⟨82, 3111, by norm_num⟩]
  · show 124 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert124
