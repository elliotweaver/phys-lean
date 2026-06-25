# N31 — THE AUTOMORPHISM GROUP, increment 1 (DEFINE + SEED). FROZEN PREREG.

Task t_defaac4c. Worker run. Single-flight chain tail. Parent N30b (the type-G₂/compact-form
Lie-ALGEBRA capstone: `derivationLieQ_isSimple` banked).

## THE TARGET (increment-1 scope, DEFINE + SEED — NOT the whole compact group)
Define the **algebra-automorphism group** `Aut(O ℚ)` of the terminal Cayley–Dickson algebra
`O ℚ = CD (CD (Dbl ℚ))` and bank the FORWARD structural facts that follow from the banked
algebra-level results WITHOUT yet needing analytic `exp`:
  (S1) an automorphism FIXES the unit: `φ 1 = 1` (free — a `MulEquiv`/unital alg-hom map_one).
  (S2) an automorphism PRESERVES the real part: `reQ (φ x) = reQ x`.
  (S3) an automorphism COMMUTES with conjugation: `φ (star x) = star (φ x)`.
  (S4) an automorphism PRESERVES the Born self-overlap form: `gForm (φ x) (φ y) = gForm x y`
       (hence preserves `Nrm`/the norm — "norm-preserving").
  (S5) an automorphism PRESERVES the imaginary subspace `ImO`: `x ∈ ImO → φ x ∈ ImO`.
  (S6) the infinitesimal seed: if a path of automorphisms has derivative `D`, then `D` is a
       Leibniz derivation (lands in `derivationLieQ`). For increment-1, the bankable form is
       the CONVERSE-FREE structural fact: an automorphism is `gForm`-orthogonal (S4) and fixes
       ImO (S5) — the group-level analogue of `derivationLieQ_le_skewAdjoint`. The full analytic
       `exp : derivationLieQ → Aut` is CHILDED.

## THE GROUP CARRIER (measurement-decided; default plan)
The group of multiplicative-and-additive bijections of `O ℚ` that fix scalars (ℚ-linear ring
automorphisms). `O ℚ` is a `NonAssocRing` + `Module ℚ (O ℚ)` (banked N17 `instModuleQO`). The
clean carrier: an `O ℚ ≃+* O ℚ` ring-automorphism that is ℚ-linear, OR — measure — Mathlib's
`AlgEquiv ℚ (O ℚ) (O ℚ)` if `Algebra ℚ (O ℚ)` synthesizes. The group structure is then standard
Mathlib MACHINERY on the DERIVED object (STANDARD §3 — like `Module`/`Subring`/`LieSubalgebra`
at N3/N4/N6). DEFAULT if `Algebra ℚ (O ℚ)` does NOT synthesize on `narCD`: carry the structure
as a bundled `{φ : O ℚ ≃ₗ[ℚ] O ℚ // ∀ x y, φ (x*y) = φ x * φ y ∧ φ 1 = 1}` Submonoid/Subgroup of
`(O ℚ ≃ₗ[ℚ] O ℚ)` (`LinearEquiv.automorphismGroup`), or a predicate `IsAlgAut φ` on a `≃ₗ`.

## THE FORWARD DERIVATION (theory-native; NO posited G₂, NO Mathlib G₂/Aut import)
THE TRUNK: the SAME Born self-overlap/positivity that bounded the algebra (skew-adjointness) is
what an automorphism preserves (orthogonality) — ONE cause, the group analogue.
Route for (S2) reQ-preservation (the one nontrivial piece — the rest are clean once S2 holds):
  • Banked `trace_id`: `x + star x = (2 reQ x) • 1`. ⟹ a self-conjugate element is a ℚ-scalar.
  • The QUADRATIC equation, derived from `trace_id` + `selfMul_selfconj` (`x*star x` self-conj,
    banked N17): `x * x = (2 reQ x) • x − (gForm x x) • 1` (since `x*star x = (gForm x x)•1`).
  • Apply a unital algebra automorphism φ (multiplicative + ℚ-linear + `φ1=1`) to BOTH sides:
    (A) `φx*φx = (2 reQ x)•φx − (gForm x x)•1`; the quadratic eqn at `φx`:
    (B) `φx*φx = (2 reQ φx)•φx − (gForm φx φx)•1`. Subtract:
    `0 = 2(reQ x − reQ φx)•φx − (gForm x x − gForm φx φx)•1`.
  • CASE x ∈ ℚ·1: φx ∈ ℚ·1 (φ1=1, ℚ-linear), reQ preserved directly.
  • CASE x ∉ ℚ·1: φ bijective ⟹ φx ∉ ℚ·1 ⟹ {φx, 1} ℚ-linearly independent ⟹ both
    coefficients vanish ⟹ reQ x = reQ φx (and `gForm x x = gForm φx φx` on the diagonal).
Then (S3) `φ(star x) = star(φx)`: `star x = (2 reQ x)•1 − x` (trace_id) ⟹
  `φ(star x) = (2 reQ x)•1 − φx`; and `star(φx) = (2 reQ φx)•1 − φx = (2 reQ x)•1 − φx` by S2.
Then (S4) `gForm(φx,φy) = reQ(φx*star φy) = reQ(φx*φ(star y)) [S3] = reQ(φ(x*star y)) [mult]
  = reQ(x*star y) [S2] = gForm x y`. Then (S5) `x∈ImO=ker(starL+1)` ⟺ `star x = −x`; S3 ⟹
  `star(φx) = φ(star x) = φ(−x) = −φx` ⟹ `φx ∈ ImO`.

## NON-VACUITY / COSTUME C53 (W8 — MUST bite)
The new costume asserts a WRONG automorphism claim that must FAIL to compile. Candidate: assert
that some concrete NON-norm-preserving / form-breaking ℚ-linear ring map is an automorphism, OR
assert the negation of a banked S-fact (e.g. `∃ automorphism with reQ(φx) ≠ reQ x`, or a wrong
ImO-preservation) → reduces to `⊢ False`. Anti-vacuity: the SEED facts must be applied to a
GENUINE automorphism witness (identity is the cheap witness; reuse it for non-vacuity of the
group being nontrivial-as-a-type — `1 : Aut` exists). The costume must reduce to a false core.

## GO / NO-GO
GO = (S1)–(S5) PROVED FORWARD over `O ℚ` from the banked trace_id/selfMul_selfconj/gForm/ImO/
starL, the group carrier defined, foundations-only ⊆ {propext, Classical.choice, Quot.sound},
costume C53 bites, gate D0–D6 green, registered in AxiomAudit + Phys.lean, NO posited G₂, NO
Mathlib G₂/Aut import, physics-words-removable. The analytic `exp`-over-ContinuumQ.Cut +
compactness CHILDED onto the chain tail.
NO-GO / DECOMPOSE = if the group-carrier plumbing (Algebra instance / LinearEquiv automorphism
group) or the reQ-preservation case split proves heavy, bank the carrier + the clean S-facts that
compiled, child the remainder.

## ⚠ W9 COMPILE-COST KILL BUDGET (frozen)
- KILL: any SINGLE obligation that does not elaborate within **90 s** in a bounded probe is an
  INSTRUMENT failure — STOP, do NOT inflate `maxHeartbeats`, MEASURE the smallest sub-obligation,
  DECOMPOSE. The S-facts are coordinate-free structural rewrites (trace_id/selfMul are banked),
  so each should be << 90 s. The ONLY risk is the linear-independence case split — if it drifts
  toward an 8-coordinate `decide`/`ring` blowup, that is the W9 smell: reframe through the
  banked `gForm_self_eq_zero` anisotropy, do NOT coordinate-bash.
- NEVER run an unbounded full-`Phys` compile inside the turn budget; build the NEW file alone
  first (`lake build Phys.Algebra.DerivationAutGroup`), then the gate in background.

## ⚠ TURN-BUDGET CHECKPOINT (frozen — the recurring timeout failure)
- This chain timed out on iteration budget on EVERY recent node (N28/29/30/30a/30b). Checkpoint
  at ~55% of the turn budget: if S1–S5 + carrier are not all elaborating by then, COMMIT what
  compiles (bank-as-you-go W9.8), child the remainder, FINALIZE EARLY with turns to spare. Do
  NOT end the run by running out of turns (auto-blocks). DECOMPOSE aggressively.
- BANK-AS-YOU-GO: the instant a sub-lemma elaborates clean, move it to the production file, wire
  it, COMMIT. Never hoard for a grand assembly.

## NUMERICS (W6 — re-verify, do not trust)
Re-run workbench/N22-g2-isomorphism/killing_rep.py: Killing det = 9618527719784448, NEG-DEFINITE
— the definiteness that makes the automorphism group COMPACT (the SAME Born positivity = the
trunk connection). This is the forward (childed) compactness, re-verified as the design check.
