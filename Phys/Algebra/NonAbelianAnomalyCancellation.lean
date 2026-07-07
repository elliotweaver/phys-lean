/-
  Phys.Algebra.NonAbelianAnomalyCancellation — N428 (SEED_FINAL_RECKONING, arc P, target P3).
  ============================================================================================
  THE FULL NON-ABELIAN + WITTEN ANOMALY CANCELLATION — pay the F1-childed debt in full: the
  mixed non-abelian conditions `SU(2)²·U(1)`, `SU(3)²·U(1)` and the Witten `SU(2)` global anomaly
  of one chiral generation, ALL DERIVED from the banked colour exterior ladder + the derived colour
  count + the derived isospin-doublet count — never a tabulated Standard-Model assignment.

  ---------------------------------------------------------------------------
  ⭐ FIFTEENTH OWNER-AUTHORIZED SEED (docs/SEED_FINAL_RECKONING.md, ARC P, target P3). The DIRECTED
  single successor of N427 (arc-P P2 complete). Arc P is the FINAL arc of the owner-authorized chain;
  NO forward-childing past P; NO deferral (§0 NO-DEFERRAL law). N366 (F1) banked the ABELIAN +
  GRAVITATIONAL anomalies via the colour exterior-ladder charge-conjugation (Hodge) involution, and
  EXPLICITLY childed (its lines 50–54) the non-abelian mixed conditions + the Witten global anomaly
  as "leading-structural / route-not-yet-found, NOT claimed here." THIS node PAYS that childed debt.

  ---------------------------------------------------------------------------
  THE THEORY-NATIVE ROUTE (the SAME Hodge complement F1 used, extended to the non-abelian sector).
  One chiral generation is the colour EXTERIOR LADDER `Λ*(colour-n)` (N317 `ladderChargeTrace`,
  F1 `blCharge`): the states of one chirality are the subsets `S ⊆ Fin n` of the colour index set,
  and charge CONJUGATION is the Hodge complement `S ↦ Sᶜ` (banked F1 `complPerm`, fixed-point-free),
  under which the ladder hypercharge `blCharge n S = (2·|S| − n)/n` is ODD (banked F1
  `blCharge_compl_odd`). Three pieces, each FORCED, none tabulated:

    ★ PIECE 1 — the `SU(3)²·U(1)` mixed anomaly VANISHES (colour is vector-like). A mixed anomaly
      moment is `Σ_S (index of S under the non-abelian group)·(hypercharge of S)`. The colour
      SU(3) index is COMPLEMENT-EVEN — the Hodge complement pairs the colour triplet (`|S|=1`) with
      its antitriplet (`|S|=2`), and conjugate reps carry the SAME quadratic (Dynkin) index
      `T(R*) = T(R)`, so `colourIndex n Sᶜ = colourIndex n S`. The GENERAL lemma
      `mixed_anomaly_zero`: a complement-EVEN functional times the complement-ODD hypercharge is
      complement-ODD, hence its sum vanishes by the banked F1 `sum_zero_of_compl_odd`. Vector-like
      colour ⟹ no SU(3)²·U(1) anomaly — a free consequence of the involution, not a table sum.

    ★ PIECE 2 — the `SU(2)²·U(1)` mixed anomaly VANISHES ⟺ the DERIVED colour count is `3`. This is
      the reframing-lens DISSOLUTION: the Standard-Model "miracle" `n_c·Y_Q + Y_L = 0` becomes the
      rational identity `(3 − n_c)/2 = 0 ⟺ n_c = finrank ℚ Uhol`. The doublet hypercharges are read
      off the ladder occupation `Q = |S|/n_c` and the doublet gap `1` (banked N318 `fund2_gap_one`):
      the quark doublet's upper (`T3 = +1/2`, up-type) member is the DOUBLY-occupied colour state
      (`Q = 2/n_c`), so its hypercharge `Y_Q = Q − T3 = 2/n_c − 1/2`; the lepton doublet's upper
      member is the empty colour state (`Q = 0`, the neutrino), so `Y_L = 0 − 1/2 = −1/2`. Each SU(2)
      doublet contributes `2·(T3)²·Y = 2·(1/2)²·Y = Y/2` to the mixed moment, and there are `n_c`
      quark-colour doublets `+ 1` lepton doublet:
          `su2MixedCoeff n_c 1 = n_c·(2/n_c − 1/2) + 1·(−1/2) = (3 − n_c)/2`,
      which is `0` EXACTLY at `n_c = finrank ℚ Uhol = 3`. The SU(2)²·U(1) anomaly cancels BECAUSE the
      derived colour count is three — not by a numerical coincidence of a hypercharge table.

    ★ PIECE 3 — the Witten `SU(2)` global anomaly VANISHES (the doublet count is EVEN). A theory is
      free of the Witten SU(2) global anomaly iff the number of SU(2) doublets is EVEN. The derived
      doublet count is `finrank ℚ Uhol + finrank ℚ singlet = 3 + 1 = 4`, which is EVEN
      (`witten_even`). THE TEETH (mirroring F1's ν_R-REQUIRED): DROP the colour-singlet lepton
      doublet and the count is `finrank ℚ Uhol = 3`, which is ODD (`witten_without_lepton_odd`) — a
      Witten anomaly. So the lepton doublet is REQUIRED by Witten-anomaly freedom, just as F1's ν_R
      is required by the abelian/gravitational anomaly.

  ---------------------------------------------------------------------------
  HONEST GRADE (carry it, do NOT over-claim). THEOREM-GRADE (forced math, foundations-only over ℚ,
  grounded on the banked `finrank ℚ Uhol` / `finrank ℚ singlet` and the banked F1 involution): the
  complement-evenness of `colourIndex`; the vanishing of the SU(3)²·U(1) mixed moment; the identity
  `su2MixedCoeff n 1 = (3 − n)/2` and its vanishing at the derived colour count; the wrong-colour
  teeth; the EVEN derived doublet count and the ODD without-lepton count. MECHANISM / CANDIDATE
  identification (flagged PROSE, never a Lean equation): "the colour index is the Λ^{|S|}(fund₃)
  Dynkin index"; "T3 = ±1/2 doublet ⟹ per-doublet factor 1/2"; "up-type = doubly-occupied colour
  state, neutrino = empty state." The measured SM hypercharge table is REMOVABLE PROSE only; NO FIT.

  ---------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "anomaly / SU(2) / SU(3) / colour / hypercharge
  / Witten / doublet / quark / lepton / generation / vector-like": what remains is — over the
  derived field ℚ and the power set `Finset (Fin n)`, (1) any COMPLEMENT-EVEN functional times the
  complement-ODD functional `blCharge` sums to `0` (`mixed_anomaly_zero`), and the specific
  `colourIndex` is complement-even (`colourIndex_compl_even`), so the product-sum vanishes at
  `n = finrank ℚ Uhol`; (2) the rational `su2MixedCoeff n 1 = (3 − n)/2`, which is `0` exactly at
  `n = finrank ℚ Uhol` and NONZERO at `n = 2`; (3) `finrank ℚ Uhol + finrank ℚ singlet` is `Even`
  while `finrank ℚ Uhol` is not. No theorem STATEMENT needs a physics word; the headline TYPEs
  mention the banked `Module.finrank ℚ Uhol` and `Module.finrank ℚ singlet` (NOT free `3`, `1`, `4`).

  ⚠ FREE-FLOATING RAIL (SOUL): the headline theorems `su3_mixed_anomaly_cancels`,
  `su2_mixed_anomaly_cancels`, `witten_even` are stated at the BANKED `Module.finrank ℚ Uhol` /
  `Module.finrank ℚ singlet`, not generic `n`; the generic `mixed_anomaly_zero` / `su2MixedCoeff`
  are the construction, instantiated to the derived colour/singlet dimensions (the F1/N317/N318
  precedent). G1: `0`, `(3−n)/2`, `Even` FALL OUT of the involution / `field_simp` / `decide`, never
  premised. G2: NO empirical number in any proof (the measured hypercharge table lives only in this
  prose). ⚠ UNEARNED-IMPORT: ground field ℚ (all values ℚ-exact); NO Mathlib-ℝ/ℂ as content;
  `Finset`/`Fin`/`Even`/`Module.finrank` are standard Mathlib MACHINERY on the derived object.

  UNBROKEN: `blCharge` / `complPerm` / `sum_zero_of_compl_odd` / `blCharge_compl_odd` (N366, F1,
  ChiralGenerationAnomalyCancellation); `Uhol` / `finrank_Uhol` / `singlet` / `finrank_singlet`
  (N42c/N19, DerivationStabilizerSplit, via ChiralGenerationIsospinTrace); `Finset`/`Fin`/
  `Finset.sum`/`Module.finrank`/`Even` standard Mathlib MACHINERY on the derived object. Ground =
  derived ℚ; nothing posited; no bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no kernel-compilation bypass, no heartbeat inflation.
-/
import Phys.Algebra.ChiralGenerationAnomalyCancellation
import Phys.Algebra.ChiralGenerationIsospinTrace
import Mathlib.Tactic

open scoped BigOperators
open Finset

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

/-! ## (A) The general non-abelian mixed-anomaly vanishing (complement-even × complement-odd). -/

/-- ★★ THE MIXED-ANOMALY VANISHING LEMMA. A mixed anomaly moment is `Σ_S (idx S)·(q S)` where `idx`
    is the non-abelian quadratic index and `q` the abelian (hyper)charge. If `idx` is COMPLEMENT-EVEN
    (`idx Sᶜ = idx S`, as it is for a vector-like / conjugate-paired rep) and `q` is COMPLEMENT-ODD
    (`q Sᶜ = − q S`, as the ladder hypercharge is, banked F1 `blCharge_compl_odd`), then their
    product is complement-ODD, so the moment VANISHES by the banked F1 `sum_zero_of_compl_odd`. This
    is WHY the non-abelian mixed anomaly cancels — the SAME free sign-reversing involution as F1. -/
theorem mixed_anomaly_zero (n : ℕ) (idx q : Finset (Fin n) → ℚ)
    (heven : ∀ S : Finset (Fin n), idx Sᶜ = idx S)
    (hodd : ∀ S : Finset (Fin n), q Sᶜ = - q S) :
    (∑ S : Finset (Fin n), idx S * q S) = 0 := by
  apply sum_zero_of_compl_odd n (fun S => idx S * q S)
  intro S
  rw [heven S, hodd S]; ring

/-! ## (B) Piece 1 — SU(3)²·U(1): the colour index is complement-even (vector-like colour). -/

/-- THE COLOUR SU(3) QUADRATIC (DYNKIN) INDEX on the exterior ladder: `0` on the two colour SINGLETS
    (`|S| = 0` and `|S| = n`, the trivial reps) and `1/2` on the colour triplet/antitriplet
    (`0 < |S| < n`). At `n = 3` this is exactly the index of `Λ^{|S|}(fund₃)`: `Λ⁰ = Λ³ = 1` (index
    `0`), `Λ¹ = 3` and `Λ² = 3̄` (index `1/2`). -/
noncomputable def colourIndex (n : ℕ) (S : Finset (Fin n)) : ℚ :=
  if S.card = 0 ∨ S.card = n then 0 else 1/2

/-- ★ THE COLOUR INDEX IS COMPLEMENT-EVEN: `colourIndex n Sᶜ = colourIndex n S`. Charge conjugation
    (the Hodge complement) sends `|S| ↦ n − |S|`, which maps the singlet condition `|S|∈{0,n}` to
    itself and the triplet condition `0<|S|<n` to itself. Conjugate reps carry the SAME quadratic
    index (`T(R*) = T(R)`): colour is VECTOR-LIKE. -/
theorem colourIndex_compl_even (n : ℕ) (S : Finset (Fin n)) :
    colourIndex n Sᶜ = colourIndex n S := by
  have hle : S.card ≤ n := by simpa using Finset.card_le_univ S
  unfold colourIndex
  rw [Finset.card_compl, Fintype.card_fin]
  have hcond : (n - S.card = 0 ∨ n - S.card = n) ↔ (S.card = 0 ∨ S.card = n) := by omega
  exact if_congr hcond rfl rfl

/-- ★★★ THE `SU(3)²·U(1)` MIXED ANOMALY CANCELS over one chiral generation, grounded to the BANKED
    derived colour dimension `finrank ℚ Uhol = 3` (N42c). The colour index is complement-even
    (`colourIndex_compl_even`, vector-like colour) and the hypercharge is complement-odd (banked F1
    `blCharge_compl_odd`), so the mixed moment `Σ_S colourIndex·blCharge` vanishes
    (`mixed_anomaly_zero`). NOT free-floating — the type mentions the banked `Module.finrank ℚ Uhol`. -/
theorem su3_mixed_anomaly_cancels :
    (∑ S : Finset (Fin (Module.finrank ℚ Uhol)),
      colourIndex (Module.finrank ℚ Uhol) S * blCharge (Module.finrank ℚ Uhol) S) = 0 :=
  mixed_anomaly_zero _ (colourIndex _) (blCharge _)
    (colourIndex_compl_even _) (blCharge_compl_odd _)

/-! ## (C) Piece 2 — SU(2)²·U(1): the coefficient is (3 − n_c)/2, vanishing at the derived n_c = 3. -/

/-- THE `SU(2)²·U(1)` MIXED-ANOMALY COEFFICIENT as a function of the colour count `nc` and the number
    of lepton doublets `nl`. Each SU(2) doublet contributes its per-doublet factor `2·(1/2)² = 1/2`
    times its hypercharge; the quark doublet's upper member is the DOUBLY-occupied colour state
    (`Q = 2/nc`, up-type) so `Y_Q = Q − T3 = 2/nc − 1/2`, and the lepton doublet's upper member is
    the empty colour state (`Q = 0`, the neutrino) so `Y_L = −1/2`. With `nc` quark-colour doublets:
    `su2MixedCoeff nc nl = nc·(2/nc − 1/2) + nl·(−1/2)`. -/
noncomputable def su2MixedCoeff (nc nl : ℕ) : ℚ :=
  (nc : ℚ) * (2 / (nc : ℚ) - 1/2) + (nl : ℚ) * (-1/2)

/-- ★ THE COEFFICIENT COLLAPSES to `(3 − nc)/2` for one lepton doublet: the `nc·(2/nc)` term is the
    constant `2` (the `nc` colours each contribute `2/nc`), so `su2MixedCoeff nc 1 = 2 − nc/2 − 1/2
    = (3 − nc)/2`. The colour count enters ONLY through the `−nc/2` isospin-weighting term; the
    charge contribution is colour-count-independent. -/
theorem su2MixedCoeff_eq (nc : ℕ) (hnc : nc ≠ 0) :
    su2MixedCoeff nc 1 = (3 - (nc : ℚ)) / 2 := by
  have hne : (nc : ℚ) ≠ 0 := by exact_mod_cast hnc
  unfold su2MixedCoeff
  field_simp
  ring

/-- ★★★ THE `SU(2)²·U(1)` MIXED ANOMALY CANCELS ⟺ the DERIVED colour count is `3`. Grounded to the
    banked `finrank ℚ Uhol = 3` (quark-colour doublets) and `finrank ℚ singlet = 1` (the lepton
    doublet), `su2MixedCoeff (finrank Uhol) (finrank singlet) = (3 − 3)/2 = 0`. The Standard-Model
    "miracle" `3·Y_Q + Y_L = 0` is the identity `(3 − n_c)/2 = 0 ⟺ n_c = finrank ℚ Uhol` — the
    anomaly cancels BECAUSE the derived colour count is three. NOT free-floating — the type mentions
    the banked `Module.finrank ℚ Uhol` and `Module.finrank ℚ singlet`. -/
theorem su2_mixed_anomaly_cancels :
    su2MixedCoeff (Module.finrank ℚ Uhol) (Module.finrank ℚ singlet) = 0 := by
  rw [finrank_Uhol, finrank_singlet]
  unfold su2MixedCoeff
  norm_num

/-! ## (D) The ν_R-style teeth and W8 non-vacuity. -/

/-- ★ TEETH (W8): a WRONG colour count `n_c = 2` FAILS to cancel the SU(2)²·U(1) anomaly —
    `su2MixedCoeff 2 (finrank singlet) = (3 − 2)/2 = 1/2 ≠ 0`. The cancellation genuinely depends on
    the DERIVED colour count `3`, not on any colour count; it is not a vacuous `0 = 0`. -/
theorem su2_mixed_anomaly_wrong_colour :
    su2MixedCoeff 2 (Module.finrank ℚ singlet) ≠ 0 := by
  rw [finrank_singlet]
  unfold su2MixedCoeff
  norm_num

/-- ★★ THE WITTEN `SU(2)` GLOBAL ANOMALY VANISHES: the DERIVED doublet count
    `finrank ℚ Uhol + finrank ℚ singlet = 3 + 1 = 4` is EVEN. A theory is free of the Witten SU(2)
    global anomaly iff the number of SU(2) doublets is even. NOT free-floating — the type mentions
    the banked `Module.finrank ℚ Uhol` and `Module.finrank ℚ singlet`. -/
theorem witten_even : Even (Module.finrank ℚ Uhol + Module.finrank ℚ singlet) := by
  rw [finrank_Uhol, finrank_singlet]; decide

/-- ★★ THE WITTEN TEETH (mirroring F1's ν_R-REQUIRED): DROP the colour-singlet LEPTON doublet, and
    the doublet count is `finrank ℚ Uhol = 3`, which is ODD — a Witten SU(2) global anomaly. So the
    lepton doublet is REQUIRED by Witten-anomaly freedom, exactly as F1's ν_R (the `∅` singlet) is
    required by abelian/gravitational anomaly freedom. -/
theorem witten_without_lepton_odd : ¬ Even (Module.finrank ℚ Uhol) := by
  rw [finrank_Uhol]; decide

/-- ★ W8: the colour index genuinely takes the NONZERO value `1/2` on the colour triplet — the
    vanishing SU(3)²·U(1) moment is NOT the trivial all-zero-index case. -/
theorem colourIndex_triplet_val : colourIndex 3 {(0 : Fin 3)} = 1/2 := by
  unfold colourIndex; simp

/-! ## (E) CAPSTONE. -/

/-- ★★★ CAPSTONE — P3 the full non-abelian + Witten anomaly cancellation, paying the F1-childed debt.
    Over the colour exterior ladder grounded to the BANKED derived colour dimension
    `finrank ℚ Uhol = 3` and derived singlet dimension `finrank ℚ singlet = 1`, and using the banked
    F1 charge-conjugation (Hodge) involution: (1) the `SU(3)²·U(1)` mixed anomaly VANISHES (colour is
    vector-like, complement-even index × complement-odd hypercharge); (2) the `SU(2)²·U(1)` mixed
    anomaly VANISHES because the derived colour count is `3` (`su2MixedCoeff = (3 − n_c)/2 = 0` at
    `n_c = finrank ℚ Uhol`), while a wrong colour count `2` FAILS; (3) the Witten `SU(2)` global
    anomaly VANISHES because the derived doublet count `finrank ℚ Uhol + finrank ℚ singlet` is EVEN,
    while WITHOUT the lepton doublet the count `finrank ℚ Uhol` is ODD (the lepton doublet is
    REQUIRED, mirroring F1's ν_R). THEOREM-GRADE throughout; the SAME derived colour count `3` drives
    both the SU(2)²·U(1) cancellation AND the `3 + 1 = 4` Witten parity, and the SAME F1 involution
    drives the SU(3)²·U(1) cancellation. -/
theorem nonabelian_witten_anomaly_cancellation :
    -- Piece 1: SU(3)²·U(1) vanishes (vector-like colour, complement-even index × odd charge)
    (∑ S : Finset (Fin (Module.finrank ℚ Uhol)),
      colourIndex (Module.finrank ℚ Uhol) S * blCharge (Module.finrank ℚ Uhol) S) = 0 ∧
    -- Piece 2: SU(2)²·U(1) vanishes because the derived colour count is 3
    su2MixedCoeff (Module.finrank ℚ Uhol) (Module.finrank ℚ singlet) = 0 ∧
    -- Piece 2 teeth: a wrong colour count fails
    su2MixedCoeff 2 (Module.finrank ℚ singlet) ≠ 0 ∧
    -- Piece 3: Witten global anomaly vanishes (the derived doublet count is even)
    Even (Module.finrank ℚ Uhol + Module.finrank ℚ singlet) ∧
    -- Piece 3 teeth: without the lepton doublet the count is odd (lepton doublet required)
    ¬ Even (Module.finrank ℚ Uhol) :=
  ⟨su3_mixed_anomaly_cancels, su2_mixed_anomaly_cancels, su2_mixed_anomaly_wrong_colour,
   witten_even, witten_without_lepton_odd⟩

end Phys.Algebra
