/-
  Phys.Algebra.TowerGatherForcedChargeEigenspace — N244.
  ===========================================================================
  THE FORCED EIGENSPACE DECOMPOSITION of the fundamental 7, DERIVED from the gather-obstruction
  charge operator. Owner-authorized gather-side hypercharge front, under the TEMPORARY PRIORITY
  LOCK (docs/ROADMAP.md, owner authorization 2026-07-01). Gather-native, NOT the parked
  invariant-tower ascent.

  THE DELIVERABLE. N243 banked the COMPLETE CHARGE SPECTRUM as the single spectral polynomial
  `minpoly ℚ chargeOp = X³ + X = X·(X² + 1)` of the gather charge operator `chargeOp = crossOp u1`
  on the whole fundamental 7 `ImO`. That minimal polynomial FORCES a direct-sum eigen-decomposition
  (`X` and `X²+1` coprime ⟹ kernel splitting). THIS node makes the decomposition EXPLICIT — it
  identifies the two eigen-pieces with the already-banked branching subspaces:

    ★★★ `chargeOp_ker : LinearMap.ker chargeOp = span{sgl}`  (the charge-`0` direction EXHAUSTED —
        EXACTLY the 1-dimensional branching singlet, NO other neutral direction), and
    ★★★ `chargeOpV_ker : LinearMap.ker chargeOpV = ⊥`  (the complement `Vsub = 3 ⊕ 3̄` carries NO
        charge-`0` direction — `chargeOp` restricts there to the invertible complex structure).

  Together with the banked splits `singlet ⊕ Vsub = ImO` (N42c `singlet_sup_Vsub_eq_ImO`,
  `singlet_disj_Vsub`) and `chargeOpV² = −id` (N242), this realizes the branching
  `ImO = span{u1} ⊕ Vsub = 1 ⊕ (3 ⊕ 3̄)` as the EXPLICIT eigenspace decomposition of the charge
  operator: the `0`-eigenspace is the singlet, the `±i`-eigenspaces (over the derived complex unit)
  are the two triplets — DERIVED from the spectrum, not posited.

  THE SPINE (all at the banked `chargeOp`/`chargeOp_sq_coe` level; NO coordinate bash, NO new
  subtype-of-subtype layer — the trunk's contraction dissolves the ⊆ direction):
    sgl_mem_ker              — `sgl ∈ ker chargeOp` (from N240 `chargeOp_kills_singlet`).
    span_sgl_le_ker          — `span{sgl} ≤ ker chargeOp` (⊇: the singlet is charge-`0`).
    ker_le_span_sgl          — ★★ THE SPINE (⊆): `y ∈ ker chargeOp ⟹ y ∈ span{sgl}`. From
                               `chargeOp y = 0` we get `chargeOp²(y) = 0`, and N240 `chargeOp_sq_coe`
                               (`chargeOp²(y) coe = ⟨u1,y⟩•u1 − y`) forces `(y : O ℚ) = ⟨u1,y⟩•u1
                               = ⟨u1,y⟩•sgl`, i.e. `y = ⟨u1,y⟩•sgl ∈ span{sgl}`. THE ONE LAW: the
                               contraction dissolves it, no `ring` over `O ℚ`.
    chargeOp_ker             — ★★★ THE HEADLINE: `ker chargeOp = span{sgl}` (`le_antisymm`).
    chargeOp_eigenspace_zero — ★ `eigenspace chargeOp 0 = span{sgl}` (`Module.End.eigenspace_zero`
                               identifies the `0`-eigenspace with the kernel).
    finrank_ker_chargeOp     — ★ `finrank ℚ (ker chargeOp) = 1` (`finrank_span_singleton
                               sgl_ne_zero`): the charge-`0` direction is EXACTLY 1-dimensional —
                               no other neutral direction, the singlet exhausts it. (W8 non-vacuity.)
    ker_chargeOp_map_eq_singlet — ★ the bridge to the banked `O ℚ`-level branching: pushing
                               `ker chargeOp = span{sgl}` through `ImO.subtype` recovers the banked
                               `singlet = span{u1}` (N42c). Ties the eigenspace to the branching.
    chargeOpV_ker            — ★★ THE COMPLEMENT: `ker chargeOpV = ⊥`. On `Vsub` the charge
                               operator is `chargeOpV` with `chargeOpV² = −id` (N242); a kernel
                               vector `v` would give `−v = chargeOpV²(v) = 0`, so `v = 0`. The
                               complement carries NO charge-`0` direction — the neutral direction is
                               EXCLUSIVELY the singlet.
    forced_charge_eigenspace_structure — the capstone.

  THE MOAT (docs/STANDARD §0). The field POSITS that the neutral (charge-`0`) component of the
  fundamental multiplet is the singlet and that the triplet/antitriplet carry the nonzero opposite
  charges. Here it is FORCED: the kernel of the gather charge operator on the whole `ImO` is EXACTLY
  the 1-dimensional singlet (`ker chargeOp = span{sgl}`, `finrank = 1` — no other neutral
  direction), while its complement `Vsub` has trivial kernel (`ker chargeOpV = ⊥`) and is the
  complex structure `chargeOpV² = −id`. ONE cause — `u1`, the fold's √−1 = the gather-tear input =
  the branching singlet — MANY faces: the `0`-eigenspace IS the singlet, the complement IS the two
  triplets, and the whole `7 = 1 ⊕ (3 ⊕ 3̄)` is the explicit eigenspace decomposition of the charge.

  ⚠ THE COMPLEX FIELD IS METALANGUAGE, NOT CONTENT (docs/ROADMAP.md N242 warning light, still lit).
  `chargeOp`, `chargeOpV`, `ImO`, `Vsub` stay DERIVED REAL objects; `ker`/`eigenspace`/`finrank`/
  `span` are Mathlib machinery on them. `±i` appears ONLY as the (non-`0`) roots of `X²+1` in the
  complement (N242); the `0`-eigenspace here is genuinely rational. NOT built OVER `ℚ[i]` — no
  `Algebra ℚ (Dbl ℚ)`, no `TensorProduct`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / hypercharge / eigenspace-as-charge /
  neutral / singlet / triplet / i": over the derived field ℚ and `O ℚ = CD (H ℚ)`, the kernel of
  the endomorphism `crossOp u1` of `ImO` is exactly `span{⟨u1⟩}` (1-dimensional), its restriction
  `crossOpO u1` to `Vsub` has trivial kernel, and — with the banked `span{u1} ⊕ Vsub = ImO` split —
  `ImO` decomposes as the direct sum of that 1-dimensional kernel and the 6-dimensional complement
  on which the operator squares to `−id`. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N243 (`chargeOp`/`sgl`/`sgl_ne_zero`/`chargeOp_sq_coe` via N240,
  `chargeOpV`/`chargeOpV_sq` via N242), N42c (`u1`/`singlet`/`Vsub`/`singlet_disj_Vsub`/
  `singlet_sup_Vsub_eq_ImO`), and standard Mathlib kernel/eigenspace/finrank/span machinery
  (`LinearMap.ker`, `Module.End.eigenspace_zero`, `finrank_span_singleton`,
  `Submodule.mem_span_singleton`, `Submodule.map_span`). Ground = derived ℚ; nothing posited; no
  Mathlib number/algebra as content; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherForcedChargeSpectrum
import Mathlib.LinearAlgebra.Eigenspace.Basic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The `0`-eigenspace: the kernel of the charge operator is EXACTLY the singlet. -/

/-- ★ The branching singlet lies in the kernel of the charge operator (it is the charge-`0`
    direction) — from N240 `chargeOp_kills_singlet`. -/
theorem sgl_mem_ker : sgl ∈ LinearMap.ker chargeOp := by
  rw [LinearMap.mem_ker]; exact chargeOp_kills_singlet

/-- ⊇ : `span{sgl} ≤ ker chargeOp` — the singlet direction is annihilated by the charge operator. -/
theorem span_sgl_le_ker : Submodule.span ℚ {sgl} ≤ LinearMap.ker chargeOp := by
  rw [Submodule.span_le, Set.singleton_subset_iff, SetLike.mem_coe]
  exact sgl_mem_ker

/-- ★★ THE SPINE (⊆): every kernel vector of the charge operator lies in `span{sgl}` — the
    charge-`0` direction is EXHAUSTED by the singlet, there is NO other neutral direction. From
    `chargeOp y = 0` we get `chargeOp(chargeOp y) = 0`; N240 `chargeOp_sq_coe`
    (`(chargeOp²(y) : O ℚ) = ⟨u1,y⟩•u1 − y`) then forces `(y : O ℚ) = ⟨u1,y⟩•u1 = ⟨u1,y⟩•sgl`, so
    `y = ⟨u1,y⟩•sgl ∈ span{sgl}`. THE ONE LAW: the trunk's contraction dissolves it — NO coordinate
    bash over the non-associative `O ℚ`. -/
theorem ker_le_span_sgl : LinearMap.ker chargeOp ≤ Submodule.span ℚ {sgl} := by
  intro y hy
  rw [LinearMap.mem_ker] at hy
  have h2 : chargeOp (chargeOp y) = 0 := by rw [hy, map_zero]
  have hc := chargeOp_sq_coe y
  rw [h2, Submodule.coe_zero] at hc
  -- hc : (0 : O ℚ) = gForm u1 (y:Oℚ) • u1 − (y:Oℚ)
  have hy_eq : (y : O ℚ) = gForm u1 (y : O ℚ) • u1 := (sub_eq_zero.mp hc.symm).symm
  rw [Submodule.mem_span_singleton]
  exact ⟨gForm u1 (y : O ℚ), Subtype.ext hy_eq.symm⟩

/-- ★★★ THE HEADLINE: the kernel of the gather charge operator on the whole fundamental 7 is
    EXACTLY the 1-dimensional branching singlet: `ker chargeOp = span{sgl}`. The charge-`0`
    direction is the singlet and ONLY the singlet — no other neutral direction. This is the `X`
    (linear) factor of the spectral polynomial `X³+X` (N243) realized as an explicit eigenspace. -/
theorem chargeOp_ker : LinearMap.ker chargeOp = Submodule.span ℚ {sgl} :=
  le_antisymm ker_le_span_sgl span_sgl_le_ker

/-- ★ The `0`-eigenspace of the charge operator is the singlet: `eigenspace chargeOp 0 = span{sgl}`
    (`Module.End.eigenspace_zero` identifies the `0`-eigenspace with the kernel; then the headline).
    The singlet is the eigenvector at charge eigenvalue `0`. -/
theorem chargeOp_eigenspace_zero :
    Module.End.eigenspace chargeOp 0 = Submodule.span ℚ {sgl} := by
  rw [Module.End.eigenspace_zero, chargeOp_ker]

/-- ★ W8 NON-VACUITY: the charge-`0` eigenspace is EXACTLY 1-dimensional
    (`finrank_span_singleton sgl_ne_zero`). The neutral direction is a single line — the singlet —
    not a larger subspace. -/
theorem finrank_ker_chargeOp : Module.finrank ℚ (LinearMap.ker chargeOp) = 1 := by
  rw [chargeOp_ker]; exact finrank_span_singleton sgl_ne_zero

/-- ★ THE BRIDGE TO THE BANKED BRANCHING: pushing `ker chargeOp = span{sgl}` through the inclusion
    `ImO.subtype` recovers the banked `O ℚ`-level singlet `singlet = span{u1}` (N42c). The
    charge-`0` eigenspace of the gather operator IS the branching singlet line — the eigenspace
    decomposition is anchored on the already-banked `7 = 1 ⊕ (3 ⊕ 3̄)`. -/
theorem ker_chargeOp_map_eq_singlet :
    (LinearMap.ker chargeOp).map (ImO.subtype) = singlet := by
  rw [chargeOp_ker, Submodule.map_span, singlet, Set.image_singleton]
  rfl

/-! ## The complement `Vsub = 3 ⊕ 3̄` carries NO charge-`0` direction. -/

/-- ★★ THE COMPLEMENT HAS TRIVIAL KERNEL: `ker chargeOpV = ⊥`. On the branching complement
    `Vsub = 3 ⊕ 3̄` the charge operator restricts to `chargeOpV` with `chargeOpV² = −id` (N242,
    the complex structure). A kernel vector `v` would give `−v = chargeOpV²(v) = 0`, forcing
    `v = 0`. So the neutral (charge-`0`) direction is EXCLUSIVELY the singlet — the two triplets
    carry only the nonzero `±i` charges. This is the counterpart of `finrank_ker_chargeOp = 1`:
    the `0`-eigenspace lives entirely in the singlet, not in the complement. -/
theorem chargeOpV_ker : LinearMap.ker chargeOpV = ⊥ := by
  rw [Submodule.eq_bot_iff]
  intro v hv
  rw [LinearMap.mem_ker] at hv
  have h : (chargeOpV.comp chargeOpV) v = -v := by rw [chargeOpV_sq]; rfl
  rw [LinearMap.comp_apply, hv, map_zero] at h
  exact neg_eq_zero.mp h.symm

/-! ## THE CAPSTONE. -/

/-- ★★★ THE FORCED EIGENSPACE DECOMPOSITION of the fundamental 7, from the gather obstruction.
    Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the gather-obstruction
    charge operator `chargeOp = crossOp u1` (N240) on the fundamental 7 `ImO`, its restriction
    `chargeOpV` to the branching complement `Vsub` (N242), and the branching singlet `sgl = ⟨u1⟩`:
    (i)   `ker chargeOp = span{sgl}` — the charge-`0` direction is EXACTLY the 1-dimensional
          singlet (`eigenspace chargeOp 0 = span{sgl}`, `finrank = 1`), no other neutral direction;
    (ii)  pushing that kernel through `ImO.subtype` recovers the banked branching `singlet`;
    (iii) `ker chargeOpV = ⊥` — the complement `Vsub = 3 ⊕ 3̄` carries NO charge-`0` direction;
    (iv)  `chargeOpV² = −id` — on the complement the charge operator is the invertible complex
          structure (the `±i` eigen-pieces);
    (v)   `singlet` and `Vsub` are disjoint (`singlet_disj_Vsub`, N42c) and sum to `ImO`
          (`singlet_sup_Vsub_eq_ImO`, N42c).
    Hence `ImO = span{u1} ⊕ Vsub = 1 ⊕ (3 ⊕ 3̄)` is the EXPLICIT eigenspace decomposition of the
    gather charge operator: the `0`-eigenspace is the singlet, the complement (trivial kernel,
    `chargeOpV² = −id`) is the two triplets at the opposite `±i` charges — DERIVED from the
    spectrum (not posited, not normalized). -/
theorem forced_charge_eigenspace_structure :
    LinearMap.ker chargeOp = Submodule.span ℚ {sgl} ∧
    Module.End.eigenspace chargeOp 0 = Submodule.span ℚ {sgl} ∧
    Module.finrank ℚ (LinearMap.ker chargeOp) = 1 ∧
    (LinearMap.ker chargeOp).map (ImO.subtype) = singlet ∧
    LinearMap.ker chargeOpV = ⊥ ∧
    chargeOpV.comp chargeOpV = -LinearMap.id ∧
    Disjoint singlet Vsub ∧
    singlet ⊔ Vsub = ImO :=
  ⟨chargeOp_ker, chargeOp_eigenspace_zero, finrank_ker_chargeOp, ker_chargeOp_map_eq_singlet,
   chargeOpV_ker, chargeOpV_sq, singlet_disj_Vsub, singlet_sup_Vsub_eq_ImO⟩

end

end Phys.Algebra
