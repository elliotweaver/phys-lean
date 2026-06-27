/-
  Phys.Algebra.LorentzContinuumGenerationFullSO9Assembly — N114: THE FULL-`SO(9)`
  ASSEMBLY THROUGH THE GENERAL-AXIS FAMILY (the concrete higher-sector witness; the
  NON-DEGENERATE analogue of N112's `enlargedTwoPlaneNinth`). N112's measure-first
  finding: the single real-axis ninth plane `planeRotLin c s` COMMUTES with every
  octonion-block word, so `enlargedTwoPlaneNinth u w c s := planeRotLin c s ·
  genTwoPlaneLin u w` DEGENERATES to the `SO(8)·A` PRODUCT sector (`kakWordLin_degenerate`)
  — a single `A`-plane is structurally INSUFFICIENT for the full compact `SO(9)`. N113
  banked the genuine remainder: the GENERAL-AXIS ninth rotation `axisRotLin e c s`
  (reading the `e`-component `gFormC v e`, the `e = 1` case IS `planeRotLin`), a
  `QvC`-isometry in the enlarged family `genIsomMonoidLinFamily`, which does NOT commute
  with the words (`axisRotLin_word_not_commute`).

  ===========================================================================
  WHAT THIS NODE BANKS — the concrete full-`SO(9)` higher-sector witness. The
  NON-DEGENERATE enlarged element `enlargedAxisNinth e u w c s := axisRotLin e c s ·
  genTwoPlaneLin u w` (where N112's `enlargedTwoPlaneNinth` is the `e = 1` degenerate
  case, `planeRotLin = axisRotLin 1`). For the cascade's terminal imaginary unit `e₂`,
  the witness moves BOTH `x` AND a DEEP octonion slot:

      `enlargedAxisNinth e₂ u w c s (0,1,0) = (0, c, s•e₂)`

  — the octonion-block word fixes the zero-`v` point `(0,1,0)`, then the general-axis
  rotation `axisRotLin e₂ c s` sends `x = 1 ↦ x' = c` AND deposits an `e₂`-component
  `s•e₂` into the `v`-block. Reading the `e₂`-component `gFormC (s•e₂) e₂ = s`
  (`enlargedAxisNinth_e2_reads_s`) shows the general axis genuinely REACHES the deep
  `e₂` slot. By contrast the single `A`-plane element leaves it untouched:
  `enlargedTwoPlaneNinth u w c s (0,1,0)` has `e₂`-component `0`
  (`enlargedTwoPlaneNinth_e2_reads_zero`, the single real-axis plane deposits only a
  `1`-component, orthogonal to `e₂` by `e2_gFormC_one`).

  ★★ THE SEPARATOR (`enlargedAxisNinth_ne_enlargedTwoPlaneNinth`): for `s ≠ 0` the
  general-axis witness DIFFERS from EVERY single-`A`-plane element `enlargedTwoPlaneNinth
  u' w' c' s'` — the `e₂` deep slot reads `s` vs `0`. The general-axis family reaches a
  compact isometry STRICTLY BEYOND the `SO(8)·A` product sector that the single `A`-plane
  (the degenerate `e = 1` slice) generates — the honest "strictly higher sector" the N112
  finding demanded, now witnessed by a concrete sector-separating coordinate.

  ── WHAT THIS NODE BANKS ──
  `enlargedAxisNinth` — the general-axis enlarged element (the non-degenerate analogue).
  `genIsomMonoidLin_le_family` — the `biMulLin`-word submonoid ≤ the full family submonoid.
  `enlargedAxisNinth_mem` — SOUND: ∈ `genIsomMonoidLinFamily`.
  `enlargedAxisNinth_isQvIsomC` — a `QvC`-isometry (via family soundness).
  ★ `enlargedAxisNinth_e2_apply` — `(0,1,0) ↦ (0, c, s•e₂)`: moves BOTH `x` AND a deep slot.
  `enlargedAxisNinth_e2_moves_x` — `x`-image `= c`.
  ★ `enlargedAxisNinth_e2_reads_s` — the `e₂`-component of the moved `v`-block `= s`.
  ★ `enlargedTwoPlaneNinth_e2_reads_zero` — the single `A`-plane element's `e₂`-component `= 0`.
  `enlargedAxisNinth_e2_not_mem_genIsomMonoidLin` — not a pure `SO(8)` word (`c ≠ 1`).
  ★★ `enlargedAxisNinth_ne_enlargedTwoPlaneNinth` — THE SEPARATOR: ≠ every single-`A`-plane
    element for `s ≠ 0` (strictly beyond `SO(8)·A`).
  `five_twelve_thirteen_sq` / `twelve_thirteenths_ne_zero` / `enlargedAxisNinth_e2_deep_val`
    — W8 teeth: the concrete witness `(5/13, 12/13)` reads deep `e₂`-slot `12/13`.

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: `axisRotLin` / `axisRotLin_apply` /
  `axisRotLin_mem_genIsomMonoidLinFamily` / `genIsomMonoidLinFamily` /
  `genIsomMonoidLinFamily_isQvIsomC` / `genIsomMonoidLinPlus_le_genIsomMonoidLinFamily`
  (N113); `genTwoPlaneLin` / `genTwoPlaneLin_mem_genLin` / `genIsomMonoidLin` (N100/N106);
  `genTwoPlaneLin_fixes_zero_v` / `enlargedTwoPlaneNinth` /
  `genIsomMonoidLin_le_genIsomMonoidLinPlus` (N106); `planeRotLin` / `planeRotLin_apply` /
  `genIsomMonoidLin_fixes_snd` / `reQC_zero` (N105); `gFormC` / `gFormC_zero_left` /
  `gFormC_smul_left` / `gFormC_symm` (N-LieAlgebra); `e2_gFormC_self` (N53) /
  `e2_gFormC_one` (N-Rotation); the `Module.End` / `Submonoid` MACHINERY on the DERIVED
  objects (STANDARD §3) — over the derived ℝ `ContinuumQ.Cut` and the terminal algebra
  `O Cut := CD (H Cut)`. NOT a posited Lorentz group / SO⁺(1,9), NOT a posited operator
  topology, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature posits the full
  `Spin(9)` / `SO(9)` and reads off its `SO(8)·A·SO(8)` (KAK/Cartan) decomposition. Here
  the assembly is built FORWARD from the trunk, gap by measured gap: N112 measured the
  single real-axis plane degenerates to `SO(8)·A`; N113 adjoined the general-axis family
  and proved the non-commutation; THIS node banks the concrete general-axis element and
  proves it reaches a deep octonion slot strictly beyond the `SO(8)·A` sector — not a
  posited decomposition but a forced, witnessed separator.

  ── THE FORWARD REMAINDER (childed N115) ──
  The GLOBAL exhaustion (every compact `QvC`-isometry of the `x ⊕ 𝕆` sector is a finite
  enlarged-family word — the full surjectivity) and the literal operator TOPOLOGY over
  `Cut` (`TopologicalSpace (Module.End Cut STVC)` / `ContinuousLinearMap` so the N96 affine
  path is CONTINUOUS) remain the HEAVY group-manifold core Mathlib lacks over the derived
  `Cut` — the W1 dissolution remainder. THIS node banks the concrete non-degenerate
  higher-sector witness and the sector separator — the immediately-bankable structural
  piece of ROADMAP §N114 priority (ii).

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / rotation / axis / isometry / compact / orthogonal / SO(9) / SO(8) /
  A-plane / A-torus / ninth-direction / octonion-block / word / 2-plane / sector / assembly
  / family / separator / Spin / KAK / Cartan / half-turn": what remains is pure linear
  algebra over the derived complete ordered field `Cut` — for `e : O Cut` with `gFormC e e
  = 1`, the operator `axisRotLin e c s · genTwoPlaneLin u w` of `Module.End Cut (Cut × Cut
  × O Cut)`, in the submonoid generated by the axis-rotations and the bimultiplications,
  sends `(0,1,0)` to `(0,c,s•e₂)` so that `gFormC` of its third-coordinate block with `e₂`
  is `s`, whereas `planeRotLin c s · genTwoPlaneLin u w` sends it to a block whose `gFormC`
  with `e₂` is `0`; hence the two operators differ whenever `s ≠ 0`. No theorem STATEMENT
  needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is
  the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationNinthFamily

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The general-axis enlarged element (the non-degenerate analogue of N112's `enlargedTwoPlaneNinth`). -/

/-- THE GENERAL-AXIS ENLARGED ELEMENT `enlargedAxisNinth e u w c s`: an octonion-block two-plane
    rotation `genTwoPlaneLin u w` (a banked `biMulLin` word, the `SO(8)` factor) composed with the
    GENERAL-AXIS ninth rotation `axisRotLin e c s` (the non-degenerate ninth factor, N113). N112's
    `enlargedTwoPlaneNinth u w c s = planeRotLin c s · genTwoPlaneLin u w` is the DEGENERATE `e = 1`
    slice (`planeRotLin = axisRotLin 1`, which commutes with the words and lands in the `SO(8)·A`
    product sector). Here the general axis `e` does NOT degenerate. -/
def enlargedAxisNinth (e u w : O Cut) (c s : Cut) : Module.End Cut STVC :=
  axisRotLin e c s * genTwoPlaneLin u w

/-- The `biMulLin`-word submonoid `genIsomMonoidLin` is contained in the FULL ninth-direction family
    submonoid `genIsomMonoidLinFamily` (transitivity: `genIsomMonoidLin ≤ genIsomMonoidLinPlus ≤
    genIsomMonoidLinFamily`, N106/N113). -/
theorem genIsomMonoidLin_le_family :
    genIsomMonoidLin ≤ genIsomMonoidLinFamily :=
  le_trans genIsomMonoidLin_le_genIsomMonoidLinPlus genIsomMonoidLinPlus_le_genIsomMonoidLinFamily

/-- SOUNDNESS — the general-axis enlarged element lies in the full family submonoid: a product of a
    general-axis ninth generator (`axisRotLin_mem_genIsomMonoidLinFamily`, unit axis + circle point)
    and a `biMulLin` word (`genTwoPlaneLin_mem_genLin`, carried in via `genIsomMonoidLin_le_family`),
    closed under `mul_mem`. -/
theorem enlargedAxisNinth_mem (e u w : O Cut) (c s : Cut)
    (he : gFormC e e = 1) (hu : gFormC u u = 1) (hw : gFormC w w = 1) (h : c ^ 2 + s ^ 2 = 1) :
    enlargedAxisNinth e u w c s ∈ genIsomMonoidLinFamily :=
  mul_mem (axisRotLin_mem_genIsomMonoidLinFamily e c s he h)
    (genIsomMonoidLin_le_family (genTwoPlaneLin_mem_genLin u w hu hw))

/-- The general-axis enlarged element is a `QvC`-isometry — directly from family soundness
    (`genIsomMonoidLinFamily_isQvIsomC`), since it is an enlarged-family word. No coordinate grind. -/
theorem enlargedAxisNinth_isQvIsomC (e u w : O Cut) (c s : Cut)
    (he : gFormC e e = 1) (hu : gFormC u u = 1) (hw : gFormC w w = 1) (h : c ^ 2 + s ^ 2 = 1) :
    IsQvIsomC (enlargedAxisNinth e u w c s) :=
  genIsomMonoidLinFamily_isQvIsomC (enlargedAxisNinth_mem e u w c s he hu hw h)

/-! ## The concrete higher-sector witness — moves BOTH `x` AND a deep octonion slot. -/

/-- ★ THE WITNESS at `(0,1,0)`: `enlargedAxisNinth e₂ u w c s (0,1,0) = (0, c, s•e₂)`. The
    octonion-block word `genTwoPlaneLin u w` FIXES the zero-`v` point `(0,1,0)`
    (`genTwoPlaneLin_fixes_zero_v`), then the general-axis rotation `axisRotLin e₂ c s` sends
    `x = 1 ↦ x' = c·1 − s·gFormC 0 e₂ = c` AND deposits `(s·1 + (c−1)·gFormC 0 e₂)•e₂ = s•e₂` into the
    `v`-block (`gFormC 0 e₂ = 0`, `gFormC_zero_left`). The witness moves BOTH `x` AND a DEEP octonion
    slot — the genuine higher-sector motion. -/
theorem enlargedAxisNinth_e2_apply (u w : O Cut) (c s : Cut) :
    enlargedAxisNinth (CD.e2 : O Cut) u w c s ((0:Cut), (1:Cut), (0:O Cut))
      = ((0:Cut), c, s • (CD.e2 : O Cut)) := by
  show axisRotLin (CD.e2 : O Cut) c s (genTwoPlaneLin u w ((0:Cut), (1:Cut), (0:O Cut))) = _
  rw [genTwoPlaneLin_fixes_zero_v u w (0:Cut) (1:Cut), axisRotLin_apply]
  show ((0:Cut), c * 1 - s * gFormC (0 : O Cut) (CD.e2 : O Cut),
        (0:O Cut) + (s * 1 + (c - 1) * gFormC (0 : O Cut) (CD.e2 : O Cut)) • (CD.e2 : O Cut))
      = ((0:Cut), c, s • (CD.e2 : O Cut))
  rw [gFormC_zero_left]
  refine Prod.ext rfl (Prod.ext ?_ ?_)
  · show c * 1 - s * 0 = c; ring
  · show (0:O Cut) + (s * 1 + (c - 1) * 0) • (CD.e2 : O Cut) = s • (CD.e2 : O Cut)
    rw [zero_add]; congr 1; ring

/-- The general-axis witness moves `x`: applied to `(0,1,0)`, the `x`-image is `c`. -/
theorem enlargedAxisNinth_e2_moves_x (u w : O Cut) (c s : Cut) :
    (enlargedAxisNinth (CD.e2 : O Cut) u w c s ((0:Cut), (1:Cut), (0:O Cut))).2.1 = c := by
  rw [enlargedAxisNinth_e2_apply]

/-- ★ THE DEEP-SLOT READING — the `e₂`-component of the moved `v`-block is `s`:
    `gFormC (s•e₂) e₂ = s·gFormC e₂ e₂ = s` (`gFormC_smul_left`, `e2_gFormC_self`). The general axis
    genuinely REACHES the deep `e₂` octonion slot. -/
theorem enlargedAxisNinth_e2_reads_s (u w : O Cut) (c s : Cut) :
    gFormC ((enlargedAxisNinth (CD.e2 : O Cut) u w c s ((0:Cut), (1:Cut), (0:O Cut))).2.2)
      (CD.e2 : O Cut) = s := by
  rw [enlargedAxisNinth_e2_apply]
  show gFormC (s • (CD.e2 : O Cut)) (CD.e2 : O Cut) = s
  rw [gFormC_smul_left, e2_gFormC_self]; ring

/-- ★ THE COMPLEMENT — the single `A`-plane element `enlargedTwoPlaneNinth u w c s` (N112) leaves the
    `e₂` octonion slot UNTOUCHED: applied to `(0,1,0)`, its `v`-block is `(s·1)•1`, a pure
    `1`-component, whose `e₂`-overlap is `gFormC ((s)•1) e₂ = s·gFormC 1 e₂ = 0` (`gFormC_smul_left`,
    `e2_gFormC_one`: `1 ⟂ e₂`). The single real-axis plane cannot reach the `e₂` slot. -/
theorem enlargedTwoPlaneNinth_e2_reads_zero (u w : O Cut) (c s : Cut) :
    gFormC ((enlargedTwoPlaneNinth u w c s ((0:Cut), (1:Cut), (0:O Cut))).2.2)
      (CD.e2 : O Cut) = 0 := by
  show gFormC ((planeRotLin c s (genTwoPlaneLin u w ((0:Cut), (1:Cut), (0:O Cut)))).2.2)
      (CD.e2 : O Cut) = 0
  rw [genTwoPlaneLin_fixes_zero_v u w (0:Cut) (1:Cut), planeRotLin_apply]
  show gFormC ((0:O Cut) + (s * 1 + (c - 1) * reQC (0:O Cut)) • (1 : O Cut)) (CD.e2 : O Cut) = 0
  rw [reQC_zero, zero_add, gFormC_smul_left, e2_gFormC_one]; ring

/-- For `c ≠ 1`, the general-axis enlarged element is NOT a `biMulLin` word: it moves `x`
    (`enlargedAxisNinth_e2_moves_x`) while every `biMulLin` word fixes `x` (`genIsomMonoidLin_fixes_snd`,
    N105). A genuine higher-sector compact rotation realised by the enlarged FAMILY that the
    octonion-block words provably cannot. -/
theorem enlargedAxisNinth_e2_not_mem_genIsomMonoidLin (u w : O Cut) (c s : Cut) (hc : c ≠ 1) :
    enlargedAxisNinth (CD.e2 : O Cut) u w c s ∉ genIsomMonoidLin := by
  intro hmem
  have hfix := genIsomMonoidLin_fixes_snd hmem ((0:Cut), (1:Cut), (0:O Cut))
  rw [enlargedAxisNinth_e2_moves_x u w c s] at hfix
  exact hc hfix

/-- ★★ THE SECTOR SEPARATOR — for `s ≠ 0` the general-axis witness `enlargedAxisNinth e₂ u w c s`
    DIFFERS from EVERY single-`A`-plane element `enlargedTwoPlaneNinth u' w' c' s'`. Reading the `e₂`
    deep slot of both at `(0,1,0)`: the general axis reads `s` (`enlargedAxisNinth_e2_reads_s`), the
    single `A`-plane reads `0` (`enlargedTwoPlaneNinth_e2_reads_zero`); if they were equal both
    readings would coincide, forcing `s = 0`. The general-axis family reaches a compact `QvC`-isometry
    STRICTLY BEYOND the `SO(8)·A` product sector that the single `A`-plane (the degenerate `e = 1`
    slice) generates — the "strictly higher sector" the N112 finding demanded, witnessed by a
    sector-separating coordinate. -/
theorem enlargedAxisNinth_ne_enlargedTwoPlaneNinth (u w u' w' : O Cut) (c s c' s' : Cut)
    (hs : s ≠ 0) :
    enlargedAxisNinth (CD.e2 : O Cut) u w c s ≠ enlargedTwoPlaneNinth u' w' c' s' := by
  intro heq
  have h := congrArg
    (fun K => gFormC ((K ((0:Cut), (1:Cut), (0:O Cut))).2.2) (CD.e2 : O Cut)) heq
  simp only at h
  rw [enlargedAxisNinth_e2_reads_s, enlargedTwoPlaneNinth_e2_reads_zero] at h
  exact hs h

/-! ## W8 teeth — the concrete higher-sector witness `(5/13, 12/13)`. -/

/-- The W8 witness circle point `(5/13, 12/13)` lies on the unit circle over the derived ℝ. -/
theorem five_twelve_thirteen_sq : ((5:Cut)/13) ^ 2 + ((12:Cut)/13) ^ 2 = 1 := by norm_num

/-- `12/13 ≠ 0` over the derived ℝ — the witness has nonzero `s`, so the separator bites. -/
theorem twelve_thirteenths_ne_zero : ((12:Cut)/13) ≠ 0 := by norm_num

/-- ★ W8 — the concrete witness `(c,s) = (5/13, 12/13)`: the general-axis enlarged element
    `enlargedAxisNinth e₂ u w (5/13) (12/13)` applied to `(0,1,0)` reads deep `e₂`-slot `12/13` (the
    general axis reaches the deep slot with coefficient `s = 12/13`), DISTINCT from the `0` of every
    single-`A`-plane element — the sector separation made concrete. -/
theorem enlargedAxisNinth_e2_deep_val (u w : O Cut) :
    gFormC ((enlargedAxisNinth (CD.e2 : O Cut) u w ((5:Cut)/13) ((12:Cut)/13)
        ((0:Cut), (1:Cut), (0:O Cut))).2.2) (CD.e2 : O Cut) = (12:Cut)/13 :=
  enlargedAxisNinth_e2_reads_s u w ((5:Cut)/13) ((12:Cut)/13)

end

end Phys.Algebra
