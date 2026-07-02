# N243 PREREG — THE COMPLETE CHARGE SPECTRUM of the fundamental 7

**Frozen BEFORE production compute.** RESUME check: workbench was empty (fresh). HEAD = c899f6b
(N242 docs). No WIP, only my process. Lock (ROADMAP §TEMPORARY PRIORITY LOCK, owner auth
2026-07-01) EXPLICITLY greenlights a gather-side hypercharge node; ascent method stays parked.

## TARGET (ONE, no menu)
Assemble N240 (charge 0 on the singlet) + N242 (±i on the two triplets) into the explicit
charge-eigenvalue decomposition of the ENTIRE fundamental 7 (`ImO`), as the minimal polynomial
of the gather charge operator `chargeOp = crossOp u1 : Module.End ℚ ImO`:

  ★ `minpoly ℚ chargeOp = X³ + X = X·(X²+1)`,

whose three roots {0, +i, −i} are EXACTLY the charge eigenvalues of the branching 7 = 1 ⊕ 3 ⊕ 3̄:
0 on the singlet (N240 `chargeOp_kills_singlet`), ±i on the two triplets (N242 spectrum X²+1).

File (NEW, name free): `Phys/Algebra/TowerGatherForcedChargeSpectrum.lean`, extending the strand
N240→N241→N242 (import `TowerGatherForcedChargeEigenvalues`). Type mentions banked tower objects
(`chargeOp`/`crossOp`/`crossOpO`/`u1`/`ImO`) — no free-floating statement.

## THE ROUTE (all on ImO / O ℚ — NO new subtype-of-subtype layer; W9 avoidance)
Work at the subtype-native `octCross`/coe level as N240/N242 did.

1. **`chargeOp_cube`: `chargeOp.comp (chargeOp.comp chargeOp) = -chargeOp`** on ImO.
   Pointwise, coe to O ℚ: `chargeOp³(y) = chargeOp(chargeOp²(y))`. By N240 `chargeOp_sq_coe`,
   `chargeOp²(y)` coe = `⟨u1,y⟩•u1 − y`; but I need it as an ImO element to apply chargeOp again.
   Cleaner: chargeOp(chargeOp² y) — apply chargeOp linearity: `chargeOp²(y) = ⟨u1,y⟩•⟨u1⟩ − y`
   in ImO (the singlet element ⟨u1,u1_mem⟩), so `chargeOp(chargeOp² y) = ⟨u1,y⟩•chargeOp⟨u1⟩ −
   chargeOp y = ⟨u1,y⟩•0 − chargeOp y = −chargeOp y` (using `chargeOp_kills_singlet`). NO coord bash.
   → establish `chargeOp²` as an ImO-level identity first (`chargeOp_sq_ImO`), then cube.
2. **`chargeOp_aeval : aeval chargeOp (X³+X) = 0`** from step 1 (`chargeOp³ + chargeOp = 0`).
3. **`chargeOp_integral`, `minpoly ∣ X³+X`** (`minpoly.dvd`).
4. **MINIMALITY** `minpoly ℚ chargeOp = X³+X`. Plan (MEASURE cheapest; both on ImO):
   p := minpoly, monic, p ∣ X(X²+1), natDegree p ≤ 3.
   - `X ∣ p`: 0 is an eigenvalue (chargeOp kills the nonzero singlet ⟨u1⟩) →
     `hasEigenvalue_iff_isRoot`/`isRoot_of_hasEigenvalue` → `(minpoly).IsRoot 0` → `dvd_iff_isRoot`.
   - `X²+1 ∣ p`: EITHER (a) IsCoprime split: X²+1 irreducible (N242 `charge_poly_irreducible`) →
     prime; if X²+1 ∤ p then IsCoprime p (X²+1) → p ∣ X (`IsCoprime.dvd_of_dvd_mul_right`) →
     natDegree p ≤ 1 → p ∈ {1,X} → both excluded (1: aeval 1 = 1 ≠ 0 nontrivial; X: chargeOp ≠ 0);
     but that shows the natDegree≥3 route, then p ∣ X³+X (deg 3) monic + natDegree p = 3 → equal.
     OR (b) IsCoprime X (X²+1) [⟨-X,1⟩: -X·X + 1·(X²+1)=1] + `IsCoprime.mul_dvd` needs BOTH
     X ∣ p and X²+1 ∣ p → X(X²+1) ∣ p, with p ∣ X(X²+1) → associated → equal (both monic).
   - Concretely I will pursue: p ∣ X³+X + natDegree p = 3 → equal. natDegree p ≥ 3 via the
     prime case-split (X²+1 ∤ p ⟹ p ∣ X ⟹ deg ≤1 ⟹ p∈{1,X} excluded; X²+1 ∣ p with deg p ≤ 2 ⟹
     p = X²+1 ⟹ aeval(X²+1)=0 ⟹ chargeOp²=−id on ImO, contra chargeOp²(u1)=0≠−u1).
5. **Roots**: reuse banked `charge_poly_no_root` (X²+1 factor), the 0-root of X, and `Dbl_J_root`/
   `Dbl_negJ_root`/`Dbl_J_ne_negJ` (N242) → three roots {0, +J, −J}, mutually distinct
   (0 ≠ J since J.im = 1; J ≠ −J banked). Capstone `forced_charge_spectrum_structure`.

## GO / NO-GO
- GO if steps 1–3 compile (the annihilator + divisibility — the guaranteed core) AND minimality
  (step 4) compiles within the compile budget.
- If minimality (step 4) is HEAVY (blows the budget / needs an unbanked fact): SCOPED deliverable
  = the explicit spectrum (aeval(X³+X)=0, minpoly ∣ X³+X, three roots {0,±J} genuinely present &
  distinct, chargeOp ≠ 0, 0-eigenvalue on singlet, no-rational-nonzero-eigenvalue via N242) +
  CHILD the exact-minpoly polish. Do NOT weaken below "three roots {0,±i} are the charge spectrum".

## KILL classes (W9 — instrument-failure lines; STOP and reframe, do NOT grind)
- KILL-1: any single obligation compiling > 60s in a bounded probe → decompose/reframe.
- KILL-2: reaching for `native_decide`, raising `maxHeartbeats`, or a monolithic coordinate `ring`/
  `decide` over O ℚ → STOP (drift toward coordinate bash / ascent).
- KILL-3: introducing `Algebra ℚ (Dbl ℚ)`, `TensorProduct` complexification, or building over ℚ[i]
  as ground → STOP (COMPLEX-FIELD warning; ±i/0 named ONLY as roots of the real operator's minpoly).
- KILL-4: any new subtype-of-subtype (Vsub-inside-ImO) restriction layer → STOP (W9 diamond); keep
  everything at the octCross/coe level on ImO / O ℚ.
- KILL-5: ≥2 probe rounds banking nothing → scoped deliverable + child the polish (W1/W3).

## RECON WITH TEETH
A garbage relation MUST fail to compile: e.g. `minpoly ℚ chargeOp = X^2 + 1` (WRONG — that's the
V-restriction, not the whole 7) must NOT typecheck as a proof; and `chargeOp.comp chargeOp =
-LinearMap.id` (WRONG on ImO — the singlet is killed, not squared to −id) must FAIL.

## STANDARD
Unbroken (extends N240/N242, Mathlib as machinery only) / complete (#print axioms ⊆ {propext,
Classical.choice, Quot.sound}; no sorry/axiom/native_decide) / physics-words-removable (delete
charge/hypercharge/singlet/triplet/particle/antiparticle/i: pure statement about `minpoly ℚ
(crossOp u1 on ImO) = X³+X`, its roots 0 and ±J). Costume next id C274. Gate via gate-fast.sh
(background, non-blocking poll). W7: gate-green necessary not sufficient.
