# N205 PREREG — THE OCTONION COMMUTATOR IS NOT A LIE BRACKET: Jacobiator = 6·associator (Malcev defect)

FROZEN BEFORE COMPUTE (GO/NO-GO + KILL).

## THE FRONT CHOSEN (W4.5 look WIDEST)
Of the §N204-superseded candidate fronts:
- (a) HYPERCHARGE NORMALIZATION (Q=T₃+Y/2): MEASURED + REJECTED for THIS node. The U(1) hypercharge
  generator's identity *inside the rank-2 g₂* is NOT cleanly derived: N203 banked that colour su(3)
  and isospin su(2) are ENTANGLED inside the simple g₂ (colour is not a Lie ideal, normalizer≠⊤),
  and g₂ has rank 2 — there is no banked commuting su(3)⊕su(2)⊕u(1) Cartan structure to read a
  convention-free Y off. Writing Q=T₃+Y/2 now still risks a posited normalization convention
  (THE ONE LAW / W8). The N204 −16 anchor normalizes the ISOSPIN length, not the hypercharge ratio.
  DEFER (consistent with N201/N202/N203 deferrals).
- (b) the COLOUR Gram-matrix analogue of N204: W4.5 re-pin of the same metric-on-generators idea
  one factor over. REJECT.
- (c) WIDEST: a genuinely DIFFERENT unbanked joint. CHOSEN ⇒ see below.

## THE TARGET (front c — genuinely DIFFERENT, theory-native, the one-cause web)
The terminal algebra `O ℚ = CD (H ℚ)` under its OWN commutator bracket `⁅x,y⁆ := x*y − y*x` is
NOT a Lie algebra: the Jacobi identity FAILS, and the Jacobiator
  `Jac(x,y,z) := ⁅⁅x,y⁆,z⁆ + ⁅⁅y,z⁆,x⁆ + ⁅⁅z,x⁆,y⁆`
equals `6 • assoc x y z` — exactly six times the banked ALTERNATING associator (Alternative.lean
`assoc`, `assoc_swap12`, `assoc_swap23`). On the cascade's own non-associating witness triple the
Jacobiator is NONZERO (`= 6 • (assoc witness)`, and `assoc witness ≠ 0` is banked
`assoc_nonvanishing`; char 0 ⇒ `6 • nonzero ≠ 0`). So `(O ℚ, ⁅·,·⁆)` is a MALCEV algebra, not a
Lie algebra — the commutator carries a measured non-Lie defect.

### Why this is GENUINELY NEW (not a re-pin, not mechanical, not vacuous)
- The OBJECT — the commutator bracket on `O ℚ` itself — was NEVER built. The banked Lie algebra is
  `derivationLieQ = Der(O ℚ) = g₂` (the EXTERNAL derivations), which IS a genuine Lie algebra. The
  INTERNAL commutator on the carrier `O ℚ` is a different object and is NOT a Lie algebra.
- The quantitative coefficient 6 and the non-Lie corollary are new relational content tying a NEW
  object (the Jacobiator) to a banked one (the alternating associator). It is the one-octonionic-cause
  web: the SAME non-associativity that stops the cascade (N2), caps the Jordan/generation tower (N5),
  and breaks left-alternativity at the sedenions (N200) ALSO obstructs the commutator from being a Lie
  bracket — forcing the gauge/symmetry algebra to be the DERIVATION algebra g₂, not the carrier's own
  bracket. A genuine "one cause, many terminations" joint.
- W8 teeth: the Jacobiator is NONZERO on the witness (the defect does not vanish — Jacobi genuinely
  fails); and `assoc` is non-vacuous (banked). Distinct false-numeric for the costume.

## PLAN (bank-as-you-go)
1. Probe (scratch, `lake env lean`): the bracket-expansion identity `Jac = Σ_even assoc − Σ_odd assoc`
   by `simp only [defs, sub_mul, mul_sub]; abel` (products treated as additive atoms); then the
   alternating collapse `Jac = 6 • assoc x y z` via `assoc_swap12`/`assoc_swap23`; then the witness
   non-vacuity `Jac witness ≠ 0`. ALL over the banked Alternative.lean battery.
2. Production `Phys/Algebra/OctonionCommutatorJacobiator.lean` (namespace `Phys.Algebra`),
   import Alternative.lean. Decls: `octBracket`, `jacobiator`, `jacobiator_eq_assoc_sum`
   (expansion), ★`jacobiator_eq_six_assoc` (HEADLINE = 6 • assoc), ★`jacobiator_witness_ne_zero`
   (W8 teeth: Jacobi fails — not a Lie algebra), and a coordinate witness if cheap.
3. Wire Phys.lean + Audits/AxiomAudit.lean (import at END of import list + #print axioms at END).
4. Costume C237: a WRONG claim that the bracket IS a Lie algebra / Jacobiator vanishes / coefficient
   ≠ 6 → false numeric `205 = 6` (DISTINCT from … C235 203=2, C236 16=204). PASS_SIGNATURE ERE.
5. Commit production + wiring + costume BEFORE the gate. Gate bg (notify_on_complete). Docs. Child
   N206 onto chain tail. kanban_complete.

## GO / NO-GO
GO iff the expansion identity + the 6•assoc collapse + the witness non-vanishing all compile
foundations-only AND the result is genuinely non-vacuous (Jacobiator nonzero on the witness).
NO-GO ⇒ if the collapse needs an unbanked alternating fact, BUILD it (W1); if it measures heavy,
decompose; if the front measures as a mechanical consequence / re-pin, look WIDER.

## KILL
KILL = 90s per obligation / 150s per file in `lake env lean`. If a single obligation exceeds 90s,
STOP and decompose/reframe (W9), do not inflate maxHeartbeats.
