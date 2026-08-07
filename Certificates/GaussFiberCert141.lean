/-
  Certificates.GaussFiberCert141 — fiber-h=141 EXCLUSION certificate for
  D = −22715107 (first odd-disc fundamental above X₀(141)).
  141 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −22715107 has size > 141,
  so h(−22715107) ≥ 142 — D is excluded from every fiber ≤ 141.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert141
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [11, 13, 17, 19, 29, 31, 37, 41, 53, 61, 67, 79, 83, 97, 101, 107, 127, 151, 157, 163, 167, 173, 179, 193, 197, 223, 227, 233, 239, 241, 251, 257, 263, 277, 281, 313, 337, 349, 373, 389, 397, 419, 439, 443, 449, 461, 463, 499, 503, 509, 541, 557, 571, 593, 599, 601, 607, 617, 641, 643, 647, 653, 661, 691, 701, 709, 719, 727, 733, 739, 757, 761, 769, 809, 821, 823, 827, 829, 853, 859, 863, 877, 881, 883, 887, 907, 911, 929, 937, 941, 947, 971, 983, 991, 1019, 1033, 1049, 1051, 1061, 1097, 1103, 1123, 1129, 1151, 1163, 1181, 1223, 1229, 1259, 1277, 1279, 1301, 1303, 1307, 1321, 1327, 1361, 1367, 1409, 1423, 1453, 1459, 1483, 1487, 1523, 1531, 1549, 1553, 1559, 1571, 1583, 1601, 1609, 1613, 1621, 1627, 1637, 1663, 1667, 1693, 1697]

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
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -22715107) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -22715107 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    141 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -22715107) (c₀ := 5678777) (ps := ps) (h := 141)
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
    fin_cases hp <;> [exact ⟨2, 516253, by norm_num⟩; exact ⟨0, 436829, by norm_num⟩; exact ⟨7, 334049, by norm_num⟩; exact ⟨0, 298883, by norm_num⟩; exact ⟨9, 195823, by norm_num⟩; exact ⟨4, 183187, by norm_num⟩; exact ⟨4, 153481, by norm_num⟩; exact ⟨20, 138517, by norm_num⟩; exact ⟨25, 107159, by norm_num⟩; exact ⟨22, 93103, by norm_num⟩; exact ⟨14, 84761, by norm_num⟩; exact ⟨39, 71903, by norm_num⟩; exact ⟨0, 68419, by norm_num⟩; exact ⟨40, 58561, by norm_num⟩; exact ⟨27, 56233, by norm_num⟩; exact ⟨21, 53077, by norm_num⟩; exact ⟨42, 44729, by norm_num⟩; exact ⟨13, 37609, by norm_num⟩; exact ⟨40, 36181, by norm_num⟩; exact ⟨17, 34841, by norm_num⟩; exact ⟨73, 34037, by norm_num⟩; exact ⟨36, 32833, by norm_num⟩; exact ⟨53, 31741, by norm_num⟩; exact ⟨37, 29431, by norm_num⟩; exact ⟨30, 28831, by norm_num⟩; exact ⟨78, 25493, by norm_num⟩; exact ⟨48, 25027, by norm_num⟩; exact ⟨11, 24373, by norm_num⟩; exact ⟨54, 23773, by norm_num⟩; exact ⟨29, 23567, by norm_num⟩; exact ⟨24, 22627, by norm_num⟩; exact ⟨79, 22121, by norm_num⟩; exact ⟨13, 21593, by norm_num⟩; exact ⟨0, 20501, by norm_num⟩; exact ⟨97, 20243, by norm_num⟩; exact ⟨122, 18191, by norm_num⟩; exact ⟨73, 16867, by norm_num⟩; exact ⟨166, 16351, by norm_num⟩; exact ⟨40, 15229, by norm_num⟩; exact ⟨137, 14647, by norm_num⟩; exact ⟨117, 14339, by norm_num⟩; exact ⟨144, 13603, by norm_num⟩; exact ⟨193, 13021, by norm_num⟩; exact ⟨168, 12883, by norm_num⟩; exact ⟨193, 12731, by norm_num⟩; exact ⟨197, 12403, by norm_num⟩; exact ⟨113, 12293, by norm_num⟩; exact ⟨18, 11381, by norm_num⟩; exact ⟨216, 11383, by norm_num⟩; exact ⟨251, 11281, by norm_num⟩; exact ⟨104, 10517, by norm_num⟩; exact ⟨262, 10319, by norm_num⟩; exact ⟨134, 9977, by norm_num⟩; exact ⟨52, 9581, by norm_num⟩; exact ⟨18, 9481, by norm_num⟩; exact ⟨8, 9449, by norm_num⟩; exact ⟨262, 9469, by norm_num⟩; exact ⟨226, 9287, by norm_num⟩; exact ⟨70, 8867, by norm_num⟩; exact ⟨105, 8849, by norm_num⟩; exact ⟨113, 8797, by norm_num⟩; exact ⟨97, 8711, by norm_num⟩; exact ⟨108, 8609, by norm_num⟩; exact ⟨23, 8219, by norm_num⟩; exact ⟨183, 8149, by norm_num⟩; exact ⟨175, 8053, by norm_num⟩; exact ⟨331, 8051, by norm_num⟩; exact ⟨336, 7967, by norm_num⟩; exact ⟨348, 7913, by norm_num⟩; exact ⟨189, 7733, by norm_num⟩; exact ⟨163, 7537, by norm_num⟩; exact ⟨295, 7577, by norm_num⟩; exact ⟨245, 7463, by norm_num⟩; exact ⟨104, 7033, by norm_num⟩; exact ⟨41, 6919, by norm_num⟩; exact ⟨270, 6989, by norm_num⟩; exact ⟨59, 6871, by norm_num⟩; exact ⟨26, 6851, by norm_num⟩; exact ⟨279, 6749, by norm_num⟩; exact ⟨8, 6611, by norm_num⟩; exact ⟨48, 6583, by norm_num⟩; exact ⟨57, 6479, by norm_num⟩; exact ⟨286, 6539, by norm_num⟩; exact ⟨411, 6623, by norm_num⟩; exact ⟨77, 6409, by norm_num⟩; exact ⟨134, 6281, by norm_num⟩; exact ⟨430, 6437, by norm_num⟩; exact ⟨289, 6203, by norm_num⟩; exact ⟨19, 6061, by norm_num⟩; exact ⟨294, 6127, by norm_num⟩; exact ⟨180, 6031, by norm_num⟩; exact ⟨141, 5869, by norm_num⟩; exact ⟨44, 5779, by norm_num⟩; exact ⟨168, 5759, by norm_num⟩; exact ⟨10, 5573, by norm_num⟩; exact ⟨149, 5519, by norm_num⟩; exact ⟨488, 5641, by norm_num⟩; exact ⟨439, 5587, by norm_num⟩; exact ⟨27, 5353, by norm_num⟩; exact ⟨125, 5191, by norm_num⟩; exact ⟨117, 5161, by norm_num⟩; exact ⟨83, 5063, by norm_num⟩; exact ⟨407, 5177, by norm_num⟩; exact ⟨309, 5017, by norm_num⟩; exact ⟨255, 4939, by norm_num⟩; exact ⟨100, 4817, by norm_num⟩; exact ⟨246, 4693, by norm_num⟩; exact ⟨543, 4861, by norm_num⟩; exact ⟨182, 4537, by norm_num⟩; exact ⟨6, 4447, by norm_num⟩; exact ⟨217, 4477, by norm_num⟩; exact ⟨563, 4609, by norm_num⟩; exact ⟨164, 4379, by norm_num⟩; exact ⟨177, 4369, by norm_num⟩; exact ⟨224, 4337, by norm_num⟩; exact ⟨561, 4517, by norm_num⟩; exact ⟨514, 4367, by norm_num⟩; exact ⟨247, 4199, by norm_num⟩; exact ⟨282, 4087, by norm_num⟩; exact ⟨640, 4279, by norm_num⟩; exact ⟨62, 3911, by norm_num⟩; exact ⟨725, 4253, by norm_num⟩; exact ⟨740, 4199, by norm_num⟩; exact ⟨475, 3971, by norm_num⟩; exact ⟨607, 3971, by norm_num⟩; exact ⟨227, 3743, by norm_num⟩; exact ⟨37, 3667, by norm_num⟩; exact ⟨687, 3961, by norm_num⟩; exact ⟨677, 3937, by norm_num⟩; exact ⟨302, 3673, by norm_num⟩; exact ⟨201, 3613, by norm_num⟩; exact ⟨138, 3559, by norm_num⟩; exact ⟨186, 3551, by norm_num⟩; exact ⟨228, 3553, by norm_num⟩; exact ⟨96, 3509, by norm_num⟩; exact ⟨633, 3737, by norm_num⟩; exact ⟨583, 3677, by norm_num⟩; exact ⟨803, 3803, by norm_num⟩; exact ⟨392, 3499, by norm_num⟩; exact ⟨89, 3359, by norm_num⟩; exact ⟨304, 3401, by norm_num⟩]
  · show 141 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert141
