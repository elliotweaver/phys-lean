# N2d-hard — PREREG (run 25, retry of timed-out run 24). Frozen before production Lean.

## STATUS of prior run (24): TIMED OUT at 90 iterations. Left workbench numerics +
scratch Lean, NO committed production work. This run: VERIFY independently (W6), bank
the forward law EARLY (de-risk timeout), then attempt backward; decompose if needed.

## What the numerics decisively settle (re-verified this run, exact rational/symbolic)

TARGET: `Nrm` multiplicative on `CD A` ⟺ `A` associative — the forced-stop iff.

### FORWARD (the bankable easy direction, generalized to the ℍ→𝕆 rung)
- min_hypothesis.py: base C,H → CD-Nrm MULTIPLICATIVE (0 fails); base O → FAILS (394/400).
  The link is ASSOCIATIVITY of the base (H is associative-NONcommutative and PASSES;
  O is the first non-associative base and FAILS). transpose-2×2 (assoc, self-overlap
  NOT central) FAILS → centrality is load-bearing.
- ★ CORRECTED SCOPE FINDING (anti-overclaim, W8 + THE ONE LAW): the abstract hypothesis
  "associative + self-overlap central + sym" is NOT sufficient. quadratic_forward.py: over
  a FREE quadratic *-algebra (trace+norm central) the defect has 12 surviving terms ≠ 0.
  Multiplicativity needs the base to be a genuine COMPOSITION algebra — which in the cascade
  means the base is itself a doubled commutative algebra `CD B` (B a CommRing). So the HONEST
  forward generalization is: `Nrm` multiplicative on `CD (CD B)` for `[CommRing B][StarRing B]`.
  This is STRICTLY stronger than banked `Nrm_mul_of_comm` (which needs [CommRing A], i.e. only
  the ℝ→ℂ, ℂ→ℍ rungs) — it covers the ℍ→𝕆 rung where the base `CD B` is associative-NONcommutative.
  I will NOT claim the false abstract "assoc+central ⟹ mult".

### BACKWARD / contrapositive (A non-assoc ⟹ Nrm NOT mult on CD A): GENUINE HURWITZ DEPTH
- The single-associator-witness route (task attack b) is NUMERICALLY REFUTED (3 independent):
  find_witness/conj_witness (no form D=λ·[a,b,c]); general_witness/witness_at_O/reframe_M/
  witness_rich (NO uniform form bites all 168 non-associating O triples); span_test/span_conj
  (the associator is NOT in the Q-span of the norm-defects). MUST NOT retry this route.
- The honest route is ALTERNATIVITY: Nrm mult ⟹ (polarization) ⟹ CD A alternative ⟹ A assoc.
  This is the easy half of Hurwitz's theorem and is a dedicated theory-native dissolution node.

## SCOPE DECISION (W1 step 3 + W3 decompose) — frozen

BANK THIS RUN (real new forced content):
  - ★ F1 `Nrm_mul_of_doubled_base`: `[CommRing B][StarRing B] (x y : CD (CD B)) →`
    `Nrm (x*y) = Nrm x * Nrm y`. The composition law SURVIVES the ℍ→𝕆 step (base `CD B`
    associative-noncommutative). Proof: `ext` the A=CD B equation into B-components (B CommRing),
    `simp` CD products down to B, close with `ring`.
  - ★ F1 instantiated at the last associative base: `Nrm` multiplicative on `O R = CD (H R)`
    (non-vacuity: real associative-noncommutative base, the ℍ→𝕆 rung).
  - Combined with banked `genNrm_not_mul_at_S` (law DIES at S = CD(O)): the forced-stop picture
    — law holds while base associative, dies exactly when base loses associativity.

CHILD (immediate next node, dissolution ticket, linked onto the tail; BLOCK this node on it):
  N2d-hard-2 — the GENERIC BACKWARD/contrapositive `A non-assoc ⟹ ¬(Nrm mult on CD A)` for
  EVERY base, via the ALTERNATIVITY route (Nrm mult ⟹ CD A alternative ⟹ base associative).
  The single-witness route is REFUTED and must not be retried. Genuine Hurwitz depth.
  ONLY child if backward does not close cleanly THIS run after forward is committed.

## GO / NO-GO (frozen)
GO to bank F1 iff it compiles foundations-only AND the costume bites. After F1 committed,
ATTEMPT backward; GO to close the full iff iff the alternativity route compiles foundations-only;
else NO-GO ⇒ decompose (child the backward, block).

## KILL (a fight = INSTRUMENT failure, return to trunk; never patch)
  K1. If F1 needs a hypothesis beyond "base = CD B" (i.e. beyond what the doubling actually
      carries), the framing is wrong — re-derive, do NOT add a posit.
  K2. Do NOT retry the single-associator backward route (refuted). Do NOT weaken to a vacuous
      one-directional shell banked as the "iff." Do NOT claim the false abstract "assoc+central".
  K3. F1 must be NON-VACUOUS: instantiate at O R (real associative-noncommutative base ℍ).

## Costume that BITES (one row, scripts/costume_manifest.tsv) — C12
  A wrong forward claim must FAIL to compile: "Nrm stays multiplicative one rung further,
  on CD (CD (CD B)) = the sedenion level" (i.e. claiming F1's conclusion at the non-associative
  base) → reduces to a false numeric (the banked genNrm_not_mul_at_S contradiction, 0 = 4).
