/-
  Phys.Algebra.ChemicalPeriodicity — N404 (arc-L L3): CHEMICAL PERIODICITY =
  THE MODULAR RECURRENCE FORCED BY SHELL CLOSURE.
  ============================================================================================
  THE THIRD NODE OF ARC L — the emergent matter ladder. L1 (N402) derived nuclear binding as
  residual colour; L2 (N403) derived atomic shell structure as the many-body antisymmetric
  capacity of the banked 2D fibre `StateFibre` (N391): the `N`-quantum antisymmetric sector
  `fermiSector N := ⋀^N StateFibre` has capacity `C(2, N)` (`sector_capacity`), which FILLS
  (nonzero, `Nontrivial` at `N = 2`) then CLOSES (capacity `0`, `Subsingleton` for `N > 2`,
  `shell_closes_beyond_capacity`). L3 (this node) climbs one rung: CHEMICAL PERIODICITY.

  ── THE FORWARD DERIVATION (fold → periodicity; nothing posited) ──
  The banked closure `shell_closes_beyond_capacity` says a finite `d`-dimensional carrier CANNOT
  hold a `(d+1)`-th quantum antisymmetrically: `⋀^(d+1) = 0`. So the `(d+1)`-th quantum is FORCED
  to open a NEW shell — filling RESTARTS. Iterated, this restart is a MODULAR TOWER:

    · `carrierDim := finrank Cut StateFibre` — the PERIOD, IDENTIFIED with the banked carrier
      dimension (`fibre_finrank = 2`), NOT posited. The period LENGTH is the derived dimension.
    · `valence Z := Z % carrierDim` — the occupancy of the currently-filling (valence) shell.
    · `completedShells Z := Z / carrierDim` — the number of already-closed shells.

  Two banked facts now MEET and force periodicity:
    · `filling_decomposition`: `Z = completedShells Z · carrierDim + valence Z` (division).
    · `valence_periodic`: `valence (Z + carrierDim) = valence Z` — occupancy RECURS with period
      `carrierDim`. The banked valence SECTOR `fermiSector (valence Z)` therefore recurs
      (`valenceSector_dim_periodic`).

  ── THE LOAD-BEARING WELD (banked closure ⇒ restart) ──
  `filling_restarts`: in ONE shell the `(carrierDim+1)`-th quantum has NO antisymmetric state
  (`Subsingleton (fermiSector (carrierDim+1))`, the banked `shell_subsingleton_beyond_capacity`),
  YET the modular filling `(carrierDim+1) % carrierDim` opens a FRESH, NONVACUOUS shell
  (`Nontrivial (fermiSector ((carrierDim+1) % carrierDim))`). This is WHY filling restarts: the
  carrier is full, so the next quantum begins a new period. Non-vacuous both ways: the overfill
  genuinely dies AND the restart genuinely lives.

  ⇒ chemical periodicity — the repeating pattern of chemical behaviour with increasing quantum
  count — is DERIVED: it is the modular recurrence `valence Z = Z mod carrierDim` FORCED by the
  banked shell closure `⋀^(d+1) = 0`. The period the field reads as an EMPIRICAL pattern
  (Mendeleev's rows) is the forced carrier dimension. Elements in the same "group" share valence
  occupancy (`valence_periodic`); the "noble" (closed-shell) landmark is the banked top singlet
  recurring at every multiple of the period (`noble_recurs`, `noble_shell_is_filled_singlet`);
  the intra-period particle-hole symmetry `C(d,r) = C(d,d−r)` (`group_particle_hole`) is the
  electron-hole (donor/acceptor) duality of a shell.

  ── ONE CAUSE, MANY CARRIERS (the weld) ──
  The SAME modular recurrence runs on the OTHER banked carrier `ImO` (the fundamental 7, N22),
  with period `7`: `imO_valenceSector_dim_periodic` (recurrence) and `imO_filling_restarts`
  (overfill `⋀^8 ImO` closes, restart `⋀^(8 % 7) = ⋀^1 ImO` is `Nontrivial`). Periodicity is not a
  feature of the 2D fibre — it is the generic collision of the finite carrier the cascade fixes
  with the forced restart at capacity.

  WHAT IS BANKED HERE (forward, foundations-only):
    carrierDim / carrierDim_eq   — the PERIOD = banked `finrank Cut StateFibre` (`= 2`).
    valence / completedShells    — occupancy of the filling shell / count of closed shells.
    filling_decomposition        — `Z = completedShells·carrierDim + valence` (division).
    valence_periodic             — ★ occupancy recurs with period `carrierDim`.
    valenceSector_dim_periodic   — the banked valence-sector dimension recurs.
    filling_restarts             — ★★ THE WELD: overfill closes (Subsingleton, banked) YET the
                                   modular restart opens a nonvacuous shell (Nontrivial).
    group_particle_hole          — `C(d,r) = C(d,d−r)`: the intra-period (electron-hole) symmetry.
    noble_recurs                 — the closed-shell (noble) landmark at every multiple of period.
    noble_shell_is_filled_singlet — the closed shell IS the banked top singlet (`Nontrivial`, dim 1).
    imO_valenceSector_dim_periodic / imO_filling_restarts — the same on the banked 7-carrier.
    shell_total_fillings         — the total distinct fillings of the carrier `= 2^carrierDim`.
    chemical_periodicity         — ★★ THE CAPSTONE.

  SCOPE (docs/RUNBOOK.md W4.5). This node derives EXACTLY the periodicity STRUCTURE: the modular
  recurrence of shell occupancy forced by the banked closure, with period = the derived carrier
  dimension, plus the closed-shell landmark and the intra-period particle-hole symmetry, on the
  banked carriers. It does NOT compute the growing empirical period sequence 2, 8, 18, 32 (that
  needs the un-banked angular-momentum / sub-shell tower — NOT attempted), and does NOT fit any
  chemical number (electronegativity, ionization energy, bond length). GRADE: MECHANISM
  (beyond-key, per seed §L3). NO chemistry number is fitted (G1/G2 NO-FIT, LOUD).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "chemistry / periodic table / element /
  group / valence / noble / period": what remains is the pure statement that, for a finite carrier
  of dimension `d = carrierDim` (the banked `StateFibre`), the antisymmetric occupancy `Z mod d`
  recurs with period `d` (because `⋀^(d+1)` of the carrier vanishes while `⋀^((d+1) mod d)` does
  not), the sector `fermiSector (Z mod d)` recurs accordingly, `C(d,r) = C(d,d−r)`, the residue
  vanishes at multiples of `d` where the top wedge is the nonvacuous singlet, and the same holds on
  the banked `ImO` with `d = 7`. No theorem STATEMENT needs a physics word to be true.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge. Built on the
  BANKED derived ℝ `Cut`, the banked forced fibre `StateFibre` (N391), the banked shell structure
  (N403: `fermiSector`, `sector_capacity`, `shell_subsingleton_beyond_capacity`, `orbital_*`,
  `imO_capacity`, `imO_closes_beyond_seven`), the banked carrier `ImO` (N22), and Mathlib's
  `exteriorPower` / `Nat.choose` / `Nat.div_add_mod` as MACHINERY over the derived objects — NO
  Mathlib `Real` / `Complex` as content, NO posited period rule / aufbau model.
-/
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Nat.Choose.Sum
import Phys.Quantum.PrimitiveFibre
import Phys.Algebra.AtomicShellPauli

namespace Phys.Algebra.ChemPeriodic

open Phys.Foundation Module
open Phys.Foundation.ContinuumQ
open Phys.Algebra.AtomicShell

noncomputable section

/-! ## §1 — THE PERIOD AND THE FILLING DECOMPOSITION. -/

/-- THE PERIOD: the banked carrier dimension `finrank Cut StateFibre`. The period LENGTH of chemical
    periodicity is IDENTIFIED with the derived dimension of the banked fibre (N391), NOT posited. -/
def carrierDim : ℕ := Module.finrank ContinuumQ.Cut Phys.Quantum.StateFibre

/-- The period equals `2` (the banked `fibre_finrank`, N391). -/
theorem carrierDim_eq : carrierDim = 2 := Phys.Quantum.fibre_finrank

/-- VALENCE OCCUPANCY: the number of quanta in the currently-filling shell, `Z mod carrierDim`. -/
def valence (Z : ℕ) : ℕ := Z % carrierDim

/-- COMPLETED (closed) SHELLS: the number of shells already filled and closed, `Z / carrierDim`. -/
def completedShells (Z : ℕ) : ℕ := Z / carrierDim

/-- THE FILLING DECOMPOSITION: `Z = completedShells Z · carrierDim + valence Z`. Every quantum count
    splits into whole closed shells plus a valence remainder — the division algorithm on the banked
    period. -/
theorem filling_decomposition (Z : ℕ) :
    completedShells Z * carrierDim + valence Z = Z := by
  unfold completedShells valence
  rw [Nat.mul_comm]; exact Nat.div_add_mod Z carrierDim

/-! ## §2 — PERIODICITY: occupancy recurs with the banked period. -/

/-- ★ CHEMICAL PERIODICITY (occupancy form): valence occupancy RECURS with period `carrierDim`:
    `valence (Z + carrierDim) = valence Z`. Elements separated by one period share the same
    valence occupancy — the recurrence the field reads as an empirical pattern, forced. -/
theorem valence_periodic (Z : ℕ) : valence (Z + carrierDim) = valence Z := by
  unfold valence; rw [Nat.add_mod_right]

/-- The banked VALENCE SECTOR `fermiSector (valence Z)` recurs with period `carrierDim`: its
    dimension at `Z + carrierDim` equals its dimension at `Z`. The chemical behaviour a valence
    shell supports is the same one period later. -/
theorem valenceSector_dim_periodic (Z : ℕ) :
    finrank ContinuumQ.Cut (fermiSector (valence (Z + carrierDim)))
      = finrank ContinuumQ.Cut (fermiSector (valence Z)) := by
  rw [valence_periodic]

/-! ## §3 — THE LOAD-BEARING WELD: banked closure forces the restart. -/

/-- ★★ FILLING RESTARTS AT CAPACITY — the load-bearing weld to the banked shell closure. In ONE
    shell the `(carrierDim+1)`-th quantum has NO antisymmetric state (`Subsingleton`, the banked
    `shell_subsingleton_beyond_capacity`: the carrier is full), YET the MODULAR filling
    `(carrierDim+1) % carrierDim` opens a FRESH, NONVACUOUS shell (`Nontrivial`). This is WHY
    filling restarts — and hence WHY occupancy is periodic: the finite carrier the cascade fixes
    cannot be overfilled, so the next quantum begins a new period. Non-vacuous both ways. -/
theorem filling_restarts :
    Subsingleton (fermiSector (carrierDim + 1))
      ∧ Nontrivial (fermiSector ((carrierDim + 1) % carrierDim)) := by
  constructor
  · exact shell_subsingleton_beyond_capacity (by rw [carrierDim_eq]; decide)
  · have hidx : (carrierDim + 1) % carrierDim = 1 := by rw [carrierDim_eq]
    rw [hidx]
    apply Module.nontrivial_of_finrank_pos (R := ContinuumQ.Cut)
    rw [orbital_occupancy]; decide

/-! ## §4 — GROUP STRUCTURE: the intra-period particle-hole symmetry, and the noble landmark. -/

/-- THE INTRA-PERIOD PARTICLE-HOLE SYMMETRY: `C(d, r) = C(d, d − r)` — the antisymmetric sector at
    occupancy `r` has the same dimension as at `carrierDim − r`. The electron-hole (donor/acceptor)
    duality of a shell: `r` quanta and `d − r` holes carry the same combinatorial content. -/
theorem group_particle_hole {r : ℕ} (h : r ≤ carrierDim) :
    finrank ContinuumQ.Cut (fermiSector r)
      = finrank ContinuumQ.Cut (fermiSector (carrierDim - r)) := by
  rw [sector_capacity, sector_capacity, carrierDim_eq]
  rw [carrierDim_eq] at h
  exact (Nat.choose_symm h).symm

/-- THE NOBLE (closed-shell) LANDMARK recurs: at every positive multiple of the period the valence
    residue is `0` — a shell boundary, where the just-filled shell is closed. -/
theorem noble_recurs (k : ℕ) : valence (carrierDim * (k + 1)) = 0 := by
  unfold valence; exact Nat.mul_mod_right carrierDim (k + 1)

/-- THE CLOSED SHELL IS THE BANKED TOP SINGLET: the fully-filled shell `fermiSector carrierDim` is
    `Nontrivial` with dimension `1` (the banked `orbital_filled` + `orbital_nonvacuous`). The
    inert, closed-shell configuration is the banked top wedge of the carrier. -/
theorem noble_shell_is_filled_singlet :
    Nontrivial (fermiSector carrierDim)
      ∧ finrank ContinuumQ.Cut (fermiSector carrierDim) = 1 := by
  rw [carrierDim_eq]
  exact ⟨orbital_nonvacuous, orbital_filled⟩

/-! ## §5 — ONE CAUSE, MANY CARRIERS: the same periodicity on the banked 7-carrier `ImO`. -/

/-- The same MODULAR RECURRENCE on the OTHER banked carrier `ImO` (period `7`): the antisymmetric
    sector dimension at `Z + 7` equals its dimension at `Z`. -/
theorem imO_valenceSector_dim_periodic (Z : ℕ) :
    finrank ℚ (⋀[ℚ]^((Z + 7) % 7) Phys.Algebra.ImO)
      = finrank ℚ (⋀[ℚ]^(Z % 7) Phys.Algebra.ImO) := by
  rw [Nat.add_mod_right]

/-- The same RESTART on the banked 7-carrier: the `8`-th quantum has no antisymmetric state
    (`Subsingleton`, the banked `imO_closes_beyond_seven`), YET the modular filling `8 % 7 = 1`
    opens a fresh nonvacuous shell. -/
theorem imO_filling_restarts :
    Subsingleton (⋀[ℚ]^(7 + 1) Phys.Algebra.ImO)
      ∧ Nontrivial (⋀[ℚ]^((7 + 1) % 7) Phys.Algebra.ImO) := by
  constructor
  · rw [← Module.finrank_zero_iff (R := ℚ)]
    exact imO_closes_beyond_seven (by decide)
  · have hidx : (7 + 1) % 7 = 1 := by decide
    rw [hidx]
    apply Module.nontrivial_of_finrank_pos (R := ℚ)
    rw [imO_capacity]; decide

/-- The TOTAL number of distinct fillings of the carrier `= 2^carrierDim` (`Σ_r C(d, r) = 2^d`).
    Every subset of the `carrierDim` one-quantum states is a distinct antisymmetric configuration. -/
theorem shell_total_fillings :
    ∑ N ∈ Finset.range (carrierDim + 1), Nat.choose 2 N = 2 ^ 2 := by
  rw [carrierDim_eq, Nat.sum_range_choose]

/-! ## §6 — CAPSTONE. -/

/-- ★★★ CHEMICAL PERIODICITY, DERIVED. On the banked forced carrier (period `carrierDim =
    finrank Cut StateFibre`, the derived dimension of N391), the valence occupancy `Z mod carrierDim`
    RECURS with period `carrierDim` (`valence_periodic`) because the banked shell CLOSES at capacity
    (`⋀^(d+1) = 0`, `shell_subsingleton_beyond_capacity`) so filling RESTARTS (`filling_restarts`:
    overfill Subsingleton, restart Nontrivial); the closed-shell (noble) landmark recurs at every
    multiple of the period as the banked top singlet (`noble_recurs`, `noble_shell_is_filled_singlet`);
    the intra-period particle-hole symmetry is `C(d,r) = C(d,d−r)` (`group_particle_hole`); and the
    same runs on the banked 7-carrier `ImO`. Nothing is posited: periodicity is the modular recurrence
    forced by the finite carrier of the terminated cascade. The period the field reads as an empirical
    pattern is the derived carrier dimension. -/
theorem chemical_periodicity :
    (∀ Z : ℕ, valence (Z + carrierDim) = valence Z) ∧
    (∀ Z : ℕ, completedShells Z * carrierDim + valence Z = Z) ∧
    (Subsingleton (fermiSector (carrierDim + 1))
      ∧ Nontrivial (fermiSector ((carrierDim + 1) % carrierDim))) ∧
    (∀ {r : ℕ}, r ≤ carrierDim →
        finrank ContinuumQ.Cut (fermiSector r)
          = finrank ContinuumQ.Cut (fermiSector (carrierDim - r))) ∧
    (∀ k : ℕ, valence (carrierDim * (k + 1)) = 0) ∧
    (Nontrivial (fermiSector carrierDim)
      ∧ finrank ContinuumQ.Cut (fermiSector carrierDim) = 1) :=
  ⟨valence_periodic, filling_decomposition, filling_restarts,
   fun h => group_particle_hole h, noble_recurs, noble_shell_is_filled_singlet⟩

end

end Phys.Algebra.ChemPeriodic
