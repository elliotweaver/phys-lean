# N270 PREREG — THE OBSERVABLE MATTER ARENA IS FORMALLY REAL

## TARGET (SELECTED, SELECT S1–S5, anti-bullshit gate passed — t_731701de comments 134–137)
The fold's Born positivity (gForm anisotropy, a TRUNK PRIMITIVE) lifted to the maximal matter
arena J₃(O ℚ) = H₃(O ℚ) (N5/N267) makes its banked trace form jTraceForm (N214, the
Cartan–Killing metric) POSITIVE-DEFINITE: reQ(jTraceForm A A) ≥ 0 with = 0 ⟺ A = 0 for the
general Hermitian element A = Hm d0 d1 d2 a b c. So J₃(O ℚ) is a formally-real (Euclidean)
Jordan algebra — which is WHY N269's gauge-invariant characteristic-polynomial spectrum is a
genuine REAL observable spectrum. Octonion-anchored: formal reality holds AT the cap-forced
MAXIMAL order 3 (H₄(O) not even Jordan, jordan_fails_H4) — the maximal formally-real octonionic
arena.

Production file: `Phys/Algebra/OctonionJordanFormallyReal.lean` (namespace `Phys.Algebra.HJ`).

## FREE-FLOATING RAIL (S4, confronted HARD).
Bare "trace form positive definite" is NOT octonion-specific (holds for H₃(ℝ)/ℂ/ℍ; positivity
does not FAIL below O). NON-free-floating because: (i) descends DIRECTLY from a TRUNK PRIMITIVE
(Born positivity), not a generic mechanism — same standing as N265 (no-zero-divisors also holds
below O yet is not free-floating); (ii) the octonion-SPECIFIC JOINT = formal reality AT the
cap-forced MAXIMAL order (order 4 NOT Jordan, jordan_fails_H4, octonion-specific via
jordan_cap_iff_nonassoc) — the CAPSTONE TYPE carries jordan_cap_pinned_at_three, NOT
carrier-agnostic; (iii) it GROUNDS N269. The TYPE is about the banked jTraceForm/J₃(O ℚ)/gForm,
instantiated to O ℚ — passes the "about banked objects" rail.

## DECLS (cruxes de-risked EXIT 0 foundations-only this run — probe_formal_reality + probe_tf_tie)
- `jQ` := reQ (trace (A * A)) — the real trace-square form.
- `jQ_Hm` — ⭐⭐⭐ jQ (Hm d0 d1 d2 a b c) = d0²+d1²+d2²+2·(gForm a a+gForm b b+gForm c c), a SUM OF
  ℚ-SQUARES (via selfMul_eq_smul on each entry + reQ_mul_comm; NO coordinate bash). MEASURED 11s.
- `jQ_Hm_nonneg` — ⭐⭐ ≥ 0 (nlinarith on gForm_self_nonneg + sq_nonneg). MEASURED.
- `jQ_Hm_eq_zero_iff` — ⭐⭐⭐ = 0 ↔ (all dᵢ=0 ∧ a=b=c=0) i.e. Hm... = 0 (via gForm_self_eq_zero,
  the fold ℚ-anisotropy) — POSITIVE DEFINITE / FORMAL REALITY. MEASURED, axiom-audited [propext,
  Classical.choice, Quot.sound].
- `reQ_jTraceForm_self` — ⭐⭐ reQ (jTraceForm A A) = 2 * jQ A — TIES to the BANKED N214 metric.
  MEASURED clean.
- `jTraceForm_Hm_nonneg` / `jTraceForm_Hm_pos_def` — the headline on the BANKED jTraceForm:
  reQ(jTraceForm A A) ≥ 0, = 0 ⟺ A = 0.
- W8 non-vacuity: `jQ_witness_pos` — a genuine NONZERO Hermitian element with jQ > 0 (e.g.
  jQ (Hm 1 0 0 0 0 0) = 1 > 0, or the off-diagonal jQ (Hm 0 0 0 1 0 0) = 2·gForm 1 1 = 2 > 0).
- capstone `arena_formally_real` — bundles: positive-semidefiniteness ∧ definiteness (formal
  reality) of the banked trace form ∧ the octonion-cap anchor jordan_cap_pinned_at_three
  (maximal order 3, order 4 NOT Jordan) ∧ non-vacuity.

## COST/KILL (W9). SHORT structural rewrites: unfold jQ/Hm/jTraceForm + Matrix.trace/mul entry
expansion (Fin.sum_univ_three) + selfMul_eq_smul/reQ_mul_comm rewrites + ring/nlinarith. MEASURED:
jQ_Hm 11s, tf-tie ~10s, both foundations-only. KILL: any obligation >~60s net-of-import, any
maxHeartbeats raise, any octonion coordinate decide/native_decide → STOP + reframe (ONE LAW).
Use the GLOBAL module instances (attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ)
— jQ/jTraceForm use no scalar-smul that would clash.

## SCOPE — HONESTY CLAUSE
Banks the positive-definiteness (formal reality) of the banked trace form jTraceForm on the general
Hermitian element + the octonion-cap-maximality anchor + non-vacuity ONLY; NOT "the real eigenvalues
ARE physical masses/charges" (removable prose), NOT the full spectral theorem / that the char-poly
roots are literally real (a downstream node needing eigenvalue infra), NOT "J₃(O) is THE exceptional
formally-real Jordan algebra / doesn't come from an associative *-algebra" (bigger classification
node), NOT the mixing angle (★2), NOT masses/mixings (★5).

Costume C301. max_retries=25, --max-runtime 90m, --workspace dir:/Users/elliotweaver/phys-lean.
