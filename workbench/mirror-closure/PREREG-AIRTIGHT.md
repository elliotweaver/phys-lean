# PREREG — mirror-closure airtight arc (N674–N676), frozen 2026-08-08 BEFORE any Lean compute
Owner directive (2026-08-08): "this needs to be rock solid, air tight… do all on auto-pilot…
drive this home using all of our standards." Both formerly-deferred residuals are IN SCOPE:
past rulings (term-language not required) were made at the end of a long proof stretch and are
explicitly re-opened by the owner.

## THE THREE NODES (linear chain, single-flight: N674 → N675 → N676)

### N674 — MirrorRootGlobal (H1 + H4: the domain hole)
THEOREM TARGETS (exact statements frozen):
1. `residual_zero_neg : residual 0 = -1` (definitional).
2. `residual_one_pos : 0 < residual 1` — from F0_lo − (16/9)·κ_hi − 1 > 0.
   RECON (Fractions, this dir): F0_lo = 3425900228061987/25e12; κ_hi = 106103295395/1e12;
   c_hi = (16/9)·κ_hi = 188628587368/1e12·(1/… exact in recon.json);
   F0_lo − c_hi − 1 ≈ 135.84738104177725 > 0. ✓ (verified pre-Lean)
3. `residual_strictMono_on_pos_le_one : 0 < a → a < b → b ≤ 1 → residual a < residual b`.
   Bound: F0 − (16/9)κ(a²+ab+b²) ≥ F0_lo − 3·c_hi·1 ≈ 136.47 > 0. ✓ (recon.json)
4. `mirror_root_unique_on_unit : a ∈ Ioo 0 1 → b ∈ Ioo 0 1 → residual a = 0 → residual b = 0 → a = b`.
5. `residual_neg_of_le_zero : a ≤ 0 → residual a < 0` — a·F0 ≤ 0, −(16/9)κa³ ≤ 0, −1 < 0.
   ⇒ NO root outside (0,1) among nonnegatives; negatives excluded. ⇒ the (0,1) root is the
   UNIQUE real root of the cubic FULL STOP (any real a ≤ 0 or a ≥ 1 fails: residual < 0 for
   a ≤ 0; residual > 0 for a ≥ 1 by mono with residual(1) > 0… precisely: 1 ≤ a ⇒
   residual 1 < residual a by (3), and 0 < residual 1 ⇒ 0 < residual a).
6. ★ CAPSTONE `invAlpha_certified_global : ∃! a, a ∈ Ioo 0 1 ∧ residual a = 0 ∧
   1370359990777677/10^13 ≤ 1/a ∧ 1/a ≤ 1370359990778029/10^13` — reuse mirror_root_exists
   (root ∈ [aL,aR] ⊂ (0,1)) + (4) for uniqueness + solution_bracket (root ∈ [aL,aR] gives the
   box). The manual interval demoted to the CERTIFICATION window; uniqueness now on the
   structural coupling domain (0,1), and indeed on all of ℝ by (5).
KILL CONDITIONS (prereg'd): if (3)'s bound fails at b=1 (it doesn't — recon), STOP.
Grade claim after: "unique root of the mirror equation, full stop" — no interval qualifier.

### N675 — MirrorTermLanguage (H2 + H3: the grammar closure)
RECON-CORRECTED FACTS (airtight-recon.json; the sketch's "2/5 at fourthMoment" was an
off-by-one — fourth is the cos⁵ moment = 0; the EVEN moment values are 2/(n+1)):
  ∫₀^π cosⁿ·sin dx = 0 (n odd) EXACTLY; = 2/(n+1) (n even). Elementary antiderivative:
  −cos^{n+1}/(n+1), evaluated 0..π ⇒ (1−(−1)^{n+1})/(n+1). Verified n=1..8 exact + trapezoid.
THEOREM TARGETS:
1. `structure ChainTerm` (the finite-dimensional term language): censusWeight : ℚ,
   returns : ℕ, alphaEnds : ℕ, logCarrying : Bool (canonicalizes N588's ParsedTerm).
2. THE MOMENT LAW, generalized past N590's n ∈ {1,3}: define
   `momentFlux (n : ℕ) (x : Cut) := ∑' m, (-1)^m · x^(2m+2)·(Σ_{k≤n} binom-cos-power terms)`…
   — IMPLEMENTATION CHOICE (freeze here): clone the N590 sinN pattern to
   `sin5Antideriv`/`sin6Antideriv` and bank the NEXT pair constructively
   (`fifthMomentFlux_vanishes : ∫ cos⁵·sin = 0` — linearization 5/32·sin2x + 1/8·sin4x +
   1/32·sin6x, all periods 1 at π-multiples; `fourthEvenMoment : ∫ cos⁴·sin = 2/5`), AND
   state the GENERAL law as a theorem over the antiderivative:
   `moment_law (n : ℕ) : odd n → momentFlux n cutPi = 0` IF the tsum machinery generalizes
   cheaply; else the two new instances + the antiderivative law as the stated reason.
   DECISION GATE at scratch: try the general `momentFlux` tsum first (one def, one law);
   if elaboration fights past ~2 scratch hours, fall back to the N590-clone pair and state
   the general law over the EXPLICIT antiderivative −cos^{n+1}/(n+1) (no tsum needed —
   the antiderivative identity IS the content, the tsum is the repo's delivery vehicle).
3. THE UNIVERSAL LEGALITY THEOREM over ChainTerm: a mirror-level term (α-carrying
   alphaEnds ≥ 1; no-gap ¬logCarrying) is LEGAL iff returns = 1 ∧ alphaEnds = 2:
   - returns ≤ 1: the banked unary law — `foldCount = fun _ => 1`
     (FineStructureAllOrdersNormalization.lean:173), no branching; a multi-return direct
     term is the iterated tower the fixed point already performs (double-count).
   - alphaEnds odd: moment = 0 EXACTLY (the annihilation law / instances).
   - alphaEnds even ≥ 4: moment = 2/(n+1) ≠ 0 BUT no banked normalization —
     `secondMoment_survives` ties ONLY n=2 to depthWeight; higher even moments arise only
     as ITERATIONS of the two-ended step (the fixed point's own work), not as direct terms.
   - census: no-gap ⇒ no removal ⇒ cap 16/3 (banked census_no_edge_no_removal).
   ★ `mirror_term_universal : ∀ t : ChainTerm, MirrorLevel t → NoGap t →
     Legal t ↔ (t.returns = 1 ∧ t.alphaEnds = 2)` — the N588 boundary CLOSED as a theorem
     over the formal term language.
KILL: if the fifth-moment linearization (5/32, 1/8, 1/32 at sin 2x/4x/6x) fails exact
closure, STOP and re-derive — never float.
HONEST RESIDUE (declared, not a theorem target): "no formalism outside this grammar exists"
is unfalsifiable meta-philosophy — stays prose, owner-accepted boundary for "airtight".

### N676 — MirrorResidualWelded (H5: the literal re-weld)
- Restate the landing so the equation whose root is certified is DEFINITIONALLY the assembled
  one: `residual' a := a * F0 - mirrorCoeff * kappaLeading * a^3 - 1` with
  `residual'_eq : residual' = residual` (rw mirrorCoeff_eq) — or re-point residual itself if
  downstream breakage is nil (check consumers first: MirrorSelfInsertionLaw, ChainTermGrammar,
  MirrorRootExistence, costumes C586/C587/C589). SAFEST: new def + eq + capstone re-stated on
  the welded form; zero downstream edits.

## COSTUME / AUDIT / LEDGER per node (C674/C675/C676, manifest rows 1 = N).
Gate: gate-fast SOLO per node; full gate at arc end if diff touches existing modules
(N676 may touch MirrorFixedPoint.lean — if so, full gate, backgrounded, hour-scale).
NO-FIT: no measured value anywhere. NO-BLOCK: all three routes de-risked above.
