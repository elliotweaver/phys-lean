/-
  # THE INVERSION CORE — Bézout, class-carrying slacks, raise, re-read (GQ N615)

  ## What this file proves (GQ campaign, production node)

  Every motor of the InvertibleCapture core:

  * `z_le_ofRe` / `pos_to_re` — Z↔Re transport helpers.
  * `inversion_data` — ★★ THE INVERSION: p prime, c a positive count,
    p ∤ c ⟹ POSITIVE u, v with c·u = 1 + p·v (Bézout shifted positive).
  * `PPowD` / `CapturedByD` — ★ the CLASS-CARRYING slack and capture: the
    correct formalization of THE LAW's quotient (p-th powers of CLASSES
    of disc D, not of arbitrary forms).
  * `pow_of_pow` — ★★ index composition: (a·b)-th powers compose.
  * `ppowD_raise` — ★★★ THE RAISED SLACK: class-carrying p-th powers have
    class-carrying p-th-power u-th powers.
  * `power_of_product` — ★★ (a∘b)ⁿ ~ aⁿ∘bⁿ (the forward zip).
  * `capturedD_raise` — ★★★ THE RAISED CAPTURE: CapturedByD lifts over
    u-th powers (slacks raised, landings zipped, chain transported).
  * `index_transport` — ★ the Z-inversion identity as an Re-identity.
  * `block_reread` — ★★★ THE BLOCK RE-READ: y^(cu) peels as y ∘ (y^v)^p
    — one y out front, a PPowD tail.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussMonoid
import Phys.Foundation.ContinuumField

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- Z-absolute value helper: every z has n : Re with z ≤ ofRe n. -/
theorem z_le_ofRe (z : Z) : ∃ n : Re, z ≤ Z.ofRe n := by
  obtain ⟨n, hn | hn⟩ := z_trichotomy z
  · exact ⟨n, le_of_eq hn⟩
  · refine ⟨Re.void, ?_⟩
    have h0 : Z.ofRe Re.void = (0 : Z) := Z.ofRe_zero
    rw [h0, hn]
    have := ofRe_nonneg n
    linarith

/-- ★★ THE INVERSION DATA: p prime, c a positive count, p ∤ c (as integers)
    ⟹ positive u, v with c·u = 1 + p·v (all Z-side, Re-presented). -/
theorem inversion_data {p c : Z} {pr : Re}
    (hp : p = Z.ofRe pr) (hprime : PrimeRe pr)
    (hcpos : 0 < c) (hnd : ¬ ZDvd p c) :
    ∃ u v : Z, 0 < u ∧ 0 < v ∧ c * u = 1 + p * v := by
  have hpne : p ≠ 0 := prime_ne_zero hp hprime
  have hp2 : (2 : Z) ≤ p := prime_ge_two hp hprime
  -- gcd + Bézout at (p, c)
  obtain ⟨g, hgpos, hgp, hgc, al, be, hbez⟩ := gcd_bezout_exists p c hpne
  -- classification: g = 1 or g = p
  rcases prime_divisor_classification hp hprime hgpos hgp with hg1 | hgp'
  · -- g = 1: Bézout gives 1 = al·p + be·c; shift be positive
    rw [hg1] at hbez
    -- pick k with u := be + k·p ≥ 1 and v := c·k − al ≥ 1:
    -- k := (|al| + |be| + 1)-ish; use z_le_ofRe bounds
    obtain ⟨na, hna⟩ := z_le_ofRe al
    obtain ⟨nb, hnb⟩ := z_le_ofRe (-be)
    set k := Z.ofRe na + Z.ofRe nb + 1 with hk
    have hka : al ≤ Z.ofRe na := hna
    have hkb : -be ≤ Z.ofRe nb := hnb
    have hnna := ofRe_nonneg na
    have hnnb := ofRe_nonneg nb
    have hkpos : 0 < k := by rw [hk]; linarith
    refine ⟨be + k * p, c * k - al, ?_, ?_, ?_⟩
    · -- u = be + kp > 0: kp ≥ 2k ≥ 2(ofRe nb + ...) ≥ -be + ...
      have hstep : (0 : Z) ≤ k * (p - 2) :=
        mul_nonneg (le_of_lt hkpos) (by linarith)
      have h2k : 2 * k ≤ k * p := by nlinarith [hstep]
      linarith
    · -- v = ck − al > 0: ck ≥ k ≥ ofRe na + 1 > al
      have hc1 : (1 : Z) ≤ c := Z.one_le_of_pos hcpos
      have hstep2 : (0 : Z) ≤ (c - 1) * k :=
        mul_nonneg (by linarith) (le_of_lt hkpos)
      have hck : k ≤ c * k := by nlinarith [hstep2]
      linarith
    · -- the identity: c(be + kp) = cbe + ckp = (1 − al·p) + ckp
      --   = 1 + p(ck − al)
      have h1 : be * c = 1 - al * p := by linarith [hbez]
      calc c * (be + k * p) = be * c + c * k * p := by ring
        _ = (1 - al * p) + c * k * p := by rw [h1]
        _ = 1 + p * (c * k - al) := by ring
  · -- g = p: p ∣ c — contradiction
    exfalso
    exact hnd (hgp' ▸ hgc)


def PPowD (p : Re) (D : Z) (P : BQF) : Prop :=
  ∃ w : BQF, Primitive w ∧ PosDef w ∧ disc w = D ∧ PowRel w p P

def CapturedByD (p : Re) (D : Z) (x h : BQF) : Prop :=
  ∃ P1 P2 L R : BQF, PPowD p D P1 ∧ PPowD p D P2 ∧
    CompRel x P1 L ∧ CompRel h P2 R ∧ Chain L R

theorem pow_of_pow {y w Q : BQF}
    (hyp : Primitive y) (hypos : PosDef y) (hD : disc y < 0)
    {a b : Re}
    (hw : PowRel y (Re.step a) w) (hQ : PowRel w (Re.step b) Q) :
    PowRel y (Re.step a * Re.step b) Q := by
  have hlad : WLadder w := by
    obtain ⟨hwp, hwpos, hwd⟩ := powRel_class hyp hypos hD hw
    exact wladder_of hwp hwpos (by rw [hwd]; exact hD)
  have hlink : JoinLink y w (Re.step a) :=
    fun {W W'} hstep {j} hWpow => joinLink_of hyp hypos hD hw hstep hWpow
  obtain ⟨Y, hwY, hyY⟩ := block_is_pth' hw hlad hlink b
  have hQY : Chain Q Y := powRel_functional hQ hwY
  exact powRel_congr hyY (chainSymm hQY)

theorem ppowD_raise {p₀ u₀ : Re} {D : Z} {P : BQF}
    (hDneg : D < 0)
    (hP : PPowD (Re.step p₀) D P) :
    ∃ Pu : BQF, PowRel P (Re.step u₀) Pu ∧ PPowD (Re.step p₀) D Pu := by
  obtain ⟨w, hwp, hwpos, hwd, hwP⟩ := hP
  have hwD : disc w < 0 := by rw [hwd]; exact hDneg
  obtain ⟨hPp, hPpos, hPd⟩ := powRel_class hwp hwpos hwD hwP
  obtain ⟨Pu, hPu⟩ := wpow_exists
    (wladder_of hPp hPpos (by rw [hPd]; exact hwD)) u₀
  have hPuIdx : PowRel w (Re.step p₀ * Re.step u₀) Pu :=
    pow_of_pow hwp hwpos hwD hwP hPu
  obtain ⟨wu, hwu⟩ := wpow_exists (wladder_of hwp hwpos hwD) u₀
  obtain ⟨hwup, hwupos, hwud⟩ := powRel_class hwp hwpos hwD hwu
  obtain ⟨Pu', hPu'⟩ := wpow_exists
    (wladder_of hwup hwupos (by rw [hwud]; exact hwD)) p₀
  have hPu'Idx : PowRel w (Re.step u₀ * Re.step p₀) Pu' :=
    pow_of_pow hwp hwpos hwD hwu hPu'
  have hcomm : Re.step u₀ * Re.step p₀ = Re.step p₀ * Re.step u₀ :=
    Re.mul_comm _ _
  rw [hcomm] at hPu'Idx
  have hPuPu' : Chain Pu Pu' := powRel_functional hPuIdx hPu'Idx
  have hPuPow : PowRel wu (Re.step p₀) Pu :=
    powRel_congr hPu' (chainSymm hPuPu')
  exact ⟨Pu, hPu, wu, hwup, hwupos, (by rw [hwud, hwd]), hPuPow⟩

/- ——— the new welds ——— -/

/-- ★★ POWER OF PRODUCT: (a∘b)^n ~ a^n∘b^n — the zip, forward form. -/
theorem power_of_product {a b ab : BQF}
    (hap : Primitive a) (hbp : Primitive b)
    (hapos : PosDef a) (hbpos : PosDef b)
    (hD : disc a < 0) (hdb : disc a = disc b)
    (hab : CompRel a b ab) :
    ∀ {n : Re} {An Bn : BQF}, PowRel a n An → PowRel b n Bn →
    ∀ {Cn : BQF}, CompRel An Bn Cn → PowRel ab n Cn := by
  intro n An Bn hAn hBn Cn hCn
  obtain ⟨ab', hab', hpow⟩ := pth_product hap hbp hapos hbpos hD hdb
    hAn hBn hCn
  have habab' : Chain ab ab' := compRel_functional hab hab'
  -- PowRel ab' n Cn transports along ab ~ ab' via base congruence:
  -- powers respect base chains — induction inline:
  clear hCn hAn hBn
  induction hpow with
  | one hch =>
      exact PowRel.one (chainTrans habab' hch)
  | @succ k h h' hpk hc ih =>
      exact PowRel.succ ih (compRel_congr (chainSymm habab')
        (Chain.refl _) (Chain.refl _) hc)

/-- ★★★ THE RAISED CAPTURE: CapturedByD lifts over u-th powers. -/
theorem capturedD_raise {p₀ u₀ : Re} {D : Z} {x h : BQF}
    (hxp : Primitive x) (hhp : Primitive h)
    (hxpos : PosDef x) (hhpos : PosDef h)
    (hDneg : D < 0) (hdx : disc x = D) (hdh : disc h = D)
    (hcap : CapturedByD (Re.step p₀) D x h)
    {X H : BQF}
    (hX : PowRel x (Re.step u₀) X) (hH : PowRel h (Re.step u₀) H) :
    CapturedByD (Re.step p₀) D X H := by
  obtain ⟨P1, P2, L, R, hP1, hP2, hxL, hhR, hLR⟩ := hcap
  have hxD : disc x < 0 := by rw [hdx]; exact hDneg
  have hhD : disc h < 0 := by rw [hdh]; exact hDneg
  -- slack class data
  obtain ⟨w1, hw1p, hw1pos, hw1d, hw1P⟩ := hP1
  obtain ⟨w2, hw2p, hw2pos, hw2d, hw2P⟩ := hP2
  obtain ⟨hP1p, hP1pos, hP1d⟩ := powRel_class hw1p hw1pos
    (by rw [hw1d]; exact hDneg) hw1P
  obtain ⟨hP2p, hP2pos, hP2d⟩ := powRel_class hw2p hw2pos
    (by rw [hw2d]; exact hDneg) hw2P
  -- L, R class data
  have hLcls := compRel_class hxpos hP1pos hxD (by rw [hdx, hP1d, hw1d]) hxL
  have hLp := compRel_primitive hxp hP1p hxL
  have hRcls := compRel_class hhpos hP2pos hhD (by rw [hdh, hP2d, hw2d]) hhR
  have hRp := compRel_primitive hhp hP2p hhR
  -- raise the slacks
  obtain ⟨P1u, hP1u, hP1uD⟩ := ppowD_raise (u₀ := u₀) hDneg
    ⟨w1, hw1p, hw1pos, hw1d, hw1P⟩
  obtain ⟨P2u, hP2u, hP2uD⟩ := ppowD_raise (u₀ := u₀) hDneg
    ⟨w2, hw2p, hw2pos, hw2d, hw2P⟩
  -- raised landings: Lu := L^u, Ru := R^u
  obtain ⟨Lu, hLu⟩ := wpow_exists
    (wladder_of hLp hLcls.1 (by rw [hLcls.2]; exact hxD)) u₀
  obtain ⟨Ru, hRu⟩ := wpow_exists
    (wladder_of hRp hRcls.1 (by rw [hRcls.2]; exact hhD)) u₀
  -- the raised capture equations: X∘P1u ~ Lu (power_of_product on L=x∘P1):
  obtain ⟨hP1up, hP1upos, hP1ud⟩ := powRel_class hP1p hP1pos
    (by rw [hP1d, hw1d]; exact hDneg) hP1u
  obtain ⟨hXp, hXpos, hXd⟩ := powRel_class hxp hxpos hxD hX
  obtain ⟨XP1u, hXP1u⟩ := general_total' hXp hXpos hP1upos
    (by rw [hXd]; exact hxD) (by rw [hXd, hP1ud, hP1d, hw1d, hdx])
  have hLuPow : PowRel L (Re.step u₀) XP1u :=
    power_of_product hxp hP1p hxpos hP1pos hxD
      (by rw [hdx, hP1d, hw1d]) hxL hX hP1u hXP1u
  have hLuXP : Chain Lu XP1u := powRel_functional hLu hLuPow
  -- same on the R side
  obtain ⟨hP2up, hP2upos, hP2ud⟩ := powRel_class hP2p hP2pos
    (by rw [hP2d, hw2d]; exact hDneg) hP2u
  obtain ⟨hHp, hHpos, hHd⟩ := powRel_class hhp hhpos hhD hH
  obtain ⟨HP2u, hHP2u⟩ := general_total' hHp hHpos hP2upos
    (by rw [hHd]; exact hhD) (by rw [hHd, hP2ud, hP2d, hw2d, hdh])
  have hRuPow : PowRel R (Re.step u₀) HP2u :=
    power_of_product hhp hP2p hhpos hP2pos hhD
      (by rw [hdh, hP2d, hw2d]) hhR hH hP2u hHP2u
  have hRuHP : Chain Ru HP2u := powRel_functional hRu hRuPow
  -- Chain Lu Ru: L ~ R ⟹ their towers agree (powers respect base chain)
  have hLuRu : Chain Lu Ru :=
    powRel_functional hLu (powRel_base_congr (chainSymm hLR) hRu)
  -- assemble
  exact ⟨P1u, P2u, XP1u, HP2u, hP1uD, hP2uD, hXP1u, hHP2u,
    chainTrans (chainSymm hLuXP) (chainTrans hLuRu hRuHP)⟩


/-- Positive Z is the image of a step. -/
theorem pos_to_re {z : Z} (hz : 0 < z) : ∃ n : Re, z = Z.ofRe (Re.step n) := by
  obtain ⟨n, hn | hn⟩ := z_trichotomy z
  · cases n with
    | void =>
        exfalso
        have h0 : Z.ofRe Re.void = (0 : Z) := Z.ofRe_zero
        rw [hn, h0] at hz
        exact lt_irrefl _ hz
    | step m => exact ⟨m, hn⟩
  · exfalso
    have hnn := ofRe_nonneg n
    rw [hn] at hz
    linarith

/-- ★ INDEX TRANSPORT: the Z-inversion identity becomes an Re-identity. -/
theorem index_transport {c u p v : Re}
    (hz : Z.ofRe c * Z.ofRe u = 1 + Z.ofRe p * Z.ofRe v) :
    c * u = Re.step (p * v) := by
  apply Z.ofRe_injective
  rw [Z.ofRe_mul, hz]
  rw [show Re.step (p * v) = p * v + Re.step Re.void from rfl]
  rw [Z.ofRe_add, Z.ofRe_mul]
  have h1 : Z.ofRe (Re.step Re.void) = 1 := Z.ofRe_one
  rw [h1]
  ring

/-- ★★★ THE BLOCK RE-READ: the raised block peels as y ∘ (y^v)^p. -/
theorem block_reread {y : BQF}
    (hyp : Primitive y) (hypos : PosDef y) (hD : disc y < 0)
    {c u pr v : Re}
    (hidx : Re.step c * Re.step u = Re.step (Re.step pr * Re.step v))
    {Y Yu : BQF}
    (hY : PowRel y (Re.step c) Y) (hYu : PowRel Y (Re.step u) Yu) :
    ∃ (Yv Yt : BQF),
      PowRel y (Re.step v) Yv ∧ PowRel Yv (Re.step pr) Yt ∧
      CompRel y Yt Yu := by
  -- Yu = y^(c·u) by index composition
  have hYuIdx : PowRel y (Re.step c * Re.step u) Yu :=
    pow_of_pow hyp hypos hD hY hYu
  rw [hidx] at hYuIdx
  -- peel: y^(step (pv)) = y∘y^(pv)
  rcases powRel_split_succ hYuIdx with ⟨hpv0, _⟩ | ⟨Ypv, hYpv, hcomp⟩
  · -- step pr * step v = void — impossible (step * step is a step)
    exfalso
    have : Re.step pr * Re.step v = Re.step (Re.step pr * v + pr) := by
      rw [Re.mul_step]
      rfl
    rw [this] at hpv0
    exact Re.step_ne_void _ hpv0
  -- y^(pv): build the v-power and its p-th power, identify
  obtain ⟨Yv, hYv⟩ := wpow_exists (wladder_of hyp hypos hD) v
  obtain ⟨hYvp, hYvpos, hYvd⟩ := powRel_class hyp hypos hD hYv
  obtain ⟨Yt, hYt⟩ := wpow_exists
    (wladder_of hYvp hYvpos (by rw [hYvd]; exact hD)) pr
  have hYtIdx : PowRel y (Re.step v * Re.step pr) Yt :=
    pow_of_pow hyp hypos hD hYv hYt
  have hcommIdx : Re.step v * Re.step pr = Re.step pr * Re.step v :=
    Re.mul_comm _ _
  rw [hcommIdx] at hYtIdx
  -- Ypv ~ Yt at the shared index
  have hchain : Chain Ypv Yt := powRel_functional hYpv hYtIdx
  exact ⟨Yv, Yt, hYv, hYt,
    compRel_congr (Chain.refl _) hchain (Chain.refl _) hcomp⟩


#print axioms inversion_data
#print axioms ppowD_raise
#print axioms capturedD_raise
#print axioms power_of_product
#print axioms index_transport
#print axioms block_reread

end BQF
end GaussForms
end Phys.Foundation
