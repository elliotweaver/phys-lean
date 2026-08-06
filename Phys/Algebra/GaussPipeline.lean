/-
  # THE PIPELINE — absorb, trade end-to-end, unroll, package (GQ N617)

  ## What this file proves (GQ campaign, production node)

  The summit weld: from a folded ClassD capture to the oracle's explicit
  swap slot.

  * `re_pos_split` / `ofRe_step_pos` / `capturedD_congr` /
    `relProd_inner` — transport kit.
  * `capture_absorb_D` — ★★★ THE ABSORPTION: a PPowD factor of a captured
    composite merges into the slack (swap23 + assoc_data + pth_product).
  * `pipeline` — ★★★ THE END-TO-END WELD: x captured by a ClassD
    selection using y, p prime, p ∤ count(y) ⟹ y captured by the
    explicit composite X∘tinv (X = x^u, tinv a power of the y-free
    rest-product) — extract → land → invert → raise → re-read → absorb
    → trade, ten banked theorems in sequence.
  * `powRel_to_prodRel'` (+ step wrapper) — ★★ powers ARE constList
    products. `prodRel_congr_ne`, `pow_of_principal` — transport.
  * `aReps_prod` — ★★★ REPEATED PRODUCTS ARE POWERS (relProd_rebase per
    rung + prodRel_append').
  * `selection_package` — ★★★ THE PACKAGE: the traded capture re-lands
    on the EXPLICIT selection constList x u ++ AReps rest (u·j) — the
    oracle's swap-slot membership contract, closed.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussClassMembrane

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- Nonzero counts are steps. -/
theorem re_pos_split {n : Re} (hn : n ≠ Re.void) : ∃ n', n = Re.step n' := by
  cases n with
  | void => exact absurd rfl hn
  | step k => exact ⟨k, rfl⟩

/-- Step images are positive. -/
theorem ofRe_step_pos (n : Re) : (0 : Z) < Z.ofRe (Re.step n) := by
  have hle := ofRe_nonneg (Re.step n)
  have hne : Z.ofRe (Re.step n) ≠ 0 := by
    intro h0
    have hz : Z.ofRe Re.void = (0 : Z) := Z.ofRe_zero
    have : Re.step n = Re.void := Z.ofRe_injective (by rw [h0, hz])
    exact Re.step_ne_void _ this
  exact lt_of_le_of_ne hle (Ne.symm hne)

/-- CapturedByD transports along chains in the h-slot. -/
theorem capturedD_congr {p : Re} {D : Z} {x h h' : BQF}
    (hch : Chain h h') (hcap : CapturedByD p D x h) :
    CapturedByD p D x h' := by
  obtain ⟨P1, P2, L, R, h1, h2, h3, h4, h5⟩ := hcap
  exact ⟨P1, P2, L, R, h1, h2, h3,
    compRel_congr hch (Chain.refl _) (Chain.refl _) h4, h5⟩

/-- The innermost composite of a nonempty constList RelProd consumes the
    base. -/
theorem relProd_inner {y m : BQF} : ∀ {n : Re} {h : BQF},
    RelProd (constList y (Re.step n)) m h → ∃ h₁, CompRel y m h₁ := by
  intro n
  induction n with
  | void =>
      intro h hrel
      cases hrel with
      | cons hp hc =>
          cases hp with
          | nil => exact ⟨h, hc⟩
  | step k ih =>
      intro h hrel
      cases hrel with
      | cons hp hc => exact ih hp

/-- ★★★ THE ABSORPTION (D-keyed): the PPowD factor of a captured
    composite merges into the slack. -/
theorem capture_absorb_D {p : Re} {D : Z} (hDneg : D < 0)
    {X y Yt Mu yYt V : BQF}
    (hy : ClassD D y) (hMu : ClassD D Mu)
    (hYtD : PPowD (Re.step p) D Yt)
    (hyYt : CompRel y Yt yYt) (hV : CompRel yYt Mu V)
    (hcap : CapturedByD (Re.step p) D X V) :
    ∃ yMu : BQF, CompRel y Mu yMu ∧
      CapturedByD (Re.step p) D X yMu := by
  obtain ⟨P1, P2, L, R, hP1D, hP2D, hXL, hVR, hLR⟩ := hcap
  obtain ⟨hyp, hypos, hyd⟩ := hy
  obtain ⟨hMup, hMupos, hMud⟩ := hMu
  have hyD : disc y < 0 := by rw [hyd]; exact hDneg
  -- Yt's class data from its PPowD base
  obtain ⟨wt, hwtp, hwtpos, hwtd, hwtP⟩ := hYtD
  obtain ⟨hYtp, hYtpos, hYtd⟩ := powRel_class hwtp hwtpos
    (by rw [hwtd]; exact hDneg) hwtP
  -- P2's class data from its PPowD base
  obtain ⟨w2, hw2p, hw2pos, hw2d, hw2P⟩ := hP2D
  obtain ⟨hP2p, hP2pos, hP2d⟩ := powRel_class hw2p hw2pos
    (by rw [hw2d]; exact hDneg) hw2P
  -- yMu := y∘Mu
  obtain ⟨yMu, hyMu⟩ := general_total' hyp hypos hMupos hyD
    (by rw [hyd, hMud])
  have hyMucls := compRel_class hypos hMupos hyD (by rw [hyd, hMud]) hyMu
  have hyMup := compRel_primitive hyp hMup hyMu
  -- K := yMu∘Yt
  obtain ⟨K, hK⟩ := general_total' hyMup hyMucls.1 hYtpos
    (by rw [hyMucls.2]; exact hyD)
    (by rw [hyMucls.2, hyd, hYtd, hwtd])
  -- swap23 (y, Yt, Mu): V = (y∘Yt)∘Mu ~ (y∘Mu)∘Yt = K
  have hVK : Chain V K := swap23 hyp hYtp hMup hypos hYtpos hMupos hyD
    (by rw [hyd, hYtd, hwtd]) (by rw [hyd, hMud])
    hyYt hV hyMu hK
  -- assoc_data (yMu, Yt, P2)
  obtain ⟨ab', T2, h1', h2', univ2⟩ := assoc_data hYtp hP2p hyMucls.1
    hYtpos hP2pos (by rw [hyMucls.2]; exact hyD)
    (by rw [hyMucls.2, hyd, hYtd, hwtd])
    (by rw [hyMucls.2, hyd, hP2d, hw2d])
  -- K ~ ab' (both yMu∘Yt)
  have hKab' : Chain K ab' := compRel_functional hK h1'
  -- R = V∘P2 read at ab': transport hVR along V ~ K ~ ab'
  have hVab' : Chain V ab' := chainTrans hVK hKab'
  have hVR' : CompRel ab' P2 R :=
    compRel_congr hVab' (Chain.refl _) (Chain.refl _) hVR
  have hRT2 : Chain R T2 := compRel_functional hVR' h2'
  -- Q := Yt∘P2 (the merged slack) with its p-th-power witness
  obtain ⟨Q, hQ⟩ := general_total' hYtp hYtpos hP2pos
    (by rw [hYtd, hwtd]; exact hDneg)
    (by rw [hYtd, hwtd, hP2d, hw2d])
  obtain ⟨w12, hw12, hQpow⟩ := pth_product hwtp hw2p hwtpos hw2pos
    (by rw [hwtd]; exact hDneg) (by rw [hwtd, hw2d]) hwtP hw2P hQ
  -- the PPowD witness for Q: base w12 with class data
  have hw12cls := compRel_class hwtpos hw2pos (by rw [hwtd]; exact hDneg)
    (by rw [hwtd, hw2d]) hw12
  have hw12p := compRel_primitive hwtp hw2p hw12
  have hQD : PPowD (Re.step p) D Q :=
    ⟨w12, hw12p, hw12cls.1, by rw [hw12cls.2, hwtd], hQpow⟩
  -- R' := yMu∘Q via the universal clause: (yMu∘Yt)∘P2 ~ yMu∘(Yt∘P2)
  have hQcls := compRel_class hYtpos hP2pos
    (by rw [hYtd, hwtd]; exact hDneg) (by rw [hYtd, hwtd, hP2d, hw2d]) hQ
  obtain ⟨R', hR'⟩ := general_total' hyMup hyMucls.1 hQcls.1
    (by rw [hyMucls.2]; exact hyD)
    (by rw [hyMucls.2, hQcls.2, hYtd, hwtd, hyd])
  have hR'T2 : Chain R' T2 := univ2 hQ hR'
  -- assemble: X captured by yMu with slacks (P1, Q)
  refine ⟨yMu, hyMu, P1, Q, L, R', hP1D, hQD, hXL, hR', ?_⟩
  -- Chain L R': L ~ R ~ T2 ~ R'
  exact chainTrans hLR (chainTrans hRT2 (chainSymm hR'T2))




/-- ★★★ THE PIPELINE: the folded capture trades — y captured by X∘tinv
    with all data exposed. -/
theorem pipeline {pr' : Re} {D : Z} (hDneg : D < 0)
    (hprime : PrimeRe (Re.step pr'))
    {x y : BQF} {sel : List BQF} {h : BQF}
    (hx : ClassD D x)
    (hmem : ∀ s ∈ sel, ClassD D s)
    (hy : y ∈ sel)
    (hp : ProdRel sel h)
    (hcap : CapturedByD (Re.step pr') D x h)
    (hnd : ¬ ZDvd (Z.ofRe (Re.step pr')) (Z.ofRe (countOcc y sel))) :
    ∃ (u' : Re) (X m Mu tinv Xt : BQF),
      PowRel x (Re.step u') X ∧
      ProdRel (removeAll y sel) m ∧
      PowRel m (Re.step u') Mu ∧
      (∃ j, PowRel Mu (Re.step j) tinv) ∧
      CompRel X tinv Xt ∧
      CapturedByD (Re.step pr') D y Xt := by
  -- 0. shapes and class data
  have hcnt_ne : countOcc y sel ≠ Re.void := countOcc_pos_of_mem hy
  obtain ⟨c', hc'⟩ := re_pos_split hcnt_ne
  obtain ⟨hxp, hxpos, hxd⟩ := hx
  obtain ⟨hyp, hypos, hyd⟩ := hmem y hy
  have hxD : disc x < 0 := by rw [hxd]; exact hDneg
  have hyD : disc y < 0 := by rw [hyd]; exact hDneg
  have hselne : sel ≠ [] := by
    intro h0
    subst h0
    exact absurd hy List.not_mem_nil
  have hh : ClassD D h := classD_prodRel hDneg hselne hmem hp
  -- 1. extract y's block
  obtain ⟨h₀, hp₀, hch₀⟩ := extract_all_D hDneg sel.length sel
    (Nat.le_refl _) hmem (y := y) hp
  have hh₀ : ClassD D h₀ :=
    ⟨primitive_chain hch₀ hh.1,
     chain_posdef hch₀ hh.2.1 (by rw [hh.2.2]; exact hDneg),
     by rw [← chain_disc hch₀]; exact hh.2.2⟩
  have hcap₀ : CapturedByD (Re.step pr') D x h₀ := capturedD_congr hch₀ hcap
  -- 2. split at the seam
  rw [hc'] at hp₀
  obtain ⟨m, hrest, hblock⟩ := prodRel_append hp₀
  -- 3. m's class data (both remainder shapes)
  have hm : ClassD D m := by
    cases hrem : removeAll y sel with
    | nil =>
        rw [hrem] at hrest
        cases hrest with
        | nil hme =>
            obtain ⟨h₁, hc₁⟩ := relProd_inner hblock
            have hdm : disc m = D := by
              rw [← (compRel_discs hc₁).1, hyd]
            exact ⟨⟨1, 0, 0, by
                show 1 * m.a + 0 * m.b + 0 * m.c = 1
                rw [hme]
                ring⟩,
              posdef_of_pos_a_neg_disc (by rw [hme]; norm_num)
                (by rw [hdm]; exact hDneg), hdm⟩
    | cons r rs =>
        rw [hrem] at hrest
        refine classD_prodRel hDneg (by simp) ?_ hrest
        intro s hs
        have hs' : s ∈ removeAll y sel := by rw [hrem]; exact hs
        exact hmem s (removeAll_sub hs').1
  obtain ⟨hmp, hmpos, hmd⟩ := hm
  -- 4. the block lands as the count-power
  obtain ⟨Y, hYpow, hYm⟩ := blockLands_of
    (fun {k h W W'} hlad hstep =>
      cross_of hyp hmp hypos hmpos hyD (by rw [hyd, hmd]) hlad hstep)
    hblock
  -- 5. inversion data → Re index identity
  rw [hc'] at hnd
  obtain ⟨uZ, vZ, huZ, hvZ, hbezZ⟩ := inversion_data rfl hprime
    (ofRe_step_pos c') hnd
  obtain ⟨u', hu'⟩ := pos_to_re huZ
  obtain ⟨v', hv'⟩ := pos_to_re hvZ
  have hidx : Re.step c' * Re.step u'
      = Re.step (Re.step pr' * Re.step v') := by
    apply index_transport
    rw [← hu', ← hv']
    exact hbezZ
  -- 6. towers + the raise
  obtain ⟨X, hX⟩ := wpow_exists (wladder_of hxp hxpos hxD) u'
  obtain ⟨H, hH⟩ := wpow_exists
    (wladder_of hh₀.1 hh₀.2.1 (by rw [hh₀.2.2]; exact hDneg)) u'
  have hcapX : CapturedByD (Re.step pr') D X H :=
    capturedD_raise hxp hh₀.1 hxpos hh₀.2.1 hDneg hxd hh₀.2.2 hcap₀ hX hH
  -- 7. H decomposes as Yu∘Mu
  obtain ⟨hYp, hYpos, hYd⟩ := powRel_class hyp hypos hyD hYpow
  obtain ⟨Yu, hYu⟩ := wpow_exists
    (wladder_of hYp hYpos (by rw [hYd]; exact hyD)) u'
  obtain ⟨Mu, hMuPow⟩ := wpow_exists
    (wladder_of hmp hmpos (by rw [hmd]; exact hDneg)) u'
  obtain ⟨hYup, hYupos, hYud⟩ := powRel_class hYp hYpos
    (by rw [hYd]; exact hyD) hYu
  obtain ⟨hMup, hMupos, hMud⟩ := powRel_class hmp hmpos
    (by rw [hmd]; exact hDneg) hMuPow
  obtain ⟨Cn, hCn⟩ := general_total' hYup hYupos hMupos
    (by rw [hYud, hYd]; exact hyD)
    (by rw [hYud, hYd, hyd, hMud, hmd])
  have hCnpow : PowRel h₀ (Re.step u') Cn :=
    power_of_product hYp hmp hYpos hmpos (by rw [hYd]; exact hyD)
      (by rw [hYd, hyd, hmd]) hYm hYu hMuPow hCn
  have hHCn : Chain H Cn := powRel_functional hH hCnpow
  have hcapCn : CapturedByD (Re.step pr') D X Cn := capturedD_congr hHCn hcapX
  -- 8. re-read the raised block: Yu ~ y∘Yt with Yt a PPowD tail
  obtain ⟨Yv, Yt, hYv, hYt, hyYtYu⟩ := block_reread hyp hypos hyD hidx hYpow hYu
  obtain ⟨hYvp, hYvpos, hYvd⟩ := powRel_class hyp hypos hyD hYv
  have hYtD : PPowD (Re.step pr') D Yt :=
    ⟨Yv, hYvp, hYvpos, by rw [hYvd, hyd], hYt⟩
  -- 9. absorb the tail into the slack
  obtain ⟨yMu, hyMu, hcapyMu⟩ := capture_absorb_D hDneg
    ⟨hyp, hypos, hyd⟩ ⟨hMup, hMupos, by rw [hMud, hmd]⟩
    hYtD hyYtYu hCn hcapCn
  -- 10. THE TRADE
  obtain ⟨hXp2, hXpos2, hXd2⟩ := powRel_class hxp hxpos hxD hX
  obtain ⟨tinv, Xt, htinvpow, hXt, hcapy⟩ := trade_core hDneg
    ⟨hyp, hypos, hyd⟩ ⟨hMup, hMupos, by rw [hMud, hmd]⟩
    ⟨hXp2, hXpos2, by rw [hXd2, hxd]⟩ hyMu hcapyMu
  exact ⟨u', X, m, Mu, tinv, Xt, hX, hrest, hMuPow, htinvpow, hXt, hcapy⟩


theorem powRel_to_prodRel' {g : BQF} (hgpos : PosDef g) :
    ∀ {n : Re} {P : BQF}, PowRel g n P →
    ProdRel (constList g n) P := by
  intro n P hpow
  induction hpow with
  | one hch =>
      obtain ⟨e', hea, hde, hid⟩ := id_supply' hgpos
      have hce : CompRel g e' _ :=
        compRel_congr (Chain.refl _) (Chain.refl _) hch hid
      exact ProdRel.cons (ProdRel.nil hea) hce
  | @succ k' hk h hpk hc ih =>
      exact ProdRel.cons ih hc

/-- Step-form wrapper. -/
theorem powRel_to_prodRel {g : BQF} (hgpos : PosDef g)
    {k : Re} {P : BQF} (hpow : PowRel g (Re.step k) P) :
    ProdRel (constList g (Re.step k)) P :=
  powRel_to_prodRel' hgpos hpow

/-- Nonempty products transport along target chains. -/
theorem prodRel_congr_ne {sel : List BQF} {h h' : BQF}
    (hne : sel ≠ []) (hp : ProdRel sel h) (hch : Chain h h') :
    ProdRel sel h' := by
  cases hp with
  | nil he => exact absurd rfl hne
  | cons hp' hc =>
      exact ProdRel.cons hp'
        (compRel_congr (Chain.refl _) (Chain.refl _) hch hc)

/-- ★ Powers of a principal-shape form collapse to it (class form). -/
theorem pow_of_principal {m : BQF} (hma : m.a = 1)
    (hmp : Primitive m) (hmpos : PosDef m) (hmD : disc m < 0) :
    ∀ {n : Re} {T : BQF}, PowRel m n T → Chain m T := by
  intro n T hpow
  induction hpow with
  | one hch => exact hch
  | @succ k' hk h hpk hc ih =>
      -- k' = void: hpk is PowRel m void — impossible... no: succ carries
      -- hpk : PowRel m k' hk with k' possibly void — PowRel indexes at
      -- step only; powRel_not_void kills k' = void. For k' = step:
      -- ih : Chain m hk (by the induction hypothesis applied at hpk...
      -- ih IS the IH for hpk when k' is a step; when k' = void hpk is
      -- absurd. Lean's induction gives ih := motive for hpk directly:
      cases k'' : k' with
      | void =>
          rw [k''] at hpk
          exact absurd hpk powRel_not_void
      | step j =>
          -- hk class data: PosDef + a > 0
          obtain ⟨hkp, hkpos, hkd⟩ := powRel_class hmp hmpos hmD
            (k'' ▸ hpk)
          have hdm : disc m = disc hk := (compRel_discs hc).1
          have hid : CompRel m hk hk := id_at hma hdm (ne_of_gt hkpos.1)
          have hcoll : Chain h hk := compRel_functional hc hid
          exact chainTrans (ih) (chainSymm hcoll)


/-- ★★★ REPEATED PRODUCTS ARE POWERS. -/
theorem aReps_prod {D : Z} (hDneg : D < 0) {B : List BQF} {m : BQF}
    (hBne : B ≠ []) (hBmem : ∀ s ∈ B, ClassD D s)
    (hpm : ProdRel B m) :
    ∀ {k : Re} {T : BQF}, PowRel m (Re.step k) T →
    ∃ V : BQF, ProdRel (AReps B (Re.step k)) V ∧ Chain T V := by
  have hm : ClassD D m := classD_prodRel hDneg hBne hBmem hpm
  intro k
  induction k with
  | void =>
      intro T hT
      -- T ~ m; AReps B 1 = B ++ [] = B
      rcases powRel_split_succ hT with ⟨_, hch⟩ | ⟨hk, hk', _⟩
      · refine ⟨T, ?_, Chain.refl T⟩
        have hBapp : AReps B (Re.step Re.void) = B := by
          show B ++ AReps B Re.void = B
          show B ++ [] = B
          exact List.append_nil B
        rw [hBapp]
        exact prodRel_congr_ne hBne hpm hch
      · exact absurd hk' powRel_not_void
  | step k' ih =>
      intro T hT
      rcases powRel_split_succ hT with ⟨hk0, _⟩ | ⟨Tk, hTk, hcT⟩
      · exact absurd hk0 (Re.step_ne_void _)
      · obtain ⟨Vk, hpVk, hTkVk⟩ := ih hTk
        -- Tk's class data
        obtain ⟨hTkp, hTkpos, hTkd⟩ := powRel_class hm.1 hm.2.1
          (by rw [hm.2.2]; exact hDneg) hTk
        -- rebase B over Tk
        obtain ⟨V, mTk, hrel, hcmTk, hVmTk⟩ := relProd_rebase hDneg hBne
          hBmem hpm (W := Tk) ⟨hTkp, hTkpos, by rw [hTkd, hm.2.2]⟩
        -- transport the rebase to base Vk (Tk ~ Vk):
        -- prodRel_append' with ProdRel (AReps B k) Vk needs RelProd B Vk ...
        -- rebase was AT Tk; re-rebase at Vk directly:
        have hVkcls : ClassD D Vk :=
          ⟨primitive_chain hTkVk hTkp,
           chain_posdef hTkVk hTkpos (by
             rw [hTkd, hm.2.2]
             exact hDneg),
           by rw [← chain_disc hTkVk, hTkd, hm.2.2]⟩
        obtain ⟨V', mVk, hrel', hcmVk, hV'mVk⟩ := relProd_rebase hDneg hBne
          hBmem hpm (W := Vk) hVkcls
        -- assemble the append product
        have happ : ProdRel (B ++ AReps B (Re.step k')) V' :=
          prodRel_append' hpVk hrel'
        refine ⟨V', ?_, ?_⟩
        · show ProdRel (AReps B (Re.step (Re.step k'))) V'
          exact happ
        · -- T = m∘Tk ~ m∘Vk = mVk ~ V'
          have hcT' : CompRel m Vk T :=
            compRel_congr (Chain.refl _) hTkVk (Chain.refl _) hcT
          have hTmVk : Chain T mVk := compRel_functional hcT' hcmVk
          exact chainTrans hTmVk (chainSymm hV'mVk)

/-- ★★★ THE PACKAGE (nonempty rest): the traded capture lands on the
    explicit selection constList x ++ AReps rest. -/
theorem selection_package {p : Re} {D : Z} (hDneg : D < 0)
    {x y m Mu tinv X Xt : BQF} {rest : List BQF} {u' j : Re}
    (hx : ClassD D x)
    (hrestne : rest ≠ []) (hrestmem : ∀ s ∈ rest, ClassD D s)
    (hrest : ProdRel rest m)
    (hMu : PowRel m (Re.step u') Mu)
    (htinv : PowRel Mu (Re.step j) tinv)
    (hX : PowRel x (Re.step u') X)
    (hXt : CompRel X tinv Xt)
    (hcap : CapturedByD p D y Xt) :
    ∃ V : BQF,
      ProdRel (constList x (Re.step u')
        ++ AReps rest (Re.step u' * Re.step j)) V ∧
      CapturedByD p D y V := by
  have hm : ClassD D m := classD_prodRel hDneg hrestne hrestmem hrest
  have hmD : disc m < 0 := by rw [hm.2.2]; exact hDneg
  -- tinv = m^(u·j) by index composition
  have htinvIdx : PowRel m (Re.step u' * Re.step j) tinv :=
    pow_of_pow hm.1 hm.2.1 hmD hMu htinv
  -- the index is a step: step u' * step j = step (...)
  have hidxstep : ∃ w, Re.step u' * Re.step j = Re.step w := by
    refine ⟨Re.step u' * j + u', ?_⟩
    rw [Re.mul_step]
    rfl
  obtain ⟨w, hw⟩ := hidxstep
  -- AReps product realizes tinv
  rw [hw] at htinvIdx ⊢
  obtain ⟨Vt, hpVt, htinvVt⟩ := aReps_prod hDneg hrestne hrestmem hrest htinvIdx
  -- Vt's class data
  have hVt : ClassD D Vt :=
    ⟨primitive_chain htinvVt
       (powRel_class hm.1 hm.2.1 hmD htinvIdx).1,
     chain_posdef htinvVt (powRel_class hm.1 hm.2.1 hmD htinvIdx).2.1
       (by
         rw [(powRel_class hm.1 hm.2.1 hmD htinvIdx).2.2, hm.2.2]
         exact hDneg),
     by rw [← chain_disc htinvVt,
          (powRel_class hm.1 hm.2.1 hmD htinvIdx).2.2, hm.2.2]⟩
  -- rebase the x-block over Vt
  obtain ⟨hxp, hxpos, hxd⟩ := hx
  have hxD : disc x < 0 := by rw [hxd]; exact hDneg
  have hXprod : ProdRel (constList x (Re.step u')) X :=
    powRel_to_prodRel' hxpos hX
  have hclne : constList x (Re.step u') ≠ [] := by
    show x :: constList x u' ≠ []
    simp
  have hclmem : ∀ s ∈ constList x (Re.step u'), ClassD D s := by
    intro s hs
    rw [constList_mem hs]
    exact ⟨hxp, hxpos, hxd⟩
  obtain ⟨V, XVt, hrel, hcXVt, hVXVt⟩ := relProd_rebase hDneg hclne
    hclmem hXprod (W := Vt) hVt
  -- the append product
  have happ : ProdRel (constList x (Re.step u')
      ++ AReps rest (Re.step w)) V :=
    prodRel_append' hpVt hrel
  -- Xt = X∘tinv ~ X∘Vt = XVt ~ V
  have hcXt' : CompRel X Vt Xt :=
    compRel_congr (Chain.refl _) htinvVt (Chain.refl _) hXt
  have hXtXVt : Chain Xt XVt := compRel_functional hcXt' hcXVt
  have hXtV : Chain Xt V := chainTrans hXtXVt (chainSymm hVXVt)
  exact ⟨V, happ, capturedD_congr hXtV hcap⟩


#print axioms capture_absorb_D
#print axioms pipeline
#print axioms aReps_prod
#print axioms selection_package

end BQF
end GaussForms
end Phys.Foundation
