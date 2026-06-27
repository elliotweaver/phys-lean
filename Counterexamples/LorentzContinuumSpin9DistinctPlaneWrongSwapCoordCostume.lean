import Phys.Algebra.LorentzContinuumSpin9DistinctPlane

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C130): A BOGUS DISTINCT-UNITS GENERATOR SWAP-COORDINATE CLAIM — "THE OFF-DIAGONAL
-- TWO-SIDED GENERATOR biMulFun e₂ ιe₂ CARRIES THE REAL AXIS TO A UNIT WHOSE im.im.re COORDINATE
-- READS 17".
-- N98 banks `biMulFun_e2je2_swap_coord`: the CONCRETE off-diagonal generator biMulFun e₂ ιe₂
-- (distinct anticommuting unit-imaginaries e₂ ≠ ιe₂) CARRIES the real axis (0,0,1) to the PRODUCT
-- unit e₂·ιe₂, whose nonzero coordinate im.im.re is the genuine −1. The structural NOVELTY over the
-- diagonal half-turn (N94, which sends 1 ↦ −1 on the real line, a SCALAR with re.re.re = −1 and all
-- imaginary coordinates zero) and over the imaginary-plane product (N95, which FIXES 1): the
-- off-diagonal generator carries 1 OFF the real line to a purely-imaginary product unit with
-- im.im.re = −1. The BOGUS claim that this coordinate is 17 (a stand-in for ANY wrong "the
-- off-diagonal generator distorts/rescales the swap onto a different unit" — a whole-block rescaling
-- reading any other value) forces −1 = 17, and must NOT compile.
--   The bite is a true counterexample, not vacuous: `biMulFun_e2je2_swap_coord` is a banked theorem,
-- so the coordinate genuinely IS −1, and the costume's claim of 17 is genuinely FALSE.
--   The false numeric `-1 = 17` is DISTINCT from the banked battery (… C126 1=9, C127 1=12,
-- C128 3/2=13, C129 4/3=40).
--   PHYSICS-WORDS-REMOVABLE: delete "half-turn/rotation/plane/isometry/Spin/SO(9)/2-plane/
-- bimultiplication/anticommuting/product/generator/real-axis/product-unit/swap": over the derived
-- complete ordered field `Cut` and `O Cut := CD(H Cut)`, for the units e₂ (e₂·e₂ = −1) and
-- ιe₂ := iota(e₂:H Cut) (ιe₂·ιe₂ = −1), the map (t,x,v) ↦ (t,x, e₂·(v·ιe₂)) sends (0,0,1) to
-- (0,0, e₂·ιe₂), whose im.im.re coordinate is −1; claiming 17 forces −1 = 17. The bite is a false
-- NUMERIC, name-independent.

/-- BOGUS: the off-diagonal two-sided generator `biMulFun e₂ ιe₂` carries the real axis `(0,0,1)` to
    the product unit `e₂·ιe₂`, whose `im.im.re` coordinate is `−1` (`biMulFun_e2je2_swap_coord`); the
    WRONG claim that this coordinate is `17` (the generator rescales the swap onto a different unit)
    forces the false numeric `−1 = 17`, so this must NOT compile. -/
theorem distinct_generator_wrong_swap_coord_BOGUS :
    ((biMulFun (CD.e2 : O Cut) (je2 : O Cut)
        ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).im.im.re = 17 := by
  rw [biMulFun_e2je2_swap_coord]

end

end Counterexamples
