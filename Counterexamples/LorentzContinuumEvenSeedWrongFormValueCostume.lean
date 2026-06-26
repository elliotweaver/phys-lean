import Phys.Algebra.LorentzContinuumEvenSeed

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C109): A BOGUS REFERENCE-FORM VALUE OF THE EVEN-RUNG OBSTRUCTION REMOVER. N78 banks
-- THE EVEN-RUNG OBSTRUCTION REMOVER over the derived ℝ `Cut`: for an EvC-self-adjoint `g` and a
-- negative-discriminant pair `b² < 4c`, the operator-quadratic `g·g + b•g + c•1` is INJECTIVE hence
-- INVERTIBLE — because its diagonal reference-form value is STRICTLY POSITIVE
-- (`selfadj_negDisc_quad_pos`), via the quadratic-form identity
-- `EvC ((g·g + b•g + c•1) v) v = EvC (g v) (g v) + b·EvC (g v) v + c·EvC v v`
-- (`selfadj_negDisc_quad_apply_form`). Take the concrete EvC-self-adjoint `g = 1` (the identity is
-- self-adjoint), the negative-discriminant pair `b = 3`, `c = 5` (`b² = 9 < 20 = 4c`), and the
-- concrete unit vector `v0 = (1,0,0)` (`EvC v0 v0 = 1`). The genuine quadratic-form identity gives
-- `EvC ((1·1 + 3•1 + 5•1) v0) v0 = EvC v0 v0 + 3·EvC v0 v0 + 5·EvC v0 v0 = 1 + 3 + 5 = 9` — the TRUE
-- reference-form value the strict positivity is read from. A BOGUS claim that this value is `13`
-- reduces, through the genuine `EvC`/`Module.End` arithmetic over the derived ℝ `Cut`, on the left to
-- the genuine `9`, hence to the false numeric `9 = 13`, and MUST FAIL to compile.
--   CORRECT: the reference-form value of `(1 + 3•1 + 5•1)` on `v0` is `9` (`= 1 + 3 + 5`), strictly
--            positive — so the even-rung obstruction remover is genuinely injective/invertible, not a
--            wrong value; the positive-definite invertibility of every irreducible quadratic factor is
--            honest, so the even-rung obstruction is genuinely removed.
-- The bite is `9 = 13` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9,
-- C99 36=64, C100 36=25, C101 0=3, C102 9=7, C103 100=40, C104 25=11, C105 25=13, C106 8=27,
-- C107 6=13, C108 7=12).
def v0 : STVC := ((1:Cut), (0:Cut), (0:O Cut))

theorem evenSeed_wrong_form_value_BOGUS :
    EvC (((1:Module.End Cut STVC)*1 + (3:Cut)•(1:Module.End Cut STVC)
          + (5:Cut)•(1:Module.End Cut STVC)) v0) v0 = (13:Cut) := by
  rw [show EvC (((1:Module.End Cut STVC)*1 + (3:Cut)•(1:Module.End Cut STVC)
          + (5:Cut)•(1:Module.End Cut STVC)) v0) v0 = (9:Cut) from by
        rw [selfadj_negDisc_quad_apply_form (g := (1:Module.End Cut STVC))
              (by intro p q; simp [Module.End.one_apply]) 3 5 v0]
        simp only [Module.End.one_apply]
        rw [show EvC v0 v0 = (1:Cut) from by
              show (1:Cut)*1 + (0:Cut)*0 + gFormC (0:O Cut) 0 = 1
              rw [gFormC_zero_left]; ring]
        norm_num]

end

end Counterexamples
