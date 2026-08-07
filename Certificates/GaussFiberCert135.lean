/-
  Certificates.GaussFiberCert135 — fiber-h=135 EXCLUSION certificate for
  D = −20986739 (first odd-disc fundamental above X₀(135)).
  135 deep touching primes drive fiber_exclusion (N624):
  any complete duplicate-free box of disc −20986739 has size > 135,
  so h(−20986739) ≥ 136 — D is excluded from every fiber ≤ 135.
  AUTO-GENERATED from witness data; every hypothesis kernel-checked.
-/
import Phys.Algebra.GaussCertKit

set_option maxRecDepth 4096

namespace Certificates.FiberCert135
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def ps : List Z := [3, 5, 17, 23, 43, 53, 67, 71, 89, 103, 107, 109, 127, 137, 139, 163, 173, 179, 191, 193, 197, 199, 223, 227, 233, 239, 251, 269, 311, 331, 337, 347, 349, 373, 383, 409, 431, 433, 439, 443, 457, 467, 479, 487, 503, 521, 547, 557, 571, 587, 593, 599, 607, 613, 641, 643, 647, 653, 661, 701, 709, 727, 739, 751, 769, 787, 797, 811, 821, 827, 829, 839, 857, 863, 877, 881, 887, 907, 919, 941, 947, 967, 971, 977, 991, 1009, 1031, 1033, 1051, 1069, 1091, 1097, 1123, 1129, 1181, 1187, 1193, 1229, 1231, 1237, 1249, 1259, 1277, 1279, 1289, 1291, 1297, 1303, 1307, 1319, 1321, 1381, 1399, 1429, 1433, 1453, 1459, 1471, 1481, 1483, 1487, 1489, 1499, 1511, 1543, 1553, 1579, 1583, 1597, 1601, 1607, 1613, 1669, 1697, 1699]

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
  exact List.IsChain.singleton _

theorem cert : ∀ (L : List GaussForms.BQF) (pf : GaussForms.BQF),
    List.Pairwise (· ≠ ·) L →
    (∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = -20986739) →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = -20986739 → f ∈ L) →
    pf ∈ L → pf.a = 1 →
    135 < L.length := by
  intro L pf hpw hmem hcomplete hpfL hpfa
  apply fiber_exclusion (D := -20986739) (c₀ := 5246685) (ps := ps) (h := 135)
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
    fin_cases hp <;> [exact ⟨0, 1748895, by norm_num⟩; exact ⟨0, 1049337, by norm_num⟩; exact ⟨6, 308631, by norm_num⟩; exact ⟨2, 228117, by norm_num⟩; exact ⟨11, 122019, by norm_num⟩; exact ⟨12, 98997, by norm_num⟩; exact ⟨20, 78315, by norm_num⟩; exact ⟨1, 73897, by norm_num⟩; exact ⟨11, 58953, by norm_num⟩; exact ⟨25, 50945, by norm_num⟩; exact ⟨26, 49041, by norm_num⟩; exact ⟨5, 48135, by norm_num⟩; exact ⟨48, 41331, by norm_num⟩; exact ⟨23, 38301, by norm_num⟩; exact ⟨35, 37755, by norm_num⟩; exact ⟨81, 32229, by norm_num⟩; exact ⟨82, 30367, by norm_num⟩; exact ⟨18, 29313, by norm_num⟩; exact ⟨77, 27501, by norm_num⟩; exact ⟨4, 27185, by norm_num⟩; exact ⟨79, 26665, by norm_num⟩; exact ⟨99, 26415, by norm_num⟩; exact ⟨83, 23559, by norm_num⟩; exact ⟨20, 23115, by norm_num⟩; exact ⟨40, 22525, by norm_num⟩; exact ⟨62, 21969, by norm_num⟩; exact ⟨97, 20941, by norm_num⟩; exact ⟨104, 19545, by norm_num⟩; exact ⟨57, 16881, by norm_num⟩; exact ⟨57, 15861, by norm_num⟩; exact ⟨86, 15591, by norm_num⟩; exact ⟨103, 15151, by norm_num⟩; exact ⟨101, 15063, by norm_num⟩; exact ⟨17, 14067, by norm_num⟩; exact ⟨138, 13749, by norm_num⟩; exact ⟨92, 12849, by norm_num⟩; exact ⟨127, 12211, by norm_num⟩; exact ⟨176, 12189, by norm_num⟩; exact ⟨39, 11955, by norm_num⟩; exact ⟨25, 11845, by norm_num⟩; exact ⟨11, 11481, by norm_num⟩; exact ⟨53, 11241, by norm_num⟩; exact ⟨74, 10965, by norm_num⟩; exact ⟨97, 10793, by norm_num⟩; exact ⟨182, 10497, by norm_num⟩; exact ⟨17, 10071, by norm_num⟩; exact ⟨126, 9621, by norm_num⟩; exact ⟨28, 9421, by norm_num⟩; exact ⟨60, 9195, by norm_num⟩; exact ⟨99, 8955, by norm_num⟩; exact ⟨156, 8889, by norm_num⟩; exact ⟨48, 8763, by norm_num⟩; exact ⟨235, 8735, by norm_num⟩; exact ⟨60, 8565, by norm_num⟩; exact ⟨272, 8301, by norm_num⟩; exact ⟨132, 8187, by norm_num⟩; exact ⟨323, 8271, by norm_num⟩; exact ⟨96, 8049, by norm_num⟩; exact ⟨240, 8025, by norm_num⟩; exact ⟨85, 7495, by norm_num⟩; exact ⟨320, 7545, by norm_num⟩; exact ⟨347, 7383, by norm_num⟩; exact ⟨349, 7265, by norm_num⟩; exact ⟨23, 6987, by norm_num⟩; exact ⟨316, 6953, by norm_num⟩; exact ⟨372, 6843, by norm_num⟩; exact ⟨39, 6585, by norm_num⟩; exact ⟨78, 6477, by norm_num⟩; exact ⟨399, 6585, by norm_num⟩; exact ⟨159, 6375, by norm_num⟩; exact ⟨7, 6329, by norm_num⟩; exact ⟨35, 6255, by norm_num⟩; exact ⟨391, 6301, by norm_num⟩; exact ⟨206, 6129, by norm_num⟩; exact ⟨214, 6035, by norm_num⟩; exact ⟨191, 5997, by norm_num⟩; exact ⟨306, 6021, by norm_num⟩; exact ⟨415, 5975, by norm_num⟩; exact ⟨323, 5823, by norm_num⟩; exact ⟨215, 5625, by norm_num⟩; exact ⟨392, 5703, by norm_num⟩; exact ⟨121, 5441, by norm_num⟩; exact ⟨301, 5497, by norm_num⟩; exact ⟨408, 5541, by norm_num⟩; exact ⟨401, 5457, by norm_num⟩; exact ⟨231, 5253, by norm_num⟩; exact ⟨136, 5107, by norm_num⟩; exact ⟨222, 5127, by norm_num⟩; exact ⟨403, 5147, by norm_num⟩; exact ⟨126, 4923, by norm_num⟩; exact ⟨80, 4815, by norm_num⟩; exact ⟨515, 5025, by norm_num⟩; exact ⟨88, 4679, by norm_num⟩; exact ⟨539, 4905, by norm_num⟩; exact ⟨147, 4461, by norm_num⟩; exact ⟨523, 4651, by norm_num⟩; exact ⟨564, 4665, by norm_num⟩; exact ⟨171, 4293, by norm_num⟩; exact ⟨299, 4335, by norm_num⟩; exact ⟨252, 4293, by norm_num⟩; exact ⟨53, 4203, by norm_num⟩; exact ⟨580, 4435, by norm_num⟩; exact ⟨343, 4201, by norm_num⟩; exact ⟨228, 4143, by norm_num⟩; exact ⟨413, 4203, by norm_num⟩; exact ⟨536, 4287, by norm_num⟩; exact ⟨333, 4131, by norm_num⟩; exact ⟨104, 4035, by norm_num⟩; exact ⟨164, 4035, by norm_num⟩; exact ⟨189, 4005, by norm_num⟩; exact ⟨65, 3975, by norm_num⟩; exact ⟨228, 3837, by norm_num⟩; exact ⟨271, 3803, by norm_num⟩; exact ⟨536, 3873, by norm_num⟩; exact ⟨558, 3879, by norm_num⟩; exact ⟨349, 3695, by norm_num⟩; exact ⟨387, 3699, by norm_num⟩; exact ⟨282, 3621, by norm_num⟩; exact ⟨411, 3657, by norm_num⟩; exact ⟨379, 3635, by norm_num⟩; exact ⟨147, 3543, by norm_num⟩; exact ⟨599, 3765, by norm_num⟩; exact ⟨85, 3505, by norm_num⟩; exact ⟨678, 3777, by norm_num⟩; exact ⟨733, 3749, by norm_num⟩; exact ⟨425, 3495, by norm_num⟩; exact ⟨688, 3623, by norm_num⟩; exact ⟨654, 3585, by norm_num⟩; exact ⟨663, 3561, by norm_num⟩; exact ⟨521, 3447, by norm_num⟩; exact ⟨474, 3405, by norm_num⟩; exact ⟨805, 3655, by norm_num⟩; exact ⟨660, 3405, by norm_num⟩; exact ⟨581, 3291, by norm_num⟩; exact ⟨243, 3123, by norm_num⟩]
  · show 135 ≤ ps.length
    unfold ps
    simp only [List.length_cons, List.length_nil]
    norm_num

#print axioms cert

end Certificates.FiberCert135
