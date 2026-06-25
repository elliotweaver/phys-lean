# PREREG — N42c: THE BRANCHING 7 = 3 ⊕ 3̄ ⊕ 1 (the complex structure J = L_{u1}|_V)

FROZEN before compute. Run 190 (fresh start — git clean at N42b 38a9c8b, NO inherited N42c WIP;
the only untracked thing is N41g stray probes, harmless).

## THE TARGET (derived from the chain, physics-words-removable)
Im(𝕆) (7-dim, banked `ImO`) splits as ⟨u1⟩ ⊕ V where V = span{e₂..e₇} = banked `imgUnit` (6-dim).
The complex structure J = L_{u1}|_V (left-mult by the banked square-root-of-−1 `u1`=e₁):
  (A) J maps V → V  (u1·e_k has c0=c1=0 for k=2..7).
  (B) J² = −id on V  (u1·(u1·e_k) = −e_k), by alternativity / the banked `complexUnit_sq`.
  (C) the rank-3 / dim_ℂ=3 split: V is a rank-3 free module over the DERIVED ℚ(i)=`Dbl ℚ`
      (scalar i ↦ J), so 6 = 2·3 ⟹ the complex 3; ⟨u1⟩ is the singlet 1. 7 = 1 ⊕ (3 ⊕ 3̄).

## GO / NO-GO
- GO if the MEASURE probe shows (A)+(B) close as cheap coordinate `ext <;> simp` (N42b pattern,
  each obligation < KILL). Then bank (A)+(B) (the complex structure) immediately as production.
- After (A)+(B) banked: attempt (C) the rank-3. Honest minimum (ticket §3): the explicit ℚ-basis
  {w₁,Jw₁,w₂,Jw₂,w₃,Jw₃} of V (3 vectors + their J-images), OR the ℚ(i)-module tower law
  finrank ℚ(i) V · 2 = 6 ⟹ 3. Pick the route the MEASURE shows is lighter.
- DECOMPOSE (W3/W9): if (C) is heavy (ℚ(i)-module instance + scalar tower nontrivial), BANK
  (A)+(B)+(the 1⊕6 ImO split) this run, child the rank-3 ℚ(i)-split as the next increment.

## KILL (W9 instrument budget)
- Per-obligation KILL = 60s. If any single `ext <;> simp` or finrank obligation exceeds 60s,
  it is an INSTRUMENT failure → MEASURE the smallest sub-obligation, decompose, do NOT inflate
  maxHeartbeats / grind. Coordinate proofs over ℚ here should be < 5s each (N42b precedent).
- NEVER run an unbounded compile in the turn budget; measure in a bounded probe first.

## TURN CHECKPOINT
- ~50% turns: (A)+(B) MUST be banked to production + committed (bank-as-you-go W9.8).
- FINALIZE (commit + complete/child) with turns to spare. NEVER run out of turns mid-task.

## W8 ANTI-VACUITY (costume C73 MUST bite)
- WRONG branching: J²=+id (involution, no complex structure — the 7 stays real-irreducible 7⊕0),
  OR dim_ℂ V read as 6 not 3, OR singlet dim 0. The WRONG claim MUST fail to compile.

## STANDING DEPENDENCY GATE (number tower)
- PURE ALGEBRA OVER ℚ. NO `import Mathlib.Data.Real`/`Complex` as content. The complexification
  is built on the DERIVED `u1` / `Dbl ℚ`, NOT a posited ℂ. Module/Submodule/finrank/LinearMap
  are MACHINERY on the DERIVED objects.
