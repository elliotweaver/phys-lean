# N47 PREREG — THE FULL SL(2,𝕆) ↠ SO⁺(1,9) COVER: the rotation matrix generator (frozen before compute)

## NODE (specified against what the chain ACTUALLY produced, ROADMAP §N47 FORWARD FRONTIER)
N46 banked the MATRIX (spinor) realization of the BOOST: `boostMat p = diag(p•1, p⁻¹•1)`,
the conjugation `actBy A M = (A·M)·Aᴴ`, and `mdet_act : mdet (actBy (boostMat p) (herm2 t x v)) = Qform t x v`.
N45 banked the ABSTRACT space rotation `rot u : (t,x,v) ↦ (t,x,u·v)` as a `Qv`-isometry under
`gForm u u = 1` (`rot_isom`), via the Born composition law `gForm_comp`.

THE GAP N47 CLOSES (part a — the LIGHT, bankable part): the SPACE-ROTATION MATRIX GENERATOR —
the matrix analogue of N46's `boostMat`, realizing N45's abstract `rot u` as a CONCRETE matrix
conjugation on the `herm2` carrier, and proving it preserves `mdet = Qform`. This is the OTHER
half of the cover beyond the N46 boost.

## THE GENERATOR (the forced concrete shape)
`rotMat u := !![ u, 0 ; 0, 1 ]`  (off-diagonal-corner unit-multiplication generator).
Then for a Born-unit `u` (`gForm u u = 1`, equivalently `u · star u = 1`):
  `actBy (rotMat u) (herm2 t x v) = (rotMat u · herm2 t x v) · (rotMat u)ᴴ`.
Recall `herm2 t x v = !![ (t+x)•1, v ; star v, (t-x)•1 ]`, `(rotMat u)ᴴ = !![ star u, 0 ; 0, 1 ]`.
Entry computation (each entry is at most a BINARY octonion product — NO triple-product
non-associativity ambiguity, because each matrix entry of the triple product is a SUM of terms
each of which associates as written by Lean's left-assoc `*`):
  (0,0): u·((t+x)•1)·star u = (t+x)•(u·star u) = (t+x)•1   [needs u·star u = 1; selfMul_eq_smul + gForm u u = 1]
  (0,1): u·v·1 = u·v
  (1,0): star v · star u = star(u·v)   [star_mul]
  (1,1): 1·((t-x)•1)·1 = (t-x)•1
  ⟹ `actBy (rotMat u) (herm2 t x v) = herm2 t x (u·v)`   (THE FORCED SHAPE, analogue of act_herm2).

## W1 REFRAME (THE ONE LAW) — why this dissolves, not grinds (the flagged W9 risk)
The ticket flags: octonion-valued `A` makes `(A·M)·Aᴴ` trigger GENUINE non-associativity of `O ℚ`.
THE REFRAME: with `rotMat u` having a SINGLE octonion in one corner (rest real-unit/zero), every
entry of the triple matrix product is a SUM whose terms are at most BINARY octonion products as
Lean writes them (`u * v`, `star v * star u`, `(t+x) • (u * star u)`). No `(a*b)*c ≠ a*(b*c)`
ambiguity ever needs resolving — the matrix multiplication writes each entry left-associated and
that IS the value. The det-preservation then dissolves EXACTLY as N45's `rot_isom`: `mdet` of the
result is `herm2_det t x (u·v) = Qform t x (u·v) = t² − x² − gForm (u·v)(u·v)`, and `gForm_comp`
gives `gForm (u·v)(u·v) = gForm u u · gForm v v = gForm v v` (since `gForm u u = 1`). So
`mdet (actBy (rotMat u) (herm2 t x v)) = Qform t x v`. This is the banked-`gForm_comp` route, NOT
a non-associative matrix determinant expansion.

## GO / NO-GO
GO if: `rotMat`, `actBy (rotMat u) (herm2 t x v) = herm2 t x (u·v)` (the forced shape),
`rotMat_isHermitian`-style self-adjointness of result, and `mdet_act_rot : mdet (...) = Qform t x v`
ALL compile foundations-only (⊆ {propext, Classical.choice, Quot.sound}), with a Born-unit
hypothesis `gForm u u = 1`, AND a concrete non-trivial witness (e.g. u1 the imaginary unit, or
u = -1) realizing `gForm u u = 1` with `rotMat u ≠ 1`.

NO-GO / DISSOLUTION-TICKET if: the forced-shape `act_herm2_rot` does NOT close under the light
tactic budget (simp + Matrix.mul_apply + Fin.sum_univ_two + selfMul + gForm_comp) — i.e. the
octonion conjugation genuinely needs a triple-product associativity lemma that is not banked.
Then: child a creative-theory-native dissolution ticket, block. NO grind.

## KILL BUDGET (W9 — compile-cost; this node's predecessors timed out on the GATE, not the proof)
- KILL per single obligation: if `act_herm2_rot` (the forced shape) does not elaborate within
  ~60s in the isolated scratch probe, it is an INSTRUMENT signal — STOP, do not raise maxHeartbeats,
  measure the smallest entry (e.g. just the (0,0) entry) and decompose / reframe.
- The N46 `act_herm2` analogue closed with `simp [...] <;> ring_nf`. Expect the same class.
- DECOMPOSE: bank `rotMat` + `act_herm2_rot` + `mdet_act_rot` first (the light part). CHILD the
  SURJECTIVITY / 2:1 covering degree `SL(2,𝕆) ↠ SO⁺(1,9)` (needs derived ℝ + group-manifold/exp —
  re-ground on ContinuumQ.Cut + Aut(𝕆)/exp stack, NO Mathlib ℝ/ℂ). The combined boost+rotation
  matrix submonoid is OPTIONAL hardening (W4.5) unless cheap.
- ANTI-TIMEOUT: bank-as-you-go (production + wire AxiomAudit import + #print axioms + commit the
  instant a lemma compiles); run the GATE in BACKGROUND; finalize with turns to spare.

## W8 ANTI-VACUITY — costume C78
The costume MUST bite a WRONG matrix-rotation isometry claim. Candidate: claim the rotation
preserves `mdet` WITHOUT the Born-unit condition (a NON-unit `u` with `gForm u u ≠ 1`), or claim
the WRONG shape `actBy (rotMat u) (herm2 t x v) = herm2 t x v` (v NOT multiplied by u). The wrong
claim MUST fail to compile. Prefer: `mdet_act_rot` discharging a `= gForm u u • Qform`-style or a
`herm2 t x v` (un-rotated) RHS forces a mismatch.

## PHYSICS-WORDS-REMOVABLE
Delete "Lorentz/boost/spinor/rotation/SL(2,𝕆)/isometry/cover": what remains is the theorem that
conjugation by `!![u,0;0,1]` (`u·star u = 1`) over the CD-double³ of ℚ maps `herm2 t x v` to
`herm2 t x (u·v)`, preserves self-adjointness, and preserves the real-part determinant
`t² − x² − gForm v v` (via `gForm (u·v)(u·v) = gForm u u · gForm v v`). No statement needs a physics word.
