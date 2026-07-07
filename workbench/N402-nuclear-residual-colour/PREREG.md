# N402 (arc-L L1, MECHANISM): NUCLEAR BINDING = RESIDUAL COLOUR

## Target
Derive the nuclear force as the RESIDUAL octonion-coherence interaction between colour singlets
— the leakage of the confinement coherence (arc I) through the coloured constituents. DERIVE the
MECHANISM; NO binding-energy number (G2 no-fit, LOUD, beyond-key).

## Module
`Phys/Algebra/NuclearResidualColour.lean`, namespace `Phys.Algebra.NuclearResidual`.
Imports: `Phys.Algebra.ConfinementAreaLaw` (bornAction, wilsonArea, plaqFactor, singlet_assoc_vanishes,
bornAction_singlet_zero, bornAction_coloured_pos, assoc_add_left/mid, wilsonArea_lt_one/strictAnti,
assoc via Alternative, assoc_one_left/mid via Rep7, u1), `Mathlib.Tactic`.

## Theorems (all on banked concrete objects; free-floating guard = types mention assoc/O ℚ/span{1,u1}/bornAction/wilsonArea)
1. `singlet_pair_no_obstruction` — a,b ∈ span{1,u1} ⟹ assoc a b x = 0 ∧ bornAction a b x = 0.
   [colour neutrality: the direct confining channel is OFF between singlets]
2. `residual_obstruction_decomp` — a_s,b_s ∈ span{1,u1}, any a_c b_c x:
   assoc (a_s+a_c) (b_s+b_c) x = assoc a_s b_c x + assoc a_c b_s x + assoc a_c b_c x.
   [THE MECHANISM: the inter-composite obstruction is carried entirely by residual (coloured) channels]
3. `composite_obstruction_is_residual` — with identity cores:
   assoc (1+a_c) (1+b_c) x = assoc a_c b_c x  (cross terms vanish via assoc_one_left/mid). [★ the weld]
4. `composite_residual_nonvanishing` — assoc (1+ι(ιJ)) (1+ι(e₂)) e₂ ≠ 0 (= assoc_nonvanishing). [teeth]
5. `residual_bornAction_pos` — 0 < bornAction(witness). [the leakage energy is real, positive]
6. `residual_short_ranged` — wilsonArea (bornAction witness) m n < 1 for 0<mn. [area-suppressed → short-ranged]
7. `residual_decays_with_separation` — plaqFactor(σ_res)^A2 < ^A1 for A1<A2. [decays with separation]
8. `direct_singlet_channel_unit_weight` — a,b∈span ⟹ wilsonArea(bornAction a b x) m n = 1.
   [direct channel unsuppressed / carries no obstruction — not the source of the short-ranged force]
9. capstone `residual_colour_mechanism` — bundle 1,3,4,5,6,8.

## Grade
MECHANISM (beyond-key, flagged). Mechanism theorems FULL; "this IS the physical nuclear force" removable prose.

## Costume
C427 `Counterexamples/NuclearResidualColourVacuityCostume.lean`, bites `1 = 427`. A wrong "colour
neutrality fails / the residual channel is vacuously zero" reading breaks it (tie to
composite_residual_nonvanishing + residual_bornAction_pos).

## Cost budget / KILL
All proofs are short algebraic rewrites over banked lemmas (bilinearity + one_left/mid + witness). No
heavy tactic. KILL: any single obligation exceeding ~30s of `lake env lean` is an instrument signal —
measure/decompose. Cold olean load ~2min expected (not a proof cost).
