/-
  Phys.Algebra.LorentzContinuumSpectralPow — N176: THE CONTINUOUS SPECTRAL t-POWER and the
  ONE-PARAMETER SPECTRAL FLOW over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the continuous real power `cutRpow` (N175). The chain has, over the
  DERIVED ℝ `Cut` (N33–N37: ConditionallyCompleteLinearOrder / Archimedean / CompleteSpace / Field /
  OrderTopology):
    • the continuous exponential `cutExp x = ∑' n, xⁿ/n!` with `cutExp_zero`/`cutExp_add`/`cutExp_pos`
      (N174), DERIVED from `Cut` via its OWN banked exp power series — NO `Mathlib.Real.exp` as content;
    • the continuous logarithm `cutLog` (the IVT inverse of `cutExp` on the positives) and the
      CONTINUOUS REAL POWER `cutRpow x p := cutExp (p · cutLog x)` with the power-addition law
      `cutRpow_add`, `cutRpow_one`, `cutRpow_two`, `cutRpow_zero`, `cutRpow_pos` (N175) — NO
      `Mathlib.Real.rpow`/`Real.log` as content;
    • ★ the GENERAL RANK-`n` SPECTRAL OPERATOR `specOpN l u := ∑ i, (l i) • projC (u i)` diagonal in
      an EvC-orthonormal eigen-family `{u i}`, with `specOpN_apply`, EvC-self-adjointness
      `specOpN_isEvCSymm`, EvC-positive-semidefiniteness `specOpN_nonneg`, the eigenblock readers
      `specOpN_EvC_read`/`specOpN_read`, the composition law `specOpN_comp` (the `a = b` case), and the
      spectral square root `specOpN_op_sqrt` (N68), over the EvC-orthogonal projection `projC` (N63),
      the scalar `cutSqrt` (N57), the reference form `EvC` (N58), and the octonion bilinear `gFormC`.

  ── THE TARGET (N176): the continuous one-parameter spectral flow ──
  The classical spectral functional calculus raises a positive self-adjoint operator to a continuous
  real power `t`: with `g = Σᵢ λᵢ Pᵢ` over EvC-orthogonal eigenprojections, `gᵗ := Σᵢ λᵢᵗ Pᵢ`, and the
  family `{gᵗ}ₜ` is a ONE-PARAMETER GROUP — `gˢ · gᵗ = gˢ⁺ᵗ`. The discrete composition law
  `specOpN_comp` (N68) gives only the INTEGER squaring `g · g = Σ λᵢ² Pᵢ`; it cannot express a
  CONTINUOUS power because no continuous real power existed over `Cut` until `cutRpow` (N175). With
  `cutRpow` banked, the continuous spectral t-power is now forced and GENUINELY NEW: the eigenvalue
  `λᵢ` is raised to the continuous real power `cutRpow (λᵢ) p` PER EvC-orthogonal eigenprojection, and
  the flow law `specPow p ∘ specPow q = specPow (p+q)` descends DIRECTLY from `cutRpow_add` eigenblock
  by eigenblock — the continuous one-parameter group the discrete law could not reach.

  ── THE TRUNK REFRAME (THE ONE LAW): the flow IS `cutRpow_add` per EvC-orthogonal eigenprojection ──
  No operator analysis, no functional-calculus machinery, no Mathlib spectral theory. The flow law
  factors through ONE structural step — the TWO-EIGENVALUE composition law `specOpN_comp_general`
  (`specOpN a u ∘ specOpN b u = specOpN (a·b) u` for an EvC-orthonormal family, generalizing the banked
  `specOpN_comp` from `a = b` to arbitrary `a, b`) — composed with the scalar power-addition law
  `cutRpow_add` applied independently inside each eigenblock. The off-diagonal cross terms vanish by
  `specOpN_EvC_read`; the diagonal eigenvalues multiply by `cutRpow (λᵢ) p · cutRpow (λᵢ) q =
  cutRpow (λᵢ) (p+q)`. The eigenbasis enters ONLY through the abstract orthonormality matrix
  `EvC (u i) (u j) = δᵢⱼ`, so the flow holds at arbitrary finite rank for any EvC-orthonormal family.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    specOpN_comp_general — ★ THE TWO-EIGENVALUE COMPOSITION LAW `specOpN a u ∘ specOpN b u =
                           specOpN (a·b) u` over an EvC-orthonormal family. Generalizes N68's
                           `specOpN_comp` (the `a = b` case) to arbitrary eigenvalue tuples — the
                           structural lever the continuous flow consumes.
    specPow p l u        — ★ THE CONTINUOUS SPECTRAL t-POWER `specOpN (cutRpow (l·) p) u`: each
                           eigenvalue `l i` raised to the continuous real power `cutRpow (l i) p` on its
                           EvC-orthogonal eigenprojection `projC (u i)`.
    specPow_flow         — ★★ THE ONE-PARAMETER FLOW LAW `specPow p l u ∘ specPow q l u =
                           specPow (p+q) l u` for `∀ i, 0 < l i` and an EvC-orthonormal family — the
                           continuous one-parameter group, from `specOpN_comp_general` + `cutRpow_add`
                           per eigenblock. THE genuinely-new content beyond the discrete `specOpN_comp`.
    specPow_read         — the eigenvalue of the continuous power: `EvC (specPow p l u (u k)) (u k) =
                           cutRpow (l k) p` for an EvC-orthonormal family (reads `cutRpow` off the
                           diagonal).
    specPow_one          — `specPow 1 l u = specOpN l u` for `∀ i, 0 < l i` (genuinely via `cutRpow_one`,
                           which rewrites through the inverse law `cutExp ∘ cutLog = id`).
    specPow_zero         — `specPow 0 l u = specOpN (fun _ => 1) u` for `∀ i, 0 < l i` (the IDENTITY of
                           the flow group, via `cutRpow_zero`).
    specPow_two          — `specPow 2 l u = specOpN (l·l) u` for `∀ i, 0 < l i` (the continuous power at
                           `p = 2` matches the discrete square, via `cutRpow_two`) — connects the
                           continuous flow back to the discrete `specOpN_comp`.
    specPow_isEvCSymm    — `specPow p l u` is EvC-self-adjoint (from `specOpN_isEvCSymm`).
    specPow_nonneg       — `specPow p l u` is EvC-positive-semidefinite for `∀ i, 0 < l i` (each
                           `cutRpow (l i) p > 0` by `cutRpow_pos`, summed).
    specPow_mix4_flow    — ★ NON-VACUITY: a CONCRETE continuous one-parameter flow over the banked
                           time/space/octonion-real/octonion-im EvC-orthonormal 4-frame `mix4` with
                           positive eigenvalues `![2,3,5,8]`: `specPow p · specPow q = specPow (p+q)`.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a positive self-adjoint operator has a
  continuous real power that forms a one-parameter group is standard spectral functional calculus. Here
  the continuous spectral t-power and its flow law DESCEND from the banked `specOpN`/`projC` (N68/N63) +
  the DERIVED continuous power `cutRpow` (N175) + the reference form `EvC` (N58) over the DERIVED ℝ
  `Cut` and `O Cut` — NO posited operator calculus, NO Mathlib spectral theory, NO posited
  one-parameter group, NO `Mathlib.Real.rpow` as content, NO Mathlib ℝ/ℂ as content. `Finset.sum`,
  `Module.End`, `LinearMap` are standard Mathlib MACHINERY operating on the DERIVED objects.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "spectral / eigenvalue / eigenprojection /
  eigenbasis / power / flow / one-parameter group / operator / self-adjoint / positive-semidefinite /
  Lorentz / isometry": what remains is the theorem that, over the derived complete ordered field `Cut`
  with the continuous real power `cutRpow` (where `cutRpow x (p+q) = cutRpow x p · cutRpow x q` for
  `x > 0`), the Cayley–Dickson double³ `O Cut`, the symmetric positive-definite bilinear form `EvC`, the
  `Cut`-linear `projC u := r ↦ (EvC u r)•u`, and the `Fin n`-indexed `specOpN l u := ∑ i, (l i)•projC (u i)`:
  the map `P(p) := specOpN (fun i => cutRpow (l i) p) u` satisfies, for a family with `EvC (u i) (u j) = δᵢⱼ`
  and `∀ i, 0 < l i`, the laws `P(p) ∘ P(q) = P(p+q)`, `P(1) = specOpN l u`, `P(0) = specOpN 1 u`,
  `P(2) = specOpN (l·l) u`, the eigenblock read `EvC (P(p)(u k)) (u k) = cutRpow (l k) p`, EvC-symmetry,
  and EvC-positivity; concretely over `{mixA,mixB,mixW3,mixW4}` with eigenvalues `![2,3,5,8]`,
  `P(p) ∘ P(q) = P(p+q)`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`, the power the DERIVED
  `cutRpow`), NO posited Lorentz group, NO posited operator calculus / spectral theorem, NO Mathlib
  ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumSpectralN
import Phys.Foundation.ContinuumLog

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

/-! ## The two-eigenvalue composition law (the structural lever the continuous flow consumes). -/

/-- ★ THE TWO-EIGENVALUE COMPOSITION LAW for an EvC-orthonormal family `{u i}`:
    `specOpN a u ∘ specOpN b u = specOpN (a·b) u`. Generalizes the banked `specOpN_comp` (N68, the
    `a = b` case) to arbitrary eigenvalue tuples `a, b`: all off-diagonal cross terms vanish
    (`specOpN_EvC_read`), the diagonal eigenvalues multiply independently. -/
theorem specOpN_comp_general {n : ℕ} {a b : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) :
    (specOpN a u).comp (specOpN b u) = specOpN (fun i => a i * b i) u := by
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, specOpN_apply a u (specOpN b u p),
    specOpN_apply (fun i => a i * b i) u p]
  refine Finset.sum_congr rfl ?_
  intro i _
  rw [specOpN_EvC_read horth p i]
  congr 1
  ring

/-! ## The continuous spectral t-power. -/

/-- ★ THE CONTINUOUS SPECTRAL t-POWER diagonal in an EvC-orthonormal eigen-family `{u i}`:
    `specPow p l u := specOpN (fun i => cutRpow (l i) p) u` — each eigenvalue `l i` raised to the
    continuous real power `cutRpow (l i) p` on its EvC-orthogonal eigenprojection `projC (u i)`. The
    genuinely-new structure beyond the discrete-power `specOpN_comp`: a CONTINUOUS real power of a
    diagonal operator, now that `cutRpow` (N175) is banked over the derived ℝ `Cut`. -/
def specPow {n : ℕ} (p : Cut) (l : Fin n → Cut) (u : Fin n → STVC) : Module.End Cut STVC :=
  specOpN (fun i => cutRpow (l i) p) u

/-- ★★ THE ONE-PARAMETER FLOW LAW: `specPow p l u ∘ specPow q l u = specPow (p+q) l u` for an
    EvC-orthonormal family `{u i}` with `∀ i, 0 < l i`. The continuous one-parameter group of
    spectral operators — from `specOpN_comp_general` (off-diagonal collapse) + `cutRpow_add` (the
    power-addition law) applied independently inside each eigenblock. THE genuinely-new content beyond
    the discrete composition `specOpN_comp` (which gives only the integer square). -/
theorem specPow_flow {n : ℕ} {p q : Cut} {l : Fin n → Cut} (hl : ∀ i, 0 < l i)
    {u : Fin n → STVC} (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) :
    (specPow p l u).comp (specPow q l u) = specPow (p + q) l u := by
  unfold specPow
  rw [specOpN_comp_general horth]
  congr 1
  funext i
  rw [← cutRpow_add (hl i)]

/-- The eigenvalue of the continuous power: for an EvC-orthonormal family,
    `EvC (specPow p l u (u k)) (u k) = cutRpow (l k) p` — reads the continuous real power `cutRpow`
    off the diagonal eigenblock. -/
theorem specPow_read {n : ℕ} {p : Cut} {l : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) (k : Fin n) :
    EvC (specPow p l u (u k)) (u k) = cutRpow (l k) p := by
  unfold specPow
  rw [specOpN_read horth k]

/-- `specPow 1 l u = specOpN l u` for `∀ i, 0 < l i` — the power-one normalization, genuinely via
    `cutRpow_one` (which rewrites through the inverse law `cutExp ∘ cutLog = id`). -/
theorem specPow_one {n : ℕ} {l : Fin n → Cut} (hl : ∀ i, 0 < l i) (u : Fin n → STVC) :
    specPow 1 l u = specOpN l u := by
  unfold specPow
  congr 1
  funext i
  rw [cutRpow_one (hl i)]

/-- `specPow 0 l u = specOpN (fun _ => 1) u` for `∀ i, 0 < l i` — the IDENTITY element of the
    one-parameter flow group, via `cutRpow_zero`. -/
theorem specPow_zero {n : ℕ} {l : Fin n → Cut} (hl : ∀ i, 0 < l i) (u : Fin n → STVC) :
    specPow 0 l u = specOpN (fun _ => 1) u := by
  unfold specPow
  congr 1
  funext i
  rw [cutRpow_zero (hl i)]

/-- `specPow 2 l u = specOpN (fun i => l i * l i) u` for `∀ i, 0 < l i` — the continuous power at
    `p = 2` matches the discrete square (via `cutRpow_two`), connecting the continuous flow back to the
    discrete composition `specOpN_comp`. -/
theorem specPow_two {n : ℕ} {l : Fin n → Cut} (hl : ∀ i, 0 < l i) (u : Fin n → STVC) :
    specPow 2 l u = specOpN (fun i => l i * l i) u := by
  unfold specPow
  congr 1
  funext i
  rw [cutRpow_two (hl i)]

/-- `specPow p l u` is EvC-self-adjoint for EVERY family (from `specOpN_isEvCSymm`). -/
theorem specPow_isEvCSymm {n : ℕ} (p : Cut) (l : Fin n → Cut) (u : Fin n → STVC) :
    IsEvCSymm (specPow p l u) :=
  specOpN_isEvCSymm _ _

/-- `specPow p l u` is EvC-positive-semidefinite for `∀ i, 0 < l i` (each `cutRpow (l i) p > 0` by
    `cutRpow_pos`, summed by `Finset.sum_nonneg`). -/
theorem specPow_nonneg {n : ℕ} {p : Cut} {l : Fin n → Cut} (hl : ∀ i, 0 < l i)
    (u : Fin n → STVC) (r : STVC) :
    0 ≤ EvC (specPow p l u r) r :=
  specOpN_nonneg (fun i => le_of_lt (cutRpow_pos (hl i) p)) u r

/-! ## Concrete rank-4 non-vacuity witness over the banked EvC-orthonormal 4-frame `mix4`. -/

/-- ★ NON-VACUITY: a CONCRETE continuous one-parameter flow over the banked
    time/space/octonion-real/octonion-im EvC-orthonormal 4-frame `{mixA, mixB, mixW3, mixW4}` with the
    positive eigenvalues `![2,3,5,8]` — `specPow p ∘ specPow q = specPow (p+q)`. The continuous flow
    over an eigenbasis spanning all four sectors at rank 4. -/
theorem specPow_mix4_flow (p q : Cut) :
    (specPow p ![(2:Cut),3,5,8] mix4).comp (specPow q ![(2:Cut),3,5,8] mix4)
      = specPow (p + q) ![(2:Cut),3,5,8] mix4 :=
  specPow_flow (by intro i; fin_cases i <;> norm_num) mix4_orthonormal

end

end Phys.Algebra
