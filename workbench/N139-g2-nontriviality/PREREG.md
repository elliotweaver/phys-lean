# N139 — PREREG (frozen GO/NO-GO + KILL before compute)

## TARGET (priority (i) of the ROADMAP §N139 frontier): THE FULL G₂ NONTRIVIALITY
A CONCRETE NON-IDENTITY octonion algebra-automorphism of the terminal algebra `O Cut`,
embedded into the observer-plane gauge stabilizer `octStab` (N137), proving the G₂ = Aut(O)
gauge group is GENUINELY NON-TRIVIAL (real non-identity content, NOT the trivial group {id}).
N138's only witness was the IDENTITY `expOEquiv 0`; this node banks a concrete NON-identity
gauge element that MOVES an octonion axis (`φ e₂ ≠ e₂`) while STILL preserving `gFormC` and the
unit.

## THE TRUNK REFRAME (W1 step 2 / THE ONE LAW) — measured first
The ticket SUGGESTS `expOEquiv D` of a banked nonzero derivation `D` (N20's 14-element basis),
but proving `expOEquiv D ≠ id` requires EVALUATING the infinite vector-exponential `tsum` in
closed form — a W9 instrument-wall risk (the predecessors' death). MEASURED ALTERNATIVE,
trunk-native: the Cayley-Dickson doubling `O Cut = CD (H Cut)` carries a CANONICAL series-free
order-2 automorphism — the TOP-HALF NEGATION `octTopNeg z = ⟨z.re, -z.im⟩` (fix the quaternion
subalgebra `H`, negate its orthogonal complement). Algebraically (verified by hand against
`CD.mul_re`/`CD.mul_im`/`CD.star_im`):
  • `octTopNeg z · octTopNeg w`.re = z.re·w.re + −(star w.im · z.im) = (z·w).re  [two sign flips cancel]
  • `octTopNeg z · octTopNeg w`.im = −(w.im·z.re + z.im·star w.re) = −(z·w).im = (octTopNeg (z·w)).im
  ⟹ MULTIPLICATIVE. `octTopNeg 1 = ⟨1,−0⟩ = 1` ⟹ UNITAL. Componentwise `•`/`+`/involutive
  ⟹ a `Cut`-linear self-equiv. `octTopNeg e₂ = ⟨0,−1⟩ = −e₂ ≠ e₂` (char Cut = 0) ⟹ NON-IDENTITY.
It plugs DIRECTLY into N138's `octBlockEndC_autC_mem_octStab` (which accepts ANY `IsAlgAutCut φ`).

This is exactly "reframe through the trunk; the difficulty dissolves" — no series, no W9 risk.
It is a genuine element of G₂ = Aut(O): the involution fixing `H` and negating `H⊥`, whose
fixed subalgebra is the quaternions (the standard order-2 G₂ element).

## GO / NO-GO
GO if the probe shows: `IsAlgAutCut octTopNeg` (multiplicative + unital, the linear-equiv built),
AND `octTopNeg e₂ = -e₂`, AND `octTopNeg ≠ LinearEquiv.refl` (non-identity), all foundations-only,
each obligation closing in < KILL.
NO-GO (→ W1 dissolution child) if multiplicativity does NOT close by `ext <;> simp [CD.mul_*] <;> ring`
within KILL, OR the non-identity step needs an unbanked `(2:Cut)≠0`-style fact that resists.

## KILL (W9 instrument-failure budget)
Per obligation: 90 s. If any single obligation (multiplicativity, the linear-equiv, the
non-identity) exceeds 90 s of compile, it is declared an INSTRUMENT failure → MEASURE the
smallest sub-piece / DECOMPOSE, do NOT inflate maxHeartbeats, do NOT grind. Whole-node soft
budget: well under the 2700 s / 90-iteration run budget — checkpoint at ~50%.

## BANK PLAN (forward)
Production `Phys/Algebra/LorentzContinuumOctStabilizerG2Nontrivial.lean`:
  `octTopNeg` (def, the LinearEquiv), `octTopNeg_apply`, `octTopNeg_mul`, `octTopNeg_one`,
  `octTopNeg_isAlgAut` (IsAlgAutCut), `octTopNeg_e2` (= -e₂), `octTopNeg_ne_refl` (non-identity),
  `octBlockEndC_octTopNeg_mem_octStab` (the concrete non-identity gauge element ∈ octStab),
  W8 `octTopNeg_moves_e2` (octBlockEndC octTopNeg genuinely moves (0,0,e₂)),
  `octTopNeg_gFormC_e2` (preserves e₂'s self-overlap = the costume anchor `1`).

## COSTUME (C171, next id) — W8 anti-vacuity
A WRONG G₂-nontriviality / concrete-automorphism / gauge-element read: the non-identity gauge
automorphism still preserves e₂'s Born self-overlap `gFormC (octTopNeg e₂) (octTopNeg e₂) = 1`;
claiming it reads 139 forces `1 = 139`. PASS_SIGNATURE `1 = 139` (ERE), DISTINCT from C170 `1=138`.

## STANDARD (applied at finalize)
UNBROKEN: octTopNeg built from the cascade's own CD doubling structure + banked N138
octBlockEndC_autC_mem_octStab + N137 octStab; no posited gauge group / G₂ / automorphism, no
Mathlib ℝ/ℂ as content. COMPLETE: foundations-only #print axioms ⊆ {propext,Classical.choice,
Quot.sound}, no sorry/axiom/native_decide. WORDS-REMOVABLE: delete gauge/G₂/automorphism/octonion
/Lorentz/stabilizer → a concrete multiplicative-unital Cut-linear self-equiv of the CD-double
`O Cut` that negates the top half, lands in the (t,x)-fixing BvC-isometry submonoid, and is ≠ id.
