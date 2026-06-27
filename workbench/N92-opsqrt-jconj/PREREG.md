# N92 PREREG — THE J-CONJUGATION OF A POSITIVE OPERATOR SQUARE ROOT + BOTH ROOTS OF p⁻¹

Frozen before compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## TARGET (specified against what N91 actually banked)
N91 banked `linIsom_posPart_J_conj_inv` : `(J ∘ p ∘ J) ∘ p = id`, i.e. `J p J = p⁻¹` for the
positive part `p := h∘g = g*g`, pure composition algebra (NO sqrt). The roadmap §N92 frontier
route to the compact-part lemma reduces (verified) to `p^{1/2} J p^{1/2} = J`
⟺ `J p^{1/2} J = (p^{1/2})⁻¹`, which the roadmap proves via: both `J p^{1/2} J` and
`(p^{1/2})⁻¹` are POSITIVE OPERATOR SQUARE ROOTS of `p⁻¹`, hence equal by
positive-operator-square-root UNIQUENESS `IsEvCOpSqrt s₁ q → IsEvCOpSqrt s₂ q → s₁ = s₂`.

MEASURE-FIRST finding (frozen): the general operator-sqrt UNIQUENESS over the 10-dim derived
`Cut`-module STVC without Mathlib spectral theory is the genuine HEAVY group-manifold core
(needs commuting/eigenspace-matching; the two roots live over DIFFERENT eigen-families u and
J∘u, no shortcut — confirmed the concrete forms do not trivially coincide). Per W3/W9 this
node BANKS the forced, clean, reusable SETUP pieces that uniqueness consumes, and CHILDS the
uniqueness + the lift + the compact-part lemma. This is a DECOMPOSITION landing, not a failure.

## BANKABLE THIS RUN (forced, no general uniqueness needed)
P1. `opSqrt_sigOpC_conj` (THE J-CONJUGATION OF A POSITIVE OPERATOR SQUARE ROOT):
    `IsEvCOpSqrt s q → IsEvCOpSqrt (J∘s∘J) (J∘q∘J)`. Forced: J*=J (sigOpC_isEvCAdjoint_self N90)
    ⟹ J∘s∘J EvC-self-adjoint + positive; J²=id (sigOpC_comp_self N90) ⟹ (J∘s∘J)² = J∘q∘J.
P2. `linIsom_posPart_JsqrtJ_isOpSqrt` : for an isometry g (IsQvIsomC g) with EvC-adjoint h,
    `J ∘ p^{1/2} ∘ J` is a positive operator square root of `p⁻¹` (= specOpN c⁻¹ u), where
    p^{1/2} = specOpN (cutSqrt∘c) u (N86/N88). Via P1 with s=p^{1/2}, q=p, and
    `J p J = p⁻¹` from N91 (J p J ∘ p = id) + N88 right-inverse (p ∘ p⁻¹ = id) ⟹ J p J = p⁻¹.
P3. `linIsom_posPart_inv_isOpSqrt` : `(p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u` is a positive
    operator square root of `p⁻¹`. Via specOpN_isEvCSymm + specOpN_nonneg (each (cutSqrt c_i)⁻¹≥0
    since c_i>0) + specOpN_comp (((cutSqrt c_i)⁻¹)² = (c_i)⁻¹ via cutSqrt_sq).
Non-vacuity (W8): a concrete boost a²−b²=1 instance of P2/P3 (boostEndC); the costume C123 bites
a WRONG conjugation/square-root reading reducing to a false numeric DISTINCT from C115..C122.

## GO / NO-GO
GO: P1, P2, P3 compile foundations-only, fast (KILL below), names fresh.
NO-GO → child uniqueness if any of P1–P3 itself resists (it should not — pure composition algebra).

## KILL (W9 instrument budget)
- Per obligation: 180s. Any single tactic >180s = INSTRUMENT failure → decompose, do NOT inflate.
- No maxHeartbeats inflation. No monolithic brute on expanded coordinates.
- If general uniqueness is attempted at all this run, it is a BOUNDED probe only; the moment it
  exceeds the budget it is childed (it is already pre-classified HEAVY here).
- Finalize (commit production + costume + gate bg) with turns to spare; child N93 immediately.

## CHILD (N93)
The general positive-operator-square-root UNIQUENESS `IsEvCOpSqrt s₁ q → IsEvCOpSqrt s₂ q → s₁=s₂`
→ the lift `J p^{1/2} J = (p^{1/2})⁻¹` (from P2+P3+uniqueness) → the FULL ISOMETRY-COMPACT-PART
lemma (k := g·(p^{1/2})⁻¹ preserves QvC via N91 converse metric_condition_imp_isQvIsom) →
connectedness / global reverse KAK surjectivity / Spin(9)→SO(9) exhaustion.
