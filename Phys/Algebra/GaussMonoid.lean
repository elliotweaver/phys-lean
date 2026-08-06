/-
  # THE COMMUTATIVE MONOID LAYER — swap, mediality, p-th products, merge (GQ N614)

  ## What this file proves (GQ campaign, production node)

  The full re-bracketing/re-ordering freedom of class composition, and
  the slack merge it powers:

  * `swap23` — ★★ (x∘y)∘z ~ (x∘z)∘y (both assoc_data canonicals
    identified through the shared commuted-middle composite).
  * `interchange` — ★★★ THE MEDIALITY LAW: (a∘b)∘(c∘d) ~ (a∘c)∘(b∘d)
    (assoc down, swap the inner pair, assoc up).
  * `pth_product` — ★★ composites of aligned p-th powers are p-th powers
    (the two ladders zip via interchange at every rung).
  * `shift_factor` — the (Y∘h')∘P ~ (Y∘P)∘h' juggle.
  * `merge_of` — ★★ THE SLACK MERGE DISCHARGED: a p-th-power factor of a
    capturing composite merges with any p-th-power slack into ONE p-th-
    power slack on the co-factor, landing agreement proved.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussInstantiation

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★★ SWAP23: (x∘y)∘z ~ (x∘z)∘y. -/
theorem swap23 {x y z xy xyz xz xzy : BQF}
    (hxp : Primitive x) (hyp : Primitive y) (hzp : Primitive z)
    (hxpos : PosDef x) (hypos : PosDef y) (hzpos : PosDef z)
    (hD : disc x < 0) (hdy : disc x = disc y) (hdz : disc x = disc z)
    (hxy : CompRel x y xy) (hxyz : CompRel xy z xyz)
    (hxz : CompRel x z xz) (hxzy : CompRel xz y xzy) :
    Chain xyz xzy := by
  obtain ⟨xy', T1, h1, h2, univ1⟩ :=
    assoc_data hyp hzp hxpos hypos hzpos hD hdy hdz
  have hxyxy' : Chain xy xy' := compRel_functional hxy h1
  have hxyz' : CompRel xy' z xyz :=
    compRel_congr hxyxy' (Chain.refl _) (Chain.refl _) hxyz
  have hE1 : Chain xyz T1 := compRel_functional hxyz' h2
  obtain ⟨xz', T2, h1', h2', univ2⟩ :=
    assoc_data hzp hyp hxpos hzpos hypos hD hdz hdy
  have hxzxz' : Chain xz xz' := compRel_functional hxz h1'
  have hxzy' : CompRel xz' y xzy :=
    compRel_congr hxzxz' (Chain.refl _) (Chain.refl _) hxzy
  have hE2 : Chain xzy T2 := compRel_functional hxzy' h2'
  obtain ⟨yz, hyz⟩ := general_total' hyp hypos hzpos
    (by rw [← hdy]; exact hD) (by rw [← hdy, ← hdz])
  have hyzcls := compRel_class hypos hzpos (by rw [← hdy]; exact hD)
    (by rw [← hdy, ← hdz]) hyz
  obtain ⟨xyzM, hxyzM⟩ := general_total' hxp hxpos hyzcls.1 hD
    (by rw [hyzcls.2, ← hdy])
  have hM1 : Chain xyzM T1 := univ1 hyz hxyzM
  have hzy : CompRel z y yz := compRel_comm hyz
  have hM2 : Chain xyzM T2 := univ2 hzy hxyzM
  exact chainTrans hE1 (chainTrans (chainSymm hM1)
    (chainTrans hM2 (chainSymm hE2)))

/-- interchange (N614b, inlined). -/
theorem interchange {a b c d ab cd acf bd L R : BQF}
    (hap : Primitive a) (hbp : Primitive b) (hcp : Primitive c)
    (hdp : Primitive d)
    (hapos : PosDef a) (hbpos : PosDef b) (hcpos : PosDef c)
    (hdpos : PosDef d)
    (hD : disc a < 0) (hdb : disc a = disc b) (hdc : disc a = disc c)
    (hdd : disc a = disc d)
    (hab : CompRel a b ab) (hcd : CompRel c d cd)
    (hac : CompRel a c acf) (hbd : CompRel b d bd)
    (hL : CompRel ab cd L) (hR : CompRel acf bd R) :
    Chain L R := by
  have habP := compRel_primitive hap hbp hab
  have habC := compRel_class hapos hbpos hD hdb hab
  have hacP := compRel_primitive hap hcp hac
  have hacC := compRel_class hapos hcpos hD hdc hac
  have hbdP := compRel_primitive hbp hdp hbd
  have hbdC := compRel_class hbpos hdpos (by rw [← hdb]; exact hD)
    (by rw [← hdb, ← hdd]) hbd
  have hcdP := compRel_primitive hcp hdp hcd
  have hcdC := compRel_class hcpos hdpos (by rw [← hdc]; exact hD)
    (by rw [← hdc, ← hdd]) hcd
  obtain ⟨abc, T1, habc, habcd, univ1⟩ := assoc_data hcp hdp habC.1
    hcpos hdpos (by rw [habC.2]; exact hD) (by rw [habC.2, ← hdc])
    (by rw [habC.2, ← hdd])
  have hLT1 : Chain L T1 := univ1 hcd hL
  obtain ⟨acb, hacb⟩ := general_total' hacP hacC.1 hbpos
    (by rw [hacC.2]; exact hD) (by rw [hacC.2, ← hdb])
  have hswap : Chain abc acb := swap23 hap hbp hcp hapos hbpos hcpos
    hD hdb hdc hab habc hac hacb
  obtain ⟨acb', T2, hacb', hacbd', univ2⟩ := assoc_data hbp hdp hacC.1
    hbpos hdpos (by rw [hacC.2]; exact hD) (by rw [hacC.2, ← hdb])
    (by rw [hacC.2, ← hdd])
  have hacbacb' : Chain acb acb' := compRel_functional hacb hacb'
  have habcacb' : Chain abc acb' := chainTrans hswap hacbacb'
  have habcd2 : CompRel acb' d T1 :=
    compRel_congr habcacb' (Chain.refl _) (Chain.refl _) habcd
  have hT1T2 : Chain T1 T2 := compRel_functional habcd2 hacbd'
  have hRT2 : Chain R T2 := univ2 hbd hR
  exact chainTrans hLT1 (chainTrans hT1T2 (chainSymm hRT2))

/-- ★★ THE PTH PRODUCT: a composite of two aligned p-th powers is a p-th
    power (the two ladders zip via interchange). -/
theorem pth_product {w1 w2 : BQF}
    (h1p : Primitive w1) (h2p : Primitive w2)
    (h1pos : PosDef w1) (h2pos : PosDef w2)
    (hD : disc w1 < 0) (hd12 : disc w1 = disc w2) :
    ∀ {p : Re} {P1 P2 : BQF}, PowRel w1 p P1 → PowRel w2 p P2 →
    ∀ {Q : BQF}, CompRel P1 P2 Q →
    ∃ w12 : BQF, CompRel w1 w2 w12 ∧ PowRel w12 p Q := by
  intro p
  induction p with
  | void =>
      intro P1 P2 hP1 _ _ _
      exact absurd hP1 powRel_not_void
  | step k ih =>
      intro P1 P2 hP1 hP2 Q hQ
      rcases powRel_split_succ hP1 with ⟨hk0, hch1⟩ | ⟨P1', hP1', hc1⟩
      · -- p = 1: P1 ~ w1, P2 ~ w2 ⟹ Q is a w1∘w2 composite
        subst hk0
        have hch2 : Chain w2 P2 := by
          rcases powRel_split_succ hP2 with ⟨_, h⟩ | ⟨P2', hP2', _⟩
          · exact h
          · exact absurd hP2' powRel_not_void
        have hQ' : CompRel w1 w2 Q :=
          compRel_congr (chainSymm hch1) (chainSymm hch2) (Chain.refl _) hQ
        exact ⟨Q, hQ', PowRel.one (Chain.refl Q)⟩
      · -- step: peel both ladders, interchange, IH, extend
        rcases powRel_split_succ hP2 with ⟨hk0, _⟩ | ⟨P2', hP2', hc2⟩
        · exact absurd hc1 (by
            subst hk0
            intro h
            exact absurd hP1' powRel_not_void)
        -- class data
        obtain ⟨hP1'p, hP1'pos, hP1'd⟩ := powRel_class h1p h1pos hD hP1'
        obtain ⟨hP2'p, hP2'pos, hP2'd⟩ := powRel_class h2p h2pos
          (by rw [← hd12]; exact hD) hP2'
        -- IH on the peeled pair: need their composite
        obtain ⟨Q', hQ'⟩ := general_total' hP1'p hP1'pos hP2'pos
          (by rw [hP1'd]; exact hD) (by rw [hP1'd, hP2'd, hd12])
        obtain ⟨w12, hw12, hQ'pow⟩ := ih hP1' hP2' hQ'
        -- interchange: (w1 P1')(w2 P2') ~ (w1 w2)(P1' P2') = w12∘Q'
        have hw12cls := compRel_class h1pos h2pos hD hd12 hw12
        have hw12P := compRel_primitive h1p h2p hw12
        obtain ⟨R, hR⟩ := general_total' hw12P hw12cls.1
          (by
            -- PosDef Q': from hQ' class data
            exact (compRel_class hP1'pos hP2'pos (by rw [hP1'd]; exact hD)
              (by rw [hP1'd, hP2'd, hd12]) hQ').1)
          (by rw [hw12cls.2]; exact hD)
          (by
            rw [hw12cls.2]
            have := (compRel_class hP1'pos hP2'pos (by rw [hP1'd]; exact hD)
              (by rw [hP1'd, hP2'd, hd12]) hQ').2
            rw [this, hP1'd])
        have hinter : Chain Q R := interchange h1p hP1'p h2p hP2'p
          h1pos hP1'pos h2pos hP2'pos hD hP1'd.symm
          hd12 (by rw [hP2'd, hd12])
          hc1 hc2 hw12 hQ' hQ hR
        -- R = w12∘Q' with Q' the k-power ⟹ R is the (k+1)-power of w12
        have hRpow : PowRel w12 (Re.step k) R := PowRel.succ hQ'pow hR
        exact ⟨w12, hw12, powRel_congr hRpow (chainSymm hinter)⟩

/-- swap-juggle helper: (Y∘h')∘P ~ h'∘(Y∘P) — one swap23 read. -/
theorem shift_factor {Y h' P YH T1 YP T2 : BQF}
    (hYp : Primitive Y) (hh'p : Primitive h') (hPp : Primitive P)
    (hYpos : PosDef Y) (hh'pos : PosDef h') (hPpos : PosDef P)
    (hD : disc Y < 0) (hdh : disc Y = disc h') (hdP : disc Y = disc P)
    (hYH : CompRel Y h' YH) (hT1 : CompRel YH P T1)
    (hYP : CompRel Y P YP) (hT2 : CompRel YP h' T2) :
    Chain T1 T2 := by
  -- swap23 at (Y, h', P): (Y h')P ~ (Y P)h'
  exact swap23 hYp hh'p hPp hYpos hh'pos hPpos hD hdh hdP
    hYH hT1 hYP hT2

/-- ★★ THE SLACK MERGE, DISCHARGED (for p-th-power factors with base
    data): Y = wY^p composing into the capture head; P2 = w2^p the
    slack. The merged slack Q := Y∘P2 is a p-th power and the landing
    agrees. -/
theorem merge_of {p : Re} {wY w2 Y P2 h' h R : BQF}
    (hwYp : Primitive wY) (hw2p : Primitive w2)
    (hwYpos : PosDef wY) (hw2pos : PosDef w2)
    (hh'p : Primitive h') (hh'pos : PosDef h')
    (hD : disc wY < 0)
    (hdw2 : disc wY = disc w2) (hdh' : disc wY = disc h')
    (hYpow : PowRel wY p Y) (hP2pow : PowRel w2 p P2)
    (hread : CompRel Y h' h) (hhR : CompRel h P2 R) :
    ∃ (Q R' : BQF), (∃ w12, PowRel w12 p Q) ∧ CompRel h' Q R' ∧ Chain R' R := by
  -- class data for the powers
  obtain ⟨hYprim, hYpos, hYd⟩ := powRel_class hwYp hwYpos hD hYpow
  obtain ⟨hP2prim, hP2pos, hP2d⟩ := powRel_class hw2p hw2pos
    (by rw [← hdw2]; exact hD) hP2pow
  -- Q := Y∘P2
  obtain ⟨Q, hQ⟩ := general_total' hYprim hYpos hP2pos
    (by rw [hYd]; exact hD) (by rw [hYd, hP2d, hdw2])
  -- Q is a p-th power
  obtain ⟨w12, hw12, hQpow⟩ := pth_product hwYp hw2p hwYpos hw2pos hD hdw2
    hYpow hP2pow hQ
  -- R' := h'∘Q
  have hQcls := compRel_class hYpos hP2pos (by rw [hYd]; exact hD)
    (by rw [hYd, hP2d, hdw2]) hQ
  have hQprim := compRel_primitive hYprim hP2prim hQ
  obtain ⟨R', hR'⟩ := general_total' hh'p hh'pos hQcls.1
    (by rw [← hdh']; exact hD) (by rw [← hdh', hQcls.2, hYd])
  -- the landing agreement: R = (Y∘h')∘P2 ~ (Y∘P2)∘h' = Q∘h' ~ h'∘Q = R'
  -- via swap23 at (Y, h', P2):
  obtain ⟨QH, hQH⟩ := general_total' hQprim hQcls.1 hh'pos
    (by rw [hQcls.2, hYd]; exact hD) (by rw [hQcls.2, hYd, ← hdh'])
  have hswap : Chain R QH := swap23 hYprim hh'p hP2prim hYpos hh'pos
    hP2pos (by rw [hYd]; exact hD) (by rw [hYd, ← hdh'])
    (by rw [hYd, hP2d, hdw2])
    hread hhR hQ hQH
  -- QH = Q∘h' ~ h'∘Q = R' (comm + functionality)
  have hcomm : CompRel h' Q QH := compRel_comm hQH
  have hQHR' : Chain QH R' := compRel_functional hcomm hR'
  exact ⟨Q, R', ⟨w12, hQpow⟩, hR', chainSymm (chainTrans hswap hQHR')⟩


#print axioms swap23
#print axioms interchange
#print axioms pth_product
#print axioms merge_of

end BQF
end GaussForms
end Phys.Foundation
