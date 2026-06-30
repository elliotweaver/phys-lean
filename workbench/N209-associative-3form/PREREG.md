# N209 PREREG — frozen GO/NO-GO + KILL before compute

## Front survey (W4.5 look WIDEST, MEASURE-FIRST W9)
- (a) HYPERCHARGE NORMALIZATION (Q=T₃+Y/2): REJECTED AGAIN (deferred N201–N208). No
  convention-free Y anchor inside rank-2 g₂; N203 entanglement blocks a commuting
  su(3)⊕su(2)⊕u(1) Cartan; N204 −16 anchors the ISOSPIN length not the Y ratio. Risks a
  posited convention (THE ONE LAW / W8).
- (b) MOUFANG / BIMODULE identity for O ℚ: REJECTED. Just a restatement of the banked
  alternative laws (mul_mul_left / mul_mul_right / alt_flex) in Alternative.lean.
- (c) Malcev / Jacobi for octCross: REJECTED as W4.5 re-pin of the same N205 Jacobiator object.
- (d) WIDEST — a genuinely DIFFERENT object. The 7-dim cross product octCross (N206) and the
  Born form gForm (N24) ASSEMBLE into the totally-antisymmetric trilinear CALIBRATION 3-FORM
  φ(x,y,z) := gForm x (octCross y z) on Im(O ℚ) — the associative 3-form whose stabilizer in
  GL(7) is exactly G₂. NEVER BUILT. CHOSEN front.

## Why (d) is genuinely NEW (not a re-pin / not a mechanical consequence)
- DIFFERENT OBJECT: a degree-3 SCALAR totally-antisymmetric trilinear FORM Im×Im×Im → ℚ.
  NOT octCross (bilinear VECTOR, N206); NOT the scalar Lagrange norm (degree-2 quadratic,
  N206); NOT the contraction octCross_contraction (degree-3 VECTOR identity, N208); NOT the
  full-algebra Jacobiator (N205); NOT the metric gForm alone (degree-2, N24).
- The genuinely-new STRUCTURAL content is TOTAL ANTISYMMETRY: φ is alternating under every
  transposition AND cyclic. The cyclic symmetry φ(x,y,z)=φ(y,z,x) is the real-part
  TRACE-ASSOCIATIVITY of the octonion product on imaginary elements — a fact NEVER banked
  (reQ-associativity / reQ trace cyclicity are not in the chain). It is the form whose
  invariance group IS the gauge group g₂ = Der(O) — the calibration.

## The target (GO criteria)
DONE = a production file Phys/Algebra/OctonionAssociative3Form.lean banking:
  1. def assoc3 (x y z : O ℚ) : ℚ := gForm x (octCross y z)   [the calibration 3-form]
  2. assoc3_eq_reQ : for x,y,z ∈ ImO, assoc3 x y z = reQ (x * (y * z))  (or the clean
     real-part form the probe settles) — the correction term gForm·1 vanishes on ImO.
  3. assoc3_cyclic : assoc3 x y z = assoc3 y z x  (x,y,z ∈ ImO) — TRACE-ASSOCIATIVITY,
     the genuinely-new lever.
  4. assoc3_antisymm (at least one transposition): assoc3 x y z = − assoc3 y x z
     (or = − assoc3 x z y) — from octCross_antisymm (N206) + gForm symmetry.
  5. (total antisymmetry assembled from 3+4 — cyclic + one swap ⟹ alternating.)
  6. W8 teeth: a witness on three orthonormal imaginary units (u1, u2, octCross u1 u2 or a
     banked triple) with assoc3 = ±1, a _coord lemma, and a _ne_zero.
All foundations-only [propext, Classical.choice, Quot.sound]; gate D0–D6 green; costume C241
biting a WRONG numeric DISTINCT from the battery (use a pair like (= 209) or (1 = 209)).

## KILL (W9 instrument budget)
- KILL = 90s / 200000 heartbeats per obligation. If reQ-associativity (the cyclic lever)
  does NOT close cheaply (coordinate simp+ring, or via banked star/reQ lemmas) within a
  bounded probe, MEASURE the smallest sub-obligation; if it is a genuine W9 beast, DECOMPOSE
  (bank assoc3 + assoc3_eq_reQ + antisymm first, child the cyclic lever as a dedicated
  dissolution node). Do NOT inflate maxHeartbeats; do NOT throw a monolithic decide/ring at a
  fully-expanded 8-coordinate goal.
- If the cyclic symmetry turns out to require reQ-associativity that genuinely fails for
  non-alternative reasons → THE ONE LAW: return to the trunk, do not weaken. (It should hold:
  the octonion trace form is associative ⟨xy,z⟩=⟨x,yz⟩ on the alternative algebra.)

## Anti-vacuity (W8)
The costume must bite the GENUINE total-antisymmetry / non-degeneracy content: a WRONG claim
that φ is symmetric / vanishes on the witness triple must force a false numeric. The witness
φ(triple) = ±1 must be a real nonzero value (the 3-form is non-degenerate), not 0=0.

## Name-collision guard (check before finalize)
assoc3, assoc3_eq_reQ, assoc3_cyclic, assoc3_antisymm, assoc3_alt, assoc3_witness,
assoc3_witness_coord, assoc3_witness_ne_zero — grep across Phys/ Counterexamples/ Audits/ Phys.lean.
