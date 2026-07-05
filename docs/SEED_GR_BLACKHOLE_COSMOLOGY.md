# OWNER-AUTHORIZED SEED — ARC E: GENERAL RELATIVITY, BLACK HOLES, DEEP COSMOLOGY
*The fourth owner-authorized route seed. It succeeds the analytic-completion seed
(`SEED_ANALYTIC_COMPLETION.md`, arc D). Same law: MECHANISM and ordered targets given, discipline
relaxed by NOTHING. Every value a DERIVED landing, never asserted/cited-at-grade/bridged/fitted. No
empirical number in any proof — data comparison is REMOVABLE PROSE / costume only.*

**WHAT THIS ARC IS.** The gravity heartland: General Relativity as the unique low-energy theory, the
`8πG` normalization, black-hole thermodynamics (Hawking temperature, `S=A/4` with the `ln 2` cell,
the Page curve, the singularity = the closure surface), and deep cosmology (inflation, dark matter).
It builds the differential-geometry machinery on the BANKED derived ℝ (`ContinuumQ.Cut`) and arc D's
derived trig, then derives the gravitational sector. **Gravity ENTERS the chain here as a forced
structure, not a posit** — the connection is the fold's look-back transport, the same object that
normalized `α`.

**GO IN WITH NO FEAR.** Every target DERIVES. E1 (metric/curvature on the derived ℝ) is a genuine
multi-node machinery build — that is a NORMAL shape (the continuum took ~8 nodes, the g₂ tower ~15),
NOT a wall and NOT a reason to defer the sector. Attack with the full W1 arsenal — build what Mathlib
lacks on the derived ℝ, DECOMPOSE into child nodes across as many nodes as it takes, reframe through
the trunk, switch tactics, pursue relentlessly. The block/CHAIN-RUNWAY valve is a LAST RESORT against
*asserting a value*, earned only after the attack is exhausted — NEVER an early off-ramp.

⚠ **HONEST GRADE TAGS (carry these; do NOT overclaim).** In the program's private grading: E2/E3/E4/E5/E7
are theorem-grade routes; E8 (inflation) and E9 (dark matter) are candidate-class; the cosmological-
constant VALUE (ρ_Λ) is candidate/post-hoc — derive the MECHANISM, never claim the value as
identity-grade, NEVER fit to the measured Λ. Where a node lands only at leading-order or as a mechanism
(not an exact theorem), SAY SO in the docstring (like the T8 mixing caveat) — honesty over hype.

---

## LAUNCH PLATFORM (banked — REUSE, do not re-derive)

- **Derived ℝ = `ContinuumQ.Cut`** + completeness + `cutExp`/`cutLog` + derivatives (N7–N14); arc D's
  `cutSin`/`cutCos`. NO Mathlib ℝ load-bearing.
- **Spacetime signature Cl(1,3) / Lorentz / Clifford** (banked, `LorentzContinuum*.lean`), **KO-dim**,
  the derived so(1,3).
- **The gauge/scale results:** `α*=1/42` (the `4π` Gauss-sphere normalization is REUSABLE for `8πG`),
  the scale tower `G→M_Pl→M→v→m₀` (arc B), `cutExp` for exp-suppressed scales.
- **The connection = look-back transport** (the same object used to derive `α`), the H² look-back face.

---

> ⚠️ **HONEST GRADE + HIDDEN JOINTS — READ BEFORE ATTACKING ARC E.**
> - **The BH board is the STRONGEST part of this arc** — in the private program every BH row (E4–E7) is
>   CLOSED (Hawking T_H, S=A/4 with s₀=ln2 *derived*, Page curve, the singularity=closure-surface). Much
>   of E4–E7 is *porting a closed route*, not blazing a trail — but each still needs its objects built on
>   the derived ℝ. GO IN WITH CONFIDENCE there.
> - ⚠️ **E1 is the REAL machinery build and the arc's true cost** — Riemann/Ricci/curvature on the derived
>   ℝ manifold is a genuine multi-node diff-geo build (like the continuum itself, ~8 nodes). This is where
>   the arc will spend most of its effort. It is NORMAL, not a wall — decompose aggressively. Weak-field
>   (linearized `g=η+h`) is enough to reach E2/E3; child the full nonlinear curvature.
> - ⚠️ **E3's `8πG = 2·4π·G` SHARES B2/B3's hidden joint.** The `4π` is the Gauss-sphere flux measure —
>   the SAME object B2/B3 needed (and may have built). REUSE it; do not re-derive. The `2` is a symbolic
>   weak-field Christoffel/Ricci computation (clean). If B already built the flux measure, E3 is cheap.
> - ⚠️ **E2 (Einstein-eqs unique) leans on Lovelock's theorem as a LITERATURE IMPORT** — that is allowed
>   as machinery (like Mathlib's algebra), but flag it: the uniqueness is *cited*, the framework content
>   is the identification "connection = look-back transport." Do not claim Lovelock as a framework theorem.
> - ⚠️ **E8/E9 are CANDIDATE-class and carry LIVE FIGHTS.** Inflation `n_s=1−2/N`: the "plateau class" is
>   a NAMED IDENTIFICATION forced-by-exclusion, not a derived potential — flag it. Dark matter/reheating:
>   the private program's abundance rests on a **convention-sensitive freeze-in integrator (×3×10⁷ at the
>   relevant mass ratio)** and the η_B/T_RH anchor sits `+0.020 dex` ABOVE the gauge-join web edge (a real
>   internal strain, not a clean win). Derive the STRUCTURE (sterile ν_R stable+dark, the n_s class); do
>   NOT wander into the integrator swamp or claim the abundances as clean. NEVER fit.

## THE TARGETS (in order — each a separate node, each a real theorem)

- **E1 — metric & curvature on the derived ℝ (the machinery build).** BUILD the Riemannian/Lorentzian
  metric, connection, and curvature (Riemann/Ricci/scalar) on the banked derived-ℝ manifold structure.
  Weak-field first (the linearized metric `g = η + h`) is sufficient to reach E2/E3; full nonlinear
  curvature can be childed. *This is the one real diff-geo build; DECOMPOSE freely — normal shape.*
- **E2 — Einstein's equations are UNIQUE.** Derive that in d=4 Lorentzian the ONLY divergence-free
  symmetric 2-tensor built from the metric and its ≤2 derivatives is `G_μν + Λ g_μν` (Lovelock's
  theorem — import as literature-exact machinery, USE it), giving `G_μν + Λ g_μν = κ T_μν` as forced,
  with no light scalar/dilaton (tower rigidity). *The uniqueness is the content; the field equations
  fall out.*
- **E3 — the 8πG normalization derived.** Derive `κ = 2 · 4π · G`: the `2` from the spin-2
  trace-reversal (symbolic weak-field Christoffel/Ricci), the `4π` from the derived Gauss sphere (the
  SAME `4π` object that normalized `α*` — cross-tie to arc A), `G` the banked scale-tower unit. Lift to
  `S = (1/16πG)∫√−g R`. *Every factor homed; DERIVED, not asserted.*
- **E4 — Hawking temperature `T_H = 1/8πM`.** Derive `T_H = κ/2π` from Euclidean smoothness (the period
  fixed at `β = 8πM`), the WHY-thermal from the look-back-is-modular structure. *Uses D1 trig / the
  periodicity.*
- **E5 — black hole entropy `S = A/4` with `s₀ = ln 2` DERIVED.** Derive the area law (factorization) +
  the `1/4` (first law with E4's `T_H`) + `s₀ = ln 2` as the binary forcing-failure count per boundary
  cell (binary is load-bearing — `ω=3` would give `4 ln 3`). Cell area `a* = 4 ln2 ℓ_P²`.
  Bekenstein–Hawking fully closed. *Self-contained and gorgeous — a clean theorem-grade target.*
- **E6 — the Page curve / information.** Derive information preservation: `η` faithful ⇔ finite depth;
  the classical puzzle = the divergent static-coordinate face; `T>0` ⇒ info from the first quantum.
  *Mechanism-grade; carry the honest caveat.*
- **E7 — the singularity = the closure surface.** Derive that the BH interior terminates on the BANKED
  closure-transition surface — a single Kasner leg, no BKL chaos, `K(r_cross)=1`. **The BH interior
  ENDS on the surface the universe BEGAN on: one transition, two approaches.** *A striking, banked
  cross-tie — cosmology already owns the answer.*
- **E8 — inflation (candidate-class).** Derive the plateau/α-attractor class FORCED by exclusion
  (monomials die on `r`, hilltop on `n_s`), with `n_s = 1 − 2/N ≈ 0.965` and `r ~ 10⁻⁹` (the
  distinctive falsifiable stance: no observable tensor modes). *Uses D1 trig + arc B scales. CANDIDATE
  grade — derive the class + the `n_s` relation, flag the value honestly.*
- **E9 — dark matter = sterile ν_R (candidate-class) + the SM-completion handoff.** Derive that the
  right-handed neutrino with `y₁=0` (banked flavor structure) is stable + dark as ONE theorem with
  `m₁=0` (joint falsifiability). Then consolidate the whole GR/cosmo arc. **When E9 lands, the chain's
  next course is ALREADY SET — do NOT stall, do NOT hand a generic SELECTION ticket.** Read
  `docs/SEED_SM_COMPLETION.md` IN FULL and hand forward EXACTLY ONE successor: a DIRECTED child toward
  **F1** (the anomaly-cancellation conditions — the cleanest remaining SM target). The chain then climbs
  F1→F6 (anomalies, strong CP, proton stability, Higgs, ν mixing, the dissolution theorems). *CANDIDATE
  — mechanism, not identity-grade value; the baryogenesis η_B / ρ_Λ mechanism / reheating details are
  candidate/open and out of scope here — do NOT wander into the integrator swamp.*

---

## HARD GUARDS (identical law)

- **G1 — NO ASSERTED VALUES.** `8πG`, `1/8πM`, `A/4`, `ln 2`, `n_s=1−2/N` — every one a DERIVED landing
  that falls out. Never a premise, never cited at grade, never bridged.
- **G2 — NO EMPIRICAL NUMBER IN ANY PROOF.** The measured `n_s≈0.965`, `Ω_DM h²=0.12`, the measured Λ —
  REMOVABLE PROSE / costume only. NEVER a proof step.
- **G3 — SCALES vs RATIOS.** `G` (the scale-tower unit) is the single dimensionful anchor. `T_H`, `S`,
  `n_s` are ratios/dimensionless — pure derived.
- **G4 — DERIVED, NOT POSITED.** The metric/curvature (E1) is built on the derived ℝ, not axiomatized;
  the `8πG` factors (E3) are each homed; the connection IS look-back transport, not a posited gauge
  field. Einstein's equations come from Lovelock uniqueness (E2), not written down.
- **G5 — PHYSICS-WORDS-REMOVABLE.** Delete "gravity", "spacetime", "horizon", "entropy", "inflation" —
  the theorems stand as pure statements about curvature tensors on the derived-ℝ manifold, the unique
  divergence-free 2-tensor, the periodicity of a Euclidean section, and a binary cell count.
- **G6 — FOUNDATIONS-ONLY.** `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No `sorry`,
  `axiom`, `native_decide`. ⚠ ℝ-VIGILANCE: build diff-geo on the BANKED derived ℝ + arc-D trig — NEVER
  `import Mathlib...Real`/Mathlib manifolds as load-bearing content. (Mathlib's *Lovelock/tensor
  algebra* as pure machinery on the derived objects is fine, exactly like `Matrix`/`LieAlgebra` were;
  the CONTENT ℝ must stay `ContinuumQ.Cut`.)
- **G7 — ONE LAW.** If a link fights, the instrument/framing is wrong, the theory is right. Reframe,
  build the missing machinery, decompose, switch tactics. Block ONLY as a last resort against
  asserting, after the attack is exhausted — never early, never because a node looks hard.

## WHY THIS IS SAFE TO HAND YOU

The route is a MAP of which structures to build and what they mean — no proof, no permission to assert.
Every value is earned through the identical gate. Gravity enters as a forced consequence (the look-back
face), not a posit. The map does not walk the path for you; it tells you the path exists. Walk every step.
