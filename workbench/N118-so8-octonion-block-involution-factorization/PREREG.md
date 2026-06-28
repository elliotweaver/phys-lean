# N118 PREREG — THE OCTONION-BLOCK REFLECTION-INVOLUTION + FACTORIZATION (the SO(8) reassembly)

FROZEN before compute. This is the GO/NO-GO + KILL contract.

## SPECIFICATION (against what the chain ACTUALLY produced)

ROADMAP §N118 priority (i) names the IMMEDIATELY-BANKABLE structural piece: the REASSEMBLY of
N117's octonion-block deflation step — the octonion-block analogue of N116's
`inflate_deflate_id` / `deflate_factorization`.

N115 banked the x-deflation STEP, N116 the x-REASSEMBLY (factorization), N117 the OCTONION-BLOCK
deflation STEP (`octDeflate_step`). The x-motion half is COMPLETE. What remains is the octonion-
block REASSEMBLY: `octDeflate e w` is a REFLECTION (an involution), so the factorization
`T = octDeflate e w · (octDeflate e w · T)` is immediate once the involution is banked.

## THE ⚠ MEASURE-FIRST FINDING (resolves the ticket's "±1" warning — ALREADY BANKED)

The ticket warns: "a single biMulLin n n with unit-imaginary n is an involution ONLY up to the
global sign the half-turn carries — MEASURE the exact octDeflate e w · octDeflate e w".

MEASUREMENT RESULT (from the banked chain, no new compute needed): N102's
`biMulLin_imag_involutive` (Phys/Algebra/LorentzContinuumGenerationConverseCompact.lean:136)
ALREADY PROVES `(biMulLin u u).comp (biMulLin u u) = LinearMap.id` — EXACTLY `id`, i.e. +1 on
EVERY block (the (t,x) block is fixed pointwise by biMulLin; on the v-block the two-sided
half-turn squared is the full turn = identity). The "±1" is RESOLVED: +1, no global sign. A π
half-turn applied twice is a 2π full turn = the identity. So the involution is NOT a new heavy
measurement; it is a direct application of a banked N102 theorem to the normalized bisector `n`.

`biMulLin_imag_involutive` requires hypotheses:
  - `husq : u * u = -1`  (the unit-imaginary square = -1, NOT `-(gFormC u u)·1` form — need the
    pure `-1` form; `octRefl_mul_self_imag` gives `m*m = -(gFormC m m)·1`, and for the unit
    bisector `gFormC n n = 1` (octBisector_unit), so `n*n = -(1)·1 = -1`).
  - `hL : ∀ w, u * (u * w) = -w`  (from `mul_mul_left n w : n*(n*w) = (n*n)*w = (-1)*w = -w`).

Both hypotheses for `n := r⁻¹•(e−w)` follow from banked facts: the unit bisector
`octBisector_unit` (n is a Born-unit), `octRefl_mul_self_imag` (needs `star n = -n`, which holds
since `n` is a scalar multiple of the imaginary `e−w`), and the alternative law `mul_mul_left`
(N5b). NO new associativity, NO coordinate brute, NO new heavy compute.

## GO / NO-GO

GO target (the deliverable, mirroring N116 `deflate_factorization`):
  1. `octBisector_imag` — `star n = -n` for the normalized bisector (imaginary, scalar mult of e−w).
  2. `octDeflate_sq_neg_one` — `n * n = -1` (from octRefl_mul_self_imag + octBisector_unit).
  3. `octDeflate_mul_mul_left` — `∀ z, n*(n*z) = -z` (from mul_mul_left + octDeflate_sq_neg_one).
  4. ★ `octDeflate_involution` — `octDeflate e w * octDeflate e w = 1` (THE REFLECTION INVOLUTION,
     from biMulLin_imag_involutive N102). The immediately-bankable structural piece.
  5. ★★ `octDeflate_factorization` — for any octonion-block QvC-isometry T with T(0,0,e)=(0,0,w),
     w≠e, e unit-imaginary: `T = octDeflate e w · (octDeflate e w · T)` (mirrors deflate_factorization;
     uses octDeflate_involution + mul_assoc + one_mul). The right factor octDeflate e w · T FIXES
     (0,0,e) by octDeflate_step (N117); the left factor octDeflate e w is one explicit block reflection.
  6. ★★ `octDeflate_factorization_stabilizer` — packages both (right factor e-fixing AND T is the
     reflection of it), mirroring deflate_factorization_stabilizer.
  7. W8 teeth: a concrete factorization witness on (0,0,je2)/(0,0,e2) reading a deep coordinate.

NO-GO (block + dissolution ticket) ONLY if: the involution genuinely does NOT reduce to N102's
`biMulLin_imag_involutive` after honest attempt (it should — `n` is a unit-imaginary). The GLOBAL
SO(8) octonion-block exhaustion (the full iteration to surjectivity) and the operator topology over
Cut stay the CHILDED remainder either way — this node banks the REASSEMBLY piece, NOT the global.

## KILL BUDGET (W9)

KILL = 90s per single obligation. This is a LIGHT node (N116 was cached ~7.4s; N117 isolated
typecheck ≤ a few s). Every lemma is a structural rewrite through banked levers
(biMulLin_imag_involutive, octRefl_mul_self_imag, mul_mul_left, octBisector_unit, octDeflate_step,
mul_assoc). NO native_decide, NO inflated maxHeartbeats, NO monolithic brute, NO coordinate
expansion. If ANY single obligation approaches 90s → it is an INSTRUMENT failure: STOP, the framing
is wrong, reframe through the banked involution. Production build expected cached < 30s.

## COSTUME (next id C150)

Must bite a WRONG octonion-block reflection-involution / factorization coordinate. A false numeric
DISTINCT from C115 1=7 … C147 1=103, C148 3/5=107, C149 1=109. Reuse banked objects (octDeflate,
the witness factorization on e2/je2). The WRONG claim must FAIL to compile. Candidate: a wrong
involution/factorization coordinate read reducing to e.g. `1 = 111`.

## ANTI-TIMEOUT (W9)

Bank-as-you-go: the instant the production file typechecks clean in isolation, wire (Phys.lean +
AxiomAudit at END of import list, currently last import is
`Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation`) + build olean + independent audit
+ costume + commit BEFORE polishing. Then IMMEDIATELY child the next node + complete. Gate in bg.
Checkpoint at ~50% turns. Finalize with turns to spare.

## STANDARD

UNBROKEN: every object from the banked chain (N102 involution, N115 gFormC_pos_of_ne, N116
factorization template, N117 octDeflate/octDeflate_step, N5b mul_mul_left, N56/N57) over the
derived ℝ Cut + O Cut. NO posited Lorentz group, NO Mathlib ℝ/ℂ as content, NO bridge.
COMPLETE: foundations-only, independently audited vs built olean.
WORDS-REMOVABLE: delete reflection/involution/factorization/isometry/SO(8)/deflation/octonion-block
→ pure linear algebra over the derived field: for unit-imaginary e≠w with n the normalized bisector,
biMulLin n n composed with itself = id; consequently any Cut-linear QvC-preserving T with
T(0,0,e)=(0,0,w) factors as biMulLin n n · (biMulLin n n · T).
