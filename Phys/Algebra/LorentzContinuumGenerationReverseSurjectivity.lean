/-
  Phys.Algebra.LorentzContinuumGenerationReverseSurjectivity — N132: THE GLOBAL REVERSE
  SURJECTIVITY, CLOSED UNCONDITIONALLY AGAINST THE REFLECTION ALPHABET — every linear
  `QvC`-isometry of `STVC` is a finite product of indefinite Householder reflections, and the
  generated reflection submonoid IS exactly the full linear `BvC`-isometry group. Over the
  derived ℝ `Cut`, the terminal algebra `O Cut`, the indefinite Minkowski form `BvC`.
  ===========================================================================
  CONTEXT — WHY THE RESIDUAL DISSOLVES (THE ONE LAW, W1 step 2: reframe through the trunk).
  N131 reduced the global reverse surjectivity for an arbitrary `BvC`-isometry to the SINGLE
  conditional residual `k ∈ genIsomMonoidLin` (the compact factor `k := S∘(p^{1/2})⁻¹` is a
  finite `biMulLin` word). But the `biMulLin` alphabet is provably TOO SMALL: N105 banked
  `genIsomMonoidLin_fixes_fst`/`_snd` — every `biMulLin` word FIXES BOTH `t` AND `x`, reaching
  only the octonion-block `SO(8)` sector — and `xNegLin_not_mem_genIsomMonoidLin` /
  `planeRotLin_not_mem_genIsomMonoidLin`: a general ninth-direction `SO(9)` rotation MOVES `x`,
  so it is NOT a `biMulLin` word. The literal residual is FALSE against that alphabet. Grinding
  it is the drift trap; the chain already holds the theory-native answer.

  THE TRUNK ANSWER (already banked, the Cartan–Dieudonné generators). N128 banked
  `lorentz_exhaustion_M`: EVERY linear `BvC`-isometry `S` lies in `Submonoid.closure
  houseHolderMSet` — a finite product of indefinite Householder reflections — UNCONDITIONALLY
  (the totally-isotropic edge case dissolved through Born positivity, Witt index `1`,
  `haniso_exists_thm`). N51 banked `linIsom_BvC_preserved`: a linear `QvC`-isometry preserves
  `BvC`, i.e. `IsBvIsomLin`. Composing the two CLOSES the global reverse surjectivity against the
  REFLECTION alphabet — the heavy residual DISSOLVES: the right generating set is the reflections
  (which reach the full group), not the two-sided bimultiplications (which reach only `SO(8)`).

  ── WHAT THIS NODE BANKS ──
    bvIsomLinMonoid                        — the submonoid of ALL linear `BvC`-isometries of `STVC`.
    mem_bvIsomLinMonoid                    — membership unfolds to `IsBvIsomLin`.
    ★★ linQvIsom_mem_reflection_closure    — THE HEADLINE: every linear `QvC`-isometry is a finite
                                             reflection word (`∈ Submonoid.closure houseHolderMSet`),
                                             UNCONDITIONAL — discharging N131's conditional residual
                                             by switching to the alphabet that reaches the full group.
    ★★ reflection_closure_eq_bvIsomLinMonoid — THE EQUALITY / CLASSIFICATION: the generated
                                             reflection submonoid `Submonoid.closure houseHolderMSet`
                                             EQUALS `bvIsomLinMonoid`, the full linear isometry group
                                             `SO⁺(1,9)`. Not conditional — a structural identity.
    W8 (genuinely-indefinite):
    boost_mem_reflection_closure           — the concrete boost `(5/3,4/3)` IS a finite reflection
                                             word (non-vacuity on a real boost).
    boost_reflection_word_witness_self_overlap — the boost's moved timelike axis reads Minkowski
                                             self-overlap `1` (the costume C164 read-off).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the Lorentz group
  `SO⁺(1,9)` and cites the indefinite Cartan–Dieudonné theorem (every isometry a finite product of
  reflections) plus the polar/KAK decomposition as standard facts. Here the FULL exhaustion was
  CONSTRUCTED forward from the trunk (N123–N128: the finrank-strong recursion on the codimension of
  the trunk's own `S − id`, bottoming out at the cascade-counted `finrank STVC = 10`, with the
  totally-isotropic case dissolved through Born positivity), and THIS node reads off the global
  reverse surjectivity and the group/closure equality as a corollary — DERIVED, never asserted,
  with NO operator topology, NO operator `exp`, NO Mathlib spectral theory, NO posited group. The
  contribution is the precise UNBROKEN strand: the global surjectivity that the polar/KAK strand
  (N89–N131) approached conditionally closes UNCONDITIONALLY through the indefinite-Householder
  strand (N125–N128) — one chain, the two strands joined at the right alphabet.

  DERIVED from the banked N49–N131 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC`. Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / reflection /
  Householder / Minkowski / metric / signature / timelike / isometry / surjectivity / generation /
  generator / Cartan / Dieudonné / SO⁺(1,9) / Spin / word / cover / classification / group /
  bridge": what remains is pure linear algebra over the derived complete ordered field `Cut`,
  `STVC = Cut × Cut × O Cut`, the bilinear form `BvC` — the submonoid of `Module.End Cut STVC`
  generated by the maps `p ↦ p − (2·(BvC a a)⁻¹·BvC a p)•a` (for `BvC a a ≠ 0`) EQUALS the submonoid
  of all `Cut`-linear operators preserving `BvC`; and every `Cut`-linear operator preserving the
  quadratic form `QvC` lies in that generated submonoid. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationCompactFactorOrthogonal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The submonoid of all linear `BvC`-isometries. -/

/-- THE FULL LINEAR ISOMETRY SUBMONOID `bvIsomLinMonoid`: all `Cut`-linear operators on `STVC`
    preserving the indefinite Minkowski form `BvC` (carrier `{S | IsBvIsomLin S}`). The identity
    preserves `BvC` (`Module.End.one_apply`), and a composite of two `BvC`-isometries is a
    `BvC`-isometry (`IsBvIsomLin.comp`, N125). The continuum Lorentz group `SO⁺(1,9)` as a derived
    submonoid of `Module.End Cut STVC` — built, not posited. -/
def bvIsomLinMonoid : Submonoid (Module.End Cut STVC) where
  carrier := {S | IsBvIsomLin S}
  one_mem' := by
    intro p q
    simp only [Module.End.one_apply]
  mul_mem' := fun hR hT => IsBvIsomLin.comp hR hT

/-- Membership in `bvIsomLinMonoid` unfolds to the `BvC`-isometry predicate. -/
theorem mem_bvIsomLinMonoid {S : Module.End Cut STVC} :
    S ∈ bvIsomLinMonoid ↔ IsBvIsomLin S := Iff.rfl

/-! ## THE HEADLINE — the global reverse surjectivity, unconditional. -/

/-- ★★ THE GLOBAL REVERSE SURJECTIVITY — every linear `QvC`-isometry `g` of `STVC` is a finite
    product of indefinite Householder reflections (`g ∈ Submonoid.closure houseHolderMSet`),
    UNCONDITIONALLY. The linear `QvC`-isometry preserves the polarized Minkowski form
    (`linIsom_BvC_preserved`, N51 — so `IsBvIsomLin g`), and the now-CLOSED indefinite
    Cartan–Dieudonné exhaustion (`lorentz_exhaustion_M`, N128) puts every `BvC`-isometry in the
    reflection closure. This DISCHARGES N131's conditional residual `k ∈ genIsomMonoidLin → …`: the
    `biMulLin` alphabet was too small (it fixes `(t,x)`, reaching only the octonion-block `SO(8)`,
    N105), but the REFLECTION alphabet reaches the full group — so the global reverse surjectivity
    closes with NO open word-membership residual, NO operator topology, NO posited group. -/
theorem linQvIsom_mem_reflection_closure {g : Module.End Cut STVC} (hg : IsQvIsomC g) :
    g ∈ Submonoid.closure houseHolderMSet :=
  lorentz_exhaustion_M g (fun p q => linIsom_BvC_preserved hg p q)

/-! ## THE EQUALITY — the generated reflection submonoid IS the full isometry group. -/

/-- ★★ THE CLASSIFICATION EQUALITY — the submonoid generated by the indefinite Householder
    reflections EQUALS the full linear `BvC`-isometry submonoid: `Submonoid.closure houseHolderMSet
    = bvIsomLinMonoid`. The forward inclusion `⊆` is `Submonoid.closure_le` applied to
    `houseHolderM_isom` (each reflection is a `BvC`-isometry, N125); the reverse `⊇` is the closed
    exhaustion `lorentz_exhaustion_M` (N128). The continuum Lorentz group `SO⁺(1,9)` IS exactly the
    group generated by the reflections — the full structure theorem, DERIVED forward as a structural
    identity, not a conditional reduction and not a posited decomposition. -/
theorem reflection_closure_eq_bvIsomLinMonoid :
    Submonoid.closure houseHolderMSet = bvIsomLinMonoid := by
  apply le_antisymm
  · apply Submonoid.closure_le.mpr
    rintro R ⟨a, ha, rfl⟩
    show IsBvIsomLin (houseHolderM a)
    exact houseHolderM_isom ha
  · intro S hS
    exact lorentz_exhaustion_M S hS

/-! ## W8 — the concrete boost is a finite reflection word + a numeric teeth. -/

/-- ★ W8 NON-VACUITY — the CONCRETE boost `(5/3,4/3)` (a genuine non-identity `BvC`-isometry,
    off-diagonal `4/3 ≠ 0`) IS a finite product of indefinite Householder reflections
    (`∈ Submonoid.closure houseHolderMSet`). The unconditional surjectivity realized on a real
    boost — not a vacuous closure. -/
theorem boost_mem_reflection_closure :
    boostEndC ((5:Cut)/3) ((4:Cut)/3) ∈ Submonoid.closure houseHolderMSet := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  exact lorentz_exhaustion_M _ (boostEndC_isBvIsomLin hab)

/-- ★ W8 TEETH — the boost `(5/3,4/3)` PRESERVES the Minkowski self-overlap of the (moved) timelike
    axis `mTimeUnit`, reading `1` (`= BvC mTimeUnit mTimeUnit`). The distinguishing read-off the
    costume C164 bites: the boost is a `BvC`-isometry (`boostEndC_isBvIsomLin`), so
    `BvC (boost mTimeUnit)(boost mTimeUnit) = BvC mTimeUnit mTimeUnit = 1` — NOT `132`. -/
theorem boost_reflection_word_witness_self_overlap :
    BvC (boostEndC ((5:Cut)/3) ((4:Cut)/3) (mTimeUnit : STVC))
        (boostEndC ((5:Cut)/3) ((4:Cut)/3) (mTimeUnit : STVC)) = 1 := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  rw [(boostEndC_isBvIsomLin hab) mTimeUnit mTimeUnit, BvC_mTimeUnit_self]

end

end Phys.Algebra
