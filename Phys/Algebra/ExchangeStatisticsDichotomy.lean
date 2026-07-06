/-
  Phys.Algebra.ExchangeStatisticsDichotomy — N373.
  ============================================================================================
  ARC G (the emergent / quantum-statistical layer) — G1: THE EXCHANGE-INVOLUTION STATISTICS
  DICHOTOMY + PAULI EXCLUSION.

  THE CLAIM. The Bose/Fermi DICHOTOMY (exactly TWO statistics classes — no parastatistics) and the
  Pauli exclusion principle FALL OUT of the banked derived carrier `ImO` (the fundamental 7, N22/
  N227) and the derived number field ℚ — they are NOT posited.

  THE FOLD-CAUSAL TRACE. The fold looks back: self / other. Doubled — TWO identical carriers present
  — the fold has NO ordering datum (self-blindness carries no memory of which came first). So
  swapping the two factors, then swapping again, returns EXACTLY (no phase memory): the exchange
  operator `exchange` on the two-quantum space `Two = ImO ⊗ ImO` satisfies `exchange² = 1`, an
  INVOLUTION — forced by the fold's orderlessness, not posited. Over the derived ℚ (char 0), an
  involution splits its space into its `+1` and `−1` eigenspaces and NOTHING ELSE:
  `x = ½(x + exchange x) + ½(x − exchange x)`, and any eigenvalue `λ` has `λ² = 1` so `λ = ±1`.
  TWO classes, forced: `+1` = symmetric (Bose), `−1` = antisymmetric (Fermi). The identical pair
  `v ⊗ v` is exchange-fixed (`exchange (v ⊗ v) = v ⊗ v`), so it lives purely in the `+1` sector and
  is ANNIHILATED by the `−1` projector — Pauli exclusion, a theorem, not a rule.

  ONE CAUSE, THE STATISTICAL FACE. This is the SAME structure the banked N227
  `TowerGatherSymAntisymDecomp` builds at the operator level (the Born-transpose involution `bAdj`
  splitting `End ℚ ImO = Sym²(28) ⊕ Λ²(21)`), read here on the two-quantum STATE space. The heavy
  algebraic-QFT tower the field grinds to reach spin-statistics (DHR superselection sectors,
  nuclearity, the split property, permutation-group statistics operators) DISSOLVES: the dichotomy
  is one fact — a char-0 involution has exactly two `±1` eigenspaces — living on the banked derived
  carrier. The binary `self / other` split (the pair-exchange group has exactly TWO one-dimensional
  characters, the same binary as the black-hole entropy bit `s₀ = cutLog 2`, N361) is why there are
  EXACTLY two statistics classes and no third.

  WHAT IS BANKED HERE (all over the derived ℚ / `ImO`):
  §1  `exchange` = the flip of the tensor factors; `exchange_involutive : exchange² = 1`;
      `exchange_tmul : exchange (a ⊗ b) = b ⊗ a`; `finrank_Two = 49`; `Nontrivial Two`;
      `exchange_ne_zero`.
  §2  the two projectors `boseProj = ½(1 + exchange)`, `fermiProj = ½(1 − exchange)`;
      `bose_add_fermi : boseProj + fermiProj = 1` (COMPLETE decomposition — no third class);
      `boseProj_idem`, `fermiProj_idem` (genuine projectors); `bose_mul_fermi : boseProj*fermiProj=0`
      (ORTHOGONAL sectors); `bose_ne_fermi` (the two sectors are GENUINELY DISTINCT).
  §3  ★ `exchange_eigen_dichotomy` — every eigenvalue of exchange is `+1` or `−1` (EXACTLY two
      statistics classes, no parastatistics); `exchange_boseProj`/`exchange_fermiProj` — the ±1
      eigen-characterization.
  §4  ★ `pauli_exclusion : fermiProj (v ⊗ v) = 0` (no two identical fermions in one state — a
      theorem); `bose_identical : boseProj (v ⊗ v) = v ⊗ v` (the identical pair is purely symmetric).
  §5  capstone `exchange_statistics_dichotomy_structure`.

  GRADE: ASSEMBLY / theorem-of-premises. What is proved is EXACTLY: exchange on the two-quantum space
  of the banked derived carrier `ImO` is a char-0 involution, hence there are exactly two `±1`
  sectors (Bose/Fermi), they are complete/orthogonal/distinct, and the antisymmetric sector excludes
  the diagonal (Pauli). The spin ↔ antisymmetry half of the spin-statistics theorem is NOT claimed
  as a Lean theorem here (it needs the banked so(7) spin tie) — prose-only, flagged, deferred.

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (Bose/Fermi/Pauli/spin/statistics/exclusion/
  quantum): over the derived `ℚ` and the banked `ImO`, for `Two = ImO ⊗[ℚ] ImO`, the flip
  endomorphism `exchange` is an involution (`exchange² = 1`); its two spectral projectors
  `½(1 ± exchange)` are orthogonal idempotents summing to `1` and are distinct; every eigenvalue is
  `±1`; and the `−1` projector annihilates the diagonal `v ⊗ v`. No theorem STATEMENT needs a
  physics word.

  Foundations-only: no posited axiom, no Mathlib number/operator-algebra as content (TensorProduct /
  finrank are pure MACHINERY on the derived carrier), no sorry, no kernel-trust bypass, no heartbeat
  inflation.
-/
import Phys.Algebra.TowerGatherSymAntisymDecomp
import Mathlib.LinearAlgebra.TensorProduct.Basic

namespace Phys.Algebra.ExchStat

open Phys.Cascade Phys.Cascade.CD
open scoped TensorProduct

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## §1 — THE TWO-QUANTUM SPACE AND THE EXCHANGE INVOLUTION. -/

/-- The two-quantum state space: the tensor square of the banked fundamental carrier `ImO`. -/
abbrev Two := ImO ⊗[ℚ] ImO

/-- THE EXCHANGE OPERATOR: the flip of the two tensor factors, `a ⊗ b ↦ b ⊗ a`. This is the
    exchange of two identical quanta — the fold's doubling carries no ordering datum. -/
def exchange : Module.End ℚ Two := (TensorProduct.comm ℚ ImO ImO).toLinearMap

/-- `exchange (a ⊗ b) = b ⊗ a`. -/
@[simp] theorem exchange_tmul (a b : ImO) : exchange (a ⊗ₜ b) = b ⊗ₜ a := by
  simp [exchange, TensorProduct.comm_tmul]

/-- ★ EXCHANGE IS AN INVOLUTION: `exchange² = 1`. Swapping twice returns exactly — the fold's
    orderlessness (self-blindness has no memory of which factor came first). FORCED, not posited. -/
theorem exchange_involutive : exchange * exchange = 1 := by
  ext x; simp [exchange, Module.End.mul_apply]

/-- The two-quantum space has finrank `49 = 7·7` (banked `finrank_ImO = 7`, N22). -/
theorem finrank_Two : Module.finrank ℚ Two = 49 := by
  rw [Module.finrank_tensorProduct, finrank_ImO]

instance : Nontrivial Two := Module.nontrivial_of_finrank_eq_succ (n := 48) (by rw [finrank_Two])

/-- The exchange operator is nonzero (the two sectors are genuinely present). -/
theorem exchange_ne_zero : exchange ≠ 0 := by
  intro h
  have h1 : (exchange * exchange) = (0 : Module.End ℚ Two) := by rw [h, mul_zero]
  rw [exchange_involutive] at h1
  exact one_ne_zero h1

/-! ## §2 — THE TWO SECTORS: symmetric (Bose) and antisymmetric (Fermi) projectors. -/

/-- THE SYMMETRIC (Bose) PROJECTOR `½(1 + exchange)` — the `+1` eigenspace of exchange. -/
def boseProj : Module.End ℚ Two := (2⁻¹ : ℚ) • (1 + exchange)

/-- THE ANTISYMMETRIC (Fermi) PROJECTOR `½(1 − exchange)` — the `−1` eigenspace of exchange. -/
def fermiProj : Module.End ℚ Two := (2⁻¹ : ℚ) • (1 - exchange)

/-- ★ COMPLETE DECOMPOSITION: `boseProj + fermiProj = 1`. There is NO third class — the two
    sectors exhaust the two-quantum space. -/
theorem bose_add_fermi : boseProj + fermiProj = 1 := by
  unfold boseProj fermiProj
  rw [← smul_add]
  have h : (1 + exchange) + (1 - exchange) = (2 : ℚ) • (1 : Module.End ℚ Two) := by
    rw [two_smul]; abel
  rw [h, smul_smul]; norm_num

/-- `boseProj` is idempotent: a genuine projector. -/
theorem boseProj_idem : boseProj * boseProj = boseProj := by
  have hsq : ((1 : Module.End ℚ Two) + exchange) * (1 + exchange)
      = (2:ℚ) • (1 + exchange) := by
    have hexp : ((1 : Module.End ℚ Two) + exchange) * (1 + exchange)
        = 1 + exchange + exchange + exchange * exchange := by
      rw [add_mul, mul_add, mul_add, one_mul, mul_one, one_mul]; abel
    rw [hexp, exchange_involutive, two_smul]; abel
  unfold boseProj
  rw [smul_mul_smul_comm, hsq, smul_smul, show (2⁻¹ * 2⁻¹ * 2 : ℚ) = 2⁻¹ by norm_num]

/-- `fermiProj` is idempotent: a genuine projector. -/
theorem fermiProj_idem : fermiProj * fermiProj = fermiProj := by
  have hsq : ((1 : Module.End ℚ Two) - exchange) * (1 - exchange)
      = (2:ℚ) • (1 - exchange) := by
    have hexp := mul_sub ((1:Module.End ℚ Two) - exchange) 1 exchange
    rw [mul_one] at hexp
    have hd : ((1:Module.End ℚ Two) - exchange) * exchange = exchange - 1 := by
      have := sub_mul (1:Module.End ℚ Two) exchange exchange
      rw [one_mul, exchange_involutive] at this; rw [this]
    rw [hd] at hexp
    rw [hexp, two_smul]; abel
  unfold fermiProj
  rw [smul_mul_smul_comm, hsq, smul_smul, show (2⁻¹ * 2⁻¹ * 2 : ℚ) = 2⁻¹ by norm_num]

/-- ★ ORTHOGONAL SECTORS: `boseProj * fermiProj = 0`. The symmetric and antisymmetric sectors
    do not overlap. -/
theorem bose_mul_fermi : boseProj * fermiProj = 0 := by
  unfold boseProj fermiProj
  rw [smul_mul_smul_comm]
  have h : ((1:Module.End ℚ Two) + exchange) * (1 - exchange) = 0 := by
    have hexp := mul_sub ((1:Module.End ℚ Two) + exchange) 1 exchange
    rw [mul_one] at hexp
    have hd : ((1:Module.End ℚ Two) + exchange) * exchange = exchange + 1 := by
      rw [add_mul, one_mul, exchange_involutive]
    rw [hd] at hexp
    rw [hexp]; abel
  rw [h, smul_zero]

/-- `boseProj − fermiProj = exchange`. -/
theorem bose_sub_fermi : boseProj - fermiProj = exchange := by
  unfold boseProj fermiProj
  have h := smul_sub (2⁻¹:ℚ) ((1:Module.End ℚ Two) + exchange) (1 - exchange)
  rw [← h]
  have h2 : ((1:Module.End ℚ Two) + exchange) - (1 - exchange) = (2:ℚ) • exchange := by
    rw [two_smul]; abel
  rw [h2, smul_smul]; norm_num

/-- ★ THE TWO SECTORS ARE GENUINELY DISTINCT: `boseProj ≠ fermiProj` (the dichotomy is not
    vacuous — there really are two different statistics classes). -/
theorem bose_ne_fermi : boseProj ≠ fermiProj := by
  intro h
  have hz : boseProj - fermiProj = 0 := by rw [h]; exact sub_self fermiProj
  rw [bose_sub_fermi] at hz
  exact exchange_ne_zero hz

/-! ## §3 — ★ THE DICHOTOMY: exactly two statistics classes (no parastatistics). -/

/-- ★★★ THE STATISTICS DICHOTOMY. Every eigenvalue of the exchange involution is `+1` or `−1`:
    there are EXACTLY TWO statistics classes (Bose and Fermi) — no third (no parastatistics),
    because an involution over the char-0 field ℚ has only the eigenvalues `±1`. -/
theorem exchange_eigen_dichotomy (lam : ℚ) (x : Two) (hx : x ≠ 0)
    (h : exchange x = lam • x) : lam = 1 ∨ lam = -1 := by
  have hinv : exchange (exchange x) = x := by
    have hx2 : (exchange * exchange) x = (1 : Module.End ℚ Two) x := by rw [exchange_involutive]
    simpa [Module.End.mul_apply] using hx2
  have h2 : x = (lam * lam) • x := by
    calc x = exchange (exchange x) := hinv.symm
      _ = exchange (lam • x) := by rw [h]
      _ = lam • exchange x := by rw [map_smul]
      _ = lam • lam • x := by rw [h]
      _ = (lam * lam) • x := by rw [smul_smul]
  have h4 : lam * lam - 1 = 0 := by
    by_contra hne
    have h3 : (lam * lam - 1) • x = 0 := by
      have e : (lam * lam - 1) • x = (lam * lam) • x - (1 : ℚ) • x :=
        sub_smul (lam * lam) 1 x
      rw [e, one_smul, ← h2, sub_self]
    exact hx ((smul_eq_zero.1 h3).resolve_left hne)
  have h5 : lam * lam = 1 := by linarith
  have hfac : (lam - 1) * (lam + 1) = 0 := by ring_nf; linarith [h5]
  rcases mul_eq_zero.1 hfac with hl | hr
  · left; linarith
  · right; linarith

/-- The symmetric (Bose) sector is the `+1` eigenspace: `exchange` fixes `boseProj`. -/
theorem exchange_boseProj : exchange * boseProj = boseProj := by
  unfold boseProj
  rw [mul_smul_comm, mul_add, mul_one, exchange_involutive, add_comm]

/-- The antisymmetric (Fermi) sector is the `−1` eigenspace: `exchange` negates `fermiProj`. -/
theorem exchange_fermiProj : exchange * fermiProj = - fermiProj := by
  unfold fermiProj
  rw [mul_smul_comm]
  have he := mul_sub exchange 1 exchange
  rw [mul_one, exchange_involutive] at he
  have hneg : exchange * ((1:Module.End ℚ Two) - exchange) = -(1 - exchange) := by
    rw [he]; abel
  rw [hneg]
  exact smul_neg (2⁻¹:ℚ) ((1:Module.End ℚ Two) - exchange)

/-! ## §4 — ★ PAULI EXCLUSION: the antisymmetric sector excludes the identical pair. -/

/-- ★★★ PAULI EXCLUSION. The antisymmetric (Fermi) projector ANNIHILATES the identical pair
    `v ⊗ v`: no two identical fermions can occupy the same one-quantum state. A THEOREM (the
    diagonal is exchange-fixed, hence killed by `½(1 − exchange)`), not a posited rule. -/
theorem pauli_exclusion (v : ImO) : fermiProj (v ⊗ₜ v) = 0 := by
  unfold fermiProj
  rw [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.one_apply, exchange_tmul,
      sub_self, smul_zero]

/-- The identical pair `v ⊗ v` is PURELY SYMMETRIC: `boseProj (v ⊗ v) = v ⊗ v`. -/
theorem bose_identical (v : ImO) : boseProj (v ⊗ₜ v) = v ⊗ₜ v := by
  unfold boseProj
  rw [LinearMap.smul_apply, LinearMap.add_apply, Module.End.one_apply, exchange_tmul]
  rw [show (v ⊗ₜ v : Two) + v ⊗ₜ v = (2:ℚ) • (v ⊗ₜ v) by rw [two_smul], smul_smul]
  norm_num

/-! ## §5 — CAPSTONE. -/

/-- ★★★ THE EXCHANGE-INVOLUTION STATISTICS DICHOTOMY on the banked derived carrier: the exchange
    of two identical quanta is a char-0 involution, whose two spectral projectors give exactly two
    complete, orthogonal, distinct statistics classes (Bose `+1`, Fermi `−1`), with no third; the
    Fermi sector excludes the identical pair (Pauli). -/
theorem exchange_statistics_dichotomy_structure :
    exchange * exchange = 1 ∧
    boseProj + fermiProj = 1 ∧
    boseProj * fermiProj = 0 ∧
    boseProj ≠ fermiProj ∧
    (∀ (lam : ℚ) (x : Two), x ≠ 0 → exchange x = lam • x → lam = 1 ∨ lam = -1) ∧
    (∀ v : ImO, fermiProj (v ⊗ₜ v) = 0) :=
  ⟨exchange_involutive, bose_add_fermi, bose_mul_fermi, bose_ne_fermi,
   exchange_eigen_dichotomy, pauli_exclusion⟩

end

end Phys.Algebra.ExchStat
