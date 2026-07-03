/-
# N271 — THE JOINT COLOUR∧ISOSPIN NEUTRAL-CORE DECOMPOSITION OF THE MATTER CARRIER

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)`, the matter carrier `O ℚ` (N265, indivisible), its
two DERIVED internal symmetries — colour `colourCentralizer` (the g₂-stabilizer of the fold's √−1
`u1`, N201) and weak isospin `su(2)_L = {DI,DJ,DK}` (the fold's doubling derivations, N189) — and
the two distinguished fold-directions `u1` (the cascade's √−1) and `κO1 = kappaO 1` (the branching
singlet).

## The story this closes (the ★3 climax of the matter turn N261–270)

N266 answered *how the indivisible fold-world `O ℚ` appears to COLOUR alone*: the colour-neutral core
`matterColourNeutral = ⨅ D:colour, ker D` on the full carrier is EXACTLY `span{1, u1}` — the fold's
own ℂ. But isospin was only ever computed on the vector-7 `ImO` (N256: `isospinInvariants =
span{κO1}`), never on the FULL 8-dim carrier, so no joint structure was possible.

THIS node
  (1) puts isospin onto the full carrier — the exact TWIN of N266:
        `matterIsospinNeutral = ⨅ {DI,DJ,DK}, ker = span{1, κO1}`
  (2) takes the JOINT: the doubly-neutral core (invisible to BOTH) is EXACTLY the fold's scalar unit
        `matterColourNeutral ⊓ matterIsospinNeutral = span{1}`
  (3) the two 2-dim cores are DISTINCT (grading MISALIGNMENT on the full carrier, the lift of N254's
        `ImO`-level misalignment): `u1 ∉ span{1,κO1}`, `κO1 ∉ span{1,u1}`, so the meet is EXACTLY the
        1-dim scalar line, not larger.

## The dissolution / the moat (STANDARD §0)

The SM POSITS SU(3)×SU(2)×U(1) as a product and ASSIGNS each fermion's (colour, isospin, hyper)
quantum numbers by hand; the U(1)-neutral-direction misalignment is encoded in the CONVENTION
`Q = T₃ + Y/2`. The theory DISSOLVES the assignment: the neutral cores FALL OUT as intersections of
DERIVED joint-kernels, the doubly-neutral core being the fold's scalar unit `span{1}` is FORCED, and
the misalignment is a derived geometric fact about two distinct fold-directions (`u1` vs `κO1`), not
a convention.

## One cause, many terminations

The SAME fold-root `u1` is the cascade's √−1, the colour complex structure, the colour-neutral
carrier direction (N266); the SAME branching singlet `κO1` is the isospin-fixed vector-7 direction
(N256) and now the isospin-neutral carrier direction; the two are DIFFERENT fold-directions, so the
doubly-neutral core collapses to the pure scalar unit — the piece the fold makes before either
symmetry can act.

## Scope — honesty clause

Banks the isospin-neutral core of the full carrier + the joint doubly-neutral core = `span{1}` +
the two cores' distinctness/dimensions ONLY. Does NOT bank "= a specific SM multiplet / the scalar
core IS the right-handed neutrino / the sterile direction" (removable prose), NOT the charge or
hypercharge VALUES per multiplet, NOT the electroweak su(2)_L Lie action assembled on the carrier
alongside colour (a later node), NOT the mixing angle (★2), NOT masses/mixings (★5), NOT parity.

## Physics-words-removable

Delete colour/isospin/generation/neutral/quantum-number/weak: for the derived octonion `O ℚ`, the
joint kernel of the `colourCentralizer` derivations is `span{1, u1}`, the joint kernel of
`{DI,DJ,DK}` is `span{1, κO1}`, and their intersection is `span{1}`; the two 2-dim subspaces meet
only in the scalar line, and `u1 ∉ span{1,κO1}`, `κO1 ∉ span{1,u1}`. Every statement is pure
mathematics about the derived carrier and its derived derivation subalgebras.
-/
import Phys.Algebra.TowerWorldMapColourNeutralCore
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis
import Phys.Algebra.DerivationColourIsospinMeet
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The isospin-neutral core of the full 8-dim matter carrier `O ℚ` (the N266 twin). -/

/-- The joint kernel of the three weak-isospin generators {DI,DJ,DK} acting on the FULL carrier
    `O ℚ` (not just the vector 7 = `ImO`, where N256 found `span{κO1}`). The isospin-invisible part
    of matter. -/
noncomputable def matterIsospinNeutral : Submodule ℚ (O ℚ) :=
  LinearMap.ker ((DI : Module.End ℚ (O ℚ))) ⊓ LinearMap.ker ((DJ : Module.End ℚ (O ℚ)))
    ⊓ LinearMap.ker ((DK : Module.End ℚ (O ℚ)))

/-- ⊇ : `span{1, κO1}` is isospin-neutral — `1` is killed by every derivation (`derivQ_one`) and
    `κO1` by every isospin generator (`D_kappaO_one_zero`, N189/N255). -/
theorem span_one_kap_le_matterIsospinNeutral :
    Submodule.span ℚ {(1 : O ℚ), kappaO 1} ≤ matterIsospinNeutral := by
  rw [Submodule.span_le]
  intro x hx
  simp only [SetLike.mem_coe, matterIsospinNeutral, Submodule.mem_inf, LinearMap.mem_ker]
  rcases hx with h1 | hk
  · rw [h1]
    exact ⟨⟨derivQ_one _ DI.2, derivQ_one _ DJ.2⟩, derivQ_one _ DK.2⟩
  · rw [Set.mem_singleton_iff] at hk; rw [hk]
    exact ⟨⟨D_kappaO_one_zero hI DI.2, D_kappaO_one_zero hJ DJ.2⟩, D_kappaO_one_zero hK DK.2⟩

/-- ⊆ (THE CRUX): every isospin-neutral `x` lies in `span{1, κO1}`. Split `x = reQ x • 1 + w` with
    `w ∈ ImO`; each isospin generator kills `x` and kills `reQ x • 1` (`derivQ_one`), so it kills
    `w`, hence `⟨w, _⟩ ∈ isospinInvariants = span{κO1}` (N256 `isospinInvariants_eq_span_kap`),
    giving `w = c • κO1` and `x = reQ x • 1 + c • κO1 ∈ span{1, κO1}`. The exact TWIN of N266's
    colour crux; lifts N256 from its `ImO`-shadow to the full carrier. -/
theorem matterIsospinNeutral_le_span_one_kap :
    matterIsospinNeutral ≤ Submodule.span ℚ {(1 : O ℚ), kappaO 1} := by
  intro x hx
  simp only [matterIsospinNeutral, Submodule.mem_inf, LinearMap.mem_ker] at hx
  obtain ⟨⟨hxI, hxJ⟩, hxK⟩ := hx
  set w : O ℚ := x - (reQ x) • (1 : O ℚ) with hw
  have hwIm : w ∈ ImO := by
    rw [mem_ImO, hw]
    have ht := trace_id x
    have hs1 : star ((reQ x) • (1 : O ℚ)) = (reQ x) • (1 : O ℚ) := by
      have h := starL.map_smul (reQ x) (1 : O ℚ)
      simp only [starL_apply, star_one] at h
      exact h
    rw [star_sub, hs1]
    linear_combination (norm := module) ht
  -- each isospin generator kills `w` (kills `x` and kills the scalar part).
  have kill : ∀ D : derivationLieQ, (D : Module.End ℚ (O ℚ)) x = 0 →
      (D : Module.End ℚ (O ℚ)) w = 0 := by
    intro D hDx
    have h1 : (D : Module.End ℚ (O ℚ)) ((reQ x) • (1 : O ℚ)) = 0 := by
      rw [map_smul, derivQ_one _ D.2, smul_zero]
    rw [hw, map_sub, hDx, h1, sub_zero]
  have mem_iso : ∀ D : derivationLieQ, (D : Module.End ℚ (O ℚ)) x = 0 →
      imRep D ⟨w, hwIm⟩ = 0 := by
    intro D hDx
    apply Subtype.ext
    rw [imRep_coe]
    simpa using kill D hDx
  have hker : (⟨w, hwIm⟩ : ImO) ∈ isospinInvariants :=
    ⟨⟨LinearMap.mem_ker.mpr (mem_iso DI hxI), LinearMap.mem_ker.mpr (mem_iso DJ hxJ)⟩,
      LinearMap.mem_ker.mpr (mem_iso DK hxK)⟩
  rw [isospinInvariants_eq_span_kap, Submodule.mem_span_singleton] at hker
  obtain ⟨c, hc⟩ := hker
  have hwc : w = c • (kappaO 1 : O ℚ) := by
    have := congrArg (Subtype.val) hc
    simpa [kap1', SetLike.val_smul] using this.symm
  have hxsplit : x = (reQ x) • (1 : O ℚ) + c • (kappaO 1 : O ℚ) := by
    rw [← hwc, hw]; abel
  rw [hxsplit]
  apply Submodule.add_mem
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by left; rfl))
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by right; rfl))

/-- ★★★ THE ISOSPIN TWIN of N266: the isospin-neutral core of the full matter carrier is EXACTLY
    the fold's real unit line adjoined to the branching singlet, `span{1, κO1}`. Isospin is blind
    to precisely the fold's unit and its own fixed singlet direction. -/
theorem matterIsospinNeutral_eq_span_one_kap :
    matterIsospinNeutral = Submodule.span ℚ {(1 : O ℚ), kappaO 1} :=
  le_antisymm matterIsospinNeutral_le_span_one_kap span_one_kap_le_matterIsospinNeutral

/-! ## Non-vacuity of the isospin core: a genuine 2-dim plane. -/

/-- `1` and `κO1` are ℚ-linearly independent (`1` is real, `κO1 = ⟨0,1⟩` is imaginary). -/
theorem one_kap_linIndep : LinearIndependent ℚ ![(1 : O ℚ), kappaO 1] := by
  rw [LinearIndependent.pair_iff]
  intro s t hst
  have hrk : reQ (kappaO 1) = 0 := reQ_ImO_zero kappaO_one_mem_ImO
  have h := congrArg reQ hst
  rw [reQ_add, reQ_smul, reQ_smul, reQ_one, hrk, mul_zero, add_zero, mul_one] at h
  simp only [reQ] at h
  have hs : s = 0 := by simpa using h
  refine ⟨hs, ?_⟩
  rw [hs, zero_smul, zero_add] at hst
  rcases eq_or_ne t 0 with ht | ht
  · exact ht
  · exact absurd ((smul_eq_zero.mp hst).resolve_left ht) kappaO_one_ne_zero

/-- ★★ W8 TEETH: the isospin-neutral core is EXACTLY 2-dimensional — a genuine PLANE, adjoining the
    real unit line to the vector-7 isospin singlet `span{κO1}` (N256). Not 0, not the 1-dim singlet. -/
theorem finrank_matterIsospinNeutral : Module.finrank ℚ matterIsospinNeutral = 2 := by
  rw [matterIsospinNeutral_eq_span_one_kap]
  have h2 : Submodule.span ℚ {(1 : O ℚ), kappaO 1}
      = Submodule.span ℚ (Set.range ![(1 : O ℚ), kappaO 1]) := by
    congr 1
    rw [Matrix.range_cons_cons_empty]
  rw [h2, finrank_span_eq_card one_kap_linIndep, Fintype.card_fin]

/-! ## The two neutral cores are DISTINCT — the grading misalignment (lift of N254 to the carrier). -/

/-- Coordinate functional picking the `u1` component (`x.re.re.im`) — the second real slot. -/
def cU1 : O ℚ →ₗ[ℚ] ℚ where
  toFun x := x.re.re.im
  map_add' x y := by simp [CD.add_re]
  map_smul' c x := by simp [cd_qsmul_re]

/-- Coordinate functional picking the `κO1` component (`x.im.re.re`) — the doubling slot. -/
def cKap : O ℚ →ₗ[ℚ] ℚ where
  toFun x := x.im.re.re
  map_add' x y := by simp [CD.add_im]
  map_smul' c x := by simp [cd_qsmul_im]

theorem cU1_one : cU1 (1 : O ℚ) = 0 := by simp [cU1]
theorem cU1_u1 : cU1 u1 = 1 := by simp [cU1, u1]
theorem cU1_kap : cU1 (kappaO 1) = 0 := by simp [cU1, kappaO]
theorem cKap_one : cKap (1 : O ℚ) = 0 := by simp [cKap]
theorem cKap_u1 : cKap u1 = 0 := by simp [cKap, u1]
theorem cKap_kap : cKap (kappaO 1) = 1 := by simp [cKap, kappaO]

/-- The colour direction `u1` is NOT isospin-neutral-core content: `u1 ∉ span{1, κO1}`. The two
    2-dim cores are genuinely misaligned — colour's extra direction is invisible to isospin's core.
    (`cKap u1 = 0` but `cKap κO1 = 1`, so any `a•1 + b•κO1 = u1` forces `b = 0` then `1 = 0`.) -/
theorem u1_not_mem_span_one_kap : u1 ∉ Submodule.span ℚ {(1 : O ℚ), kappaO 1} := by
  intro h
  rw [Submodule.mem_span_pair] at h
  obtain ⟨a, b, hab⟩ := h
  -- cKap: b = cKap u1 = 0
  have hb : b = 0 := by
    have h1 : cKap u1 = 0 := cKap_u1
    have h2 : cKap (a • (1 : O ℚ) + b • kappaO 1) = b := by
      rw [map_add, map_smul, map_smul, cKap_one, cKap_kap, smul_zero, zero_add, smul_eq_mul, mul_one]
    rw [hab] at h2; rw [h1] at h2; exact h2.symm
  -- cU1: with b = 0, cU1 u1 = a • cU1 1 = 0, contradicting cU1 u1 = 1
  rw [hb, zero_smul, add_zero] at hab
  have h1 : cU1 u1 = 1 := cU1_u1
  have h2 : cU1 (a • (1 : O ℚ)) = 0 := by rw [map_smul, cU1_one, smul_zero]
  rw [hab] at h2; rw [h1] at h2; exact one_ne_zero h2

/-- The isospin direction `κO1` is NOT colour-neutral-core content: `κO1 ∉ span{1, u1}`. The MIRROR
    of `u1_not_mem_span_one_kap` — isospin's extra direction is invisible to colour's core. -/
theorem kap_not_mem_span_one_u1 : kappaO 1 ∉ Submodule.span ℚ {(1 : O ℚ), u1} := by
  intro h
  rw [Submodule.mem_span_pair] at h
  obtain ⟨a, b, hab⟩ := h
  have hb : b = 0 := by
    have h1 : cU1 (kappaO 1) = 0 := cU1_kap
    have h2 : cU1 (a • (1 : O ℚ) + b • u1) = b := by
      rw [map_add, map_smul, map_smul, cU1_one, cU1_u1, smul_zero, zero_add, smul_eq_mul, mul_one]
    rw [hab] at h2; rw [h1] at h2; exact h2.symm
  rw [hb, zero_smul, add_zero] at hab
  have h1 : cKap (kappaO 1) = 1 := cKap_kap
  have h2 : cKap (a • (1 : O ℚ)) = 0 := by rw [map_smul, cKap_one, smul_zero]
  rw [hab] at h2; rw [h1] at h2; exact one_ne_zero h2

/-! ## The JOINT doubly-neutral core = the fold's scalar unit line span{1}. -/

/-- CRUX: `span{1, u1} ⊓ span{1, κO1} = span{1}`. Any element of both is `a•1 + b•u1 = c•1 + d•κO1`;
    `cKap` forces `d = 0` (so the element is a scalar multiple of `1`). -/
theorem span_meet_eq_span_one :
    Submodule.span ℚ {(1 : O ℚ), u1} ⊓ Submodule.span ℚ {(1 : O ℚ), kappaO 1}
      = Submodule.span ℚ {(1 : O ℚ)} := by
  apply le_antisymm
  · rintro x ⟨hxu, hxk⟩
    rw [SetLike.mem_coe, Submodule.mem_span_pair] at hxu
    rw [SetLike.mem_coe, Submodule.mem_span_pair] at hxk
    obtain ⟨a, b, hab⟩ := hxu
    obtain ⟨c, d, hcd⟩ := hxk
    have hd : d = 0 := by
      have h1 : cKap x = 0 := by
        rw [← hab, map_add, map_smul, map_smul, cKap_one, cKap_u1, smul_zero, smul_zero, add_zero]
      have h2 : cKap x = d := by
        rw [← hcd, map_add, map_smul, map_smul, cKap_one, cKap_kap, smul_zero, zero_add,
          smul_eq_mul, mul_one]
      rw [h2] at h1; exact h1
    rw [hd, zero_smul, add_zero] at hcd
    rw [← hcd]
    exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self _)
  · rw [Submodule.span_le]
    intro x hx
    rw [Set.mem_singleton_iff] at hx; subst hx
    exact ⟨Submodule.subset_span (by simp), Submodule.subset_span (by simp)⟩

/-- ★★★ THE JOINT DOUBLY-NEUTRAL CORE of the matter carrier is EXACTLY the fold's scalar unit line
    `span{1}` — the piece invisible to BOTH colour AND isospin. The fold's own unit, before either
    derived symmetry can act, is the unique doubly-neutral direction. -/
theorem matter_joint_neutral_eq_span_one :
    matterColourNeutral ⊓ matterIsospinNeutral = Submodule.span ℚ {(1 : O ℚ)} := by
  rw [matterColourNeutral_eq_span_one_u1, matterIsospinNeutral_eq_span_one_kap,
    span_meet_eq_span_one]

/-- ★★ W8 TEETH: the doubly-neutral core is EXACTLY 1-dimensional — the fold's scalar unit line,
    not larger (the two 2-dim cores are misaligned) and not 0. -/
theorem finrank_matter_joint_neutral :
    Module.finrank ℚ ↥(matterColourNeutral ⊓ matterIsospinNeutral) = 1 := by
  rw [matter_joint_neutral_eq_span_one]
  have h1 : (1 : O ℚ) ≠ 0 := by
    intro h
    have hcontra : reQ (1 : O ℚ) = 0 := by rw [h]; simp [reQ]
    rw [reQ_one] at hcontra
    exact one_ne_zero hcontra
  exact finrank_span_singleton h1

/-- ★★★ THE CAPSTONE: the joint colour∧isospin neutral-core decomposition of the matter carrier.
    Bundles: the isospin-neutral core = `span{1, κO1}` (2-dim) ∧ the colour-neutral core =
    `span{1, u1}` (2-dim, N266) ∧ the two cores DISTINCT (misalignment: `u1 ∉` isospin-core,
    `κO1 ∉` colour-core) ∧ the doubly-neutral core = the fold's scalar unit `span{1}` (1-dim). -/
theorem matter_joint_neutral_core_structure :
    matterIsospinNeutral = Submodule.span ℚ {(1 : O ℚ), kappaO 1}
    ∧ matterColourNeutral = Submodule.span ℚ {(1 : O ℚ), u1}
    ∧ u1 ∉ Submodule.span ℚ {(1 : O ℚ), kappaO 1}
    ∧ kappaO 1 ∉ Submodule.span ℚ {(1 : O ℚ), u1}
    ∧ matterColourNeutral ⊓ matterIsospinNeutral = Submodule.span ℚ {(1 : O ℚ)}
    ∧ Module.finrank ℚ ↥(matterColourNeutral ⊓ matterIsospinNeutral) = 1 :=
  ⟨matterIsospinNeutral_eq_span_one_kap, matterColourNeutral_eq_span_one_u1,
    u1_not_mem_span_one_kap, kap_not_mem_span_one_u1,
    matter_joint_neutral_eq_span_one, finrank_matter_joint_neutral⟩

end Phys.Algebra.HJ
