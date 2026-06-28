/-
  Phys.Algebra.LorentzContinuumGenerationSO8ReflectionInvolution — N118: THE OCTONION-BLOCK
  REFLECTION-INVOLUTION + THE OCTONION-BLOCK FACTORIZATION (the `SO(8)` reassembly — the
  octonion-block analogue of N116's `x`-block `inflate_deflate_id` / `deflate_factorization`).

  ===========================================================================
  CONTEXT. N115 banked the `x`-deflation STEP (the `SO(9) → SO(8)` peel) and N116 the
  REASSEMBLY (the factorization: every `x`-moving compact isometry = one explicit ninth rotation
  · one `x`-FIXING isometry). N117 banked the OCTONION-BLOCK deflation STEP (`octDeflate_step`:
  an octonion-block `QvC`-isometry `T` moving a chosen unit-imaginary axis `e` — `T(0,0,e) =
  (0,0,w)`, `w ≠ e` — is peeled by the explicit bisector reflection `octDeflate e w` back to
  FIXING `(0,0,e)`). The `x`-MOTION half of the compact-`SO(9)` exhaustion is COMPLETE (step +
  reassembly); the octonion-block deflation STEP is banked. What remains on the octonion-block
  side, BEFORE the full global iteration, is the REASSEMBLY — the octonion-block analogue of
  N116: factoring an arbitrary octonion-block isometry as `(bisector reflection)·(axis-fixing
  part)`. THIS node banks that reassembly — ROADMAP §N118 priority (i)'s named immediately-
  bankable structural piece. The GLOBAL octonion-block exhaustion (the full iteration to
  surjectivity) + the operator topology over `Cut` stay the childed heavy remainder.

  ── THE MEASURE-FIRST FINDING (the ticket's ⚠ "±1" warning, RESOLVED) ──
  The ticket warns that a single `biMulLin n n` with unit-imaginary `n` is an involution ONLY up
  to the global sign the half-turn carries — and instructs: MEASURE the exact `octDeflate e w ·
  octDeflate e w` before committing. THE MEASUREMENT (no new heavy compute — a direct consequence
  of the banked chain): N102's `biMulLin_imag_involutive` ALREADY PROVES `(biMulLin u u).comp
  (biMulLin u u) = LinearMap.id` — EXACTLY the identity, +1 on EVERY block. The `(t,x)` block is
  fixed pointwise by `biMulLin`; on the octonion `v`-block the two-sided half-turn applied TWICE
  is the full turn = the identity (`u·((u·(v·u))·u) = v` for a unit-imaginary `u` with `u·u = −1`
  and the left-alternative `u·(u·z) = −z`). The "±1" is RESOLVED to +1: a `π` half-turn applied
  twice is a `2π` full turn — the identity, with NO residual global sign. So the involution is NOT
  a new heavy measurement; it is the banked N102 involution instantiated at the normalized
  bisector `n := r⁻¹·(e − w)`, whose two required hypotheses both descend from already-banked
  facts (`octBisector_unit` + `octRefl_mul_self_imag` give `n·n = −1`; the left-alternative law
  `mul_mul_left` (N5b) gives `n·(n·z) = −z`).

  ── WHAT THIS NODE BANKS ──
  `octBisector_imag` — the normalized bisector `n := r⁻¹·(e − w)` is imaginary (`star n = −n`), a
    scalar multiple of the imaginary difference `e − w` (`smulCompat_oCut.hstar` + `star_sub`).
  `octDeflate_sq_neg_one` — `n · n = −1` (the imaginary square `octRefl_mul_self_imag` at the
    Born-unit bisector `octBisector_unit`: `n·n = −(gFormC n n)·1 = −1·1 = −1`).
  `octDeflate_mul_mul_left` — `∀ z, n·(n·z) = −z` (the left-alternative law `mul_mul_left` (N5b):
    `n·(n·z) = (n·n)·z = (−1)·z = −z` — the ONLY contact with non-associativity, and it holds
    regardless; NO associativity assumed).
  ★ `octDeflate_involution` — THE REFLECTION INVOLUTION: `octDeflate e w · octDeflate e w = 1`.
    The exact reflection-square (the ticket's measured `octDeflate e w · octDeflate e w`), `= 1`
    on every block, the banked N102 `biMulLin_imag_involutive` instantiated at the bisector — the
    immediately-bankable structural piece.
  ★★ `octDeflate_factorization` — THE OCTONION-BLOCK FACTORIZATION: for ANY octonion-block
    `QvC`-isometry `T` with `T(0,0,e) = (0,0,w)` (`e` unit-imaginary, `w ≠ e`),
    `T = octDeflate e w · (octDeflate e w · T)` — the octonion-block analogue of N116's
    `deflate_factorization`. The right factor `octDeflate e w · T` FIXES `(0,0,e)`
    (`octDeflate_step` N117), the left factor `octDeflate e w` is one explicit block reflection.
  ★★ `octDeflate_factorization_stabilizer` — both halves packaged: the right factor is `e`-FIXING
    (lands in the axis-fixing stabilizer) AND `T` is the reflection of it (the octonion-block
    analogue of `deflate_factorization_stabilizer`). The exhaustion induction's reassembly step
    for the octonion block: an arbitrary octonion-block isometry MOVING a unit-imaginary axis is
    one explicit bisector reflection composed with an axis-FIXING isometry.
  W8 teeth: the involution ROUND-TRIP made concrete — `octDeflate e₂ ιe₂` applied TWICE to the
    moved image `(0,0,ιe₂)` returns `(0,0,ιe₂)` (`octDeflate_involution_witness`), the deep
    coordinate reading `ιe₂` back (`octDeflate_roundtrip_coord`).

  ── HOW IT DESCENDS FROM THE TRUNK (UNBROKEN) ──
  Every object is DERIVED: the half-turn INVOLUTION `biMulLin_imag_involutive` (N102, the
  two-sided square law across the faithful monoid bridge `endToFunEnd` — NO coordinate brute);
  the ALTERNATIVE law `mul_mul_left` (N5b — the cap's positive lever, the octonion alternativity
  FORWARD from the Cayley–Dickson product); the imaginary square `octRefl_mul_self_imag` and the
  Born-unit bisector `octBisector_unit` (N117); the deflation STEP `octDeflate_step` (N117);
  `smulCompat_oCut` (`Cut` central on `O Cut`, N-DerivationOExp); `gFormC` / `cutSqrt` /
  `gFormC_pos_of_ne` (N56/N57/N115); the `Module.End` / `Field Cut` MACHINERY on the DERIVED
  objects (STANDARD §3) — over the derived ℝ `ContinuumQ.Cut` and the terminal algebra
  `O Cut := CD (H Cut)`. NOT a posited Lorentz group / SO⁺(1,9), NOT a posited reflection/Clifford
  group, NOT a posited operator topology, NOT Mathlib ℝ/ℂ as content, NOT a bridge.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). The literature POSITS the full `Spin(8)` /
  `SO(8)` and reads off the Cartan–Dieudonné theorem (every orthogonal transformation is a product
  of reflections, each reflection an involution) as the standard structure theorem. Here the
  octonion-block reflection-involution and the resulting factorization are CONSTRUCTED forward
  from the trunk: the reflection squares to the identity because the banked half-turn squared is
  the full turn (the N102 involution), instantiated at a bisector whose `n·n = −1` and
  `n·(n·z) = −z` descend from the imaginary square and ONE alternative law — NOT a posited
  involutive-reflection-group structure. The non-associativity obstruction is NAVIGATED, not
  assumed away: the only contact with non-associativity is the left-alternative law `mul_mul_left`,
  which the octonions KEEP (alternativity) even though they LOST associativity at the cascade stop.

  ── THE FORWARD REMAINDER (childed N119) ──
  The GLOBAL octonion-block exhaustion (iterating `octDeflate_step` + this reassembly across a full
  unit-imaginary basis to full octonion-block surjectivity — every octonion-block `QvC`-isometry a
  finite bisector-reflection product) + the literal operator TOPOLOGY over `Cut` remain the HEAVY
  group-manifold core. THIS node banks the octonion-block reassembly (the reflection-involution +
  the factorization) — the immediately-bankable structural piece of ROADMAP §N118 priority (i).

  ── PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2) ──
  Delete "Lorentz / rotation / reflection / half-turn / involution / isometry / compact / orthogonal
  / SO(8) / Spin / Clifford / Householder / Cartan / Dieudonné / bisector / axis / deflation /
  factorization / reassembly / stabilizer / generation / octonion-block": what remains is pure
  linear algebra over the derived complete ordered field `Cut` — for unit-imaginary `e ≠ w` with
  `n := (cutSqrt (gFormC (e−w) (e−w)))⁻¹·(e−w)`, the operator `biMulLin n n` of
  `Module.End Cut (Cut × Cut × O Cut)` satisfies `biMulLin n n · biMulLin n n = 1`; consequently for
  any `Cut`-linear `T` preserving `QvC` with `T(0,0,e) = (0,0,w)` and `w ≠ e`,
  `T = biMulLin n n · (biMulLin n n · T)`, the left factor `biMulLin n n` and the right factor
  `biMulLin n n · T` fixing `(0,0,e)`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge-in-the-forbidden-sense, NO Mathlib number-system content import (the continuum is the
  DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The normalized bisector is a unit-imaginary octonion with `n·n = −1`, `n·(n·z) = −z`. -/

/-- The normalized bisector `n := r⁻¹·(e − w)` (`r := cutSqrt (gFormC (e−w) (e−w))`) is IMAGINARY:
    `star n = −n`. A scalar multiple of the imaginary difference `e − w` (`star (e−w) = −(e−w)` by
    `star_sub` on the imaginary `e, w`), with the central scalar passed through `star` by the
    smul–star compatibility `smulCompat_oCut.hstar`. -/
theorem octBisector_imag {e w : O Cut} (he : star e = -e) (hw : star w = -w) :
    star ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))
      = -((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) := by
  have hmim : star (e - w) = -(e - w) := by rw [star_sub, he, hw]; abel
  rw [smulCompat_oCut.hstar, hmim, smulCompat_oCut.hneg]

/-- THE BISECTOR SQUARE: `n · n = −1`. The imaginary square (`octRefl_mul_self_imag`,
    `m·m = −(gFormC m m)·1`) at the Born-unit bisector (`octBisector_unit`, `gFormC n n = 1`):
    `n·n = −(1)·1 = −1`. The unit-imaginary square the half-turn involution requires. -/
theorem octDeflate_sq_neg_one {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hne : e - w ≠ 0) :
    ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) *
      ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) = -1 := by
  rw [octRefl_mul_self_imag (octBisector_imag he hw), octBisector_unit hne]; simp

/-- THE LEFT-ALTERNATIVE LAW AT THE BISECTOR: `∀ z, n·(n·z) = −z`. The banked alternative law
    `mul_mul_left` (N5b — `n·(n·z) = (n·n)·z`, the ONLY contact with octonion non-associativity,
    holding regardless) composed with the bisector square (`octDeflate_sq_neg_one`):
    `n·(n·z) = (n·n)·z = (−1)·z = −z`. The deep-left half-turn relation the N102 involution needs. -/
theorem octDeflate_mul_mul_left {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hne : e - w ≠ 0) (z : O Cut) :
    ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) *
      (((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) * z) = -z := by
  rw [mul_mul_left, octDeflate_sq_neg_one he hw hne, neg_one_mul]

/-! ## The reflection involution — the exact reflection-square `octDeflate e w · octDeflate e w`. -/

/-- ★ THE REFLECTION INVOLUTION — the exact reflection-square: `octDeflate e w · octDeflate e w = 1`
    (`= 1` on EVERY block, NO residual global sign). The ticket's measured `octDeflate e w ·
    octDeflate e w`: the banked N102 `biMulLin_imag_involutive` (the two-sided half-turn squared is
    the full turn = the identity, across the faithful monoid bridge — NO coordinate brute)
    instantiated at the normalized bisector `n := r⁻¹·(e − w)`, whose two hypotheses are the
    bisector square `n·n = −1` (`octDeflate_sq_neg_one`) and the left-alternative relation
    `n·(n·z) = −z` (`octDeflate_mul_mul_left`). `octDeflate e w := biMulLin n n` by definition, and
    `comp = *`, `id = 1`, so the N102 statement IS this one definitionally. The immediately-bankable
    structural piece — the octonion-block analogue of N116's `inflate_deflate_id`. -/
theorem octDeflate_involution {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hne : e - w ≠ 0) :
    octDeflate e w * octDeflate e w = 1 :=
  biMulLin_imag_involutive ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))
    (octDeflate_sq_neg_one he hw hne) (octDeflate_mul_mul_left he hw hne)

/-! ## The octonion-block factorization — the reassembly step. -/

/-- ★★ THE OCTONION-BLOCK FACTORIZATION — the octonion-block analogue of N116's
    `deflate_factorization`. For unit-imaginary `e ≠ w` and ANY operator `T`,
    `T = octDeflate e w · (octDeflate e w · T)`. Immediate from the reflection involution:
    `octDeflate e w · (octDeflate e w · T) = (octDeflate e w · octDeflate e w) · T = 1 · T = T`
    (`mul_assoc` + `octDeflate_involution` + `one_mul`). UNCONDITIONAL in `T` — the octonion-block
    REFLECTION is a genuine involution requiring NO sphere-norm condition, the structural CONTRAST
    with N116's `x`-block rotation (whose `inflate_deflate_id` needed `x'² + r² = 1`); the left
    factor `octDeflate e w` is one explicit block reflection, the right factor `octDeflate e w · T`
    is the deflated operator. (Paired with the axis-fixing property in
    `octDeflate_factorization_stabilizer`, where the moved-axis isometry hypotheses become
    load-bearing through `octDeflate_step`.) The `SO(8)` octonion-block reassembly step, DERIVED. -/
theorem octDeflate_factorization (T : Module.End Cut STVC)
    {e w : O Cut} (he : star e = -e) (hw : star w = -w) (hne : e - w ≠ 0) :
    T = octDeflate e w * (octDeflate e w * T) := by
  rw [← mul_assoc, octDeflate_involution he hw hne, one_mul]

/-- ★★ THE FACTORIZATION PACKAGED — both halves of the octonion-block reassembly step: the right
    factor `octDeflate e w · T` is `e`-FIXING (lands in the axis-fixing stabilizer,
    `octDeflate_step` N117) AND `T` is the reflection of it (`octDeflate_factorization`). An
    arbitrary octonion-block `QvC`-isometry MOVING a chosen unit-imaginary axis is one explicit
    bisector reflection composed with an axis-FIXING isometry — the octonion-block analogue of
    `deflate_factorization_stabilizer`. The inner reduction (the axis-fixing isometry → a shorter
    octonion-block word, the full global generation) stays the childed remainder. -/
theorem octDeflate_factorization_stabilizer {T : Module.End Cut STVC}
    {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hee : gFormC e e = 1) (hww : gFormC w w = 1)
    (hTimg : T ((0:Cut), (0:Cut), e) = ((0:Cut), (0:Cut), w)) (hne : e - w ≠ 0) :
    (octDeflate e w * T) ((0:Cut), (0:Cut), e) = ((0:Cut), (0:Cut), e) ∧
    T = octDeflate e w * (octDeflate e w * T) :=
  ⟨octDeflate_step he hw hee hww hTimg hne,
   octDeflate_factorization T he hw hne⟩

/-! ## W8 teeth — the involution round-trip made concrete on `(0,0,ιe₂)`. -/

/-- ★ W8 — the involution ROUND-TRIP made concrete: applying `octDeflate e₂ ιe₂` TWICE to the moved
    image `(0,0,ιe₂)` returns `(0,0,ιe₂)`. The reflect-back (`octDeflate e₂ ιe₂ (0,0,ιe₂) =
    (0,0,e₂)`) composed with itself is the identity (`octDeflate_involution` at the genuine
    axis-moving pair `e₂ ≠ ιe₂`, `octDeflate_witness_ne`) — a `2π` full turn returning the start. -/
theorem octDeflate_involution_witness :
    octDeflate (CD.e2 : O Cut) (je2 : O Cut)
      (octDeflate (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut), (0:Cut), (je2 : O Cut)))
      = ((0:Cut), (0:Cut), (je2 : O Cut)) := by
  rw [← Module.End.mul_apply,
      octDeflate_involution e2_imag je2_imag octDeflate_witness_ne]
  rfl

/-- ★ W8 TEETH — the deep octonion coordinate of the round-tripped image reads `ιe₂` back. The
    distinguishing read-off: the moved image `ιe₂`, reflected to `e₂` and back, returns `ιe₂`. -/
theorem octDeflate_roundtrip_coord :
    (octDeflate (CD.e2 : O Cut) (je2 : O Cut)
      (octDeflate (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut), (0:Cut), (je2 : O Cut)))).2.2
      = (je2 : O Cut) := by
  rw [octDeflate_involution_witness]

end

end Phys.Algebra
