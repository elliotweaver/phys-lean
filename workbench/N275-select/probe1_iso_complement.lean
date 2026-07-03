import Phys.Algebra.OctonionMatterJointNeutralCore
import Mathlib.Tactic

/-!
PROBE 1 for N275 SELECT: is the ISOSPIN-CHARGED COMPLEMENT of the carrier tractable?
Target node candidate: the isospin twin of N266's colour Vsub — the gForm-orthogonal complement
of the isospin-neutral core span{1,κO1} (N271), 6-dim, isospin-invariant, distinct from the colour
complement (the joint misalignment lifted to the charged sectors).

We test:
 (a) gForm as a usable object + nondegeneracy handle,
 (b) the isospin skewness gFormQ_skew on carrier vectors,
 (c) whether Mathlib's bilinear-form orthogonal-complement finrank machinery attaches to gForm,
 (d) fallback: the JOINT-misalignment facts (u1 iso-charged & colour-neutral; κO1 colour-charged &
     iso-neutral) that are cheap and clearly new.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

-- (b) sanity: isospin generators are IsDerivQ, hence gForm-skew.
example (x y : O ℚ) :
    gForm ((DI : Module.End ℚ (O ℚ)) x) y + gForm x ((DI : Module.End ℚ (O ℚ)) y) = 0 := by
  exact gFormQ_skew _ (innerDerivQ_isDerivQ hI hI_imag) x y

-- (a) gForm is a ℚ-bilinear symmetric form. Test a BilinForm packaging.
-- Does a banked gBilin exist?
-- (probe: try referencing possible names)

-- (d) cheap joint-misalignment: κO1 is colour-charged (NOT in span{1,u1}) -- banked as kap_not_mem_span_one_u1
example : kappaO 1 ∉ Submodule.span ℚ {(1 : O ℚ), u1} := kap_not_mem_span_one_u1

-- u1 is isospin-charged (NOT in span{1,κO1}) -- banked as u1_not_mem_span_one_kap
example : u1 ∉ Submodule.span ℚ {(1 : O ℚ), kappaO 1} := u1_not_mem_span_one_kap

-- the two neutral cores' SUM (join) — finrank should be 3 (=2+2-1 by meet=span{1})
-- test: is the join easy to name?
example : Module.finrank ℚ (matterColourNeutral ⊔ matterIsospinNeutral : Submodule ℚ (O ℚ)) = 3 := by
  sorry

end Phys.Algebra.HJ
