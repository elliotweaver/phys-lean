/-
  Phys.Algebra.AtomicShellPauli — N403 (arc-L L2): ATOMIC SHELL STRUCTURE =
  THE MANY-BODY ANTISYMMETRIC CAPACITY OF THE BANKED FIBRE.
  ============================================================================================
  THE SECOND NODE OF ARC L — the emergent matter ladder. L1 (N402) derived nuclear binding as
  residual colour (the confinement leakage between colour singlets). L2 (this node) climbs one rung:
  ATOMIC SHELL STRUCTURE, derived from the banked Pauli exclusion (N373) generalized from TWO
  identical quanta to N identical quanta.

  ── THE FORWARD DERIVATION (fold → the shell; nothing posited) ──
  The fold is self-look-back and SELF-BLIND: it carries no ordering datum (N1). Doubled — two
  identical carriers — the exchange of the two factors is an involution with no phase memory, and
  its `−1` (antisymmetric) sector KILLS the diagonal `v ⊗ v`: two identical fermions cannot share a
  state (the banked N373 `pauli_exclusion`, cited here as `two_body_pauli_weld`). This node composes
  the SAME orderless self-blindness across N probes. The antisymmetric sector of N identical quanta
  is the N-FOLD EXTERIOR POWER of the banked carrier:

    · `fermiSector N := ⋀[Cut]^N StateFibre` — the N-quantum antisymmetric sector, built on the
      BANKED 2D real fibre `StateFibre` (N391, `finrank = 2`), the forced probe carrier.

  Two banked facts now MEET and force the shell:
    · SELF-BLINDNESS → ANTISYMMETRY: a repeated argument annihilates the wedge (`manyBodyPauli`) —
      the many-body form of Pauli, an alternating-map theorem, not a posited occupancy rule.
    · THE CASCADE TERMINATED → FINITE CARRIER: the carrier has a FINITE dimension `d` (here `d = 2`,
      banked `fibre_finrank`), so by `finrank ⋀^N V = C(d, N)` (`sector_capacity`) the sector has a
      HARD CAPACITY that VANISHES once `N > d` (`shell_closes_beyond_capacity`). The shell FILLS
      (nonzero capacity for `N ≤ d`) and then CLOSES (capacity `0` for `N > d`) — because the
      antisymmetric power runs out of room in the finite carrier the terminated cascade produced.

  ⇒ atomic shell structure — filling then closure — is DERIVED: it is the collision of self-blindness
  (antisymmetry) with the cascade's finite carrier (`C(d, d+1) = 0`). The periodic closure the field
  reads as an EMPIRICAL pattern is the forced combinatorial fact `C(d, d+1) = 0` on the banked fibre.

  ── ONE CAUSE, MANY CARRIERS (the weld) ──
  The SAME antisymmetric-capacity closure runs on the OTHER banked carrier `ImO` (the fundamental 7,
  N22): `imO_capacity : finrank ⋀^N ImO = C(7, N)`, closing beyond `7` (`imO_closes_beyond_seven`).
  Shell closure is not a feature of the 2D fibre — it is the generic collision of self-blindness with
  ANY finite carrier the cascade fixes.

  WHAT IS BANKED HERE (forward, foundations-only):
    fermiSector                     — `⋀[Cut]^N StateFibre`, the N-quantum antisymmetric sector.
    sector_capacity                 — `finrank (fermiSector N) = C(2, N)` (the shell capacity).
    manyBodyPauli                   — ★ many-body Pauli: a repeated argument annihilates the wedge.
    two_body_pauli_weld             — the banked N373 two-body Pauli (`fermiProj (v⊗v) = 0`), cited.
    orbital_occupancy               — capacity `2` at `N = 1` (a one-quantum orbital holds two).
    orbital_filled                  — capacity `1` at `N = 2` (the closed-shell singlet).
    orbital_nonvacuous              — ★ [W8] the filled shell is `Nontrivial` (genuinely holds a state).
    orbital_closes                  — capacity `0` at `N = 3` (the shell CLOSES).
    orbital_closed_subsingleton     — the closed shell is a `Subsingleton` (no 3-quantum state).
    shell_closes_beyond_capacity    — ★ capacity `0` for every `N > 2`: the generic closure.
    shell_subsingleton_beyond_capacity — no antisymmetric state beyond capacity, for every `N > 2`.
    imO_capacity / imO_closes_beyond_seven — the same closure on the banked 7-carrier (the weld).
    atomic_shell_structure          — ★★ THE CAPSTONE: capacity + many-body Pauli + fill + closure.

  SCOPE (docs/RUNBOOK.md W4.5). This node derives EXACTLY the shell STRUCTURE: the N-body
  antisymmetric capacity `C(d, N)`, many-body Pauli (repeated-argument annihilation), and the
  fill/closure dichotomy on the banked carriers. It does NOT compute energy levels, level spacings,
  or binding energies (candidate, per seed §L2 — NOT attempted), and does NOT build L3 (chemistry /
  the periodic table). GRADE: THEOREM-ROUTE for the structure (Pauli is banked). The Coulomb / α*
  "sets the binding scale" identification is REMOVABLE PROSE only — never a load-bearing theorem
  here — and NO energy number is fitted (G1/G2 NO-FIT, LOUD: this is beyond-key arc L).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "atom / electron / shell / orbital / Pauli /
  fermion / quantum": what remains is the pure statement that the `N`-fold exterior power of the
  banked 2-dimensional carrier `StateFibre` (over the derived field `Cut`) has dimension `C(2, N)`,
  is nonzero for `N ≤ 2` and zero (a `Subsingleton`) for `N > 2`; that the canonical alternating map
  annihilates any family with a repeated argument; and that the same holds on the banked `ImO` with
  `C(7, N)`. No theorem STATEMENT needs a physics word to be true.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge. Built on the
  BANKED derived ℝ `Cut`, the banked forced fibre `StateFibre` (N391), the banked two-body Pauli
  `pauli_exclusion` (N373), the banked carrier `ImO` (N22), and Mathlib's `exteriorPower` /
  `AlternatingMap` / `Nat.choose` as MACHINERY over the derived objects — NO Mathlib `Real` /
  `Complex` as content, NO posited occupancy rule / effective shell model.
-/
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.Data.Nat.Choose.Basic
import Phys.Quantum.PrimitiveFibre
import Phys.Algebra.ExchangeStatisticsDichotomy

namespace Phys.Algebra.AtomicShell

open Phys.Foundation Module
open Phys.Foundation.ContinuumQ

noncomputable section

/-! ## §1 — THE MANY-BODY ANTISYMMETRIC SECTOR AND ITS CAPACITY. -/

/-- THE N-QUANTUM ANTISYMMETRIC (Fermi) SECTOR: the `N`-fold exterior power of the banked forced 2D
    real fibre `StateFibre` (N391). This is N373's `−1` antisymmetric sector generalized from two
    identical quanta to `N` — the orderless self-blindness of the fold composed across `N` probes. -/
abbrev fermiSector (N : ℕ) := ⋀[ContinuumQ.Cut]^N Phys.Quantum.StateFibre

/-- ★ THE SHELL CAPACITY: `finrank (fermiSector N) = C(2, N)`. The dimension of the `N`-quantum
    antisymmetric sector of the banked 2D fibre is the binomial coefficient `C(2, N)` — the number
    of ways to fill `N` slots antisymmetrically from a 2-dimensional carrier. This is the occupancy
    NOT posited but DERIVED: `finrank ⋀^N V = C(finrank V, N)` on the banked `StateFibre`. -/
theorem sector_capacity (N : ℕ) :
    finrank ContinuumQ.Cut (fermiSector N) = Nat.choose 2 N := by
  rw [fermiSector, exteriorPower.finrank_eq, Phys.Quantum.fibre_finrank]

/-! ## §2 — MANY-BODY PAULI: a repeated state annihilates the antisymmetric sector. -/

/-- ★★★ MANY-BODY PAULI EXCLUSION. If two of the `N` quanta occupy the SAME one-quantum state
    (`a i = a j`, `i ≠ j`), the antisymmetric wedge `ιMulti a` is ZERO: no antisymmetric state
    exists with a repeated argument. This is the many-body form of the banked N373 two-body Pauli
    — a theorem of the canonical alternating map, not a posited exclusion rule. -/
theorem manyBodyPauli {N : ℕ} (a : Fin N → Phys.Quantum.StateFibre)
    (i j : Fin N) (hij : i ≠ j) (heq : a i = a j) :
    exteriorPower.ιMulti ContinuumQ.Cut N a = 0 :=
  AlternatingMap.map_eq_zero_of_eq _ a heq hij

/-- THE BANKED TWO-BODY PAULI (N373), cited as the `N = 2` base of the many-body exclusion: the
    antisymmetric projector annihilates the identical pair `v ⊗ v` on the banked carrier `ImO`. -/
theorem two_body_pauli_weld (v : Phys.Algebra.ImO) :
    Phys.Algebra.ExchStat.fermiProj (v ⊗ₜ[ℚ] v) = 0 :=
  Phys.Algebra.ExchStat.pauli_exclusion v

/-! ## §3 — FILLING AND CLOSURE: the shell fills, then closes. -/

/-- The one-quantum sector has capacity `2` (`C(2,1) = 2`): a single orbital holds two quanta. -/
theorem orbital_occupancy : finrank ContinuumQ.Cut (fermiSector 1) = 2 := by
  rw [sector_capacity]; rfl

/-- The two-quantum antisymmetric sector has capacity `1` (`C(2,2) = 1`): the closed-shell singlet. -/
theorem orbital_filled : finrank ContinuumQ.Cut (fermiSector 2) = 1 := by
  rw [sector_capacity]; rfl

/-- ★ [W8] THE FILLED SHELL IS NONVACUOUS: the two-quantum antisymmetric sector is `Nontrivial`
    (it genuinely holds a state). The shell does not vacuously "close" by being empty. -/
theorem orbital_nonvacuous : Nontrivial (fermiSector 2) := by
  apply Module.nontrivial_of_finrank_pos (R := ContinuumQ.Cut)
  rw [orbital_filled]; decide

/-- ★ THE SHELL CLOSES: the three-quantum antisymmetric sector has capacity `0` (`C(2,3) = 0`).
    A third quantum cannot be added antisymmetrically to a 2-dimensional carrier — the shell is
    full. Closure is DERIVED from the finite carrier, not posited. -/
theorem orbital_closes : finrank ContinuumQ.Cut (fermiSector 3) = 0 := by
  rw [sector_capacity]; exact Nat.choose_eq_zero_of_lt (by decide)

/-- The closed shell is a `Subsingleton`: there is NO nonzero three-quantum antisymmetric state. -/
theorem orbital_closed_subsingleton : Subsingleton (fermiSector 3) := by
  rw [← Module.finrank_zero_iff (R := ContinuumQ.Cut)]; exact orbital_closes

/-- ★ THE GENERIC CLOSURE: for EVERY `N > 2` the antisymmetric sector of the 2D fibre has capacity
    `0` (`C(2, N) = 0`). The finite carrier of the terminated cascade caps the shell; every higher
    occupancy is empty. -/
theorem shell_closes_beyond_capacity {N : ℕ} (h : 2 < N) :
    finrank ContinuumQ.Cut (fermiSector N) = 0 := by
  rw [sector_capacity]; exact Nat.choose_eq_zero_of_lt h

/-- No antisymmetric state exists beyond capacity: the sector is a `Subsingleton` for every `N > 2`. -/
theorem shell_subsingleton_beyond_capacity {N : ℕ} (h : 2 < N) :
    Subsingleton (fermiSector N) := by
  rw [← Module.finrank_zero_iff (R := ContinuumQ.Cut)]
  exact shell_closes_beyond_capacity h

/-! ## §4 — ONE CAUSE, MANY CARRIERS: the same closure on the banked 7-carrier `ImO`. -/

/-- The same antisymmetric-capacity structure on the OTHER banked carrier `ImO` (the fundamental 7,
    N22): `finrank ⋀^N ImO = C(7, N)`. Shell closure is not special to the 2D fibre. -/
theorem imO_capacity (N : ℕ) :
    finrank ℚ (⋀[ℚ]^N Phys.Algebra.ImO) = Nat.choose 7 N := by
  rw [exteriorPower.finrank_eq, Phys.Algebra.finrank_ImO]

/-- The `ImO` shell closes beyond `7`: `finrank ⋀^N ImO = 0` for every `N > 7`. The generic
    collision of self-blindness (antisymmetry) with the finite carrier the cascade fixes. -/
theorem imO_closes_beyond_seven {N : ℕ} (h : 7 < N) :
    finrank ℚ (⋀[ℚ]^N Phys.Algebra.ImO) = 0 := by
  rw [imO_capacity]; exact Nat.choose_eq_zero_of_lt h

/-! ## §5 — CAPSTONE. -/

/-- ★★★ ATOMIC SHELL STRUCTURE, DERIVED. On the banked forced 2D fibre `StateFibre` (N391) over the
    derived field `Cut`, the `N`-quantum antisymmetric sector `⋀^N StateFibre` has capacity `C(2,N)`
    (occupancy DERIVED, not posited); a repeated one-quantum state annihilates the wedge (many-body
    Pauli, the N373 exclusion generalized); the shell FILLS (nonzero, `Nontrivial` at `N = 2`) and
    then CLOSES (capacity `0`, `Subsingleton` for every `N > 2`) because the antisymmetric power runs
    out of room in the finite carrier of the terminated cascade. Nothing is posited: shell structure
    is the collision of the fold's orderless self-blindness (antisymmetry) with the cascade's finite
    carrier (`C(d, d+1) = 0`). The periodic closure the field reads as empirical is forced. -/
theorem atomic_shell_structure :
    (∀ N : ℕ, finrank ContinuumQ.Cut (fermiSector N) = Nat.choose 2 N) ∧
    (∀ {N : ℕ} (a : Fin N → Phys.Quantum.StateFibre) (i j : Fin N),
        i ≠ j → a i = a j → exteriorPower.ιMulti ContinuumQ.Cut N a = 0) ∧
    Nontrivial (fermiSector 2) ∧
    finrank ContinuumQ.Cut (fermiSector 2) = 1 ∧
    (∀ {N : ℕ}, 2 < N → finrank ContinuumQ.Cut (fermiSector N) = 0) ∧
    (∀ {N : ℕ}, 2 < N → Subsingleton (fermiSector N)) :=
  ⟨sector_capacity, fun a i j => manyBodyPauli a i j, orbital_nonvacuous, orbital_filled,
   fun h => shell_closes_beyond_capacity h, fun h => shell_subsingleton_beyond_capacity h⟩

end

end Phys.Algebra.AtomicShell
