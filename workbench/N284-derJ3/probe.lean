import Phys.Algebra.OctonionJordanGaugeSpectrumInvariant
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.DerivationBracket
import Mathlib.Tactic

/-! N284 PROBE — de-risk the two trickiest bricks BEFORE production:
    (P1) jActL as a bundled End, and its bracket-compat (map_lie' for the LieHom);
    (P2) B6 skew-adjointness in jTraceForm.
    Bounded: coordinate-free, banked lemmas only. -/

namespace Phys.Algebra
open scoped BigOperators

set_option synthInstance.maxSize 400000

/-- P1a: jAct bundled as a linear endomorphism of the arena. -/
noncomputable def jActLp (D : Module.End ℚ (O ℚ)) :
    Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)) where
  toFun := jAct D
  map_add' := jAct_add D
  map_smul' := by intro r M; simpa using jAct_smul_matrix D r M

@[simp] theorem jActLp_apply (D : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jActLp D M = jAct D M := rfl

/-- P1b: the KEY bracket-compat obligation for the LieHom map_lie'.
    `jAct ⁅D,D'⁆ = ⁅jActL D, jActL D'⁆` as arena endomorphisms.
    ⁅D,D'⁆ = D∘D' − D'∘D, and jAct is functorial: jAct(D∘D') M = (D∘D') applied entrywise. -/
theorem jAct_bracket_probe (D D' : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jAct (⁅D, D'⁆) M = jAct D (jAct D' M) - jAct D' (jAct D M) := by
  apply Matrix.ext; intro i j
  simp only [jAct, Matrix.map_apply, Matrix.sub_apply, Ring.lie_def,
    LinearMap.sub_apply, LinearMap.comp_apply]

/-- P2: B6 skew-adjointness of jActL in the trace form (the UNIQUE-FORM anchor).
    reQ(jTraceForm (jAct D A) B) + reQ(jTraceForm A (jAct D B)) = 0. -/
theorem jActL_skew_probe (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    reQ (jTraceForm (jAct D A) B) + reQ (jTraceForm A (jAct D B)) = 0 := by
  -- jTraceForm X Y = trace (jb X Y); jb(jAct D A) B + jb A (jAct D B) = jAct D (jb A B)
  have hjb : jb (jAct D A) B + jb A (jAct D B) = jAct D (jb A B) := (jAct_jb D hD A B).symm
  rw [jTraceForm, jTraceForm, ← reQ_add, ← Matrix.trace_add, hjb]
  -- trace (jAct D (jb A B)) = ∑ i, D ((jb A B) i i); reQ of that sum = ∑ reQ (D ...) = 0
  rw [jAct, Matrix.trace]
  simp only [Matrix.diag_apply, Matrix.map_apply]
  -- reQ (∑ i, D ((jb A B) i i)) = ∑ i, reQ (D ((jb A B) i i))
  rw [show (reQ (∑ i, D ((jb A B) i i))) = ∑ i, reQ (D ((jb A B) i i)) from ?_]
  · apply Finset.sum_eq_zero; intro i _; exact reQ_deriv_zero D hD _
  · induction (Finset.univ : Finset (Fin 3)) using Finset.induction with
    | empty => simp [reQ]
    | insert h ih => rw [Finset.sum_insert h, Finset.sum_insert h, map_add, reQ_add, ih]

end Phys.Algebra
