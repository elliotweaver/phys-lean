import Phys.Algebra.LorentzContinuumSubSeed
import Phys.Algebra.LorentzContinuumEigenExtract

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Polynomial

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C115): A BOGUS REFERENCE-FORM NORM FOR THE RE-SEEDED EIGENVECTOR, AT THE HEART OF
-- THE PARITY-FREE DEFLATION RE-SEED. N84 banks `deflateRestrict_reseed_unit`: for a UNIT eigenpair
-- `(l,u)` of an EvC-self-adjoint `g`, whenever the EvC-orthogonal complement `uPerp u` is nontrivial
-- (`0 < finrank`), the deflated operator `deflateC g l u` has a UNIT eigenvector `v` (`EvC v v = 1`)
-- lying INSIDE `uPerp u`. The `EvC v v = 1` normalization is the headline — it is exactly the
-- `EvC u u = 1` shape the N70 `deflateC` engine consumes at the next rung, and the parity-free seed
-- `submodule_selfadj_has_eigenvalue` is LOAD-BEARING in producing it (no `Odd` hypothesis).
-- Instantiate at the banked mixing operator `txMix` (EvC-self-adjoint, `txMix_isEvCSymm`) and its
-- genuine unit eigenpair `(9, mixA)` (`mixA_norm : EvC mixA mixA = 1`, `txMix_eigen_mixA`); the
-- complement `uPerp mixA` is nontrivial since the orthogonal unit `mixB ≠ 0` lies in it
-- (`EvC mixA mixB = 0`). The re-seeded eigenvector `v` then carries `EvC v v = 1`. A BOGUS claim that
-- this normalized re-seed vector has `EvC v v = 7` reduces, through the genuine `EvC v v = 1`, to the
-- false numeric `1 = 7`, and MUST FAIL to compile.
--   CORRECT: the parity-free re-seeded eigenvector inside `uPerp mixA` is UNIT-normalized, `EvC v v
--            = 1`, NOT `7`; the submodule seed has no parity case-split.
-- The bite is `1 = 7` (distinct from … C111 17=40, C112 169=200, C113 1=15, C114 2=5, and the rest
-- of the equality battery).

theorem subseed_wrong_reseed_norm_BOGUS :
    ∃ (lam : Cut) (v : STVC), v ∈ uPerp mixA ∧ EvC v v = 7
      ∧ deflateC txMix (9:Cut) mixA v = lam • v := by
  have hpos : 0 < Module.finrank Cut (uPerp mixA) := by
    have hmem : mixB ∈ uPerp mixA := (mem_uPerp mixA mixB).mpr mix_orth
    have hne : (⟨mixB, hmem⟩ : uPerp mixA) ≠ 0 := by
      intro h
      have : mixB = 0 := congrArg Subtype.val h
      have hnorm : EvC mixB mixB = 1 := mixB_norm
      rw [this] at hnorm
      simp only [EvC_zero_left] at hnorm
      exact one_ne_zero hnorm.symm
    haveI : Nontrivial (uPerp mixA) := ⟨⟨_, 0, hne⟩⟩
    exact Module.finrank_pos
  obtain ⟨lam, v, hmem, hnorm, hev⟩ :=
    deflateRestrict_reseed_unit txMix_isEvCSymm mixA_norm txMix_eigen_mixA hpos
  refine ⟨lam, v, hmem, ?_, hev⟩
  rw [hnorm]

end

end Counterexamples
