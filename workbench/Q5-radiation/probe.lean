import Mathlib.Tactic
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.Measurement
import Phys.Algebra.CosmicFateEternalApproach

open Phys.Quantum Phys.Algebra
open Phys.Foundation.ContinuumQ

namespace ProbeRad

/-! ## The (1,1) null structure over the derived ℝ, in lightcone coordinates. -/

/-- The lightcone (null-coordinate) product form on the banked fibre `StateFibre = Cut × Cut`:
    `nullForm (u,v) = u·v`. In lightcone coordinates `u = t+x`, `v = t−x` this IS the banked
    indefinite (1,1) Minkowski form `t² − x²` (see `mink_eq_nullForm_lc`). -/
noncomputable def nullForm (p : StateFibre) : Cut := p.1 * p.2

/-- The genuine indefinite (1,1) Minkowski form over the derived ℝ (the banked N43 minus sign,
    (1,1) slice): `minkForm (t,x) = t² − x²`. -/
noncomputable def minkForm (t x : Cut) : Cut := t^2 - x^2

/-- The lightcone map `(t,x) ↦ (t+x, t−x)`. -/
noncomputable def lc (t x : Cut) : StateFibre := (t + x, t - x)

/-- ★ THE MINKOWSKI FORM IS THE LIGHTCONE PRODUCT: `t² − x² = (t+x)(t−x) = nullForm (lc t x)`.
    Ties `nullForm` to the genuine indefinite signature. -/
theorem mink_eq_nullForm_lc (t x : Cut) : minkForm t x = nullForm (lc t x) := by
  unfold minkForm nullForm lc; ring

/-- ★ THE NULL CONE SPLITS INTO TWO HALVES: `nullForm p = 0 ↔ p.1 = 0 ∨ p.2 = 0`. -/
theorem nullForm_zero_iff (p : StateFibre) : nullForm p = 0 ↔ p.1 = 0 ∨ p.2 = 0 := by
  unfold nullForm; exact mul_eq_zero

/-- ★ THE MINKOWSKI NULL CONE is the two unit-slope rays `t = ±x` (echo N420). -/
theorem minkForm_zero_iff (t x : Cut) : minkForm t x = 0 ↔ t = x ∨ t = -x := by
  unfold minkForm
  constructor
  · intro h
    have : (t - x) * (t + x) = 0 := by ring_nf; ring_nf at h; linarith
    rcases mul_eq_zero.mp this with h1 | h2
    · left; linarith [sub_eq_zero.mp h1]
    · right; linarith [add_eq_zero_iff_eq_neg.mp h2]
  · rintro (h | h) <;> subst h <;> ring

/-! ## The retarded gather = the banked J4 gather (N394) in lightcone coordinates. -/

/-- THE OUTGOING null half `{v = 0}` (the `eInward`/u-axis). -/
def OutHalf (p : StateFibre) : Prop := p.2 = 0

/-- THE INCOMING null half `{u = 0}` (the `eOutward`/v-axis). -/
def InHalf (p : StateFibre) : Prop := p.1 = 0

/-- THE RETARDED GATHER := the banked J4 `gatherIn` (N394), read in lightcone coordinates. -/
noncomputable def radGather (p : StateFibre) : StateFibre := gatherIn p

/-- ★ SELECTION (image on the outgoing half): the retarded gather lands in the outgoing null
    half `{v=0}`. -/
theorem radGather_in_outHalf (p : StateFibre) : OutHalf (radGather p) := by
  unfold OutHalf radGather; rw [gatherIn_apply]

/-- ★ the gathered state is ON THE NULL CONE. -/
theorem radGather_null (p : StateFibre) : nullForm (radGather p) = 0 := by
  rw [nullForm_zero_iff]; right; exact radGather_in_outHalf p

/-- ★ THE GATHER KILLS THE INCOMING HALF: `radGather (gatherOut p) = 0` (banked). -/
theorem radGather_kills_inHalf (p : StateFibre) : radGather (gatherOut p) = 0 :=
  gatherIn_gatherOut p

/-- ★ RESOLUTION OF UNITY (two halves reconstruct the whole): banked `gather_resolves_unity`. -/
theorem two_halves_resolve (p : StateFibre) : radGather p + gatherOut p = p :=
  gather_resolves_unity p

/-- ★★ NON-INJECTIVITY (no un-gather): `radGather eOutward = 0 = radGather 0` but `eOutward ≠ 0`.
    The retarded gather is not injective, hence has no inverse — the advanced (un-gather) does
    not exist. -/
theorem radGather_not_injective :
    ¬ Function.Injective radGather := by
  intro hinj
  have h0 : radGather eOutward = radGather 0 := by
    unfold radGather; rw [gatherIn_apply, gatherIn_apply]; simp [eOutward]
  have hz : eOutward = (0 : StateFibre) := hinj h0
  have : (1 : Cut) = 0 := congrArg Prod.snd hz
  exact one_ne_zero this

end ProbeRad
