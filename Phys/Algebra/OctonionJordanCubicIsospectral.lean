import Phys.Algebra.OctonionJordanFamilyMassMixingOrbit

/-!
# N302 — The cubic/determinant isospectrality: `f₄ = Der(H₃(O))` preserves the FULL spectrum

## What this node banks (completing N301's childed cubic rung — the ★5↔★2 joint, forced)

The derived exceptional-Jordan arena `J₃(O ℚ) = H₃(O ℚ)` (dim 27, N5/N267) has a CUBIC
characteristic polynomial — its Jordan tower is cap-forced at order 3 (N5, `jordan_fails_H4`),
so a Hermitian element has EXACTLY THREE spectral invariants: the linear trace `jTr` (N214), the
quadratic spur `jS`, and the cubic norm / reduced determinant `jN` (the three char-poly
coefficients, N216 `jN_charpoly`). "Isospectral" — preserving the spectrum — means preserving all
THREE.

N301 built the family-`so(3)` rotation of the mass-texture module `L₀` and proved it preserves the
LINEAR and QUADRATIC invariants, but only for the single family generator `famC`, and explicitly
CHILDED the CUBIC-norm preservation ("needs the cubic power-Leibniz"). THIS node completes the
statement — and does it for the WHOLE derived symmetry `f₄ = derH3`, not just `famC`:

* **THE CUBIC/DETERMINANT FIRST-VARIATION VANISHES.** For EVERY `T ∈ derH3` (every Hermitian
  Jordan derivation) and every Hermitian `A`,
    `rtr (jb (jb A A) (T A)) = 0`      (`derH3_kills_cubic_spectral`).
  This is the first variation of the cubic norm `jN` under the flow of `T` (the `σ₃` char-poly
  coefficient). Together with `jTr (T A) = 0` (N300 `derH3_kills_jTr`, the LINEAR variation) and
  `rtr (jb A (T A)) = 0` (`derH3_kills_quadratic_spectral`, the QUADRATIC variation), all THREE
  char-poly coefficients are fixed to first order: `f₄` is ISOSPECTRAL — it preserves the FULL
  spectrum, only rotating the eigenbasis.

* **NO CUBIC POWER-ASSOCIATIVITY.** The naive `T (A∘A∘A) = 3 (A∘A) ∘ (T A)` FAILS over the
  octonions (Jordan products are not power-associative that way — measured resid `6.07e+01`,
  `workbench/N301/probe4.py`). The clean route is the derivation LEIBNIZ law applied to
  `T (jb (jb A A) A)` (a trace-killed Hermitian element, N300), expanded by Leibniz, then closed by
  the `S₃`-symmetry of the derived trace 3-form `t(X,Y,Z) = rtr (jb (jb X Y) Z)` — which is CYCLIC
  because `rtr` is trace-associative (N298 `traceform_associative`, from octonion `reQ_mul_assoc3`,
  N209) and symmetric (`jb_comm`). The three trilinear terms `t(TA,A,A)`, `t(A,TA,A)`, `t(A,A,TA)`
  are all EQUAL, so their sum being `0` forces each to `0` (ℚ is 3-torsion-free).

## The dissolution / the moat

Standard invariant theory establishes that `F₄ = Aut(J₃(O))` preserves the cubic norm as an
EXTERNAL fact, and posits masses and mixing as INDEPENDENT free parameters. The theory DERIVES that
`f₄ = Der(H₃(O))` preserves the cubic norm from the fold's OWN trace-associativity — the SAME
identity `reQ_mul_assoc3` that makes the cubic norm WELL-DEFINED on the non-associative octonions
(N215 `jN_cross_assoc`) makes its first variation under the derived symmetry VANISH. So the family
rotation (mixing) preserves ALL the eigenvalues (masses) while rotating the eigenbasis: masses and
mixing are ONE isospectral orbit, the ★5↔★2 dissolution now COMPLETE at all three char-poly
coefficients, not a pair of independently-posited sectors.

ONE CAUSE MANY TERMINATIONS: the same octonion non-associativity that stops the cascade (N2c) and
caps the Hermitian Jordan tower at order 3 (N5, `jordan_fails_H4`) — furnishing the arena `H₃(O)`
with a CUBIC characteristic polynomial and a WELL-DEFINED reduced determinant (its real-part trace-
associativity) — makes its derivations `f₄` preserve all three coefficients of that polynomial,
i.e. isospectral.

## Scope (honesty clause)

Banks the cubic (determinant) first-variation vanishing for all of `f₄`, the generalized quadratic
(N301's `famC`-only quadratic lifted to all of `derH3`), the `S₃`-symmetric derived trace 3-form,
and the full-isospectrality bundling ONLY. Deliverables stay at the abstract `rtr`/`jb` trace-power
level (the char-poly reading via N216 `jN_charpoly` is REMOVABLE prose — it avoids a W9 octonion-
cubic coordinate expansion of `jN` over the `Hm` parametrization). Does NOT bank: the ★2 mixing-angle
VALUE / the ★5 mass-ratio VALUES (route-not-yet-found — FORCED build targets; N275 proved the family
`A₂` root system has NO fixed root, so a distinguished texture/value is not forceable from the
current family-symmetric structure), "= the physical spectrum / CKM-PMNS" (removable prose), the
dim-78 bundled `e₆` LieSubalgebra.

Physics-words-removable: delete mass/mixing/spectrum/isospectral/determinant/generation — the pure
statement is that for `T ∈ derH3` and Hermitian `A`, `rtr (jb (jb A A) (T A)) = 0` and
`rtr (jb A (T A)) = 0` (with `jTr (T A) = 0` from N300), and the trace 3-form
`rtr (jb (jb X Y) Z)` is cyclic. Pure operator/matrix algebra over ℚ and `O ℚ`.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The derived Cartan–Killing trace 3-form is `S₃`-symmetric. -/

/-- ★ THE DERIVED TRACE 3-FORM IS CYCLIC. `t (X,Y,Z) := rtr (jb (jb X Y) Z)` is invariant under a
    cyclic rotation of its three arguments: `rtr (jb (jb X Y) Z) = rtr (jb (jb Y Z) X)`. Via the
    banked N298 trace-form invariance (`traceform_associative`, from octonion `reQ_mul_assoc3`) and
    the symmetry of the Jordan bracket (`jb_comm`). Together with `jb_comm` this makes `t` fully
    `S₃`-symmetric — the property that closes the cubic first-variation. -/
theorem rtr_jb_cyc (X Y Z : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr (jb (jb X Y) Z) = rtr (jb (jb Y Z) X) := by
  rw [traceform_associative X Y Z, jb_comm X (jb Y Z)]

/-! ## The whole `f₄` preserves the linear, quadratic AND cubic spectral invariants. -/

/-- ★★ THE QUADRATIC SPECTRAL INVARIANT IS PRESERVED BY ALL OF `f₄`. `rtr (jb A (T A)) = 0` for
    EVERY `T ∈ derH3` and Hermitian `A` — the second characteristic-polynomial coefficient (the sum
    of pairwise eigenvalue products, `jS`) is unchanged to first order under the flow of any Jordan
    derivation. GENERALIZES N301's `family_kills_quadratic_spectral` (which covered only the family
    generator `famC`) to the whole derivation algebra. Route: `T`'s derivation Leibniz law
    `T (jb A A) = jb (T A) A + jb A (T A) = 2 • jb A (T A)` (via `jb_comm`); `jb A A` is Hermitian
    (`jb_herm`), so `rtr (T (jb A A)) = 0` (N300 `derH3_kills_jTr`); additivity of `rtr` forces
    `rtr (jb A (T A)) = 0`. -/
theorem derH3_kills_quadratic_spectral {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))}
    (hT : T ∈ derH3) {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (jb A (T A)) = 0 := by
  have hleib : T (jb A A) = jb (T A) A + jb A (T A) := (mem_derH3.mp hT).2 A A hA hA
  rw [jb_comm (T A) A] at hleib
  have hAA : (jb A A)ᴴ = jb A A := jb_herm hA hA
  have hkill : rtr (T (jb A A)) = 0 := by
    have h := derH3_kills_jTr hT hAA
    unfold rtr; rw [h]; simp [reQ]
  rw [hleib, rtr_add] at hkill
  linarith [hkill]

/-- ★★★ THE CUBIC/DETERMINANT SPECTRAL INVARIANT IS PRESERVED BY ALL OF `f₄`.
    `rtr (jb (jb A A) (T A)) = 0` for EVERY `T ∈ derH3` and Hermitian `A` — the third (last, cap-
    forced) characteristic-polynomial coefficient (the reduced determinant / cubic norm `jN`, the
    product of eigenvalues) is unchanged to first order under the flow of any Jordan derivation.

    THE FORCED ROUTE (no cubic power-associativity — the naive `T (A∘A∘A) = 3 (A∘A)∘(T A)` FAILS
    over the octonions, measured): apply `T`'s Leibniz law to the Hermitian element `jb (jb A A) A`,
    which `T` maps to trace-zero (N300 `derH3_kills_jTr`):
      `T (jb B A) = jb (T B) A + jb B (T A)`,   `B := jb A A`,
      `T B = 2 • jb A (T A)`   (Leibniz + `jb_comm`),
    so `0 = rtr (T (jb B A)) = 2 • rtr (jb (jb A (T A)) A) + rtr (jb (jb A A) (T A))`. By the
    `S₃`-symmetry of the trace 3-form (`rtr_jb_cyc`), `rtr (jb (jb A (T A)) A) = rtr (jb (jb A A)
    (T A))`, giving `3 • rtr (jb (jb A A) (T A)) = 0`, hence `= 0` (ℚ is 3-torsion-free). -/
theorem derH3_kills_cubic_spectral {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))}
    (hT : T ∈ derH3) {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    rtr (jb (jb A A) (T A)) = 0 := by
  set B := jb A A with hBdef
  have hB : Bᴴ = B := jb_herm hA hA
  have hleibBA : T (jb B A) = jb (T B) A + jb B (T A) := (mem_derH3.mp hT).2 B A hB hA
  have hTB : T B = jb (T A) A + jb A (T A) := (mem_derH3.mp hT).2 A A hA hA
  rw [jb_comm (T A) A] at hTB
  have hBA : (jb B A)ᴴ = jb B A := jb_herm hB hA
  have hkill : rtr (T (jb B A)) = 0 := by
    have h := derH3_kills_jTr hT hBA
    unfold rtr; rw [h]; simp [reQ]
  rw [hleibBA, rtr_add, hTB, jb_add_left (jb A (T A)) (jb A (T A)) A, rtr_add] at hkill
  have hcyc1 : rtr (jb (jb A (T A)) A) = rtr (jb (jb (T A) A) A) := by
    rw [rtr_jb_cyc A (T A) A]
  have hcyc2 : rtr (jb (jb (T A) A) A) = rtr (jb (jb A A) (T A)) := by
    rw [rtr_jb_cyc (T A) A A]
  rw [hcyc1, hcyc2, hBdef] at hkill
  linarith [hkill]

/-! ## W8 anti-vacuity — the derivation genuinely moves a Hermitian matter element. -/

/-- ★★ W8 NON-VACUITY. The family generator `famC ∈ derH3` genuinely MOVES the Hermitian matter
    element `slotB 1` (`famC (slotB 1) = slotA 1 ≠ 0`, `famC_slotB_ne_zero`), YET the isospectral
    theorems fix all three char-poly coefficients of `slotB 1` to first order — so the derivation
    performs a genuine nonzero motion that is spectrum-preserving, not the trivial zero flow. -/
theorem derH3_isospectral_nonvacuous :
    innerMul (slotA (1:O ℚ)) (slotB 1) (slotB 1) ≠ 0 := famC_slotB_ne_zero

/-! ## The capstone — full-spectrum isospectrality of the derived symmetry `f₄`. -/

/-- ★★★ THE FULL ISOSPECTRALITY OF `f₄ = derH3`. Every Hermitian Jordan derivation `T` of the
    derived arena `H₃(O)` preserves ALL THREE (cap-forced) characteristic-polynomial coefficients of
    every Hermitian element `A` to first order:
    · LINEAR:    `jTr (T A) = 0`                  (N300 `derH3_kills_jTr`),
    · QUADRATIC: `rtr (jb A (T A)) = 0`           (`derH3_kills_quadratic_spectral`),
    · CUBIC:     `rtr (jb (jb A A) (T A)) = 0`    (`derH3_kills_cubic_spectral`).
    So `f₄` is ISOSPECTRAL — it preserves the full spectrum, only rotating the eigenbasis. The family
    `so(3) ⊆ f₄` mixing (N301) is thus isospectral to FULL cubic order: mixing without changing ANY
    eigenvalue. Non-vacuously (`derH3_isospectral_nonvacuous` — a genuine nonzero motion of a
    Hermitian matter element). Cap-forced at the maximal Jordan order 3 (`jordan_fails_H4`, N5),
    which is WHY there are exactly these three coefficients. DERIVED — the reduced-determinant
    invariance the field takes as the definition of `F₄`, here a forced consequence of the fold's own
    trace-associativity. -/
theorem derH3_isospectral :
    (∀ (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))), T ∈ derH3 →
        ∀ A : Matrix (Fin 3) (Fin 3) (O ℚ), Aᴴ = A → jTr (T A) = 0)
    ∧ (∀ (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))), T ∈ derH3 →
        ∀ A : Matrix (Fin 3) (Fin 3) (O ℚ), Aᴴ = A → rtr (jb A (T A)) = 0)
    ∧ (∀ (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))), T ∈ derH3 →
        ∀ A : Matrix (Fin 3) (Fin 3) (O ℚ), Aᴴ = A → rtr (jb (jb A A) (T A)) = 0)
    ∧ (innerMul (slotA (1:O ℚ)) (slotB 1) (slotB 1) ≠ 0)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨fun _ hT _A hA => derH3_kills_jTr hT hA,
   fun _ hT _A hA => derH3_kills_quadratic_spectral hT hA,
   fun _ hT _A hA => derH3_kills_cubic_spectral hT hA,
   derH3_isospectral_nonvacuous,
   jordan_fails_H4⟩

end Phys.Algebra.HJ
