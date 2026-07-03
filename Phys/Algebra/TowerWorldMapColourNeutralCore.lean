/-
# N266 — THE COLOUR-NEUTRAL CORE OF THE MATTER CARRIER IS THE FOLD'S OWN COMPLEX LINE

Over the DERIVED octonion rung `O ℚ = CD (H ℚ)`, imaginary part `ImO`, the branching complement
`Vsub = 3 ⊕ 3̄` (N42c), and the fold's √−1 `u1`. N261–265 built the derived spinor's STRUCTURE
(Clifford relation, spin generators, the two so(7) faces, the two chiralities) and its INDIVISIBILITY
(N265: `O ℚ` is irreducible under the FULL worldMap — no zero divisors). THIS node takes the next
★1↔★3 beat: how the indivisible whole appears to the DERIVED colour subalgebra.

THE OBJECT. `colourCentralizer` (N201) is the g₂-stabilizer of the fold's own complex structure
`JO = L_{u1}` — colour is DERIVED, not posited, as the derivations of `O ℚ` commuting with the fold's
√−1. This node computes the JOINT KERNEL of colour acting on the full 8-dim matter carrier `O ℚ`
(not just the vector 7 = `ImO`, where N252 already found `span{u1}`):

  matterColourNeutral := ⨅ D : colourCentralizer, ker (D : End ℚ (O ℚ))

and proves it is EXACTLY `span{1, u1}` — the fold's OWN complex line ℂ (`u1² = −1`, closed under
multiplication, a 2-dim subalgebra), with complement the banked `Vsub`. So

  O ℚ = span{1, u1} ⊕ Vsub = ℂ ⊕ (3 ⊕ 3̄)   as colour-modules.

Colour is BLIND to precisely the fold's generative √−1 and its unit, and charges everything else.

THE DERIVATION (forward; each a theorem, foundations-only):
  colour_kills_u1                     — every colour derivation annihilates u1 on the full carrier
                                        (lift of `colour_kills_sgl` N245 through `imRep_coe`).
  matterColourNeutral                 — the colour joint-kernel on the full carrier `O ℚ`.
  span_one_u1_le_matterColourNeutral  — ⊇: `1` (killed by `derivQ_one`) and `u1` (killed by colour).
  matterColourNeutral_le_span_one_u1  — ⊆ (THE CRUX): reQ-split `x = reQ x•1 + w`, `w ∈ ImO`, `w`
                                        colour-fixed, so `w ∈ colourInvariants = span{u1}` (N252).
  matterColourNeutral_eq_span_one_u1  — ★★★ THE HEADLINE: the colour-neutral core = `span{1, u1}`.
  one_u1_linIndep / finrank_span_one_u1 = 2  — W8: the core is a genuine PLANE (not the ImO singlet,
                                        not 0). ADJOINS the real unit line to the vector-7 singlet.
  span_one_u1_mul_mem                 — ★★ span{1, u1} CLOSED under `·` (`u1² = −1`): the fold's ℂ
                                        SUBALGEBRA — the colour-invisible core IS the fold's complex numbers.
  neutral_disj_Vsub                   — `span{1, u1} ⊓ Vsub = ⊥`: the neutral core and the charged
                                        triplets share nothing.
  matter_colour_neutral_core          — ★★★ capstone: bundles the above.

THE DISSOLUTION (docs/STANDARD.md §0) — the MOAT. The division-algebra-physics field (Furey) IMPOSES
the complexified octonions `ℂ ⊗ O`, CHOOSES `SU(3)` as the automorphisms fixing a chosen complex
structure, and reads a generation's colour content `1 ⊕ 3 ⊕ 3̄` off a minimal ideal. The theory
DERIVES what it posits: the "ℂ" is NOT imposed — `span{1, u1}` FALLS OUT as the colour-neutral core,
and it IS the fold's own generative complex line (`u1` = the √−1 self-blindness forced at the very
first cascade step); and colour is NOT chosen — `colourCentralizer` is the g₂-stabilizer of `JO =
L_{u1}` (N201), forced by that same √−1. The chain fold → √−1 → CD → terminal `O ℚ` → `Der(O ℚ) = g₂`
→ colour = the g₂-stabilizer of the fold's √−1 → the carrier's colour-neutral core = that same √−1's
line is UNBROKEN, every arrow a banked theorem. NOVELTY is claimed ONLY for this forced fold-
derivation — NOT for the `1 ⊕ 3 ⊕ 3̄` decomposition pattern itself, which is in the literature.

ONE CAUSE MANY TERMINATIONS. The SAME fold-root `u1` (√−1) is: the first cascade step's complex unit;
the colour complex structure `JO = L_{u1}`; the axis whose g₂-stabilizer IS colour (N201/N252); AND
now the generator of the 2-dim colour-invisible core of the matter carrier — colour is blind to
exactly the line the fold started from.

⚠ SCOPE — HONESTY CLAUSE. Banks the colour-decomposition of the full matter carrier + the
neutral-core-IS-the-fold's-ℂ identification + the `Vsub` direct sum + non-vacuity ONLY. Does NOT bank
the charge/hypercharge VALUES on each multiplet (a later assignment node), NOT the full SM multiplet
classification, NOT parity, NOT the weak mixing angle (≥9× NAMED deferred, ascent tower — untouched).

PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete colour/matter/neutral/generation/lepton/quark:
the joint kernel of the banked Lie subalgebra `colourCentralizer` acting on the banked `O ℚ` is
EXACTLY the 2-dim multiplication-closed subalgebra `span{1, u1}` (`u1² = −1`), disjoint from the
banked `Vsub`; the full carrier is their direct sum (2 + 6 = 8). No theorem STATEMENT needs a physics
word. FREE-FLOATING check (SOUL rail): every headline TYPE mentions the banked tower objects
(`colourCentralizer`, `O ℚ`, `u1`, `Vsub`); the ⊆ crux routes through the g₂/octonion-SPECIFIC N252
(`colourInvariants_eq_span_sgl`, proved via a regular colour element forcing rank) — NOT a
carrier-agnostic fact.

Foundations-only: no posited axiom, no sorry-style hole, no compiled-kernel bypass, no bridge.
-/
import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationUpperBound
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.DerivationStabilizerSplit

open scoped Classical BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## Colour annihilates the fold's √−1 on the full carrier. -/

/-- ★ A colour derivation annihilates `u1` on the FULL carrier `O ℚ`. The lift of the banked
    `colour_kills_sgl` (N245, on `ImO`) through `imRep_coe`: `imRep D sgl = 0` in `End ℚ ImO`
    means `(D : End ℚ (O ℚ)) u1 = 0` since `(sgl : O ℚ) = u1`. -/
theorem colour_kills_u1 (D : colourCentralizer) :
    ((D : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0 := by
  have h := colour_kills_sgl (D : derivationLieQ) D.2
  have hc : ((imRep (D : derivationLieQ) sgl : ImO) : O ℚ)
      = ((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((sgl : ImO) : O ℚ) := imRepFun_coe _ _
  rw [h] at hc
  simpa using hc.symm

/-! ## The colour-neutral core of the full matter carrier. -/

/-- ★ THE COLOUR-NEUTRAL CORE of the full 8-dim matter carrier `O ℚ`: the joint kernel of every
    colour derivation acting on `O ℚ` (not just on the vector 7 = `ImO`, where N252 found `span{u1}`).
    The colour-invisible part of matter. -/
noncomputable def matterColourNeutral : Submodule ℚ (O ℚ) :=
  ⨅ D : colourCentralizer, LinearMap.ker ((D : derivationLieQ) : Module.End ℚ (O ℚ))

/-- ⊇ : `span{1, u1}` is colour-neutral — `1` is killed by every derivation (`derivQ_one`) and `u1`
    by every colour derivation (`colour_kills_u1`). -/
theorem span_one_u1_le_matterColourNeutral :
    Submodule.span ℚ {(1 : O ℚ), u1} ≤ matterColourNeutral := by
  rw [Submodule.span_le]
  intro x hx
  rw [SetLike.mem_coe, matterColourNeutral, Submodule.mem_iInf]
  intro D
  rw [LinearMap.mem_ker]
  have hD : IsDerivQ ((D : derivationLieQ) : Module.End ℚ (O ℚ)) := (D : derivationLieQ).2
  rcases hx with h1 | hu1
  · rw [h1]; exact derivQ_one _ hD
  · rw [Set.mem_singleton_iff] at hu1; rw [hu1]; exact colour_kills_u1 D

/-- ⊆ (THE CRUX): every colour-neutral `x` lies in `span{1, u1}`. Split `x = reQ x • 1 + w` with
    `w ∈ ImO`; each colour `D` kills `x` and kills `reQ x • 1` (`derivQ_one`), so it kills `w`, hence
    `⟨w, _⟩ ∈ colourInvariants = span{u1}` (N252 `colourInvariants_eq_span_sgl`), giving `w = c • u1`
    and `x = reQ x • 1 + c • u1 ∈ span{1, u1}`. Lifts N252 from its `ImO`-shadow to the full carrier. -/
theorem matterColourNeutral_le_span_one_u1 :
    matterColourNeutral ≤ Submodule.span ℚ {(1 : O ℚ), u1} := by
  intro x hx
  rw [matterColourNeutral, Submodule.mem_iInf] at hx
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
  have hker : (⟨w, hwIm⟩ : ImO) ∈ colourInvariants := by
    rw [colourInvariants, Submodule.mem_iInf]
    intro D
    rw [LinearMap.mem_ker]
    apply Subtype.ext
    rw [imRep_coe]
    show ((D : derivationLieQ) : Module.End ℚ (O ℚ)) w = ((0 : ImO) : O ℚ)
    have hD : IsDerivQ ((D : derivationLieQ) : Module.End ℚ (O ℚ)) := (D : derivationLieQ).2
    have hx0 : ((D : derivationLieQ) : Module.End ℚ (O ℚ)) x = 0 := hx D
    have h1 : ((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((reQ x) • (1 : O ℚ)) = 0 := by
      rw [map_smul, derivQ_one _ hD, smul_zero]
    rw [hw, map_sub, hx0, h1, sub_zero]
    rfl
  rw [colourInvariants_eq_span_sgl, Submodule.mem_span_singleton] at hker
  obtain ⟨c, hc⟩ := hker
  have hwc : w = c • u1 := by
    have := congrArg (Subtype.val) hc
    simpa [SetLike.val_smul] using this.symm
  have hxsplit : x = (reQ x) • (1 : O ℚ) + c • u1 := by
    rw [← hwc, hw]; abel
  rw [hxsplit]
  apply Submodule.add_mem
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by left; rfl))
  · exact Submodule.smul_mem _ _ (Submodule.subset_span (by right; rfl))

/-- ★★★ THE HEADLINE: the colour-neutral core of the full matter carrier is EXACTLY the fold's own
    complex line `span{1, u1}`. Colour is blind to precisely the fold's √−1 and its unit. -/
theorem matterColourNeutral_eq_span_one_u1 :
    matterColourNeutral = Submodule.span ℚ {(1 : O ℚ), u1} :=
  le_antisymm matterColourNeutral_le_span_one_u1 span_one_u1_le_matterColourNeutral

/-! ## Non-vacuity: the core is a genuine 2-dim plane, closed under multiplication (the fold's ℂ). -/

/-- `1` and `u1` are ℚ-linearly independent (`1` is real, `u1` imaginary). -/
theorem one_u1_linIndep : LinearIndependent ℚ ![(1 : O ℚ), u1] := by
  rw [LinearIndependent.pair_iff]
  intro s t hst
  have hru1 : reQ u1 = 0 := reQ_ImO_zero u1_mem_ImO
  have h := congrArg reQ hst
  rw [reQ_add, reQ_smul, reQ_smul, reQ_one, hru1, mul_zero, add_zero, mul_one] at h
  simp only [reQ] at h
  have hs : s = 0 := by simpa using h
  refine ⟨hs, ?_⟩
  rw [hs, zero_smul, zero_add] at hst
  rcases eq_or_ne t 0 with ht | ht
  · exact ht
  · exact absurd ((smul_eq_zero.mp hst).resolve_left ht) u1_ne_zero

/-- ★★ W8 TEETH: the colour-neutral core is EXACTLY 2-dimensional — a genuine PLANE. It ADJOINS the
    real unit line to the vector-7 colour singlet `span{u1}` (N252). Not 0, not the 1-dim singlet. -/
theorem finrank_matterColourNeutral : Module.finrank ℚ matterColourNeutral = 2 := by
  rw [matterColourNeutral_eq_span_one_u1]
  have h2 : Submodule.span ℚ {(1 : O ℚ), u1}
      = Submodule.span ℚ (Set.range ![(1 : O ℚ), u1]) := by
    congr 1
    rw [Matrix.range_cons_cons_empty]
  rw [h2, finrank_span_eq_card one_u1_linIndep, Fintype.card_fin]

/-- ★★ THE FOLD'S ℂ: `span{1, u1}` is CLOSED under multiplication (`u1² = −1`, `complexUnit_sq`).
    The colour-invisible core of matter is not merely a subspace but the fold's own complex numbers —
    a 2-dim subalgebra of the terminal division algebra `O ℚ`. -/
theorem span_one_u1_mul_mem {x y : O ℚ}
    (hx : x ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (hy : y ∈ Submodule.span ℚ {(1 : O ℚ), u1}) :
    x * y ∈ Submodule.span ℚ {(1 : O ℚ), u1} := by
  rw [Submodule.mem_span_pair] at hx hy
  obtain ⟨a, b, hxab⟩ := hx
  obtain ⟨c, d, hycd⟩ := hy
  rw [← hxab, ← hycd, Submodule.mem_span_pair]
  refine ⟨a * c - b * d, a * d + b * c, ?_⟩
  have h1 : (u1 : O ℚ) * u1 = -1 := complexUnit_sq
  have e1 : (a • (1 : O ℚ)) * (c • (1 : O ℚ)) = (a * c) • (1 : O ℚ) := by
    rw [qsmul_mul_left, qsmul_mul_right, mul_one, smul_smul]
  have e2 : (a • (1 : O ℚ)) * (d • u1) = (a * d) • u1 := by
    rw [qsmul_mul_left, qsmul_mul_right, one_mul, smul_smul]
  have e3 : (b • u1) * (c • (1 : O ℚ)) = (b * c) • u1 := by
    rw [qsmul_mul_left, qsmul_mul_right, mul_one, smul_smul]
  have e4 : (b • u1) * (d • u1) = (b * d) • (-1 : O ℚ) := by
    rw [qsmul_mul_left, qsmul_mul_right, h1, smul_smul]
  rw [add_mul, mul_add, mul_add, e1, e2, e3, e4]
  module

/-- ★ The colour-neutral core and the charged complement `Vsub = 3 ⊕ 3̄` share nothing:
    `span{1, u1} ⊓ Vsub = ⊥`. (`Vsub ≤ ImO` kills the real part, forcing `x ∈ span{u1} = singlet`,
    disjoint from `Vsub` by N42c `singlet_disj_Vsub`.) -/
theorem neutral_disj_Vsub : Disjoint (Submodule.span ℚ {(1 : O ℚ), u1}) Vsub := by
  rw [Submodule.disjoint_def]
  intro x hx hxV
  rw [Submodule.mem_span_pair] at hx
  obtain ⟨s, t, hst⟩ := hx
  have hxIm : x ∈ ImO := Vsub_le_ImO hxV
  have hrx : reQ x = 0 := reQ_ImO_zero hxIm
  rw [← hst, reQ_add, reQ_smul, reQ_smul, reQ_one, reQ_ImO_zero u1_mem_ImO,
    mul_zero, add_zero, mul_one] at hrx
  rw [hrx, zero_smul, zero_add] at hst
  have hxsgl : x ∈ singlet := by
    rw [singlet, Submodule.mem_span_singleton]; exact ⟨t, hst⟩
  have := singlet_disj_Vsub.le_bot ⟨hxsgl, hxV⟩
  simpa using this

/-- ★★★ THE CAPSTONE: the DERIVED colour subalgebra decomposes the full INDIVISIBLE matter carrier
    `O ℚ` as `ℂ ⊕ (3 ⊕ 3̄)`. The colour-neutral core is EXACTLY the fold's own complex line
    `span{1, u1}` (dim 2, multiplication-closed = the fold's ℂ), disjoint from the charged complement
    `Vsub`. Colour is blind to precisely the fold's generative √−1 and unit — DERIVED, not posited. -/
theorem matter_colour_neutral_core :
    matterColourNeutral = Submodule.span ℚ {(1 : O ℚ), u1}
    ∧ Module.finrank ℚ matterColourNeutral = 2
    ∧ (∀ x y : O ℚ, x ∈ Submodule.span ℚ {(1 : O ℚ), u1} →
        y ∈ Submodule.span ℚ {(1 : O ℚ), u1} → x * y ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    ∧ Disjoint (Submodule.span ℚ {(1 : O ℚ), u1}) Vsub :=
  ⟨matterColourNeutral_eq_span_one_u1, finrank_matterColourNeutral,
    fun _ _ hx hy => span_one_u1_mul_mem hx hy, neutral_disj_Vsub⟩

end Phys.Algebra
