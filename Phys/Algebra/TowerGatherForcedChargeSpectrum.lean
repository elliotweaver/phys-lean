/-
  Phys.Algebra.TowerGatherForcedChargeSpectrum — N243.
  ===========================================================================
  THE COMPLETE CHARGE SPECTRUM of the fundamental 7, DERIVED from the gather-obstruction charge
  operator. Owner-authorized gather-side hypercharge front, under the TEMPORARY PRIORITY LOCK
  (docs/ROADMAP.md, owner authorization 2026-07-01). Gather-native, NOT the parked invariant-tower
  ascent.

  THE DELIVERABLE. N240 banked the forced charge operator `chargeOp = crossOp u1 : Module.End ℚ ImO`
  with `chargeOp²(y) = ⟨u1,y⟩•u1 − y`, and that it ANNIHILATES the branching singlet `u1`
  (`chargeOp_kills_singlet` — the singlet sits at charge eigenvalue `0`). N242 banked that the
  restriction to the branching complement `V = 3 ⊕ 3̄` is a complex structure whose minimal
  polynomial is exactly `X² + 1` (spectrum `±i`, the derived `±J`). THIS node ASSEMBLES the two into
  the single explicit charge-eigenvalue decomposition of the ENTIRE fundamental 7:

    ★★★ `chargeOp_minpoly : minpoly ℚ chargeOp = X³ + X = X·(X² + 1)`.

  The minimal polynomial of the gather charge operator on the whole `ImO` is `X³ + X`, whose three
  roots `{0, +i, −i}` are EXACTLY the charge eigenvalues of the branching `7 = 1 ⊕ 3 ⊕ 3̄`: the
  singlet at eigenvalue `0` (`chargeOp_kills_singlet`, N240), the two triplets at the opposite
  imaginary pair `±i` (the `X² + 1` factor, N242). The three roots are realized in the DERIVED
  complex unit of the cascade's own `Dbl ℚ`: `0`, `+J`, `−J` (`Dbl_zero_cube_root` /
  `Dbl_J_cube_root` / `Dbl_negJ_cube_root`), mutually distinct (`Dbl_zero_ne_J` /
  `Dbl_zero_ne_negJ` / `Dbl_J_ne_negJ`, N242). The ONLY rational eigenvalue of `chargeOp` on the
  whole `ImO` is `0` (`chargeOp_rational_eigenvalue_eq_zero`) — the singlet's charge; the triplet
  charges are the non-real imaginary pair.

  THE SPINE (all at the subtype-native `octCross`/coe level on `ImO` / `O ℚ`; NO coordinate bash,
  NO new subtype-of-subtype restriction layer — the trunk dissolves the cube):
    chargeOp_cube             — ★★ `chargeOp³ = −chargeOp` on `ImO`. From N240 `chargeOp_sq_coe`
                                (`chargeOp²(y) coe = ⟨u1,y⟩•u1 − y`) applied at `chargeOp y`, then
                                `gForm u1 (octCross u1 y) = 0` (N206 `gForm_x_octCross`: `u1` is
                                Born-orthogonal to its own cross products) collapses the correction
                                term, leaving `−octCross u1 y = (−chargeOp) y`. THE ONE LAW: the
                                left-alternative contraction dissolves it, no `ring` over `O ℚ`.
    chargeOp_aeval            — `aeval chargeOp (X³+X) = 0` (from `chargeOp³ = −chargeOp`).
    chargeOp_integral         — `IsIntegral ℚ chargeOp`, monic witness `X³+X`.
    minpoly_dvd_cube          — `minpoly ℚ chargeOp ∣ X³+X`.
    chargeOp_hasEigenvalue_zero — ★ `0` is a GENUINE eigenvalue: `chargeOp` kills the NONZERO
                                singlet `⟨u1⟩` (`chargeOp_kills_singlet` N240 + `u1_ne_zero` N42c).
    X_dvd_minpoly             — hence `X ∣ minpoly ℚ chargeOp` (`0` is a root of the minpoly, via
                                `Module.End.isRoot_of_hasEigenvalue` + `dvd_iff_isRoot`).
    chargeOp_minpoly          — ★★★ THE HEADLINE: `minpoly ℚ chargeOp = X³ + X`. Since `X ∣ minpoly`
                                and `minpoly ∣ X·(X²+1)` (monic), write `minpoly = X·q` with `q`
                                monic and `q ∣ X²+1`; `X²+1` IRREDUCIBLE (N242
                                `charge_poly_irreducible`) forces `q ∈ {1, X²+1}`; `q = 1` gives
                                `minpoly = X`, i.e. `chargeOp = 0`, contradicting `chargeOp_ne_zero`
                                (N240); so `q = X²+1` (both monic) and `minpoly = X·(X²+1) = X³+X`.
    chargeOp_sq_ne_neg_id     — ★★ W8 TEETH: `chargeOp² ≠ −id` on the WHOLE `ImO` (it kills the
                                singlet — `chargeOp²(⟨u1⟩) = 0 ≠ −⟨u1⟩`). This is what DISTINGUISHES
                                the whole-7 spectrum (`X³+X`, WITH the `0` root) from the
                                V-restriction (`X²+1`, N242): the singlet's charge-`0` direction is
                                genuinely present and is NOT part of the `±i` pair.
    Dbl_zero_cube_root / Dbl_J_cube_root / Dbl_negJ_cube_root — the three roots `{0, +J, −J}` of
                                `X³+X` in the derived `Dbl ℚ` (`x³+x = 0` for each).
    Dbl_zero_ne_J / Dbl_zero_ne_negJ — ★ the `0` root is genuinely distinct from `±J` (their
                                imaginary parts are `0` vs `±1`); with N242 `Dbl_J_ne_negJ` the
                                three charge eigenvalues are MUTUALLY DISTINCT.
    chargeOp_rational_eigenvalue_eq_zero — ★ the ONLY rational eigenvalue of `chargeOp` on the whole
                                `ImO` is `0` (the singlet's charge; the triplet charges are the
                                non-real `±i`). Via `hasEigenvalue_iff_isRoot` + the headline +
                                `cube_poly_root_eq_zero` (`μ³+μ = μ(μ²+1) = 0` with `μ²+1 > 0`).
    forced_charge_spectrum_structure — the capstone.

  THE MOAT (docs/STANDARD §0). The field POSITS the charge assignment of the whole fundamental
  multiplet (singlet neutral, triplet/antitriplet opposite). Here the complete spectrum is FORCED:
  the minimal polynomial of the gather-obstruction charge operator on the entire `ImO` is `X³ + X`,
  its three roots `{0, ±i}` the singlet's `0` and the derived `±J`. ONE cause — `u1`, the fold's
  `√−1`, the gather-tear input AND the left-multiplication complex structure — MANY faces: the
  charge-`0` singlet direction (N240), the `±i` triplet pair (N242), and now their assembly into the
  single degree-3 minimal polynomial `X³+X` of the whole fundamental representation.

  ⚠ THE COMPLEX FIELD IS METALANGUAGE, NOT CONTENT (docs/ROADMAP.md N242 warning light, still lit).
  `chargeOp` and `ImO` stay DERIVED REAL objects; `ℚ[X]` is polynomial machinery on that derived
  operator; `±i` appears ONLY as the two non-`0` roots of `X³+X`, concretely the derived `±J`. NOT
  built OVER `ℚ[i]` as ground — `Algebra ℚ (Dbl ℚ)` is not banked and no `TensorProduct` is used.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / hypercharge / eigenvalue-as-charge /
  particle / antiparticle / singlet / triplet / i": over the derived field ℚ and `O ℚ = CD (H ℚ)`,
  the endomorphism `crossOp u1` of `ImO` satisfies `crossOp u1 ³ = −crossOp u1`, its minimal
  polynomial is `X³ + X = X·(X²+1)` (the `X²+1` factor irreducible, `q²+1 > 0`), its square is NOT
  `−id` (it kills `u1`), the three roots of `X³+X` are `0` and `±J` for the derived `Dbl ℚ` unit
  `J` (`J²=−1`), mutually distinct, and its only rational eigenvalue is `0`. No theorem STATEMENT
  needs a physics word.

  UNBROKEN. Imports only banked N242 (`chargeOp_sq_coe`/`chargeOp_kills_singlet`/`chargeOp_ne_zero`
  via N240; `charge_poly_irreducible`/`chargeOpV_monic_wit`/`Dbl_J_ne_negJ`), N206
  (`gForm_x_octCross`), N223 (`crossOp`/`crossOp_coe`), N42c (`u1`/`u1_ne_zero`/`u1_mem_ImO`), N2
  rung 1 (`Dbl`/`Dbl.J`/`Dbl.J_mul_J`), and standard Mathlib polynomial/minpoly/eigenvalue machinery
  (`minpoly.dvd`, `minpoly.monic`, `dvd_iff_isRoot`, `Module.End.hasEigenvalue_iff_isRoot`,
  `Irreducible.isUnit_or_isUnit`, `eq_of_monic_of_associated`). Ground = derived ℚ; ℚ[X] and Dbl ℚ
  are metalanguage naming the spectrum of a derived real operator; nothing posited; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherForcedChargeEigenvalues

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The gather charge operator on the whole 7 annihilates `X³ + X`. -/

/-- The branching singlet as an element of the fundamental 7 `ImO`. -/
abbrev sgl : ImO := ⟨u1, u1_mem_ImO⟩

/-- The singlet generator is nonzero as an element of `ImO` (banked `u1_ne_zero`, N42c). -/
theorem sgl_ne_zero : sgl ≠ 0 := fun h => u1_ne_zero (congrArg Subtype.val h)

/-- On `ImO`, `chargeOp` acts as `octCross u1` at the `O ℚ` level (`chargeOp := crossOp u1`,
    defeq to the banked `crossOp_coe`). -/
theorem chargeOp_coe (y : ImO) : ((chargeOp y : ImO) : O ℚ) = octCross u1 (y : O ℚ) :=
  crossOp_coe u1 y

/-- ★★ THE CUBE RELATION: `chargeOp³ = −chargeOp` on the whole fundamental 7. From N240
    `chargeOp²(y) coe = ⟨u1,y⟩•u1 − y` applied at `chargeOp y`, the correction coefficient
    `gForm u1 (octCross u1 y)` VANISHES (N206 `gForm_x_octCross`: `u1` is Born-orthogonal to its
    own cross products), leaving `chargeOp³(y) coe = −octCross u1 y = ((−chargeOp) y) coe`. NO
    coordinate bash — the left-alternative contraction dissolves it (THE ONE LAW). -/
theorem chargeOp_cube : chargeOp.comp (chargeOp.comp chargeOp) = -chargeOp := by
  refine LinearMap.ext (fun y => ?_)
  apply Subtype.ext
  show ((chargeOp (chargeOp (chargeOp y)) : ImO) : O ℚ) = (((-chargeOp) y : ImO) : O ℚ)
  rw [chargeOp_sq_coe (chargeOp y)]
  show gForm u1 ((chargeOp y : ImO) : O ℚ) • u1 - ((chargeOp y : ImO) : O ℚ)
      = (((-chargeOp) y : ImO) : O ℚ)
  rw [chargeOp_coe y, gForm_x_octCross u1_mem_ImO y.2, zero_smul, zero_sub,
      LinearMap.neg_apply, Submodule.coe_neg, chargeOp_coe y]

/-- `chargeOp` annihilates `X³ + X`: `aeval chargeOp (X³+X) = 0` (from `chargeOp³ = −chargeOp`). -/
theorem chargeOp_aeval : (aeval chargeOp) (X ^ 3 + X : ℚ[X]) = 0 := by
  have h : chargeOp ^ 3 = -chargeOp := by
    rw [pow_succ, pow_succ, pow_one]
    show chargeOp * (chargeOp * chargeOp) = -chargeOp
    rw [show chargeOp * (chargeOp * chargeOp) = chargeOp.comp (chargeOp.comp chargeOp) from rfl,
        chargeOp_cube]
  rw [map_add, map_pow, aeval_X, h]; abel

/-- `X³ + X` is monic. -/
theorem cube_poly_monic : (X ^ 3 + X : ℚ[X]).Monic := by monicity!

/-- `chargeOp` is integral over ℚ, witnessed by the monic annihilator `X³ + X`. -/
theorem chargeOp_integral : IsIntegral ℚ chargeOp :=
  ⟨X ^ 3 + X, cube_poly_monic, chargeOp_aeval⟩

/-- `minpoly ℚ chargeOp ∣ X³ + X`. -/
theorem minpoly_dvd_cube : minpoly ℚ chargeOp ∣ (X ^ 3 + X : ℚ[X]) :=
  minpoly.dvd ℚ chargeOp chargeOp_aeval

/-! ## The singlet gives a genuine `0`-eigenvalue — hence `X ∣ minpoly`. -/

/-- ★ `0` IS A GENUINE EIGENVALUE of the charge operator on the whole 7: `chargeOp` annihilates the
    NONZERO branching singlet `⟨u1⟩` (`chargeOp_kills_singlet` N240, `sgl_ne_zero`). The singlet is
    the charge-`0` direction — the `X` factor of the spectrum. -/
theorem chargeOp_hasEigenvalue_zero : Module.End.HasEigenvalue chargeOp (0 : ℚ) := by
  apply Module.End.hasEigenvalue_of_hasEigenvector (x := sgl)
  rw [Module.End.hasEigenvector_iff]
  exact ⟨by rw [Module.End.mem_eigenspace_iff, chargeOp_kills_singlet, zero_smul], sgl_ne_zero⟩

/-- `X ∣ minpoly ℚ chargeOp`: `0` is a root of the minimal polynomial (an eigenvalue is a root,
    `Module.End.isRoot_of_hasEigenvalue`), so `X − C 0 = X` divides it (`dvd_iff_isRoot`). -/
theorem X_dvd_minpoly : (X : ℚ[X]) ∣ minpoly ℚ chargeOp := by
  have hroot : (minpoly ℚ chargeOp).IsRoot 0 :=
    Module.End.isRoot_of_hasEigenvalue chargeOp_hasEigenvalue_zero
  simpa using (dvd_iff_isRoot (a := (0 : ℚ)) (p := minpoly ℚ chargeOp)).mpr hroot

/-! ## THE HEADLINE — the minimal polynomial on the whole 7 is `X³ + X`. -/

/-- The factorization `X³ + X = X·(X² + 1)`. -/
theorem cube_factor : (X ^ 3 + X : ℚ[X]) = X * (X ^ 2 + 1) := by ring

/-- ★★★ THE HEADLINE: the MINIMAL POLYNOMIAL of the gather charge operator on the ENTIRE fundamental
    7 is exactly `X³ + X = X·(X² + 1)`. `X ∣ minpoly` (the `0`-eigenvalue singlet) and
    `minpoly ∣ X·(X²+1)` (monic), so `minpoly = X·q` with `q` monic and `q ∣ X²+1`; since `X²+1` is
    IRREDUCIBLE (N242 `charge_poly_irreducible`), `q` is a unit (`q = 1`, forcing `minpoly = X` and
    `chargeOp = 0`, contradicting `chargeOp_ne_zero`) or associated to `X²+1` (`q = X²+1`, both
    monic). Hence `minpoly = X·(X²+1) = X³ + X`. The three roots `{0, ±i}` are the complete charge
    spectrum of the branching `7 = 1 ⊕ 3 ⊕ 3̄`. -/
theorem chargeOp_minpoly : minpoly ℚ chargeOp = (X ^ 3 + X : ℚ[X]) := by
  have hp_monic : (minpoly ℚ chargeOp).Monic := minpoly.monic chargeOp_integral
  have hp_dvd : minpoly ℚ chargeOp ∣ X * (X ^ 2 + 1) := by
    rw [← cube_factor]; exact minpoly_dvd_cube
  obtain ⟨q, hpq⟩ := X_dvd_minpoly
  have hq_monic : q.Monic := monic_X.of_mul_monic_left (hpq ▸ hp_monic)
  have hq_dvd : q ∣ (X ^ 2 + 1 : ℚ[X]) := by
    have hXq : (X : ℚ[X]) * q ∣ X * (X ^ 2 + 1) := hpq ▸ hp_dvd
    exact (mul_dvd_mul_iff_left (X_ne_zero (R := ℚ))).mp hXq
  obtain ⟨s, hs⟩ := hq_dvd
  rcases charge_poly_irreducible.isUnit_or_isUnit hs with hqu | hsu
  · exfalso
    have hpX : minpoly ℚ chargeOp = X := by rw [hpq, hq_monic.eq_one_of_isUnit hqu, mul_one]
    have haev : (aeval chargeOp) (minpoly ℚ chargeOp) = chargeOp := by rw [hpX, aeval_X]
    rw [minpoly.aeval] at haev
    exact chargeOp_ne_zero haev.symm
  · have hassoc : Associated q (X ^ 2 + 1 : ℚ[X]) := by
      rw [hs]; exact associated_mul_unit_right q s hsu
    rw [hpq, eq_of_monic_of_associated hq_monic chargeOpV_monic_wit hassoc, ← cube_factor]

/-! ## W8 TEETH — the whole-7 spectrum is genuinely richer than the V-restriction. -/

/-- ★★ W8 TEETH: `chargeOp² ≠ −id` on the WHOLE fundamental 7 — it KILLS the singlet
    (`chargeOp²(⟨u1⟩) = 0`, whereas `(−id)(⟨u1⟩) = −⟨u1⟩ ≠ 0`). This DISTINGUISHES the whole-7
    minimal polynomial (`X³+X`, WITH the `0` root) from the branching-complement restriction
    (`X²+1`, N242): the singlet's charge-`0` direction is genuinely present and is NOT one of the
    `±i` pair. -/
theorem chargeOp_sq_ne_neg_id : chargeOp.comp chargeOp ≠ -LinearMap.id := by
  intro h
  have hval : chargeOp (chargeOp sgl) = (-LinearMap.id : Module.End ℚ ImO) sgl :=
    congrArg (fun f => f sgl) h
  rw [chargeOp_kills_singlet, map_zero, LinearMap.neg_apply, LinearMap.id_apply] at hval
  exact sgl_ne_zero (neg_eq_zero.mp hval.symm)

/-! ## The three roots `{0, +J, −J}` of `X³ + X` in the derived `Dbl ℚ`, mutually distinct. -/

/-- ★ THE `0` ROOT (the singlet's charge, the `X` factor): `0³ + 0 = 0` in `Dbl ℚ`. -/
theorem Dbl_zero_cube_root : (0 : Dbl ℚ) ^ 3 + 0 = 0 := by ring

/-- ★ THE `+i` ROOT IS THE DERIVED COMPLEX UNIT `J`: `J³ + J = 0` in `Dbl ℚ` (banked
    `Dbl.J_mul_J : J*J = −1`, N2 rung 1). One of the two triplet charges. -/
theorem Dbl_J_cube_root : (Dbl.J : Dbl ℚ) ^ 3 + Dbl.J = 0 := by
  have h : (Dbl.J : Dbl ℚ) ^ 2 = -1 := by rw [sq, Dbl.J_mul_J]
  have hc : (Dbl.J : Dbl ℚ) ^ 3 = Dbl.J ^ 2 * Dbl.J := by ring
  rw [hc, h]; ring

/-- ★ THE `−i` ROOT IS `−J`: `(−J)³ + (−J) = 0` — the OPPOSITE triplet charge. -/
theorem Dbl_negJ_cube_root : (-Dbl.J : Dbl ℚ) ^ 3 + (-Dbl.J) = 0 := by
  have h : (Dbl.J : Dbl ℚ) ^ 2 = -1 := by rw [sq, Dbl.J_mul_J]
  have hc : (-Dbl.J : Dbl ℚ) ^ 3 = -(Dbl.J ^ 2 * Dbl.J) := by ring
  rw [hc, h]; ring

/-- ★ The `0` root is genuinely distinct from `+J` (imaginary parts `0` vs `1`). -/
theorem Dbl_zero_ne_J : (0 : Dbl ℚ) ≠ Dbl.J := by
  intro h
  have := congrArg Dbl.im h
  simp only [Dbl.zero_im, Dbl.J] at this
  norm_num at this

/-- ★ The `0` root is genuinely distinct from `−J` (imaginary parts `0` vs `−1`). -/
theorem Dbl_zero_ne_negJ : (0 : Dbl ℚ) ≠ -Dbl.J := by
  intro h
  have := congrArg Dbl.im h
  simp only [Dbl.zero_im, Dbl.neg_im, Dbl.J] at this
  norm_num at this

/-! ## The only rational eigenvalue is `0`. -/

/-- The only rational root of `X³ + X` is `0`: `μ³ + μ = μ(μ² + 1) = 0` with `μ² + 1 > 0` (the fold
    self-overlap positivity) forces `μ = 0`. -/
theorem cube_poly_root_eq_zero (μ : ℚ) (h : (X ^ 3 + X : ℚ[X]).IsRoot μ) : μ = 0 := by
  simp only [IsRoot, eval_add, eval_pow, eval_X] at h
  have hfac : μ * (μ ^ 2 + 1) = 0 := by linear_combination h
  rcases mul_eq_zero.mp hfac with h0 | h1
  · exact h0
  · nlinarith [sq_nonneg μ]

/-- ★ THE ONLY RATIONAL EIGENVALUE of the charge operator on the whole fundamental 7 is `0` (the
    singlet's charge). An eigenvalue is a root of the minimal polynomial `X³ + X`
    (`hasEigenvalue_iff_isRoot` + `chargeOp_minpoly`), whose only rational root is `0`
    (`cube_poly_root_eq_zero`). The triplet charges `±i` are non-real, not rational. -/
theorem chargeOp_rational_eigenvalue_eq_zero (μ : ℚ)
    (hμ : Module.End.HasEigenvalue chargeOp μ) : μ = 0 := by
  have hroot := Module.End.hasEigenvalue_iff_isRoot.mp hμ
  rw [chargeOp_minpoly] at hroot
  exact cube_poly_root_eq_zero μ hroot

/-! ## THE CAPSTONE. -/

/-- ★★★ THE COMPLETE CHARGE SPECTRUM of the fundamental 7, from the gather obstruction. Over the
    derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the gather-obstruction
    cross-product operator `crossOp` (N223), the branching singlet generator `u1` (N42c), and the
    derived complex unit `J` of `Dbl ℚ`:
    (i)   `chargeOp³ = −chargeOp` on `ImO` (the whole fundamental 7);
    (ii)  its minimal polynomial is exactly `X³ + X = X·(X² + 1)`;
    (iii) `chargeOp² ≠ −id` on the whole 7 (it kills the singlet — the `0` root is genuinely there,
          distinguishing the whole-7 spectrum from the `X²+1` V-restriction of N242);
    (iv)  the three roots `{0, +J, −J}` of `X³ + X` satisfy `x³ + x = 0` in the derived `Dbl ℚ`,
          and are MUTUALLY DISTINCT (`0 ≠ ±J`, `J ≠ −J`);
    (v)   the ONLY rational eigenvalue is `0` (the singlet's charge; the triplet charges `±i` are
          non-real).
    The complete charge-eigenvalue decomposition of the branching `7 = 1 ⊕ 3 ⊕ 3̄` — the singlet at
    `0`, the two triplets at the opposite imaginary pair `±i` — is the explicit spectrum
    `{0, +i, −i}` of the gather-obstruction charge operator, DERIVED (not posited, not normalized).
    `±i` names the two non-`0` roots of a derived real operator's minimal polynomial; it is
    metalanguage, not a posited content ground. -/
theorem forced_charge_spectrum_structure :
    chargeOp.comp (chargeOp.comp chargeOp) = -chargeOp ∧
    minpoly ℚ chargeOp = (X ^ 3 + X : ℚ[X]) ∧
    chargeOp.comp chargeOp ≠ -LinearMap.id ∧
    (0 : Dbl ℚ) ^ 3 + 0 = 0 ∧
    (Dbl.J : Dbl ℚ) ^ 3 + Dbl.J = 0 ∧
    (-Dbl.J : Dbl ℚ) ^ 3 + (-Dbl.J) = 0 ∧
    (0 : Dbl ℚ) ≠ Dbl.J ∧
    (0 : Dbl ℚ) ≠ -Dbl.J ∧
    (Dbl.J : Dbl ℚ) ≠ -Dbl.J ∧
    (∀ μ : ℚ, Module.End.HasEigenvalue chargeOp μ → μ = 0) :=
  ⟨chargeOp_cube, chargeOp_minpoly, chargeOp_sq_ne_neg_id, Dbl_zero_cube_root, Dbl_J_cube_root,
   Dbl_negJ_cube_root, Dbl_zero_ne_J, Dbl_zero_ne_negJ, Dbl_J_ne_negJ,
   chargeOp_rational_eigenvalue_eq_zero⟩

end

end Phys.Algebra
