/-
  # ★★★ THE CYCLE THEOREM — Gauss's cycle length exists, always (GQ N604)

  ## What this file proves (GQ campaign, production node — HALF 1 CLOSES)

  For EVERY primitive positive-definite form of EVERY negative discriminant,
  the order — the least positive power whose class is principal, Gauss's
  cycle length — EXISTS. One unconditional ∀-theorem, no cases excluded:

  * `principal_unify` / `principal_transport` — ★ THE PRINCIPAL CLASS IS
    ONE CLASS: two miss-1 forms of one disc are chain-equivalent (records
    forced to equal parity through b² ≡ D mod 4; the odd/even clash is
    killed by discreteness).
  * `triple_concordant` — ★★ any three primitive PosDef forms of one
    negative disc admit a SIMULTANEOUS concordant presentation (pairwise-
    coprime misses, ONE record, one cofactor — two-stage branch_gather'
    union through the intermediate record).
  * `id_at` — the identity instance transported to ANY principal-shape
    complement of the right disc.
  * `inverse_supply` — ★★ every primitive PosDef g of negative disc has an
    inverse: CompRel g ginv e₀ with e₀ principal-shape (coprime_ac_rep +
    parity split + the banked inverse laws; all class data transported).
  * `bracket_data` — ★★ both bracketings of h∘g∘ginv land on ONE T
    (triple_concordant → compRel_assoc_presented → miss_split
    identifications → functionality), read as CompRel e₀ h T and
    CompRel ginv H T.
  * `cancel_oracle` — ★★★ THE CANCELLATION LAW: g∘h₁ ~ g∘h₂ ⟹ h₁ ~ h₂
    (complement_unique closed by the inverse + bracket data).
  * `powRel_posdef` — every positive power is PosDef, same disc.
  * `collision_to_return'` — ★★ THE PEEL: a collision of distinct-exponent
    powers cancels down to a POSITIVE RETURN (strong induction, one g
    stripped per rung, class data discharged at every call site).
  * `id_supply'` — the identity complement with disc data.
  * `cycle_theorem` — ★★★ THE THEOREM: ∃ h, IsOrderR g h — the collision
    (powers_collide + boxList_complete) peeled by the cancel oracle down
    to a return, the least return extracted by the banked well-ordering.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussCycleSupply

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★ THE PRINCIPAL CLASS IS ONE CLASS: two forms with miss 1 and equal
    discs are chain-equivalent (records differ by an even integer — forced
    by the shared disc's parity through b² ≡ D mod 4). -/
theorem principal_unify {b1 c1 b2 c2 : Z}
    (hdisc : disc (⟨1, b1, c1⟩ : BQF) = disc (⟨1, b2, c2⟩ : BQF)) :
    Chain (⟨1, b1, c1⟩ : BQF) (⟨1, b2, c2⟩ : BQF) := by
  -- b1² − 4c1 = b2² − 4c2 ⟹ b2² − b1² = 4(c2 − c1) ⟹ b1, b2 same parity
  have hd : b1 * b1 - 4 * 1 * c1 = b2 * b2 - 4 * 1 * c2 := by
    unfold disc at hdisc
    linarith [hdisc]
  obtain ⟨k1, hk1 | hk1⟩ := z_parity b1 <;> obtain ⟨k2, hk2 | hk2⟩ := z_parity b2
  · -- both even: b2 = b1 + 2(k2 − k1)
    apply anchored_same_record_chain one_ne_zero (k := k2 - k1)
    · rw [hk1, hk2]; ring
    · exact hdisc
  · -- b1 even, b2 odd: parity clash with hd — 4 ∣ b2² − b1² fails mod 4...
    -- b2² − b1² = 4(c2−c1); (2k2+1)² − (2k1)² = 4(k2²+k2−k1²) + 1 — odd ≠ 4·m.
    exfalso
    have : 4 * (k2 * k2 + k2 - k1 * k1) + 1 = 4 * (c2 - c1) := by
      rw [hk1, hk2] at hd
      ring_nf
      ring_nf at hd
      linarith
    -- 4m + 1 = 4n is impossible: 1 = 4(n − m)
    have h1 : (1 : Z) = 4 * (c2 - c1 - (k2 * k2 + k2 - k1 * k1)) := by ring_nf; linarith [this]
    -- |4x| ≥ 4 or = 0; 1 is neither
    rcases lt_trichotomy (c2 - c1 - (k2 * k2 + k2 - k1 * k1)) 0 with h | h | h
    · have hle : c2 - c1 - (k2 * k2 + k2 - k1 * k1) ≤ -1 := by
        have := z_pos_ge_one (show (0:Z) < -(c2 - c1 - (k2 * k2 + k2 - k1 * k1)) by linarith)
        linarith
      nlinarith
    · rw [h] at h1; norm_num at h1
    · have hge := z_pos_ge_one h
      nlinarith
  · -- b1 odd, b2 even: symmetric clash
    exfalso
    have : 4 * (k2 * k2 - k1 * k1 - k1) - 1 = 4 * (c2 - c1) := by
      rw [hk1, hk2] at hd
      ring_nf
      ring_nf at hd
      linarith
    have h1 : (1 : Z) = 4 * (k2 * k2 - k1 * k1 - k1 - (c2 - c1)) := by ring_nf; linarith [this]
    rcases lt_trichotomy (k2 * k2 - k1 * k1 - k1 - (c2 - c1)) 0 with h | h | h
    · have hle : k2 * k2 - k1 * k1 - k1 - (c2 - c1) ≤ -1 := by
        have := z_pos_ge_one (show (0:Z) < -(k2 * k2 - k1 * k1 - k1 - (c2 - c1)) by linarith)
        linarith
      nlinarith
    · rw [h] at h1; norm_num at h1
    · have hge := z_pos_ge_one h
      nlinarith
  · -- both odd
    apply anchored_same_record_chain one_ne_zero (k := k2 - k1)
    · rw [hk1, hk2]; ring
    · exact hdisc

/-- ★★ THE TRIPLE CONCORDANT PRESENTATION. -/
theorem triple_concordant {f1 f2 f3 : BQF}
    (h1p : Primitive f2) (h2p : Primitive f3)
    (hpos1 : PosDef f1) (hpos2 : PosDef f2) (hpos3 : PosDef f3)
    (hD : disc f1 < 0)
    (hd12 : disc f1 = disc f2) (hd13 : disc f1 = disc f3) :
    ∃ (a1 a2 a3 B t : Z) (g1 g2 g3 : BQF),
      a1 ≠ 0 ∧ a2 ≠ 0 ∧ a3 ≠ 0 ∧
      Coprime a1 a2 ∧ Coprime a1 a3 ∧ Coprime a2 a3 ∧
      Chain f1 g1 ∧ Chain f2 g2 ∧ Chain f3 g3 ∧
      g1 = (⟨a1, B, (a2 * a3) * t⟩ : BQF) ∧
      g2 = (⟨a2, B, (a1 * a3) * t⟩ : BQF) ∧
      g3 = (⟨a3, B, (a1 * a2) * t⟩ : BQF) := by
  -- 1. a1 := f1.a
  set a1 := f1.a with ha1
  have ha1pos : 0 < a1 := hpos1.1
  -- 2. f2's rep coprime to a1
  obtain ⟨qs1, hqs1, hprimes1⟩ := z_prime_data ha1pos
  obtain ⟨f2', hch2, hcop21⟩ := coprime_rep_to_target h1p qs1 hqs1 hprimes1
  set a2 := f2'.a with ha2
  have hpos2' : PosDef f2' := chain_posdef hch2 hpos2 (by rw [← hd12]; exact hD)
  have ha2pos : 0 < a2 := hpos2'.1
  -- 3. f3's rep coprime to a1·a2
  have ha12pos : 0 < a1 * a2 := mul_pos ha1pos ha2pos
  obtain ⟨qs2, hqs2, hprimes2⟩ := z_prime_data ha12pos
  obtain ⟨f3', hch3, hcop3⟩ := coprime_rep_to_target h2p qs2 hqs2 hprimes2
  set a3 := f3'.a with ha3
  have hpos3' : PosDef f3' := chain_posdef hch3 hpos3 (by rw [← hd13]; exact hD)
  have ha3pos : 0 < a3 := hpos3'.1
  -- split Coprime a3 (a1a2) into the two factors (divisor transfer)
  have hcop31 : Coprime a3 a1 :=
    coprime_symm (coprime_of_dvd_coprime hcop3 ⟨a2, rfl⟩)
  have hcop32 : Coprime a3 a2 :=
    coprime_symm (coprime_of_dvd_coprime hcop3 ⟨a1, by ring⟩)
  -- 4. branch records (disc identities) and the two-stage union
  set D := disc f1 with hDdef
  have hr1 : BranchRec D a1 f1.b := form_branchRec f1
  have hr2 : BranchRec D a2 f2'.b := by
    have h := form_branchRec f2'
    rw [← disc_eq hch2, ← hd12] at h
    exact h
  have hr3 : BranchRec D a3 f3'.b := by
    have h := form_branchRec f3'
    rw [← disc_eq hch3, ← hd13] at h
    exact h
  have hcop12 : Coprime a1 a2 := coprime_symm hcop21
  -- stage 1: unite (a1, a2)
  obtain ⟨B12, ⟨k1, hk1⟩, ⟨k2, hk2⟩, hr12⟩ :=
    branch_gather' hcop12 hr1 hr2 (records_parity_agree hr1 hr2)
  -- stage 2: unite (a1a2, a3)
  have hcop123 : Coprime (a1 * a2) a3 := coprime_symm hcop3
  obtain ⟨B, ⟨k12, hk12⟩, ⟨k3, hk3⟩, hrB⟩ :=
    branch_gather' hcop123 hr12 hr3 (records_parity_agree hr12 hr3)
  -- B's per-factor congruences (through B12)
  have hB1 : ∃ m, B = f1.b + 2 * a1 * m := by
    refine ⟨k1 + a2 * k12, ?_⟩
    rw [hk12, hk1]
    ring
  have hB2 : ∃ m, B = f2'.b + 2 * a2 * m := by
    refine ⟨k2 + a1 * k12, ?_⟩
    rw [hk12, hk2]
    ring
  -- the cofactor: B² − D = 4·(a1a2a3)·t
  obtain ⟨t, ht⟩ := hrB
  -- 5. the presentation forms and their chains
  have ha1ne : a1 ≠ 0 := ne_of_gt ha1pos
  have ha2ne : a2 ≠ 0 := ne_of_gt ha2pos
  have ha3ne : a3 ≠ 0 := ne_of_gt ha3pos
  -- chain f1 → (a1, B, (a2a3)t)
  obtain ⟨m1, hm1⟩ := hB1
  have hg1 : Chain f1 (⟨a1, B, (a2 * a3) * t⟩ : BQF) := by
    have hf1 : f1 = (⟨f1.a, f1.b, f1.c⟩ : BQF) := rfl
    rw [hf1]
    apply anchored_same_record_chain ha1ne hm1
    · -- disc equality: both equal D
      have hl : disc (⟨f1.a, f1.b, f1.c⟩ : BQF) = D := by rw [← hf1]
      have hrr : disc (⟨a1, B, (a2 * a3) * t⟩ : BQF) = D := by
        unfold disc
        have : B * B - 4 * a1 * ((a2 * a3) * t)
            = B * B - 4 * (a1 * a2 * a3) * t := by ring
        rw [this]
        linarith [ht]
      rw [hl, hrr]
  obtain ⟨m2, hm2⟩ := hB2
  have hg2 : Chain f2 (⟨a2, B, (a1 * a3) * t⟩ : BQF) := by
    apply chainTrans hch2
    have hf2 : f2' = (⟨f2'.a, f2'.b, f2'.c⟩ : BQF) := rfl
    rw [hf2]
    apply anchored_same_record_chain ha2ne hm2
    · have hl : disc (⟨f2'.a, f2'.b, f2'.c⟩ : BQF) = D := by
        rw [← hf2, ← disc_eq hch2, ← hd12]
      have hrr : disc (⟨a2, B, (a1 * a3) * t⟩ : BQF) = D := by
        unfold disc
        have : B * B - 4 * a2 * ((a1 * a3) * t)
            = B * B - 4 * (a1 * a2 * a3) * t := by ring
        rw [this]
        linarith [ht]
      rw [hl, hrr]
  have hg3 : Chain f3 (⟨a3, B, (a1 * a2) * t⟩ : BQF) := by
    apply chainTrans hch3
    have hf3 : f3' = (⟨f3'.a, f3'.b, f3'.c⟩ : BQF) := rfl
    rw [hf3]
    apply anchored_same_record_chain ha3ne hk3
    · have hl : disc (⟨f3'.a, f3'.b, f3'.c⟩ : BQF) = D := by
        rw [← hf3, ← disc_eq hch3, ← hd13]
      have hrr : disc (⟨a3, B, (a1 * a2) * t⟩ : BQF) = D := by
        unfold disc
        have : B * B - 4 * a3 * ((a1 * a2) * t)
            = B * B - 4 * (a1 * a2 * a3) * t := by ring
        rw [this]
        linarith [ht]
      rw [hl, hrr]
  exact ⟨a1, a2, a3, B, t, _, _, _, ha1ne, ha2ne, ha3ne,
    hcop12, coprime_symm hcop31, coprime_symm hcop32,
    hg1, hg2, hg3, rfl, rfl, rfl⟩

/-- ★ Principal transport: two miss-1 forms of one disc are chain-equal. -/
theorem principal_transport {e₀ e₁ : BQF}
    (h0 : e₀.a = 1) (h1 : e₁.a = 1) (hd : disc e₀ = disc e₁) :
    Chain e₀ e₁ := by
  obtain ⟨a0, b0, c0⟩ := e₀
  obtain ⟨a1', b1', c1'⟩ := e₁
  have ha0 : a0 = 1 := h0
  have ha1 : a1' = 1 := h1
  subst ha0
  subst ha1
  exact principal_unify hd

/-- ★ The identity instance AT e₀: any principal-shape e₀ of h's disc
    composes with h to h. -/
theorem id_at {e₀ h : BQF} (he : e₀.a = 1) (hde : disc e₀ = disc h)
    (hane : h.a ≠ 0) : CompRel e₀ h h := by
  have hid := compRel_id' (a2 := h.a) (B := h.b) (c2 := h.c) hane
  have hh'' : (⟨h.a, h.b, 1 * h.c⟩ : BQF) = h := by
    rw [one_mul]
  rw [hh''] at hid
  -- hid : CompRel ⟨1, h.b, h.a * h.c⟩ h h
  have hd1' : disc (⟨1, h.b, h.a * h.c⟩ : BQF) = disc h := by
    unfold disc
    ring
  have hch : Chain e₀ (⟨1, h.b, h.a * h.c⟩ : BQF) :=
    principal_transport he rfl (hde.trans hd1'.symm)
  exact compRel_congr (chainSymm hch) (Chain.refl h) (Chain.refl h) hid

/-- ★★ THE INVERSE SUPPLY: ginv and principal e₀ with CompRel g ginv e₀,
    all class data transported. -/
theorem inverse_supply {g : BQF} (hprim : Primitive g) (hpos : PosDef g)
    (hD : disc g < 0) :
    ∃ ginv e₀ : BQF, PosDef ginv ∧ Primitive ginv ∧ disc ginv = disc g ∧
      e₀.a = 1 ∧ disc e₀ = disc g ∧ CompRel g ginv e₀ := by
  obtain ⟨g₀, hch₀, ha₀eq, hcop₀⟩ := coprime_ac_rep hprim hpos.1
  have hpos₀ : PosDef g₀ := chain_posdef hch₀ hpos hD
  have hprim₀ : Primitive g₀ := primitive_chain hch₀ hprim
  have hdisc₀ : disc g₀ = disc g := (disc_eq hch₀).symm
  obtain ⟨al, be, hbez⟩ := hcop₀
  have hne : g₀.a * g₀.c ≠ 0 := ne_of_gt (mul_pos hpos₀.1 hpos₀.2)
  obtain ⟨u, v, w, huvw⟩ := hprim₀
  obtain ⟨m, hm | hm⟩ := z_parity g₀.b
  · -- EVEN record
    have hinv := compRel_inv_even (a := g₀.a) (c := g₀.c) (m := m) hbez hne
    have hfe : (⟨g₀.a, 2 * m, g₀.c * 1⟩ : BQF) = g₀ := by
      rw [mul_one, ← hm]
    rw [hfe] at hinv
    -- hinv : CompRel g₀ ⟨g₀.c, 2m, g₀.a*1⟩ ⟨1, 0, g₀.a*g₀.c − m*m⟩
    refine ⟨⟨g₀.c, 2 * m, g₀.a * 1⟩, ⟨1, 0, g₀.a * g₀.c - m * m⟩,
      ⟨hpos₀.2, ?_⟩, ⟨w, v, u, ?_⟩, ?_, rfl, ?_, ?_⟩
    · show (0 : Z) < g₀.a * 1
      rw [mul_one]
      exact hpos₀.1
    · show w * g₀.c + v * (2 * m) + u * (g₀.a * 1) = 1
      calc w * g₀.c + v * (2 * m) + u * (g₀.a * 1)
          = u * g₀.a + v * (2 * m) + w * g₀.c := by ring
        _ = u * g₀.a + v * g₀.b + w * g₀.c := by rw [← hm]
        _ = 1 := huvw
    · show disc (⟨g₀.c, 2 * m, g₀.a * 1⟩ : BQF) = disc g
      rw [← hdisc₀]
      unfold disc
      rw [hm]
      ring
    · show disc (⟨1, 0, g₀.a * g₀.c - m * m⟩ : BQF) = disc g
      rw [← hdisc₀]
      unfold disc
      rw [hm]
      ring
    · exact compRel_congr (chainSymm hch₀) (Chain.refl _) (Chain.refl _) hinv
  · -- ODD record
    have hinv := compRel_inv_odd (a := g₀.a) (c := g₀.c) (m := m) hbez hne
    have hfe : (⟨g₀.a, 2 * m + 1, g₀.c * 1⟩ : BQF) = g₀ := by
      rw [mul_one, ← hm]
    rw [hfe] at hinv
    refine ⟨⟨g₀.c, 2 * m + 1, g₀.a * 1⟩, ⟨1, 1, g₀.a * g₀.c - m * m - m⟩,
      ⟨hpos₀.2, ?_⟩, ⟨w, v, u, ?_⟩, ?_, rfl, ?_, ?_⟩
    · show (0 : Z) < g₀.a * 1
      rw [mul_one]
      exact hpos₀.1
    · show w * g₀.c + v * (2 * m + 1) + u * (g₀.a * 1) = 1
      calc w * g₀.c + v * (2 * m + 1) + u * (g₀.a * 1)
          = u * g₀.a + v * (2 * m + 1) + w * g₀.c := by ring
        _ = u * g₀.a + v * g₀.b + w * g₀.c := by rw [← hm]
        _ = 1 := huvw
    · show disc (⟨g₀.c, 2 * m + 1, g₀.a * 1⟩ : BQF) = disc g
      rw [← hdisc₀]
      unfold disc
      rw [hm]
      ring
    · show disc (⟨1, 1, g₀.a * g₀.c - m * m - m⟩ : BQF) = disc g
      rw [← hdisc₀]
      unfold disc
      rw [hm]
      ring
    · exact compRel_congr (chainSymm hch₀) (Chain.refl _) (Chain.refl _) hinv

/-- ★★ BRACKET DATA: both bracketings of h∘g∘ginv land on one T, read as
    CompRel e₀ h T (right) and CompRel ginv H T (left). -/
theorem bracket_data {g ginv e₀ h H : BQF}
    (hgprim : Primitive g) (hgpos : PosDef g) (hD : disc g < 0)
    (hgi_prim : Primitive ginv) (hgi_pos : PosDef ginv)
    (hgi_disc : disc ginv = disc g)
    (hcge : CompRel g ginv e₀)
    (hpos : PosDef h) (hd : disc g = disc h)
    (hcH : CompRel g h H) :
    ∃ T, CompRel e₀ h T ∧ CompRel ginv H T := by
  have hDh : disc h < 0 := by rw [← hd]; exact hD
  obtain ⟨a1, a2, a3, B, t, g1, g2, g3, ha1ne, ha2ne, ha3ne,
    hcop12, hcop13, hcop23, hg1, hg2, hg3, hge1, hge2, hge3⟩ :=
    triple_concordant (f1 := h) (f2 := g) (f3 := ginv)
      hgprim hgi_prim hpos hgpos hgi_pos hDh hd.symm
      (hd.symm.trans hgi_disc.symm)
  subst hge1
  subst hge2
  subst hge3
  -- presented-miss positivity
  have hp1 := chain_posdef hg1 hpos hDh
  have hp2 := chain_posdef hg2 hgpos hD
  have hp3 := chain_posdef hg3 hgi_pos (by rw [hgi_disc]; exact hD)
  have ha1pos : 0 < a1 := hp1.1
  have ha2pos : 0 < a2 := hp2.1
  have ha3pos : 0 < a3 := hp3.1
  have hne123 : a1 * a2 * a3 ≠ 0 :=
    ne_of_gt (mul_pos (mul_pos ha1pos ha2pos) ha3pos)
  -- Bézout for the two bracketings
  obtain ⟨al12, be12, h12⟩ :=
    coprime_symm (coprime_mul (coprime_symm hcop13) (coprime_symm hcop23))
  obtain ⟨al3, be3, h23⟩ := coprime_mul hcop12 hcop13
  obtain ⟨hbrL, hbrR, hTeq⟩ := compRel_assoc_presented
    (B := B) (t := t) h12 h23 hne123
  rw [← hTeq] at hbrR
  set T := gatherForm (a1 * a2) a3 B t with hT
  -- (i) the (h, g) pair-gather is H's class
  obtain ⟨al', be', hb12⟩ := hcop12
  have hne12 : a1 * a2 ≠ 0 := ne_of_gt (mul_pos ha1pos ha2pos)
  have hms12 := miss_split (b := B) (c := a3 * t) hb12 hne12
  have em1 : (⟨a1, B, (a2 * a3) * t⟩ : BQF) = ⟨a1, B, a2 * (a3 * t)⟩ := by
    rw [mul_assoc]
  have em2 : (⟨a2, B, (a1 * a3) * t⟩ : BQF) = ⟨a2, B, a1 * (a3 * t)⟩ := by
    rw [mul_assoc]
  have hg1' := em1 ▸ hg1
  have hg2' := em2 ▸ hg2
  have hG12 : CompRel h g (⟨a1 * a2, B, a3 * t⟩ : BQF) :=
    compRel_congr (chainSymm hg1') (chainSymm hg2') (Chain.refl _) hms12
  have hHG12 : Chain H (⟨a1 * a2, B, a3 * t⟩ : BQF) :=
    compRel_functional hcH (compRel_comm hG12)
  -- (ii) CompRel ginv H T from the LEFT bracketing
  have step2 : CompRel H ginv T :=
    compRel_congr (chainSymm hHG12) (chainSymm hg3) (Chain.refl _) hbrL
  have hTR : CompRel ginv H T := compRel_comm step2
  -- (iii) the (g, ginv) pair-gather is e₀'s class
  obtain ⟨al'', be'', hb23⟩ := hcop23
  have hne23 : a2 * a3 ≠ 0 := ne_of_gt (mul_pos ha2pos ha3pos)
  have hms23 := miss_split (b := B) (c := a1 * t) hb23 hne23
  have em3 : (⟨a2, B, (a1 * a3) * t⟩ : BQF) = ⟨a2, B, a3 * (a1 * t)⟩ := by
    rw [show ((a1 * a3) * t : Z) = a3 * (a1 * t) from by ring]
  have em4 : (⟨a3, B, (a1 * a2) * t⟩ : BQF) = ⟨a3, B, a2 * (a1 * t)⟩ := by
    rw [show ((a1 * a2) * t : Z) = a2 * (a1 * t) from by ring]
  have hg2'' := em3 ▸ hg2
  have hg3'' := em4 ▸ hg3
  have hG23 : CompRel g ginv (⟨a2 * a3, B, a1 * t⟩ : BQF) :=
    compRel_congr (chainSymm hg2'') (chainSymm hg3'') (Chain.refl _) hms23
  have hG23e : Chain (⟨a2 * a3, B, a1 * t⟩ : BQF) e₀ :=
    compRel_functional hG23 hcge
  -- (iv) CompRel e₀ h T from the RIGHT bracketing
  have step4 : CompRel h e₀ T :=
    compRel_congr (chainSymm hg1) hG23e (Chain.refl _) hbrR
  exact ⟨T, compRel_comm step4, hTR⟩

/-- ★★★ THE CANCEL ORACLE. -/
theorem cancel_oracle {g h1 h2 H H' : BQF}
    (hgprim : Primitive g) (hgpos : PosDef g) (hD : disc g < 0)
    (h1pos : PosDef h1) (h2pos : PosDef h2)
    (hd1 : disc g = disc h1) (hd2 : disc g = disc h2)
    (hc1 : CompRel g h1 H) (hc2 : CompRel g h2 H')
    (hch : Chain H H') : Chain h1 h2 := by
  obtain ⟨ginv, e₀, hgi_pos, hgi_prim, hgi_disc, he₀a, he₀d, hcge⟩ :=
    inverse_supply hgprim hgpos hD
  obtain ⟨T1, hT1L, hT1R⟩ := bracket_data hgprim hgpos hD hgi_prim hgi_pos
    hgi_disc hcge h1pos hd1 hc1
  obtain ⟨T2, hT2L, hT2R⟩ := bracket_data hgprim hgpos hD hgi_prim hgi_pos
    hgi_disc hcge h2pos hd2 hc2
  have hidb : CompRel e₀ h1 h1 :=
    id_at he₀a (he₀d.trans hd1) (ne_of_gt h1pos.1)
  have hidc : CompRel e₀ h2 h2 :=
    id_at he₀a (he₀d.trans hd2) (ne_of_gt h2pos.1)
  exact complement_unique hc1 hc2 hch (compRel_comm hcge)
    hT1L hT1R hT2L hT2R hidb hidc

/-- Every positive PowRel power is PosDef of the base's disc. -/
theorem powRel_posdef {g : BQF} (hprim : Primitive g) (hpos : PosDef g)
    (hD : disc g < 0) {k : Re} {h : BQF} (hp : PowRel g (Re.step k) h) :
    PosDef h ∧ disc h = disc g := by
  obtain ⟨hk, hpk, hkpos, hkdisc⟩ := power_tower hprim hpos hD k
  have hch : Chain hk h := powRel_functional hpk hp
  exact ⟨chain_posdef hch hkpos (by rw [hkdisc]; exact hD),
    by rw [← disc_eq hch, hkdisc]⟩

/-- ★★ THE PEEL, class-data edition: oracle takes PosDef + disc data. -/
theorem collision_to_return' {g : BQF}
    (hprim : Primitive g) (hpos : PosDef g) (hD : disc g < 0)
    (cancel : ∀ {h1 h2 H H' : BQF},
      PosDef h1 → PosDef h2 → disc g = disc h1 → disc g = disc h2 →
      CompRel g h1 H → CompRel g h2 H' → Chain H H' → Chain h1 h2)
    (idsup : ∃ e', e'.a = 1 ∧ disc e' = disc g ∧ CompRel g e' g) :
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
  obtain ⟨e', he'a, he'd, hid⟩ := idsup
  -- e' is PosDef: a = 1 > 0, disc < 0
  have he'pos : PosDef e' := by
    apply posdef_of_pos_a_neg_disc
    · rw [he'a]
      norm_num
    · rw [he'd]
      exact hD
  cases i with
  | void =>
      have hgi : Chain g hi := by
        rcases powRel_split_succ hpi with ⟨_, hb⟩ | ⟨pk, hpk, _⟩
        · exact hb
        · exact absurd hpk powRel_not_void
      cases j with
      | void => exact absurd rfl hne
      | step j' =>
          rcases powRel_split_succ hpj with ⟨hjv, _⟩ | ⟨pj, hpj', hcompj⟩
          · exact absurd hjv (Re.step_ne_void j')
          · -- hj = g∘pj ~ g = g∘e' ⟹ cancel: pj ~ e' ⟹ RETURN at j'
            have hjg : Chain hj g := chainSymm (chainTrans hgi hch)
            obtain ⟨hpjpos, hpjdisc⟩ := powRel_posdef hprim hpos hD hpj'
            have hpe : Chain pj e' := cancel hpjpos he'pos
              hpjdisc.symm he'd.symm hcompj hid hjg
            exact ⟨j', pj, e', hpj', hpe, he'a⟩
  | step i' =>
      cases j with
      | void =>
          have hvlt : Re.void < Re.step i' :=
            lt_of_le_of_ne (Re.zero_le _) (fun h => (Re.step_ne_void i') h.symm)
          exact ih Re.void hvlt (Re.step i') hj hi hpj hpi (chainSymm hch)
            (fun h => (Re.step_ne_void i') h.symm)
      | step j' =>
          rcases powRel_split_succ hpi with ⟨hiv, _⟩ | ⟨pi, hpi', hcompi⟩
          · exact absurd hiv (Re.step_ne_void i')
          rcases powRel_split_succ hpj with ⟨hjv, _⟩ | ⟨pj, hpj', hcompj⟩
          · exact absurd hjv (Re.step_ne_void j')
          obtain ⟨hpipos, hpidisc⟩ := powRel_posdef hprim hpos hD hpi'
          obtain ⟨hpjpos, hpjdisc⟩ := powRel_posdef hprim hpos hD hpj'
          have hpp : Chain pi pj := cancel hpipos hpjpos
            hpidisc.symm hpjdisc.symm hcompi hcompj hch
          have hilt : i' < Re.step i' := lt_iff_step_le.mpr (le_refl _)
          have hne' : i' ≠ j' := by
            intro h
            exact hne (by rw [h])
          exact ih i' hilt j' pi pj hpi' hpj' hpp hne'

/-- The identity supply with disc data. -/
theorem id_supply' {g : BQF} (hpos : PosDef g) :
    ∃ e', e'.a = 1 ∧ disc e' = disc g ∧ CompRel g e' g := by
  obtain ⟨e', he'a, hid⟩ := id_supply (ne_of_gt hpos.1)
  refine ⟨e', he'a, ?_, hid⟩
  -- e' = ⟨1, g.b, g.a*g.c⟩ per id_supply's construction... derive disc
  -- from the CompRel instead (presentation-independent):
  obtain ⟨a1, a2, B, t, al, be, hbez, hne, hcf, hcg, hch⟩ := hid
  -- disc e' = disc (branch1 of the presentation) = disc (gather) = disc g
  have h1 : disc e' = disc (⟨a2, B, a1 * t⟩ : BQF) := disc_eq hcg
  have h2 : disc (gatherForm a1 a2 B t) = disc g := disc_eq hch
  have h3 : disc (gatherForm a1 a2 B t) = disc (⟨a2, B, a1 * t⟩ : BQF) := by
    unfold disc gatherForm
    ring
  rw [h1, ← h3, h2]

/-- ★★★ THE CYCLE ∀-THEOREM: every primitive PosDef form of every negative
    discriminant has an ORDER — Gauss's cycle length exists, always. -/
theorem cycle_theorem {g : BQF} (hprim : Primitive g) (hpos : PosDef g)
    (hD : disc g < 0) : ∃ h : Re, IsOrderR g h := by
  -- the box for disc g
  obtain ⟨n, hn | hn⟩ := z_trichotomy (-(disc g))
  case _ =>
    -- −D = ofRe n
    -- 1. THE COLLISION
    obtain ⟨i, j, hne, hi, hj, hpi, hpj, hch⟩ :=
      powers_collide hprim hpos hD (boxList (disc g) n)
        (fun f hred hfpos hfdisc =>
          boxList_complete hn.symm hred hfpos hfdisc)
    -- 2. THE PEEL with the production oracle
    obtain ⟨k, hret⟩ := collision_to_return' hprim hpos hD
      (fun {h1 h2 H H'} hp1 hp2 hd1 hd2 hc1 hc2 hchHH =>
        cancel_oracle hprim hpos hD hp1 hp2 hd1 hd2 hc1 hc2 hchHH)
      (id_supply' hpos) i j hi hj hpi hpj hch hne
    -- 3. THE ORDER
    exact order_exists hret (by
      rw [lt_iff_step_le]
      refine ⟨k, ?_⟩
      calc Re.step k = Re.step (Re.void + k) := by rw [Re.void_add]
        _ = Re.step Re.void + k := (Re.step_add Re.void k).symm)
  case _ =>
    -- −D = −ofRe n ⟹ D = ofRe n ≥ 0 contradicts D < 0
    exfalso
    have hnn : (0 : Z) ≤ Z.ofRe n := ofRe_nonneg n
    have : disc g = Z.ofRe n := by linarith [hn]
    linarith


#print axioms principal_unify
#print axioms triple_concordant
#print axioms inverse_supply
#print axioms bracket_data
#print axioms cancel_oracle
#print axioms collision_to_return'
#print axioms cycle_theorem

end BQF
end GaussForms
end Phys.Foundation
