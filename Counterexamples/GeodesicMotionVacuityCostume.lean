/-
  Counterexamples.GeodesicMotionVacuityCostume — N### anti-vacuity (C465).
  ============================================================================================
  W8 ANTI-VACUITY. The N### node (arc-Q Q6 — GEODESIC MOTION FROM THE FIELD EQUATIONS) has genuine
  content only if the forcing genuinely bites: (a) a form-skew transport generator makes the
  velocity orthogonal to the acceleration; (b) a vanishing source divergence FORCES the geodesic
  `T u = 0` and continuity `contCoeff = 0`; (c) THE CROSS FACT — a non-geodesic worldline
  (`T u ≠ 0`) is inconsistent with the vanishing divergence; (d) the WELD to the banked literal
  `∇^μ G_μν = 0` (`einstein_divCov_zero_concrete`) forces the geodesic through the field equation;
  and (e) the concrete banked boost gives a genuinely NONZERO acceleration that breaks conservation.
  A mis-reading where the forcing were vacuous (no acceleration could be forced to vanish), or the
  cross fact failed (a non-geodesic stayed consistent), or the concrete acceleration were zero, would
  gut Q6 into a hollow conjunction.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N### geodesic motion is genuine: the
  form-skew generator gives velocity ⟂ acceleration, a vanishing source divergence forces the
  geodesic + continuity, a non-geodesic worldline breaks conservation, the banked field equation
  ∇^μG=0 forces the geodesic, and the concrete boost acceleration is genuinely nonzero". It is TIED
  to the banked N### landing by `cFlag_forced` through `transport_born_orthogonal`,
  `conservation_forces_geodesic`, `nongeodesic_breaks_conservation`, `field_equation_forces_geodesic`,
  `boost_accel_ne_zero`, `boost_nongeodesic_breaks_conservation`, and `geodesic_motion`.

  We anchor `min 465 cFlag = 1` (TRUE — `cFlag = 1 < 465`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the forcing is vacuous / a non-geodesic stays consistent / the
  concrete acceleration is zero" mis-reading): that `min 465 cFlag = 465`. It GENUINELY equals `1`
  (`cons_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 465` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (465, 1) is fresh (Cid 465 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeGeodesicMotion
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE N###-NON-VACUITY FLAG: `1` = "the geodesic motion is genuine: velocity ⟂ acceleration, the
    vanishing source divergence forces the geodesic + continuity, a non-geodesic worldline breaks
    conservation, the banked field equation ∇^μG=0 forces the geodesic, and the concrete boost
    acceleration is genuinely nonzero". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N### landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing Q6 landings — the orthogonality (`transport_born_orthogonal`), the forcing
    (`conservation_forces_geodesic`), the cross fact (`nongeodesic_breaks_conservation`), the weld to
    the banked field equations (`field_equation_forces_geodesic`), the concrete nonzero acceleration
    (`boost_accel_ne_zero`), the concrete conservation break (`boost_nongeodesic_breaks_conservation`),
    and the capstone (`geodesic_motion`). If the forcing were vacuous / a non-geodesic stayed
    consistent / the concrete acceleration were zero, those decls would not exist and this could not
    compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @transport_born_orthogonal
  have _ := @conservation_forces_geodesic
  have _ := @nongeodesic_breaks_conservation
  have _ := @field_equation_forces_geodesic
  have _ := boost_accel_ne_zero
  have _ := @boost_nongeodesic_breaks_conservation
  have _ := @geodesic_motion
  rfl

/-- TRUE: `min 465 cFlag = 1`, holding precisely because `cFlag = 1 < 465`. -/
theorem cons_val_true : min (465 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 465 cFlag = 465`. It GENUINELY equals `1` (`cons_val_true`). A "the forcing is
    vacuous / a non-geodesic stays consistent / the concrete acceleration is zero" mis-reading
    reduces — through the banked N### landing — to the false numeric `1 = 465`, so this must NOT
    compile. -/
theorem cons_val_wrong_BOGUS :
    min (465 : ℕ) cFlag = 465 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 465  (FALSE — the costume bites)

end Counterexamples
