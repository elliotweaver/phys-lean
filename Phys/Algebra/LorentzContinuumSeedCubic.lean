/-
  Phys.Algebra.LorentzContinuumSeedCubic — N75: THE ODD-DEGREE ROOT ENGINE over the DERIVED ℝ `Cut`
  — the cube root `cutCbrt` and the GENERAL MONIC-CUBIC ROOT lever `cut_cubic_has_root` (the
  eigenvalue-existence ingredient at dimension ≥ 3 — a root of the characteristic cubic — the missing
  SEED-eigenvalue half the now-GENERAL iterated descent N74 is banked to consume), over the DERIVED ℝ
  `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the GENERAL ITERATED DEFLATION DESCENT node (N74). N49–N74 banked, over
  the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • ★ the POSITIVE-DEFINITE SCALAR (degree-2) square root `cutSqrt` — `cutSqrt_exists` via the
      intermediate value theorem riding the banked order-completeness (N33 `ConditionallyCompleteLinearOrder`
      Cut), order-topology (N34 `OrderTopology`/`IsTopologicalRing` Cut), Archimedean (N35), CompleteSpace
      (N37) (N57);
    • the INFINITESIMAL CARTAN reference form `EvC` + `EvC_symm`/`EvC_smul_*` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` + `comp_nonneg` (N59);
    • the operator square-root predicate `IsEvCOpSqrt` + 2-block/octonion/diagonal roots (N60–N65);
    • the FIRST concrete polar factorization `g = k·exp(p)` (N66);
    • the rank-3 spectral operator `specOp3` (N67), the GENERAL RANK-`n` spectral operator `specOpN`
      with `specOpN_op_sqrt`/`specOpN_read` (N68), the CONCRETE EIGENBASIS-EXISTENCE WITNESS `txMix`
      (N69), the DEFLATION / PEEL-OFF ENGINE `deflateC` (N70);
    • ★ the SEED EIGENPAIR EXTRACTION — the vector eigen-equation `specOpN_eigen` (N71), the CONSTRUCTED
      octonion-COUPLING 2×2 seed via the discriminant radical `R = cutSqrt(δ²+b²)` (`toMix_seed_eigen`)
      (N72) — both topping out at a single 2×2 block, i.e. a degree-2 discriminant radical;
    • the FIRST CLOSED MULTI-STEP DEFLATION DESCENT `txMix_full_descent` (N73), and the GENERAL ITERATED
      DEFLATION DESCENT — the iterated peel `deflateList`, the general-`n` skeleton `deflateList_zeroOn`,
      the HEADLINE `specOpN_full_descent` (the FULL rank-`n` spectral operator driven to `0` at arbitrary
      rank `n`) (N74).

  ── THE TARGET (N75) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the HEAVY group-manifold core: the seed eigenpair EXTRACTION at GENERAL
  dimension (the characteristic-cubic route producing ONE eigenpair for an arbitrary EvC-self-adjoint
  operator on a 3-dim space, beyond N65/N72's 2×2 discriminant), the FULL n-dim spectral EXISTENCE
  `∀ g, ∃ c u, g = specOpN c u`, the GLOBAL polar/KAK assembly for an arbitrary `g`, CONNECTEDNESS, the
  GLOBAL reverse KAK surjectivity, and the full `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST (ROADMAP
  §N75 priority (i)) confirms: the SEED at dimension ≥ 3 splits into an EIGENVALUE half (a root of the
  characteristic CUBIC — beyond a degree-2 radical) and an EIGENVECTOR half (a nonzero kernel vector of
  `T − λ` over the 10-dim product space `STVC = Cut × Cut × O Cut`), and the assembly/connectedness/
  surjectivity/exhaustion need group-manifold machinery Mathlib lacks over `Cut` — those are the
  genuine HEAVY sub-nodes (childed N76).

  ── THE IMMEDIATELY-BANKABLE STRUCTURAL ESCALATION (ROADMAP §N75 priority (i)) — THE EIGENVALUE HALF ──
  N57 `cutSqrt` is the degree-2 root engine: it produces a SQUARE root and, through the 2×2
  discriminant radical `R = cutSqrt(δ²+b²)`, the eigenvalues of every 2×2 block (N65/N72). The chain's
  seed eigenvalue extraction therefore tops out at a single 2×2 block — a degree-2 radical. The SEED at
  dimension ≥ 3 needs an eigenvalue from the characteristic CUBIC `λ³ + bλ² + cλ + d`, which has NO
  closed radical form a square root reaches. The ROADMAP §N75 names the exact reframe: "is the cubic
  root the banked `cutSqrt`-style order-completeness/IVT engine N57/N33–N37 applied to the
  characteristic cubic?" — and this node answers YES. The eigenvalue-existence lever at dimension ≥ 3
  DISSOLVES through the SAME order-completeness/IVT engine that built `cutSqrt`, escalated from degree 2
  to ODD degree.

  ── THE TRUNK REFRAME (THE ONE LAW): the cubic root IS `cutSqrt`'s IVT engine at odd degree ──
  `cutSqrt` rode `intermediate_value_Icc` on the continuous `x ↦ x·x` over `[0, max 1 a]` (the banked
  N34 topological-ring continuity + N33 order-completeness). The SAME `intermediate_value_Icc`, on the
  continuous `x ↦ x³ + b·x² + c·x + d` over a SYMMETRIC interval `[−s, s]` with `s = |b|+|c|+|d|+1` the
  Cauchy root bound, gives a root: the dominance `0 ≤ s³ − |b|s² − |c|s − |d|` (so `f(s) ≥ 0`) and its
  reflection (`f(−s) ≤ 0`) bracket a sign change, and IVT crosses zero. The odd degree makes the root
  exist for EVERY coefficient triple — exactly why a cubic always has a real root and an even-degree
  polynomial need not. NO Cardano radicals, NO Mathlib `Real`, NO posited field: it is the trunk's own
  order-completeness, the same engine the continuum was built with, one degree up.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    continuous_cut_cube — `x ↦ x·x·x` is continuous on the derived ℝ `Cut` (N34 topological ring),
                          the degree-3 escalation of N57 `continuous_cut_sq`.
    cutCbrt_exists      — ★ ∀ a ≥ 0, ∃ b ≥ 0, b·b·b = a (the nonnegative cube root, IVT existence).
    cutCbrt             — the named nonnegative cube-root witness (junk `0` off the nonnegatives).
    cutCbrt_nonneg      — `0 ≤ cutCbrt a`.
    cutCbrt_cube        — ★ THE DEFINING PROPERTY: for `a ≥ 0`, `(cutCbrt a)·(cutCbrt a)·(cutCbrt a) = a`.
    cutCbrt_unique      — `cutCbrt` is THE nonnegative cube root (cubing is injective on nonnegatives).
    cutCbrt_eight_eq_two — ★ NON-VACUITY: `cutCbrt 8 = 2` over the derived ℝ (the costume target).
    continuous_cut_cubic — `x ↦ x³ + b·x² + c·x + d` is continuous (any monic cubic).
    cut_cubic_has_root  — ★★ THE GENERAL MONIC-CUBIC ROOT LEVER: EVERY monic cubic `x³ + b·x² + c·x + d`
                          over `Cut` HAS a root over `Cut`, via the IVT on the Cauchy-bound symmetric
                          interval. The eigenvalue-existence ingredient at dimension ≥ 3: the
                          characteristic polynomial of a self-adjoint operator on a 3-dim space is a
                          monic cubic, and a root of it is an eigenvalue. THE SEED-EIGENVALUE half the
                          now-general iterated descent (N74) is banked to consume.
    cut_cubic_root_witness — ★ NON-VACUITY: a concrete monic cubic `x³ − 7x + 6` (roots `1,2,−3`) HAS a
                          root over `Cut` (the costume target).

  ── THE W1 HEAVY REMAINDER (childed N76, an honest dissolution ticket, NOT closed here) ──
  The EIGENVECTOR half of the 3-dim seed (a nonzero kernel vector of `T − λ` for the cubic-root
  eigenvalue `λ`, over the 10-dim product space `STVC`) + assembling the seed + the iterated descent
  into the FULL existence `∀ g, ∃ c u, g = specOpN c u` + the GLOBAL polar/KAK assembly for an arbitrary
  `g` + the compact part via CONNECTEDNESS + the GLOBAL reverse KAK surjectivity + the full
  `Spin(9)→SO(9)` exhaustion are the genuine HEAVY group-manifold core, childed onto the chain tail.
  THIS node banks the SEED-EIGENVALUE half at general dimension — the odd-degree root engine and the
  general monic-cubic root lever — the trunk-native escalation of `cutSqrt` from a 2×2 discriminant
  radical to the characteristic cubic, the missing eigenvalue ingredient at dimension ≥ 3.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That an odd-degree polynomial over a real-closed /
  complete ordered field has a root, and that a cube root exists, is standard real analysis. Here the
  cube root, its defining property and uniqueness, and the general monic-cubic root all DESCEND from the
  banked order-completeness the continuum was BUILT with — the N33 `ConditionallyCompleteLinearOrder`,
  N34 `OrderTopology`/`IsTopologicalRing`, N35 `Archimedean` over the DERIVED ℝ `Cut`, via the SAME
  `intermediate_value_Icc` engine that gave N57 `cutSqrt`. NO posited ℝ, NO Mathlib `Real.sqrt`/`Real`
  as content, NO posited field. `intermediate_value_Icc`, `Continuous`, `fun_prop`, `nlinarith`,
  `mul_self_eq_mul_self_iff` are standard MACHINERY operating on the DERIVED objects.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenvalue / eigenvector / eigenpair / eigenbasis / characteristic / cubic / seed / extraction /
  dimension / rank / Spin / SO(9) / KAK / polar / Cartan / isometry": what remains is the theorem that,
  over the derived complete ordered field `Cut`, every nonnegative element has a unique nonnegative
  cube root, `cutCbrt 8 = 2`, and every monic cubic `x³ + b·x² + c·x + d` has a root — pure mathematics
  about roots of polynomials over the derived complete ordered field. No theorem STATEMENT needs a
  physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited field, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumDescentIter
import Phys.Algebra.LorentzContinuumSqrt

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## Continuity of cubing on the derived ℝ — the degree-3 escalation of `continuous_cut_sq`. -/

/-- Cubing `x ↦ x·x·x` is continuous on the derived ℝ `Cut` (the field is a topological ring,
    banked N34 `IsTopologicalRing Cut`). The degree-3 escalation of N57 `continuous_cut_sq`. -/
theorem continuous_cut_cube : Continuous (fun x : Cut => x * x * x) :=
  (continuous_id.mul continuous_id).mul continuous_id

/-! ## The nonnegative cube root over `Cut` via the intermediate value theorem. -/

/-- ★ THE NONNEGATIVE CUBE ROOT EXISTS over the derived ℝ `Cut`: every nonnegative element is the
    cube of a nonnegative element.

    THE W1 REFRAME — the intermediate value theorem riding the SAME order-completeness (N33) + order
    topology (N34) that built N57 `cutSqrt`, now on `x ↦ x·x·x`. With `c = max 1 a` we have
    `0³ = 0 ≤ a ≤ c³`, so `a` lies in the image-interval of the continuous cubing map on `[0,c]`;
    `intermediate_value_Icc` returns a preimage. NO Mathlib `Real`, NO posited ℝ. -/
theorem cutCbrt_exists (a : Cut) (ha : 0 ≤ a) : ∃ b : Cut, 0 ≤ b ∧ b * b * b = a := by
  set c : Cut := max 1 a with hc
  have h0c : (0 : Cut) ≤ c := le_trans zero_le_one (le_max_left _ _)
  have h1c : (1 : Cut) ≤ c := le_max_left _ _
  have hac : a ≤ c * c * c := by
    rcases le_total a 1 with h | h
    · calc a ≤ 1 := h
        _ = (1 : Cut) * 1 * 1 := by ring
        _ ≤ c * c * c := by
              have := mul_le_mul (mul_le_mul h1c h1c zero_le_one h0c) h1c zero_le_one
                (mul_nonneg h0c h0c)
              simpa using this
    · have hca : a ≤ c := le_max_right _ _
      calc a ≤ c := hca
        _ = 1 * 1 * c := by ring
        _ ≤ c * c * c := by
              have := mul_le_mul_of_nonneg_right
                (mul_le_mul h1c h1c zero_le_one h0c) h0c
              simpa using this
  have hcont : ContinuousOn (fun x : Cut => x * x * x) (Set.Icc 0 c) :=
    continuous_cut_cube.continuousOn
  have hmem : a ∈ Set.Icc ((fun x : Cut => x * x * x) 0) ((fun x : Cut => x * x * x) c) := by
    refine ⟨?_, ?_⟩
    · simpa using ha
    · simpa using hac
  obtain ⟨b, hb_mem, hb_eq⟩ := intermediate_value_Icc h0c hcont hmem
  exact ⟨b, hb_mem.1, hb_eq⟩

/-- The nonnegative cube root of `a : Cut`. For `a ≥ 0` it satisfies `cutCbrt a · cutCbrt a · cutCbrt a
    = a` (`cutCbrt_cube`) and `0 ≤ cutCbrt a` (`cutCbrt_nonneg`); for `a < 0` it is the junk value `0`.
    Noncomputable: chosen from `cutCbrt_exists`. -/
noncomputable def cutCbrt (a : Cut) : Cut :=
  if ha : 0 ≤ a then Classical.choose (cutCbrt_exists a ha) else 0

theorem cutCbrt_nonneg (a : Cut) : 0 ≤ cutCbrt a := by
  unfold cutCbrt
  split
  · exact (Classical.choose_spec (cutCbrt_exists a ‹_›)).1
  · exact le_refl 0

/-- ★ THE DEFINING PROPERTY: for `a ≥ 0`, `(cutCbrt a)·(cutCbrt a)·(cutCbrt a) = a`. -/
theorem cutCbrt_cube {a : Cut} (ha : 0 ≤ a) : cutCbrt a * cutCbrt a * cutCbrt a = a := by
  unfold cutCbrt
  rw [dif_pos ha]
  exact (Classical.choose_spec (cutCbrt_exists a ha)).2

/-- Cubing is injective on the nonnegatives: `b·b·b = b'·b'·b'` with `0 ≤ b, b'` forces `b = b'`.
    (The cubing map is strictly monotone on the nonnegatives of an ordered field — via the
    factorization `b'³ − b³ = (b'−b)(b'² + b'b + b²)`.) -/
theorem cube_nonneg_inj {b b' : Cut} (hb : 0 ≤ b) (hb' : 0 ≤ b')
    (h : b * b * b = b' * b' * b') : b = b' := by
  by_contra hne
  rcases lt_or_gt_of_ne hne with hlt | hgt
  · have hb'pos : 0 < b' := lt_of_le_of_lt hb hlt
    have h1 : 0 < b' - b := by linarith
    have h2 : 0 < b'*b' + b'*b + b*b :=
      add_pos_of_pos_of_nonneg (add_pos_of_pos_of_nonneg (mul_pos hb'pos hb'pos)
        (mul_nonneg hb'pos.le hb)) (mul_nonneg hb hb)
    nlinarith [mul_pos h1 h2]
  · have hbpos : 0 < b := lt_of_le_of_lt hb' hgt
    have h1 : 0 < b - b' := by linarith
    have h2 : 0 < b*b + b*b' + b'*b' :=
      add_pos_of_pos_of_nonneg (add_pos_of_pos_of_nonneg (mul_pos hbpos hbpos)
        (mul_nonneg hbpos.le hb')) (mul_nonneg hb' hb')
    nlinarith [mul_pos h1 h2]

/-- `cutCbrt` is THE nonnegative cube root: any nonnegative `b` with `b·b·b = a` equals it. -/
theorem cutCbrt_unique {a b : Cut} (hb : 0 ≤ b) (hba : b * b * b = a) :
    b = cutCbrt a := by
  have ha : 0 ≤ a := by rw [← hba]; exact mul_nonneg (mul_nonneg hb hb) hb
  exact cube_nonneg_inj hb (cutCbrt_nonneg a) (by rw [hba, cutCbrt_cube ha])

/-- ★ NON-VACUITY (W8): the nonnegative cube root of `8` is `2` over the derived ℝ `Cut` —
    `2·2·2 = 8` and `0 ≤ 2`, so by uniqueness `cutCbrt 8 = 2`. A concrete, bitable value. -/
theorem cutCbrt_eight_eq_two : cutCbrt (8 : Cut) = 2 :=
  (cutCbrt_unique (by norm_num) (by norm_num)).symm

/-! ## The general monic-cubic root over `Cut` — the eigenvalue-existence lever at dimension ≥ 3. -/

/-- Any monic cubic `x ↦ x³ + b·x² + c·x + d` is continuous on the derived ℝ `Cut`. -/
theorem continuous_cut_cubic (b c d : Cut) :
    Continuous (fun x : Cut => x*x*x + b*(x*x) + c*x + d) := by
  fun_prop

/-- ★★ THE GENERAL MONIC-CUBIC ROOT LEVER: EVERY monic cubic `x³ + b·x² + c·x + d` over the derived
    ℝ `Cut` HAS a root over `Cut`.

    THE W1 REFRAME (THE ONE LAW) — the SAME `intermediate_value_Icc` engine that built N57 `cutSqrt`,
    on the continuous monic cubic over a SYMMETRIC interval `[−s, s]` with the Cauchy root bound
    `s = |b|+|c|+|d|+1`. The dominance `0 ≤ s³ − |b|s² − |c|s − |d|` makes `f(s) ≥ 0`; its reflection
    makes `f(−s) ≤ 0`; the odd degree brackets a sign change at `0`, and IVT crosses it. The odd degree
    is exactly why the root exists for EVERY coefficient triple (an even-degree polynomial need not have
    a real root). The eigenvalue-existence ingredient at dimension ≥ 3: the characteristic polynomial of
    a self-adjoint operator on a 3-dim space is a monic cubic, and a root of it is an eigenvalue — the
    SEED-eigenvalue half the now-general iterated descent (N74) is banked to consume. The degree-2→odd
    escalation of `cutSqrt`. NO Cardano radicals, NO Mathlib `Real`, NO posited field. -/
theorem cut_cubic_has_root (b c d : Cut) :
    ∃ x : Cut, x*x*x + b*(x*x) + c*x + d = 0 := by
  set p := |b| with hp
  set q := |c| with hq
  set r := |d| with hr
  have hp0 : 0 ≤ p := abs_nonneg b
  have hq0 : 0 ≤ q := abs_nonneg c
  have hr0 : 0 ≤ r := abs_nonneg d
  set s : Cut := p + q + r + 1 with hs
  have hs0 : (0:Cut) ≤ s := by rw [hs]; linarith
  have hs1 : (1:Cut) ≤ s := by rw [hs]; linarith
  have hps : 0 ≤ s - 1 - p := by rw [hs]; linarith
  have hqs : 0 ≤ s - 1 - q := by rw [hs]; linarith
  have hrs : 0 ≤ s - 1 - r := by rw [hs]; linarith
  have hbp : -p ≤ b := neg_abs_le b
  have hbp' : b ≤ p := le_abs_self b
  have hcq : -q ≤ c := neg_abs_le c
  have hcq' : c ≤ q := le_abs_self c
  have hdr : -r ≤ d := neg_abs_le d
  have hdr' : d ≤ r := le_abs_self d
  -- Cauchy dominance: 0 ≤ s³ − p·s² − q·s − r  (= s²(s−1−p) + s(s−1−q) + (s−1−r) + 1)
  have hdom : 0 ≤ s*s*s - p*(s*s) - q*s - r := by
    nlinarith [mul_nonneg (mul_self_nonneg s) hps, mul_nonneg hs0 hqs, hrs]
  have hfU : 0 ≤ (fun x : Cut => x*x*x + b*(x*x) + c*x + d) s := by
    simp only
    nlinarith [hdom, mul_nonneg (by linarith : (0:Cut) ≤ b + p) (mul_self_nonneg s),
      mul_nonneg (by linarith : (0:Cut) ≤ c + q) hs0, (by linarith : (0:Cut) ≤ d + r)]
  have hfL : (fun x : Cut => x*x*x + b*(x*x) + c*x + d) (-s) ≤ 0 := by
    simp only
    nlinarith [hdom, mul_nonneg (by linarith : (0:Cut) ≤ p - b) (mul_self_nonneg s),
      mul_nonneg (by linarith : (0:Cut) ≤ q - c) hs0, (by linarith : (0:Cut) ≤ r - d)]
  have hcont : ContinuousOn (fun x : Cut => x*x*x + b*(x*x) + c*x + d) (Set.Icc (-s) s) :=
    (continuous_cut_cubic b c d).continuousOn
  have hle : (-s : Cut) ≤ s := by linarith
  have hmem : (0:Cut) ∈ Set.Icc ((fun x : Cut => x*x*x + b*(x*x) + c*x + d) (-s))
      ((fun x : Cut => x*x*x + b*(x*x) + c*x + d) s) := ⟨hfL, hfU⟩
  obtain ⟨x, _, hx⟩ := intermediate_value_Icc hle hcont hmem
  exact ⟨x, hx⟩

/-- ★ NON-VACUITY (W8): a concrete monic cubic `x³ − 7x + 6` (roots `1, 2, −3`) HAS a root over the
    derived ℝ `Cut` — the general lever instantiated at `b = 0, c = −7, d = 6`. A concrete, bitable
    existence (the costume asserts a WRONG specialization). -/
theorem cut_cubic_root_witness :
    ∃ x : Cut, x*x*x + 0*(x*x) + (-7)*x + 6 = 0 :=
  cut_cubic_has_root 0 (-7) 6

end

end Phys.Algebra
