/-
  Counterexamples.DerivationDblIntoHWrongValueCostume — N188 anti-vacuity costume (C220).
  ===========================================================================
  W8 ANTI-VACUITY. The N188 node banks the LOWER RUNG of the inclusion tower `u(1) ↪ su(2)`:
  the Cayley–Dickson doubling intertwiner between the U(1) hypercharge phase rotation `L_J`
  on `Dbl ℚ` (N186) and the weak-isospin inner derivation `adQ hI` on `H ℚ = CD (Dbl ℚ)`
  (N184/N185). Along the doubling's new-dimension embedding `κ : Dbl ℚ → H ℚ`, `b ↦ ⟨0,b⟩`,
  the SU(2) generator is exactly TWICE the U(1) phase rotation: `adQ hI ∘ κ = κ ∘ (2 • L_J)`
  (`isospin_intertwines_hypercharge`). The intertwiner is genuinely NONZERO
  (`isospin_intertwines_hypercharge_ne_zero`) — a REAL relation between two distinct banked
  algebras, not the zero map / a vacuous juxtaposition.

  THE WITNESSING COORDINATE. Applying the SU(2) generator to `κ 1` (the unit of the new
  plane) and reading the `im.im`-coordinate gives the genuine value `2` (`intertwiner_coord`,
  the `2` of `2 • L_J` the doubling forces). This is the teeth of the intertwiner: the U(1)
  generator reappears, scaled by the doubling factor `2`, as the new-plane restriction of the
  SU(2) generator.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading of the intertwiner — the relation is the
  zero map / the SU(2) generator does NOT carry the U(1) generator / a wrong/trivial
  coefficient): that this witnessing coordinate equals `(188 : ℚ)`. The banked value is
  exactly `2` (`intertwiner_coord`), so the claim reduces to the false numeric `(2 : ℚ) = 188`
  over the characteristic-0 derived ℚ. The kernel cannot close it; the costume BITES (lean
  leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "hypercharge / U(1) / isospin / SU(2) / su(2) / u(1) /
  gauge" and the inner derivation `ad_{⟨J,0⟩}` of the Cayley–Dickson double `CD (Dbl ℚ)`
  GENUINELY sends the second-coordinate embedding `1 ↦ ⟨0,1⟩` to `⟨0, 2·(1·J)⟩`, whose
  `im.im`-coordinate is `2`, so claiming `188` is genuinely FALSE (`2 ≠ 188` in ℚ).

  DISTINCT from the banked battery (… C217 `3 = 185`, C218 `1 = 186`, C219 `4 = 187`):
  value `2 = 188` (the pair (2,188) differs from C216's (2,184) by the RHS).
-/
import Phys.Algebra.DerivationDblIntoH

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the witnessing coordinate of the lower-rung intertwiner. The SU(2) generator
    `adQ hI` applied to the new-plane unit `κ 1` reads, at `im.im`, the genuine relational
    coefficient `2` (the `2` of `2 • L_J` the Cayley–Dickson doubling forces). -/
theorem derivationDblIntoH_coord_true :
    (adQ hI (kappa (1 : Dbl ℚ))).im.im = 2 := intertwiner_coord

/-- BOGUS: claims the witnessing coordinate of the lower-rung intertwiner is `(188 : ℚ)`. It
    GENUINELY equals `2` (`derivationDblIntoH_coord_true`). The WRONG claim (zero map / the
    SU(2) generator does not carry the U(1) generator / a trivial coefficient) reduces to the
    false numeric `(2 : ℚ) = 188`, so this must NOT compile. -/
theorem derivationDblIntoH_wrong_intertwiner_BOGUS :
    (adQ hI (kappa (1 : Dbl ℚ))).im.im = (188 : ℚ) := by
  rw [derivationDblIntoH_coord_true]

end Counterexamples
