/-
  Certificates.GaussFiberCert134 — fiber-h=134 EXCLUSION certificate for
  D = −20817479 (first odd-disc fundamental above X₀(134)).
  134 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −20817479 has size > 134,
  so h(−20817479) ≥ 135 — D is excluded from every fiber ≤ 134.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert134
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 5, 19, 37, 41, 43, 59, 61, 67, 71, 73, 83, 97, 107, 109, 127, 151, 157, 173, 179, 181, 191, 211, 223, 227, 229, 257, 263, 281, 283, 307, 313, 317, 331, 349, 367, 383, 389, 397, 401, 409, 419, 443, 457, 461, 467, 503, 521, 523, 547, 563, 569, 587, 607, 613, 619, 643, 653, 661, 673, 683, 701, 709, 719, 733, 739, 757, 761, 769, 773, 797, 811, 821, 829, 853, 857, 859, 863, 883, 887, 911, 937, 947, 967, 971, 977, 983, 991, 997, 1009, 1013, 1021, 1031, 1039, 1051, 1061, 1069, 1087, 1093, 1123, 1151, 1153, 1163, 1193, 1213, 1217, 1223, 1279, 1283, 1289, 1291, 1297, 1307, 1319, 1321, 1327, 1409, 1427, 1433, 1447, 1459, 1471, 1493, 1499, 1523, 1531, 1543, 1559, 1567, 1571, 1583, 1601, 1607, 1619]

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
  refine List.IsChain.cons_cons (by norm_num) ?_
  refine List.IsChain.cons_cons (by norm_num) ?_
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -20817479) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -20817479 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    134 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -20817479) (c₀ := 5204370) (ps := ps) (h := 134)
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
    fin_cases hp <;> [exact ⟨0, 1734790, by norm_num⟩; exact ⟨0, 1040874, by norm_num⟩; exact ⟨8, 273918, by norm_num⟩; exact ⟨16, 140666, by norm_num⟩; exact ⟨2, 126936, by norm_num⟩; exact ⟨2, 121032, by norm_num⟩; exact ⟨4, 88210, by norm_num⟩; exact ⟨16, 85322, by norm_num⟩; exact ⟨7, 77678, by norm_num⟩; exact ⟨8, 73302, by norm_num⟩; exact ⟨35, 71310, by norm_num⟩; exact ⟨41, 62724, by norm_num⟩; exact ⟨25, 53660, by norm_num⟩; exact ⟨10, 48640, by norm_num⟩; exact ⟨19, 47750, by norm_num⟩; exact ⟨9, 40980, by norm_num⟩; exact ⟨24, 34470, by norm_num⟩; exact ⟨33, 33156, by norm_num⟩; exact ⟨43, 30094, by norm_num⟩; exact ⟨79, 29110, by norm_num⟩; exact ⟨34, 28760, by norm_num⟩; exact ⟨19, 27250, by norm_num⟩; exact ⟨12, 24666, by norm_num⟩; exact ⟨84, 23370, by norm_num⟩; exact ⟨81, 22956, by norm_num⟩; exact ⟨18, 22728, by norm_num⟩; exact ⟨49, 20260, by norm_num⟩; exact ⟨104, 19830, by norm_num⟩; exact ⟨93, 18552, by norm_num⟩; exact ⟨0, 18390, by norm_num⟩; exact ⟨33, 16956, by norm_num⟩; exact ⟨115, 16670, by norm_num⟩; exact ⟨57, 16428, by norm_num⟩; exact ⟨124, 15770, by norm_num⟩; exact ⟨151, 14978, by norm_num⟩; exact ⟨43, 14186, by norm_num⟩; exact ⟨24, 13590, by norm_num⟩; exact ⟨106, 13408, by norm_num⟩; exact ⟨110, 13140, by norm_num⟩; exact ⟨146, 13032, by norm_num⟩; exact ⟨150, 12780, by norm_num⟩; exact ⟨106, 12448, by norm_num⟩; exact ⟨51, 11754, by norm_num⟩; exact ⟨211, 11486, by norm_num⟩; exact ⟨76, 11302, by norm_num⟩; exact ⟨28, 11146, by norm_num⟩; exact ⟨129, 10380, by norm_num⟩; exact ⟨20, 9990, by norm_num⟩; exact ⟨166, 10004, by norm_num⟩; exact ⟨131, 9546, by norm_num⟩; exact ⟨1, 9244, by norm_num⟩; exact ⟨44, 9150, by norm_num⟩; exact ⟨90, 8880, by norm_num⟩; exact ⟨184, 8630, by norm_num⟩; exact ⟨0, 8490, by norm_num⟩; exact ⟨13, 8408, by norm_num⟩; exact ⟨8, 8094, by norm_num⟩; exact ⟨51, 7974, by norm_num⟩; exact ⟨104, 7890, by norm_num⟩; exact ⟨280, 7850, by norm_num⟩; exact ⟨9, 7620, by norm_num⟩; exact ⟨230, 7500, by norm_num⟩; exact ⟨205, 7400, by norm_num⟩; exact ⟨34, 7240, by norm_num⟩; exact ⟨53, 7104, by norm_num⟩; exact ⟨316, 7178, by norm_num⟩; exact ⟨196, 6926, by norm_num⟩; exact ⟨29, 6840, by norm_num⟩; exact ⟨263, 6858, by norm_num⟩; exact ⟨93, 6744, by norm_num⟩; exact ⟨89, 6540, by norm_num⟩; exact ⟨291, 6522, by norm_num⟩; exact ⟨204, 6390, by norm_num⟩; exact ⟨244, 6350, by norm_num⟩; exact ⟨336, 6234, by norm_num⟩; exact ⟨311, 6186, by norm_num⟩; exact ⟨306, 6168, by norm_num⟩; exact ⟨184, 6070, by norm_num⟩; exact ⟨262, 5972, by norm_num⟩; exact ⟨128, 5886, by norm_num⟩; exact ⟨91, 5722, by norm_num⟩; exact ⟨369, 5700, by norm_num⟩; exact ⟨18, 5496, by norm_num⟩; exact ⟨215, 5430, by norm_num⟩; exact ⟨99, 5370, by norm_num⟩; exact ⟨326, 5436, by norm_num⟩; exact ⟨415, 5470, by norm_num⟩; exact ⟨240, 5310, by norm_num⟩; exact ⟨299, 5310, by norm_num⟩; exact ⟨45, 5160, by norm_num⟩; exact ⟨49, 5140, by norm_num⟩; exact ⟨402, 5256, by norm_num⟩; exact ⟨311, 5142, by norm_num⟩; exact ⟨336, 5118, by norm_num⟩; exact ⟨13, 4952, by norm_num⟩; exact ⟨125, 4920, by norm_num⟩; exact ⟨516, 5118, by norm_num⟩; exact ⟨291, 4866, by norm_num⟩; exact ⟨277, 4832, by norm_num⟩; exact ⟨461, 4824, by norm_num⟩; exact ⟨145, 4540, by norm_num⟩; exact ⟨16, 4514, by norm_num⟩; exact ⟨314, 4560, by norm_num⟩; exact ⟨485, 4560, by norm_num⟩; exact ⟨329, 4380, by norm_num⟩; exact ⟨169, 4300, by norm_num⟩; exact ⟨579, 4530, by norm_num⟩; exact ⟨421, 4208, by norm_num⟩; exact ⟨503, 4254, by norm_num⟩; exact ⟨341, 4128, by norm_num⟩; exact ⟨155, 4050, by norm_num⟩; exact ⟨308, 4086, by norm_num⟩; exact ⟨331, 4066, by norm_num⟩; exact ⟨541, 4168, by norm_num⟩; exact ⟨206, 3972, by norm_num⟩; exact ⟨392, 4038, by norm_num⟩; exact ⟨94, 3700, by norm_num⟩; exact ⟨697, 3988, by norm_num⟩; exact ⟨273, 3684, by norm_num⟩; exact ⟨69, 3600, by norm_num⟩; exact ⟨651, 3858, by norm_num⟩; exact ⟨54, 3540, by norm_num⟩; exact ⟨262, 3532, by norm_num⟩; exact ⟨477, 3624, by norm_num⟩; exact ⟨65, 3420, by norm_num⟩; exact ⟨619, 3650, by norm_num⟩; exact ⟨699, 3690, by norm_num⟩; exact ⟨740, 3690, by norm_num⟩; exact ⟨585, 3540, by norm_num⟩; exact ⟨164, 3330, by norm_num⟩; exact ⟨727, 3622, by norm_num⟩; exact ⟨791, 3642, by norm_num⟩; exact ⟨217, 3268, by norm_num⟩; exact ⟨325, 3280, by norm_num⟩]
  · show 134 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert134
