/-
  Counterexamples.DerivationHIntoOWrongValueCostume — N187 anti-vacuity costume (C219).
  ===========================================================================
  W8 ANTI-VACUITY. The N187 node banks the FIRST PROVED CONNECTION between two banked
  gauge-algebra factors: the weak-isospin derivation algebra `Der(H ℚ) = su(2)` EMBEDS into
  the colour-hosting `Der(O ℚ) = g₂` via the Cayley–Dickson doubling, with the su(2)
  structure constants TRANSFERRED: `⁅innerDeriv hI, innerDeriv hJ⁆ = 2·innerDeriv hK`
  (`struct_ij`). The embedded bracket is genuinely NONZERO, non-abelian — a real su(2)
  inside g₂, not a vacuous zero map.

  THE WITNESSING COORDINATE. Applying the transferred bracket to `ι hI` and reading the
  `re.im.re`-coordinate gives the genuine value `4` (from `ad_{2·hK}(hI) = 4·j`,
  `coord_true`). This is the teeth of the structure-constant transfer: a NONZERO, NON-ABELIAN
  bracket realized inside g₂.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading of the embedded structure constant — the
  bracket is the zero map / the lift is not a Lie hom / a wrong coefficient): that this
  witnessing coordinate equals `(187 : ℚ)`. The banked value is exactly `4` (`coord_true`),
  so the claim reduces to the false numeric `(4 : ℚ) = 187` over the characteristic-0 derived
  ℚ. The kernel cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "isospin / colour / su(2) / g₂ / gauge / SU(2)" and the
  componentwise doubling lift GENUINELY carries the inner-derivation commutator of the
  associative ring `CD (Dbl ℚ)` into the derivation Lie algebra of `CD (CD (Dbl ℚ))` with
  `⁅innerDeriv i, innerDeriv j⁆ = 2·innerDeriv k` acting on `ι i` to give the `re.im.re`-value
  `4`, so claiming `187` is genuinely FALSE (`4 ≠ 187` in ℚ).

  DISTINCT from the banked battery (… C216 `2 = 184`, C217 `3 = 185`, C218 `1 = 186`):
  value `4 = 187`.
-/
import Phys.Algebra.DerivationHIntoO

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the witnessing coordinate of the embedded su(2) → g₂ structure constant. The
    transferred bracket `⁅innerDeriv hI, innerDeriv hJ⁆ = innerDeriv (2·hK)`, applied to `ι hI`
    and read at `re.im.re`, equals `4` (from `ad_{2·hK}(hI) = 4·j`). -/
theorem derivationHIntoO_coord_true :
    ((⁅innerDeriv (hI : H ℚ), innerDeriv hJ⁆) (CD.iota hI)).re.im.re = 4 := by
  rw [innerDeriv_bracket,
    show (hI : H ℚ) * hJ - hJ * hI = (2 : ℤ) • hK by
      rw [hI_hJ, hJ_hI, sub_neg_eq_add, two_zsmul]]
  show (adHom ((2 : ℤ) • hK : H ℚ) hI).im.re = 4
  rw [adHom_two_hK_hI]
  rw [show (4 : ℤ) • hJ = hJ + hJ + hJ + hJ by
    rw [show (4 : ℤ) = 1 + 1 + 1 + 1 by norm_num, add_smul, add_smul, add_smul, one_smul]]
  simp only [CD.add_im, Dbl.add_re, hJ, CD.e2]; norm_num

/-- BOGUS: claims the witnessing coordinate of the transferred su(2) → g₂ structure constant is
    `(187 : ℚ)`. It GENUINELY equals `4` (`derivationHIntoO_coord_true`). The WRONG claim (zero
    map / not a Lie hom / wrong coefficient) reduces to the false numeric `(4 : ℚ) = 187`, so
    this must NOT compile. -/
theorem derivationHIntoO_wrong_struct_BOGUS :
    ((⁅innerDeriv (hI : H ℚ), innerDeriv hJ⁆) (CD.iota hI)).re.im.re = (187 : ℚ) := by
  rw [derivationHIntoO_coord_true]

end Counterexamples
