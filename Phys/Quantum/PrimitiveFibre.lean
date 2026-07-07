/-
  Phys.Quantum.PrimitiveFibre — N391 (arc-J J1): THE PRIMITIVE 2D REAL FIBRE.
  ===========================================================================
  THE FIRST NODE OF ARC J — the foundations of quantum mechanics. Arcs A–I use
  "Born = self-overlap = positivity" as a TRUNK PRIMITIVE. Arc J closes the deepest
  self-consistency loop: it derives the Born rule as a THEOREM, so that primitive
  becomes a derived fact OF the chain. J1 (this node) builds the RAW CARRIER the
  Born rule will live on — the 2-DIMENSIONAL REAL fibre, prior to any complex
  structure or gauge group — and shows it is FORCED, not posited.

  ── THE FORWARD DERIVATION (fold → the forced 2D carrier; nothing posited) ──
  The fold (N1) is self-look-back; the look-back is `-id` and SELF-BLIND — it has no
  nonzero fixed point (`fold_self_blind`). Recursive self-blindness — the look-back
  applied to itself — is the search for a SQUARE ROOT of the look-back, a *fold-root*
  (`IsFoldRoot`, N2). Now the carrier is forced by two BANKED obstructions, both the
  SAME trunk positivity (Born = self-overlap ≥ 0):

    · THE LINE IS BLOCKED. On the derived line `Cut` (dim 1) no fold-root exists:
      a linear endo is `c·(·)` and `J∘J = -id` forces `c² = -1`, impossible since
      `c² ≥ 0 > -1` over the ordered field `Cut` (banked `no_foldRoot_dim1`). The
      unity that looks back cannot find its own root within the line.
    · EVEN DIMENSION IS FORCED. Any linear fold-root on a finite-dimensional space
      over an ordered field forces EVEN dimension — `det(J)² = (-1)^dim ≥ 0`, the
      SAME positivity (banked `foldRoot_forces_even_dim`). The line (dim 1, odd) is
      therefore blocked, and the minimal nontrivial even dimension is 2.
    · DIM 2 IS ACHIEVED. The doubled line `Cut × Cut` carries the fold-root operator
      `J₂(a,b) = (-b,a)` (banked `J₂`, `J₂_isFoldRoot`).

  ⇒ the raw probe carrier is FORCED to be the 2D real fibre `Cut × Cut` — the two
  directions of the look-back (`eInward` "toward", `eOutward` "away"). This is the
  raw carrier PRIOR to the complex structure `J` (which J2 derives) and PRIOR to any
  gauge group. The fold's own Born self-overlap gives it a positive-definite Euclidean
  form (`bornForm`) with the two directions as an orthonormal frame.

  WHAT IS BANKED HERE (forward, foundations-only):
    StateFibre           — the raw 2D real fibre `Cut × Cut` (the doubled derived ℝ).
    eInward / eOutward    — the two look-back directions (the orthonormal frame).
    bornForm              — the raw self-overlap `p.1*q.1 + p.2*q.2` (Euclidean form).
    eInward_ne_eOutward   — ★ [W8] the two directions are DISTINCT (fibre genuinely 2D).
    fibre_finrank         — `finrank Cut StateFibre = 2`.
    fibre_decomp          — every state is `p.1 • eInward + p.2 • eOutward`.
    fibre_even_dim        — ★ Even dim, DERIVED via `foldRoot_forces_even_dim` on `J₂`.
    line_blocked          — the line admits NO fold-root (banked `no_foldRoot_dim1`).
    fibre_carries_foldRoot— the 2D fibre DOES carry the fold-root (`J₂`).
    fibre_forced          — ★★ THE CRUX: `finrank = 2`, even, the line (odd) is blocked,
                            no fold-root on the line, the 2D fibre carries one — the
                            forced raw carrier, bottom to top.
    bornForm_self_nonneg / bornForm_self_eq_zero — ★ POSITIVE-DEFINITE (trunk positivity).
    bornForm_symm / *_eInward_self / *_eOutward_self / *_eInward_eOutward — orthonormal frame.

  SCOPE (docs/RUNBOOK.md W4.5). This node derives EXACTLY the raw 2D real fibre, its
  positive-definite self-overlap, and its forced-ness. It does NOT equip the complex
  structure `J` (`J² = -1`, J2's target) nor the Kähler / Born-square (J3's target).
  Those are the next nodes. `J₂` is CITED here only as the fold-root WITNESS that dim 2
  is achieved — the fibre is treated as the RAW REAL carrier, not yet complexified.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "probe / state / Born / quantum
  / inward / outward / look-back": what remains is the pure statement that the minimal
  2-torsion-free ordered-field carrier admitting a square root of the negation map is a
  2-dimensional space (the 1-dim line is blocked, even dimension is forced, dim 2 is
  achieved) carrying a positive-definite Euclidean form with an orthonormal 2-frame. No
  theorem STATEMENT needs a physics word to be true.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge. Built
  on the BANKED derived ℝ `Cut` and the banked fold / fold-root obstructions — NO Mathlib
  `Real` / `Complex` as content, NO posited Hilbert space.
-/
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit

namespace Phys.Quantum

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

/-! ## The raw 2D real fibre — the forced carrier prior to all structure. -/

/-- THE PRIMITIVE 2D REAL FIBRE. The raw probe carrier is the doubled derived-ℝ line
    `Cut × Cut` — the minimal carrier the fold-root obstructions force (the line is
    blocked, even dimension is forced, dim 2 is achieved). This is the raw carrier the
    Born rule lives on, prior to the complex structure (J2) and any gauge group. -/
abbrev StateFibre := ContinuumQ.Cut × ContinuumQ.Cut

/-- The look-back "toward" (inward) direction — the first fibre axis. -/
noncomputable def eInward : StateFibre := (1, 0)

/-- The look-back "away" (outward) direction — the second fibre axis. -/
noncomputable def eOutward : StateFibre := (0, 1)

/-- THE RAW SELF-OVERLAP (Born form) on the fibre: `⟨p,q⟩ = p.1·q.1 + p.2·q.2`. The
    fold's Born = self-overlap positivity, at the level of the raw 2D carrier. -/
noncomputable def bornForm (p q : StateFibre) : ContinuumQ.Cut := p.1 * q.1 + p.2 * q.2

/-! ## The fibre is genuinely two-dimensional. -/

/-- ★ [W8] The two look-back directions are DISTINCT — the fibre does not collapse to a
    line and the two directions do not coincide. -/
theorem eInward_ne_eOutward : eInward ≠ eOutward := by
  intro h
  have : (1 : ContinuumQ.Cut) = 0 := congrArg Prod.fst h
  exact one_ne_zero this

/-- The fibre has dimension exactly 2 over the derived ℝ `Cut`. -/
theorem fibre_finrank : finrank ContinuumQ.Cut StateFibre = 2 := by
  rw [Module.finrank_prod, finrank_self]

/-- Every state is a real combination of the two look-back directions. -/
theorem fibre_decomp (p : StateFibre) : p = p.1 • eInward + p.2 • eOutward := by
  apply Prod.ext
  · simp [eInward, eOutward, smul_eq_mul]
  · simp [eInward, eOutward, smul_eq_mul]

/-! ## The carrier is FORCED — the line is blocked, even dimension is forced, dim 2 achieved. -/

/-- ★ The fibre dimension is EVEN — DERIVED (not merely computed) from the why-double law
    applied to the fold-root operator `J₂` on the fibre. The same trunk positivity
    (`det(J)² ≥ 0`) that blocks the line forces the enlargement to be even-dimensional. -/
theorem fibre_even_dim : Even (finrank ContinuumQ.Cut StateFibre) :=
  foldRoot_forces_even_dim J₂ J₂_isFoldRoot

/-- The derived LINE (dim 1) is BLOCKED: it admits NO square root of the fold. The unity
    that looks back cannot find its own root within the line (banked `no_foldRoot_dim1`,
    the trunk positivity `c² ≥ 0 > -1`). -/
theorem line_blocked :
    ¬ ∃ J : ContinuumQ.Cut →ₗ[ContinuumQ.Cut] ContinuumQ.Cut, IsFoldRoot (fun x => J x) :=
  no_foldRoot_dim1

/-- The 2D fibre DOES carry a square root of the fold (the fold-root operator `J₂`),
    so dim 2 achieves what dim 1 could not. (`J₂` is the witness; its promotion to a
    genuine complex structure `J² = -1` is J2's target, not this node's.) -/
theorem fibre_carries_foldRoot : IsFoldRoot (fun p => J₂ p) := J₂_isFoldRoot

/-- ★★ THE CRUX — THE RAW CARRIER IS FORCED, bottom to top. The probe carrier cannot be
    the line: the line has odd dimension and is self-blind to the fold-root (blocked). The
    why-double law forces any fold-root carrier to have EVEN dimension, and the minimal
    such carrier — this 2D real fibre — achieves the fold-root. So the raw 2-dimensional
    real fibre is FORCED, not posited: it is the unique minimal carrier the look-back's
    recursive self-blindness demands, prior to the complex structure and any gauge group. -/
theorem fibre_forced :
    finrank ContinuumQ.Cut StateFibre = 2 ∧
    Even (finrank ContinuumQ.Cut StateFibre) ∧
    ¬ Even (finrank ContinuumQ.Cut ContinuumQ.Cut) ∧
    (¬ ∃ J : ContinuumQ.Cut →ₗ[ContinuumQ.Cut] ContinuumQ.Cut, IsFoldRoot (fun x => J x)) ∧
    IsFoldRoot (fun p => J₂ p) := by
  refine ⟨fibre_finrank, fibre_even_dim, ?_, no_foldRoot_dim1, J₂_isFoldRoot⟩
  rw [finrank_self]
  exact Nat.not_even_iff_odd.mpr odd_one

/-! ## The raw self-overlap is positive-definite — the Born positivity at the fibre level. -/

/-- ★ The raw self-overlap is NONNEGATIVE: the fold's Born = self-overlap ≥ 0, on the fibre. -/
theorem bornForm_self_nonneg (p : StateFibre) : 0 ≤ bornForm p p := by
  unfold bornForm
  have h1 : 0 ≤ p.1 * p.1 := mul_self_nonneg _
  have h2 : 0 ≤ p.2 * p.2 := mul_self_nonneg _
  linarith

/-- ★ The raw self-overlap is POSITIVE-DEFINITE: it vanishes only on the void state. -/
theorem bornForm_self_eq_zero (p : StateFibre) : bornForm p p = 0 ↔ p = 0 := by
  unfold bornForm
  constructor
  · intro h
    have h1 : 0 ≤ p.1 * p.1 := mul_self_nonneg _
    have h2 : 0 ≤ p.2 * p.2 := mul_self_nonneg _
    have e1 : p.1 * p.1 = 0 := by linarith
    have e2 : p.2 * p.2 = 0 := by linarith
    apply Prod.ext
    · simpa using (mul_self_eq_zero.mp e1)
    · simpa using (mul_self_eq_zero.mp e2)
  · intro h; rw [h]; simp

/-! ## The two look-back directions are an orthonormal frame for the raw self-overlap. -/

/-- The raw self-overlap is symmetric. -/
theorem bornForm_symm (p q : StateFibre) : bornForm p q = bornForm q p := by
  unfold bornForm; ring

/-- The inward direction is a unit vector. -/
theorem bornForm_eInward_self : bornForm eInward eInward = 1 := by
  unfold bornForm eInward; simp

/-- The outward direction is a unit vector. -/
theorem bornForm_eOutward_self : bornForm eOutward eOutward = 1 := by
  unfold bornForm eOutward; simp

/-- The two look-back directions are orthogonal. -/
theorem bornForm_eInward_eOutward : bornForm eInward eOutward = 0 := by
  unfold bornForm eInward eOutward; simp

end Phys.Quantum
