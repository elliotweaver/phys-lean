# N60 PREREG — THE OPERATOR SQUARE ROOT (structured/scalar case) lifting cutSqrt + consuming N59 comp_nonneg

FROZEN BEFORE COMPUTE. KILL classifies a fight as INSTRUMENT failure, not theory failure.

## THE NODE (specified against what the chain actually produced)
N59 banked the OPERATOR FORM-ADJOINT `IsEvCAdjoint` + the form-adjoint composite `g*∘g`
proved EvC-SELF-ADJOINT (`comp_isEvCSymm`) and EvC-POSITIVE-SEMIDEFINITE (`comp_nonneg`) — the
existence-of-the-positive-root hypothesis the polar/KAK boost part `exp(p)=√(g*g)` consumes.
The ROADMAP §N60 FORWARD FRONTIER names the OPERATOR SQUARE ROOT as the immediate next
prerequisite (MEASURE-FIRST priority (i)), with the CAUTION that the FULL spectral square root
over the 10-dim space is itself a sub-node — MEASURE whether a structured/diagonal (scalar-on-
eigenspace) case is bankable first.

## MEASURE-FIRST DECISION (W9)
- Option (i) OPERATOR SQUARE ROOT — CHOSEN. Avoids octonion coordinate grind. Lifts the scalar
  `cutSqrt` (N57) to the operator level and CONSUMES N59 `comp_nonneg`/`comp_isEvCSymm`.
- The FULL spectral square root of a general 10-dim EvC-self-adjoint EvC-positive-semidefinite
  operator needs diagonalization (no Mathlib spectral theory over `Cut`) = genuine HEAVY W1
  remainder → CHILD N61.
- BANKABLE NOW (the structured/diagonal case the ticket names): the operator square root of a
  SCALAR (homothety) operator `c • id` (c ≥ 0), whose positive operator root is `cutSqrt c • id`.
  This is the operator-level lift of cutSqrt — the 1-dim/isotropic eigenspace case — plus the
  abstract operator-square-root predicate and the N59 connection (g*g scalar ⟹ root exists).

## GO / NO-GO (frozen)
GO (this node LANDS) iff ALL hold, foundations-only `[propext, Classical.choice, Quot.sound]`:
  1. `IsEvCOpSqrt s g := IsEvCSymm s ∧ (∀ p, 0 ≤ EvC (s p) p) ∧ s.comp s = g` — the positive
     self-adjoint operator square root predicate.
  2. EvC scaling: `EvC (c • p) q = c * EvC p q` (and the symmetric right-slot version).
  3. `cutSmul_isEvCSymm c : IsEvCSymm (c • LinearMap.id)` — scalar operator self-adjoint.
  4. `cutSmul_comp a b : (a • id).comp (b • id) = (a*b) • id`.
  5. ★ `scalar_op_sqrt (c) (hc : 0 ≤ c) : IsEvCOpSqrt (cutSqrt c • id) (c • id)` — THE HEART:
     the operator-level lift of `cutSqrt` (self-adjoint via 3, positive via `cutSqrt_nonneg` +
     `EvC_nonneg`, squares via `cutSqrt_sq`).
  6. ★ N59 CONSUMPTION: `comp_scalar_pos (H : IsEvCAdjoint g h) (hsc : h.comp g = c • id) : 0 ≤ c`
     via `comp_nonneg` at a vector with `EvC p p > 0`; hence
     `comp_scalar_op_sqrt : IsEvCOpSqrt (cutSqrt c • id) (h.comp g)` — the polar positive part
     `√(g*g)` EXISTS in the structured case, consuming N59.
  7. `scalar_op_sqrt_unique (hb : 0 ≤ b) : IsEvCOpSqrt (b • id) (c • id) → b = cutSqrt c` —
     structured uniqueness (full spectral uniqueness childed N61).
  8. W8 NON-VACUITY: `scalar_op_sqrt_witness` concrete (`cutSqrt 16 = 4`, root of `16 • id`),
     and an in-file `¬ IsEvCOpSqrt ((5:Cut)•id) ((7:Cut)•id)` (25 ≠ 7).
  9. Costume C91 bites a WRONG operator-square-root claim → false numeric DISTINCT from the
     battery {8=4, 0=2, 27=9, 10=8, 9=4, 50=0, 1=-1}. Use `25 = 7`.
  10. Gate D0–D6 green; physics-words-removable; committed + LEDGER + ROADMAP; N61 childed.

NO-GO / DECOMPOSE: if the scalar case itself needs the general spectral machinery, or any
single obligation exceeds the KILL budget, bank whatever compiles and child the remainder.

## KILL BUDGET (W9 — instrument failure, not theory failure)
- Every obligation here is pure ordered-field + linear-algebra arithmetic (no octonion
  coordinate grind, no analysis). Expected per-lemma compile: seconds (like N58/N59 ~7s file).
- KILL: any SINGLE obligation whose isolated compile exceeds **60s** is declared an INSTRUMENT
  failure → MEASURE the smallest sub-obligation, decompose, do NOT inflate maxHeartbeats.
- NO `native_decide`, NO `maxHeartbeats` inflation, NO monolithic brute over coordinates.
- Gate D6 axiom audit (cold ~6 min) runs in BACKGROUND; do NOT block turn budget on it.

## ANTI-DRIFT (THE ONE LAW)
The operator square root is the trunk's positive root (cutSqrt = order-completeness of the
continuum) read at the operator level; `g*g ⪰ 0` is the Born self-overlap positivity (N56/N58/
N59). If the scalar case fights, the framing is wrong — return to the trunk, do NOT weaken the
target or add a hypothesis. The FULL spectral root is genuinely heavy = honest child, not a grind.

## PHYSICS-WORDS-REMOVABLE
Delete "Lorentz/boost/rotation/polar/KAK/Cartan/square-root/positive-definite/self-adjoint/
isometry/Spin/SO(9)": what remains — over the derived complete ordered field `Cut` and the
Cayley–Dickson double³ `O Cut`, for the symmetric positive-definite form `EvC`, every `c ≥ 0`,
the scalar map `cutSqrt c • id` is EvC-symmetric, EvC-positive-semidefinite, and squares to
`c • id`; it is the unique such scalar; and for `Cut`-linear `g,h` with `∀ p q, EvC(g p)q =
EvC p(h q)`, if `h∘g = c • id` then `0 ≤ c` and `cutSqrt c • id` squares to `h∘g` — pure math.
