/-
  # THE INSTANTIATION LAYER — assoc data, closure, totality (GQ N613)

  ## What this file proves (GQ campaign, production node)

  The class-data instantiations that make every tower supply FIRE:

  * `assoc_data` — ★★★ THE UNIVERSAL INSTANTIATOR: for any primitive
    PosDef triple of one negative disc, both bracketings land on ONE T
    with the re-read universal in the landing.
  * `gather_primitive` — ★★ the gather of primitive branches is primitive
    (explicit Bézout PRODUCT witness — the two branch combinations
    multiply; note the squared coefficients in the t-slot).
  * `compRel_primitive` / `compRel_class` / `powRel_class` — composition
    and powers preserve the full class triple.
  * `wladder_of` — ★★ WLADDER DISCHARGED: composition with w is total on
    w's powers.
  * `cross_of` — ★★ THE CROSS SUPPLY DISCHARGED: block_to_joinLadder's
    per-rung composites exist for real classes (BlockLands is now
    unconditional on class data).
  * `general_total` / `general_total'` — ★★ THE TOTALITY OF GAUSS
    COMPOSITION: any two primitive PosDef same-disc forms compose.
  * `joinLink_of` — ★★ JOINLINK DISCHARGED: the fused q-ladder onto any
    y-power exists and lands at the given composite.
  * `block_is_pth'` — ★★ THE PINNED BLOCK READING: the block target is
    the w-power at (step p') AND the y-power at the LITERAL product
    index — the p ∣ count reading, structurally rewritable.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussOracleAssembly

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★★★ THE ASSOCIATIVITY DATA. -/
theorem assoc_data {y h m : BQF}
    (hhp : Primitive h) (hmp : Primitive m)
    (hypos : PosDef y) (hhpos : PosDef h) (hmpos : PosDef m)
    (hD : disc y < 0)
    (hdh : disc y = disc h) (hdm : disc y = disc m) :
    ∃ yh T : BQF, CompRel y h yh ∧ CompRel yh m T ∧
      ∀ {W W' : BQF}, CompRel h m W → CompRel y W W' → Chain W' T := by
  -- triple concordant on (y, h, m): f1 := y, f2 := h, f3 := m
  obtain ⟨a1, a2, a3, B, t, g1, g2, g3, ha1ne, ha2ne, ha3ne,
    hcop12, hcop13, hcop23, hg1, hg2, hg3, hge1, hge2, hge3⟩ :=
    triple_concordant (f1 := y) (f2 := h) (f3 := m)
      hhp hmp hypos hhpos hmpos hD hdh hdm
  subst hge1
  subst hge2
  subst hge3
  -- presented positivity
  have hp1 := chain_posdef hg1 hypos hD
  have hp2 := chain_posdef hg2 hhpos (by rw [← hdh]; exact hD)
  have hp3 := chain_posdef hg3 hmpos (by rw [← hdm]; exact hD)
  have ha1pos : 0 < a1 := hp1.1
  have ha2pos : 0 < a2 := hp2.1
  have ha3pos : 0 < a3 := hp3.1
  have hne123 : a1 * a2 * a3 ≠ 0 :=
    ne_of_gt (mul_pos (mul_pos ha1pos ha2pos) ha3pos)
  -- the two bracketings on one T
  obtain ⟨al12, be12, h12⟩ :=
    id (coprime_symm (coprime_mul (coprime_symm hcop13) (coprime_symm hcop23)))
  obtain ⟨al3, be3, h23⟩ := id (coprime_mul hcop12 hcop13)
  obtain ⟨hbrL, hbrR, hTeq⟩ := compRel_assoc_presented
    (B := B) (t := t) h12 h23 hne123
  rw [← hTeq] at hbrR
  set T := gatherForm (a1 * a2) a3 B t with hTdef
  -- (y, h) pair-gather = the (a1, a2) miss_split
  obtain ⟨al', be', hb12⟩ := id hcop12
  have hne12 : a1 * a2 ≠ 0 := ne_of_gt (mul_pos ha1pos ha2pos)
  have hms12 := miss_split (b := B) (c := a3 * t) hb12 hne12
  have em1 : (⟨a1, B, (a2 * a3) * t⟩ : BQF) = ⟨a1, B, a2 * (a3 * t)⟩ := by
    rw [mul_assoc]
  have em2 : (⟨a2, B, (a1 * a3) * t⟩ : BQF) = ⟨a2, B, a1 * (a3 * t)⟩ := by
    rw [mul_assoc]
  have hg1' := em1 ▸ hg1
  have hg2' := em2 ▸ hg2
  have hyh : CompRel y h (⟨a1 * a2, B, a3 * t⟩ : BQF) :=
    compRel_congr (chainSymm hg1') (chainSymm hg2') (Chain.refl _) hms12
  -- (yh)∘m → T: the LEFT bracketing with the m-branch transported
  have hyhm : CompRel (⟨a1 * a2, B, a3 * t⟩ : BQF) m T :=
    compRel_congr (Chain.refl _) (chainSymm hg3) (Chain.refl _) hbrL
  -- the universal re-read: any W = h∘m, W' = y∘W lands ~ T
  refine ⟨⟨a1 * a2, B, a3 * t⟩, T, hyh, hyhm, ?_⟩
  intro W W' hW hW'
  -- (h, m) pair-gather = the (a2, a3) miss_split; W ~ that gather
  obtain ⟨al'', be'', hb23⟩ := id hcop23
  have hne23 : a2 * a3 ≠ 0 := ne_of_gt (mul_pos ha2pos ha3pos)
  have hms23 := miss_split (b := B) (c := a1 * t) hb23 hne23
  have em3 : (⟨a2, B, (a1 * a3) * t⟩ : BQF) = ⟨a2, B, a3 * (a1 * t)⟩ := by
    rw [show ((a1 * a3) * t : Z) = a3 * (a1 * t) from by ring]
  have em4 : (⟨a3, B, (a1 * a2) * t⟩ : BQF) = ⟨a3, B, a2 * (a1 * t)⟩ := by
    rw [show ((a1 * a2) * t : Z) = a2 * (a1 * t) from by ring]
  have hg2'' := em3 ▸ hg2
  have hg3'' := em4 ▸ hg3
  have hG23 : CompRel h m (⟨a2 * a3, B, a1 * t⟩ : BQF) :=
    compRel_congr (chainSymm hg2'') (chainSymm hg3'') (Chain.refl _) hms23
  have hWg : Chain W (⟨a2 * a3, B, a1 * t⟩ : BQF) :=
    compRel_functional hW hG23
  -- W' = y∘W ~ y∘(a2a3-gather) → T (the RIGHT bracketing, y-branch back)
  have hbrR' : CompRel y (⟨a2 * a3, B, a1 * t⟩ : BQF) T :=
    compRel_congr (chainSymm hg1) (Chain.refl _) (Chain.refl _) hbrR
  have hW'2 : CompRel y (⟨a2 * a3, B, a1 * t⟩ : BQF) W' :=
    compRel_congr (Chain.refl _) hWg (Chain.refl _) hW'
  exact compRel_functional hW'2 hbrR'


/-- ★★ THE GATHER IS PRIMITIVE (explicit Bézout product). -/
theorem gather_primitive {a1 a2 B t : Z}
    (h1 : Primitive (⟨a1, B, a2 * t⟩ : BQF))
    (h2 : Primitive (⟨a2, B, a1 * t⟩ : BQF)) :
    Primitive (gatherForm a1 a2 B t) := by
  obtain ⟨u1, v1, w1, hb1⟩ := h1
  obtain ⟨u2, v2, w2, hb2⟩ := h2
  -- the product combination, regrouped onto (a1a2, B, t):
  refine ⟨u1 * u2, v1 * u2 * a2 + u1 * v2 * a1 + v1 * v2 * B
      + v1 * w2 * a1 * t + w1 * v2 * a2 * t,
    u1 * w2 * a1 * a1 + w1 * u2 * a2 * a2 + w1 * w2 * a1 * a2 * t, ?_⟩
  show u1 * u2 * (a1 * a2)
      + (v1 * u2 * a2 + u1 * v2 * a1 + v1 * v2 * B
        + v1 * w2 * a1 * t + w1 * v2 * a2 * t) * B
      + (u1 * w2 * a1 * a1 + w1 * u2 * a2 * a2 + w1 * w2 * a1 * a2 * t) * t = 1
  have hexp : u1 * u2 * (a1 * a2)
      + (v1 * u2 * a2 + u1 * v2 * a1 + v1 * v2 * B
        + v1 * w2 * a1 * t + w1 * v2 * a2 * t) * B
      + (u1 * w2 * a1 * a1 + w1 * u2 * a2 * a2 + w1 * w2 * a1 * a2 * t) * t
      = (u1 * a1 + v1 * B + w1 * (a2 * t))
        * (u2 * a2 + v2 * B + w2 * (a1 * t)) := by
    ring
  rw [hexp]
  have e1 : u1 * a1 + v1 * B + w1 * (a2 * t) = 1 := by
    have := hb1
    simpa using this
  have e2 : u2 * a2 + v2 * B + w2 * (a1 * t) = 1 := by
    have := hb2
    simpa using this
  rw [e1, e2]
  norm_num

/-- CompRel results are primitive. -/
theorem compRel_primitive {f g h : BQF}
    (hfp : Primitive f) (hgp : Primitive g)
    (hc : CompRel f g h) : Primitive h := by
  obtain ⟨a1, a2, B, t, al, be, hbez, hne, hcf, hcg, hch⟩ := hc
  have hp1 : Primitive (⟨a1, B, a2 * t⟩ : BQF) := primitive_chain hcf hfp
  have hp2 : Primitive (⟨a2, B, a1 * t⟩ : BQF) := primitive_chain hcg hgp
  exact primitive_chain hch (gather_primitive hp1 hp2)

/-- CompRel results are PosDef with the shared disc (power_tower's inline
    argument, extracted). -/
theorem compRel_class {f g h : BQF}
    (hfpos : PosDef f) (hgpos : PosDef g)
    (hD : disc f < 0) (hdg : disc f = disc g)
    (hc : CompRel f g h) : PosDef h ∧ disc h = disc f := by
  obtain ⟨a1, a2, B, t, al, be, hbez, hne, hcf, hcg, hch⟩ := hc
  have hp1 : PosDef (⟨a1, B, a2 * t⟩ : BQF) := chain_posdef hcf hfpos hD
  have hp2 : PosDef (⟨a2, B, a1 * t⟩ : BQF) :=
    chain_posdef hcg hgpos (by rw [← hdg]; exact hD)
  have hga : 0 < a1 * a2 := mul_pos hp1.1 hp2.1
  have hgd : disc (gatherForm a1 a2 B t) = disc f := by
    have h1d : disc (gatherForm a1 a2 B t)
        = disc (⟨a1, B, a2 * t⟩ : BQF) := by
      unfold disc gatherForm
      ring
    rw [h1d, ← disc_eq hcf]
  have hgp : PosDef (gatherForm a1 a2 B t) :=
    posdef_of_pos_a_neg_disc (by show (0 : Z) < a1 * a2; exact hga)
      (by rw [hgd]; exact hD)
  constructor
  · exact chain_posdef hch hgp (by rw [hgd]; exact hD)
  · rw [← disc_eq hch, hgd]

/-- Powers carry the full class data. -/
theorem powRel_class {w : BQF} (hp : Primitive w) (hpos : PosDef w)
    (hD : disc w < 0) :
    ∀ {k : Re} {W : BQF}, PowRel w k W →
    Primitive W ∧ PosDef W ∧ disc W = disc w := by
  intro k W hpow
  induction hpow with
  | one hch =>
      exact ⟨primitive_chain hch hp, chain_posdef hch hpos hD,
        (disc_eq hch).symm⟩
  | @succ k h h' hpk hc ih =>
      obtain ⟨ihp, ihpos, ihd⟩ := ih
      have hprim' := compRel_primitive hp ihp hc
      have hcls := compRel_class hpos ihpos hD ihd.symm hc
      exact ⟨hprim', hcls.1, hcls.2⟩

/-- ★★ WLADDER DISCHARGED: composition with w is total on w's powers. -/
theorem wladder_of {w : BQF} (hp : Primitive w) (hpos : PosDef w)
    (hD : disc w < 0) : WLadder w := by
  intro k W hpow
  obtain ⟨hWp, hWpos, hWd⟩ := powRel_class hp hpos hD hpow
  obtain ⟨f', W', hchf, hcomp⟩ := power_step_total hp hpos hD
    (by rw [hWd]) hWpos.1
  exact ⟨W', compRel_congr (chainSymm hchf) (Chain.refl _) (Chain.refl _) hcomp⟩


/-- ★★ THE CROSS SUPPLY, DISCHARGED: block_to_joinLadder's per-rung
    composites exist for primitive PosDef (y, m) of one negative disc. -/
theorem cross_of {y m : BQF}
    (hyp : Primitive y) (hmp : Primitive m)
    (hypos : PosDef y) (hmpos : PosDef m)
    (hD : disc y < 0) (hdm : disc y = disc m) :
    ∀ {k : Re} {h W W' : BQF},
      JoinLadder y m k h W → CompRel y W W' →
      ∃ (h' T : BQF), CompRel y h h' ∧ CompRel h' m W' ∧
        CompRel h' m T ∧ CompRel y W T := by
  intro k h W W' hlad hstep
  -- h's class data from the ladder's power projection
  have hpow := joinLadder_pow hlad
  obtain ⟨hhp, hhpos, hhd⟩ := powRel_class hyp hypos hD hpow
  -- assoc data on (y, h, m)
  obtain ⟨yh, T, hyh, hyhm, huniv⟩ :=
    assoc_data hhp hmp hypos hhpos hmpos hD hhd.symm hdm
  -- the ladder's landing: CompRel h m W
  have hlanding := joinLadder_landing hlad
  -- W' = y∘W ~ T via the universal clause
  have hW'T : Chain W' T := huniv hlanding hstep
  -- the rung composite h' := yh with the two landings:
  refine ⟨yh, T, hyh, ?_, hyhm, ?_⟩
  · -- CompRel yh m W' — transport the yh∘m composite along T ~ W'
    exact compRel_congr (Chain.refl _) (Chain.refl _) (chainSymm hW'T) hyhm
  · -- CompRel y W T — the right-bracket instance at W:
    -- y∘W with W ~ (h∘m)-gather lands at T: derive from the universal
    -- clause... need an actual composite CompRel y W ?: use hstep's own:
    -- CompRel y W W' with W' ~ T:
    exact compRel_congr (Chain.refl _) (Chain.refl _) hW'T hstep


/-- ★★ GENERAL TOTALITY: any two primitive PosDef same-disc forms
    compose. -/
theorem general_total {f g : BQF}
    (hfp : Primitive f) (hfpos : PosDef f) (hgpos : PosDef g)
    (hD : disc f < 0) (hdg : disc f = disc g) :
    ∃ (f' h : BQF), Chain f f' ∧ CompRel f' g h := by
  obtain ⟨qs, hqs, hprimes⟩ := z_prime_data hgpos.1
  obtain ⟨f', hchf, hcop⟩ := coprime_rep_to_target hfp qs hqs hprimes
  obtain ⟨al, be, hbez⟩ := hcop
  have hgne : g.a ≠ 0 := ne_of_gt hgpos.1
  have hdisc' : disc f' = disc g := by
    rw [← disc_eq hchf, hdg]
  obtain ⟨h, hcomp⟩ := compRel_total (f := f') (g := g)
    (hbez := hbez)
    (hne := by
      have hf'pos : PosDef f' := chain_posdef hchf hfpos hD
      exact ne_of_gt (mul_pos hf'pos.1 hgpos.1))
    hdisc'
  exact ⟨f', h, hchf, hcomp⟩

/-- The class-level composite (chain absorbed): CompRel f g h up to
    chain on the f-slot — packaged as the composite THROUGH f itself. -/
theorem general_total' {f g : BQF}
    (hfp : Primitive f) (hfpos : PosDef f) (hgpos : PosDef g)
    (hD : disc f < 0) (hdg : disc f = disc g) :
    ∃ h : BQF, CompRel f g h := by
  obtain ⟨f', h, hchf, hcomp⟩ := general_total hfp hfpos hgpos hD hdg
  exact ⟨h, compRel_congr (chainSymm hchf) (Chain.refl _) (Chain.refl _) hcomp⟩

/-- ★★ JOINLINK DISCHARGED: the fused q-ladder onto any y-power exists,
    landing at the given composite. -/
theorem joinLink_of {y : BQF}
    (hyp : Primitive y) (hypos : PosDef y) (hD : disc y < 0) :
    ∀ {q : Re} {w : BQF}, PowRel y q w →
    ∀ {W W' : BQF}, CompRel w W W' →
    ∀ {j : Re}, PowRel y j W →
    ∃ (V : BQF), JoinLadder y W q w V ∧ Chain V W' := by
  intro q w hqpow
  induction hqpow with
  | @one h hch =>
      intro W W' hstep j hWpow
      exact ⟨W', JoinLadder.base hch hstep, Chain.refl W'⟩
  | @succ k h h' hpk hc ih =>
      intro W W' hstep j hWpow
      obtain ⟨hWprim, hWpos, hWd⟩ := powRel_class hyp hypos hD hWpow
      obtain ⟨hhprim, hhpos, hhd⟩ := powRel_class hyp hypos hD hpk
      -- the k-ladder's own landing: h∘W composite via general totality
      obtain ⟨Vh, hcompHW⟩ := general_total' hhprim hhpos hWpos
        (by rw [hhd]; exact hD) (by rw [hhd, ← hWd])
      obtain ⟨V, hVlad, hVVh⟩ := ih hcompHW hWpow
      -- the new rung: h' = y∘h; W' = h'∘W. Cross pair via assoc_data
      -- on (y, h, W):
      obtain ⟨yh, T, hyh, hyhW, huniv⟩ := assoc_data hhprim hWprim
        hypos hhpos hWpos hD hhd.symm hWd.symm
      -- align h' with yh (both y∘h composites): Chain h' yh
      have hh'yh : Chain h' yh := compRel_functional hc hyh
      -- W' = h'∘W ~ yh∘W ~ T
      have hW'2 : CompRel yh W W' :=
        compRel_congr hh'yh (Chain.refl _) (Chain.refl _) hstep
      have hW'T : Chain W' T := compRel_functional hW'2 hyhW
      -- V ~ Vh = h∘W; y∘Vh ~ T by the universal clause — build y∘V:
      -- the JoinLadder step needs: prev (hVlad), hrung : CompRel y h_k h',
      -- hnext : CompRel h' W W', hT1 : CompRel h' W T, hT2 : CompRel y V T.
      -- hrung := hc transported? hc : CompRel y h h' — the ladder's
      -- h-projection is hk-lad ~ h (joinLadder_pow + functionality)...
      -- JoinLadder.step's h is the PREVIOUS rung's h — here hVlad's
      -- projection IS aligned with h? hVlad : JoinLadder y W k ?hk V with
      -- ?hk the ladder's own accumulator; its projection joinLadder_pow
      -- gives PowRel y k ?hk; h also PowRel y k h (hpk) ⟹ Chain ?hk h
      -- (powRel_functional). Transport hc along it:
      have hklad_pow := joinLadder_pow hVlad
      have hkh : Chain _ h := powRel_functional hklad_pow hpk
      have hrung' : CompRel y _ h' :=
        compRel_congr (Chain.refl _) (chainSymm hkh) (Chain.refl _) hc
      -- hnext : CompRel h' W W' — from hstep directly (h' IS w here? w = h'
      -- by the induction: the succ case's w is h'): hstep : CompRel h' W W' ✓
      -- hT1 : CompRel h' W T — transport hyhW along hh'yh:
      have hT1 : CompRel h' W T :=
        compRel_congr (chainSymm hh'yh) (Chain.refl _) (Chain.refl _) hyhW
      -- hT2 : CompRel y V T — y∘V with V ~ Vh = h∘W: the universal clause
      -- gives Chain (y∘Vh) T for any composite; build y∘V via general
      -- totality and pin with huniv:
      obtain ⟨hVprim, hVpos, hVd⟩ := powRel_class hyp hypos hD
        (pow_join hWpow hVlad)
      obtain ⟨yV, hcompYV⟩ := general_total' hyp hypos hVpos hD hVd.symm
      -- Chain yV T: transport the composite to Vh, then huniv:
      have hcompYVh : CompRel y Vh yV :=
        compRel_congr (Chain.refl _) hVVh (Chain.refl _) hcompYV
      have hyVT : Chain yV T := huniv hcompHW hcompYVh
      have hT2 : CompRel y V T :=
        compRel_congr (Chain.refl _) (Chain.refl _) hyVT hcompYV
      refine ⟨W', JoinLadder.step hVlad hrung' hstep hT1 ?_, Chain.refl W'⟩
      exact hT2


/-- ★★ THE PINNED BLOCK READING: block_is_pth with the y-index EXPOSED —
    Y is the w-power at (step p') AND the y-power at (step q)·(step p')
    (the literal mul), by the same induction with the index recurrence
    carried. (w := the (step q)-power of y.) -/
theorem block_is_pth' {y w : BQF} {q : Re}
    (hw : PowRel y (Re.step q) w)
    (hlad : WLadder w) (hlink : JoinLink y w (Re.step q)) :
    ∀ p' : Re, ∃ Y : BQF,
      PowRel w (Re.step p') Y ∧
      PowRel y (Re.step q * Re.step p') Y := by
  intro p'
  induction p' with
  | void =>
      refine ⟨w, PowRel.one (Chain.refl w), ?_⟩
      have hidx : Re.step q * Re.step Re.void = Re.step q := by
        rw [Re.mul_step, Re.mul_void, Re.void_add]
      rw [hidx]
      exact hw
  | step p'' ih =>
      obtain ⟨Y, hwY, hyY⟩ := ih
      obtain ⟨Y', hY'⟩ := hlad hwY
      obtain ⟨V, hVlad, hVY'⟩ := hlink hY' hyY
      have hjoin : PowRel y (Re.step q + Re.step q * Re.step p'') V :=
        pow_join hyY hVlad
      have hY'pow : PowRel y (Re.step q + Re.step q * Re.step p'') Y' :=
        powRel_congr hjoin hVY'
      have hidx : Re.step q * Re.step (Re.step p'')
          = Re.step q + Re.step q * Re.step p'' := by
        rw [Re.mul_step]
        exact Re.add_comm _ _
      rw [hidx]
      exact ⟨Y', PowRel.succ hwY hY', hY'pow⟩


#print axioms assoc_data
#print axioms gather_primitive
#print axioms powRel_class
#print axioms wladder_of
#print axioms cross_of
#print axioms general_total'
#print axioms joinLink_of
#print axioms block_is_pth'

end BQF
end GaussForms
end Phys.Foundation
