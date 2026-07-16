# N428 — arc-P P3: THE FULL NON-ABELIAN + WITTEN ANOMALY CANCELLATION

Pay the F1-childed debt (ChiralGenerationAnomalyCancellation.lean lines 50–54): the mixed
non-abelian conditions SU(2)²·U(1), SU(3)²·U(1) and the Witten SU(2) global anomaly.

## THEORY-NATIVE ROUTE (three pieces, all on banked objects)

### Piece 1 — SU(3)²·U(1): vector-like colour → complement-even index × odd charge → Σ=0
The SAME F1 mechanism. The colour rep is VECTOR-LIKE: the Hodge complement `S↦Sᶜ` pairs the
colour triplet (|S|=1) with its antitriplet (|S|=2), which carry the SAME SU(3) quadratic index
(conjugate reps: `T(R*)=T(R)`), so the index is complement-EVEN; the banked hypercharge `blCharge`
is complement-ODD (F1 `blCharge_compl_odd`). even×odd=odd ⟹ Σ=0 (banked `sum_zero_of_compl_odd`).
- generic mechanism `mixed_anomaly_zero n idx q (heven) (hodd) : Σ idx·q = 0`
- concrete colour index `colourIndex n S := if S.card = 0 ∨ S.card = n then 0 else 1/2`
  (at n=3: exactly the Λ^{|S|}(fund₃) Dynkin index — 0 on the two singlets, 1/2 on triplet/antitriplet)
- `colourIndex_compl_even`
- grounded `su3_mixed_anomaly_cancels : Σ_{S:Finset (Fin (finrank Uhol))} colourIndex·blCharge = 0`

### Piece 2 — SU(2)²·U(1): cancels ⟺ derived colour count = 3 (the reframing-lens dissolution)
The SM "miracle" 3·Y_Q + Y_L = 0 becomes the identity `(3 − n_c)/2 = 0 ⟺ n_c = finrank Uhol`.
Doublet hypercharges read off the ladder occupation Q=|S|/n_c + doublet gap 1:
  Y_Q = 2/n_c − 1/2  (up-type = doubly-occupied colour state, Q=2/n_c),  Y_L = −1/2  (ν = empty, Q=0).
Coefficient = n_c·Y_Q + 1·Y_L = 2 − n_c/2 − 1/2 = (3 − n_c)/2.
- `su2MixedCoeff (nc nl : ℕ) : ℚ := nc·(2/nc − 1/2) + nl·(−1/2)`
- `su2MixedCoeff_eq (nc) (hnc) : su2MixedCoeff nc 1 = (3 − nc)/2`
- grounded `su2_mixed_anomaly_cancels : su2MixedCoeff (finrank Uhol) (finrank singlet) = 0`
- TEETH `su2_mixed_anomaly_wrong_colour : su2MixedCoeff 2 (finrank singlet) ≠ 0` (=1/2)

### Piece 3 — Witten SU(2) global anomaly: the doublet count is EVEN
Doublet count = finrank Uhol + finrank singlet = 3+1 = 4 (EVEN) ⟹ no Witten anomaly.
TEETH (mirror F1's ν_R-required): drop the lepton doublet ⟹ count = finrank Uhol = 3 (ODD) ⟹ Witten
anomaly. The lepton doublet is REQUIRED for Witten anomaly freedom.
- `witten_even : Even (finrank Uhol + finrank singlet)`
- `witten_without_lepton_odd : ¬ Even (finrank Uhol)`

### Capstone `nonabelian_witten_anomaly_cancellation` — bundles all three + teeth (non-hollow: the SAME
derived colour count 3 drives SU(2)²U(1) AND the 3+1=4 Witten parity; the complement drives SU(3)²U(1)).

## DISCIPLINE
- G1 no asserted values: 0, (3−n_c)/2, Even all FALL OUT; Y_Q/Y_L from ladder occupation + gap, never premised.
- G2 no empirical number (measured hypercharges only removable prose).
- G4 words-removable: complement-even functional × odd functional sums to 0; (3−n)/2 vanishes iff n=finrank Uhol; n+1 Even while n not.
- G5 foundations-only ⊆ {propext,Classical.choice,Quot.sound}; ground field ℚ; no Mathlib-ℝ/ℂ.
- Free-floating rail: headline TYPEs mention banked `Module.finrank ℚ Uhol`/`Module.finrank ℚ singlet`, not free 3/1/4.
- Costume C453 (next after C452), bites 1=453.
- W9: all small ℚ/ℕ + one banked involution-sum; measure probe first.

## Module
Phys/Algebra/NonAbelianAnomalyCancellation.lean (namespace Phys.Algebra).
Imports: Phys.Algebra.ChiralGenerationAnomalyCancellation (F1: blCharge, complPerm,
sum_zero_of_compl_odd, blCharge_compl_odd, Uhol, finrank_Uhol) + Phys.Algebra.ChiralGenerationIsospinTrace
(finrank_singlet via DerivationStabilizerSplit transitively).
