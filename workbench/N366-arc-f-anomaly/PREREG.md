# PREREG — N366, arc-F F1: anomaly cancellation via the ladder's charge-conjugation (Hodge) involution

## TARGET (theory-native, SELECTed fresh — see kanban_comment)
Over the derived colour exterior ladder Λ*(colour-3) that IS one chiral generation (N317,
`ladderChargeTrace`, charge `Q(S)=|S|/n_c`, `n_c = finrank ℚ Uhol = 3`), **charge conjugation is
the Hodge complement** `S ↦ Sᶜ`. It is a fixed-point-free involution under which the centered /
B−L charge functional is ODD, so every ODD anomaly moment (linear = gravitational `grav²·U(1)`;
cubic = `U(1)³`) vanishes IDENTICALLY. The banked ν_R (the `∅` colour+isospin+hypercharge singlet
self-direction) is REQUIRED: dropping it un-pairs the involution and the B−L anomaly sum becomes
`1 ≠ 0` (the C391 teeth — matching the seed's "B−L without ν_R fails at exactly −1").

## HONEST GRADE (carry it)
- THEOREM-GRADE (forced math, foundations-only over ℚ, grounded on `finrank ℚ Uhol`):
  the complement is fixed-point-free; the B−L/centered-charge functional is complement-odd;
  the odd anomaly moments (linear, cubic) vanish; the ν_R-required teeth (erase `∅` ⇒ sum `= 1 ≠ 0`).
- LEADING-STRUCTURAL / CHILDED (flagged, NEVER asserted): the full non-abelian mixed conditions
  `SU(2)²·U(1)`, `SU(3)²·U(1)` and the Witten `SU(2)` global anomaly. Same mechanism (complement
  pairs triplet↔antitriplet vector-like; the isospin doublet count is even), but they need the
  two-ideal isospin-doublet structure combined with the colour ladder — a real build, childed to F2
  / a decompose child. I do NOT claim them here.
- MECHANISM / CANDIDATE identification (flagged prose, NEVER a Lean equation): "charge conjugation =
  Hodge complement"; "`∅` singlet = the physical ν_R = the same self-blind sterile direction
  N336/N337 characterized (in generation space) as massless/stable/dark." The anomaly requirement is
  an INDEPENDENT structural fact about the ladder; I cite N336/N337 in prose only.

## HONESTY CORRECTIONS made during MEASURE (do NOT drift back into the wrong story)
1. `compl` on `Finset (Fin n)` is fixed-point-free for ALL `n ≥ 1` (set-theoretic: `Sᶜ = S`
   impossible on a nonempty type), NOT "because 3 is odd." Do NOT claim oddness-of-3 forces freeness.
   The DERIVED colour count `n_c=3` enters as the GROUND the ladder is built on (why Λ*(3), why
   charges are thirds — N317) and grounds the headline TYPE via `finrank ℚ Uhol`.
2. The arithmetic vanishing of the odd moments follows from complement-ODDNESS of the functional
   (`Σ f = Σ f∘compl = Σ(−f) = −Σ f ⇒ Σ f = 0`), which needs only that `compl` is a bijection.
   Freeness is banked as its own genuine structural theorem (complete particle/antiparticle pairing,
   no self-conjugate/real state), flagged for its role — not overclaimed as the cause of vanishing.
3. The ν_R teeth is specifically on the B−L direction (ν_R has hypercharge `Y=0`, so it does not
   affect `U(1)_Y` anomalies — MEASURED). This EXACTLY matches the seed's B−L teeth. State it as B−L.

## THE MEASUREMENT (workbench/N366-arc-f-anomaly/measure*.py — all confirmed)
- One ideal (8 subsets of Fin 3): `Σ Qc = Σ Qc³ = Σ Qc⁵ = 0` (Qc=Q−1/2, complement-odd).
- B−L on the ladder (|S|=0→−1, 1→−1/3, 2→+1/3, 3→+1): complement-odd; `Σ(B−L)=0`, `Σ(B−L)³=0`.
- WITHOUT ν_R (drop |S|=0): `Σ(B−L) = 1 ≠ 0` (`= −1` up to orientation) — ν_R REQUIRED.
- Standard SM Y-table cross-check: `Σ Y = Σ Y³ = 0` with or without ν_R (ν_R has Y=0). B−L is where
  ν_R matters — grav²·(B−L) and (B−L)³ both fail without ν_R. Matches seed exactly.

## THE LEAN OBLIGATIONS (all de-risked in probe.lean / probe2.lean / probe3.lean — COMPILE GREEN)
- `Finset.card_compl` + `Nat.cast_sub` : `blCharge n Sᶜ = − blCharge n S`  ✓
- `Equiv.sum_comp complPerm` : the involution sum-flip ⇒ odd moments `= 0`  ✓
- `finrank_Uhol` : ground the headline TYPE at `Module.finrank ℚ Uhol`  ✓
- `Finset.sum_erase_add` : the teeth `Σ_{S≠∅} blCharge = 1`  ✓ (concrete Fin 3 done; generic n≠0)
- fixed-point-free `Sᶜ ≠ S`  ✓

## PRODUCTION PLAN — Phys/Algebra/ChiralGenerationAnomalyCancellation.lean (ns Phys.Algebra)
Generic machinery (at arbitrary colour count `n`):
- `blCharge (n) (S : Finset (Fin n)) : ℚ := (2*(S.card:ℚ) − n)/n`  [= 2·(Q − ½), Q the N317 charge]
- `complPerm (n) : Equiv.Perm (Finset (Fin n))`  [⟨compl,compl,compl_compl,compl_compl⟩]
- `blCharge_compl_odd (n) (S) : blCharge n Sᶜ = − blCharge n S`
- `compl_fixedpoint_free (n) (hn: 0<n) (S) : Sᶜ ≠ S`  [complete C-pairing, no self-conjugate state]
- `sum_zero_of_compl_odd (g) (hg: ∀ S, g Sᶜ = −g S) : Σ S, g S = 0`  [the involution lemma]
- `anomalyLinear (n) := Σ S, blCharge n S`;  `anomalyCubic (n) := Σ S, (blCharge n S)^3`
- `anomalyLinear_zero (n)`, `anomalyCubic_zero (n)` : both `= 0`
Grounded headlines (TYPE mentions the banked finrank — NOT free-floating):
- `generation_anomaly_linear : anomalyLinear (Module.finrank ℚ Uhol) = 0`
- `generation_anomaly_cubic  : anomalyCubic  (Module.finrank ℚ Uhol) = 0`
Teeth (the ν_R requirement):
- `anomalyLinear_without_nuR (n) (hn: n≠0) : Σ S ∈ univ.erase ∅, blCharge n S = 1`
- `generation_anomaly_without_nuR_ne_zero : Σ S ∈ univ.erase ∅ (over finrank Uhol) ≠ 0`
Capstone:
- `chiral_generation_anomaly_cancellation` : linear=0 ∧ cubic=0 ∧ fixed-point-free ∧ (without ν_R ≠ 0)
W8 non-vacuity: the teeth (`without_nuR ≠ 0`) + `blCharge` genuinely takes nonzero varied values.

## COSTUME C391 (Counterexamples/ChiralGenerationAnomalyCancellationVacuityCostume.lean)
Flag `iFlag=1` tied to the banked teeth `generation_anomaly_without_nuR_ne_zero` (ν_R IS required);
bogus claim `min 391 iFlag = 391` reduces via `cert_val_true (=1)` to the false `1 = 391`. MUST FAIL.

## GUARDS
G1 no asserted values (0, 1 fall out of the involution + `sum_erase_add`). G2 no empirical number in
any proof (SM Y-table, B−L bounds = removable prose only). G3 dimensionless rationals. G4 derived
(charges = ladder occupations; conjugation = Hodge complement; ν_R = the banked self-blind singlet).
G5 words-removable (pure combinatorics on `Finset (Fin (finrank ℚ Uhol))`). G6 foundations-only ⊆
{propext, Classical.choice, Quot.sound}; ground field ℚ; NO Mathlib-ℝ as content; no sorry/axiom/
native_decide/maxHeartbeats-raise. NOT free-floating (TYPE mentions `finrank ℚ Uhol`).

## ONE-SUCCESSOR RAIL
On landing, hand ONE directed child toward F2 (strong CP / θ̄=0, the flavor half) OR a
decompose-remainder child for the full non-abelian anomaly completion. Never both, never zero;
run the pre-complete fork check.
