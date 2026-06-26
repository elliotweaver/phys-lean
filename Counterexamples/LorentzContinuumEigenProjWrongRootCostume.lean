import Phys.Algebra.LorentzContinuumEigenProj

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C94): A BOGUS ROTATED-BASIS SPECTRAL OPERATOR SQUARE ROOT — claiming the spectral
-- operator `specOp 2 4 u35a u35b` (diagonal in the rotated EvC-orthonormal eigenbasis {u35a,u35b},
-- OFF the standard coordinate axes) is an operator square root of `specOp 4 15 u35a u35b`, i.e. that
-- `(specOp 2 4 u35a u35b)∘(specOp 2 4 u35a u35b) = specOp 4 15 u35a u35b`. The banked rotated-basis
-- spectral operator square root is genuine: for the EvC-ORTHONORMAL pair {u35a,u35b}
-- (`u35a_norm`/`u35b_norm`/`u35_orth`), `(specOp 2 4 u35a u35b)∘(specOp 2 4 u35a u35b) =
-- specOp (2·2)(4·4) u35a u35b = specOp 4 16 u35a u35b` (N63 `specOp_comp`), and the u₂-eigenblock
-- reader (N63 `specOp_read₂`) reads the second eigenvalue off `u35b`: `EvC (specOp 4 16 u35a u35b u35b) u35b
-- = 16` while `EvC (specOp 4 15 u35a u35b u35b) u35b = 15`. The positive operator square root of
-- `specOp 4 15 u35a u35b` is `specOp (cutSqrt 4)(cutSqrt 15) u35a u35b = specOp 2 (cutSqrt 15) u35a u35b`,
-- NOT `specOp 2 4 u35a u35b` (N63 `not_specOp_2_4_op_sqrt_4_15` proves exactly this). A sloppy change-of-
-- basis spectral diagonalization that guessed the wrong second eigenvalue root (`4` instead of
-- `cutSqrt 15`) would commit exactly this.
--   CORRECT:  (specOp 2 4 u35a u35b)∘(specOp 2 4 u35a u35b) = specOp 4 16 u35a u35b,  and specOp 2 4
--             u35a u35b is NOT an operator square root of specOp 4 15 u35a u35b (not_specOp_2_4_op_sqrt_4_15),
--             the root being specOp (cutSqrt 4)(cutSqrt 15) u35a u35b (specOp_op_sqrt).
-- Reading the WRONG squaring identity at the u₂ eigenblock — `EvC (·  u35b) u35b` of both sides
-- (the rotated-basis eigenblock reader, N63 `specOp_read₂` with `u35b_norm`/`u35_orth`):
--   EvC (((specOp 2 4 u35a u35b)∘(specOp 2 4 u35a u35b)) u35b) u35b
--     = EvC ((specOp 4 16 u35a u35b) u35b) u35b = 16.
--   EvC ((specOp 4 15 u35a u35b) u35b) u35b = 15.
-- The WRONG square-root claim asserts these are equal, i.e. `2·4·... → 4·4 = 16 = 15`. So the BOGUS
-- rotated-basis spectral operator square root reduces, through the actual N63 `specOp_comp`/`specOp_read₂`
-- definitions, to the false numeric `16 = 15` and MUST FAIL to compile. The bite is `16 = 15` (distinct
-- from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0, C90 1=-1, C91 25=7, C92 9=10, C93 9=11).
theorem specOp_2_4_op_sqrt_4_15_BOGUS :
    EvC (((specOp (2:Cut) (4:Cut) u35a u35b).comp (specOp (2:Cut) (4:Cut) u35a u35b)) u35b) u35b
  = EvC ((specOp (4:Cut) (15:Cut) u35a u35b) u35b) u35b := by
  rw [specOp_comp u35a_norm u35b_norm u35_orth,
    specOp_read₂ u35b_norm u35_orth, specOp_read₂ u35b_norm u35_orth]
  ring_nf

end

end Counterexamples
