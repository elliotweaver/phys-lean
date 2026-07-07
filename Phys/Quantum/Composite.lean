/-
  Phys.Quantum.Composite — N395 (arc-J J5): WAVE-PARTICLE DUALITY, ENTANGLEMENT,
  THE VACUUM — architectural corollaries of the derived Kähler/tensor structure.
  ===========================================================================
  THE FIFTH NODE OF ARC J — the foundations of quantum mechanics. J1 (N391)
  forced the raw 2D real fibre `StateFibre = Cut × Cut`; J2 (N392) derived the
  complex structure `foldComplex`/`J₂` (`J² = −1`); J3 (N393, the capstone)
  derived the Born rule (`bornProb = g² + ω²`, retiring "Born = self-overlap"
  from primitive to theorem); J4 (N394) derived measurement = the gather. Those
  four built the ENTIRE single-probe story — the SPREAD (fibre/phase/Born) and
  the GATHER (measurement). This node (J5) is the NEXT beat of the fold: what
  happens when the fold composes TWO probes.

  ── THE FORWARD DERIVATION (fold → the composite; nothing posited) ──
  The fold is self-look-back. J1–J4 handled ONE look-back. The fold's next act
  is to compose look-backs — the fold acting on TWO probes at once. The fold's
  own self-overlap `bornForm` (N391) is BILINEAR, so the universal carrier of a
  two-probe composition is the TENSOR product of the two fibres:

    · `TwoFibre := StateFibre ⊗[Cut] StateFibre` — the composite carrier, with
      `finrank = 4` (`composite_finrank` = 2 × 2). This is exactly the sector
      tensor structure that J3 and J4 both explicitly DEFERRED here — the ≥2-fibre
      carrier that genuine entanglement lives on (it cannot even be STATED on the
      1-complex-dim single fibre). Building it now is the twice-deferred ascent.
    · The exchange `probeSwap := TensorProduct.comm` (an involution,
      `probeSwap_involutive`) is the SAME braiding functor as G1's exchange
      statistics (`ImO ⊗ ImO`) — the two-quantum exchange, at the state level.

  ── ENTANGLEMENT = NON-FACTORIZABILITY (DERIVED, with teeth) ──
  A product (separable) state is a pure tensor `a ⊗ b`. The coefficient
  functionals `coeff i j` (via `TensorProduct.lift` of the bilinear coordinate
  form) read off the 2×2 coefficient matrix, and the CORRELATION DETERMINANT
  `corrDet Ψ := c₀₀·c₁₁ − c₀₁·c₁₀` is the concurrence of the composite:

    · `corrDet_prod : corrDet (a ⊗ b) = 0` — every product state factorizes, so
      its coefficient matrix has rank ≤ 1 and its determinant vanishes.
    · `bell := eInward ⊗ eInward + eOutward ⊗ eOutward` (the diagonal composite),
      `corrDet_bell : corrDet bell = 1` — nonzero correlation determinant.
    · ★ THE TEETH `bell_not_product : ¬ ∃ a b, bell = a ⊗ b` — a SPECIFIC banked
      composite state that is NOT any product. Entanglement (non-factorizability)
      is DERIVED, not posited: the 4-dim composite carrier is strictly larger than
      the (dim 3) product variety `{corrDet = 0}`, and `bell` sits off it. The
      "spookiness" the field treats as a primitive feature is just `4 > 3`.

  ── WAVE-PARTICLE DUALITY = THE TWO FACES OF THE COMPLEX FIBRE ──
  The banked Born overlap splits (N393) into a REAL face and an IMAGINARY face:

    · `particleFace := bornForm` (the real self-overlap `g`) and
      `waveFace := kahlerForm` (the imaginary/phase `ω`), with
      `born_two_faces : bornProb φ ψ = particleFace² + waveFace²`.
    · The complementarity EXTREMES on the banked frame: a state has FULL
      self-overlap with itself and zero phase (`self_pure_particle`:
      `waveFace eInward eInward = 0`, `particleFace eInward eInward = 1`),
      while `eOutward = J(eInward)` is a pure PHASE of `eInward` — zero real
      overlap, unit phase (`frame_pure_wave`: `particleFace eInward eOutward = 0`,
      `waveFace eInward eOutward = 1`). "Wave" and "particle" are not two objects;
      they are the imaginary and real faces of the ONE derived complex overlap.

  ── THE VACUUM = THE SELF-BLIND ORIGIN ──
  The vacuum is the fold's own origin state `foldVacuum := 0`:

    · `vacuum_unique_zero : bornForm p p = 0 ↔ p = foldVacuum` — it is the UNIQUE
      state with zero self-overlap (positive-definiteness, N391).
    · `vacuum_unique_J_fixed : foldComplex p = p ↔ p = foldVacuum` — it is the
      UNIQUE state fixed by the complex structure. The vacuum IS self-blindness:
      the fold's look-back has exactly one fixed point, the void (C6, N1). This is
      the state-level shadow of the arc-H blank slate (`resetState`, `S_init = 0`).

  WHAT IS BANKED HERE (forward, foundations-only):
    TwoFibre                 — the composite carrier `StateFibre ⊗[Cut] StateFibre`.
    composite_finrank        — `finrank = 4` (the composite is genuinely 4-dim).
    probeSwap / probeSwap_tmul / probeSwap_involutive — the exchange (G1's braiding).
    coeff / coeff_tmul       — the coefficient functionals (via `TensorProduct.lift`).
    corrDet                  — the correlation determinant (concurrence).
    corrDet_prod             — ★ every product state has `corrDet = 0` (separability).
    bell / corrDet_bell      — the diagonal composite has `corrDet = 1`.
    bell_not_product         — ★★ THE TEETH: `bell` is NOT any product (entanglement).
    particleFace / waveFace  — the real / imaginary faces of the banked overlap.
    born_two_faces           — `bornProb = particleFace² + waveFace²`.
    frame_pure_wave / self_pure_particle — the duality complementarity extremes.
    foldVacuum               — the self-blind origin state `0`.
    vacuum_unique_zero       — ★ the UNIQUE zero-self-overlap state.
    vacuum_unique_J_fixed    — ★ the UNIQUE `foldComplex`-fixed state (self-blindness).
    j5_derived               — ★★ THE CAPSTONE: composite carrier + entanglement teeth
                               + duality faces + self-blind vacuum, bundled.

  SCOPE (docs/RUNBOOK.md W4.5). This node derives EXACTLY J5: the composite
  tensor carrier, entanglement as non-factorizability (forward separability
  criterion + a concrete entangled witness), wave-particle duality as the two
  faces of the complex overlap, and the vacuum as the self-blind origin. It does
  NOT derive the FULL separable-variety converse (`corrDet = 0 ⇒ product`, which
  needs a heavy basis reconstruction — deferred to arc K), nor J6's consolidation
  / arc-K dynamics. GRADE: ARCHITECTURAL (flagged, per seed §J5) — the DUALITY and
  VACUUM identifications are corollary faces (physics-words-removable prose, never
  load-bearing theorems), while the ENTANGLEMENT non-factorizability
  (`bell_not_product`) is a FULL THEOREM. NO numerical claim.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "quantum / wave /
  particle / entanglement / vacuum / duality": what remains is the pure statement
  that the tensor square of the banked 2D carrier `StateFibre` has finrank 4; that
  the quadratic functional `corrDet` vanishes on every pure tensor `a ⊗ b` but
  equals `1` on the diagonal element `eInward⊗eInward + eOutward⊗eOutward` (which
  is therefore not a pure tensor); that the banked `bornForm` and `kahlerForm` are
  the two coordinate faces of the banked overlap with `bornProb = bornForm² +
  kahlerForm²`; and that `0` is the unique `bornForm`-null and the unique
  `foldComplex`-fixed vector. No theorem STATEMENT needs a physics word to be true.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
  Built on the BANKED derived ℝ `Cut`, the banked fibre / frame / self-overlap
  `StateFibre`/`eInward`/`eOutward`/`bornForm` (N391), the banked complex structure
  `foldComplex` / Kähler `kahlerForm` / Born `bornProb` (N392/N393), and Mathlib's
  `TensorProduct` as MACHINERY over the derived `Cut` — NO Mathlib `Real` /
  `Complex` as content, NO posited composite-system / entanglement / vacuum postulate.
-/
import Mathlib.Tactic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule

namespace Phys.Quantum

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open scoped TensorProduct

/-! ## The composite carrier — the twice-deferred ≥2-fibre tensor. -/

/-- THE COMPOSITE CARRIER. The fold composes two probes; the universal carrier of
    the bilinear self-overlap composition is the tensor product of the two banked
    fibres. This is the sector tensor structure J3/J4 deferred here — the carrier
    genuine entanglement lives on (it cannot be stated on the 1-dim single fibre). -/
abbrev TwoFibre := StateFibre ⊗[ContinuumQ.Cut] StateFibre

/-- The composite is genuinely 4-dimensional (`2 × 2`) — strictly larger than the
    (dim ≤ 3) variety of product states, which is why entanglement exists. -/
theorem composite_finrank : finrank ContinuumQ.Cut TwoFibre = 4 := by
  rw [Module.finrank_tensorProduct, fibre_finrank]

/-! ## The exchange — the same braiding as G1's exchange statistics. -/

/-- THE EXCHANGE of the two probes — the tensor braiding `TensorProduct.comm`. This
    is the SAME exchange functor as G1's exchange statistics on `ImO ⊗ ImO`, at the
    state level: the two-quantum exchange structure. -/
noncomputable def probeSwap : Module.End ContinuumQ.Cut TwoFibre :=
  (TensorProduct.comm ContinuumQ.Cut StateFibre StateFibre).toLinearMap

/-- The exchange swaps the two probes: `probeSwap (a ⊗ b) = b ⊗ a`. -/
@[simp] theorem probeSwap_tmul (a b : StateFibre) : probeSwap (a ⊗ₜ b) = b ⊗ₜ a := by
  simp [probeSwap]

/-- The exchange is an INVOLUTION (`probeSwap² = 1`) — swapping twice returns the
    composite: the exchange-statistics structure of the two-probe system. -/
theorem probeSwap_involutive : probeSwap * probeSwap = 1 := by
  apply TensorProduct.ext'
  intro a b
  simp only [Module.End.mul_apply, probeSwap_tmul, Module.End.one_apply]

/-! ## The coefficient functionals and the correlation determinant. -/

/-- The bilinear coordinate form `(p, q) ↦ pᵢ · qⱼ` on the two banked fibres. -/
noncomputable def bil (i j : Bool) :
    StateFibre →ₗ[ContinuumQ.Cut] StateFibre →ₗ[ContinuumQ.Cut] ContinuumQ.Cut :=
  LinearMap.mk₂ ContinuumQ.Cut
    (fun p q => (if i then p.2 else p.1) * (if j then q.2 else q.1))
    (by intro p1 p2 q; cases i <;> cases j <;> simp <;> ring)
    (by intro c p q; cases i <;> cases j <;> simp <;> ring)
    (by intro p q1 q2; cases i <;> cases j <;> simp <;> ring)
    (by intro c p q; cases i <;> cases j <;> simp <;> ring)

/-- THE COEFFICIENT FUNCTIONALS on the composite: `coeff i j Ψ` reads off the `(i,j)`
    entry of the 2×2 coefficient matrix of `Ψ` (via `TensorProduct.lift` — linear). -/
noncomputable def coeff (i j : Bool) : TwoFibre →ₗ[ContinuumQ.Cut] ContinuumQ.Cut :=
  TensorProduct.lift (bil i j)

@[simp] theorem coeff_tmul (i j : Bool) (a b : StateFibre) :
    coeff i j (a ⊗ₜ b) = (if i then a.2 else a.1) * (if j then b.2 else b.1) := by
  simp [coeff, bil]

/-- THE CORRELATION DETERMINANT (the concurrence): the determinant of the composite's
    2×2 coefficient matrix, `corrDet Ψ := c₀₀·c₁₁ − c₀₁·c₁₀`. It measures the failure
    of `Ψ` to factorize into a product of the two probes. -/
noncomputable def corrDet (Ψ : TwoFibre) : ContinuumQ.Cut :=
  coeff false false Ψ * coeff true true Ψ - coeff false true Ψ * coeff true false Ψ

/-! ## Entanglement = non-factorizability, DERIVED with teeth. -/

/-- SEPARABILITY: every PRODUCT (factorizable) composite state has `corrDet = 0`. A
    product `a ⊗ b` has coefficient matrix `aᵢ·bⱼ` of rank ≤ 1, so its determinant
    vanishes. Hence `corrDet ≠ 0 ⇒ the state is NOT a product` — entanglement. -/
theorem corrDet_prod (a b : StateFibre) : corrDet (a ⊗ₜ b) = 0 := by
  unfold corrDet; simp only [coeff_tmul]; ring

/-- THE DIAGONAL COMPOSITE (the Bell / EPR state): `bell := e₁⊗e₁ + e₂⊗e₂`. -/
noncomputable def bell : TwoFibre := eInward ⊗ₜ eInward + eOutward ⊗ₜ eOutward

/-- The diagonal composite has NONZERO correlation determinant: `corrDet bell = 1`. -/
theorem corrDet_bell : corrDet bell = 1 := by
  unfold corrDet bell
  simp only [map_add, coeff_tmul, eInward, eOutward]
  norm_num

/-- ★★ THE TEETH — GENUINE ENTANGLEMENT, DERIVED. The diagonal composite `bell` is
    NOT any product `a ⊗ b`: if it were, its correlation determinant would vanish
    (`corrDet_prod`), but `corrDet bell = 1 ≠ 0` (`corrDet_bell`). Non-factorizability
    is not posited — it is forced: the 4-dim composite carrier is strictly larger
    than the product variety `{corrDet = 0}`, and `bell` sits off it. The "spooky"
    entanglement the field treats as a primitive feature is the concrete fact `4 > 3`. -/
theorem bell_not_product : ¬ ∃ a b : StateFibre, bell = a ⊗ₜ b := by
  rintro ⟨a, b, hab⟩
  have h1 : corrDet bell = 1 := corrDet_bell
  have h2 : corrDet bell = 0 := by rw [hab]; exact corrDet_prod a b
  rw [h1] at h2; exact one_ne_zero h2

/-! ## Wave-particle duality — the two faces of the derived complex overlap. -/

/-- THE PARTICLE FACE — the REAL part of the derived overlap, the self-overlap `g`. -/
noncomputable def particleFace (p q : StateFibre) : ContinuumQ.Cut := bornForm p q

/-- THE WAVE FACE — the IMAGINARY part of the derived overlap, the Kähler phase `ω`. -/
noncomputable def waveFace (p q : StateFibre) : ContinuumQ.Cut := kahlerForm p q

/-- THE DUALITY. The banked Born probability splits into the two faces:
    `bornProb φ ψ = particleFace² + waveFace²`. "Wave" and "particle" are the
    imaginary and real faces of the ONE derived complex overlap, not two objects. -/
theorem born_two_faces (φ ψ : StateFibre) :
    bornProb φ ψ = (particleFace φ ψ) ^ 2 + (waveFace φ ψ) ^ 2 := rfl

/-- COMPLEMENTARITY (pure particle). A state has full self-overlap with itself and
    zero phase: `waveFace e₁ e₁ = 0`, `particleFace e₁ e₁ = 1`. -/
theorem self_pure_particle :
    waveFace eInward eInward = 0 ∧ particleFace eInward eInward = 1 :=
  ⟨kahlerForm_self eInward, bornForm_eInward_self⟩

/-- COMPLEMENTARITY (pure wave). `eOutward = J(eInward)` is a pure PHASE of `eInward`:
    zero real overlap, unit phase — `particleFace e₁ e₂ = 0`, `waveFace e₁ e₂ = 1`.
    The two frame directions are complementary faces of the same complex ray. -/
theorem frame_pure_wave :
    particleFace eInward eOutward = 0 ∧ waveFace eInward eOutward = 1 := by
  refine ⟨bornForm_eInward_eOutward, ?_⟩
  unfold waveFace; rw [kahlerForm_apply]; simp [eInward, eOutward]

/-! ## The vacuum — the self-blind origin state. -/

/-- THE VACUUM — the fold's own origin state `0`. The state-level shadow of the
    arc-H blank slate (`resetState`, `S_init = 0`). -/
noncomputable def foldVacuum : StateFibre := 0

/-- The vacuum is the UNIQUE state with zero self-overlap (positive-definiteness, N391):
    `bornForm p p = 0 ↔ p = foldVacuum`. -/
theorem vacuum_unique_zero (p : StateFibre) : bornForm p p = 0 ↔ p = foldVacuum :=
  bornForm_self_eq_zero p

/-- ★ THE VACUUM IS SELF-BLINDNESS. The vacuum is the UNIQUE state fixed by the complex
    structure: `foldComplex p = p ↔ p = foldVacuum`. The fold's look-back has exactly one
    fixed point — the void (C6, N1). The vacuum is not a postulated ground state; it is
    the fold's own self-blind origin. -/
theorem vacuum_unique_J_fixed (p : StateFibre) : foldComplex p = p ↔ p = foldVacuum :=
  ⟨fun h => foldComplex_self_blind p h, fun h => by rw [h]; simp [foldVacuum]⟩

/-! ## THE CAPSTONE — J5, the architectural corollaries, DERIVED. -/

/-- ★★ THE CAPSTONE — WAVE-PARTICLE DUALITY, ENTANGLEMENT, THE VACUUM, DERIVED. On the
    banked complex fibre (N391–N393) and its composite tensor square:
    (i)   the composite carrier `TwoFibre` is genuinely 4-dimensional, with the
          two-probe exchange an involution (G1's braiding at the state level);
    (ii)  ENTANGLEMENT is DERIVED with teeth — every product state has `corrDet = 0`,
          yet the diagonal composite `bell` has `corrDet = 1` and is therefore NOT any
          product (`bell_not_product`): non-factorizability is forced, not posited;
    (iii) WAVE-PARTICLE DUALITY is the two faces of the ONE derived overlap
          (`bornProb = particleFace² + waveFace²`), with complementary extremes on the
          frame; and
    (iv)  the VACUUM is the self-blind origin — the UNIQUE zero-self-overlap state and
          the UNIQUE `foldComplex`-fixed state (self-blindness, C6/N1).
    Nothing is posited: the composite carrier is the universal bilinear carrier of the
    fold's self-overlap; entanglement is `dim 4 > dim 3`; duality is real-face/imag-face;
    the vacuum is the fold's own fixed point. The remaining QM foundations fall out of
    the derived Kähler/tensor structure. -/
theorem j5_derived :
    -- (i) the composite carrier is 4-dim, the exchange is an involution.
    (finrank ContinuumQ.Cut TwoFibre = 4) ∧
    (probeSwap * probeSwap = 1) ∧
    -- (ii) entanglement: products factor (corrDet 0), bell does not (the teeth).
    (∀ a b : StateFibre, corrDet (a ⊗ₜ b) = 0) ∧
    (corrDet bell = 1) ∧
    (¬ ∃ a b : StateFibre, bell = a ⊗ₜ b) ∧
    -- (iii) wave-particle duality: the two faces of the one overlap.
    (∀ φ ψ : StateFibre, bornProb φ ψ = (particleFace φ ψ) ^ 2 + (waveFace φ ψ) ^ 2) ∧
    (particleFace eInward eOutward = 0 ∧ waveFace eInward eOutward = 1) ∧
    -- (iv) the vacuum: the unique self-blind origin.
    (∀ p : StateFibre, bornForm p p = 0 ↔ p = foldVacuum) ∧
    (∀ p : StateFibre, foldComplex p = p ↔ p = foldVacuum) := by
  refine ⟨composite_finrank, probeSwap_involutive, corrDet_prod, corrDet_bell,
    bell_not_product, born_two_faces, frame_pure_wave, vacuum_unique_zero,
    vacuum_unique_J_fixed⟩

end Phys.Quantum
