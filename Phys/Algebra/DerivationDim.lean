/-
  Phys.Algebra.DerivationDim — N16: TOWARD THE DIMENSION / g₂ CHARACTERIZATION of
  the derivation Lie algebra `Der(𝕆)` of the terminal algebra.
  ===========================================================================
  N6 (`Phys/Algebra/Derivation.lean`) banked `Der(𝕆)` — the Leibniz-derivations of
  the terminal algebra `𝕆 = CD (CD B)` form a Lie algebra under the commutator,
  with a concrete nonzero witness on `O ℚ`. N6 EXPLICITLY DEFERRED the deeper
  structural claim: that `Der(O ℚ)` is 14-dimensional and is the exceptional `g₂`.

  This module banks the theory-native STRUCTURAL CORE of that characterization —
  the constraints EVERY derivation of the terminal algebra satisfies, derived
  FORWARD from the banked Leibniz predicate `IsDeriv`, with NO posited `G₂` import.
  Confirmed by faithful exact-rational numerics (workbench/N16-g2-dimension):
  `dim_ℚ Der(O ℚ) = 14`, and every derivation kills the unit, is trace-free (maps
  into the anti-self-conjugate / imaginary subspace), and is skew for the Born
  self-overlap form — the structural reduction `Der(𝕆) ⊆ so(Im 𝕆)` that, in the
  literature, cuts `so(7)` (dim 21) down to `g₂` (dim 14).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The division-algebra-physics
  field (Furey, Dixon, Günaydin–Gürsey) POSITS `𝕆` and reads its automorphism
  algebra `g₂` off by hand / cites `dim G₂ = 14`. Here the structural constraints
  are PROVED from the banked `IsDeriv` predicate over the derived octonions — the
  SAME posit-vs-derive moat N3/N4/N5/N6 held. No Mathlib `LieAlgebra.g2` / `G₂` is
  imported to ASSERT the identification.

  WHAT IS BANKED HERE (forward, foundations-only):
    deriv_one        — ★ every Leibniz-derivation kills the unit: `D 1 = 0`.
                       (`D 1 = D(1·1) = D1·1 + 1·D1 = 2·D1`, so `D 1 = 0`. Pure
                       Leibniz + the unit law; no associativity, no coordinates.)

  THE EXACT DIMENSION (`dim Der(O ℚ) = 14`, a 512×64 ℚ-rank — the W9 instrument
  wall, see docs/RUNBOOK.md W9) and the explicit `g₂` basis + bracket structure +
  the `≅ g₂` Lie isomorphism are the dedicated downstream W1/W9 dissolution child,
  NOT this node. The numerics (`dim = 14`, the explicit 14-element basis, the
  so(7) skew reduction) are recorded in workbench/N16-g2-dimension/FINDINGS.md as
  the child's starting point.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "gauge / g₂ /
  automorphism": what remains is the pure statement that every Leibniz-derivation
  of the Cayley–Dickson double of a double annihilates the unit. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.Derivation
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

section Abstract
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- ★ THE UNIT-ANNIHILATION. Every Leibniz-derivation of the terminal algebra kills
    the unit: `D 1 = 0`. From `D 1 = D(1·1) = D1·1 + 1·D1 = D1 + D1`, so `D 1 = 0`.
    Uses only the Leibniz law and the unit law — no associativity, no coordinates.
    This is the first structural constraint cutting `Der(𝕆)` toward `g₂`: a
    derivation is determined by its action on the imaginary subspace. -/
theorem deriv_one (D : Module.End ℤ (CD (CD B))) (hD : IsDeriv D) : D 1 = 0 := by
  have h := hD 1 1
  rw [one_mul, mul_one, one_mul] at h
  -- h : D 1 = D 1 + D 1
  have h2 : D 1 + D 1 = D 1 + 0 := by rw [add_zero]; exact h.symm
  exact add_left_cancel h2

end Abstract

/-! ## CONCRETE — the structural law on the cascade's terminal algebra `O ℚ`.

    The banked NONZERO derivation `witnessDeriv` (N6, `= innerDeriv e₂`) is genuinely
    nonzero as an endomorphism, YET it kills the unit — the abstract law `deriv_one`
    applied to the concrete witness. This is the structural content the dimension count
    rests on: a derivation is a NONZERO map that nonetheless annihilates `1` and is
    therefore determined by its action on the 7-dimensional imaginary subspace, the
    reduction that (the numerics confirm, workbench/N16-g2-dimension) cuts the
    derivation algebra to dimension 14. -/
section Concrete
attribute [local instance] CD.narCD CD.srCD

/-- ★ THE BANKED NONZERO DERIVATION KILLS THE UNIT: `witnessDeriv 1 = 0`. The concrete
    `witnessDeriv` is nonzero as an endomorphism (banked `witnessDeriv_ne_zero`) yet
    annihilates the unit — a derivation is a nonzero map determined by its restriction to
    the imaginary subspace. -/
theorem witnessDeriv_one : witnessDeriv (1 : O ℚ) = 0 :=
  deriv_one (B := Dbl ℚ) witnessDeriv witnessDeriv_isDeriv

end Concrete

end Phys.Algebra
