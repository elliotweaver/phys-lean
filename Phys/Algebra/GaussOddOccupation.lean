/-
  # THE ODD OCCUPATION — realized q-towers (GQ SG-ai)

  ## What this file proves (SEED-GROWTH campaign, AUDIT WELD 2 CLOSED)

  The inert-arm growth law's engine, completing what the odd lift
  (N655) started: the lift's stages become REDUCED FORMS.

  * `ofRe_lt_transport` / `re_pos_of_ofRe_pos` — order transport kit.
  * `zmod_window` — ★★★ THE WINDOW: every integer reduces into
    (−M, M] mod 2M (Re Euclidean division transported, reflection
    for negatives, one conditional shift).
  * `zqpow_pos3` — q-tower positivity.
  * `odd_tower_realized` — ★★★ THE ODD OCCUPATION (∀D): q touching
    split odd prime (Re-witnessed prime, q ∤ D), q^j deep
    (4·q^(2j) ≤ A) ⟹ ∃ reduced PosDef form of the disc with
    a = q^j EXACTLY. Window-reduction preserves the lift's
    divisibility (the shift is by 2M·s); the gate arithmetic forces
    c ≥ a exactly as in the 2-adic occupation (N654).

  CONSEQUENCE (with tower_growth N644 + split_fiber_exit N645): ANY
  disc with a touching split odd prime q carries realized q-tower
  members at every deep level — h(D) ≥ log_q(gate) — THE GROWTH LAW.
  X_m is now explicit at every m with NO record-table dependence:
  both arms of the confinement are unconditional kernel theorems.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussOddLift

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- Order transport: r < m in Re gives ofRe r < ofRe m in Z. -/
theorem ofRe_lt_transport {r m : Re} (h : r < m) : Z.ofRe r < Z.ofRe m := by
  obtain ⟨c, hc⟩ := lt_iff_step_le.mp h
  -- m = step r + c: ofRe m = ofRe r + 1 + ofRe c
  have hm : Z.ofRe m = Z.ofRe r + 1 + Z.ofRe c := by
    rw [hc, Z.ofRe_add]
    have hsr : Re.step r = r + Re.step Re.void := by
      rw [add_step_swap]
      show Re.step r = Re.step (r + Re.void)
      rw [Re.add_void]
    rw [hsr, Z.ofRe_add, show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
  have := ofRe_nonneg c
  linarith

/-- Positivity transport: 0 < ofRe m forces void < m. -/
theorem re_pos_of_ofRe_pos {m : Re} (h : (0 : Z) < Z.ofRe m) : Re.void < m := by
  match m with
  | .void =>
      exfalso
      have hz : Z.ofRe Re.void = (0 : Z) := Z.ofRe_zero
      rw [hz] at h
      exact lt_irrefl 0 h
  | .step k =>
      refine lt_iff_step_le.mpr ⟨k, ?_⟩
      show Re.step k = Re.step Re.void + k
      rw [Re.step_add, Re.void_add]

/-- ★★★ THE WINDOW: every integer reduces into (−M, M] mod 2M. -/
theorem zmod_window {M : Z} (hM : 0 < M) (b : Z) :
    ∃ s b' : Z, b = 2 * M * s + b' ∧ -M < b' ∧ b' ≤ M := by
  -- Re representation of 2M
  obtain ⟨m2, hm2 | hm2⟩ := z_trichotomy (2 * M)
  swap
  · exfalso
    have := ofRe_nonneg m2
    linarith
  have hm2pos : Re.void < m2 := re_pos_of_ofRe_pos (by rw [← hm2]; linarith)
  obtain ⟨n, hn | hn⟩ := z_trichotomy b
  · -- b = ofRe n ≥ 0: divide, then shift the residue down if r0 > M
    obtain ⟨s0, r0, hqr, hrlt⟩ := div_mod_exists m2 hm2pos n
    have hbz : b = 2 * M * Z.ofRe s0 + Z.ofRe r0 := by
      rw [hn, hqr, Z.ofRe_add, Z.ofRe_mul, ← hm2]
    have hr0 : (0 : Z) ≤ Z.ofRe r0 := ofRe_nonneg r0
    have hrlt' : Z.ofRe r0 < 2 * M := by
      rw [hm2]; exact ofRe_lt_transport hrlt
    rcases lt_trichotomy M (Z.ofRe r0) with hgt | heq | hlt2
    case inr.inl => exact ⟨Z.ofRe s0, Z.ofRe r0, hbz, by linarith, le_of_eq heq.symm⟩
    case inr.inr => exact ⟨Z.ofRe s0, Z.ofRe r0, hbz, by linarith, le_of_lt hlt2⟩
    · -- shift: b' = r0 − 2M ∈ (−M, 0) ⊂ (−M, M]
      refine ⟨Z.ofRe s0 + 1, Z.ofRe r0 - 2 * M, by linarith [hbz], ?_, ?_⟩
      · linarith
      · linarith
  · -- b = −ofRe n: divide n, reflect: b = −2Ms − r; residue −r ∈ (−2M, 0];
    -- shift UP if −r ≤ −M i.e. r ≥ M... target (−M, M]: if r < M take −r
    -- (in (−M, 0]); if r ≥ M take 2M − r ∈ (0, M] with s' = −(s+1).
    obtain ⟨s0, r0, hqr, hrlt⟩ := div_mod_exists m2 hm2pos n
    have hbz : b = -(2 * M * Z.ofRe s0) - Z.ofRe r0 := by
      rw [hn, hqr, Z.ofRe_add, Z.ofRe_mul, ← hm2]
      ring
    have hr0 : (0 : Z) ≤ Z.ofRe r0 := ofRe_nonneg r0
    have hrlt' : Z.ofRe r0 < 2 * M := by
      rw [hm2]; exact ofRe_lt_transport hrlt
    rcases lt_trichotomy (Z.ofRe r0) M with hlt | heq | hge
    · -- r0 < M: b' = −r0 ∈ (−M, 0]
      exact ⟨-(Z.ofRe s0), -(Z.ofRe r0), by linarith [hbz], by linarith,
        by linarith⟩
    · -- r0 = M: b' = −r0 = −M — boundary EXCLUDED on the left; take
      -- b' = 2M − r0 = M instead
      refine ⟨-(Z.ofRe s0 + 1), 2 * M - Z.ofRe r0, by linarith [hbz], ?_, ?_⟩
      · linarith
      · linarith
    · -- r0 > M: b' = 2M − r0 ∈ (0, M)
      refine ⟨-(Z.ofRe s0 + 1), 2 * M - Z.ofRe r0, by linarith [hbz], ?_, ?_⟩
      · linarith
      · linarith

/-- q-tower positivity (q ≥ 3). -/
theorem zqpow_pos3 {q : Z} (hq : 3 ≤ q) : ∀ n, (0 : Z) < zqpow q n
  | 0 => by norm_num [zqpow]
  | n + 1 => by
      have := zqpow_pos3 hq n
      simp only [zqpow]
      nlinarith

/-- ★★★ THE ODD OCCUPATION (∀D): every deep power of a touching split
    odd prime is a reduced leading coefficient. -/
theorem odd_tower_realized {q c₀ A x w : Z} {p : Re}
    (hA : A = 4 * c₀ - 1) (hq : q = Z.ofRe p) (hprime : PrimeRe p)
    (hq3 : 3 ≤ q)
    (htouch : x * x + x + c₀ = q * w)
    (hqndD : ¬ ZDvd q (1 - 4 * c₀)) :
    ∀ j : Nat, 1 ≤ j → 4 * (zqpow q j * zqpow q j) ≤ A →
    ∃ f : BQF, Reduced f ∧ PosDef f ∧ disc f = 1 - 4 * c₀ ∧ f.a = zqpow q j := by
  intro j hj hdeep
  -- stage j from the odd lift
  obtain ⟨b, u, hbu⟩ := hensel_odd hq hprime htouch hqndD j hj
  set M := zqpow q j with hM
  have hMpos : 0 < M := zqpow_pos3 hq3 j
  -- window-reduce b into (−M, M]
  obtain ⟨s, b', hbb, hlow, hhigh⟩ := zmod_window hMpos b
  -- divisibility survives: b'² − D = (b − 2Ms)² − D
  --   = (b² − D) − 4Msb + 4M²s² = 4M·(u − sb + Ms²)
  set cc := u - s * b + M * s * s with hcc
  have hdvd : b' * b' - (1 - 4 * c₀) = 4 * M * cc := by
    have hb' : b' = b - 2 * M * s := by linarith
    rw [hb', hcc]
    have hexp : (b - 2 * M * s) * (b - 2 * M * s) - (1 - 4 * c₀)
        = (b * b - (1 - 4 * c₀)) - 4 * M * s * b + 4 * (M * M) * (s * s) := by
      ring
    rw [hexp, hbu]
    ring
  -- gate arithmetic: c ≥ a (deepness + window)
  have hkey : b' * b' + A = 4 * M * cc := by
    have h1 : b' * b' - (1 - 4 * c₀) = 4 * M * cc := hdvd
    have h2 : A = -(1 - 4 * c₀) := by rw [hA]; ring
    linarith
  -- b'² ≥ 0... need ≥ 1? PosDef needs cc > 0: from b'² + A > 0.
  -- reduced needs cc ≥ M: 4M·cc = b'² + A ≥ 0 + 4M² (deepness: A ≥ 4M²)
  have hb'sq : (0 : Z) ≤ b' * b' := by nlinarith
  have hcpos : 0 < cc := by nlinarith
  have hcge : M ≤ cc := by nlinarith
  exact ⟨⟨M, b', cc⟩, ⟨hlow, hhigh, hcge⟩, ⟨hMpos, hcpos⟩,
    by show b' * b' - 4 * M * cc = 1 - 4 * c₀; linarith, rfl⟩

#print axioms odd_tower_realized


#print axioms zmod_window
#print axioms odd_tower_realized

end BQF
end GaussForms
end Phys.Foundation
