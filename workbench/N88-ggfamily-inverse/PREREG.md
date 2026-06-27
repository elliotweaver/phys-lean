# PREREG — N88: THE CONCRETE (p^{1/2})⁻¹ FOR THE g*g-FAMILY (the spanning/resolution lemma)

Frozen BEFORE compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## THE NODE (MEASURE-FIRST priority (i), ROADMAP §N88 FORWARD FRONTIER)
N87 banked the ABSTRACT operator inverse `specOpN_inverse` parameterized by the
resolution hypothesis `∑ projC u_i = id`. What is NOT yet banked: that the SPECIFIC
g*g-family (the one `comp_specExists_nonneg` N86 returns on `p = g*g`) RESOLVES the
identity — the SPANNING lemma connecting the abstract inverse to the concrete
`p = specOpN c u`. THIS node banks it, hence the concrete `(p^{1/2})⁻¹` for the
g*g-family of an INJECTIVE operator `g`.

## THE TRUNK REFRAME (THE ONE LAW) — dissolves the dimension count
The classical resolution `∑ P_i = id` for a complete orthonormal basis is a dimension
count. The ROADMAP suggested strengthening `specExists_aux` to carry the resolution.
A CLEANER trunk route avoids touching N85 entirely:

  An EvC-orthonormal family `{u_i}` over which an INJECTIVE spectral operator
  `specOpN c u` decomposes AUTOMATICALLY resolves the identity.

Proof: `P := specOpN (fun _ => 1) u = ∑ projC u_i` is IDEMPOTENT (`specOpN_comp`,
`1·1=1`). Its kernel sits inside the kernel of `specOpN c u`: if `P v = 0` then every
`EvC u_k v = 0` (`specOpN_EvC_read` with l≡1), so `specOpN c u v = ∑ c_i·0·u_i = 0`.
Hence `specOpN c u` injective ⟹ `ker P = 0` ⟹ `P` injective. An INJECTIVE IDEMPOTENT
is the identity (`P(Pv−v) = Pv−Pv = 0`, P injective ⟹ `Pv = v`) — NO finite-dim, NO
dimension count. And `g*g = h∘g` is injective when `g` is: `(h∘g)v = 0 ⟹
EvC((h∘g)v) v = EvC(g v)(g v) = 0 ⟹ g v = 0` (positive-definite `EvC`, N58
`EvC_eq_zero_iff`) ⟹ `v = 0` (g injective). The strict eigenvalue positivity
`specExists_eigen_pos` N86 then gives `0 < c i`, so `cutSqrt(c i) > 0 ≠ 0`
(`cutSqrt_pos` N57), and `specOpN_inverse` N87 closes the two-sided inverse.

## GO / NO-GO (frozen)
GO if, over the banked N49–N87 + the derived ℝ Cut + the terminal algebra O Cut:
  (A) `injective_idem_eq_id`        — injective idempotent endomorphism = id (pure algebra).
  (B) `specOpN_one_idem`            — `P := specOpN 1 u` is idempotent (orthonormal u).
  (C) `specOpN_ker_sub_of_one`      — `P v = 0 ⟹ specOpN c u v = 0` (orthonormal u).
  (D) `specOpN_resolution_of_injective` — ★ orthonormal + `specOpN c u` injective ⟹
                                       `∑ projC u_i = id` (THE SPANNING LEMMA, trunk-native).
  (E) `IsEvCAdjoint.comp_injective` — `IsEvCAdjoint g h` + g injective ⟹ `h∘g` injective.
  (F) `comp_specInverse_exists`     — ★★ THE PAYOFF: for `IsEvCAdjoint g h` + g injective,
                                       `g*g = specOpN c u` (orthonormal, 0≤c_i) AND the positive
                                       square root `specOpN (cutSqrt∘c) u` has a two-sided inverse
                                       `specOpN ((cutSqrt∘c)⁻¹) u` — the concrete `(p^{1/2})⁻¹`.
  (G) non-vacuity (W8): a CONCRETE injective operator (scaled identity) producing a
                                       genuine two-sided inverse.
all foundations-only (`#print axioms ⊆ {propext, Classical.choice, Quot.sound}`), gate
D0–D6 GREEN, costume C119 bites a WRONG resolution / inverse claim at a false numeric
DISTINCT from the banked battery (… C118 21=1).

NO-GO / DECOMPOSE if any obligation resists after measure+reframe → bank the immediately
bankable structural pieces (the resolution lemma (D) is the headline), child the global
remainder (compact part `k*k=1`, connectedness, reverse surjectivity, exhaustion).

## KILL (instrument budget)
KILL = 180s per single obligation in the probe. Every obligation here is a few rewrites
over banked lemmas — if ANY single obligation exceeds 180s, that is an INSTRUMENT signal
(W9): STOP, measure the smallest sub-obligation, decompose; do NOT inflate maxHeartbeats,
do NOT grind. No obligation in this node should approach KILL (all are light rewrites).

## SCOPE (W4.5 sufficiency / W3 decompose)
THIS node: the resolution-from-injectivity spanning lemma + the concrete g*g-family inverse
(priority i — the genuine gap). The compact part `k := g·(p^{1/2})⁻¹` with `k*k = 1`
requires a composition-adjoint lemma `IsEvCAdjoint (a∘b) (b'∘a')` NOT yet banked → childed
onto the chain tail as the next forced node, together with connectedness, reverse KAK
surjectivity, and the Spin(9)→SO(9) exhaustion.

## NO bridge, NO Mathlib ℝ/ℂ as content, NO posited Lorentz group.
The field is the DERIVED ℝ `Cut`; Mathlib is MACHINERY (LinearMap, Finset.sum,
injective_iff_map_eq_zero) on DERIVED objects (STANDARD §3).
