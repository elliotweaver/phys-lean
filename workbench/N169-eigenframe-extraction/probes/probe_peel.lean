import Phys.Algebra.LorentzContinuumGeneralAxisBoostPath

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- The reverse boost `a(−b)` inverts the forward boost `a b` along the same unit axis. -/
theorem genBoostLin_comp_inv (wx : Cut) (wv : O Cut)
    (hw : wx ^ 2 + gFormC wv wv = 1) {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    genBoostLin wx wv a b * genBoostLin wx wv a (-b) = 1 := by
  apply LinearMap.ext; intro p
  obtain ⟨t, x, v⟩ := p
  rw [Module.End.mul_apply, genBoostLin_apply, genBoostLin_apply]
  have key : ∀ d : Cut,
      wx * (x + d * wx) + gFormC (v + d • wv) wv
        = (wx * x + gFormC v wv) + d := by
    intro d
    rw [gFormC_add_left, gFormC_smul_left]
    linear_combination d * hw
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show a * (a * t + (-b) * (wx * x + gFormC v wv))
          + b * (wx * (x + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) * wx)
              + gFormC (v + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) • wv) wv) = t
    rw [key]
    linear_combination t * hab
  · show (x + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) * wx)
          + (b * (a * t + (-b) * (wx * x + gFormC v wv))
              + (a - 1) * (wx * (x + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) * wx)
                  + gFormC (v + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) • wv) wv)) * wx = x
    rw [key]
    linear_combination ((wx * x + gFormC v wv) * wx) * hab
  · show (v + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) • wv)
          + (b * (a * t + (-b) * (wx * x + gFormC v wv))
              + (a - 1) * (wx * (x + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) * wx)
                  + gFormC (v + ((-b) * t + (a - 1) * (wx * x + gFormC v wv)) • wv) wv)) • wv = v
    rw [key]
    rw [add_assoc, ← add_smul]
    have hzero : ((-b) * t + (a - 1) * (wx * x + gFormC v wv))
        + (b * (a * t + (-b) * (wx * x + gFormC v wv))
            + (a - 1) * ((wx * x + gFormC v wv) + ((-b) * t + (a - 1) * (wx * x + gFormC v wv))))
        = 0 := by
      linear_combination (wx * x + gFormC v wv) * hab
    rw [hzero, zero_smul, add_zero]

/-! ## THE BOOST PEEL — signature (1,9): one boost removes the unique timelike mixing. -/

/-- ★★ THE BOOST PEEL. An orthochronous `QvC`-isometry `p` (`0 ≤ (p e₀).1`, `e₀ = (1,0,0)` the
    timelike axis) admits boost data READ OFF its action on `e₀`: there exist a UNIT spatial
    direction `ŵ = (wx, wv)`, and `a², b²` with `a² − b² = 1`, `0 < a`, such that the REVERSE
    boost `genBoostLin wx wv a (−b)` (the inverse of the forward boost) sends `p e₀` back to `e₀`.
    The signature-(1,9) geometry made operator-explicit: ONE boost peels the unique timelike
    mixing. Read-off: `a := (p e₀).1`, `nrm := (p e₀).2.1² + gFormC (p e₀).2.2 (p e₀).2.2`,
    `b := cutSqrt nrm`, `ŵ := (s_x/b, (1/b)•s_v)`; the degenerate `nrm = 0` branch (`p e₀ = e₀`)
    uses `ŵ = (1,0)`, `a = 1`, `b = 0`. -/
theorem qvIsom_orthochronous_boost_peel {p : Module.End Cut STVC}
    (hp : IsQvIsomC (p : STVC → STVC))
    (hortho : 0 ≤ (p ((1:Cut), (0:Cut), (0:O Cut))).1) :
    ∃ (wx : Cut) (wv : O Cut) (a b : Cut),
      wx ^ 2 + gFormC wv wv = 1 ∧ a ^ 2 - b ^ 2 = 1 ∧ 0 < a ∧
      genBoostLin wx wv a (-b) (p ((1:Cut), (0:Cut), (0:O Cut)))
        = ((1:Cut), (0:Cut), (0:O Cut)) := by
  set a : Cut := (p ((1:Cut), (0:Cut), (0:O Cut))).1 with ha
  set sx : Cut := (p ((1:Cut), (0:Cut), (0:O Cut))).2.1 with hsx
  set sv : O Cut := (p ((1:Cut), (0:Cut), (0:O Cut))).2.2 with hsv
  set nrm : Cut := sx ^ 2 + gFormC sv sv with hnrm
  -- QvC of p e₀ equals QvC e₀ = 1, giving a² − nrm = 1
  have hqe0 : QvC ((1:Cut), (0:Cut), (0:O Cut)) = 1 := by
    show ((1:Cut)) ^ 2 - (0:Cut) ^ 2 - gFormC (0:O Cut) (0:O Cut) = 1
    rw [gFormC_zero_left]; ring
  have hanrm : a ^ 2 - nrm = 1 := by
    have h := hp ((1:Cut), (0:Cut), (0:O Cut))
    rw [hqe0] at h
    have hQ : QvC (p ((1:Cut), (0:Cut), (0:O Cut)))
        = a ^ 2 - sx ^ 2 - gFormC sv sv := rfl
    rw [hQ] at h
    rw [hnrm]; linarith [h]
  have hsx2 : 0 ≤ sx ^ 2 := sq_nonneg sx
  have hgsv : 0 ≤ gFormC sv sv := gFormC_nonneg sv
  have hnrm_nonneg : 0 ≤ nrm := by rw [hnrm]; linarith
  rcases eq_or_lt_of_le hnrm_nonneg with hz | hpos
  · -- nrm = 0: p e₀ = e₀, peel is the identity boost
    have hnrm0 : nrm = 0 := hz.symm
    have hsx0 : sx = 0 := by
      have : sx ^ 2 = 0 := by rw [hnrm] at hnrm0; linarith
      exact pow_eq_zero_iff (by norm_num) |>.mp this
    have hsv0 : sv = 0 := by
      have : gFormC sv sv = 0 := by rw [hnrm] at hnrm0; linarith
      exact (gFormC_eq_zero_iff sv).mp this
    have ha1 : a = 1 := by
      have ha2 : a ^ 2 = 1 := by rw [hnrm0] at hanrm; linarith
      nlinarith [hortho, ha2]
    refine ⟨1, 0, 1, 0, ?_, ?_, ?_, ?_⟩
    · rw [gFormC_zero_left]; ring
    · ring
    · norm_num
    · rw [genBoostLin_apply]
      refine Prod.ext ?_ (Prod.ext ?_ ?_)
      · show (1:Cut) * a + (-0) * ((1:Cut) * sx + gFormC sv 0) = 1
        rw [ha1]; ring
      · show sx + ((-0) * a + ((1:Cut) - 1) * ((1:Cut) * sx + gFormC sv 0)) * 1 = 0
        rw [hsx0]; ring
      · show sv + ((-0) * a + ((1:Cut) - 1) * ((1:Cut) * sx + gFormC sv 0)) • (0:O Cut) = 0
        rw [hsv0]; rw [smul_zero, add_zero]
  · -- nrm > 0: genuine boost peel
    have hbpos : 0 < cutSqrt nrm := cutSqrt_pos hpos
    set b : Cut := cutSqrt nrm with hbdef
    have hbne : b ≠ 0 := ne_of_gt hbpos
    have hb2 : b ^ 2 = nrm := by rw [hbdef, sq]; exact cutSqrt_sq (le_of_lt hpos)
    set wx : Cut := sx / b with hwx
    set wv : O Cut := (1 / b) • sv with hwv
    have hbb : b * b = sx * sx + gFormC sv sv := by rw [← sq, hb2, hnrm]; ring
    have hb2nrm : b ^ 2 = sx ^ 2 + gFormC sv sv := by rw [hb2, hnrm]
    have hunit : wx ^ 2 + gFormC wv wv = 1 := by
      rw [hwx, hwv, gFormC_smul_left, gFormC_smul_right]
      field_simp
      linarith [hb2nrm]
    have hab : a ^ 2 - b ^ 2 = 1 := by rw [hb2]; exact hanrm
    have ha_pos : 0 < a := by nlinarith [hanrm, hnrm_nonneg, hortho, sq_nonneg a]
    -- σ = wx*sx + gFormC sv wv = b
    have hσ : wx * sx + gFormC sv wv = b := by
      rw [hwx, hwv, gFormC_smul_right,
          show sx / b * sx + 1 / b * gFormC sv sv = (sx * sx + gFormC sv sv) / b by ring,
          ← hbb, mul_div_assoc, div_self hbne, mul_one]
    refine ⟨wx, wv, a, b, hunit, hab, ha_pos, ?_⟩
    rw [genBoostLin_apply]
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * a + (-b) * (wx * sx + gFormC sv wv) = 1
      rw [hσ]; linear_combination hab
    · show sx + ((-b) * a + (a - 1) * (wx * sx + gFormC sv wv)) * wx = 0
      rw [hσ, hwx, show (-b) * a + (a - 1) * b = -b by ring]
      field_simp
      ring
    · show sv + ((-b) * a + (a - 1) * (wx * sx + gFormC sv wv)) • wv = 0
      rw [hσ, show (-b) * a + (a - 1) * b = -b by ring, hwv, smul_smul,
          show (-b) * (1 / b) = -1 by field_simp, neg_one_smul]
      abel

/-- ★★ THE BOOST-PEEL FACTORIZATION. Every orthochronous `QvC`-isometry `p` factors as
    `p = B · k` where `B := genBoostLin wx wv a b` is a FORWARD general-axis boost (the boost data
    read off `p e₀` by `qvIsom_orthochronous_boost_peel`) and `k` is a TIME-FIXING `QvC`-isometry
    (`k e₀ = e₀`). Signature (1,9): ONE boost removes the unique timelike mixing direction, leaving
    a purely-spatial residual `k` (the `SO(9)` time-fixing stabilizer of N163). -/
theorem qvIsom_orthochronous_boost_factor {p : Module.End Cut STVC}
    (hp : IsQvIsomC (p : STVC → STVC))
    (hortho : 0 ≤ (p ((1:Cut), (0:Cut), (0:O Cut))).1) :
    ∃ (wx : Cut) (wv : O Cut) (a b : Cut) (k : Module.End Cut STVC),
      wx ^ 2 + gFormC wv wv = 1 ∧ a ^ 2 - b ^ 2 = 1 ∧ 0 < a ∧
      IsQvIsomC (k : STVC → STVC) ∧
      k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)) ∧
      genBoostLin wx wv a b * k = p := by
  obtain ⟨wx, wv, a, b, hunit, hab, ha, hpeel⟩ := qvIsom_orthochronous_boost_peel hp hortho
  refine ⟨wx, wv, a, b, genBoostLin wx wv a (-b) * p, hunit, hab, ha, ?_, ?_, ?_⟩
  · -- k = (reverse boost)·p is a QvC-isometry (product of isometries)
    have hrev : IsQvIsomC ((genBoostLin wx wv a (-b)) : STVC → STVC) :=
      genBoostLin_isQvIsomC wx wv hunit (by rw [neg_pow]; linear_combination hab)
    intro q
    show QvC ((genBoostLin wx wv a (-b) * p) q) = QvC q
    rw [Module.End.mul_apply, hrev (p q), hp q]
  · -- k fixes e₀
    show (genBoostLin wx wv a (-b) * p) ((1:Cut), (0:Cut), (0:O Cut))
      = ((1:Cut), (0:Cut), (0:O Cut))
    rw [Module.End.mul_apply]; exact hpeel
  · -- B · k = B · B⁻¹ · p = p
    rw [← mul_assoc, genBoostLin_comp_inv wx wv hunit hab, one_mul]

/-- ★★ THE EIGENFRAME-EXTRACTION REDUCTION (the JoinedIdQvC closure, conditional on the spatial
    residual). If the TIME-FIXING residual `k` of the boost-peel factorization of an orthochronous
    `QvC`-isometry `p` is `JoinedIdQvC`, then `p` ITSELF is the NON-VACUOUS `JoinedIdQvC`: the
    forward boost `B = genBoostLin wx wv a b` is `JoinedIdQvC` (`joinedIdQvC_genBoostLin`, N168) and
    `JoinedIdQvC` is closed under products (`joinedIdQvC_mul`, N157). This reduces the UNCONDITIONAL
    full `SO⁺(1,9)` identity component to the time-fixing `SO(9)` stabilizer (N163's territory): the
    boost factor is discharged, only the purely-spatial residual remains. -/
theorem joinedIdQvC_of_timeFixing_residual {p : Module.End Cut STVC}
    (hp : IsQvIsomC (p : STVC → STVC))
    (hortho : 0 ≤ (p ((1:Cut), (0:Cut), (0:O Cut))).1)
    (hres : ∀ (wx : Cut) (wv : O Cut) (a b : Cut) (k : Module.End Cut STVC),
      wx ^ 2 + gFormC wv wv = 1 → a ^ 2 - b ^ 2 = 1 → 0 < a →
      IsQvIsomC (k : STVC → STVC) →
      k ((1:Cut), (0:Cut), (0:O Cut)) = ((1:Cut), (0:Cut), (0:O Cut)) →
      genBoostLin wx wv a b * k = p → JoinedIdQvC k) :
    JoinedIdQvC p := by
  obtain ⟨wx, wv, a, b, k, hunit, hab, ha, hkisom, hktime, hfac⟩ :=
    qvIsom_orthochronous_boost_factor hp hortho
  rw [← hfac]
  exact joinedIdQvC_mul (joinedIdQvC_genBoostLin wx wv hunit hab ha)
    (hres wx wv a b k hunit hab ha hkisom hktime hfac)

/-- ★ W8 NON-VACUITY / TEETH — the boost peel of the CONCRETE octonion-direction boost
    `B₀ := genBoostLin (0) (1) (5/3) (4/3)` (a genuine non-identity isometry that MOVES the octonion
    coordinate, N168) recovers boost data whose reverse boost sends `B₀ e₀` back to `e₀`, AND the
    factorization residual `k` is the IDENTITY (`B₀` is itself a forward boost, so peeling it leaves
    nothing). The peel genuinely identifies the boost — non-vacuous: `B₀ e₀ = (5/3, 0, (4/3)•1) ≠ e₀`,
    yet the reverse boost returns it exactly to `e₀`. -/
theorem boost_peel_octReal_nonvac :
    genBoostLin (0:Cut) (1:O Cut) ((5:Cut)/3) (-((4:Cut)/3))
        (genBoostLin (0:Cut) (1:O Cut) ((5:Cut)/3) ((4:Cut)/3) ((1:Cut), (0:Cut), (0:O Cut)))
      = ((1:Cut), (0:Cut), (0:O Cut))
    ∧ genBoostLin (0:Cut) (1:O Cut) ((5:Cut)/3) ((4:Cut)/3) ((1:Cut), (0:Cut), (0:O Cut))
      = ((5:Cut)/3, (0:Cut), ((4:Cut)/3) • (1:O Cut)) := by
  have hw : (0:Cut) ^ 2 + gFormC (1:O Cut) (1:O Cut) = 1 := by
    rw [gFormC_one_left, reQC_one]; ring
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by norm_num
  constructor
  · have hab' : ((5:Cut)/3) ^ 2 - (-((4:Cut)/3)) ^ 2 = 1 := by rw [neg_pow]; linear_combination hab
    have hcomp := genBoostLin_comp_inv (0:Cut) (1:O Cut) hw hab'
    rw [neg_neg] at hcomp
    have := congrArg (fun (f : Module.End Cut STVC) => f ((1:Cut), (0:Cut), (0:O Cut))) hcomp
    simpa only [Module.End.mul_apply, Module.End.one_apply] using this
  · rw [genBoostLin_apply]
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show (5:Cut)/3 * 1 + (4:Cut)/3 * (0 * 0 + gFormC 0 1) = (5:Cut)/3
      rw [gFormC_zero_left]; ring
    · show (0:Cut) + ((4:Cut)/3 * 1 + ((5:Cut)/3 - 1) * (0 * 0 + gFormC (0:O Cut) 1)) * 0 = 0
      ring
    · show (0:O Cut) + ((4:Cut)/3 * 1 + ((5:Cut)/3 - 1) * (0 * 0 + gFormC (0:O Cut) 1)) • (1:O Cut)
          = ((4:Cut)/3) • (1:O Cut)
      rw [gFormC_zero_left, zero_add,
          show (4:Cut)/3 * 1 + ((5:Cut)/3 - 1) * (0 * 0 + 0) = (4:Cut)/3 by ring]

end

end Phys.Algebra
