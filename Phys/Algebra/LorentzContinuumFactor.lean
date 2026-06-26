/-
  Phys.Algebra.LorentzContinuumFactor — N80: THE REAL-CLOSED QUADRATIC-IRREDUCIBILITY
  CLASSIFICATION over the derived ℝ `Cut` — a monic quadratic `X² + C b·X + C c ∈ Cut[X]` is
  IRREDUCIBLE iff it has NEGATIVE DISCRIMINANT `b² < 4c`. The trunk-native BRIDGE between Mathlib's
  "irreducible quadratic factor" language and N78 `selfadj_no_pure_quad_charpoly`'s neg-disc `qs`
  form. Over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the DEFLATION RE-SEEDING INDUCTION LEVER node (N79). N49–N79 banked,
  over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • ★ the POSITIVE-DEFINITE SCALAR square root `cutSqrt` with `cutSqrt_sq`/`cutSqrt_nonneg`/
      `cutSqrt_pos` (N57) — i.e. over `Cut` every NONNEGATIVE element IS a square;
    • the INFINITESIMAL CARTAN reference form `EvC` — POSITIVE-DEFINITE (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint`/`IsEvCSymm` + the operator square roots (N59–N65);
    • the rank-`n` spectral operator `specOpN`, the DEFLATION engine `deflateC` (N67–N70), the seed
      eigenpair extraction `specOpN_eigen` (N71), the iterated descent `deflateList`/
      `specOpN_full_descent` (N74);
    • the ODD-DEGREE ROOT ENGINE `cutCbrt`/`cut_cubic_has_root` (N75), the EIGENVECTOR half
      `dim3_has_eigenvector`/`stvc_eigenvector_of_charpoly_root` + `Module.Finite Cut STVC` (N76);
    • THE DERIVED ℝ `Cut` IS A REAL CLOSED FIELD — `cut_odd_degree_has_root`, `cut_isRealClosed`,
      `dim_odd_has_eigenvector` (N77);
    • ★ THE EVEN-RUNG OBSTRUCTION REMOVER `selfadj_negDisc_quad_injective`/`_isUnit` + the conditional
      existence `selfadj_no_pure_quad_charpoly` — a self-adjoint `g`'s characteristic polynomial is NOT
      a pure product of NEGATIVE-DISCRIMINANT monic quadratics, so a real eigenvalue exists GIVEN the
      real-closed factorization (N78);
    • the DEFLATION RE-SEEDING INDUCTION LEVER `uPerp`/`uPerp_finrank`/`deflateRestrict`/
      `deflateRestrict_odd_reseed` — the EvC-orthogonal-complement codim-one finrank bookkeeping the
      full-existence spectral induction runs on (N79).

  ── THE MEASURE-FIRST RESULT (the W1 / THE-ONE-LAW decision, recorded in the workbench PREREG) ──
  N78 banked `selfadj_no_pure_quad_charpoly`: a self-adjoint `g`'s charpoly CANNOT be a pure product
  of negative-discriminant monic quadratics — so GIVEN a real-closed FACTORIZATION of the charpoly
  into linear × neg-disc-quadratic factors, a real eigenvalue exists at EVERY dimension. The ONLY
  missing piece for the even-dim seed is that factorization itself. MEASUREMENT: `IsRealClosed`
  occurs in EXACTLY ONE file across all of Mathlib — the 127-line stub `FieldTheory/IsRealClosed/
  Basic.lean` (class + `of_linearOrderedField` + square helpers ONLY). There is NO real-closed → R[i]
  algebraically-closed theorem (Artin–Schreier), NO polynomial factorization over abstract real-closed
  fields. Mathlib's OWN `Analysis/Polynomial/Factorization.lean` has the degree-≤2 factorization ONLY
  over the concrete `ℝ`, carrying the explicit comment `-- TODO: generalize to real closed fields when
  they are available.` ⟹ the full Artin–Schreier factorization is GENUINE W1 BUILD-don't-posit content
  (childed N81). What IS immediately bankable, trunk-native, and the genuine BRIDGE feeding N78, is the
  unconditional quadratic-irreducibility CLASSIFICATION over `Cut`.

  ── THE TRUNK REFRAME (THE ONE LAW) ──
  Over `Cut`, every NONNEGATIVE element is a square (N57 `cutSqrt` — `Cut` is real-closed-by-squares).
  A monic quadratic `X² + C b·X + C c` over `Cut` has a root IFF its discriminant `b² − 4c` is a
  square IFF `0 ≤ b² − 4c` (the `cutSqrt` direction + `discrim_eq_sq_of_quadratic_eq_zero` for the
  square ⟹ nonneg direction). A monic quadratic over a domain is IRREDUCIBLE iff it has no root
  (`Monic.irreducible_iff_roots_eq_zero_of_degree_le_three`, Mathlib machinery on `Cut[X]`). Combining:
  `cutQuad b c` is IRREDUCIBLE iff `b² < 4c` (negative discriminant). This is exactly the form
  N78 `selfadj_no_pure_quad_charpoly` consumes as its `qs : List (Cut × Cut)` neg-disc hypothesis.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    cutQuad — the monic quadratic `X² + C b·X + C c ∈ Cut[X]`.
    cutQuad_isMonicOfDegree/cutQuad_monic/cutQuad_natDegree — it is monic of natDegree 2.
    cutQuad_eval — `(cutQuad b c).eval x = x*x + b*x + c`.
    cutQuad_hasRoot_iff_nonnegDisc — ★ `cutQuad b c` has a root iff `0 ≤ b² − 4c` (square discriminant
                          via `cutSqrt`; the square ⟹ nonneg converse via `discrim_eq_sq_of_quadratic_eq_zero`).
                          Over `Cut` every nonnegative element is a square (N57 `cutSqrt` / N77
                          `cut_isSquare_of_nonneg`) — the trunk input distinguishing `Cut` from a general field.
    cut_monic_quad_irreducible_iff_negDisc — ★★ THE CLASSIFICATION: `Irreducible (cutQuad b c) ↔ b² < 4c`.
    cut_monic_quad_irreducible_of_negDisc / cut_negDisc_of_irreducible — the two directions, named.
    cutQuad_negDisc_irreducible_ne_root — ★ NON-VACUITY (W8): a CONCRETE neg-disc quadratic
                          (`X² + 1`, `b=0, c=1`, `0 < 4`) is irreducible — has NO root in `Cut`.

  ── THE W1 HEAVY REMAINDER (childed N81, an honest dissolution ticket, NOT closed here) ──
  The real-closed FACTORIZATION of the characteristic polynomial — equivalently the Artin–Schreier
  theorem that `Cut[i] = Cut[X]/(X²+1)` is ALGEBRAICALLY CLOSED, the content Mathlib lacks — feeding
  this CLASSIFICATION + N78 `selfadj_no_pure_quad_charpoly` to FORCE the even-dim real eigenvalue;
  then the full existence `∀ g, ∃ c u, g = specOpN c u` (assembled from the completed seed + N79's
  re-seeding lever + N74's iterated descent through a `finrank`-decreasing induction); then the GLOBAL
  polar/KAK assembly + connectedness + the GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)`
  exhaustion. An ALTERNATIVE trunk-native attack recorded for the child: the variational/Rayleigh route
  (the maximizer of the Born-Rayleigh form on the sphere is an eigenvector), needing only sphere
  compactness from `Cut`'s `isCompact_Icc` (N33/N34) — analytically heavier but algebra-clean.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a real quadratic is irreducible iff its
  discriminant is negative is standard field theory; here it DESCENDS from the trunk's own
  real-closed-by-squares property (`cutSqrt`, N57 — itself the order-completeness of the derived ℝ
  `Cut`, the completion of the gather of closures), with `Monic.irreducible_iff_roots_eq_zero_of_
  degree_le_three`, `discrim_eq_sq_of_quadratic_eq_zero`, `exists_quadratic_eq_zero`,
  `isMonicOfDegree_add_add_two` standard MACHINERY operating on the DERIVED `Cut[X]`. NO posited ℝ/ℂ
  as content, NO Mathlib `Real`, NO posited algebraic closure, NO posited Lorentz group.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / spectral / eigenvalue / eigenvector
  / self-adjoint / characteristic / factorization / discriminant / real-closed / Artin–Schreier / seed
  / even-dim / algebraic-closure / Spin / SO(9) / isometry": what remains is the theorem that over the
  derived complete ordered field `Cut` (in which every nonnegative element is a square), a monic
  quadratic `X² + C b·X + C c ∈ Cut[X]` is irreducible iff `b² < 4c`. No theorem STATEMENT needs a
  physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group,
  NO posited algebraic closure, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumReseed
import Mathlib.Algebra.Polynomial.SpecificDegree
import Mathlib.Algebra.Polynomial.Degree.IsMonicOfDegree
import Mathlib.Algebra.QuadraticDiscriminant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open Polynomial

/-! ## The monic quadratic over `Cut` and its basic invariants. -/

/-- The monic quadratic `X² + C b·X + C c ∈ Cut[X]`. -/
def cutQuad (b c : Cut) : Cut[X] := X^2 + C b * X + C c

/-- `cutQuad b c` is monic of `natDegree` 2 (`isMonicOfDegree_add_add_two`). -/
theorem cutQuad_isMonicOfDegree (b c : Cut) : IsMonicOfDegree (cutQuad b c) 2 :=
  isMonicOfDegree_add_add_two b c

theorem cutQuad_monic (b c : Cut) : (cutQuad b c).Monic :=
  (cutQuad_isMonicOfDegree b c).monic

theorem cutQuad_natDegree (b c : Cut) : (cutQuad b c).natDegree = 2 :=
  (cutQuad_isMonicOfDegree b c).natDegree_eq

/-- Evaluation: `(cutQuad b c).eval x = x*x + b*x + c`. -/
theorem cutQuad_eval (b c x : Cut) : (cutQuad b c).eval x = x*x + b*x + c := by
  unfold cutQuad
  simp [eval_add, eval_mul, eval_C, eval_X, sq]

/-! ## Roots of the monic quadratic ⟺ nonnegative discriminant.
    (Over `Cut` every nonnegative element is a square — the banked N57 `cutSqrt` / N77
    `cut_isSquare_of_nonneg` — the trunk property driving the classification.) -/

/-- ★ `cutQuad b c` has a root iff `0 ≤ b² − 4c` (nonnegative discriminant). Forward: a root makes
    the discriminant `b² − 4c = (2x+b)²` a square, hence nonnegative (`discrim_eq_sq_of_quadratic_eq_zero`).
    Backward: `0 ≤ b² − 4c` is a square over `Cut` (`cutSqrt`), so `exists_quadratic_eq_zero` gives a root. -/
theorem cutQuad_hasRoot_iff_nonnegDisc (b c : Cut) :
    (∃ x, (cutQuad b c).IsRoot x) ↔ 0 ≤ b^2 - 4*c := by
  constructor
  · rintro ⟨x, hx⟩
    rw [IsRoot, cutQuad_eval] at hx
    have hq : (1:Cut) * (x * x) + b * x + c = 0 := by linear_combination hx
    have hsq := discrim_eq_sq_of_quadratic_eq_zero (a := (1:Cut)) (b := b) (c := c) (x := x) hq
    rw [discrim] at hsq
    nlinarith [hsq, sq_nonneg (2*(1:Cut)*x+b)]
  · intro hdisc
    have hs : ∃ s : Cut, discrim 1 b c = s * s := by
      refine ⟨cutSqrt (b^2 - 4*c), ?_⟩
      rw [discrim, cutSqrt_sq hdisc]; ring
    obtain ⟨x, hx⟩ := exists_quadratic_eq_zero (a := (1:Cut)) (b := b) (c := c) one_ne_zero hs
    exact ⟨x, by rw [IsRoot, cutQuad_eval]; linarith [hx]⟩

/-! ## THE CLASSIFICATION — irreducible ⟺ negative discriminant. -/

/-- ★★ THE REAL-CLOSED QUADRATIC-IRREDUCIBILITY CLASSIFICATION: a monic quadratic over the derived
    ℝ `Cut` is IRREDUCIBLE iff it has NEGATIVE DISCRIMINANT `b² < 4c`. A monic quadratic over a domain
    is irreducible iff it has no root (`Monic.irreducible_iff_roots_eq_zero_of_degree_le_three`); over
    `Cut` (real-closed-by-squares) it has a root iff `0 ≤ b² − 4c` (`cutQuad_hasRoot_iff_nonnegDisc`),
    so irreducible iff `b² < 4c`. The trunk-native BRIDGE feeding N78 `selfadj_no_pure_quad_charpoly`. -/
theorem cut_monic_quad_irreducible_iff_negDisc (b c : Cut) :
    Irreducible (cutQuad b c) ↔ b^2 < 4*c := by
  have hnd : (cutQuad b c).natDegree = 2 := cutQuad_natDegree b c
  have h2 : 2 ≤ (cutQuad b c).natDegree := by omega
  have h3 : (cutQuad b c).natDegree ≤ 3 := by omega
  rw [(cutQuad_monic b c).irreducible_iff_roots_eq_zero_of_degree_le_three h2 h3,
      Multiset.eq_zero_iff_forall_notMem]
  constructor
  · intro h
    by_contra hge
    have hge' : 4*c ≤ b^2 := not_lt.mp hge
    have hnn : 0 ≤ b^2 - 4*c := by linarith
    obtain ⟨x, hx⟩ := (cutQuad_hasRoot_iff_nonnegDisc b c).mpr hnn
    exact h x (by rw [mem_roots (cutQuad_monic b c).ne_zero]; exact hx)
  · intro hlt x hx
    rw [mem_roots (cutQuad_monic b c).ne_zero] at hx
    have : 0 ≤ b^2 - 4*c := (cutQuad_hasRoot_iff_nonnegDisc b c).mp ⟨x, hx⟩
    linarith

/-- The forward direction, named: negative discriminant ⟹ irreducible. -/
theorem cut_monic_quad_irreducible_of_negDisc {b c : Cut} (h : b^2 < 4*c) :
    Irreducible (cutQuad b c) :=
  (cut_monic_quad_irreducible_iff_negDisc b c).mpr h

/-- The backward direction, named: irreducible ⟹ negative discriminant. -/
theorem cut_negDisc_of_irreducible {b c : Cut} (h : Irreducible (cutQuad b c)) :
    b^2 < 4*c :=
  (cut_monic_quad_irreducible_iff_negDisc b c).mp h

/-! ## NON-VACUITY (W8) — a concrete negative-discriminant quadratic is irreducible. -/

/-- ★ NON-VACUITY (W8): the concrete quadratic `X² + 1` (`b = 0, c = 1`, discriminant `0 − 4 = −4 < 0`)
    is irreducible over `Cut` and has NO root — the classification bites a genuine nonzero case. Over a
    field that is NOT real-closed-by-squares this could fail; here it holds because `−1` is not a square
    in the ordered `Cut`. -/
theorem cutQuad_negDisc_irreducible_ne_root :
    Irreducible (cutQuad (0:Cut) 1) ∧ ¬ ∃ x, (cutQuad (0:Cut) 1).IsRoot x := by
  refine ⟨cut_monic_quad_irreducible_of_negDisc (by norm_num), ?_⟩
  rw [cutQuad_hasRoot_iff_nonnegDisc]
  norm_num

end

end Phys.Algebra
