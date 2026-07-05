# N307 PREREG — SEEDED FLAVOR ROUTE T4: Koide Q = 2/3 as an EXACT IDENTITY of the ℤ₃-Fourier cycle form, for ALL phases δ

## Node / seed
Owner-authorized flavor seed, target **T4** (docs/SEED_FLAVOR_SELF_BLINDNESS.md §2 T4 + §1 step 5).
Directed single successor of N306 (T3, the ℤ₃-Fourier cycle FORM). FRESH worker (not the N306 author).

## What is banked (N306 platform, `Phys/Algebra/OctonionJordanGenerationCycleForm.lean`, ns `Phys.Algebra.HJ`)
- `Qkoide (a : Fin 3 → ℚ) := (Σaₖ²)/(Σaₖ)²`, `mean`, `DCpower`, `cyclepower`, `parseval`, `sum_eq`.
- ★ `balance_forces_koide (a) (hM : mean a ≠ 0) (hbal : DCpower a = cyclepower a) : Qkoide a = 2/3`.
- `cosVec M A` (the δ=0 rational realization), `DCpower_cosVec=3M²`, `cyclepower_cosVec=(3/2)A²`,
  `forced_sqrt2 : balance → A²=2M²`, `sqrt2_gives_balance`, `koide_cosVec`, `koide_not_one`.
- `Pcyc` (cyclic-shift = perm matrix of banked `gcyc`), `Pcyc_Poth_comm : Pcyc*Poth=Poth*Pcyc`,
  `Pcyc_Pdem : Pcyc*Pdem=Pdem`. N305: `Pdem`/`Poth`/`Jall`/`P_orth`/`P_sum`/`jdef Xwit Ywit ≠ 0`.

## THE FORK — route decision (MEASURED)
`balance_forces_koide` already gives Q=2/3 for ANY amplitude with balance (hence any δ at the
vector level). The genuine NEW content of T4 is to make the identity FULLY GENERAL and CONTINUOUS
over the phase δ: build the δ-parametrized cycle FAMILY and prove the balance `DCpower=cyclepower`
holds for EVERY δ (the δ-invariance of the balance = the rotation-invariance of the cycle-mode Born
power), hence Q=2/3 for all δ.

- **Route B (Mathlib ℝ + `Real.cos`) — REJECTED.** `grep` confirms NO `Phys/**` file uses
  `Mathlib.Analysis`/`Real.cos`/`SpecialFunctions`. A trig node would be the FIRST analytic node =
  trips the ⚠ STANDING DEPENDENCY GATE (ℝ not yet descended from the fold). FORBIDDEN. Also the
  derived `Cut` has no trig. (ONE LAW: the "continuous δ needs ℝ" fight is the instrument, not the
  theory — reframe.)
- **Route A (exact over ℚ) — CHOSEN.** The genuine continuous-rotation invariance of `cyclepower`
  requires the orthonormal cycle basis, whose sine-direction `(0,√3/2,−√3/2)` carries √3. Absorb
  the √3 into a RATIONAL coordinate: with `p = cos δ`, `r = √3·sin δ`, the δ-family is
  ```
  genVec M A p r := ![ M + A·p,  M − A·(p+r)/2,  M − A·(p−r)/2 ]     (all entries rational)
  ```
  and the "unit circle" `cos²δ+sin²δ=1` becomes the RATIONAL conic constraint `3p² + r² = 3`.
  This is a genuine 1-parameter (δ) family over ℚ (the conic is dense in the real δ-circle), NO √3
  in any entry. The √3 lives only in the reparametrization prose. Modeling decision: **work over ℚ;
  δ carried as the rational conic point (p,r), 3p²+r²=3.**

## The derivation (all exact ℚ algebra — verified by hand, to be probed)
- `mean_genVec : mean (genVec M A p r) = M`  (∀ p,r; the cycle sums to zero — NO constraint needed).
- `DCpower_genVec : DCpower (genVec M A p r) = 3·M²`.
- ★ `cyclepower_genVec (h : 3*p^2+r^2 = 3) : cyclepower (genVec M A p r) = (3/2)·A²`.
  Core identity: `cyclepower = A²·(3p²+r²)/2`, which is `(3/2)A²` iff `3p²+r²=3` — the
  δ-INVARIANCE of the cycle power (equal power in every rotated frame). ← the theory-native heart.
- `forced_sqrt2_gen (h) (hM:M≠0) (hbal:balance) : A²=2M²`  (the √2, for all δ).
- `balance_gen (h) (hA:A²=2M²) : DCpower = cyclepower`  (family stays on the balance locus ∀δ).
- ★★ `koide_genVec (h) (hM:M≠0) (hA:A²=2M²) : Qkoide (genVec M A p r) = 2/3`  — Q=2/3 for ALL δ,
  via `balance_forces_koide` + `balance_gen`. THE T4 LANDING.
- TIE to banked (anti-free-floating): `cyclepower_Pcyc_inv : cyclepower (Pcyc.mulVec a) = cyclepower a`
  from `Pcyc_Poth_comm` (+ Poth idempotent/symm) — the DISCRETE ℤ₃-rotation shadow of the continuous
  invariance; and `Qkoide_Pcyc_inv : Qkoide (Pcyc.mulVec a) = Qkoide a` (Koide is generation-cycle
  invariant). Grounds the family on the banked `Pcyc`/`Poth`.

## W8 non-vacuity
The WRONG amplitude ratio `A²=4M²` gives `Q=1` for the whole δ-family (not 2/3): numerator
`3M²+(3/2)·4M² = 9M²`, denom `9M²`, Q=1. `koide_genVec_not_one`-style + costume C336: the forced
ratio is genuinely `2` (Q=2/3), not `4` (Q=1). Certificate tied via `forced_sqrt2_gen`.

## Cost budget / KILL (W9)
Small ℚ conic-algebra: `ring`/`field_simp`/`linarith` with one constraint. Expect LIGHT olean
(~12–16s). KILL: if any obligation needs a `maxHeartbeats` raise or a monolithic brute blows up →
framing wrong (ONE LAW), reframe or child dissolution. NO native_decide, NO heartbeat inflation.

## Guards (seed §4)
G1 no asserted values (2/3 falls out via balance_forces_koide; A²=2M² from the balance). G2 no
empirical number in any proof (Q≈2/3 for e,μ,τ is removable costume prose only). G4 the identity is
DERIVED from the cycle form + δ-invariance of the balance, not fitted. G5 words-removable (pure
conic-algebra statement). G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound}. G7 ONE LAW
(the ℝ fight already reframed to the exact-ℚ conic).

## Deliverable
New leaf `Phys/Algebra/OctonionJordanGenerationKoide.lean` (ns `Phys.Algebra.HJ`), all foundations-
only; costume C336; gate-fast D0–D6 GREEN; STANDARD met (types cite banked `Qkoide`/`DCpower`/
`cyclepower`/`Pcyc`/`Poth`/`balance_forces_koide`, NOT free-floating). ONE successor toward T5
(⚠ the CRUX δ_B=2/9 — successor's problem, may need CHAIN-RUNWAY block; T4 does not touch δ_B).
