/-
  Phys.Algebra.TowerWorldMapIndivisible — N265: MATTER IS ONE INDIVISIBLE WHOLE, AND ITS
  INDIVISIBILITY IS THE CASCADE STOP.
  ===========================================================================
  Over the DERIVED octonion rung `O ℚ = CD (H ℚ)`, ImO. The FORWARD ★3↔★15 joint.

  N261–264 built the derived spinor's STRUCTURE (Clifford relation, spin generators, the two so(7)
  faces, the two chiralities). This node banks the deepest fact about matter ITSELF: the matter
  carrier `O ℚ` is INDIVISIBLE — the only subspaces invariant under the fold's own worldMap (the
  left-regular action `leftReg a = L_a = (a · ·)`) are `⊥` and `⊤`. Equivalently, `O ℚ` has NO ZERO
  DIVISORS: every nonzero standpoint's worldMap is injective (each fold standpoint opens a COMPLETE
  inner world — nothing collapses to zero).

  AND THIS INDIVISIBILITY IS THE CASCADE STOP. The no-zero-divisor property is exactly the property
  that HOLDS while the Born self-overlap norm is multiplicative (banked `Nrm_mul_on_O`, through the
  octonion rung) and is LOST at the very next rung `S ℚ = CD (O ℚ)` (banked `has_zero_divisor`). The
  `division_boundary` theorem pairs the two — the EXACT MIRROR of the banked `forced_stop_boundary`
  (`Phys/Cascade/ForcedStop.lean`). So "matter is one indivisible whole" and "the cascade terminates
  at the octonions" are ONE fact, forced by ONE cause (the multiplicativity of the fold's Born form).

  THE DISSOLUTION (STANDARD §0). Standard physics CHOOSES a "generation of matter" to be an
  irreducible representation — irreducibility is an INPUT the model-builder posits. Standard math
  treats "a division algebra has no zero divisors" and "the Cayley–Dickson ladder stops being a
  division algebra at the octonions" as two separate textbook facts. The theory INVERTS + IDENTIFIES:
  matter's indivisibility is NOT a chosen irrep but the SAME multiplicativity boundary that stops the
  cascade — one cause across ★3 (matter) and ★15 (the terminal exceptional structure). The irrep is
  not assumed; it is forced, and forced by the SAME thing that ends the tower.

  ONE CAUSE MANY TERMINATIONS. The multiplicativity of the fold's Born self-overlap norm (`Nrm` on
  `O ℚ`) — the residue of the composition law that survives to the last associative-base rung — makes
  `O ℚ` a division algebra (no zero divisors ⟹ worldMap-irreducible / matter indivisible) AND is the
  very thing lost at `S ℚ` (the cascade stop). Beside the cascade-stop (N2c), the generation-cap
  (JordanTower), N44's chirality block, and N264's two-handedness, this is the SAME one cause read as
  the indivisibility of matter.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): delete "matter / generation / indivisible / world / spinor" —
  the pure statement is: the derived non-associative algebra `O ℚ` has no zero divisors (from the
  banked Born composition law `gForm_comp` + ℚ-anisotropy `gForm_self_eq_zero`); hence its
  left-regular module over its own multiplication is irreducible and every nonzero left-multiplication
  is injective; and this no-zero-divisor property FAILS at the next Cayley–Dickson rung `S ℚ`
  (banked `has_zero_divisor`), the same multiplicativity boundary as the banked `forced_stop_boundary`.
  A complete mathematical derivation, about the banked `O ℚ` / `S ℚ` / `gForm` / `leftReg`.

  BANKED LEVERS: `gForm_comp` (Born composition law, from `Nrm_mul_on_O`, N-LorentzIsometry);
  `gForm_self_eq_zero` (ℚ-anisotropy, N24); `selfMul_eq_smul` (`x·star x = (gForm x x)•1`,
  DerivationAutGroup); `starL_add_one_apply` (`(starL+1)x = (2·reQ x)•1`, N-DerivationRep7);
  `reQ_star`/`reQ_one`/`reQ_mul_comm`; `qsmul_mul_left` (DerivationFinrank);
  `Phys.Cascade.has_zero_divisor` (Cascade/Sedenion); `LeftMul`/`leftReg` (ChiralityBlock /
  TowerWorldMapCliffordModule); `u1`/`u1_mem_ImO`/`u1_ne_zero`; `ImO = ker(starL+1)`.
-/
import Phys.Algebra.LorentzIsometry
import Phys.Algebra.DerivationAutGroup
import Phys.Algebra.TowerWorldMapCliffordModule
import Phys.Cascade.Sedenion

open scoped Classical BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## No zero divisors on the terminal division algebra `O ℚ`. -/

/-- ★★ NO ZERO DIVISORS on `O ℚ`. If `x · y = 0` and `x ≠ 0`, then `y = 0`. Read directly off the
    BANKED Born COMPOSITION LAW `gForm_comp` (`gForm (x·y)(x·y) = gForm x x · gForm y y`, itself from
    the surviving multiplicativity `Nrm_mul_on_O`) and the fold's own ℚ-ANISOTROPY
    `gForm_self_eq_zero` (`gForm w w = 0 ↔ w = 0`, the Born self-overlap positivity). NO coordinate
    bash: `x·y = 0` ⟹ `gForm x x · gForm y y = gForm 0 0 = 0`; `x ≠ 0` ⟹ `gForm x x ≠ 0`; so
    `gForm y y = 0` ⟹ `y = 0`. -/
theorem octNoZeroDivisors {x y : O ℚ} (hxy : x * y = 0) (hx : x ≠ 0) : y = 0 := by
  have hcomp := gForm_comp x y
  rw [hxy, (gForm_self_eq_zero).mpr rfl] at hcomp
  have hxx : gForm x x ≠ 0 := fun h => hx (gForm_self_eq_zero.mp h)
  exact gForm_self_eq_zero.mp ((mul_eq_zero.mp hcomp.symm).resolve_left hxx)

/-- The contrapositive: the product of two nonzero elements of `O ℚ` is nonzero (the multiplicative
    form of no zero divisors — `O ℚ` a genuine division algebra at the level of the product). -/
theorem octMul_ne_zero {x y : O ℚ} (hx : x ≠ 0) (hy : y ≠ 0) : x * y ≠ 0 :=
  fun h => hy (octNoZeroDivisors h hx)

/-- ★★ WORLD-COMPLETENESS: every NONZERO standpoint's worldMap (the left-regular action `LeftMul a`)
    is INJECTIVE. Each fold standpoint `a ≠ 0` opens a COMPLETE inner world — no nonzero probe
    collapses to zero under `x ↦ a · x`. Directly from `octNoZeroDivisors`. -/
theorem worldMap_injective {a : O ℚ} (ha : a ≠ 0) : Function.Injective (LeftMul a) := by
  rw [injective_iff_map_eq_zero]
  intro x hx
  simp only [LeftMul_apply] at hx
  exact octNoZeroDivisors hx ha

/-! ## The left-conjugate norm and the imaginary-part membership (levers for irreducibility). -/

/-- The LEFT-conjugate self-overlap: `star w · w = (gForm w w) • 1`. The mirror of the banked
    `selfMul_eq_smul` (`w · star w = (gForm w w)•1`), obtained by applying it at `star w` and using
    `star (star w) = w` and the trace-commutativity `reQ_mul_comm` (`gForm (star w)(star w) =
    gForm w w`). This is the lever that puts `1` into any worldMap-invariant subspace. -/
theorem star_selfMul (w : O ℚ) : star w * w = (gForm w w) • (1 : O ℚ) := by
  have h := selfMul_eq_smul (star w)
  rw [star_star] at h
  have hg : gForm (star w) (star w) = gForm w w := by
    unfold gForm; rw [star_star, reQ_mul_comm]
  rw [hg] at h; exact h

/-- The IMAGINARY PART of any `w` lands in `ImO`: `star w − (reQ w) • 1 ∈ ImO`. From the banked
    real-part projection `starL_add_one_apply` (`(starL+1)x = (2·reQ x)•1`) with `reQ (star w) =
    reQ w` (`reQ_star`) and `reQ 1 = 1` (`reQ_one`); `ImO = ker (starL+1)`. Closed by `module`. -/
theorem im_mem (w : O ℚ) : (star w - (reQ w) • (1 : O ℚ)) ∈ ImO := by
  rw [ImO, LinearMap.mem_ker, map_sub, map_smul,
      starL_add_one_apply, starL_add_one_apply, reQ_star, reQ_one]
  module

/-! ## THE HEADLINE: `O ℚ` is irreducible under the fold's worldMap — matter is indivisible. -/

/-- ★★★ MATTER IS ONE INDIVISIBLE WHOLE. Any subspace `W ≤ O ℚ` that is invariant under the fold's
    worldMap (`leftReg a` for every imaginary standpoint `a : ImO`) and contains a NONZERO element is
    ALL of `O ℚ`. So the only worldMap-invariant subspaces are `⊥` and `⊤`: the matter carrier does
    not split into independent pieces under its own self-action.

    THE ROUTE (trunk-native, no coordinate bash). For a nonzero `w ∈ W`: write `star w = (reQ w)•1 +
    p` with `p ∈ ImO` (`im_mem`); then `star w · w = (reQ w)•w + leftReg ⟨p,_⟩ w ∈ W` (both summands
    in `W` by scalar-closure and worldMap-invariance), and `star w · w = (gForm w w)•1`
    (`star_selfMul`) with `gForm w w ≠ 0` (anisotropy), so `1 ∈ W`. Then any `z` decomposes as
    `z = (reQ z)•1 + leftReg ⟨z − (reQ z)•1, _⟩ 1 ∈ W`, so `W = ⊤`. -/
theorem worldMap_irreducible
    (W : Submodule ℚ (O ℚ))
    (hinv : ∀ a : ImO, ∀ z ∈ W, leftReg a z ∈ W)
    {w : O ℚ} (hw : w ∈ W) (hw0 : w ≠ 0) : W = ⊤ := by
  have hxx : gForm w w ≠ 0 := fun h => hw0 (gForm_self_eq_zero.mp h)
  set p : O ℚ := star w - (reQ w) • (1 : O ℚ) with hp
  have hpmem : p ∈ ImO := im_mem w
  have hstarw : star w = (reQ w) • (1 : O ℚ) + p := by rw [hp]; abel
  have hsm : star w * w = (gForm w w) • (1 : O ℚ) := star_selfMul w
  have hpw : p * w ∈ W := by
    have := hinv ⟨p, hpmem⟩ w hw
    simpa [leftReg, LeftMul] using this
  have hrw : (reQ w) • w ∈ W := W.smul_mem _ hw
  have hsplit : star w * w = (reQ w) • w + p * w := by
    rw [hstarw, add_mul, qsmul_mul_left, one_mul]
  have honeW : (gForm w w) • (1 : O ℚ) ∈ W := by
    rw [← hsm, hsplit]; exact W.add_mem hrw hpw
  have hone : (1 : O ℚ) ∈ W := by
    have := W.smul_mem (gForm w w)⁻¹ honeW
    rwa [smul_smul, inv_mul_cancel₀ hxx, one_smul] at this
  rw [eq_top_iff]
  intro z _
  set q : O ℚ := z - (reQ z) • (1 : O ℚ) with hq
  have hqmem : q ∈ ImO := by
    rw [hq, ImO, LinearMap.mem_ker, map_sub, map_smul,
        starL_add_one_apply, starL_add_one_apply, reQ_one]
    module
  have hqW : q * (1 : O ℚ) ∈ W := by
    have := hinv ⟨q, hqmem⟩ (1 : O ℚ) hone
    simpa [leftReg, LeftMul] using this
  have hzsplit : z = (reQ z) • (1 : O ℚ) + q * (1 : O ℚ) := by
    rw [hq, mul_one]; abel
  rw [hzsplit]
  exact W.add_mem (W.smul_mem _ hone) hqW

/-! ## W8 non-vacuity and the ONE-CAUSE division boundary. -/

/-- ★★ W8 NON-VACUITY: the worldMap is not the zero map. `leftReg ⟨u1,_⟩ ≠ 0`, since it sends
    `1 ↦ u1 · 1 = u1 ≠ 0` — so `worldMap_irreducible`'s invariance hypothesis is about a genuine,
    non-trivial action, not a vacuous one. -/
theorem leftReg_nonvacuous : leftReg ⟨u1, u1_mem_ImO⟩ ≠ 0 := by
  intro h
  have hz : leftReg ⟨u1, u1_mem_ImO⟩ (1 : O ℚ) = 0 := by rw [h]; rfl
  simp only [leftReg, LeftMul, LinearMap.coe_mk, AddHom.coe_mk, mul_one] at hz
  exact u1_ne_zero hz

/-- ★★★ THE ONE-CAUSE DIVISION BOUNDARY — the EXACT MIRROR of the banked `forced_stop_boundary`
    (`Phys/Cascade/ForcedStop.lean`), for the DIVISION / indivisibility property. `O ℚ` has NO zero
    divisors (matter indivisible), while the very next Cayley–Dickson rung `S ℚ = CD (O ℚ)` HAS zero
    divisors (banked `has_zero_divisor`). Matter's indivisibility and the cascade's termination are
    ONE fact: the multiplicativity of the fold's Born self-overlap norm holds through `O ℚ` and is
    lost at `S ℚ`. ★3 (matter) ↔ ★15 (the terminal stop). -/
theorem division_boundary :
    (∀ x y : O ℚ, x ≠ 0 → y ≠ 0 → x * y ≠ 0) ∧
    (∃ x y : S ℚ, x ≠ 0 ∧ y ≠ 0 ∧ x * y = 0) :=
  ⟨fun _ _ hx hy => octMul_ne_zero hx hy, Phys.Cascade.has_zero_divisor⟩

/-- ★★★ CAPSTONE — MATTER IS ONE INDIVISIBLE WHOLE, AND ITS INDIVISIBILITY IS THE CASCADE STOP.
    Bundles: (1) `O ℚ` has no zero divisors (division algebra); (2) every nonzero standpoint's
    worldMap is injective (world-completeness); (3) `O ℚ` is irreducible under the worldMap (only
    invariant subspaces `⊥`, `⊤` — matter indivisible), with the invariance non-vacuous; (4) THE
    JOINT: the no-zero-divisor property holds at `O ℚ` and is lost at `S ℚ` — one cause, the cascade
    stop. -/
theorem matter_indivisible :
    (∀ x y : O ℚ, x ≠ 0 → y ≠ 0 → x * y ≠ 0) ∧
    (∀ a : O ℚ, a ≠ 0 → Function.Injective (LeftMul a)) ∧
    (∀ (W : Submodule ℚ (O ℚ)), (∀ a : ImO, ∀ z ∈ W, leftReg a z ∈ W) →
        ∀ {w : O ℚ}, w ∈ W → w ≠ 0 → W = ⊤) ∧
    leftReg ⟨u1, u1_mem_ImO⟩ ≠ 0 ∧
    (∃ x y : S ℚ, x ≠ 0 ∧ y ≠ 0 ∧ x * y = 0) :=
  ⟨fun _ _ hx hy => octMul_ne_zero hx hy,
   fun _ ha => worldMap_injective ha,
   fun W hinv _ hw hw0 => worldMap_irreducible W hinv hw hw0,
   leftReg_nonvacuous,
   Phys.Cascade.has_zero_divisor⟩

end

end Phys.Algebra
