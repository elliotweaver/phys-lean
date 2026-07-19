import Phys.Algebra.EdgeLogArgAudit

/-!
  PROBE — N577 the Born-square anchor reduction of `huc`.

  The candidate top-anchor identification `huc : (Mu/Mlam)^2 = 1/confBundle` is DERIVED (theorem of
  Cut) from the two Born-square sector-anchor pinnings, each of which is a TOWER RUNG of the ONE
  closure anchor M.

  Born = self-overlap (trunk): a mass is the Born-SQUARE of its amplitude, applied ONCE. So the
  up-sector top anchor's Born-square mass `Mu^2 = M·ewClosureRatio = v` (the electroweak n=9 rung,
  banked keystone) and the confinement-floor anchor's Born-square `Mlam^2 = M·confinementScaleRatio =
  Λ` (the colour n=7 rung, banked). Their ratio FORCES huc, with the shared anchor M cancelling —
  the fold's self-consistency point (two rungs of the SAME 84π budget on the SAME anchor):

     (Mu/Mlam)^2 = Mu^2/Mlam^2 = (M·ewRung)/(M·confRung) = ewRung/confRung = 1/confBundle.
-/

open Phys.Algebra
open Phys.Algebra.QuarkHadronTower
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (a) 1/confBundle = ewClosureRatio/confinementScaleRatio = v/Λ (unconditional, banked).
example : (1 : Cut) / confBundle = ewClosureRatio / confinementScaleRatio := by
  rw [confBundle_eq_confToEw, one_div_div]

-- 1/confBundle = cutExp(8π/3) (unconditional, banked).
example : (1 : Cut) / confBundle = cutExp (8 * cutPi / 3) := by
  rw [confBundle_eq, one_div]
  exact inv_eq_of_mul_eq_one_left (by rw [cutExp_add, add_neg_cancel]; exact cutExp_zero)

-- (b) THE CORE: linear Born-square anchors ⇒ huc, M cancelling.
example (M Mu Mlam : Cut) (hM : M ≠ 0)
    (hu : Mu ^ 2 = M * ewClosureRatio)
    (hl : Mlam ^ 2 = M * confinementScaleRatio) :
    (Mu / Mlam) ^ 2 = 1 / confBundle := by
  rw [div_pow, hu, hl, mul_div_mul_left _ _ hM, confBundle_eq_confToEw, one_div_div]

-- (c) The confinement-floor anchor pinning IS the banked confinement scale (not free).
example (M : Cut) : M * confinementScaleRatio = confinementScale M := by
  unfold confinementScale; ring

-- (d) MIS-POWER (iii) EXCLUDED: 1/confBundle ≠ 1/confBundle² since confBundle ≠ 1.
example : (1 : Cut) / confBundle ≠ 1 / confBundle ^ 2 := by
  have hne : confBundle ≠ 1 := confBundle_ne_one
  have hpos : 0 < confBundle := confBundle_pos
  have hnz : confBundle ≠ 0 := ne_of_gt hpos
  intro h
  rw [div_eq_div_iff hnz (by positivity)] at h
  -- 1·confBundle² = 1·confBundle ⇒ confBundle² = confBundle ⇒ confBundle = 1
  apply hne
  have h2 : confBundle ^ 2 = confBundle := by ring_nf; ring_nf at h; linarith [h]
  have : confBundle * confBundle = confBundle * 1 := by rw [mul_one]; nlinarith [h2]
  exact mul_left_cancel₀ hnz this

-- (e) DOUBLE-COUNT (ii) refuted: the rung is ONE derived value (the 84π colour/space gap), read in
-- two censuses. 8π/3 = 12π − 28π/3 = cutLog(1/confBundle) = cutLog confBandRatio.
example : (8 * cutPi / 3 : Cut) = 12 * cutPi - 28 * cutPi / 3 := by ring

example : cutLog ((1 : Cut) / confBundle) = 8 * cutPi / 3 := by
  rw [confBundle_eq, one_div]
  rw [show (cutExp (-(8 * cutPi / 3)))⁻¹ = cutExp (8 * cutPi / 3) from
        inv_eq_of_mul_eq_one_left (by rw [cutExp_add, add_neg_cancel]; exact cutExp_zero)]
  rw [cutLog_cutExp]

end
