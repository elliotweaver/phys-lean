# N43 PREREG — THE SPACETIME SIGNATURE (1,9) from the terminal octonion structure

FROZEN before compute. GO/NO-GO + KILL + turn checkpoint.

## FRONT CHOICE (W4.5 + W1)
Two candidate fronts in ROADMAP §N43:
  (i)  generation cap = 3  → REJECTED as the node: ALREADY BANKED. `Phys/Algebra/JordanTower.lean`
       (`jordan_cap_iff_nonassoc`, n=4 fails ⟺ 𝕆 non-assoc) + `Phys/Algebra/HermitianJordan/PieceBfinal.lean`
       (`jordan_cap_pinned_at_three`: order-3 Jordan identity HOLDS, order-4 FAILS). Re-deriving it =
       W4.5 gold-plating (re-confirm an established target). NOT the forward node.
  (ii) SPACETIME SIGNATURE → CHOSEN. The genuine unbanked frontier.

## THE TARGET (forced, NOT posited)
The trunk: Born = self-overlap = positivity. Banked `Phys/Algebra/DerivationCompact.lean`:
`gForm v v = Σ_{j} (cⱼ v)²` (`gForm_self_sum_sq`), `0 ≤ gForm v v` (`gForm_self_nonneg`),
`gForm v v = 0 ↔ v = 0` (`gForm_self_eq_zero`) — the Born form on O ℚ is POSITIVE-DEFINITE (8,0).

The 2×2 Hermitian octonion matrices H₂(𝕆):  M(t,x,v) = !![(t+x)•1, v; star v, (t−x)•1],
t,x ∈ ℚ (real diagonal forced by Hermiticity), v ∈ O ℚ. Its determinant (defined honestly as
reQ(M₀₀·M₁₁ − M₀₁·M₁₀), real-valued, NO Mathlib Matrix.det which needs CommRing) reduces via the
banked `selfMul` (v·star v = ι(Nrm v)) to the quadratic form

        Q(t,x,v) = t² − x² − gForm v v   on the 10-dim space  V = ℚ × ℚ × (O ℚ).

The Born positivity (the −gForm v v block, rank 8, negative-definite) + the hyperbolic t²−x² plane
(signature (1,1)) ⟹ Sylvester signature (1, 9): ONE timelike, NINE spacelike. The ONE time is FORCED
by the 2×2 Hermitian determinant; the 8 of the 9 space dims are FORCED by Born positivity = 8 squares.

## DELIVERABLES (bank-as-you-go, in order)
  D1 (scalar core — the FORCED content):
     - `herm2 t x v : Matrix (Fin 2) (Fin 2) (O ℚ)` the Hermitian matrix; `herm2_isHermitian` (Mᴴ = M).
     - `herm2_det t x v : ℚ` the real determinant; `herm2_det_eq : herm2_det t x v = t^2 - x^2 - gForm v v`.
     - `Qform (t x : ℚ) (v : O ℚ) : ℚ := t^2 - x^2 - gForm v v`; `Qform_eq_det`.
     - `Qform_time : Qform t 0 0 = t^2` ; `Qform_time_pos : t ≠ 0 → 0 < Qform t 0 0`  (timelike line).
     - `Qform_space : Qform 0 x v = -(x^2 + gForm v v)` ; `Qform_space_nonpos : Qform 0 x v ≤ 0`
       ; `Qform_space_def : Qform 0 x v = 0 → x = 0 ∧ v = 0` (space block negative-DEFINITE, via Born).
  D2 (the signature PIN — exactly one time, the load-bearing maximality):
     - `V := ℚ × ℚ × O ℚ`; `timeSub`/`spaceSub : Submodule ℚ V`; `finrank timeSub = 1`, `finrank spaceSub = 9`.
     - `pos_subspace_dim_le_one`: any W with Q>0 on nonzero elts has finrank ≤ 1 (∵ W ⊓ spaceSub = ⊥,
       spaceSub dim 9 in dim-10 ⊤, finrank_sup_add_finrank_inf). THE "exactly ONE time" theorem.
     - `signature_one_nine`: the packaged headline.
  If D2's finrank machinery is heavy → BANK D1, CHILD D2 (the maximality pin) onto the chain tail (W3).

## COSTUME C74 (W8 — MUST bite a WRONG signature)
The WRONG claim: the space block is POSITIVE (signature (2,8)/Euclidean reading) — i.e.
`Qform 0 x v = x^2 + gForm v v` (a SECOND time direction / no minus on space). Supplying the banked
`Qform_space` (= −(x²+gForm v v)) where `= +(x²+gForm v v)` is demanded → sign type mismatch, MUST fail.
Signature: bites a wrong-sign space-block claim.

## GO / NO-GO
GO if D1 reduces cleanly (det = t²−x²−gForm and the definiteness facts) — the FORCED scalar signature.
NO-GO / reframe if the det does NOT reduce to t²−x²−gForm v v (would mean the form is not the trunk's
Born positivity → THE ONE LAW, return to trunk, do not posit a form).

## KILL (W9 — per-obligation 60s)
Any single obligation (the det reduction `ext/simp` over the 2×2 O ℚ matrix; any finrank computation)
exceeding 60s wall in a bounded probe = INSTRUMENT wall → MEASURE the smallest sub-obligation, decompose,
prefer structural reduction (selfMul/reQ-linearity) over coordinate expansion. NEVER an unbounded compile
in the turn budget. Matrix is 2×2 (2-term sums) — expected cheap; if not, the framing is wrong.

## TURN CHECKPOINT
At ~50% turns: D1 must be committed to production (new file Phys/Algebra/SpacetimeSignature.lean) or
DECOMPOSE. FINALIZE (commit + LEDGER + ROADMAP + child) with turns to spare. NEVER run out of turns.

## STANDING GATES
Pure algebra over ℚ — NO Mathlib ℝ/ℂ as content (the signature is over ℚ; Sylvester inertia is a
ℚ-statement). Matrix/Submodule/finrank/LinearEquiv = MACHINERY on the DERIVED O ℚ. Physics-words-removable:
delete "spacetime/Lorentzian/Minkowski/time/space/signature" → a quadratic form on the self-adjoint
2×2 matrices over the Cayley–Dickson double of a double of a double of ℚ has Sylvester inertia (1,9).
