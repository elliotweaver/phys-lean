/-
  Certificates.GaussFiberCert123 — fiber-h=123 EXCLUSION certificate for
  D = −17314763 (first odd-disc fundamental above X₀(123)).
  123 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −17314763 has size > 123,
  so h(−17314763) ≥ 124 — D is excluded from every fiber ≤ 123.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert123
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 17, 29, 31, 37, 43, 47, 59, 67, 79, 83, 89, 101, 103, 109, 113, 127, 137, 149, 151, 181, 197, 199, 223, 227, 241, 251, 257, 263, 277, 307, 311, 317, 353, 367, 373, 383, 389, 401, 421, 433, 439, 461, 467, 487, 499, 503, 521, 541, 557, 563, 569, 577, 587, 599, 601, 619, 631, 641, 643, 647, 653, 659, 661, 677, 691, 701, 709, 719, 727, 733, 743, 769, 773, 787, 797, 809, 823, 827, 853, 859, 863, 877, 887, 907, 911, 919, 929, 947, 991, 997, 1009, 1019, 1031, 1039, 1061, 1087, 1091, 1109, 1117, 1129, 1153, 1163, 1193, 1201, 1213, 1223, 1231, 1249, 1259, 1289, 1291, 1297, 1327, 1361, 1367, 1409, 1423, 1433, 1439, 1451, 1453, 1459]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -17314763) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -17314763 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    123 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -17314763) (c₀ := 4328691) (ps := ps) (h := 123)
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
    fin_cases hp <;> [exact ⟨0, 1442897, by norm_num⟩; exact ⟨1, 254629, by norm_num⟩; exact ⟨10, 149269, by norm_num⟩; exact ⟨7, 139637, by norm_num⟩; exact ⟨16, 116999, by norm_num⟩; exact ⟨20, 100677, by norm_num⟩; exact ⟨7, 92101, by norm_num⟩; exact ⟨23, 73377, by norm_num⟩; exact ⟨19, 64613, by norm_num⟩; exact ⟨16, 54797, by norm_num⟩; exact ⟨22, 52159, by norm_num⟩; exact ⟨1, 48637, by norm_num⟩; exact ⟨38, 42873, by norm_num⟩; exact ⟨9, 42027, by norm_num⟩; exact ⟨21, 39717, by norm_num⟩; exact ⟨0, 38307, by norm_num⟩; exact ⟨60, 34113, by norm_num⟩; exact ⟨60, 31623, by norm_num⟩; exact ⟨61, 29077, by norm_num⟩; exact ⟨67, 28697, by norm_num⟩; exact ⟨62, 23937, by norm_num⟩; exact ⟨71, 21999, by norm_num⟩; exact ⟨12, 21753, by norm_num⟩; exact ⟨66, 19431, by norm_num⟩; exact ⟨97, 19111, by norm_num⟩; exact ⟨84, 17991, by norm_num⟩; exact ⟨17, 17247, by norm_num⟩; exact ⟨81, 16869, by norm_num⟩; exact ⟨23, 16461, by norm_num⟩; exact ⟨124, 15683, by norm_num⟩; exact ⟨30, 14103, by norm_num⟩; exact ⟨141, 13983, by norm_num⟩; exact ⟨109, 13693, by norm_num⟩; exact ⟨39, 12267, by norm_num⟩; exact ⟨153, 11859, by norm_num⟩; exact ⟨112, 11639, by norm_num⟩; exact ⟨58, 11311, by norm_num⟩; exact ⟨192, 11223, by norm_num⟩; exact ⟨198, 10893, by norm_num⟩; exact ⟨131, 10323, by norm_num⟩; exact ⟨166, 10061, by norm_num⟩; exact ⟨90, 9879, by norm_num⟩; exact ⟨38, 9393, by norm_num⟩; exact ⟨226, 9379, by norm_num⟩; exact ⟨190, 8963, by norm_num⟩; exact ⟨161, 8727, by norm_num⟩; exact ⟨147, 8649, by norm_num⟩; exact ⟨165, 8361, by norm_num⟩; exact ⟨254, 8121, by norm_num⟩; exact ⟨29, 7773, by norm_num⟩; exact ⟨83, 7701, by norm_num⟩; exact ⟨110, 7629, by norm_num⟩; exact ⟨236, 7599, by norm_num⟩; exact ⟨182, 7431, by norm_num⟩; exact ⟨159, 7269, by norm_num⟩; exact ⟨105, 7221, by norm_num⟩; exact ⟨272, 7113, by norm_num⟩; exact ⟨24, 6861, by norm_num⟩; exact ⟨202, 6817, by norm_num⟩; exact ⟨136, 6761, by norm_num⟩; exact ⟨267, 6801, by norm_num⟩; exact ⟨231, 6711, by norm_num⟩; exact ⟨97, 6583, by norm_num⟩; exact ⟨227, 6627, by norm_num⟩; exact ⟨107, 6411, by norm_num⟩; exact ⟨42, 6267, by norm_num⟩; exact ⟨245, 6261, by norm_num⟩; exact ⟨129, 6129, by norm_num⟩; exact ⟨263, 6117, by norm_num⟩; exact ⟨356, 6129, by norm_num⟩; exact ⟨244, 5987, by norm_num⟩; exact ⟨47, 5829, by norm_num⟩; exact ⟨78, 5637, by norm_num⟩; exact ⟨262, 5689, by norm_num⟩; exact ⟨121, 5519, by norm_num⟩; exact ⟨173, 5469, by norm_num⟩; exact ⟨248, 5427, by norm_num⟩; exact ⟨119, 5277, by norm_num⟩; exact ⟨220, 5293, by norm_num⟩; exact ⟨73, 5081, by norm_num⟩; exact ⟨424, 5249, by norm_num⟩; exact ⟨341, 5151, by norm_num⟩; exact ⟨79, 4943, by norm_num⟩; exact ⟨27, 4881, by norm_num⟩; exact ⟨20, 4773, by norm_num⟩; exact ⟨189, 4791, by norm_num⟩; exact ⟨391, 4877, by norm_num⟩; exact ⟨165, 4689, by norm_num⟩; exact ⟨144, 4593, by norm_num⟩; exact ⟨54, 4371, by norm_num⟩; exact ⟨443, 4539, by norm_num⟩; exact ⟨478, 4517, by norm_num⟩; exact ⟨223, 4297, by norm_num⟩; exact ⟨188, 4233, by norm_num⟩; exact ⟨310, 4259, by norm_num⟩; exact ⟨400, 4231, by norm_num⟩; exact ⟨210, 4023, by norm_num⟩; exact ⟨76, 3973, by norm_num⟩; exact ⟨193, 3937, by norm_num⟩; exact ⟨132, 3891, by norm_num⟩; exact ⟨266, 3897, by norm_num⟩; exact ⟨360, 3867, by norm_num⟩; exact ⟨170, 3747, by norm_num⟩; exact ⟨366, 3741, by norm_num⟩; exact ⟨326, 3693, by norm_num⟩; exact ⟨22, 3569, by norm_num⟩; exact ⟨552, 3789, by norm_num⟩; exact ⟨326, 3603, by norm_num⟩; exact ⟨170, 3489, by norm_num⟩; exact ⟨237, 3483, by norm_num⟩; exact ⟨360, 3459, by norm_num⟩; exact ⟨287, 3417, by norm_num⟩; exact ⟨132, 3351, by norm_num⟩; exact ⟨565, 3503, by norm_num⟩; exact ⟨25, 3181, by norm_num⟩; exact ⟨612, 3441, by norm_num⟩; exact ⟨633, 3357, by norm_num⟩; exact ⟨113, 3051, by norm_num⟩; exact ⟨640, 3307, by norm_num⟩; exact ⟨35, 3009, by norm_num⟩; exact ⟨160, 3001, by norm_num⟩; exact ⟨628, 3251, by norm_num⟩; exact ⟨55, 2969, by norm_num⟩]
  · show 123 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert123
