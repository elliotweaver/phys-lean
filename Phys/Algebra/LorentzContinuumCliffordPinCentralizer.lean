/-
  Phys.Algebra.LorentzContinuumCliffordPinCentralizer — N148: THE CENTRALIZER DISSOLUTION
  CORE — covers-id ⟹ the supercenter condition DISSOLVES into a Clifford-contraction
  (interior-product) kernel condition. Over the derived ℝ `Cut`, the terminal algebra
  `O Cut`, the spacetime `STVC`, the indefinite Minkowski form `BvC`, the Clifford algebra
  `CliffC = CliffordAlgebra QvCQuad`.
  ===========================================================================
  CONTEXT — THE W1 DISSOLUTION CORE measured at N147 + the W3 DECOMPOSITION of the EXACT
  KERNEL `MonoidHom.mker coverMapPinUnit = {1, -1}`.

  N147 banked the scalar-element half (B) of the `⊆` injectivity-mod-center direction and the
  reduction `coverMapPinUnit_injmodcenter_of_scalar`, whose ONE explicit hypothesis `hcent` is
  the centralizer fact: every kernel element of `coverMapPinUnit` is a SCALAR `algebraMap μ`.
  N147 MEASURED that fact to require the Clifford supercenter=scalars theorem Mathlib LACKS (no
  `center`/`centralizer`/`IsCentral` for `CliffordAlgebra`) — the honest W1 dissolution core.

  ── THE TRUNK REFRAME (W1 step 2 / THE ONE LAW — DISSOLVE, don't classify the supercenter). ──
  Do NOT build an abstract Clifford-centralizer theory. The kernel condition DISSOLVES through
  the cascade's OWN Clifford contraction (the interior product, Mathlib `contractLeft`, the
  Born/overlap pairing read on the spinor module). The pivot is THE MASTER IDENTITY: for every
  vector `a` and every `x : CliffC`,
        `ι a · x  -  involute(x) · ι a  =  contractLeft (polarBilin a) x`           (M)
  — the graded commutator of `x` with the generator `ι a` IS the interior product of `x` by the
  polar dual of `a` (proved by `left_induction` from `contractLeft_ι_mul` + `ι_mul_ι_add_swap`;
  no `tsum`, no exponential, no coordinate brute, no W9 risk). A kernel element `u` of
  `coverMapPinUnit` COVERS the identity, so `involute(↑u)·ι v·↑u⁻¹ = ι v` ⟹ `involute(↑u)·ι v =
  ι v·↑u` (the covering-id commutator vanishes), whence by (M) **every interior product of `↑u`
  by a polar dual vanishes**: `contractLeft (polarBilin v) ↑u = 0` for all `v`. The supercenter
  membership has DISSOLVED into a contraction-kernel membership — the cascade's own Born pairing
  detecting that `↑u` has no part of grade ≥ 1.

  ── WHAT THIS NODE BANKS ──
    ★★ master_contract        — THE MASTER IDENTITY (M): the graded commutator with `ι a` equals
                                the interior product `contractLeft (polarBilin a)`. The genuinely
                                new structural pivot — the cascade's own Born contraction.
    covers_id_comm            — covers-id ⟹ `involute(↑u)·ι v = ι v·↑u` (the covering-id
                                commutator vanishes; from the twisted-adjoint cover relation).
    covers_id_contract_zero   — covers-id ⟹ `contractLeft (polarBilin v) ↑u = 0` for all `v`
                                (the supercenter condition AS a contraction-kernel condition,
                                via (M)).
    mker_covers_id            — a kernel element of `coverMapPinUnit` covers the identity (its
                                covered operator is `1` by definition of `mker`).
    ★★ mker_coverMapPinUnit_contract_zero — THE HEADLINE: every kernel element `u` of
                                `coverMapPinUnit` is killed by every interior product —
                                `contractLeft (polarBilin v) ↑u = 0` for all `v`. The
                                supercenter=scalars obstruction REDUCED to a single clean
                                contraction-kernel statement.
    ★★ coverMapPinUnit_exactKernel_of_contractScalar — THE CONDITIONAL ASSEMBLY: GIVEN the one
                                remaining link `hZ` (an element killed by every polar-dual
                                interior product is a scalar — Lemma Z, childed N149), every
                                kernel element of `coverMapPinUnit` is `±1`. The full `⊆`
                                injectivity-mod-center direction of the EXACT KERNEL, assembled
                                from (this node) + N147 (`coverMapPinUnit_injmodcenter_of_scalar`),
                                with the ONLY missing link made explicit as `hZ`.
    W8 (genuinely non-vacuous teeth):
    contract_iota_timelike    — the interior product genuinely DETECTS grade 1:
                                `contractLeft (polarBilin mTimeUnit) (ι mTimeUnit) = algebraMap 2`
                                (`polar_self`, `QvC mTimeUnit = 1`) — NONZERO, so a non-scalar like
                                `ι mTimeUnit` does NOT lie in the contraction kernel; the headline
                                reduction is a real constraint, not vacuous. The read-off the
                                costume C180 negates.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the Pin double cover's
  `{±1}` kernel as the DEFINING datum, or proves injectivity-mod-center by an abstract Clifford
  center classification taken off a FIXED metric. Here the obstruction DISSOLVES through the
  cascade's OWN interior product on the derived form `QvCQuad` over the derived field `Cut`: the
  master identity is the graded commutator = Born contraction, the covering-id condition forces
  the contraction kernel, and the only remaining link (contraction-kernel ⟹ scalar) is scoped to
  a dedicated W1 child, never asserted. No posited Pin/Spin group, no posited cover, no posited
  kernel, no posited centralizer, no posited Clifford center, no Mathlib ℝ/ℂ as content, no bridge.

  DERIVED from the banked N49–N147 + the derived ℝ `Cut` + the terminal algebra `O Cut` + the
  spacetime `STVC` + the indefinite Minkowski form `BvC` + the Clifford algebra `CliffC`.
  Foundations-only.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Pin / Spin / cover / spinor / Lorentz /
  Minkowski / reflection / kernel / centralizer / supercenter / commutant / scalar / interior-
  product / Born / injectivity / SO⁺(1,9) / bridge": what remains is pure algebra over the derived
  complete ordered field `Cut`, the Clifford algebra `CliffC` of `QvCQuad`, its `ι`, `involute`,
  `contractLeft`, and the submonoid `PinUnitSub` — for every vector `a` and every `x`,
  `ι a · x − involute(x) · ι a = contractLeft (polarBilin a) x`; an element of `PinUnitSub` whose
  twisted conjugation fixes the `ι`-image is killed by every `contractLeft (polarBilin v)`;
  conditional on every such killed element being `algebraMap μ`, every kernel element of the
  restricted `MonoidHom` is `±1`; and `contractLeft (polarBilin mTimeUnit) (ι mTimeUnit) =
  algebraMap 2 ≠ 0`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`; `CliffordAlgebra` / `ι` /
  `involute` / `contractLeft` / `polarBilin` / `MonoidHom` / `Submonoid` are MACHINERY on the
  derived form), NO posited Clifford/Pin/Spin/cover/kernel/centralizer structure.
-/
import Phys.Algebra.LorentzContinuumCliffordPinExactKernel
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The master identity — the graded commutator with `ι a` is the interior product. -/

/-- ★★ THE MASTER IDENTITY: for every vector `a` and every `x : CliffC`,
    `ι a · x − involute(x) · ι a = contractLeft (polarBilin a) x`. The graded commutator of `x`
    with the generator `ι a` equals the interior product of `x` by the polar dual of `a`. Proved
    by `left_induction`: on `algebraMap r` both sides are `0` (the scalar commutes); on the
    generator step `x = ι m · x'` the super-Leibniz rule `contractLeft_ι_mul` plus the symmetric
    product `ι_mul_ι_add_swap` (`ι a · ι m + ι m · ι a = algebraMap (polar a m)`) and the involute
    sign `involute (ι m) = -ι m` close it by `noncomm_ring`. The cascade's own Born contraction. -/
theorem master_contract (a : STVC) (x : CliffC) :
    CliffordAlgebra.ι QvCQuad a * x
        - CliffordAlgebra.involute x * CliffordAlgebra.ι QvCQuad a
      = CliffordAlgebra.contractLeft (QuadraticMap.polarBilin QvCQuad a) x := by
  induction x using CliffordAlgebra.left_induction with
  | algebraMap r =>
      rw [CliffordAlgebra.contractLeft_algebraMap, AlgHom.commutes,
        Algebra.commutes r (CliffordAlgebra.ι QvCQuad a), sub_self]
  | add x y hx hy =>
      rw [map_add, map_add, mul_add, add_mul, ← hx, ← hy]; abel
  | ι_mul x m hx =>
      have key : CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad m
          + CliffordAlgebra.ι QvCQuad m * CliffordAlgebra.ι QvCQuad a
          = algebraMap Cut CliffC (QuadraticMap.polar QvCQuad a m) :=
        CliffordAlgebra.ι_mul_ι_add_swap a m
      rw [map_mul, CliffordAlgebra.involute_ι, CliffordAlgebra.contractLeft_ι_mul, ← hx,
          QuadraticMap.polarBilin_apply_apply, Algebra.smul_def, ← key]
      noncomm_ring

/-! ## Covers-id dissolves into the contraction kernel. -/

/-- THE COVERING-ID COMMUTATOR VANISHES: if a unit `u` covers the identity operator, then
    `involute(↑u) · ι v = ι v · ↑u` for every `v`. From the twisted-adjoint cover relation
    `involute(↑u)·ι v·↑u⁻¹ = ι v`, multiplying on the right by `↑u`. -/
theorem covers_id_comm {u : CliffCˣ} (h : CliffCovers u (1 : Module.End Cut STVC)) (v : STVC) :
    CliffordAlgebra.involute (u : CliffC) * CliffordAlgebra.ι QvCQuad v
      = CliffordAlgebra.ι QvCQuad v * (u : CliffC) := by
  have hv := h v
  rw [Module.End.one_apply] at hv
  have hmul := congrArg (fun z => z * (u : CliffC)) hv
  simp only at hmul
  rw [mul_assoc, ← Units.val_mul, inv_mul_cancel, Units.val_one, mul_one] at hmul
  exact hmul

/-- COVERS-ID ⟹ THE CONTRACTION KERNEL: if `u` covers the identity then every interior product of
    `↑u` by a polar dual vanishes — `contractLeft (polarBilin v) ↑u = 0` for all `v`. The
    supercenter condition AS a contraction-kernel condition, via the master identity (M): the
    graded commutator `ι v · ↑u − involute(↑u) · ι v` is the interior product, and covers-id makes
    that commutator vanish. -/
theorem covers_id_contract_zero {u : CliffCˣ} (h : CliffCovers u (1 : Module.End Cut STVC))
    (v : STVC) :
    CliffordAlgebra.contractLeft (QuadraticMap.polarBilin QvCQuad v) (u : CliffC) = 0 := by
  rw [← master_contract v (u : CliffC), covers_id_comm h v, sub_self]

/-! ## Kernel elements of the unit-normalized cover are killed by every interior product. -/

/-- A kernel element of `coverMapPinUnit` covers the identity: by definition its covered operator
    is `1`. -/
theorem mker_covers_id {u : PinUnitSub} (hu : u ∈ MonoidHom.mker coverMapPinUnit) :
    CliffCovers (u : CliffCˣ) (1 : Module.End Cut STVC) := by
  have hval : (coverMapPinUnit u : Module.End Cut STVC) = 1 := by
    rw [MonoidHom.mem_mker] at hu
    exact congrArg Subtype.val hu
  rw [coverMapPinUnit_coe] at hval
  have hcov := coverOp_covers ⟨(u : CliffCˣ), pinUnitSub_le_coversSub u.prop⟩
  rwa [hval] at hcov

/-- ★★ THE HEADLINE — KERNEL ELEMENTS ARE KILLED BY EVERY INTERIOR PRODUCT: every kernel element
    `u` of `coverMapPinUnit` satisfies `contractLeft (polarBilin v) ↑u = 0` for all `v`. The
    Clifford supercenter=scalars obstruction (Mathlib-absent, measured at N147) REDUCED — through
    the cascade's own Born contraction — to a single clean contraction-kernel statement. The only
    remaining link to "scalar" is that an element killed by every polar-dual interior product is
    `algebraMap μ` (Lemma Z, childed N149). -/
theorem mker_coverMapPinUnit_contract_zero {u : PinUnitSub}
    (hu : u ∈ MonoidHom.mker coverMapPinUnit) (v : STVC) :
    CliffordAlgebra.contractLeft (QuadraticMap.polarBilin QvCQuad v)
        ((u : CliffCˣ) : CliffC) = 0 :=
  covers_id_contract_zero (mker_covers_id hu) v

/-! ## The conditional assembly — the exact kernel `⊆` direction, the missing link explicit. -/

/-- ★★ THE CONDITIONAL ASSEMBLY of the EXACT KERNEL `⊆` direction. GIVEN the one remaining link
    `hZ` — every element of `CliffC` killed by every polar-dual interior product is a scalar
    `algebraMap μ` (Lemma Z, the contraction-kernel=scalars fact, childed N149) — every kernel
    element of `coverMapPinUnit` is `±1`. The chain: a kernel element is killed by every interior
    product (`mker_coverMapPinUnit_contract_zero`), `hZ` makes it a scalar, and N147's
    `coverMapPinUnit_injmodcenter_of_scalar` turns scalar into `±1`. This makes EXPLICIT that the
    ONLY un-banked link to the full exact kernel `mker coverMapPinUnit = {1,-1}` is Lemma Z; the
    supercenter half is discharged here through the contraction. -/
theorem coverMapPinUnit_exactKernel_of_contractScalar
    (hZ : ∀ x : CliffC,
        (∀ v : STVC,
          CliffordAlgebra.contractLeft (QuadraticMap.polarBilin QvCQuad v) x = 0) →
        ∃ mu : Cut, x = algebraMap Cut CliffC mu) :
    ∀ u : PinUnitSub, u ∈ MonoidHom.mker coverMapPinUnit →
      (u : CliffCˣ) = 1 ∨ (u : CliffCˣ) = -1 := by
  apply coverMapPinUnit_injmodcenter_of_scalar
  intro u hu
  exact hZ ((u : CliffCˣ) : CliffC) (fun v => mker_coverMapPinUnit_contract_zero hu v)

/-! ## W8 teeth — the interior product genuinely detects grade 1 (non-vacuity). -/

/-- ★ W8 NON-VACUITY — THE INTERIOR PRODUCT GENUINELY DETECTS GRADE 1:
    `contractLeft (polarBilin mTimeUnit) (ι mTimeUnit) = (2 : CliffC)`. By `contractLeft_ι` the
    value is `algebraMap (polarBilin mTimeUnit mTimeUnit) = algebraMap (polar QvCQuad mTimeUnit
    mTimeUnit) = algebraMap (2 • QvCQuad mTimeUnit) = algebraMap (2 • 1) = (2 : CliffC)`
    (`polar_self`, `QvC mTimeUnit = 1`). NONZERO (char 0) — so a non-scalar like `ι mTimeUnit` is
    NOT in the contraction kernel: the headline reduction is a real constraint, not vacuous. The
    read-off the costume C180 negates. -/
theorem contract_iota_timelike :
    CliffordAlgebra.contractLeft (QuadraticMap.polarBilin QvCQuad (mTimeUnit : STVC))
        (CliffordAlgebra.ι QvCQuad (mTimeUnit : STVC)) = (2 : CliffC) := by
  rw [CliffordAlgebra.contractLeft_ι, QuadraticMap.polarBilin_apply_apply,
      QuadraticMap.polar_self, QvCQuad_apply, QvC_mTimeUnit]
  rw [two_nsmul, map_add, map_one]
  norm_num

end

end Phys.Algebra
