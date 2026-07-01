/-
  Phys.Algebra.TowerGatherTracelessSym27 — N228.
  ===========================================================================
  THE FINER SPLIT OF THE SYMMETRIC 28:
    `Sym²7  =  1 (trivial rep, ℚ·id)  ⊕  27 (traceless-symmetric)`   as g₂-modules,

  completing the full g₂-module decomposition of the gather obstruction's tensor square
    `7 ⊗ 7  =  1 ⊕ 7 ⊕ 14 ⊕ 27`
  on the banked Cayley–Dickson tower. This is the LAST irreducible piece.

  A still-deeper cut of the gather frontier (N218T/N219/…/N226/N227), under the OVERNIGHT
  PRIORITY LOCK. The chain STAYS ON THE GATHER.

  THE ARC SO FAR. N223–N226 built the ANTISYMMETRIC half `Λ²7 = so(7) = 21 = 14 ⊕ 7`
  (`imRep(g₂) ⊕ crossEmb(7)`). N227 built the whole split `End ℚ ImO = Sym²7 (28) ⊕ Λ²7 (21)`
  and isolated the trivial rep `1 = ℚ·id` inside the symmetric side (`one_mem_selfAdj`,
  `one_adEnd_zero`), with `finrank_selfAdj_eq_28` and both halves g₂-stable (`selfAdj_adEnd_inv`).

  What N227 did NOT do: split the symmetric 28 itself. As a g₂-module `Sym²7 = 1 ⊕ 27`: the
  1-dimensional trivial (metric/trace) rep spanned by the identity, and the 27-dimensional
  traceless-symmetric rep — the fundamental representation of g₂'s ambient so(7) that a physicist
  recognizes as the last irreducible of `7 ⊗ 7`. N228 builds that split on the banked tower and
  proves it a decomposition of g₂-MODULES.

  (1) THE TWO PIECES (derived, not posited). On `End ℚ ImO` with the banked `selfAdjointSubmodule
      bornBil` (= `Sym²7`, N227), the Mathlib trace functional `LinearMap.trace ℚ ImO`
      (MACHINERY on the derived `ImO`):
      - `trivialLine := ℚ ∙ (1 : Module.End ℚ ImO)` — the trivial rep line (the metric `ℚ·id`).
      - `tracelessSym := selfAdjointSubmodule bornBil ⊓ LinearMap.ker (LinearMap.trace ℚ ImO)` —
        the traceless-symmetric 27.

  (2) THE TRACE OF THE IDENTITY IS 7 (`trace_one_eq_seven`): Mathlib `LinearMap.trace_one` + banked
      `finrank_ImO = 7`. Hence `(1 : End ℚ ImO) ≠ 0` (`one_ne_zero_End`: else `7 = 0`, char 0) and
      `finrank trivialLine = 1` (`finrank_trivialLine`, `finrank_span_singleton`).

  (3) ★★★ THE FINER DECOMPOSITION (the crux). `trivialTracefree_isCompl_in_selfAdj`:
        `trivialLine ⊓ tracelessSym = ⊥`  and  `trivialLine ⊔ tracelessSym = selfAdjointSubmodule`.
      Disjoint (`trivialTracefree_disjoint`): a `c • 1` with `trace = 0` gives `7c = 0 ⇒ c = 0`
      (char 0). Codisjoint (`trivialTracefree_span`): a self-adjoint `φ` of trace `t` splits as
      `φ = (t/7)•1 + (φ − (t/7)•1)`, first in `trivialLine`, second self-adjoint AND traceless
      (`t − (t/7)·7 = 0`), i.e. in `tracelessSym`. `Sym²7 = 1 ⊕ 27`.

  (4) THE DIMENSIONS. `finrank_tracelessSym_eq_27`: from `finrank_sup_add_finrank_inf_eq` on
      `(trivialLine, tracelessSym)` — `28 + 0 = 1 + finrank tracelessSym ⇒ 27` (banked
      `finrank_selfAdj_eq_28`, N227). `28 = 1 + 27`.

  (5) BOTH PIECES ARE g₂-SUBMODULES under `adEnd D : X ↦ ⁅imRep D, X⁆`.
      `trivialLine_adEnd_inv`: `adEnd D` kills the line (banked `one_adEnd_zero`, N227).
      `tracelessSym_adEnd_inv`: the symmetric side is preserved (banked `selfAdj_adEnd_inv`, N227)
      AND the trace of a commutator vanishes (Mathlib `trace_lie`), so `ker(trace)` is preserved;
      the intersection is preserved. `Sym²7 = 1 ⊕ 27` INTO g₂-submodules.

  (6) W8 NON-VACUITY. `one_mem_trivialLine`: `1 ∈ trivialLine` (the trivial rep is nonzero).
      `finrank_tracelessSym_eq_27` (`27 > 0`): the traceless-symmetric 27 is nonzero.

  Capstone `traceless_sym_27_structure` bundles the finer IsCompl-within-`selfAdj` + dims (1, 27, 28)
  + both g₂-submodules.

  ONE CAUSE, THE LAST FACE. The same Born POSITIVITY that (N223–N227) made `so(7)` the skew half and
  split `End` symmetric/antisymmetric is precisely the metric whose TRACE (the derived `finrank ImO
  = 7`) isolates its own line `ℚ·id` inside the symmetric side; the traceless complement is the last
  irreducible `27`. All four g₂-modules of `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` are now explicit on the banked
  tower.

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (g₂/so(7)/trivial-rep/traceless/metric/
  fundamental/representation/tensor/27): over the derived `ℚ` and `O ℚ = CD (H ℚ)`, for
  `ImO = ker(star+1)`, the Born form `bornBil` and `imRep D = D|ImO`, the line `ℚ ∙ 1` and the
  intersection `selfAdjointSubmodule bornBil ⊓ ker(trace)` are disjoint, span the self-adjoint
  submodule, have finrank `1` and `27` (total `28`), and are each closed under `X ↦ ⁅imRep D, X⁆`.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation (only a synthInstance ceiling for the ℚ-End instance
  diamond inherited from N227, not a proof-search raise).
-/
import Phys.Algebra.TowerGatherSymAntisymDecomp
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-! ## (1) THE TWO PIECES: the trivial line `ℚ·1` and the traceless-symmetric intersection. -/

/-- The trivial rep line inside `End ℚ ImO`: the `ℚ`-span of the identity (the metric `ℚ·id`). -/
def trivialLine : Submodule ℚ (Module.End ℚ ImO) := ℚ ∙ (1 : Module.End ℚ ImO)

/-- The traceless-symmetric `27`: the self-adjoint operators of trace zero. -/
def tracelessSym : Submodule ℚ (Module.End ℚ ImO) :=
  (bornBil).selfAdjointSubmodule ⊓ LinearMap.ker (LinearMap.trace ℚ ImO)

/-! ## (2) THE TRACE OF THE IDENTITY IS 7 (banked `finrank_ImO`). -/

/-- The trace of the identity on `ImO` is `7` (Mathlib `trace_one` + banked `finrank_ImO`, N22). -/
theorem trace_one_eq_seven : LinearMap.trace ℚ ImO 1 = 7 := by
  rw [LinearMap.trace_one, finrank_ImO]; norm_num

/-- The identity endomorphism is nonzero (else its trace `7` would vanish — characteristic 0). -/
theorem one_ne_zero_End : (1 : Module.End ℚ ImO) ≠ 0 := by
  intro h
  have h7 : LinearMap.trace ℚ ImO (1 : Module.End ℚ ImO) = 7 := trace_one_eq_seven
  rw [h, map_zero] at h7
  norm_num at h7

/-- `1 ∈ trivialLine` (the trivial rep is nonzero — W8 non-vacuity). -/
theorem one_mem_trivialLine : (1 : Module.End ℚ ImO) ∈ trivialLine :=
  Submodule.mem_span_singleton_self _

/-- The trivial line is 1-dimensional (`finrank_span_singleton`). -/
theorem finrank_trivialLine : Module.finrank ℚ trivialLine = 1 :=
  finrank_span_singleton one_ne_zero_End

/-! ## (3) ★★★ THE FINER DECOMPOSITION `Sym²7 = trivialLine ⊕ tracelessSym  (= 1 ⊕ 27)`. -/

/-- The trivial line lies in the self-adjoint (symmetric) side (banked `one_mem_selfAdj`, N227). -/
theorem trivialLine_le_selfAdj : trivialLine ≤ (bornBil).selfAdjointSubmodule := by
  rw [trivialLine, Submodule.span_le, Set.singleton_subset_iff]
  exact one_mem_selfAdj

/-- The traceless-symmetric side lies in the self-adjoint side (it is defined as a subset). -/
theorem tracelessSym_le_selfAdj : tracelessSym ≤ (bornBil).selfAdjointSubmodule :=
  inf_le_left

/-- The trivial line and the traceless-symmetric side meet only in `0` (characteristic 0):
    a scalar multiple `c • 1` of trace zero forces `7c = 0`, hence `c = 0`. -/
theorem trivialTracefree_disjoint : trivialLine ⊓ tracelessSym = ⊥ := by
  rw [eq_bot_iff]
  intro φ hφ
  rw [Submodule.mem_inf] at hφ
  obtain ⟨hL, hT⟩ := hφ
  -- φ = c • 1 for some c
  rw [trivialLine, Submodule.mem_span_singleton] at hL
  obtain ⟨c, hc⟩ := hL
  -- φ has trace 0
  have hker : φ ∈ LinearMap.ker (LinearMap.trace ℚ ImO) := hT.2
  rw [LinearMap.mem_ker] at hker
  -- trace φ = c * 7 = 0 ⇒ c = 0
  have htr : LinearMap.trace ℚ ImO φ = c * 7 := by
    rw [← hc, map_smul, trace_one_eq_seven]; simp [smul_eq_mul]
  rw [hker] at htr
  have hc0 : c = 0 := by
    have : c * 7 = 0 := htr.symm
    rcases mul_eq_zero.1 this with h | h
    · exact h
    · norm_num at h
  rw [Submodule.mem_bot, ← hc, hc0, zero_smul]

/-- Every self-adjoint `φ` splits as `(trace φ / 7) • 1 + (φ − (trace φ / 7) • 1)` — trivial-line
    part + traceless-symmetric part. So `trivialLine ⊔ tracelessSym = selfAdjointSubmodule`. -/
theorem trivialTracefree_span :
    trivialLine ⊔ tracelessSym = (bornBil).selfAdjointSubmodule := by
  apply le_antisymm
  · exact sup_le trivialLine_le_selfAdj tracelessSym_le_selfAdj
  · intro φ hφ
    set t : ℚ := LinearMap.trace ℚ ImO φ with ht_def
    set a : Module.End ℚ ImO := (t / 7) • (1 : Module.End ℚ ImO) with ha_def
    set b : Module.End ℚ ImO := φ - a with hb_def
    -- a ∈ trivialLine
    have haL : a ∈ trivialLine := by
      rw [trivialLine]; exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self _)
    -- b ∈ tracelessSym : self-adjoint AND trace zero
    have hbself : b ∈ (bornBil).selfAdjointSubmodule := by
      rw [hb_def, ha_def]
      exact Submodule.sub_mem _ hφ (Submodule.smul_mem _ _ one_mem_selfAdj)
    have hbtrace : LinearMap.trace ℚ ImO b = 0 := by
      rw [hb_def, ha_def, map_sub, map_smul, trace_one_eq_seven, ← ht_def]
      rw [smul_eq_mul]; ring
    have hbT : b ∈ tracelessSym := ⟨hbself, LinearMap.mem_ker.2 hbtrace⟩
    -- φ = a + b
    have hsum : a + b = φ := by rw [hb_def]; abel
    rw [← hsum]
    exact Submodule.add_mem_sup haL hbT

/-- ★★★ The finer decomposition `Sym²7 = trivialLine ⊕ tracelessSym`, packaged as the disjoint
    (`⊓ = ⊥`) + spanning (`⊔ = selfAdj`) statement inside the self-adjoint submodule. -/
theorem trivialTracefree_isCompl_in_selfAdj :
    trivialLine ⊓ tracelessSym = ⊥ ∧
    trivialLine ⊔ tracelessSym = (bornBil).selfAdjointSubmodule :=
  ⟨trivialTracefree_disjoint, trivialTracefree_span⟩

/-! ## (4) THE DIMENSIONS `28 = 1 + 27`. -/

/-- ★★ The traceless-symmetric side is 27-dimensional (`28 − 1`), from
    `finrank_sup_add_finrank_inf_eq` + banked `finrank_selfAdj_eq_28` (N227). `28 = 1 + 27`. -/
theorem finrank_tracelessSym_eq_27 : Module.finrank ℚ tracelessSym = 27 := by
  have key := Submodule.finrank_sup_add_finrank_inf_eq trivialLine tracelessSym
  rw [trivialTracefree_span, trivialTracefree_disjoint, finrank_selfAdj_eq_28,
    finrank_trivialLine, finrank_bot] at key
  omega

/-! ## (5) BOTH PIECES ARE g₂-SUBMODULES under `X ↦ ⁅imRep D, X⁆`. -/

/-- The trivial line is g₂-invariant: `adEnd D` kills the identity (banked `one_adEnd_zero`, N227),
    hence kills its span. -/
theorem trivialLine_adEnd_inv (D : derivationLieQ) (X : Module.End ℚ ImO)
    (hX : X ∈ trivialLine) : adEnd D X ∈ trivialLine := by
  rw [trivialLine, Submodule.mem_span_singleton] at hX
  obtain ⟨c, hc⟩ := hX
  rw [← hc, map_smul, one_adEnd_zero]
  exact Submodule.smul_mem _ _ (Submodule.zero_mem _)

/-- ★ The traceless-symmetric side is g₂-invariant: the self-adjoint side is preserved (banked
    `selfAdj_adEnd_inv`, N227) AND the trace of the commutator `⁅imRep D, X⁆` vanishes (Mathlib
    `trace_lie`), so `ker(trace)` is preserved; the intersection is preserved. -/
theorem tracelessSym_adEnd_inv (D : derivationLieQ) (X : Module.End ℚ ImO)
    (hX : X ∈ tracelessSym) : adEnd D X ∈ tracelessSym := by
  obtain ⟨hself, _⟩ := hX
  refine ⟨selfAdj_adEnd_inv D X hself, LinearMap.mem_ker.2 ?_⟩
  rw [adEnd_apply]
  exact LinearMap.trace_lie _ _

/-! ## CAPSTONE. -/

/-- ★★★ THE FINER SPLIT OF THE SYMMETRIC 28 on the banked tower:
    `Sym²7 = 1 (trivialLine) ⊕ 27 (tracelessSym)`, `28 = 1 + 27`, both g₂-submodules —
    the last irreducible piece of `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`. -/
theorem traceless_sym_27_structure :
    trivialLine ⊓ tracelessSym = ⊥ ∧
    trivialLine ⊔ tracelessSym = (bornBil).selfAdjointSubmodule ∧
    Module.finrank ℚ trivialLine = 1 ∧
    Module.finrank ℚ tracelessSym = 27 ∧
    Module.finrank ℚ (bornBil).selfAdjointSubmodule = 28 ∧
    (∀ (D : derivationLieQ) (X : Module.End ℚ ImO),
      X ∈ trivialLine → adEnd D X ∈ trivialLine) ∧
    (∀ (D : derivationLieQ) (X : Module.End ℚ ImO),
      X ∈ tracelessSym → adEnd D X ∈ tracelessSym) :=
  ⟨trivialTracefree_disjoint, trivialTracefree_span, finrank_trivialLine,
   finrank_tracelessSym_eq_27, finrank_selfAdj_eq_28, trivialLine_adEnd_inv, tracelessSym_adEnd_inv⟩

end

end Phys.Algebra
