/-
  # THE CLASS MEMBRANE — ClassD, the keyed surgery, inverse, rebase, trade (GQ N616)

  ## What this file proves (GQ campaign, production node)

  The class-keyed layer that makes the oracle machinery FIRE on real
  classes, plus the summit trade:

  * `ClassD` — the class predicate (Primitive ∧ PosDef ∧ disc = D).
  * `compRel_discs` — ★ CompRel forces all three discs equal.
  * `classD_prodRel` / `classD_tail` — ClassD closes over products (the
    nil principal's disc pinned by its consuming composite).
  * `supplyD` — ★★ THE CLASS-KEYED SWAP SUPPLY (swap_supply fired).
  * `adjacent_swap_D` / `pull_to_head_D` / `extract_all_D` — ★★ the
    membrane MIRRORED with zero supply hypotheses.
  * `class_inverse` — ★★★ THE CLASS INVERSE: every ClassD form has a
    power composing to a principal-shape form — HALF 1's CYCLE THEOREM
    FIRED INSIDE HALF 2 (the two halves welded).
  * `relProd_rebase` — ★★ ClassD products rebuild over any ClassD base,
    landing chain-equal to the composite.
  * `trade_core` — ★★★ THE TRADE: X captured by y∘t ⟹ y captured by
    X∘t⁻ (slack-neutral re-association through the principal; the
    exchange step's engine).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussInversion
import Phys.Algebra.GaussCycleTheorem

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

def ClassD (D : Z) (f : BQF) : Prop :=
  Primitive f ∧ PosDef f ∧ disc f = D

theorem compRel_discs {f g h : BQF} (hc : CompRel f g h) :
    disc f = disc g ∧ disc f = disc h := by
  obtain ⟨a1, a2, B, t, al, be, hbez, hne, hcf, hcg, hch⟩ := hc
  have h1 : disc f = disc (⟨a1, B, a2 * t⟩ : BQF) := disc_eq hcf
  have h2 : disc g = disc (⟨a2, B, a1 * t⟩ : BQF) := disc_eq hcg
  have h3 : disc h = disc (gatherForm a1 a2 B t) := by
    rw [← disc_eq hch]
  have e12 : disc (⟨a1, B, a2 * t⟩ : BQF) = disc (⟨a2, B, a1 * t⟩ : BQF) := by
    unfold disc
    ring
  have e1g : disc (⟨a1, B, a2 * t⟩ : BQF) = disc (gatherForm a1 a2 B t) := by
    unfold disc gatherForm
    ring
  constructor
  · rw [h1, h2, e12]
  · rw [h1, h3, e1g]

theorem classD_prodRel {D : Z} (hDneg : D < 0) :
    ∀ {sel : List BQF} {h : BQF}, sel ≠ [] →
    (∀ s ∈ sel, ClassD D s) → ProdRel sel h → ClassD D h := by
  intro sel
  induction sel with
  | nil => intro h hne; exact absurd rfl hne
  | cons g gs ih =>
      intro h _ hmem hp
      cases hp with
      | @cons _ _ h' _ hp' hc =>
          obtain ⟨hgp, hgpos, hgd⟩ := hmem g (List.mem_cons_self ..)
          have hgD : disc g < 0 := by rw [hgd]; exact hDneg
          have hdiscs := compRel_discs hc
          cases gs with
          | nil =>
              cases hp' with
              | nil he =>
                  have hd' : disc h' = D := by
                    rw [← hdiscs.1, hgd]
                  have hprim' : Primitive h' := ⟨1, 0, 0, by
                    show 1 * h'.a + 0 * h'.b + 0 * h'.c = 1
                    rw [he]
                    ring⟩
                  have hpos' : PosDef h' :=
                    posdef_of_pos_a_neg_disc (by rw [he]; norm_num)
                      (by rw [hd']; exact hDneg)
                  refine ⟨compRel_primitive hgp hprim' hc, ?_, ?_⟩
                  · exact (compRel_class hgpos hpos' hgD
                      (by rw [hgd, hd']) hc).1
                  · rw [← hdiscs.2, hgd]
          | cons g2 gs2 =>
              obtain ⟨hp'', hpos'', hd''⟩ := ih (by simp)
                (fun s hs => hmem s (List.mem_cons_of_mem g hs)) hp'
              refine ⟨compRel_primitive hgp hp'' hc, ?_, ?_⟩
              · exact (compRel_class hgpos hpos'' hgD
                  (by rw [hgd, hd'']) hc).1
              · rw [← hdiscs.2, hgd]

theorem supplyD {D : Z} (hDneg : D < 0) {a b R : BQF}
    (ha : ClassD D a) (hb : ClassD D b) (hR : ClassD D R) :
    ∃ sd : SwapData a b R, True := by
  obtain ⟨hap, hapos, had⟩ := ha
  obtain ⟨hbp, hbpos, hbd⟩ := hb
  obtain ⟨hRp, hRpos, hRd⟩ := hR
  exact swap_supply hap hbp hapos hbpos hRpos
    (by rw [hRd]; exact hDneg) (by rw [hRd, had]) (by rw [hRd, hbd])

/- ——— the class-keyed membrane ——— -/

/-- ★ Tail products are ClassD: nonempty by closure; the nil principal
    by its consuming composite (a = 1 primitive, disc pinned). -/
theorem classD_tail {D : Z} (hDneg : D < 0) {t : List BQF} {R b X : BQF}
    (hpt : ProdRel t R) (hmem : ∀ s ∈ t, ClassD D s)
    (hb : ClassD D b) (hcb : CompRel b R X) : ClassD D R := by
  cases t with
  | nil =>
      cases hpt with
      | nil he =>
          have hd : disc R = D := by
            rw [← (compRel_discs hcb).1, hb.2.2]
          have hprim : Primitive R := ⟨1, 0, 0, by
            show 1 * R.a + 0 * R.b + 0 * R.c = 1
            rw [he]
            ring⟩
          exact ⟨hprim, posdef_of_pos_a_neg_disc (by rw [he]; norm_num)
            (by rw [hd]; exact hDneg), hd⟩
  | cons g gs =>
      exact classD_prodRel hDneg (by simp) hmem hpt

/-- The class-keyed adjacent swap: supply discharged from ClassD data. -/
theorem adjacent_swap_D {D : Z} (hDneg : D < 0) {a b : BQF} {t : List BQF}
    {h : BQF}
    (ha : ClassD D a) (hb : ClassD D b) (hmem : ∀ s ∈ t, ClassD D s)
    (hp : ProdRel (a :: b :: t) h) :
    ∃ h', ProdRel (b :: a :: t) h' ∧ Chain h h' := by
  cases hp with
  | cons hbt hca =>
      cases hbt with
      | @cons _ _ R X hpt hcb =>
          have hR : ClassD D R := classD_tail hDneg hpt hmem hb hcb
          obtain ⟨⟨bR, hbR, aR, haR, T, hT1, hT2⟩, _⟩ := supplyD hDneg ha hb hR
          have hbb := compRel_functional hcb hbR
          have hca' : CompRel a bR h :=
            compRel_congr (Chain.refl _) hbb (Chain.refl _) hca
          have hhT : Chain h T := compRel_functional hca' hT1
          exact ⟨T, ProdRel.cons (ProdRel.cons hpt haR) hT2, hhT⟩

/-- Members of eraseOne are members. -/
theorem eraseOne_sub {y s : BQF} : ∀ {l : List BQF},
    s ∈ eraseOne y l → s ∈ l := by
  intro l
  induction l with
  | nil =>
      intro h
      rw [eraseOne] at h
      exact absurd h (List.not_mem_nil)
  | cons z zs ih =>
      intro h
      by_cases hz : z = y
      · rw [eraseOne, if_pos hz] at h
        exact List.mem_cons_of_mem z h
      · rw [eraseOne, if_neg hz] at h
        rcases List.mem_cons.mp h with rfl | h2
        · exact List.mem_cons_self ..
        · exact List.mem_cons_of_mem z (ih h2)

/-- ★★ THE CLASS-KEYED PULL: no supply hypothesis. -/
theorem pull_to_head_D {D : Z} (hDneg : D < 0) :
    ∀ {sel : List BQF} {h y : BQF}, (∀ s ∈ sel, ClassD D s) →
    ProdRel sel h → y ∈ sel →
    ∃ h', ProdRel (y :: eraseOne y sel) h' ∧ Chain h h' := by
  intro sel
  induction sel with
  | nil =>
      intro h y _ _ hy
      exact absurd hy (List.not_mem_nil)
  | cons a rest ih =>
      intro h y hmem hp hy
      by_cases hay : a = y
      · subst hay
        rw [eraseOne, if_pos rfl]
        exact ⟨h, hp, Chain.refl h⟩
      · have hyrest : y ∈ rest := by
          rcases List.mem_cons.mp hy with rfl | h2
          · exact absurd rfl hay
          · exact h2
        cases hp with
        | cons hpt hca =>
            obtain ⟨R', hpR', hRR'⟩ := ih
              (fun s hs => hmem s (List.mem_cons_of_mem a hs)) hpt hyrest
            have hca' : CompRel a R' _ :=
              compRel_congr (Chain.refl _) hRR' (Chain.refl _) hca
            have hp2 : ProdRel (a :: y :: eraseOne y rest) h :=
              ProdRel.cons hpR' hca'
            obtain ⟨h', hp', hhh'⟩ := adjacent_swap_D hDneg
              (hmem a (List.mem_cons_self ..))
              (hmem y hy)
              (fun s hs => hmem s (List.mem_cons_of_mem a
                (eraseOne_sub hs)))
              hp2
            rw [eraseOne, if_neg hay]
            exact ⟨h', hp', hhh'⟩

/-- ★★ THE CLASS-KEYED EXTRACTION: y^count ++ y-free rest, no supply. -/
theorem extract_all_D {D : Z} (hDneg : D < 0) :
    ∀ (N : Nat) (sel : List BQF), sel.length ≤ N →
    (∀ s ∈ sel, ClassD D s) →
    ∀ {h y : BQF}, ProdRel sel h →
    ∃ h', ProdRel (constList y (countOcc y sel) ++ removeAll y sel) h' ∧
      Chain h h' := by
  intro N
  induction N with
  | zero =>
      intro sel hlen _ h y hp
      cases sel with
      | nil =>
          refine ⟨h, ?_, Chain.refl h⟩
          have h0 : countOcc y ([] : List BQF) = Re.void := rfl
          have h1 : removeAll y ([] : List BQF) = [] := rfl
          rw [h0, h1]
          exact hp
      | cons a rest => exact absurd hlen (Nat.not_succ_le_zero _)
  | succ N ih =>
      intro sel hlen hmem h y hp
      by_cases hy : y ∈ sel
      · obtain ⟨h1, hp1, hch1⟩ := pull_to_head_D hDneg hmem hp hy
        cases hp1 with
        | cons hpt hca =>
            have hlen' : (eraseOne y sel).length ≤ N := by
              have := eraseOne_length (l := sel) hy
              omega
            obtain ⟨h2, hp2, hch2⟩ := ih (eraseOne y sel) hlen'
              (fun s hs => hmem s (eraseOne_sub hs)) hpt
            have hca' := compRel_congr (Chain.refl y) hch2 (Chain.refl _) hca
            obtain ⟨hc2, hc3⟩ := eraseOne_count hy
            refine ⟨h1, ?_, hch1⟩
            have hgoal : ProdRel
                (y :: (constList y (countOcc y (eraseOne y sel)) ++
                  removeAll y (eraseOne y sel))) h1 :=
              ProdRel.cons hp2 hca'
            rw [constList_cons_append, hc3, hc2] at hgoal
            exact hgoal
      · refine ⟨h, ?_, Chain.refl h⟩
        rw [countOcc_zero_of_notmem hy, removeAll_id_of_notmem hy]
        exact hp


/-- ★★★ THE CLASS INVERSE: every ClassD form has a power composing to a
    principal-shape form. Half 1's cycle theorem, fired inside Half 2. -/
theorem class_inverse {D : Z} (hDneg : D < 0) {m : BQF}
    (hm : ClassD D m) :
    ∃ (j : Re) (M' E : BQF),
      PowRel m (Re.step j) M' ∧ CompRel m M' E ∧ E.a = 1 := by
  obtain ⟨hmp, hmpos, hmd⟩ := hm
  have hmD : disc m < 0 := by rw [hmd]; exact hDneg
  obtain ⟨ord, ⟨⟨W, e, hpow, hWe, hea⟩, hpos, _⟩⟩ :=
    cycle_theorem hmp hmpos hmD
  -- ord positive: ord = step k
  cases ord with
  | void => exact absurd hpos (lt_irrefl _)
  | step k =>
      rcases powRel_split_succ hpow with ⟨hk0, hchW⟩ | ⟨W', hW', hcW⟩
      · -- ord = 1: m ~ W ~ e; CompRel m m e via id_at + transport
        have hme : Chain m e := chainTrans hchW hWe
        have hde : disc e = disc m := (chain_disc hme).symm
        have hid : CompRel e m m := id_at hea hde (ne_of_gt hmpos.1)
        have h1 : CompRel m m m :=
          compRel_congr (chainSymm hme) (Chain.refl _) (Chain.refl _) hid
        have h2 : CompRel m m e :=
          compRel_congr (Chain.refl _) (Chain.refl _) hme h1
        exact ⟨Re.void, m, e, PowRel.one (Chain.refl m), h2, hea⟩
      · -- ord = step k, k positive-split: M' := W', CompRel m W' W ~ e
        have h2 : CompRel m W' e :=
          compRel_congr (Chain.refl _) (Chain.refl _) hWe hcW
        cases k with
        | void => exact absurd hW' powRel_not_void
        | step k' => exact ⟨k', W', e, hW', h2, hea⟩

/-- ★★ THE REBASE: a ClassD product rebuilds over any ClassD base,
    landing chain-equal to the m∘W composite. -/
theorem relProd_rebase {D : Z} (hDneg : D < 0) :
    ∀ {A : List BQF}, A ≠ [] → (∀ s ∈ A, ClassD D s) →
    ∀ {m : BQF}, ProdRel A m →
    ∀ {W : BQF}, ClassD D W →
    ∃ (V mW : BQF), RelProd A W V ∧ CompRel m W mW ∧ Chain V mW := by
  intro A
  induction A with
  | nil => intro h; exact absurd rfl h
  | cons g A' ih =>
      intro _ hmem m hp W hW
      obtain ⟨hgp, hgpos, hgd⟩ := hmem g (List.mem_cons_self ..)
      obtain ⟨hWp, hWpos, hWd⟩ := hW
      have hgD : disc g < 0 := by rw [hgd]; exact hDneg
      cases hp with
      | @cons _ _ m' _ hp' hc =>
          cases A' with
          | nil =>
              -- singleton: m ~ g (the nil principal absorbs)
              cases hp' with
              | nil he =>
                  -- hc : CompRel g m' m with m'.a = 1: comm + id_at ⟹ m ~ g
                  have hdm' : disc m' = disc g := ((compRel_discs hc).1).symm
                  have hid : CompRel m' g g :=
                    id_at he hdm' (ne_of_gt hgpos.1)
                  have hcomm : CompRel m' g m := compRel_comm hc
                  have hmg : Chain m g := compRel_functional hcomm hid
                  -- V := g∘W
                  obtain ⟨V, hV⟩ := general_total' hgp hgpos hWpos hgD
                    (by rw [hgd, hWd])
                  -- mW := m∘W ~ V (transport along m ~ g)
                  have hmW : CompRel m W V :=
                    compRel_congr (chainSymm hmg) (Chain.refl _)
                      (Chain.refl _) hV
                  exact ⟨V, V, RelProd.cons RelProd.nil hV, hmW, Chain.refl V⟩
          | cons g2 A'' =>
              -- recurse on the nonempty tail
              have hmem' : ∀ s ∈ (g2 :: A''), ClassD D s :=
                fun s hs => hmem s (List.mem_cons_of_mem g hs)
              obtain ⟨V', m'W, hrel', hcm'W, hchV'⟩ := ih (by simp) hmem'
                hp' ⟨hWp, hWpos, hWd⟩
              -- m''s class data (nonempty product closure)
              have hm' : ClassD D m' := classD_prodRel hDneg (by simp)
                hmem' hp'
              obtain ⟨hm'p, hm'pos, hm'd⟩ := hm'
              -- V := g∘V'
              have hV'cls : ClassD D V' := by
                -- V' ~ m'W = m'∘W: class data via compRel closure
                obtain ⟨hp1, hp2⟩ := compRel_discs hcm'W
                refine ⟨?_, ?_, ?_⟩
                · exact primitive_chain (chainSymm hchV')
                    (compRel_primitive hm'p hWp hcm'W)
                · exact chain_posdef (chainSymm hchV')
                    ((compRel_class hm'pos hWpos
                      (by rw [hm'd]; exact hDneg) (by rw [hm'd, hWd])
                      hcm'W).1)
                    (by
                      rw [← hp2, hm'd]
                      exact hDneg)
                · rw [(chain_disc hchV'), ← hp2, hm'd]
              obtain ⟨hV'p, hV'pos, hV'd⟩ := hV'cls
              obtain ⟨V, hV⟩ := general_total' hgp hgpos hV'pos hgD
                (by rw [hgd, hV'd])
              -- the landing: V = g∘V' ~ g∘(m'∘W) ~ (g∘m')∘W ~ m∘W
              obtain ⟨gm', T, hgm', hgm'W, huniv⟩ := assoc_data hm'p hWp
                hgpos hm'pos hWpos hgD (by rw [hgd, hm'd])
                (by rw [hgd, hWd])
              -- g∘V' ~ g∘(m'W): transport hV along V' ~ m'W
              have hV2 : CompRel g m'W V :=
                compRel_congr (Chain.refl _) hchV' (Chain.refl _) hV
              -- universal clause: V ~ T
              have hVT : Chain V T := huniv hcm'W hV2
              -- m ~ gm' (both g∘m'): functionality
              have hmgm' : Chain m gm' := compRel_functional hc hgm'
              -- mW := m∘W ~ gm'∘W = T
              obtain ⟨mW, hmW⟩ := general_total'
                (compRel_primitive hgp hm'p hc)
                ((compRel_class hgpos hm'pos hgD (by rw [hgd, hm'd]) hc).1)
                hWpos
                (by
                  rw [(compRel_class hgpos hm'pos hgD
                    (by rw [hgd, hm'd]) hc).2]
                  exact hgD)
                (by
                  rw [(compRel_class hgpos hm'pos hgD
                    (by rw [hgd, hm'd]) hc).2, hgd, hWd])
              have hmW2 : CompRel gm' W mW :=
                compRel_congr hmgm' (Chain.refl _) (Chain.refl _) hmW
              have hmWT : Chain mW T := compRel_functional hmW2 hgm'W
              exact ⟨V, mW, RelProd.cons hrel' hV, hmW,
                chainTrans hVT (chainSymm hmWT)⟩


/-- ★★★ THE TRADE CORE: from X captured by W = y∘t, trade to y captured
    by X∘t⁻ — the inverse-power composite through the principal.
    All CapturedByD slacks preserved; the new capture's slacks are the
    OLD ones (the trade is slack-neutral: pure re-association). -/
theorem trade_core {p : Re} {D : Z} (hDneg : D < 0)
    {X W y t : BQF}
    (hy : ClassD D y) (ht : ClassD D t) (hX : ClassD D X)
    (hyt : CompRel y t W)
    (hcap : CapturedByD p D X W) :
    ∃ (tinv Xt : BQF),
      (∃ j : Re, PowRel t (Re.step j) tinv) ∧
      CompRel X tinv Xt ∧
      CapturedByD p D y Xt := by
  obtain ⟨P1, P2, L, R, hP1D, hP2D, hXL, hWR, hLR⟩ := hcap
  obtain ⟨hyp, hypos, hyd⟩ := hy
  obtain ⟨htp, htpos, htd⟩ := ht
  obtain ⟨hXp, hXpos, hXd⟩ := hX
  have hyD : disc y < 0 := by rw [hyd]; exact hDneg
  have htD : disc t < 0 := by rw [htd]; exact hDneg
  have hXD : disc X < 0 := by rw [hXd]; exact hDneg
  -- t's inverse: t∘tinv ~ E principal
  obtain ⟨j, tinv, E, htinv, htE, hEa⟩ := class_inverse hDneg ⟨htp, htpos, htd⟩
  obtain ⟨htinvp, htinvpos, htinvd⟩ := powRel_class htp htpos htD htinv
  -- Xt := X∘tinv
  obtain ⟨Xt, hXt⟩ := general_total' hXp hXpos htinvpos hXD
    (by rw [hXd, htinvd, htd])
  -- THE RE-ASSOCIATION: y ~ W∘tinv-through-E:
  --   W∘tinv = (y∘t)∘tinv ~ y∘(t∘tinv) = y∘E ~ y   [assoc + id]
  -- W's class data
  have hWcls := compRel_class hypos htpos hyD (by rw [hyd, htd]) hyt
  have hWp := compRel_primitive hyp htp hyt
  -- assoc_data (y, t, tinv)
  obtain ⟨yt, T, hyt', hytinv, huniv⟩ := assoc_data htp htinvp hypos htpos
    htinvpos hyD (by rw [hyd, htd]) (by rw [hyd, htinvd, htd])
  -- W ~ yt (both y∘t)
  have hWyt : Chain W yt := compRel_functional hyt hyt'
  -- W∘tinv lands ~ T (transport + functionality)
  obtain ⟨Wtinv, hWtinv⟩ := general_total' hWp hWcls.1 htinvpos
    (by rw [hWcls.2]; exact hyD) (by rw [hWcls.2, hyd, htinvd, htd])
  have hWtinv2 : CompRel yt tinv Wtinv :=
    compRel_congr hWyt (Chain.refl _) (Chain.refl _) hWtinv
  have hWtinvT : Chain Wtinv T := compRel_functional hWtinv2 hytinv
  -- the universal clause with (t∘tinv = E, y∘E): y∘E ~ T
  have hdE : disc E = disc y := by
    rw [← (compRel_discs htE).2, htd, hyd]
  have hyE : CompRel y E y :=
    compRel_comm (id_at hEa hdE (ne_of_gt hypos.1))
  have hyET : Chain y T := by
    have := huniv htE hyE
    -- huniv : CompRel t tinv W' → CompRel y W' W'' → Chain W'' T
    -- with W' := E, W'' := y (the id composite lands AT y)
    exact this
  -- so y ~ T ~ Wtinv = W∘tinv
  have hyWtinv : Chain y Wtinv := chainTrans hyET (chainSymm hWtinvT)
  -- THE CAPTURE: y captured by Xt with the SAME slacks:
  --   y∘P2... need CompRel y P2 ~-something ~ Xt∘P1-side. THE SLACK
  --   TRANSFER: X∘P1 ~ L ~ R = W∘P2; apply ∘tinv to both sides:
  --   (X∘P1)∘tinv ~ (W∘P2)∘tinv; re-associate LEFT: (X∘tinv)∘P1 = Xt∘P1
  --   [swap23]; re-associate RIGHT: (W∘tinv)∘P2 ~ y∘P2 [swap23 + hyWtinv].
  -- slack class data
  obtain ⟨w1, hw1p, hw1pos, hw1d, hw1P⟩ := hP1D
  obtain ⟨w2, hw2p, hw2pos, hw2d, hw2P⟩ := hP2D
  obtain ⟨hP1p, hP1pos, hP1d⟩ := powRel_class hw1p hw1pos
    (by rw [hw1d]; exact hDneg) hw1P
  obtain ⟨hP2p, hP2pos, hP2d⟩ := powRel_class hw2p hw2pos
    (by rw [hw2d]; exact hDneg) hw2P
  -- L, R class data
  have hLcls := compRel_class hXpos hP1pos hXD
    (by rw [hXd, hP1d, hw1d]) hXL
  have hLp := compRel_primitive hXp hP1p hXL
  -- L∘tinv
  obtain ⟨Ltinv, hLtinv⟩ := general_total' hLp hLcls.1 htinvpos
    (by rw [hLcls.2]; exact hXD) (by rw [hLcls.2, hXd, htinvd, htd])
  -- LEFT re-assoc: L∘tinv = (X∘P1)∘tinv ~ (X∘tinv)∘P1 = Xt∘P1 [swap23]
  obtain ⟨XtP1, hXtP1⟩ := general_total'
    (compRel_primitive hXp htinvp hXt)
    ((compRel_class hXpos htinvpos hXD
      (by rw [hXd, htinvd, htd]) hXt).1)
    hP1pos
    (by rw [(compRel_class hXpos htinvpos hXD
        (by rw [hXd, htinvd, htd]) hXt).2]; exact hXD)
    (by rw [(compRel_class hXpos htinvpos hXD
        (by rw [hXd, htinvd, htd]) hXt).2, hXd, hP1d, hw1d])
  have hswapL : Chain Ltinv XtP1 := swap23 hXp hP1p htinvp hXpos hP1pos
    htinvpos hXD (by rw [hXd, hP1d, hw1d]) (by rw [hXd, htinvd, htd])
    hXL hLtinv hXt hXtP1
  -- RIGHT: R∘tinv = (W∘P2)∘tinv ~ (W∘tinv)∘P2 = Wtinv∘P2 ~ y∘P2
  have hRcls := compRel_class hWcls.1 hP2pos
    (by rw [hWcls.2]; exact hyD) (by rw [hWcls.2, hyd, hP2d, hw2d]) hWR
  have hRp := compRel_primitive hWp hP2p hWR
  obtain ⟨Rtinv, hRtinv⟩ := general_total' hRp hRcls.1 htinvpos
    (by rw [hRcls.2, hWcls.2]; exact hyD)
    (by rw [hRcls.2, hWcls.2, hyd, htinvd, htd])
  obtain ⟨WtinvP2, hWtinvP2⟩ := general_total'
    (compRel_primitive hWp htinvp hWtinv)
    ((compRel_class hWcls.1 htinvpos (by rw [hWcls.2]; exact hyD)
      (by rw [hWcls.2, hyd, htinvd, htd]) hWtinv).1)
    hP2pos
    (by rw [(compRel_class hWcls.1 htinvpos (by rw [hWcls.2]; exact hyD)
        (by rw [hWcls.2, hyd, htinvd, htd]) hWtinv).2, hWcls.2]
        exact hyD)
    (by rw [(compRel_class hWcls.1 htinvpos (by rw [hWcls.2]; exact hyD)
        (by rw [hWcls.2, hyd, htinvd, htd]) hWtinv).2, hWcls.2, hyd,
        hP2d, hw2d])
  have hswapR : Chain Rtinv WtinvP2 := swap23 hWp hP2p htinvp hWcls.1
    hP2pos htinvpos (by rw [hWcls.2]; exact hyD)
    (by rw [hWcls.2, hyd, hP2d, hw2d])
    (by rw [hWcls.2, hyd, htinvd, htd])
    hWR hRtinv hWtinv hWtinvP2
  -- y∘P2 ~ Wtinv∘P2 (transport along y ~ Wtinv)
  obtain ⟨yP2, hyP2⟩ := general_total' hyp hypos hP2pos hyD
    (by rw [hyd, hP2d, hw2d])
  have hyP2' : CompRel Wtinv P2 yP2 :=
    compRel_congr hyWtinv (Chain.refl _) (Chain.refl _) hyP2
  have hyP2W : Chain yP2 WtinvP2 := compRel_functional hyP2' hWtinvP2
  -- L∘tinv ~ R∘tinv (transport hLR through the tinv composite)
  have hRtinv' : CompRel L tinv Rtinv :=
    compRel_congr (chainSymm hLR) (Chain.refl _) (Chain.refl _) hRtinv
  have hLRtinv : Chain Ltinv Rtinv := compRel_functional hLtinv hRtinv'
  -- ASSEMBLE: y captured by Xt: slacks (P2, P1), landings (yP2, XtP1)
  refine ⟨tinv, Xt, ⟨j, htinv⟩, hXt,
    P2, P1, yP2, XtP1,
    ⟨w2, hw2p, hw2pos, hw2d, hw2P⟩, ⟨w1, hw1p, hw1pos, hw1d, hw1P⟩,
    hyP2, hXtP1, ?_⟩
  -- Chain yP2 XtP1: yP2 ~ WtinvP2 ~ Rtinv ~ Ltinv ~ XtP1
  exact chainTrans hyP2W (chainTrans (chainSymm hswapR)
    (chainTrans (chainSymm hLRtinv) hswapL))


#print axioms supplyD
#print axioms pull_to_head_D
#print axioms extract_all_D
#print axioms class_inverse
#print axioms relProd_rebase
#print axioms trade_core

end BQF
end GaussForms
end Phys.Foundation
