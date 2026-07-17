/-
  # N### — ARC-D (THE DIGITS): THE NARROWING CAMPAIGN, NODE 8 (D5-next-7)

  Directed successor of D5-next-6 (`Phys/Algebra/NarrowedBracket6.lean`). The eighth narrowing rung.

  ## The updated bottleneck (the anti-drift crux this node acts on)

  After D5-next-6 the parent flagged that the exp instrument had SATURATED the current `m01` floor
  `[3477.4707, 3477.4761]` (its `cutLog` reading was within `≈ 4×10⁻⁷` of the true `cutLog(m01)` at each
  end), so a deeper exp index buys almost nothing — the binding lever is the `m01` floor ITSELF. This
  node acts on exactly that: it reads the SAME derived cycle-phase cosine numeral `cutCos(2/9)` ONE TERM
  DEEPER (split@5 via the banked `cutCos_bracket`, the ONE-CAUSE instrument) and re-propagates through the
  banked Born-square amplitude chain to a `≈ 50×` tighter `m01`, which crushes `cutLog` `≈ 38×`. It also
  takes the CHEAP `1/cutPi` upper-sign tick (split@6 sign one `1e8`-tick nearer the true zero).

  ## Front (1): the sharpened `cutLog` — a `≈ 50×` tighter `m01` from the split@5 cosine read

  The parent's Born-square amplitude brackets `b0`/`b1` rested on `pB = cutCos(2/9)` read at split@4
  (`pB ∈ [975410084/1e9, 975410086/1e9]`, width `2×10⁻⁹`). Reading the SAME numeral at split@5 (one more
  term of the same alternating series, `partialCos (2/9) 5 = 13226284829/13559717115`, remainder
  `cosRemBound (2/9) 5 ≈ 8.1×10⁻¹⁴`) crushes `pB` to `[9754100853/1e10, 4877050427/5e9]` (width `10⁻¹⁰`).
  Re-propagating with `√2` sharpened to `10⁻¹²` and the conic root `r = √(3 − 3p²)`, the products `w·p`,
  `w·r`, the amplitudes `b0`, `b1`, and the Born-square masses give the DIRECT quotient

        m01 = mass0/mass1 ∈ [3477.472814, 3477.472936]   (width `≈ 1.2×10⁻⁴`, `≈ 44×` tighter than the
                                                           parent's `[3477.4707, 3477.4761]`)

  Feeding this into the D1 exp instrument at partial-sum index `27` (lower) / `30` (upper) gives

        cutLog(mass0/mass1) ∈ [815406110/1e8, 815406115/1e8]   (width `5×10⁻⁸`)

  — `≈ 38×` narrower than the parent's `[81540604/1e7, 81540623/1e7]` (width `1.9×10⁻⁶`) and NESTED inside
  it. The `m01` floor was NOT irreducible; reading the SAME cosine numeral one term deeper sharpens it.

  ## Front (2): `1/cutPi` — the cheap split@6 upper-sign tick

  The parent read the split@6 upper sign at `157079635/1e8`; this node reads it one `1e8`-tick nearer the
  true zero at `157079634/1e8` (only `1.3×10⁻⁸` above the true `π/2 · 1e8 = 157079632.7`). Keeping the
  banked near-`π/4` double-angle lower bound (`le_leastCosZero_157079620`), hence

        leastCosZero ∈ [157079620/1e8, 157079634/1e8]
        cutPi        ∈ [31415924/1e7, 78539817/25000000]
        1/cutPi      ∈ [25000000/78539817, 2500000/7853981]  (width `≈ 2.8×10⁻⁸`)

  — nested strictly inside the parent's `[10000000/31415927, 10000000/31415924]`. (The double-angle LOWER
  bound is at a hard `nlinarith`-margin ceiling near `π/2` — pushing it past `157079620/1e8` fails the
  positivity certificate; that is a W9 instrument-cost ceiling flagged for the successor, NOT a theory
  wall. `1/cutPi` is now the DOMINANT residual after `cutLog`'s `≈ 38×` collapse.)

  ## The re-composed numeral

  Running the banked D4 pipeline (`endpoint_assembled_bracket` at census `d = chargeTraceDepth = 16/3`)
  with BOTH sharpened residuals:

        48029320130/706858353 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 4802931616/70685829

  a certified two-sided rational bracket of `Cut` of width `≈ 4.40×10⁻⁷` — `≈ 3.45×` narrower than the
  parent's `≈ 1.52×10⁻⁶` and NESTED strictly inside it. The campaign's eighth rung.

  ⚠ HONEST GRADE: THEOREM-route, CERTIFIED (certified two-sided rational brackets of closed reals of the
  derived `Cut`). Still WIDE relative to measured precision; the campaign continues. ★ THE UPDATED
  BOTTLENECK: after this node `cutLog`'s contribution has collapsed to `≈ 2.8×10⁻⁹` while `1/cutPi`'s is
  `≈ 4.4×10⁻⁷` — `1/cutPi` is now the SOLE binding residual, and its double-angle LOWER bound is at a
  `nlinarith`-margin ceiling near `π/2`. The successor should attack `1/cutPi`'s lower bound with a
  structural positivity route (a factored SOS certificate, or a monotone reduction to a banked identity)
  rather than deeper `nlinarith` grinding; `cutLog` can be sharpened further cheaply (split@6 `pB`) if
  needed but is no longer binding.

  ⚠ NO-FIT: every endpoint is chosen by where the derived series' sign/bracket is CERTIFIABLE at the
  chosen index, NEVER by where the measured `1/α(0) ≈ 137.036` sits (the derived value lands `≈ 67.9476`,
  nowhere near it). The measured `1/α(0)` and `π` appear ONLY in this removable prose. Words-removable:
  every theorem below is a statement about certified rational brackets of a derived closed real of `Cut`.

  Import guard: `NarrowedBracket6` only (transitively the whole banked chain). NO Mathlib ℝ/ℂ as content,
  NO `Real.pi`/`Real.cos`/`Real.exp`, NO kernel-eval decision procedures, NO floats in production.
  Foundations-only.
-/
import Phys.Algebra.NarrowedBracket6

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! ## (A) FRONT (2): `1/cutPi` — the split@6 upper-sign tick one `1e8` nearer the true zero.

    The parent read the split@6 upper sign at `157079635/1e8`; this node reads it at `157079634/1e8`
    (only `1.3×10⁻⁸` above the true `π/2 · 1e8`). The near-`π/4` double-angle LOWER bound is kept from the
    parent (`le_leastCosZero_157079620`) — it is at a hard `nlinarith`-margin ceiling near `π/2`. -/

/-- THE SHARPER UPPER SIGN: `cutCos (157079634/1e8) < 0`. Read directly off the banked `cutCos_bracket`
    at split@6 (an EXACT rational near-cancellation `norm_num` handles). `157079634/1e8` is only
    `1.3×10⁻⁸` above the true `π/2` (parent's `157079635/1e8` was `2.3×10⁻⁸` above). -/
theorem cutCos_157079634_neg : cutCos (157079634 / 100000000 : Cut) < 0 := by
  have hx0 : (0 : Cut) ≤ 157079634 / 100000000 := by norm_num
  have hxN : (157079634 / 100000000 : Cut) ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (157079634 / 100000000) hx0 6 hxN).2
  rw [partialCos_six] at hb
  have hrem : cosRemBound (157079634 / 100000000 : Cut) 6 ≤ 47757 / 100000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (157079634 / 100000000) ^ 2 / 2 + (157079634 / 100000000) ^ 4 / 24
      - (157079634 / 100000000) ^ 6 / 720 + (157079634 / 100000000) ^ 8 / 40320
      - (157079634 / 100000000) ^ 10 / 3628800 ≤ -4778 / 10000000000 := by norm_num
  linarith

/-- `leastCosZero ≤ 157079634/1e8` (sharper UPPER bound): the IVT on `[0, 157079634/1e8]` supplies a
    cosine zero `≤ 157079634/1e8` (since `cutCos (157079634/1e8) < 0 ≤ cutCos 0`), and `csInf_le`. -/
theorem leastCosZero_le_157079634 : leastCosZero ≤ 157079634 / 100000000 := by
  have h02 : (0 : Cut) ≤ 157079634 / 100000000 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (157079634 / 100000000)) :=
    cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (157079634 / 100000000)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_157079634_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

/-- THE FURTHER-SQUEEZED `cutPi` BRACKET: `cutPi ∈ [31415924/1e7, 78539817/25000000]`, from
    `cutPi = 2·leastCosZero` and `leastCosZero ∈ [157079620/1e8, 157079634/1e8]` (the LOWER bound the
    banked `le_leastCosZero_157079620`, the UPPER the sharper `leastCosZero_le_157079634`). Width
    `≈ 2.8×10⁻⁷`. (`31415924/1e7 = 2·157079620/1e8`, `78539817/25000000 = 2·157079634/1e8`.) -/
theorem cutPi_bracket_ext2 :
    (31415924 / 10000000 : Cut) ≤ cutPi ∧ cutPi ≤ 78539817 / 25000000 := by
  unfold cutPi
  refine ⟨?_, ?_⟩
  · have := le_leastCosZero_157079620; linarith
  · have := leastCosZero_le_157079634; linarith

/-- THE FURTHER-SQUEEZED RESIDUAL BRACKET: `1/cutPi ∈ [25000000/78539817, 2500000/7853981]` — a certified
    two-sided rational bracket of `Cut` for the derived `1/cutPi`, width `≈ 2.8×10⁻⁸`, nested strictly
    inside the parent's `[10000000/31415927, 10000000/31415924]`. -/
theorem inv_cutPi_bracket_ext2 :
    (25000000 / 78539817 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 2500000 / 7853981 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_ext2
  have hpos : 0 < cutPi := cutPi_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]; nlinarith [hlo, hpos]

/-- W8 — THE FURTHER-SQUEEZED RESIDUAL BRACKET IS STRICTLY TWO-SIDED: `25000000/78539817 <
    2500000/7853981` (a genuine reading of width `≈ 2.8×10⁻⁸`, not a collapsed point). -/
theorem inv_cutPi_ext2_strict : (25000000 / 78539817 : Cut) < 2500000 / 7853981 := by norm_num

/-- W8 — THE further-squeezed `1/cutPi` BRACKET IS NESTED INSIDE the parent's `[10000000/31415927,
    10000000/31415924]`: `10000000/31415927 ≤ 25000000/78539817` and `2500000/7853981 ≤ 10000000/31415924`
    — the narrowing genuinely shrinks the bracket from the upper end (lower end reused). -/
theorem inv_cutPi_ext2_nested :
    (10000000 / 31415927 : Cut) ≤ 25000000 / 78539817
      ∧ (2500000 / 7853981 : Cut) ≤ 10000000 / 31415924 := by
  refine ⟨by norm_num, by norm_num⟩

/-- split@5 partial cosine at the cycle phase `2/9`: `partialCos (2/9) 5 = 13226284829/13559717115`
    (a pure ℚ computation, one term beyond the banked `partialCos_two_ninths_four`). -/
theorem partialCos_two_ninths_five : partialCos (2 / 9 : Cut) 5 = 13226284829 / 13559717115 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.NarrowedBracket7

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Algebra.AssembledBracket
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (B) FRONT (1): the sharpened `cutLog` content — the split@5 `cutCos(2/9)` read re-propagated
    through the banked Born-square amplitude chain to a `≈ 50×` tighter `m01`.

    The SAME `cutCos_bracket` instrument that reads `cutPi`'s least zero reads `cutCos(2/9)` to split@5,
    one term beyond `NarrowedBracket4`'s split@4. Everything below is the banked amplitude chain re-run
    with the sharper `pB` and a `√2` sharpened to `10⁻¹²` (the cos-mirror of `NarrowedBracket4`, one
    digit deeper). -/

/-- THE SHARPER `p = cutCos(2/9)` LOWER BRACKET at split@5: `9754100853/1e10 ≤ cutCos(2/9)`
    (`partialCos (2/9) 5 − cosRemBound (2/9) 5 = 13226284829/13559717115 − ≤10⁻¹³ ≥ 9754100853/1e10`).
    `≈ 20×` tighter than `NarrowedBracket4`'s split@4 lower bound `975410084/1e9`. -/
theorem pB_lo_s5 : (9754100853 / 10000000000 : Cut) ≤ pB := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 5 (by norm_num)).1
  rw [partialCos_two_ninths_five] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 5 ≤ 1 / 10000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (9754100853 / 10000000000 : Cut) ≤ 13226284829 / 13559717115 - 1 / 10000000000000 := by
    norm_num
  linarith

/-- THE SHARPER `p = cutCos(2/9)` UPPER BRACKET at split@5: `cutCos(2/9) ≤ 4877050427/5e9`
    (`partialCos (2/9) 5 + cosRemBound (2/9) 5 ≤ 4877050427/5e9`). Width `10⁻¹⁰` (was `2×10⁻⁹`). -/
theorem pB_hi_s5 : pB ≤ 4877050427 / 5000000000 := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 5 (by norm_num)).2
  rw [partialCos_two_ninths_five] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 5 ≤ 1 / 10000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (13226284829 / 13559717115 + 1 / 10000000000000 : Cut) ≤ 4877050427 / 5000000000 := by
    norm_num
  linarith

/-- THE SHARPER `w = √2` LOWER BRACKET: `1414213562373/1e12 ≤ wB` (from `wB·wB = 2`, `wB ≥ 0`). -/
theorem wB_lo_s5 : (1414213562373 / 1000000000000 : Cut) ≤ wB := by nlinarith [wB_ww, wB_nonneg]
/-- THE SHARPER `w = √2` UPPER BRACKET: `wB ≤ 707106781187/5e11` (from `wB·wB = 2`). Width `10⁻¹²`. -/
theorem wB_hi_s5 : wB ≤ 707106781187 / 500000000000 := by nlinarith [wB_ww, wB_nonneg]

/-- THE SHARPER CONIC ROOT LOWER BRACKET: `38174008945/1e11 ≤ r` (from `r·r = 3 − 3p²`, the sharper `p`
    upper bound, `r ≥ 0`). -/
theorem rB_lo_s5 : (38174008945 / 100000000000 : Cut) ≤ rB := by
  have hp2hi : pB * pB ≤ (4877050427 / 5000000000 : Cut) * (4877050427 / 5000000000) :=
    mul_le_mul pB_hi_s5 pB_hi_s5 (le_of_lt pB_pos) (by norm_num)
  nlinarith [rB_rr, rB_nonneg, hp2hi]
/-- THE SHARPER CONIC ROOT UPPER BRACKET: `r ≤ 38174009023/1e11` (from `r·r = 3 − 3p²`, the sharper `p`
    lower bound). -/
theorem rB_hi_s5 : rB ≤ 38174009023 / 100000000000 := by
  have hp2lo : (9754100853 / 10000000000 : Cut) * (9754100853 / 10000000000) ≤ pB * pB :=
    mul_le_mul pB_lo_s5 pB_lo_s5 (by norm_num) (le_of_lt (by linarith [pB_lo_s5]))
  nlinarith [rB_rr, rB_nonneg, hp2lo]

/-- The sharper product `w·p` lower bracket. -/
theorem wp_lo_s5 : (2758876343 / 2000000000 : Cut) ≤ wB * pB :=
  le_trans (by norm_num)
    (mul_le_mul wB_lo_s5 pB_lo_s5 (by norm_num) (le_of_lt (by linarith [wB_lo_s5])))
/-- The sharper product `w·p` upper bracket. -/
theorem wp_hi_s5 : wB * pB ≤ (13794381717 / 10000000000 : Cut) :=
  le_trans (mul_le_mul wB_hi_s5 pB_hi_s5 (le_of_lt pB_pos) (by norm_num)) (by norm_num)
/-- The sharper product `w·r` lower bracket. -/
theorem wr_lo_s5 : (2699310059 / 5000000000 : Cut) ≤ wB * rB :=
  le_trans (by norm_num)
    (mul_le_mul wB_lo_s5 rB_lo_s5 (by norm_num) (le_of_lt (by linarith [wB_lo_s5])))
/-- The sharper product `w·r` upper bracket. -/
theorem wr_hi_s5 : wB * rB ≤ (539862013 / 1000000000 : Cut) := by
  have hrpos : (0 : Cut) < rB := by linarith [rB_lo_s5]
  exact le_trans (mul_le_mul wB_hi_s5 rB_hi_s5 (le_of_lt hrpos) (by norm_num)) (by norm_num)

/-- The sharper amplitude `b0` lower bracket. -/
theorem b0_lo_s5 : (4758876343 / 2000000000 : Cut) ≤ b0 := by unfold b0; linarith [wp_lo_s5]
/-- The sharper amplitude `b0` upper bracket. -/
theorem b0_hi_s5 : b0 ≤ (23794381717 / 10000000000 : Cut) := by unfold b0; linarith [wp_hi_s5]
theorem b0_pos_s5 : (0 : Cut) < b0 := by have := b0_lo_s5; linarith
/-- The sharper amplitude `b1` lower bracket. -/
theorem b1_lo_s5 : (806998153 / 20000000000 : Cut) ≤ b1 := by
  unfold b1; have he : (1 : Cut) - wB * (pB + rB) / 2 = 1 - (wB * pB + wB * rB) / 2 := by ring
  rw [he]; linarith [wp_hi_s5, wr_hi_s5]
/-- The sharper amplitude `b1` upper bracket. -/
theorem b1_hi_s5 : b1 ≤ (806998167 / 20000000000 : Cut) := by
  unfold b1; have he : (1 : Cut) - wB * (pB + rB) / 2 = 1 - (wB * pB + wB * rB) / 2 := by ring
  rw [he]; linarith [wp_lo_s5, wr_lo_s5]
theorem b1_pos_s5 : (0 : Cut) < b1 := by have := b1_lo_s5; linarith

/-- The sharper Born-square mass `mass0 = b0²` lower bracket. -/
theorem mass0_lo_s5 :
    (4758876343 / 2000000000 : Cut) * (4758876343 / 2000000000) ≤ mass0 := by
  have := mul_le_mul b0_lo_s5 b0_lo_s5 (by norm_num) (le_of_lt b0_pos_s5)
  unfold mass0; nlinarith [this]
/-- The sharper Born-square mass `mass0 = b0²` upper bracket. -/
theorem mass0_hi_s5 :
    mass0 ≤ (23794381717 / 10000000000 : Cut) * (23794381717 / 10000000000) := by
  have := mul_le_mul b0_hi_s5 b0_hi_s5 (le_of_lt b0_pos_s5) (by norm_num)
  unfold mass0; nlinarith [this]
/-- The sharper Born-square mass `mass1 = b1²` lower bracket. -/
theorem mass1_lo_s5 :
    (806998153 / 20000000000 : Cut) * (806998153 / 20000000000) ≤ mass1 := by
  have := mul_le_mul b1_lo_s5 b1_lo_s5 (by norm_num) (le_of_lt b1_pos_s5)
  unfold mass1; nlinarith [this]
/-- The sharper Born-square mass `mass1 = b1²` upper bracket. -/
theorem mass1_hi_s5 :
    mass1 ≤ (806998167 / 20000000000 : Cut) * (806998167 / 20000000000) := by
  have := mul_le_mul b1_hi_s5 b1_hi_s5 (le_of_lt b1_pos_s5) (by norm_num)
  unfold mass1; nlinarith [this]

/-- THE FURTHER-SHARPENED `m01` LOWER BRACKET: `3477472814/1e6 ≤ mass0/mass1` (i.e. `3477.472814 ≤`),
    from `mass0_lo_s5`/`mass1_hi_s5`. `≈ 44×` tighter than the parent's `34774707/10000 = 3477.4707`. -/
theorem m01_lo_s5 : (3477472814 / 1000000 : Cut) ≤ mass0 / mass1 := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [le_div_iff₀ hm1]
  nlinarith [mass1_hi_s5, mass0_lo_s5]
/-- THE FURTHER-SHARPENED `m01` UPPER BRACKET: `mass0/mass1 ≤ 3477472936/1e6` (i.e. `≤ 3477.472936`),
    from `mass1_lo_s5`/`mass0_hi_s5`. Width `≈ 1.2×10⁻⁴` — `≈ 44×` tighter than the parent's `5.4×10⁻³`. -/
theorem m01_hi_s5 : mass0 / mass1 ≤ (3477472936 / 1000000 : Cut) := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [div_le_iff₀ hm1]
  nlinarith [mass1_lo_s5, mass0_hi_s5]

set_option maxHeartbeats 1000000 in
/-- THE SHARPENED `cutLog` CONTENT LOWER BRACKET: `815406110/1e8 ≤ cutLog(mass0/mass1)` (i.e.
    `8.1540611 ≤`). Composes `3477472814/1e6 ≤ mass0/mass1` (`m01_lo_s5`) with `cutLog_ge_certified` at
    partial-sum index `27` through `cutLog_mono`. Tighter than the parent's `81540604/1e7 = 8.1540604`. -/
theorem cutLog_lo_s5 : (815406110 / 100000000 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((3477472814 : Cut) / 1000000) ≤ cutLog (mass0 / mass1) :=
    cutLog_mono (by norm_num) m01_lo_s5
  have hge : (815406110 / 100000000 : Cut) ≤ cutLog ((3477472814 : Cut) / 1000000) := by
    apply cutLog_ge_certified ((3477472814 : Cut) / 1000000) (815406110 / 100000000) 27 (by norm_num)
      (by norm_num)
    show partialExp (815406110 / 100000000) 27 + expRemBound (815406110 / 100000000) 27
      ≤ (3477472814 : Cut) / 1000000
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

set_option maxHeartbeats 1000000 in
/-- THE SHARPENED `cutLog` CONTENT UPPER BRACKET: `cutLog(mass0/mass1) ≤ 815406115/1e8` (i.e.
    `≤ 8.1540612`). Composes `mass0/mass1 ≤ 3477472936/1e6` (`m01_hi_s5`) with `cutLog_le_certified` at
    partial-sum index `30` through `cutLog_mono`. Width `5×10⁻⁸` — `≈ 38×` narrower than the parent's
    `1.9×10⁻⁶` and NESTED inside its `[81540604/1e7, 81540623/1e7]`. -/
theorem cutLog_hi_s5 : cutLog (mass0 / mass1) ≤ (815406115 / 100000000 : Cut) := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 3477472814 / 1000000) m01_lo_s5
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((3477472936 : Cut) / 1000000) :=
    cutLog_mono hpos m01_hi_s5
  have hbnd : cutLog ((3477472936 : Cut) / 1000000) ≤ (815406115 / 100000000 : Cut) := by
    apply cutLog_le_certified ((3477472936 : Cut) / 1000000) (815406115 / 100000000) 30 (by norm_num)
      (by norm_num)
    show (3477472936 : Cut) / 1000000 ≤ partialExp (815406115 / 100000000) 30
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

/-- W8 — THE SHARPENED `cutLog` BRACKET IS GENUINELY TWO-SIDED: `815406110/1e8 < 815406115/1e8` (a real
    reading of width `5×10⁻⁸`, not a collapsed point). -/
theorem cutLog_s5_strict : (815406110 / 100000000 : Cut) < 815406115 / 100000000 := by norm_num

/-- W8 — THE SHARPENED `cutLog` BRACKET IS NESTED INSIDE the parent's `[81540604/1e7, 81540623/1e7]`:
    `81540604/1e7 ≤ 815406110/1e8` and `815406115/1e8 ≤ 81540623/1e7`. A monotone refinement. -/
theorem cutLog_s5_nested :
    (81540604 / 10000000 : Cut) ≤ 815406110 / 100000000
      ∧ (815406115 / 100000000 : Cut) ≤ 81540623 / 10000000 := by
  refine ⟨by norm_num, by norm_num⟩

/-! ## (C) THE RE-COMPOSED FURTHER-NARROWER `1/α(0)` NUMERAL — the banked D4 pipeline with BOTH
    residuals sharpened, at census `d = chargeTraceDepth = 16/3`. -/

/-- THE RE-COMPOSED FURTHER-NARROWER NUMERAL: run the banked `endpoint_assembled_bracket` at
    `d = chargeTraceDepth = 16/3` with `cutLog ∈ [815406110/1e8, 815406115/1e8]` (`cutLog_lo_s5` /
    `cutLog_hi_s5`) and `1/cutPi ∈ [25000000/78539817, 2500000/7853981]` (`inv_cutPi_bracket_ext2`):

        190/3 + (16/9)·(815406110/1e8)·(25000000/78539817)
          ≤ invAlphaZero (completeBandList chargeTraceDepth)
          ≤ 190/3 + (16/9)·(815406115/1e8)·(2500000/7853981),
        i.e.  48029320130/706858353 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 4802931616/70685829.

    A certified two-sided rational bracket of `Cut` of width `≈ 4.40×10⁻⁷` — `≈ 3.45×` narrower than the
    parent's `[19211728054/282743343, 4802931662/70685829]` (width `≈ 1.52×10⁻⁶`) and NESTED strictly
    inside it. The campaign's eighth rung. ⚠ NO-FIT: the residual endpoints are chosen by instrument
    certifiability, not tuned to a measured value. -/
theorem invAlphaZero_narrowed7_bracket :
    (48029320130 / 706858353 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
      ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 4802931616 / 70685829 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := endpoint_assembled_bracket chargeTraceDepth hd
    (815406110 / 100000000) (815406115 / 100000000) (by norm_num) cutLog_lo_s5 cutLog_hi_s5
    (25000000 / 78539817) (2500000 / 7853981) (by norm_num)
    inv_cutPi_bracket_ext2.1 inv_cutPi_bracket_ext2.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (48029320130 / 706858353 : Cut)
        ≤ 190 / 3 + chargeTraceDepth / 3 * (815406110 / 100000000) * (25000000 / 78539817) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (190 / 3 + chargeTraceDepth / 3 * (815406115 / 100000000) * (2500000 / 7853981) : Cut)
        ≤ 4802931616 / 70685829 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-- THE FURTHER-NARROWED DRESSED BRACKET at the derived weight `w = 1/3`: the running-of-the-running
    endpoint `dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)` pinned with BOTH
    residuals sharpened, at `d = 16/3`:

        74 + (8/3)·(815406110/1e8)·(25000000/78539817) ≤ · ≤ 74 + (8/3)·(815406115/1e8)·(2500000/7853981),
        i.e.  19066651594/235619451 ≤ · ≤ 1906665005/23561943. -/
theorem dressed_narrowed7_bracket :
    (19066651594 / 235619451 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
      ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 1906665005 / 23561943 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := dressed_endpoint_assembled_bracket chargeTraceDepth hd
    (815406110 / 100000000) (815406115 / 100000000) (by norm_num) cutLog_lo_s5 cutLog_hi_s5
    (25000000 / 78539817) (2500000 / 7853981) (by norm_num)
    inv_cutPi_bracket_ext2.1 inv_cutPi_bracket_ext2.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (19066651594 / 235619451 : Cut)
        ≤ 74 + chargeTraceDepth / 2 * (815406110 / 100000000) * (25000000 / 78539817) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (74 + chargeTraceDepth / 2 * (815406115 / 100000000) * (2500000 / 7853981) : Cut)
        ≤ 1906665005 / 23561943 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-! ## (D) W8 TEETH — the narrowing is genuine (strictly two-sided, strictly narrower, nested). -/

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY TWO-SIDED (non-degenerate):
    `48029320130/706858353 < 4802931616/70685829`. -/
theorem invAlphaZero_narrowed7_strict :
    (48029320130 / 706858353 : Cut) < 4802931616 / 70685829 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY NARROWER THAN the parent's (D5-next-6): its width
    `4802931616/70685829 − 48029320130/706858353` is strictly below the parent's width
    `4802931662/70685829 − 19211728054/282743343`. This is the campaign's core progress tooth — the
    assembled bracket genuinely shrank an eighth time (`cutLog` via the split@5 cycle-phase cosine read
    re-propagated to a `≈ 44×` tighter `m01`, and `1/cutPi` via the cheap split@6 upper-sign tick). -/
theorem invAlphaZero_narrowed7_width_lt :
    (4802931616 / 70685829 - 48029320130 / 706858353 : Cut)
      < 4802931662 / 70685829 - 19211728054 / 282743343 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS NESTED INSIDE the parent's: `19211728054/282743343 ≤
    48029320130/706858353` and `4802931616/70685829 ≤ 4802931662/70685829`. A monotone refinement — the
    new bracket sits entirely within the old, so no earlier reading is contradicted. -/
theorem invAlphaZero_narrowed7_nested :
    (19211728054 / 282743343 : Cut) ≤ 48029320130 / 706858353
      ∧ (4802931616 / 70685829 : Cut) ≤ 4802931662 / 70685829 := by
  refine ⟨by norm_num, by norm_num⟩

/-- W8 — THE FURTHER-NARROWED ENDPOINT GENUINELY SCREENS ABOVE THE HIGH-BAND WAY-POINT:
    `190/3 < 48029320130/706858353` (the lepton tail runs `1/α` genuinely up at the physical census, not
    a collapse). -/
theorem invAlphaZero_narrowed7_gt_waypoint :
    (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  have h := invAlphaZero_narrowed7_bracket.1
  have hgt : (190 / 3 : Cut) < 48029320130 / 706858353 := by norm_num
  linarith

/-! ## (E) THE D5-next-7 CAPSTONE — welded, non-hollow. -/

/-- THE NARROWING CAMPAIGN, EIGHTH RUNG (arc-D D5-next-7, welded landing). The now-binding `m01` floor
    sharpened `≈ 44×` by reading the SAME cycle-phase cosine numeral one term deeper (split@5), crushing
    `cutLog` `≈ 38×`; `1/cutPi` sharpened by the cheap split@6 upper-sign tick; and the D4 pipeline
    re-composed to a strictly narrower certified two-sided rational bracket of the derived `1/α(0)`:

    (1) THE FURTHER-SQUEEZED RESIDUAL: `1/cutPi ∈ [25000000/78539817, 2500000/7853981]`
        (`inv_cutPi_bracket_ext2`), from `cutPi ∈ [31415924/1e7, 78539817/25000000]` (`cutPi_bracket_ext2`),
        `leastCosZero ∈ [157079620/1e8, 157079634/1e8]` — the LOWER bound the banked
        `le_leastCosZero_157079620`, the UPPER from the split@6 sign one tick nearer the true zero
        (`cutCos_157079634_neg`);
    (2) THE FURTHER-SHARPENED cutLog CONTENT: `cutLog(mass0/mass1) ∈ [815406110/1e8, 815406115/1e8]`
        (`cutLog_lo_s5` / `cutLog_hi_s5`) — read off the D1 exp instrument at partial-sum index `27`
        (lower) / `30` (upper) through the `≈ 44×` tighter Born-square `m01` bracket
        `[3477472814/1e6, 3477472936/1e6]` (`m01_lo_s5` / `m01_hi_s5`), itself from the split@5
        `cutCos(2/9)` read (`pB_lo_s5` / `pB_hi_s5`) re-propagated through the banked amplitude chain;
    (3) THE RE-COMPOSED FURTHER-NARROWER NUMERAL: `48029320130/706858353 ≤ invAlphaZero (completeBandList
        chargeTraceDepth) ≤ 4802931616/70685829` (`invAlphaZero_narrowed7_bracket`), width `≈ 4.40×10⁻⁷`;
    (4) THE DRESSED FURTHER-NARROWER BRACKET: `19066651594/235619451 ≤ · ≤ 1906665005/23561943`
        (`dressed_narrowed7_bracket`);
    (5) TEETH: the narrowed bracket is strictly two-sided (`invAlphaZero_narrowed7_strict`), strictly
        narrower than the parent's (`invAlphaZero_narrowed7_width_lt`), nested inside the parent's
        (`invAlphaZero_narrowed7_nested`), and screens above `190/3`
        (`invAlphaZero_narrowed7_gt_waypoint`); the residual and cutLog brackets are each strictly
        two-sided and nested (`inv_cutPi_ext2_strict`/`inv_cutPi_ext2_nested`,
        `cutLog_s5_strict`/`cutLog_s5_nested`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (certified two-sided rational brackets of closed reals of `Cut`, no error bar). The bracket is
    `≈ 3.45×` narrower than the parent's but still WIDE relative to the measured precision; the campaign
    continues. ★ THE UPDATED BOTTLENECK: `cutLog`'s contribution has collapsed to `≈ 2.8×10⁻⁹` while
    `1/cutPi`'s is `≈ 4.4×10⁻⁷` — `1/cutPi` is now the SOLE binding residual, and its double-angle LOWER
    bound is at a `nlinarith`-margin ceiling near `π/2` (pushing it past `157079620/1e8` fails the
    positivity certificate). The successor should attack `1/cutPi`'s lower bound with a structural
    positivity route rather than deeper `nlinarith` grinding. The measured `1/α(0) ≈ 137.036` and `π` are
    REMOVABLE PROSE ONLY; no empirical number in any proof; explicit NO-FIT (the residual endpoints are
    chosen by instrument certifiability at the chosen index, not by the measured value; the derived value
    lands `≈ 67.9476`, nowhere near `137.036`). -/
theorem narrowedBracket7_landing :
    -- (1) the further-squeezed residual bracket (1/cutPi via the split@6 upper-sign tick)
    ((25000000 / 78539817 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 2500000 / 7853981)
    ∧ ((31415924 / 10000000 : Cut) ≤ cutPi ∧ cutPi ≤ 78539817 / 25000000)
    -- (2) the further-sharpened cutLog content bracket (split@5 m01 floor at deeper exp index)
    ∧ ((815406110 / 100000000 : Cut) ≤ cutLog (mass0 / mass1)
        ∧ cutLog (mass0 / mass1) ≤ 815406115 / 100000000)
    -- (3) the re-composed further-narrower numeral
    ∧ ((48029320130 / 706858353 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
        ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 4802931616 / 70685829)
    -- (4) the dressed further-narrower bracket at the derived weight
    ∧ ((19066651594 / 235619451 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
        ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 1906665005 / 23561943)
    -- (5) teeth: strictly two-sided, strictly narrower than the parent, nested inside it, screens above 190/3
    ∧ (48029320130 / 706858353 : Cut) < 4802931616 / 70685829
    ∧ ((4802931616 / 70685829 - 48029320130 / 706858353 : Cut)
        < 4802931662 / 70685829 - 19211728054 / 282743343)
    ∧ ((19211728054 / 282743343 : Cut) ≤ 48029320130 / 706858353
        ∧ (4802931616 / 70685829 : Cut) ≤ 4802931662 / 70685829)
    ∧ (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  exact ⟨inv_cutPi_bracket_ext2, cutPi_bracket_ext2,
    ⟨cutLog_lo_s5, cutLog_hi_s5⟩,
    invAlphaZero_narrowed7_bracket, dressed_narrowed7_bracket,
    invAlphaZero_narrowed7_strict, invAlphaZero_narrowed7_width_lt,
    invAlphaZero_narrowed7_nested, invAlphaZero_narrowed7_gt_waypoint⟩

end

end Phys.Algebra.NarrowedBracket7
