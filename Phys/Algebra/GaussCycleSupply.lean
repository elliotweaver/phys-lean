/-
  # THE CYCLE SUPPLY — box, tower, coprime kit, collision, peel (GQ N603a-f)

  ## What this file proves (GQ campaign, production node)

  Everything the cycle ∀-theorem consumes, welded from the bank:

  * `intRange` / `intRange_mem` — integer intervals (membership-only).
  * `chosenForm` / `boxList` / `boxList_complete` — ★ THE BOX: an explicit
    finite list containing EVERY reduced PosDef form of a given disc
    (crude bounds; c chosen classically and pinned by c_determined).
  * `power_tower` — ★★ THE POWER TOWER: every count k ≥ 1 has a k-th
    PowRel-power, PosDef, same disc (power_step_total iterated; positivity
    through the gather).
  * `primitive_chain` — primitivity rides chains (Bézout transport).
  * `zdvd_diff` / `zdvd_mul` / `zdvd_of_eq` — divisibility mini-kit.
  * `linear_crt_escape` — ★ per-prime escapes of k ↦ b·k + c combine
    (Bézout CRT, one ring identity per side).
  * `per_prime_linear_escape` / `coprime_ac_shift` / `coprime_ac_rep` — ★★
    every primitive positive-miss form is ONE SHIFT from Coprime a c.
  * `reOfNat` / `countListN` (+ length/mem/nodup) — count-list scaffold.
  * `map_not_nodup_pair` — a Nodup source with non-Nodup image collides.
  * `powers_collide` — ★★ THE COLLISION: two distinct-exponent powers
    share a reduced representative, hence chain (box list as hypothesis,
    discharged by boxList_complete).
  * `id_supply` — the principal-shape complement (CompRel g e' g, e'.a=1).
  * `collision_to_return` — ★★★ THE PEEL: a collision plus a one-step
    cancellation oracle yields a POSITIVE RETURN (strong induction,
    peeling one g per rung). The oracle is discharged in the successor
    node from the triple-associativity supply.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussPowerSupply

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

noncomputable def intRange (lo : Z) : Re → List Z
  | .void => []
  | .step n => lo :: (intRange (lo + 1) n)

theorem intRange_mem : ∀ (n : Re) (lo z : Z),
    lo ≤ z → z < lo + Z.ofRe n → z ∈ intRange lo n := by
  intro n
  induction n with
  | void =>
      intro lo z hlo hhi
      exfalso
      rw [show Z.ofRe Re.void = (0:Z) from Z.ofRe_zero, add_zero] at hhi
      linarith
  | step m ih =>
      intro lo z hlo hhi
      rcases eq_or_lt_of_le hlo with rfl | hlt
      · exact List.mem_cons_self ..
      · apply List.mem_cons_of_mem
        apply ih (lo + 1) z
        · have h1 := z_pos_ge_one (show (0:Z) < z - lo by linarith)
          linarith
        · have hsm : Re.step m = m + Re.step Re.void := by
            rw [add_step_swap]
            show Re.step m = Re.step m + Re.void
            rw [Re.add_void]
          rw [hsm, Z.ofRe_add,
            show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one] at hhi
          linarith

/- The chosen form at (a, b) for disc D: the (unique) completion when the
   disc equation is solvable, a dummy otherwise. -/
open Classical in
noncomputable def chosenForm (D a b : Z) : BQF :=
  if h : ∃ c : Z, disc (⟨a, b, c⟩ : BQF) = D then ⟨a, b, Classical.choose h⟩
  else ⟨1, 0, 1⟩

/-- ★ THE BOX LIST for disc D with count data n (Z.ofRe n = −D):
    all chosen forms over the crude (a, b) box. -/
noncomputable def boxList (D : Z) (n : Re) : List BQF :=
  ((intRange 1 n).map (fun a =>
    (intRange (-(Z.ofRe n)) (n + n + Re.step Re.void)).map (fun b =>
      chosenForm D a b))).flatten

/-- ★★ COMPLETENESS: every reduced PosDef form of disc D is IN the box
    list (with n presenting −D). -/
theorem boxList_complete {D : Z} {n : Re} (hn : Z.ofRe n = -D)
    {f : BQF} (hred : Reduced f) (hpos : PosDef f) (hdisc : disc f = D) :
    f ∈ boxList D n := by
  -- bounds: 1 ≤ f.a ≤ −D; −(−D) ≤ f.b < −D + 1 (crude from |b| ≤ a ≤ −D)
  have ha1 : (1 : Z) ≤ f.a := z_pos_ge_one hpos.1
  have hsm : (3 : Z) * (f.a * f.a) ≤ -D := by
    have h := shallow_miss hred hpos
    rw [hdisc] at h
    exact h
  -- 3·a² ≤ −D and a ≥ 1 ⟹ a ≤ −D (a ≤ a² ≤ 3a²/3... crude: a ≤ 3a² since
  -- a ≥ 1 ⟹ a ≤ a·a ≤ 3(a·a); and 3a² ≤ −D)
  have haD : f.a ≤ -D := by
    have h1 : f.a ≤ f.a * f.a := by nlinarith
    nlinarith
  -- b window: −a < b ≤ a  (Reduced = ⟨−a<b, b≤a, a≤c⟩)
  obtain ⟨hbw1, hbw2, hbw3⟩ := hred
  have hblo : -(-D) ≤ f.b := by nlinarith
  have hbhi : f.b ≤ -D := by nlinarith
  -- membership in the two ranges
  have hamem : f.a ∈ intRange 1 n := by
    apply intRange_mem n 1 f.a ha1
    rw [hn]
    linarith
  have hbmem : f.b ∈ intRange (-(Z.ofRe n)) (n + n + Re.step Re.void) := by
    apply intRange_mem
    · rw [hn]
      linarith
    · -- f.b < −ofRe n + ofRe (n + n + 1) = −(−D) + (−D) + (−D) + 1 = −D + 1
      have hadd : Z.ofRe (n + n + Re.step Re.void)
          = Z.ofRe n + Z.ofRe n + 1 := by
        rw [Z.ofRe_add, Z.ofRe_add,
          show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
      rw [hadd, hn]
      linarith
  -- assemble flatMap membership
  apply List.mem_flatten.mpr
  refine ⟨(intRange (-(Z.ofRe n)) (n + n + Re.step Re.void)).map
      (fun b => chosenForm D f.a b), ?_, ?_⟩
  · exact List.mem_map.mpr ⟨f.a, hamem, rfl⟩
  apply List.mem_map.mpr
  refine ⟨f.b, hbmem, ?_⟩
  -- chosenForm D f.a f.b = f  (the disc equation is solvable — by f.c!)
  unfold chosenForm
  have hex : ∃ c : Z, disc (⟨f.a, f.b, c⟩ : BQF) = D := by
    refine ⟨f.c, ?_⟩
    have hf : (⟨f.a, f.b, f.c⟩ : BQF) = f := rfl
    rw [hf]
    exact hdisc
  rw [dif_pos hex]
  -- the chosen c equals f.c by c_determined
  have hcd : disc (⟨f.a, f.b, Classical.choose hex⟩ : BQF) = D :=
    Classical.choose_spec hex
  have hane : f.a ≠ 0 := by linarith
  have hceq : Classical.choose hex = f.c := by
    have h1 : (⟨f.a, f.b, Classical.choose hex⟩ : BQF).c
        = (⟨f.a, f.b, f.c⟩ : BQF).c := by
      apply c_determined (f := ⟨f.a, f.b, Classical.choose hex⟩)
        (g := ⟨f.a, f.b, f.c⟩) hane rfl rfl
      show disc (⟨f.a, f.b, Classical.choose hex⟩ : BQF)
          = disc (⟨f.a, f.b, f.c⟩ : BQF)
      rw [hcd]
      have hf : (⟨f.a, f.b, f.c⟩ : BQF) = f := rfl
      rw [hf, hdisc]
    exact h1
  rw [hceq]


/-- ★★ THE POWER TOWER: every count ≥ 1 has a PosDef same-disc power. -/
theorem power_tower {g : BQF} (hprim : Primitive g) (hpos : PosDef g)
    (hDneg : disc g < 0) :
    ∀ k : Re, ∃ hk : BQF, PowRel g (Re.step k) hk ∧ PosDef hk ∧
      disc hk = disc g := by
  intro k
  induction k with
  | void =>
      exact ⟨g, PowRel.one (Chain.refl g), hpos, rfl⟩
  | step k ih =>
      obtain ⟨hk, hpow, hkpos, hkdisc⟩ := ih
      -- climb one rung: compose g with hk
      obtain ⟨f', h', hchf, hcomp⟩ := power_step_total hprim hpos hDneg
        (by rw [hkdisc]) hkpos.1
      -- CompRel g hk h' via congr back through the chain
      have hcomp' : CompRel g hk h' :=
        compRel_congr (chainSymm hchf) (Chain.refl _) (Chain.refl _) hcomp
      refine ⟨h', PowRel.succ hpow hcomp', ?_, ?_⟩
      · -- PosDef h': through the gather's positivity
        obtain ⟨a1, a2, B, t, al, be, hbez, hne, hcf, hcg, hch⟩ := hcomp'
        -- branch misses positive: a1 = miss of a chain-image of g;
        -- PosDef g rides to the presentation ⟨a1, B, a2t⟩
        have hp1 : PosDef (⟨a1, B, a2 * t⟩ : BQF) := chain_posdef hcf hpos hDneg
        have hp2 : PosDef (⟨a2, B, a1 * t⟩ : BQF) :=
          chain_posdef hcg hkpos (by rw [hkdisc]; exact hDneg)
        have hga : 0 < a1 * a2 := mul_pos hp1.1 hp2.1
        -- gather disc = disc g (through the f-branch chain)
        have hgd : disc (gatherForm a1 a2 B t) = disc g := by
          have h1d : disc (gatherForm a1 a2 B t)
              = disc (⟨a1, B, a2 * t⟩ : BQF) := by
            unfold disc gatherForm
            ring
          rw [h1d, ← disc_eq hcf]
        have hgp : PosDef (gatherForm a1 a2 B t) :=
          posdef_of_pos_a_neg_disc (by
            show (0 : Z) < a1 * a2
            exact hga) (by rw [hgd]; exact hDneg)
        exact chain_posdef hch hgp (by rw [hgd]; exact hDneg)
      · -- disc h' = disc g
        obtain ⟨a1, a2, B, t, al, be, hbez, hne, hcf, hcg, hch⟩ := hcomp'
        have h1d : disc (gatherForm a1 a2 B t)
            = disc (⟨a1, B, a2 * t⟩ : BQF) := by
          unfold disc gatherForm
          ring
        rw [← disc_eq hch, h1d, ← disc_eq hcf]


/-- Primitivity rides chains (Bézout transport through each move). -/
theorem primitive_chain {f g : BQF} (hch : Chain f g) (hp : Primitive f) :
    Primitive g := by
  induction hch with
  | refl f => exact hp
  | @shift f' h' k t ih =>
      apply ih
      obtain ⟨u, v, w, huvw⟩ := hp
      refine ⟨u - 2 * v * k + w * k * k, v - w * k, w, ?_⟩
      show (u - 2 * v * k + w * k * k) * f'.a
        + (v - w * k) * (f'.b + 2 * f'.a * k)
        + w * (f'.a * k * k + f'.b * k + f'.c) = 1
      calc (u - 2 * v * k + w * k * k) * f'.a
          + (v - w * k) * (f'.b + 2 * f'.a * k)
          + w * (f'.a * k * k + f'.b * k + f'.c)
          = u * f'.a + v * f'.b + w * f'.c := by ring
        _ = 1 := huvw
  | @swap f' h' t ih =>
      apply ih
      obtain ⟨u, v, w, huvw⟩ := hp
      refine ⟨w, -v, u, ?_⟩
      show w * f'.c + (-v) * (-f'.b) + u * f'.a = 1
      calc w * f'.c + (-v) * (-f'.b) + u * f'.a
          = u * f'.a + v * f'.b + w * f'.c := by ring
        _ = 1 := huvw

/-- Divisibility mini-kit. -/
theorem zdvd_diff {q x y : Z} (hx : ZDvd q x) (hy : ZDvd q y) :
    ZDvd q (x - y) := by
  obtain ⟨cx, hcx⟩ := hx
  obtain ⟨cy, hcy⟩ := hy
  exact ⟨cx - cy, by rw [hcx, hcy]; ring⟩

theorem zdvd_mul {q x : Z} (hx : ZDvd q x) (m : Z) : ZDvd q (x * m) := by
  obtain ⟨c, hc⟩ := hx
  exact ⟨c * m, by rw [hc]; ring⟩

theorem zdvd_of_eq {q x y : Z} (h : x = y) (hx : ZDvd q x) : ZDvd q y :=
  h ▸ hx

/-- ★ THE LINEAR CRT ESCAPE: per-prime escapes of k ↦ b·k + c on a
    pairwise-coprime list combine into ONE escaping k. -/
theorem linear_crt_escape (b c : Z) : ∀ qs : List Z, PairwiseCop qs →
    (∀ q ∈ qs, ∃ k, ¬ ZDvd q (b * k + c)) →
    ∃ k, ∀ q ∈ qs, ¬ ZDvd q (b * k + c) := by
  intro qs
  induction qs with
  | nil =>
      intro _ _
      exact ⟨0, fun q hq => absurd hq (List.not_mem_nil)⟩
  | cons q rs ih =>
      intro hpc hesc
      obtain ⟨hqr, hpcrs⟩ := hpc
      obtain ⟨kq, hkq⟩ := hesc q (List.mem_cons_self ..)
      obtain ⟨krs, hkrs⟩ := ih hpcrs
        (fun r hr => hesc r (List.mem_cons_of_mem q hr))
      -- Bézout: q coprime to the tail product
      have hcopM : Coprime q (zListProd rs) :=
        coprime_of_coprime_all rs (fun r hr => coprime_symm (hqr r hr))
      obtain ⟨al, be, hab⟩ := hcopM
      set M := zListProd rs with hM
      refine ⟨kq * (be * M) + krs * (al * q), ?_⟩
      intro r hr
      rcases List.mem_cons.mp hr with rfl | hrmem
      · -- the q-side (subst has renamed q := r): k ≡ kq (mod r)
        intro hdvd
        apply hkq
        have hdiff : b * (kq * (be * M) + krs * (al * r)) + c - (b * kq + c)
            = r * (b * (krs * al - kq * al)) := by
          have h1 : be * M = 1 - al * r := by linarith [hab]
          rw [h1]
          ring
        have : ZDvd r (b * kq + c) := by
          have hsub := zdvd_diff hdvd ⟨b * (krs * al - kq * al), hdiff⟩
          apply zdvd_of_eq _ hsub
          ring
        exact this
      · -- the r-side: k ≡ krs (mod r), r ∣ M
        intro hdvd
        apply hkrs r hrmem
        obtain ⟨cM, hcM⟩ := mem_dvd_zListProd hrmem
        have hdiff : b * (kq * (be * M) + krs * (al * q)) + c - (b * krs + c)
            = r * (b * be * cM * (kq - krs)) := by
          have h1 : al * q = 1 - be * M := by linarith [hab]
          rw [h1, hM] at *
          calc b * (kq * (be * zListProd rs) + krs * (1 - be * zListProd rs)) + c
              - (b * krs + c)
              = b * be * zListProd rs * (kq - krs) := by ring
            _ = r * (b * be * cM * (kq - krs)) := by rw [hcM]; ring
        have hsub := zdvd_diff hdvd ⟨b * be * cM * (kq - krs), hdiff⟩
        apply zdvd_of_eq _ hsub
        ring

/-- Per-prime escape: for prime q ∣ a of a primitive form, k = 0 or 1
    escapes b·k + c mod q. -/
theorem per_prime_linear_escape {f : BQF} (hprim : Primitive f)
    {q : Z} {p : Re} (hq : q = Z.ofRe p) (hp : PrimeRe p)
    (hqa : ZDvd q f.a) :
    ∃ k, ¬ ZDvd q (f.b * k + f.c) := by
  by_cases hc : ZDvd q f.c
  · -- q ∣ c: then k = 1 (else q ∣ b too, killing the Bézout witness)
    refine ⟨1, ?_⟩
    intro hbc
    -- q ∣ b·1 + c and q ∣ c ⟹ q ∣ b
    have hb : ZDvd q f.b := by
      have hsub := zdvd_diff hbc hc
      apply zdvd_of_eq _ hsub
      ring
    -- q ∣ a, b, c ⟹ q ∣ 1
    obtain ⟨u, v, w, huvw⟩ := hprim
    apply prime_not_dvd_one hq hp
    obtain ⟨ca, hca⟩ := hqa
    obtain ⟨cb, hcb⟩ := hb
    obtain ⟨cc, hcc⟩ := hc
    exact ⟨u * ca + v * cb + w * cc, by
      rw [← huvw, hca, hcb, hcc]
      ring⟩
  · exact ⟨0, by
      intro h0
      apply hc
      apply zdvd_of_eq _ h0
      ring⟩

/-- ★★ THE COPRIME-(a,c) SHIFT: every primitive positive-miss form has a
    shift whose outer coefficients are coprime. -/
theorem coprime_ac_shift {f : BQF} (hprim : Primitive f) (ha : 0 < f.a) :
    ∃ k, Coprime f.a (eval f k 1) := by
  obtain ⟨qs, hqs, hprimes⟩ := z_prime_data ha
  -- dedup for pairwise coprimality
  have hprimes' : ∀ q ∈ dedupZ qs, ∃ p : Re, q = Z.ofRe p ∧ PrimeRe p :=
    fun q hq => hprimes q (dedupZ_subset hq)
  have hpc : PairwiseCop (dedupZ qs) :=
    pairwiseCop_of_nodup_primes hprimes' (dedupZ_nodup qs)
  -- per-prime escapes on the dedup
  have hesc : ∀ q ∈ dedupZ qs, ∃ k, ¬ ZDvd q (f.b * k + f.c) := by
    intro q hq
    obtain ⟨p, hqp, hp⟩ := hprimes' q hq
    have hqa : ZDvd q f.a := by
      rw [hqs]
      exact mem_dvd_zListProd (dedupZ_subset hq)
    exact per_prime_linear_escape hprim hqp hp hqa
  obtain ⟨k, hk⟩ := linear_crt_escape f.b f.c (dedupZ qs) hpc hesc
  refine ⟨k, ?_⟩
  -- Coprime a V where V := eval f k 1
  apply coprime_symm
  rw [hqs]
  apply coprime_of_coprime_all
  intro q hqmem
  -- q prime, q ∣ a, linear escape ⟹ eval escape ⟹ Coprime q V
  obtain ⟨p, hqp, hp⟩ := hprimes q hqmem
  have hqd : q ∈ dedupZ qs := dedupZ_mem hqmem
  have hqa : ZDvd q f.a := by
    rw [hqs]
    exact mem_dvd_zListProd hqmem
  -- eval escape: eval = a·k² + (b·k + c); q ∣ a ⟹ divisibility transfers
  have hevesc : ¬ ZDvd q (eval f k 1) := by
    intro hev
    apply hk q hqd
    have hak2 : ZDvd q (f.a * (k * k)) := zdvd_mul hqa (k * k)
    have hsub := zdvd_diff hev hak2
    apply zdvd_of_eq _ hsub
    unfold eval
    ring
  -- Coprime q V via gcd data + classification
  obtain ⟨g, hgpos, ⟨c1, hc1⟩, ⟨c2, hc2⟩, aq, bq, hbq⟩ :=
    gcd_bezout_exists q (eval f k 1) (prime_ne_zero hqp hp)
  exact coprime_of_prime_not_dvd ⟨c2, hc2⟩ hbq
    (prime_divisor_classification hqp hp hgpos ⟨c1, hc1⟩) hevesc

/-- ★★ THE COPRIME-(a,c) REPRESENTATIVE: one shift away, same miss. -/
theorem coprime_ac_rep {f : BQF} (hprim : Primitive f) (ha : 0 < f.a) :
    ∃ f₀ : BQF, Chain f f₀ ∧ f₀.a = f.a ∧ Coprime f₀.a f₀.c := by
  obtain ⟨k, hk⟩ := coprime_ac_shift hprim ha
  refine ⟨shiftF k f, of_shift k f, rfl, ?_⟩
  have hcc : (shiftF k f).c = eval f k 1 := by
    unfold shiftF eval
    ring_nf
  have haa : (shiftF k f).a = f.a := rfl
  rw [haa, hcc]
  exact hk


/-- Nat → Re scaffold (List.length is Nat; the FINAL statements quantify
    only over Re — this is bookkeeping, not content). -/
def reOfNat : Nat → Re
  | 0 => Re.void
  | n + 1 => Re.step (reOfNat n)

theorem reOfNat_injective : ∀ {m n : Nat}, reOfNat m = reOfNat n → m = n := by
  intro m
  induction m with
  | zero =>
      intro n h
      cases n with
      | zero => rfl
      | succ k => exact absurd h.symm (Re.step_ne_void _)
  | succ m ih =>
      intro n h
      cases n with
      | zero => exact absurd h (Re.step_ne_void _)
      | succ k =>
          have := Re.step_inj h
          rw [ih this]

/-- The count list 1..m (as reOfNat images, descending). -/
def countListN : Nat → List Re
  | 0 => []
  | m + 1 => reOfNat (m + 1) :: countListN m

theorem countListN_length : ∀ m, (countListN m).length = m := by
  intro m
  induction m with
  | zero => rfl
  | succ m ih =>
      show (countListN m).length + 1 = m + 1
      rw [ih]

theorem countListN_mem_le : ∀ {m : Nat} {k : Re}, k ∈ countListN m →
    ∃ j : Nat, j + 1 ≤ m ∧ k = reOfNat (j + 1) := by
  intro m
  induction m with
  | zero => intro k h; exact absurd h (List.not_mem_nil)
  | succ m ih =>
      intro k h
      rcases List.mem_cons.mp h with rfl | h2
      · exact ⟨m, Nat.le_refl _, rfl⟩
      · obtain ⟨j, hj, hk⟩ := ih h2
        exact ⟨j, Nat.le_succ_of_le hj, hk⟩

theorem countListN_nodup : ∀ m, (countListN m).Nodup := by
  intro m
  induction m with
  | zero => exact List.nodup_nil
  | succ m ih =>
      refine List.nodup_cons.mpr ⟨?_, ih⟩
      intro hmem
      obtain ⟨j, hj, hk⟩ := countListN_mem_le hmem
      have := reOfNat_injective hk
      omega

/-- ★ A Nodup source with a non-Nodup image yields a genuine collision. -/
theorem map_not_nodup_pair {α β : Type} (F : α → β) :
    ∀ {ks : List α}, ks.Nodup → ¬ (ks.map F).Nodup →
    ∃ k1 ∈ ks, ∃ k2 ∈ ks, k1 ≠ k2 ∧ F k1 = F k2 := by
  intro ks
  induction ks with
  | nil =>
      intro _ h
      exact absurd List.nodup_nil h
  | cons a rs ih =>
      intro hnd hmapnd
      obtain ⟨hna, hndrs⟩ := List.nodup_cons.mp hnd
      by_cases hFa : F a ∈ rs.map F
      · obtain ⟨k2, hk2, hFk2⟩ := List.mem_map.mp hFa
        refine ⟨a, List.mem_cons_self .., k2, List.mem_cons_of_mem a hk2, ?_, hFk2.symm⟩
        intro heq
        exact hna (heq ▸ hk2)
      · have hnd2 : ¬ (rs.map F).Nodup := by
          intro hgood
          exact hmapnd (List.nodup_cons.mpr ⟨hFa, hgood⟩)
        obtain ⟨k1, hk1, k2, hk2, hne, hFeq⟩ := ih hndrs hnd2
        exact ⟨k1, List.mem_cons_of_mem a hk1, k2, List.mem_cons_of_mem a hk2,
          hne, hFeq⟩

/-- ★★ THE COLLISION: two distinct powers share a reduced representative,
    hence are chain-equivalent. Box list enters as a hypothesis. -/
theorem powers_collide {g : BQF} (hprim : Primitive g) (hpos : PosDef g)
    (hDneg : disc g < 0)
    (M : List BQF)
    (hM : ∀ f : BQF, Reduced f → PosDef f → disc f = disc g → f ∈ M) :
    ∃ i j : Re, i ≠ j ∧
    ∃ hi hj : BQF, PowRel g (Re.step i) hi ∧ PowRel g (Re.step j) hj ∧
      Chain hi hj := by
  -- the reduced-rep function on counts
  have hpow := power_tower hprim hpos hDneg
  -- F k := the chosen reduced rep of the (k+1)-th power
  let P : Re → BQF := fun k => Classical.choose (hpow k)
  have hP : ∀ k, PowRel g (Re.step k) (P k) ∧ PosDef (P k) ∧
      disc (P k) = disc g := fun k => Classical.choose_spec (hpow k)
  let R : Re → BQF := fun k =>
    Classical.choose (reduced_rep_exists (hP k).2.1 (by
      rw [(hP k).2.2]; exact hDneg))
  have hR : ∀ k, Chain (P k) (R k) ∧ Reduced (R k) ∧ PosDef (R k) ∧
      disc (R k) = disc (P k) := fun k =>
    Classical.choose_spec (reduced_rep_exists (hP k).2.1 (by
      rw [(hP k).2.2]; exact hDneg))
  -- the count list of length |M| + 1
  set m := M.length + 1 with hm
  have hlenL : (countListN m).length = m := countListN_length m
  -- every R-image is in M
  have hsub : ∀ x ∈ (countListN m).map R, x ∈ M := by
    intro x hx
    obtain ⟨k, hk, hRk⟩ := List.mem_map.mp hx
    rw [← hRk]
    exact hM (R k) (hR k).2.1 (hR k).2.2.1 (by
      rw [(hR k).2.2.2, (hP k).2.2])
  -- image not Nodup (pigeonhole)
  have hnotnd : ¬ ((countListN m).map R).Nodup := by
    intro hnd
    have := length_le_of_nodup_subset ((countListN m).map R) M hnd hsub
    rw [List.length_map, hlenL] at this
    omega
  -- the collision
  obtain ⟨k1, hk1, k2, hk2, hne, hReq⟩ :=
    map_not_nodup_pair R (countListN_nodup m) hnotnd
  refine ⟨k1, k2, hne, P k1, P k2, (hP k1).1, (hP k2).1, ?_⟩
  -- chain through the shared reduced rep
  have hc1 : Chain (P k1) (R k1) := (hR k1).1
  have hc2 : Chain (P k2) (R k2) := (hR k2).1
  rw [hReq] at hc1
  exact chainTrans hc1 (chainSymm hc2)


/-- ★ The principal-shape complement: CompRel g e' g, e'.a = 1. -/
theorem id_supply {g : BQF} (ha : g.a ≠ 0) :
    ∃ e' : BQF, e'.a = 1 ∧ CompRel g e' g := by
  refine ⟨⟨1, g.b, g.a * g.c⟩, rfl, ?_⟩
  have h := compRel_id' (a2 := g.a) (B := g.b) (c2 := g.c) ha
  have hcomm := compRel_comm h
  have hg : (⟨g.a, g.b, 1 * g.c⟩ : BQF) = g := by
    rw [one_mul]
  rw [hg] at hcomm
  exact hcomm

/-- ★★ THE PEEL: a collision of distinct-exponent powers yields a return. -/
theorem collision_to_return {g : BQF}
    (cancel : ∀ {h1 h2 H H' : BQF}, CompRel g h1 H → CompRel g h2 H' →
      Chain H H' → Chain h1 h2)
    (idsup : ∃ e', e'.a = 1 ∧ CompRel g e' g) :
    ∀ i : Re, ∀ j : Re, ∀ hi hj : BQF,
      PowRel g (Re.step i) hi → PowRel g (Re.step j) hj →
      Chain hi hj → i ≠ j →
      ∃ k : Re, ReturnSetR g (Re.step k) := by
  refine strong_induction
    (P := fun i => ∀ j : Re, ∀ hi hj : BQF,
      PowRel g (Re.step i) hi → PowRel g (Re.step j) hj →
      Chain hi hj → i ≠ j →
      ∃ k : Re, ReturnSetR g (Re.step k)) ?_
  intro i ih j hi hj hpi hpj hch hne
  obtain ⟨e', he'a, hid⟩ := idsup
  cases i with
  | void =>
      -- hi is the first power: Chain g hi
      have hgi : Chain g hi := by
        rcases powRel_split_succ hpi with ⟨_, hb⟩ | ⟨pk, hpk, _⟩
        · exact hb
        · exact absurd hpk powRel_not_void
      cases j with
      | void => exact absurd rfl hne
      | step j' =>
          -- peel hj once
          rcases powRel_split_succ hpj with ⟨hjv, _⟩ | ⟨pj, hpj', hcompj⟩
          · exact absurd hjv (Re.step_ne_void j')
          · -- Chain hj g, cancel against the identity instance
            have hjg : Chain hj g := chainSymm (chainTrans hgi hch)
            have hpe : Chain pj e' := cancel hcompj hid hjg
            exact ⟨j', pj, e', hpj', hpe, he'a⟩
  | step i' =>
      cases j with
      | void =>
          -- symmetric: IH at void < step i', roles swapped
          have hvlt : Re.void < Re.step i' :=
            lt_of_le_of_ne (Re.zero_le _) (fun h => (Re.step_ne_void i') h.symm)
          exact ih Re.void hvlt (Re.step i') hj hi hpj hpi (chainSymm hch)
            (fun h => (Re.step_ne_void i') h.symm)
      | step j' =>
          -- peel both, cancel, recurse
          rcases powRel_split_succ hpi with ⟨hiv, _⟩ | ⟨pi, hpi', hcompi⟩
          · exact absurd hiv (Re.step_ne_void i')
          rcases powRel_split_succ hpj with ⟨hjv, _⟩ | ⟨pj, hpj', hcompj⟩
          · exact absurd hjv (Re.step_ne_void j')
          have hpp : Chain pi pj := cancel hcompi hcompj hch
          have hilt : i' < Re.step i' := lt_iff_step_le.mpr (le_refl _)
          have hne' : i' ≠ j' := by
            intro h
            exact hne (by rw [h])
          exact ih i' hilt j' pi pj hpi' hpj' hpp hne'


#print axioms boxList_complete
#print axioms power_tower
#print axioms primitive_chain
#print axioms linear_crt_escape
#print axioms coprime_ac_rep
#print axioms powers_collide
#print axioms id_supply
#print axioms collision_to_return

end BQF
end GaussForms
end Phys.Foundation
