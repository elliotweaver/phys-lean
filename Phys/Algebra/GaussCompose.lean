/-
  # GAUSS COMPOSE — THE WELL-DEFINEDNESS TOOLKIT AND THEOREM (GQ R1)

  ## What this file proves (GQ campaign, production node)

  The complete well-definedness apparatus for class-level composition,
  entirely on the derived integers, no Mathlib number content:

  * `transform_shift` / `transform_swap` — the unimodular transform reads
    IDENTICALLY through re-coordinated moves (three ring identities each).
  * `transform_id` — the identity landing reads the form itself.
  * `z_pos_ge_one`, `z_unit_class` — discreteness and units of the derived ℤ.
  * `transform_base_pos/neg` — unit-column transforms are shifts.
  * `transform_chain` — ★★ THE TRANSFORM-TRACKED ANCHOR: every unimodular
    transform of f is IN f's chain class (SL₂ = ⟨shift, swap⟩ constructive,
    Euclid descent on the landing column).
  * `chain_transform_transport` — ★ chains transport unimodular landings to
    coordinates reading the IDENTICAL transform (anchored data are class
    objects ON THE NOSE).
  * `bilinear_completion_det(')` — the Gauss bilinear substitution extends
    to completions (exact determinant identities).
  * `canonical_completion` — ★ the Bézout-combined completion of the
    bilinear landing is unimodular.
  * `crt_record` — ★★ THE GATHER RECORD IS THE CRT OF THE BRANCH RECORDS:
    with the canonical completion, the gather's anchored record equals the
    branch record plus an EXPLICIT multiple of twice the branch value
    (closed by linear_combination with Gröbner-extracted cofactors; the
    a1↔a2 swap symmetry gives the second branch congruence from the same
    theorem). De-risked: sympy Gröbner remainder 0 + 2670/2670 numerics.
  * `joint_modulus` — CRT uniqueness at the joint modulus (explicit).
  * `compose_well_defined` — ★★★ THE WD THEOREM: gathers of chain-equivalent
    concordant presentations are chain-equivalent. The single theorem that
    makes class composition a function.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussCycleLaw

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-! ### The transform blocks (chain moves re-coordinate the reading). -/

theorem transform_shift (k : Z) (f : BQF) (x y u v : Z) :
    transform (shiftF k f) (x - k * y) y (u - k * v) v
      = transform f x y u v := by
  unfold transform record eval shiftF
  have hA : f.a * (x - k * y) * (x - k * y)
      + (f.b + 2 * f.a * k) * (x - k * y) * y
      + (f.a * k * k + f.b * k + f.c) * y * y
      = f.a * x * x + f.b * x * y + f.c * y * y := by ring
  have hB : 2 * f.a * (x - k * y) * (u - k * v)
      + (f.b + 2 * f.a * k) * ((x - k * y) * v + y * (u - k * v))
      + 2 * (f.a * k * k + f.b * k + f.c) * y * v
      = 2 * f.a * x * u + f.b * (x * v + y * u) + 2 * f.c * y * v := by ring
  have hC : f.a * (u - k * v) * (u - k * v)
      + (f.b + 2 * f.a * k) * (u - k * v) * v
      + (f.a * k * k + f.b * k + f.c) * v * v
      = f.a * u * u + f.b * u * v + f.c * v * v := by ring
  rw [hA, hB, hC]

theorem transform_swap (f : BQF) (x y u v : Z) :
    transform (swapF f) (-y) x (-v) u = transform f x y u v := by
  unfold transform record eval swapF
  have hA : f.c * (-y) * (-y) + (-f.b) * (-y) * x + f.a * x * x
      = f.a * x * x + f.b * x * y + f.c * y * y := by ring
  have hB : 2 * f.c * (-y) * (-v) + (-f.b) * ((-y) * u + x * (-v)) + 2 * f.a * x * u
      = 2 * f.a * x * u + f.b * (x * v + y * u) + 2 * f.c * y * v := by ring
  have hC : f.c * (-v) * (-v) + (-f.b) * (-v) * u + f.a * u * u
      = f.a * u * u + f.b * u * v + f.c * v * v := by ring
  rw [hA, hB, hC]

/-- The identity landing reads the form itself. -/
theorem transform_id (f : BQF) : transform f 1 0 0 1 = f := by
  unfold transform record eval
  have hA : f.a * 1 * 1 + f.b * 1 * 0 + f.c * 0 * 0 = f.a := by ring
  have hB : 2 * f.a * 1 * 0 + f.b * (1 * 1 + 0 * 0) + 2 * f.c * 0 * 1 = f.b := by ring
  have hC : f.a * 0 * 0 + f.b * 0 * 1 + f.c * 1 * 1 = f.c := by ring
  rw [hA, hB, hC]

theorem unimodular_shift {x y u v k : Z} (h : x * v - y * u = 1) :
    (x - k * y) * v - y * (u - k * v) = 1 := by linarith [h]

theorem unimodular_swap {x y u v : Z} (h : x * v - y * u = 1) :
    (-y) * u - x * (-v) = 1 := by linarith [h]

/-! ### Units and discreteness of the derived ℤ. -/

theorem z_pos_ge_one {z : Z} (hz : 0 < z) : (1 : Z) ≤ z := by
  obtain ⟨m, hm | hm⟩ := z_trichotomy z
  · match m, hm with
    | .void, hm =>
        exfalso
        rw [show Z.ofRe Re.void = (0:Z) from Z.ofRe_zero] at hm
        rw [hm] at hz
        exact lt_irrefl _ hz
    | .step m', hm =>
        have hsm : Re.step m' = m' + Re.step Re.void := by
          rw [add_step_swap]
          show Re.step m' = Re.step m' + Re.void
          rw [Re.add_void]
        rw [hm, hsm, Z.ofRe_add,
          show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
        linarith [ofRe_nonneg m']
  · exfalso
    have hnn : (0 : Z) ≤ Z.ofRe m := ofRe_nonneg m
    rw [hm] at hz
    linarith

/-- ★ Unit classification: x·v = 1 ⟹ x = 1 ∨ x = −1. -/
theorem z_unit_class {x v : Z} (h : x * v = 1) : x = 1 ∨ x = -1 := by
  have hxne : x ≠ 0 := by
    intro h0
    rw [h0, zero_mul] at h
    exact one_ne_zero h.symm
  rcases lt_trichotomy 0 x with hx | hx | hx
  · have hv : (0 : Z) < v := by
      by_contra hvn
      push_neg at hvn
      have : x * v ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt hx) hvn
      linarith
    have hx1 := z_pos_ge_one hx
    have hv1 := z_pos_ge_one hv
    left
    by_contra hne
    have hx2 : (2 : Z) ≤ x := by
      rcases lt_or_eq_of_le hx1 with hlt | heq
      · have := z_pos_ge_one (show (0:Z) < x - 1 by linarith)
        linarith
      · exact absurd heq.symm hne
    nlinarith
  · exact absurd hx.symm hxne
  · have hpos : (0 : Z) < -x := by linarith
    have hv : (0 : Z) < -v := by
      by_contra hvn
      push_neg at hvn
      have hprod : (-x) * (-v) = 1 := by
        rw [show (-x) * (-v) = x * v by ring]
        exact h
      have : (-x) * (-v) ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt hpos) hvn
      linarith
    have hx1 := z_pos_ge_one hpos
    have hv1 := z_pos_ge_one hv
    right
    by_contra hne
    have hx2 : (2 : Z) ≤ -x := by
      rcases lt_or_eq_of_le hx1 with hlt | heq
      · have := z_pos_ge_one (show (0:Z) < -x - 1 by linarith)
        linarith
      · exfalso
        apply hne
        linarith [heq]
    nlinarith [h]

/-! ### Base cases: unit-column transforms are shifts. -/

theorem transform_base_pos (f : BQF) (u : Z) :
    transform f 1 0 u 1 = shiftF u f := by
  unfold transform record eval shiftF
  have hA : f.a * 1 * 1 + f.b * 1 * 0 + f.c * 0 * 0 = f.a := by ring
  have hB : 2 * f.a * 1 * u + f.b * (1 * 1 + 0 * u) + 2 * f.c * 0 * 1
      = f.b + 2 * f.a * u := by ring
  have hC : f.a * u * u + f.b * u * 1 + f.c * 1 * 1
      = f.a * u * u + f.b * u + f.c := by ring
  rw [hA, hB, hC]

theorem transform_base_neg (f : BQF) (u : Z) :
    transform f (-1) 0 u (-1) = shiftF (-u) f := by
  unfold transform record eval shiftF
  have hA : f.a * (-1) * (-1) + f.b * (-1) * 0 + f.c * 0 * 0 = f.a := by ring
  have hB : 2 * f.a * (-1) * u + f.b * ((-1) * (-1) + 0 * u) + 2 * f.c * 0 * (-1)
      = f.b + 2 * f.a * (-u) := by ring
  have hC : f.a * u * u + f.b * u * (-1) + f.c * (-1) * (-1)
      = f.a * (-u) * (-u) + f.b * (-u) + f.c := by ring
  rw [hA, hB, hC]

/-! ### ★★ The transform-tracked anchor. -/

theorem transform_chain (f : BQF) (x y u v : Z) (huni : x * v - y * u = 1) :
    Chain f (transform f x y u v) := by
  obtain ⟨ny, hny⟩ := zAbs_exists y
  have main : ∀ n : Re, ∀ (f : BQF) (x y u v : Z), zAbs y n →
      x * v - y * u = 1 → Chain f (transform f x y u v) := by
    refine strong_induction
      (P := fun n => ∀ (f : BQF) (x y u v : Z), zAbs y n →
        x * v - y * u = 1 → Chain f (transform f x y u v)) ?_
    intro n ih f x y u v hyabs huni
    rcases eq_or_ne y 0 with hy0 | hyne
    · subst hy0
      have hxv : x * v = 1 := by linarith
      rcases z_unit_class hxv with hx1 | hx1
      · have hv1 : v = 1 := by
          rw [hx1, one_mul] at hxv
          exact hxv
        rw [hx1, hv1, transform_base_pos]
        exact of_shift u f
      · have hv1 : v = -1 := by
          rw [hx1] at hxv
          linarith
        rw [hx1, hv1, transform_base_neg]
        exact of_shift (-u) f
    · obtain ⟨nx, hnx⟩ := zAbs_exists x
      have nne : n ≠ 0 := by
        intro h0
        apply hyne
        rcases hyabs with hy | hy
        · rw [hy, h0, show Z.ofRe (0:Re) = (0:Z) from Z.ofRe_zero]
        · rw [hy, h0, show Z.ofRe (0:Re) = (0:Z) from Z.ofRe_zero, neg_zero]
      have hnpos : Re.void < n :=
        lt_of_le_of_ne (Re.zero_le n) (fun h => nne h.symm)
      have hdiv : ∃ q r : Z, x = q * y + r ∧ ∃ nr, zAbs r nr ∧ nr < n := by
        obtain ⟨q0, r0, hqr0, hr0lt⟩ := div_mod_exists n hnpos nx
        have hofx : Z.ofRe nx = Z.ofRe n * Z.ofRe q0 + Z.ofRe r0 := by
          rw [hqr0, Z.ofRe_add, Z.ofRe_mul]
        rcases hnx with hx | hx <;> rcases hyabs with hy | hy
        · exact ⟨Z.ofRe q0, Z.ofRe r0, by rw [hx, hy, hofx]; ring,
            ⟨r0, Or.inl rfl, hr0lt⟩⟩
        · exact ⟨-(Z.ofRe q0), Z.ofRe r0, by rw [hx, hy, hofx]; ring,
            ⟨r0, Or.inl rfl, hr0lt⟩⟩
        · exact ⟨-(Z.ofRe q0), -(Z.ofRe r0), by rw [hx, hy, hofx]; ring,
            ⟨r0, Or.inr rfl, hr0lt⟩⟩
        · exact ⟨Z.ofRe q0, -(Z.ofRe r0), by rw [hx, hy, hofx]; ring,
            ⟨r0, Or.inr rfl, hr0lt⟩⟩
      obtain ⟨q, r, hxqr, nr, hnr, hnrlt⟩ := hdiv
      have huni' : (-y) * (u - q * v) - r * (-v) = 1 := by
        have hr : r = x - q * y := by linarith
        rw [hr]
        ring_nf
        ring_nf at huni
        linarith
      obtain hchain' := ih nr hnrlt (swapF (shiftF q f)) (-y) r (-v) (u - q * v)
        (by rcases hnr with h | h
            · exact Or.inl (by rw [h])
            · exact Or.inr (by rw [h]))
        huni'
      have hrw : transform (swapF (shiftF q f)) (-y) r (-v) (u - q * v)
          = transform f x y u v := by
        have h1 : transform (swapF (shiftF q f)) (-y) r (-v) (u - q * v)
            = transform (shiftF q f) r y (u - q * v) v :=
          transform_swap (shiftF q f) r y (u - q * v) v
        have h2 : transform (shiftF q f) (x - q * y) y (u - q * v) v
            = transform f x y u v := transform_shift q f x y u v
        have hr : r = x - q * y := by linarith
        rw [h1, hr, h2]
      rw [hrw] at hchain'
      exact Chain.shift q (Chain.swap hchain')
  exact main ny f x y u v hny huni

/-! ### ★ Chain transport of transforms. -/

theorem chain_transform_transport {f g : BQF} (hch : Chain f g) :
    ∀ x y u v : Z, x * v - y * u = 1 →
    ∃ x' y' u' v' : Z, x' * v' - y' * u' = 1 ∧
      transform g x' y' u' v' = transform f x y u v := by
  induction hch with
  | refl f =>
      intro x y u v huni
      exact ⟨x, y, u, v, huni, rfl⟩
  | @shift f' h' k t ih =>
      intro x y u v huni
      obtain ⟨x', y', u', v', huni', heq⟩ :=
        ih (x - k * y) y (u - k * v) v (unimodular_shift huni)
      exact ⟨x', y', u', v', huni', by rw [heq, transform_shift]⟩
  | @swap f' h' t ih =>
      intro x y u v huni
      obtain ⟨x', y', u', v', huni', heq⟩ :=
        ih (-y) x (-v) u (unimodular_swap huni)
      exact ⟨x', y', u', v', huni', by rw [heq, transform_swap]⟩

/-! ### The canonical completion and the CRT-record identity. -/

theorem bilinear_completion_det (a1 a2 B t x y z w u v : Z) :
    (x * z - t * y * w) * (a1 * u * w + a2 * v * z + B * v * w)
      - (a1 * x * w + a2 * y * z + B * y * w) * (u * z - t * v * w)
    = (a2 * z * z + B * z * w + a1 * t * w * w) * (x * v - y * u) := by
  ring

theorem bilinear_completion_det' (a1 a2 B t x y z w p q : Z) :
    (x * z - t * y * w) * (a1 * x * q + a2 * y * p + B * y * q)
      - (a1 * x * w + a2 * y * z + B * y * w) * (x * p - t * y * q)
    = (a1 * x * x + B * x * y + a2 * t * y * y) * (z * q - w * p) := by
  ring

theorem canonical_completion {a1 a2 B t x y z w u v p q al be : Z}
    (h1 : x * v - y * u = 1) (h2 : z * q - w * p = 1)
    (h3 : al * (a1 * x * x + B * x * y + a2 * t * y * y)
        + be * (a2 * z * z + B * z * w + a1 * t * w * w) = 1) :
    (x * z - t * y * w)
        * (be * (a1 * u * w + a2 * v * z + B * v * w)
           + al * (a1 * x * q + a2 * y * p + B * y * q))
      - (a1 * x * w + a2 * y * z + B * y * w)
        * (be * (u * z - t * v * w) + al * (x * p - t * y * q)) = 1 := by
  have hd1 := bilinear_completion_det a1 a2 B t x y z w u v
  have hd2 := bilinear_completion_det' a1 a2 B t x y z w p q
  calc (x * z - t * y * w)
        * (be * (a1 * u * w + a2 * v * z + B * v * w)
           + al * (a1 * x * q + a2 * y * p + B * y * q))
      - (a1 * x * w + a2 * y * z + B * y * w)
        * (be * (u * z - t * v * w) + al * (x * p - t * y * q))
      = be * ((x * z - t * y * w) * (a1 * u * w + a2 * v * z + B * v * w)
            - (a1 * x * w + a2 * y * z + B * y * w) * (u * z - t * v * w))
      + al * ((x * z - t * y * w) * (a1 * x * q + a2 * y * p + B * y * q)
            - (a1 * x * w + a2 * y * z + B * y * w) * (x * p - t * y * q)) := by
        ring
    _ = be * ((a2 * z * z + B * z * w + a1 * t * w * w) * (x * v - y * u))
      + al * ((a1 * x * x + B * x * y + a2 * t * y * y) * (z * q - w * p)) := by
        rw [hd1, hd2]
    _ = be * ((a2 * z * z + B * z * w + a1 * t * w * w) * 1)
      + al * ((a1 * x * x + B * x * y + a2 * t * y * y) * 1) := by
        rw [h1, h2]
    _ = 1 := by
        rw [mul_one, mul_one]
        linarith [h3]

theorem crt_record {a1 a2 B t x y z w u v p q al be : Z}
    (h1 : x * v - y * u = 1) (h2 : z * q - w * p = 1)
    (h3 : al * (a1 * x * x + B * x * y + a2 * t * y * y)
        + be * (a2 * z * z + B * z * w + a1 * t * w * w) = 1) :
    2 * (a1 * a2) * (x * z - t * y * w)
        * (be * (u * z - t * v * w) + al * (x * p - t * y * q))
      + B * ((x * z - t * y * w)
              * (be * (a1 * u * w + a2 * v * z + B * v * w)
                 + al * (a1 * x * q + a2 * y * p + B * y * q))
            + (a1 * x * w + a2 * y * z + B * y * w)
              * (be * (u * z - t * v * w) + al * (x * p - t * y * q)))
      + 2 * t * (a1 * x * w + a2 * y * z + B * y * w)
        * (be * (a1 * u * w + a2 * v * z + B * v * w)
           + al * (a1 * x * q + a2 * y * p + B * y * q))
    = (2 * a1 * x * u + B * (x * v + y * u) + 2 * a2 * t * y * v)
      + 2 * (a1 * x * x + B * x * y + a2 * t * y * y)
        * (B * al * p * w - B * al * u * y + a1 * al * q * t * w
           - a1 * al * u * x + a2 * al * p * z - a2 * al * t * v * y) := by
    linear_combination
      (B * B * be * w * z + B * a1 * be * t * w * w + B * a2 * be * z * z - B) * h1
      + (B * B * al * x * y + B * a1 * al * x * x + B * a2 * al * t * y * y) * h2
      + (2 * B * u * y + B + 2 * a1 * u * x + 2 * a2 * t * v * y) * h3

theorem joint_modulus {V1 V2 d s r al be : Z}
    (hbez : al * V1 + be * V2 = 1)
    (h1 : d = 2 * V1 * s) (h2 : d = 2 * V2 * r) :
    d = 2 * (V1 * V2) * (al * r + be * s) := by
  calc d = d * (al * V1 + be * V2) := by rw [hbez, mul_one]
    _ = al * V1 * d + be * V2 * d := by ring
    _ = al * V1 * (2 * V2 * r) + be * V2 * (2 * V1 * s) := by
        rw [← h2, ← h1]
    _ = 2 * (V1 * V2) * (al * r + be * s) := by ring

/-! ### ★★★ THE WELL-DEFINEDNESS THEOREM. -/

/-- Gathers of chain-equivalent concordant presentations are chain-equivalent:
    the theorem that makes class-level composition a FUNCTION. -/
theorem compose_well_defined
    {a1 a2 B t a1' a2' B' t' al be : Z}
    (hBez : al * a1 + be * a2 = 1)
    (ha : a1 * a2 ≠ 0)
    (hdisc : disc (gatherForm a1 a2 B t) = disc (gatherForm a1' a2' B' t'))
    (hch1 : Chain (⟨a1, B, a2 * t⟩ : BQF) ⟨a1', B', a2' * t'⟩)
    (hch2 : Chain (⟨a2, B, a1 * t⟩ : BQF) ⟨a2', B', a1' * t'⟩) :
    Chain (gatherForm a1 a2 B t) (gatherForm a1' a2' B' t') := by
  -- 1. transport the identity landing through both input chains
  obtain ⟨x, y, u, v, huni1, heq1⟩ :=
    chain_transform_transport hch1 1 0 0 1 (by norm_num)
  obtain ⟨z, w, p, q, huni2, heq2⟩ :=
    chain_transform_transport hch2 1 0 0 1 (by norm_num)
  rw [transform_id] at heq1 heq2
  -- components: values and records both read the UNPRIMED data
  have hV1 : eval (⟨a1', B', a2' * t'⟩ : BQF) x y = a1 := congrArg BQF.a heq1
  have hr1 : record (⟨a1', B', a2' * t'⟩ : BQF) x y u v = B := congrArg BQF.b heq1
  have hV2 : eval (⟨a2', B', a1' * t'⟩ : BQF) z w = a2 := congrArg BQF.a heq2
  have hr2 : record (⟨a2', B', a1' * t'⟩ : BQF) z w p q = B := congrArg BQF.b heq2
  -- expression bridges (parse-tree alignment)
  have hV1e : a1' * x * x + B' * x * y + a2' * t' * y * y = a1 := by
    have : eval (⟨a1', B', a2' * t'⟩ : BQF) x y
        = a1' * x * x + B' * x * y + a2' * t' * y * y := by
      unfold eval
      ring
    linarith [hV1, this]
  have hV2e : a2' * z * z + B' * z * w + a1' * t' * w * w = a2 := by
    have : eval (⟨a2', B', a1' * t'⟩ : BQF) z w
        = a2' * z * z + B' * z * w + a1' * t' * w * w := by
      unfold eval
      ring
    linarith [hV2, this]
  have hr1e : 2 * a1' * x * u + B' * (x * v + y * u) + 2 * a2' * t' * y * v = B := by
    have : record (⟨a1', B', a2' * t'⟩ : BQF) x y u v
        = 2 * a1' * x * u + B' * (x * v + y * u) + 2 * a2' * t' * y * v := by
      unfold record
      ring
    linarith [hr1, this]
  have hr2e : 2 * a2' * z * p + B' * (z * q + w * p) + 2 * a1' * t' * w * q = B := by
    have : record (⟨a2', B', a1' * t'⟩ : BQF) z w p q
        = 2 * a2' * z * p + B' * (z * q + w * p) + 2 * a1' * t' * w * q := by
      unfold record
      ring
    linarith [hr2, this]
  -- 2. Bézout at the transported values
  have h3 : al * (a1' * x * x + B' * x * y + a2' * t' * y * y)
      + be * (a2' * z * z + B' * z * w + a1' * t' * w * w) = 1 := by
    rw [hV1e, hV2e]
    exact hBez
  -- 3. the bilinear landing and canonical completion on G'
  set X := x * z - t' * y * w with hX
  set Y := a1' * x * w + a2' * y * z + B' * y * w with hY
  set U := be * (u * z - t' * v * w) + al * (x * p - t' * y * q) with hU
  set V := be * (a1' * u * w + a2' * v * z + B' * v * w)
      + al * (a1' * x * q + a2' * y * p + B' * y * q) with hV
  have huniXY : X * V - Y * U = 1 := by
    rw [hX, hY, hU, hV]
    exact canonical_completion huni1 huni2 h3
  -- 4. crt_record, direct and swapped instantiations
  have hcrt1 := crt_record (a1 := a1') (a2 := a2') (B := B') (t := t')
    (x := x) (y := y) (z := z) (w := w) (u := u) (v := v) (p := p) (q := q)
    (al := al) (be := be) huni1 huni2 h3
  have h3s : be * (a2' * z * z + B' * z * w + a1' * t' * w * w)
      + al * (a1' * x * x + B' * x * y + a2' * t' * y * y) = 1 := by
    linarith [h3]
  have hcrt2 := crt_record (a1 := a2') (a2 := a1') (B := B') (t := t')
    (x := z) (y := w) (z := x) (w := y) (u := p) (v := q) (p := u) (q := v)
    (al := be) (be := al) huni2 huni1 h3s
  -- 5. the gather record expression and its two congruences
  have hrecG : record (gatherForm a1' a2' B' t') X Y U V
      = B + 2 * a1 * (B' * al * p * w - B' * al * u * y + a1' * al * q * t' * w
          - a1' * al * u * x + a2' * al * p * z - a2' * al * t' * v * y) := by
    have hunf : record (gatherForm a1' a2' B' t') X Y U V
        = 2 * (a1' * a2') * X * U + B' * (X * V + Y * U) + 2 * t' * Y * V := by
      unfold record gatherForm
      ring
    rw [hunf, hX, hY, hU, hV]
    calc 2 * (a1' * a2') * (x * z - t' * y * w)
          * (be * (u * z - t' * v * w) + al * (x * p - t' * y * q))
        + B' * ((x * z - t' * y * w)
                * (be * (a1' * u * w + a2' * v * z + B' * v * w)
                   + al * (a1' * x * q + a2' * y * p + B' * y * q))
              + (a1' * x * w + a2' * y * z + B' * y * w)
                * (be * (u * z - t' * v * w) + al * (x * p - t' * y * q)))
        + 2 * t' * (a1' * x * w + a2' * y * z + B' * y * w)
          * (be * (a1' * u * w + a2' * v * z + B' * v * w)
             + al * (a1' * x * q + a2' * y * p + B' * y * q))
        = (2 * a1' * x * u + B' * (x * v + y * u) + 2 * a2' * t' * y * v)
          + 2 * (a1' * x * x + B' * x * y + a2' * t' * y * y)
            * (B' * al * p * w - B' * al * u * y + a1' * al * q * t' * w
               - a1' * al * u * x + a2' * al * p * z - a2' * al * t' * v * y) := hcrt1
      _ = B + 2 * a1 * (B' * al * p * w - B' * al * u * y + a1' * al * q * t' * w
            - a1' * al * u * x + a2' * al * p * z - a2' * al * t' * v * y) := by
          rw [hr1e, hV1e]
  have hrecG2 : record (gatherForm a1' a2' B' t') X Y U V
      = B + 2 * a2 * (B' * be * u * y - B' * be * p * w + a2' * be * v * t' * y
          - a2' * be * p * z + a1' * be * u * x - a1' * be * t' * q * w) := by
    have hunf : record (gatherForm a1' a2' B' t') X Y U V
        = 2 * (a2' * a1') * (z * x - t' * w * y)
          * (al * (p * x - t' * q * y) + be * (z * u - t' * w * v))
        + B' * ((z * x - t' * w * y)
                * (al * (a2' * p * y + a1' * q * x + B' * q * y)
                   + be * (a2' * z * v + a1' * w * u + B' * w * v))
              + (a2' * z * y + a1' * w * x + B' * w * y)
                * (al * (p * x - t' * q * y) + be * (z * u - t' * w * v)))
        + 2 * t' * (a2' * z * y + a1' * w * x + B' * w * y)
          * (al * (a2' * p * y + a1' * q * x + B' * q * y)
             + be * (a2' * z * v + a1' * w * u + B' * w * v)) := by
      unfold record gatherForm
      rw [hX, hY, hU, hV]
      ring
    rw [hunf]
    calc 2 * (a2' * a1') * (z * x - t' * w * y)
          * (al * (p * x - t' * q * y) + be * (z * u - t' * w * v))
        + B' * ((z * x - t' * w * y)
                * (al * (a2' * p * y + a1' * q * x + B' * q * y)
                   + be * (a2' * z * v + a1' * w * u + B' * w * v))
              + (a2' * z * y + a1' * w * x + B' * w * y)
                * (al * (p * x - t' * q * y) + be * (z * u - t' * w * v)))
        + 2 * t' * (a2' * z * y + a1' * w * x + B' * w * y)
          * (al * (a2' * p * y + a1' * q * x + B' * q * y)
             + be * (a2' * z * v + a1' * w * u + B' * w * v))
        = (2 * a2' * z * p + B' * (z * q + w * p) + 2 * a1' * t' * w * q)
          + 2 * (a2' * z * z + B' * z * w + a1' * t' * w * w)
            * (B' * be * u * y - B' * be * p * w + a2' * be * v * t' * y
               - a2' * be * p * z + a1' * be * u * x - a1' * be * t' * q * w) := by
          have hb := hcrt2
          linear_combination hb
      _ = B + 2 * a2 * (B' * be * u * y - B' * be * p * w + a2' * be * v * t' * y
            - a2' * be * p * z + a1' * be * u * x - a1' * be * t' * q * w) := by
          rw [hr2e, hV2e]
  -- 6. joint modulus: the record is B mod 2·a1a2
  have hjoint : record (gatherForm a1' a2' B' t') X Y U V
      = B + 2 * (a1 * a2)
        * (al * (B' * be * u * y - B' * be * p * w + a2' * be * v * t' * y
            - a2' * be * p * z + a1' * be * u * x - a1' * be * t' * q * w)
          + be * (B' * al * p * w - B' * al * u * y + a1' * al * q * t' * w
            - a1' * al * u * x + a2' * al * p * z - a2' * al * t' * v * y)) := by
    have hd1 : record (gatherForm a1' a2' B' t') X Y U V - B
        = 2 * a1 * (B' * al * p * w - B' * al * u * y + a1' * al * q * t' * w
            - a1' * al * u * x + a2' * al * p * z - a2' * al * t' * v * y) := by
      linarith [hrecG]
    have hd2 : record (gatherForm a1' a2' B' t') X Y U V - B
        = 2 * a2 * (B' * be * u * y - B' * be * p * w + a2' * be * v * t' * y
            - a2' * be * p * z + a1' * be * u * x - a1' * be * t' * q * w) := by
      linarith [hrecG2]
    have := joint_modulus hBez hd1 hd2
    linarith [this]
  -- 7. the anchored form of G' at the bilinear landing
  have hWval : eval (gatherForm a1' a2' B' t') X Y = a1 * a2 := by
    have hgb := gauss_bilinear a1' a2' B' t' x y z w
    rw [hX, hY]
    rw [← hgb, hV1, hV2]
  have hforma : transform (gatherForm a1' a2' B' t') X Y U V
      = ⟨a1 * a2, record (gatherForm a1' a2' B' t') X Y U V,
         eval (gatherForm a1' a2' B' t') U V⟩ := by
    unfold transform
    rw [hWval]
  -- 8. Chain G' → anchored form
  have hchainG' : Chain (gatherForm a1' a2' B' t')
      (⟨a1 * a2, record (gatherForm a1' a2' B' t') X Y U V,
        eval (gatherForm a1' a2' B' t') U V⟩ : BQF) := by
    rw [← hforma]
    exact transform_chain _ X Y U V huniXY
  -- 9. Chain G → anchored form (same miss, records differ by 2(a1a2)k, same disc)
  have hdiscT : disc (gatherForm a1 a2 B t)
      = disc (⟨a1 * a2, record (gatherForm a1' a2' B' t') X Y U V,
          eval (gatherForm a1' a2' B' t') U V⟩ : BQF) := by
    rw [← hforma, transform_disc _ huniXY]
    exact hdisc
  have hchainG : Chain (gatherForm a1 a2 B t)
      (⟨a1 * a2, record (gatherForm a1' a2' B' t') X Y U V,
        eval (gatherForm a1' a2' B' t') U V⟩ : BQF) := by
    have hGform : gatherForm a1 a2 B t = (⟨a1 * a2, B, t⟩ : BQF) := rfl
    rw [hGform] at hdiscT ⊢
    exact anchored_same_record_chain ha hjoint hdiscT
  -- 10. assemble
  exact chainTrans hchainG (chainSymm hchainG')

#print axioms transform_chain
#print axioms chain_transform_transport
#print axioms canonical_completion
#print axioms crt_record
#print axioms joint_modulus
#print axioms compose_well_defined

end BQF
end GaussForms
end Phys.Foundation
