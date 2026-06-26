/-
  Phys.Algebra.LorentzContinuumAdjoinI — N81: THE TRUNK-NATIVE ARTIN–SCHREIER DEGREE-2 INPUT
  over the derived ℝ `Cut` — the quadratic extension `Cut[i] = Cut[X]/(X²+1)` is a FIELD in which
  EVERY ELEMENT IS A SQUARE, hence every quadratic over `Cut[i]` has a root (`Cut[i]` is
  degree-2-closed). The structural foundation of the real-closed Artin–Schreier factorization
  (`Cut[i]` algebraically closed — the content Mathlib LACKS). Over the DERIVED ℝ `Cut` and the
  terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the REAL-CLOSED QUADRATIC-IRREDUCIBILITY CLASSIFICATION node (N80).
  N49–N80 banked, over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, isometry monoid `qvIsomMonoidC`, tangent Lie algebra,
      forward soundness `genIsomMonoidC2 ≤ qvIsomMonoidC`, Born positivity, (1,9) split (N49–N56);
    • ★ the POSITIVE-DEFINITE SCALAR square root `cutSqrt` — over `Cut` every NONNEGATIVE element
      IS a square — with `cutSqrt_sq`/`cutSqrt_nonneg`/`cutSqrt_pos`/`cutSqrt_zero` (N57);
    • the Cartan reference form `EvC` (positive-definite), the operator form-adjoint
      `IsEvCAdjoint`/`IsEvCSymm`, operator square roots (N58–N65);
    • the rank-`n` spectral operator `specOpN`, deflation `deflateC`, seed extraction
      `specOpN_eigen`, iterated descent `deflateList`/`specOpN_full_descent` (N67–N74);
    • the ODD-DEGREE ROOT ENGINE `cutCbrt`/`cut_cubic_has_root`, the eigenvector half
      `dim3_has_eigenvector`/`stvc_eigenvector_of_charpoly_root` + `Module.Finite Cut STVC`
      (N75–N76);
    • THE DERIVED ℝ `Cut` IS A REAL CLOSED FIELD — `cut_odd_degree_has_root`, `cut_isRealClosed`,
      `dim_odd_has_eigenvector` (N77);
    • the EVEN-RUNG OBSTRUCTION REMOVER `selfadj_negDisc_quad_isUnit` + the conditional existence
      `selfadj_no_pure_quad_charpoly` — a self-adjoint `g`'s charpoly is NOT a pure product of
      negative-discriminant monic quadratics, so a real eigenvalue exists GIVEN the real-closed
      factorization (N78);
    • the DEFLATION RE-SEEDING INDUCTION LEVER `uPerp`/`uPerp_finrank`/`deflateRestrict`/
      `deflateRestrict_odd_reseed` (N79);
    • ★ THE REAL-CLOSED QUADRATIC-IRREDUCIBILITY CLASSIFICATION `cutQuad`/
      `cut_monic_quad_irreducible_iff_negDisc` — a monic quadratic over `Cut` is irreducible iff
      `b² < 4c` (N80).

  ── THE MEASURE-FIRST RESULT (the W1 / THE-ONE-LAW decision, recorded in the workbench PREREG) ──
  The isolated hard input gating the EVEN-DIM real-eigenvalue seed is the real-closed Artin–Schreier
  FACTORIZATION — equivalently that `Cut[i] = Cut[X]/(X²+1)` is ALGEBRAICALLY CLOSED. MEASUREMENT
  (re-confirmed this node): `IsRealClosed` occurs in EXACTLY ONE file across all of Mathlib — the
  127-line stub `FieldTheory/IsRealClosed/Basic.lean`; there is NO real-closed → R[i] algebraically-
  closed theorem (Artin–Schreier), NO factorization API; `grep Sylow FieldTheory/` returns NOTHING,
  so the full Artin–Schreier Galois/Sylow argument (the Galois group of any finite extension is a
  2-group, killed by the squares + odd-degree-roots) is a MULTI-NODE build, not a single grind.
  Mathlib's OWN `Analysis/Polynomial/Factorization.lean` has the degree-≤2 factorization ONLY over
  the concrete `ℝ` (`-- TODO: generalize to real closed fields`). What IS immediately bankable,
  trunk-native, and the genuine STRUCTURAL FOUNDATION of the factorization, is the degree-2 half of
  Artin–Schreier: the quadratic extension `Cut[i]` and the fact that every element of it is a square.

  ── THE TRUNK REFRAME (THE ONE LAW) ──
  Over `Cut`, every NONNEGATIVE element is a square (N57 `cutSqrt` — `Cut` is real-closed-by-squares,
  the order-completeness of the derived ℝ). For `z = a + b·i ∈ Cut[i]`, the modulus `|z| = √(a²+b²)`
  exists (`a²+b² ≥ 0`), and the classical formula `(√((|z|+a)/2)) + (b/(2·that))·i` is a square root
  of `z` (with a pure-negative-real fallback `i·√(−a)`). Combined with `Cut[i]`'s `CharZero` (so
  `2 ≠ 0`), `exists_quadratic_eq_zero` then gives every quadratic over `Cut[i]` a root: `Cut[i]` is
  degree-2-closed. This is exactly the "no degree-2 extension" half of the Artin–Schreier theorem,
  the structural seam the full algebraic-closure proof closes by the 2-group Sylow reduction.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    factIrredCutQuad01 — `Fact (Irreducible (cutQuad 0 1))` from N80, making `Cut[i]` a field.
    Cuti — the quadratic extension `Cut[X]/(X²+1)`, a FIELD (`AdjoinRoot.instField`).
    cutiI — the adjoined root; cutiOf — the base embedding `Cut → Cut[i]`.
    cutiI_sq — ★ `cutiI ² = −1` (the adjoined root squares to −1).
    cuti_finrank_eq_two — ★ `Module.finrank Cut Cut[i] = 2` (a genuine degree-2 extension).
    cuti_surjective_gauss — every `z : Cut[i]` is `cutiOf a + cutiOf b · cutiI` (Gaussian coords).
    cutiMod / cutiMod_sq / cutiMod_nonneg — the modulus `√(a²+b²)` and its defining square.
    cutiGauss_isSquare — ★ every Gaussian element `cutiOf a + cutiOf b · cutiI` IS A SQUARE.
    cuti_charZero — `Cut[i]` is `CharZero` (transferred from `Cut` via the injective `algebraMap`).
    cuti_isSquare — ★★ EVERY element of `Cut[i]` is a square (surjectivity + Gaussian square root).
    cuti_quadratic_has_root — ★★ every quadratic `a·x² + b·x + c` (`a ≠ 0`) over `Cut[i]` has a
                          root: `Cut[i]` is DEGREE-2-CLOSED (the degree-2 half of Artin–Schreier).
    cutiI_ne_zero — ★ NON-VACUITY (W8): `cutiI ≠ 0` and `cuti_finrank_eq_two ≠ 1`, so the extension
                          is genuinely proper (not the degenerate `Cut[X]/(X−c)`).

  ── THE W1 HEAVY REMAINDER (childed N82, an honest dissolution ticket, NOT closed here) ──
  The full algebraic closure `IsAlgClosed Cut[i]` — the Artin–Schreier Galois/Sylow argument Mathlib
  lacks (the 2-group reduction killing every finite extension), feeding `IsAlgClosed.of_exists_root`
  to FACTOR an arbitrary `Cut[X]` charpoly into linear × neg-disc-quadratic factors (this degree-2
  closure is exactly the inductive seam) — then N80 `cut_monic_quad_irreducible_iff_negDisc` + N78
  `selfadj_no_pure_quad_charpoly` to FORCE the even-dim real eigenvalue; then the full existence
  `∀ g, ∃ c u, g = specOpN c u` (the completed seed + N79's re-seeding lever + N74's iterated descent
  through a `finrank`-decreasing induction); then the GLOBAL polar/KAK assembly + connectedness +
  the GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)` exhaustion. An ALTERNATIVE
  trunk-native attack recorded for the child: the variational/Rayleigh route (the maximizer of the
  Born-Rayleigh form on the sphere is an eigenvector), needing only sphere compactness from `Cut`'s
  `isCompact_Icc` (N33/N34).

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a quadratic extension by `X²+1` is a field
  in which every element is a square is standard for ℝ[i] = ℂ; here it DESCENDS from the trunk's own
  real-closed-by-squares property (`cutSqrt`, N57 — the order-completeness of the derived ℝ `Cut`,
  the completion of the gather of closures), with `AdjoinRoot`, `mk_surjective`,
  `exists_eq_X_add_C_of_natDegree_le_one`, `exists_quadratic_eq_zero`, `charZero_of_injective_
  algebraMap` standard MACHINERY operating on the DERIVED `Cut`. NO posited ℝ/ℂ as content, NO
  Mathlib `Real`/`Complex`, NO posited algebraic closure, NO posited Lorentz group.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / spectral / eigenvalue /
  eigenvector / self-adjoint / characteristic / factorization / real-closed / Artin–Schreier /
  algebraic-closure / seed / even-dim / Spin / SO(9) / isometry": what remains is the theorem that
  over the derived complete ordered field `Cut` (in which every nonnegative element is a square), the
  quadratic extension `Cut[X]/(X²+1)` is a field in which every element is a square and every
  quadratic has a root. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group,
  NO posited algebraic closure, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumFactor
import Phys.Algebra.LorentzContinuumSqrt
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.Algebra.Polynomial.Degree.SmallDegree
import Mathlib.Algebra.QuadraticDiscriminant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open Polynomial

/-! ## The quadratic extension `Cut[i] = Cut[X]/(X²+1)`. -/

/-- `cutQuad 0 1 = X² + 1` is irreducible over `Cut` (N80, negative discriminant `0 < 4`), packaged
    as a `Fact` so `AdjoinRoot.instField` makes `Cut[i]` a field. -/
instance factIrredCutQuad01 : Fact (Irreducible (cutQuad (0:Cut) 1)) :=
  ⟨cut_monic_quad_irreducible_of_negDisc (by norm_num)⟩

/-- ★ `Cut[i] := Cut[X]/(X²+1)` — the quadratic extension of the derived ℝ `Cut`. A FIELD, by
    `AdjoinRoot.instField` riding `factIrredCutQuad01` (N80 irreducibility). -/
abbrev Cuti : Type := AdjoinRoot (cutQuad (0:Cut) 1)

/-- The adjoined root `i ∈ Cut[i]` (`cutiI² = −1`). -/
noncomputable def cutiI : Cuti := AdjoinRoot.root (cutQuad (0:Cut) 1)

/-- The base embedding `Cut → Cut[i]`. -/
noncomputable def cutiOf (a : Cut) : Cuti := AdjoinRoot.of (cutQuad (0:Cut) 1) a

/-- ★ The adjoined root squares to `−1`: `cutiI² = −1`. -/
theorem cutiI_sq : cutiI ^ 2 = -1 := by
  show AdjoinRoot.root (cutQuad (0:Cut) 1) ^ 2 = -1
  have h := AdjoinRoot.eval₂_root (cutQuad (0:Cut) 1)
  unfold cutQuad at h
  simp only [eval₂_add, eval₂_pow, eval₂_X, eval₂_one, map_zero, map_one,
    zero_mul, add_zero] at h
  exact eq_neg_of_add_eq_zero_left h

/-- `cutiI ≠ 0` (else `0 = cutiI² = −1` in the nonzero field `Cut[i]`). -/
theorem cutiI_ne_zero : cutiI ≠ 0 := by
  intro h
  have h0 : (0 : Cuti) = -1 := by rw [← cutiI_sq, h]; ring
  exact one_ne_zero (neg_eq_zero.mp h0.symm)

/-- ★ `Module.finrank Cut Cut[i] = 2` — a genuine degree-2 extension (`powerBasis.finrank` +
    `powerBasis_dim` + N80 `cutQuad_natDegree`). -/
theorem cuti_finrank_eq_two : Module.finrank Cut Cuti = 2 := by
  have hmon : (cutQuad (0:Cut) 1).Monic := cutQuad_monic 0 1
  have hfr := (AdjoinRoot.powerBasis hmon.ne_zero).finrank
  rw [hfr, AdjoinRoot.powerBasis_dim, cutQuad_natDegree]

/-! ## Gaussian coordinates: every element is `a + b·i`. -/

/-- ★ Every `z : Cut[i]` has Gaussian coordinates: `z = cutiOf a + cutiOf b · cutiI` for some
    `a, b : Cut`. (`mk_surjective` reduces to a polynomial `p`, `p %ₘ (X²+1)` has `natDegree ≤ 1`,
    `exists_eq_X_add_C_of_natDegree_le_one` extracts the two coordinates.) -/
theorem cuti_surjective_gauss (z : Cuti) : ∃ a b : Cut, z = cutiOf a + cutiOf b * cutiI := by
  obtain ⟨p, rfl⟩ := AdjoinRoot.mk_surjective z
  set q := cutQuad (0:Cut) 1 with hq
  have hmon : q.Monic := cutQuad_monic 0 1
  have hr : AdjoinRoot.mk q p = AdjoinRoot.mk q (p %ₘ q) := by
    rw [AdjoinRoot.mk_eq_mk, Polynomial.modByMonic_eq_sub_mul_div p q]
    exact ⟨(p /ₘ q), by ring⟩
  have hdeg : (p %ₘ q).natDegree ≤ 1 := by
    have h2 : q.natDegree = 2 := cutQuad_natDegree 0 1
    have := Polynomial.natDegree_modByMonic_lt p hmon (by
      intro hh; rw [hh] at h2; simp at h2)
    omega
  obtain ⟨c1, c0, hc⟩ := Polynomial.exists_eq_X_add_C_of_natDegree_le_one hdeg
  refine ⟨c0, c1, ?_⟩
  rw [hr, hc]
  unfold cutiOf cutiI
  rw [map_add, map_mul, AdjoinRoot.mk_C, AdjoinRoot.mk_C, AdjoinRoot.mk_X]
  ring

/-! ## The square of a Gaussian element, and the modulus. -/

/-- `(cutiOf p + cutiOf q · cutiI)² = cutiOf (p² − q²) + cutiOf (2·p·q) · cutiI`
    (expand using `cutiI² = −1`). -/
theorem cutiGauss_sq (p q : Cut) :
    (cutiOf p + cutiOf q * cutiI)^2 = cutiOf (p^2 - q^2) + cutiOf (2*p*q) * cutiI := by
  simp only [cutiOf, map_sub, map_mul, map_pow, map_ofNat]
  linear_combination (AdjoinRoot.of (cutQuad (0:Cut) 1) q)^2 * cutiI_sq

/-- The modulus `|a + b·i| = √(a² + b²)` over `Cut` (the nonnegative square root of `a²+b² ≥ 0`,
    N57 `cutSqrt`). -/
noncomputable def cutiMod (a b : Cut) : Cut := cutSqrt (a^2 + b^2)

/-- `cutiMod a b · cutiMod a b = a² + b²` (the defining square, `cutSqrt_sq` on `a²+b² ≥ 0`). -/
theorem cutiMod_sq (a b : Cut) : cutiMod a b * cutiMod a b = a^2 + b^2 :=
  cutSqrt_sq (by positivity)

/-- `0 ≤ cutiMod a b`. -/
theorem cutiMod_nonneg (a b : Cut) : 0 ≤ cutiMod a b := cutSqrt_nonneg _

/-- `0 ≤ cutiMod a b + a` (since `(cutiMod a b)² = a² + b² ≥ a²` and `cutiMod a b ≥ 0`). -/
theorem cutiMod_add_re_nonneg (a b : Cut) : 0 ≤ cutiMod a b + a := by
  nlinarith [cutiMod_nonneg a b, cutiMod_sq a b, sq_nonneg b, sq_nonneg (cutiMod a b - a)]

/-! ## The trunk-native Artin–Schreier degree-2 core: every Gaussian element is a square. -/

/-- ★ Every Gaussian element `cutiOf a + cutiOf b · cutiI` IS A SQUARE in `Cut[i]`. THE TRUNK-NATIVE
    HEART: the modulus `m = √(a²+b²)` exists over `Cut` (N57 `cutSqrt`); for the general case
    `m + a > 0` the square root is `p + q·i` with `p = √((m+a)/2) > 0`, `q = b/(2p)` — verified
    `p² − q² = a`, `2pq = b` via `cutSqrt_sq`; the pure-negative-real fallback (`m + a = 0`, forcing
    `b = 0`, `a ≤ 0`) is `i·√(−a)`. -/
theorem cutiGauss_isSquare (a b : Cut) : IsSquare (cutiOf a + cutiOf b * cutiI) := by
  by_cases hp : 0 < cutiMod a b + a
  · set m := cutiMod a b with hm
    have hms : m * m = a^2 + b^2 := cutiMod_sq a b
    have hmnn : 0 ≤ m := cutiMod_nonneg a b
    set p := cutSqrt ((m + a)/2) with hpdef
    have hp2 : 0 < p := cutSqrt_pos (by linarith)
    have hpp : p * p = (m + a)/2 := cutSqrt_sq (by linarith)
    set q := b / (2*p) with hqdef
    have hq2 : q * q = (m - a)/2 := by
      rw [hqdef]; field_simp; nlinarith [hpp, hms, hp2]
    have hpsub : p^2 - q^2 = a := by
      have : p*p - q*q = a := by rw [hpp, hq2]; ring
      nlinarith [this]
    have hpq : 2*p*q = b := by
      rw [hqdef]; field_simp
    refine ⟨cutiOf p + cutiOf q * cutiI, ?_⟩
    rw [← sq, cutiGauss_sq, hpsub, hpq]
  · have hge := cutiMod_add_re_nonneg a b
    have heq : cutiMod a b + a = 0 := le_antisymm (not_lt.mp hp) hge
    have hma : cutiMod a b = -a := by linarith
    have hms : cutiMod a b * cutiMod a b = a^2 + b^2 := cutiMod_sq a b
    have hb0 : b = 0 := by
      rw [hma] at hms
      have hbb : b^2 = 0 := by nlinarith [hms]
      exact pow_eq_zero_iff (by norm_num) |>.mp hbb
    have hale : a ≤ 0 := by nlinarith [cutiMod_nonneg a b, hma]
    refine ⟨cutiOf (cutSqrt (-a)) * cutiI, ?_⟩
    have hsq : cutSqrt (-a) * cutSqrt (-a) = -a := cutSqrt_sq (by linarith)
    have hexp : (cutiOf (cutSqrt (-a)) * cutiI) * (cutiOf (cutSqrt (-a)) * cutiI)
        = cutiOf (cutSqrt (-a) * cutSqrt (-a)) * (cutiI^2) := by
      simp only [cutiOf, map_mul]; ring
    rw [hexp, hsq, cutiI_sq, hb0]
    simp only [cutiOf, map_neg, map_zero, zero_mul, add_zero]
    ring

/-! ## Every element is a square; `Cut[i]` is degree-2-closed. -/

/-- ★★ EVERY element of `Cut[i]` is a square (`cuti_surjective_gauss` to Gaussian coordinates, then
    `cutiGauss_isSquare`). The degree-2 half of Artin–Schreier — over the derived ℝ `Cut` the
    quadratic extension by `X²+1` admits no further square-extraction obstruction. -/
theorem cuti_isSquare (z : Cuti) : IsSquare z := by
  obtain ⟨a, b, rfl⟩ := cuti_surjective_gauss z
  exact cutiGauss_isSquare a b

/-- `Cut[i]` has characteristic zero (transferred from `Cut`'s `CharZero` along the injective
    `algebraMap Cut Cut[i]`), so `2 ≠ 0` — the precondition for the quadratic root formula. -/
instance cuti_charZero : CharZero Cuti :=
  charZero_of_injective_algebraMap (RingHom.injective (algebraMap Cut Cuti))

/-- ★★ `Cut[i]` is DEGREE-2-CLOSED: every quadratic `a·x² + b·x + c` with `a ≠ 0` has a root in
    `Cut[i]`. The discriminant `discrim a b c` is a square (`cuti_isSquare`), and `2 ≠ 0`
    (`cuti_charZero`), so `exists_quadratic_eq_zero` gives a root. This is exactly the
    "no degree-2 extension" half of the Artin–Schreier theorem, the inductive seam of the full
    algebraic-closure proof (childed N82). -/
theorem cuti_quadratic_has_root (a b c : Cuti) (ha : a ≠ 0) :
    ∃ x, a * (x * x) + b * x + c = 0 := by
  obtain ⟨s, hs⟩ := cuti_isSquare (discrim a b c)
  exact exists_quadratic_eq_zero ha ⟨s, hs⟩

end

end Phys.Algebra
