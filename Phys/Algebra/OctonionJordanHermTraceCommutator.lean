import Phys.Algebra.OctonionJordanTraceFormInvariance
import Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

/-!
# N299 — The innerness-FREE trace-annihilation of the Jordan-derivation algebra `f₄`

**The route-finder result (W1 step 2 dissolution).** The full abstract predicate "`derH3` kills
the linear trace" — `∀ T ∈ derH3, ∀ Hermitian A, jTr (T A) = 0` — was diagnosed in N298 as NOT
forceable from the `IsHermJordanDerivQ` Leibniz predicate alone: from the Leibniz law it is
EQUIVALENT to `T` being `jTraceForm`-skew, and neither follows from the other without an
independent structural fact. The STANDARD such fact is the Chevalley–Schafer theorem
`Der(H₃(O)) = InnDer` (every Jordan derivation of the reduced exceptional Jordan algebra is inner);
a MEASURED spanning fact (`workbench/N299/probe1.py`: `span{innerMul(bᵢ,bⱼ)}` over a Hermitian
basis has rank `52 = dim f₄`, so the theorem is TRUE) — but a HEAVY build (no `dim f₄ = 52` is
banked; it needs a full spanning + dimension argument).

**The theory offers the SHORTER classical stroke, which DISSOLVES the innerness requirement.**
A derivation annihilates a trace *because its action on the multiplication operator is a
COMMUTATOR, whose operator trace is automatically zero* — no innerness, no classification. This
node banks that reduction, forced by the banked `f₄`-equivariance (N296):

* `hermSub` — the Hermitian submodule `{ M | Mᴴ = M }` of the arena (the derived `H₃(O)`),
  automatically `Module.Finite`/`Module.Free` over `ℚ`.
* `restricted_comm` — the N296 equivariance `⁅T, Lmul A⁆ B = Lmul (T A) B` (`T ∈ derH3`, `A,B`
  Hermitian) transported to `hermSub`: `(Lmul (T A))|_H = T|_H ∘ (Lmul A)|_H − (Lmul A)|_H ∘ T|_H`,
  an operator COMMUTATOR on the finite-dimensional Hermitian arena.
* ★★★ `derH3_kills_hermTrace` — hence `trace_H ((Lmul (T A))|_H) = 0` for EVERY `T ∈ derH3`
  (every Hermitian Jordan derivation) and Hermitian `A`, via `LinearMap.trace_mul_comm`. NO
  Chevalley–Schafer innerness is used; the commutator-trace kills it for ALL derivations at once.
* W8 non-vacuity: `dilation_restrict` (`(Lmul 1)|_H = 2 • id`), `finrank_hermSub_pos`
  (`0 < dim hermSub`, since `1 ≠ 0` lives in it), and `dilation_hermTrace_ne`
  (`trace_H ((Lmul 1)|_H) = 2 · dim hermSub ≠ 0`) — the annihilated trace functional is genuinely
  NONZERO on the `f₄`-central dilation, so `Lmul (T A)` lands in the kernel of a NONZERO functional.

**THE DISSOLUTION / MOAT.** The field proves `Der(H₃(O)) = InnDer` (a classification) and then
observes an inner derivation kills the trace. The theory DISSOLVES the classification: the
derivation's action on the Jordan left-multiplication is `⁅T, Lmul A⁆ = Lmul (T A)` (the banked
Leibniz law, N296), a COMMUTATOR of operators, whose trace vanishes by cyclicity — killing the
trace for the WHOLE derivation algebra `f₄` in one stroke, no innerness needed.

**ONE CAUSE MANY TERMINATIONS.** The SAME octonion non-associativity that stops the cascade (N2c)
and caps the Hermitian Jordan tower at order 3 (N5, `jordan_fails_H4`) furnishing `H₃(O)` makes its
Jordan derivations `f₄` satisfy the Leibniz law — and the Leibniz law is exactly what turns the
action on the multiplication operator into a commutator, forcing the trace-annihilation.

**Physics-words-removable.** Over `ℚ` and `O ℚ`, for `jb A B = A*B + B*A` on `3×3` matrices and
`hermSub = { M | Mᴴ = M }`: `(Lmul (T A))|_H = T|_H ∘ (Lmul A)|_H − (Lmul A)|_H ∘ T|_H` for
`T ∈ derH3` and Hermitian `A`, hence its operator trace on `hermSub` is `0`; and
`trace_H ((Lmul 1)|_H) = 2 · dim hermSub ≠ 0`. Pure operator algebra — stands.

**Scope (W3 decompose; NOT banked).** The trace-COEFFICIENT identity
`trace_H ((Lmul C)|_H) = k · rtr C` with `k ≠ 0` (measured `k = 18`) — which, combined with
`derH3_kills_hermTrace`, closes the FULL octonion-valued `∀ T ∈ derH3, jTr (T A) = 0` and the
`f₄`-module split `L = ℚ·1 ⊕ L₀` — is CHILDED (a directed W9 sub-node). NOT banked: the `f₄`-module
split; the dim-78 bundled `e₆`; the ★5 mass-texture VALUE / ★2 mixing VALUE (route-not-yet-found,
FORCED build targets). "= a physical trace anomaly / conserved charge" is removable prose.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-- The Hermitian submodule `{ M | Mᴴ = M }` of the matrix arena — the derived `H₃(O)` as a
    `ℚ`-submodule of `Matrix (Fin 3) (Fin 3) (O ℚ)`. Automatically `Module.Finite`/`Module.Free`. -/
def hermSub : Submodule ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)) where
  carrier := { M | Mᴴ = M }
  add_mem' := by
    intro a b ha hb
    simp only [Set.mem_setOf_eq, conjTranspose_add] at *
    rw [ha, hb]
  zero_mem' := by simp only [Set.mem_setOf_eq, conjTranspose_zero]
  smul_mem' := by
    intro c a ha
    simp only [Set.mem_setOf_eq] at *
    rw [conjTranspose_smul, star_trivial, ha]

theorem mem_hermSub {M : Matrix (Fin 3) (Fin 3) (O ℚ)} : M ∈ hermSub ↔ Mᴴ = M := Iff.rfl

/-- `Lmul A` maps the Hermitian submodule to itself when `A` is Hermitian (banked `jb_herm`). -/
theorem lmul_mapsTo {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    ∀ X ∈ hermSub, (Lmul A) X ∈ hermSub := fun X hX => by
  rw [mem_hermSub] at hX ⊢
  simp only [Lmul_apply]
  exact jb_herm hA hX

/-- Every `T ∈ derH3` preserves the Hermitian submodule (the first `IsHermJordanDerivQ` clause). -/
theorem derH3_mapsTo {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))} (hT : T ∈ derH3) :
    ∀ X ∈ hermSub, T X ∈ hermSub := fun X hX => by
  rw [mem_hermSub] at hX ⊢
  exact hT.1 X hX

/-- `T A` is Hermitian for `T ∈ derH3` and Hermitian `A`. -/
theorem TA_herm {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))} (hT : T ∈ derH3)
    {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) : (T A)ᴴ = T A :=
  hT.1 A hA

/-- ★★★ THE RESTRICTED COMMUTATOR IDENTITY. On the Hermitian submodule, the spectrum-mover
    `Lmul (T A)` restricts to the OPERATOR COMMUTATOR of `T|_H` with `(Lmul A)|_H`:

        `(Lmul (T A))|_H = T|_H · (Lmul A)|_H − (Lmul A)|_H · T|_H`.

    This is N296 `spectrum_sector_equivariance` (`⁅T, Lmul A⁆ B = Lmul (T A) B`, the Leibniz law of
    `jb` rearranged) transported to the submodule. It is the move that makes the trace-annihilation
    an inner-derivation-FREE consequence of trace cyclicity. -/
theorem restricted_comm {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))}
    (hT : T ∈ derH3) {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    (Lmul (T A)).restrict (lmul_mapsTo (TA_herm hT hA))
      = (T.restrict (derH3_mapsTo hT)) * ((Lmul A).restrict (lmul_mapsTo hA))
        - ((Lmul A).restrict (lmul_mapsTo hA)) * (T.restrict (derH3_mapsTo hT)) := by
  apply LinearMap.ext; intro X
  apply Subtype.ext
  have hX : (X : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = X := (mem_hermSub).1 X.2
  have hkey := spectrum_sector_equivariance T hT hA hX
  rw [show (⁅T, Lmul A⁆ : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = T * Lmul A - Lmul A * T from Ring.lie_def T (Lmul A)] at hkey
  simp only [LinearMap.sub_apply, Module.End.mul_apply] at hkey ⊢
  simp only [Submodule.coe_sub, LinearMap.restrict_coe_apply]
  rw [← hkey]

/-- ★★★ THE INNERNESS-FREE TRACE-ANNIHILATION. For EVERY `T ∈ derH3` (every Hermitian Jordan
    derivation of the derived `H₃(O)`) and Hermitian `A`, the Hermitian-arena operator trace of
    the spectrum-mover `Lmul (T A)` VANISHES — because `Lmul (T A)` restricts to a COMMUTATOR
    (`restricted_comm`), whose trace is `0` by cyclicity (`LinearMap.trace_mul_comm`). NO
    Chevalley–Schafer innerness theorem is used; the whole `f₄` kills the trace at once. -/
theorem derH3_kills_hermTrace {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))}
    (hT : T ∈ derH3) {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) :
    LinearMap.trace ℚ hermSub ((Lmul (T A)).restrict (lmul_mapsTo (TA_herm hT hA))) = 0 := by
  rw [restricted_comm hT hA]
  have h := LinearMap.map_sub (LinearMap.trace ℚ hermSub)
    (T.restrict (derH3_mapsTo hT) * (Lmul A).restrict (lmul_mapsTo hA))
    ((Lmul A).restrict (lmul_mapsTo hA) * T.restrict (derH3_mapsTo hT))
  rw [h, LinearMap.trace_mul_comm, sub_self]

/-! ## W8 non-vacuity — the annihilated trace functional is genuinely NONZERO. -/

/-- The dilation `Lmul 1` restricts to `2 • id` on the Hermitian arena. -/
theorem dilation_restrict :
    (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
      (lmul_mapsTo (by simp : (1 : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = 1))
    = (2 : ℚ) • (LinearMap.id : Module.End ℚ hermSub) := by
  apply LinearMap.ext; intro X
  apply Subtype.ext
  simp only [LinearMap.restrict_coe_apply, Lmul_apply, LinearMap.smul_apply,
    LinearMap.id_coe, id_eq, SetLike.val_smul]
  unfold jb
  simp only [one_mul, mul_one]
  rw [two_smul]

/-- The identity matrix is Hermitian, hence a member of `hermSub`. -/
theorem one_mem_hermSub : (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) ∈ hermSub := by
  rw [mem_hermSub]; simp

/-- `hermSub` is nonzero — it contains the nonzero identity. -/
theorem hermSub_ne_bot : hermSub ≠ ⊥ := by
  intro h
  have h1 : (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) ∈ hermSub := one_mem_hermSub
  rw [h, Submodule.mem_bot] at h1
  have h00 := congrFun (congrFun h1 0) 0
  simp only [Matrix.one_apply_eq, Matrix.zero_apply] at h00
  exact one_ne_zero_O h00

/-- `hermSub` has positive dimension (`1 ≠ 0` lives in it). -/
theorem finrank_hermSub_pos : 0 < Module.finrank ℚ hermSub :=
  Module.finrank_pos_iff.mpr (Submodule.nontrivial_iff_ne_bot.mpr hermSub_ne_bot)

/-- The Hermitian-arena trace of the dilation is `2 · dim hermSub`. -/
theorem dilation_hermTrace :
    LinearMap.trace ℚ hermSub
      ((Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
        (lmul_mapsTo (by simp : (1 : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = 1)))
    = (2 : ℚ) * (Module.finrank ℚ hermSub : ℚ) := by
  rw [dilation_restrict, map_smul, LinearMap.trace_id, smul_eq_mul]

/-- W8: the annihilated trace functional is genuinely NONZERO on the `f₄`-central dilation
    (`2 · dim hermSub ≠ 0`), so `Lmul (T A)` lands in the kernel of a NONZERO functional — the
    trace-annihilation is not the vacuous statement that the functional is identically zero. -/
theorem dilation_hermTrace_ne :
    LinearMap.trace ℚ hermSub
      ((Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
        (lmul_mapsTo (by simp : (1 : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = 1))) ≠ 0 := by
  rw [dilation_hermTrace]
  have h : (0 : ℚ) < (Module.finrank ℚ hermSub : ℚ) := by exact_mod_cast finrank_hermSub_pos
  positivity

/-- ★★★ CAPSTONE. The innerness-free trace-annihilation structure: on the Hermitian arena,
    (1) every `T ∈ derH3` sends the spectrum-mover `Lmul (T A)` to a COMMUTATOR whose trace is `0`
    (`derH3_kills_hermTrace`), and (2) the annihilated trace functional is genuinely NONZERO
    (`dilation_hermTrace_ne`) — carrying `jordan_fails_H4` (N5) in the TYPE to keep the derived
    arena (the order-3 cap) explicit. NO Chevalley–Schafer innerness is used. -/
theorem herm_trace_commutator_structure :
    (∀ (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) (hT : T ∈ derH3)
        {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A),
        LinearMap.trace ℚ hermSub ((Lmul (T A)).restrict (lmul_mapsTo (TA_herm hT hA))) = 0)
    ∧ LinearMap.trace ℚ hermSub
        ((Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
          (lmul_mapsTo (by simp : (1 : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = 1))) ≠ 0
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨fun _T hT _A hA => derH3_kills_hermTrace hT hA, dilation_hermTrace_ne, jordan_fails_H4⟩

end Phys.Algebra.HJ
