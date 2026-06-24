import Phys.Algebra.DerivationCompact
import Mathlib.Algebra.Lie.InvariantForm
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- L0 — bundled negative-definiteness on the subalgebra. -/
theorem traceForm_self_eq_zero' (D : derivationLieQ)
    (h : LieModule.traceForm ℚ derivationLieQ (O ℚ) D D = 0) : D = 0 := by
  obtain ⟨Dv, hDv⟩ := D
  exact Subtype.ext (traceForm_self_eq_zero hDv h)

/-- L1 — the centre is trivial. Perfectness (N23) puts every element into lcs 1;
    the lcs-centre orthogonality + negative-definiteness force it to vanish. -/
theorem derivationLieQ_center_eq_bot :
    LieAlgebra.center ℚ derivationLieQ = ⊥ := by
  rw [eq_bot_iff]
  intro z hz
  rw [LieSubmodule.mem_bot]
  -- z ∈ lcs 1 = ⁅⊤, lcs 0⁆ = ⁅⊤,⊤⁆ = ⊤ by perfectness
  have hlcs : z ∈ LieModule.lowerCentralSeries ℚ derivationLieQ derivationLieQ 1 := by
    rw [LieModule.lowerCentralSeries_succ, LieModule.lowerCentralSeries_zero,
        derivationLieQ_perfect]
    exact LieSubmodule.mem_top z
  have hBzz : LieModule.traceForm ℚ derivationLieQ (O ℚ) z z = 0 :=
    LieModule.traceForm_apply_eq_zero_of_mem_lcs_of_mem_center ℚ derivationLieQ (O ℚ) hlcs hz
  exact traceForm_self_eq_zero' z hBzz

/-- L2 — NO ABELIAN ATOMS. -/
theorem derivationLieQ_no_abelian_atom :
    ∀ I : LieIdeal ℚ derivationLieQ, IsAtom I → ¬ IsLieAbelian I := by
  intro I hI habel
  -- abelian ⟹ ⁅I,I⁆ = ⊥
  have hII : (⁅I, I⁆ : LieIdeal ℚ derivationLieQ) = ⊥ :=
    (LieSubmodule.lie_abelian_iff_lie_self_eq_bot I).mp habel
  -- ⁅⊤,I⁆ ≤ I
  have hle : (⁅(⊤ : LieIdeal ℚ derivationLieQ), I⁆ : LieIdeal ℚ derivationLieQ) ≤ I :=
    LieSubmodule.lie_le_right I ⊤
  rcases hI.le_iff.mp hle with hbot | htopI
  · -- ⁅⊤,I⁆ = ⊥ ⟹ I ≤ center = ⊥
    have hIcent : I ≤ LieAlgebra.center ℚ derivationLieQ := by
      intro z hz
      rw [LieModule.mem_maxTrivSubmodule]
      intro a
      have hmem : ⁅a, z⁆ ∈ (⁅(⊤ : LieIdeal ℚ derivationLieQ), I⁆ : LieIdeal ℚ derivationLieQ) :=
        LieSubmodule.lie_mem_lie (LieSubmodule.mem_top a) hz
      rw [hbot, LieSubmodule.mem_bot] at hmem
      exact hmem
    rw [derivationLieQ_center_eq_bot] at hIcent
    exact hI.1 (le_bot_iff.mp hIcent)
  · -- ⁅⊤,I⁆ = I ⟹ B vanishes on I ⟹ I = ⊥
    apply hI.1
    rw [eq_bot_iff]
    intro z hz
    rw [LieSubmodule.mem_bot]
    -- key: every element of ↑I is B-orthogonal to all of I (by span on ⁅⊤,I⁆ = I)
    have hspan : (I.toSubmodule : Submodule ℚ derivationLieQ)
        = Submodule.span ℚ { m | ∃ x ∈ (⊤ : LieIdeal ℚ derivationLieQ), ∃ n ∈ I, ⁅x, n⁆ = m } := by
      conv_lhs => rw [← htopI]
      exact LieSubmodule.lieIdeal_oper_eq_linear_span' ⊤ I
    have hzsub : z ∈ I.toSubmodule := hz
    rw [hspan] at hzsub
    have key : ∀ w, w ∈ I → LieModule.traceForm ℚ derivationLieQ (O ℚ) w z = 0 := by
      refine Submodule.span_induction
        (p := fun z _ => ∀ w, w ∈ I → LieModule.traceForm ℚ derivationLieQ (O ℚ) w z = 0)
        ?_ ?_ ?_ ?_ hzsub
      · rintro m ⟨x, -, n, hn, rfl⟩ w hw
        rw [LieModule.traceForm_comm, LieModule.traceForm_apply_lie_apply]
        have hnw : ⁅n, w⁆ = 0 := by
          have hmem : ⁅n, w⁆ ∈ (⁅I, I⁆ : LieIdeal ℚ derivationLieQ) :=
            LieSubmodule.lie_mem_lie hn hw
          rw [hII, LieSubmodule.mem_bot] at hmem
          exact hmem
        rw [hnw, map_zero]
      · intro w _; rw [map_zero]
      · intro a b _ _ ha hb w hw
        rw [map_add, ha w hw, hb w hw, add_zero]
      · intro c a _ ha w hw
        rw [map_smul, ha w hw, smul_zero]
    have hBzz : LieModule.traceForm ℚ derivationLieQ (O ℚ) z z = 0 := key z hz
    exact traceForm_self_eq_zero' z hBzz

/-- L3 — SEMISIMPLICITY. -/
theorem derivationLieQ_semisimple :
    LieAlgebra.IsSemisimple ℚ derivationLieQ :=
  LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate
    (LieModule.traceForm ℚ derivationLieQ (O ℚ))
    traceForm_nondegenerate
    (LieModule.traceForm_lieInvariant ℚ derivationLieQ (O ℚ))
    (LieModule.traceForm_isSymm ℚ derivationLieQ (O ℚ)).isRefl
    derivationLieQ_no_abelian_atom

end

end Phys.Algebra
