/-
  Counterexamples.DerivationStabilizerWrongMemberCostume — N42a costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N42a STABILIZER LIE SUBALGEBRA `stabLieQ` of the fixed imaginary
  unit `u1` inside `Der(𝕆)`. N42a banks `stabLieQ = {D ∈ Der(𝕆) : D u1 = 0}` as a proper
  nontrivial Lie subalgebra (`stabLieQ_ne_bot`, `stabLieQ_ne_top`), the structural skeleton of
  `su(3) ⊂ g₂`. The membership condition `D u1 = 0` is LOAD-BEARING: a derivation is in the
  stabilizer iff it annihilates the fixed complex unit. The properness (`stabLieQ ≠ ⊤`) is
  WITNESSED by `D3E ∉ stab`, because `D3E u1 = e₆ ≠ 0` (`D3E_not_mem_stab`).

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that `D3E` — the banked explicit
  derivation that sends `u1 ↦ e₆` — DOES lie in the stabilizer (`⟨D3E, _⟩ ∈ stabLieQ`, i.e.
  `D3E u1 = 0`). This is FALSE: `D3E u1` has `c₆`-coordinate `1 ≠ 0`, so `D3E u1 ≠ 0`. If the
  stabilizer were (wrongly) the WHOLE algebra (`stabLieQ = ⊤`, dimension 14 not 8) this bogus
  membership would go through; the costume is exactly the guard against a stabilizer that fails
  to be a PROPER subalgebra (the `8 < 14` that makes `su(3) ⊊ g₂`).

  This costume DIRECTLY exercises the NEW N42a content: it uses `stabLieQ` (the banked
  subalgebra) and is contradicted by the banked `D3E_not_mem_stab`. Deleting
  `Phys/Algebra/DerivationStabilizer.lean` removes the `stabLieQ` the costume references, so the
  costume would fail with a DIFFERENT (unknown-identifier) error and the PASS_SIGNATURE below
  would not match. If `D3E` were (wrongly) a member, this false statement would go through — the
  costume is exactly the guard against that.
-/
import Phys.Algebra.DerivationStabilizer

namespace Counterexamples

open Phys.Cascade Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming `D3E` lies in the stabilizer `stabLieQ` (i.e. `D3E u1 = 0`), when in fact
    `D3E u1 = e₆ ≠ 0`. This would force the stabilizer to omit no `D3E`-type derivation, making
    it the whole 14-dim algebra rather than the proper 8-dim `su(3)`. The banked
    `D3E_not_mem_stab` directly refutes it, so closing it via `D3E_not_mem_stab` leaves the
    contradiction. Must FAIL to compile. -/
theorem D3E_mem_stab_BOGUS : (⟨D3E, D3E_isDerivQ⟩ : derivationLieQ) ∈ stabLieQ := by
  have h := D3E_not_mem_stab
  exact h

end Counterexamples
