# N44 PREREG — THE CHIRALITY BLOCK (front ii of the §N44 forward frontier)

FROZEN before compute. Run 194 (task t_b316bbe3). Production tree clean at N43 (333f925),
NO inherited WIP for N44 (only stale N41/N42 workbench scratch — untracked, ignored).

## FRONT CHOICE (W1 reframe + W9 measure-first)
Of the two §N44 candidate fronts:
 (i) LORENTZ ISOMETRY GROUP — det-multiplicativity of `herm2_det` under `M ↦ A M A†` over the
     NON-associative `O ℚ` requires expanding a 2×2 octonion-matrix product determinant; a genuine
     W9 risk (coordinate blow-up over a non-associative ring), and the full group is heavy.
 (ii) CHIRALITY BLOCK — the deepest "one cause, many terminations" claim. ALL building blocks are
     ALREADY BANKED and LIGHT: the associator `assoc` + `assoc_nonvanishing` witness (Alternative.lean),
     the `LinearMap` left/right-multiplication pattern (JO in DerivationStabilizerSplit.lean),
     distributivity `mul_add_na`/`add_mul_na`, scalar laws `qsmul_mul_left`/`qsmul_mul_right`, and
     `not_associative` (Octonion.lean — the SAME loss that stopped the cascade and, via
     `jordan_cap_iff_nonassoc`, capped the generation tower at 3).
CHOICE: **(ii) the CHIRALITY BLOCK** — forced + tractable + the genuine-novelty one-cause connection.

## THE TARGET (a PROVED theorem, never asserted)
The two chiralities = the LEFT and RIGHT regular representations of the terminal algebra `O ℚ`:
  `LeftMul a  : O ℚ →ₗ[ℚ] O ℚ`,  `x ↦ a · x`   (left action)
  `RightMul b : O ℚ →ₗ[ℚ] O ℚ`,  `x ↦ x · b`   (right action)
The ONE-CAUSE biconditional:
  `chirality_commute_iff_assoc :
     (∀ a b, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
       ↔ (∀ x y z : O ℚ, (x · y) · z = x · (y · z))`
  — L and R commute for all a,b  ⟺  the algebra associates (the middle slot IS the associativity var).
The HEADLINE block:
  `chirality_block : ¬ ∀ a b, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a)`
  proved by `not_associative ∘ chirality_commute_iff_assoc.mp` — the left/right (chirality) structures
  CANNOT both act as commuting independent representations, BECAUSE the terminal algebra is
  non-associative: the SAME octonionic non-associativity that (a) stopped the doubling cascade and
  (b) capped the Hermitian-Jordan generation tower at 3, now (c) BLOCKS the left/right commutation.
  ★ THE ONE-CAUSE LINK: `chirality_block` and `jordan_cap_iff_nonassoc` and `not_associative` all
  route through the identical `not_associative` fact — one cause, three terminations.
Plus a CONCRETE witness (sharper non-vacuity): the specific banked non-associating triple gives a
specific (a,b) whose L and R do NOT commute (from `not_associative_witness`).
The commutator identity (the lever): `[L_a, R_b] x = a·(x·b) − (a·x)·b = −assoc a x b`.

## GO / NO-GO
GO if: `LeftMul`/`RightMul` elaborate as ℚ-LinearMaps via banked distributivity+scalar laws;
`chirality_commute_iff_assoc` proves by `LinearMap.ext`/`funext` unfolding `.comp` apply to the
product identity; `chirality_block` closes via the banked `not_associative`; #print axioms ⊆
{propext, Classical.choice, Quot.sound}; costume C75 (L,R ALWAYS commute) FAILS to compile.
NO-GO / DECOMPOSE if: any obligation exceeds KILL.

## KILL (W9 instrument budget)
Per-obligation KILL = 60s. If any single lemma's elaboration exceeds 60s in a bounded probe, it is
an INSTRUMENT failure → measure/decompose/reframe, NOT a longer grind. Expected: ALL well under
KILL — every piece is `ext`/`simp`/`rfl`-shaped on already-banked levers; no coordinate bash, no
brute normalizer (the one-cause link DISSOLVES the would-be non-associative computation through the
banked `not_associative`, exactly the W1 trunk-reframe that made `JO_sq` cheap in N42c).

## TURN CHECKPOINT
~50% of turn budget: production file must be COMPILING + COMMITTED (bank-as-you-go). Finalize
(gate + LEDGER + ROADMAP + child + complete) with turns to spare. NEVER run out of turns mid-task.

## PHYSICS-WORDS-REMOVABLE (STANDARD §2)
Delete "chirality/handedness/left-handed/right-handed/spin/Weyl": the statement is "the left- and
right-multiplication operator families on the Cayley–Dickson double of a double of a double of ℚ do
NOT all commute — equivalently the algebra is non-associative." Pure math; names do zero work.

## COSTUME C75 (W8 anti-vacuity)
WRONG claim: L and R ALWAYS commute (`∀ a b, (LeftMul a).comp (RightMul b) = (RightMul b).comp
(LeftMul a)`) — the associative-misreading. MUST FAIL to compile (refuted by `chirality_block`).
Mechanism (C74-style type mismatch): supply the banked `chirality_block : ¬(∀…)` where the positive
`(∀…)` is demanded → type mismatch. PASS_SIGNATURE fixed AFTER observing the real error.
