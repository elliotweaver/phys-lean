# PREREG — N41e: the hxy octonion-product-family summability + discharge to UNCONDITIONAL product-preservation (+ bijection + derivative, scoped by measurement)

FROZEN before compute. Run 179.

## The target (from the ticket)
Complete the LITERAL `O Cut` algebra-automorphism, UNCONDITIONAL:
1. **hxy product family** — `Summable (fun kl : ℕ×ℕ => ((1/kl.1!)•((D^kl.1) x)) * ((1/kl.2!)•((D^kl.2) y)))` over the OCTONION product `·` in `O Cut`. THE GENUINE HARD CORE (coordOCut is Cut-LINEAR but NOT multiplicative, so expO_summable's matrix-transport route does not apply verbatim).
2. **discharge** — feed expO_summable_restrict (banked hx/hy) + hxy into banked `expO_mul_of_summable` → UNCONDITIONAL `expO D (x·y) = expO D x · expO D y` for `D = D'.restrictScalars ℤ` of a Cut-linear Leibniz `D'`.
3. **bijection** — Cut-side ≃ₗ[Cut]/IsAlgAut, inverse expO(-D).
4. **derivative** — `d/dt exp(tD)|₀ = D` trunk-native Tendsto over N36.

## The route to MEASURE (the hard core, part 1)
The summand is `a_k · b_l` (octonion product) with `a_k := (1/k!)•((D^k) x)`, `b_l := (1/l!)•((D^l) y)`.

**The chosen route (avoids computing the octonion structure-constant TABLE explicitly):**
Reduce summability of `(k,l) ↦ a_k · b_l` in `O Cut` ENTRYWISE through `coordOCut` (continuous linear equiv, banked). By `Pi.summable`, suffices each `m : Fin 8`: `Summable (fun kl => e_m (a_k · b_l)) = (coordOCut (a_k·b_l)) m`.
- **The coordinate bound** `|e_m (a·b)| ≤ ∑_{i,j ∈ univ} |e_i a| · |e_j b|` — proved per-m by expanding `e_m(a·b)` via the banked `@[simp]` CD.mul_re/im, Dbl.mul_re/im (all rfl) + the `abs` triangle inequality. (Each octonion coordinate of `a·b` is a fixed ±-combination of ~8 products of projections, dominated by the full 8×8 grid of |e_i a||e_j b|.)
- **The coordinate sequences are absolutely summable**: `e_i a_k = (coordOCut a_k) i = (expTerm (derivMatrix D') k *ᵥ coordOCut x) i = ∑_p (expTerm M k) i p · (coordOCut x) p` (banked `expO_term_coord`), a finite Cut-combo of the banked `expTerm_entry_abs_summable` sequences → `Summable (fun k => |e_i a_k|)`.
- **The majorant** `g(k,l) := ∑_{i,j} |e_i a_k|·|e_j b_l|` is summable over ℕ×ℕ (finite sum over i,j of `cut_summable_mul_of_abs` products). Comparison (`cut_summable_of_nonneg_of_le'` on `|e_m(a_k b_l)| ≤ g(k,l)`) + `cut_summable_of_abs'` close each m. `coordOCut.symm` continuous transports back to `O Cut`.

**This route uses ONLY banked levers** — no structure-constant table, no new analysis. The genuine hard core dissolves through the same coordinate frame N41d built.

## GO / NO-GO (decided by bounded measurement)
- **GO (full)**: if the coordinate bound `|e_m(a·b)| ≤ ∑|e_i a||e_j b|` compiles cheaply (≤ KILL) AND the entry abs-summability + discharge compile cheaply, bank parts 1+2 (UNCONDITIONAL product-preservation `expO D (x·y)=expO D x·expO D y` for a Cut-linear Leibniz D') in one olean. Then assess 3+4: if cheap, bank; else CHILD onto chain tail.
- **GO (decompose)**: if part 1 banks but the discharge needs a Cut-linear→ℤ Leibniz witness that is fiddly, or 3/4 are heavy → bank what compiles, CHILD the remainder.
- **NO-GO / dissolution**: if the coordinate bound or the entry-summability genuinely resists after measure+reframe → W1 dissolution child, block.

## KILL (W9 instrument budget)
- **Per-obligation KILL = 60s.** Any single obligation (the coordinate-bound simp, an entry-summability, the discharge) that exceeds 60s in a bounded probe is an INSTRUMENT failure → decompose/reframe that obligation, do NOT inflate maxHeartbeats, do NOT re-run the same form.
- If the coordinate-bound `simp` blows up (the 8-coordinate octonion expansion is the W9 risk): decompose to per-m named lemmas, or switch to the abstract-bilinear-basis-expansion route (mulCoord bilinear → `∑_{ij} S(m,i,j) u_i v_j`).

## TURN CHECKPOINT
- **~55% of turn budget**: checkpoint. If part 1 (+2) compiles clean, MOVE to production + wire + commit IMMEDIATELY (W9.8 bank-as-you-go), THEN attack 3/4 or child them. Never chase the full 4-part theorem past the checkpoint with nothing banked.
- FINALIZE EARLY: costume C67 + manifest + gate + axiom audit + LEDGER + ROADMAP with turns to spare. N28–N41d ALL timed out AFTER leaving the derivation — do not repeat.

## Anti-vacuity (W8) — costume C67 (next id)
A WRONG product-family/discharge MUST fail to compile: e.g. dropping the factorial from the majorant, or claiming the product law for a NON-derivation (dropping IsDeriv), or a wrong inverse (expO D ∘ expO E = id for E ≠ -D). Reuse banked expO/expO_mul_of_summable/expO_summable_restrict/coordOCut/expTerm_entry_abs_summable/cut_summable_mul_of_abs/IsDeriv — never a fresh table.

## Physics-words-removable
Delete "exp/gauge/G₂/colour/derivation/automorphism": the theorem remains a complete proof that the convergent power series ∑(1/n!)•Dⁿ of a Leibniz endomorphism of the 8-dim non-associative complete-topological *-algebra over the derived ℝ preserves the product unconditionally (an algebra endomorphism), is a bijection with inverse the series of −D, with derivative D at the identity.

## MEASUREMENT RESULT (run 179) — GO (decompose)
- The exact-DECOMPOSITION route (NOT the nlinarith inequality bound — that hit the W9 wall as predicted) is the chosen route. Each product coordinate `coordOCut(u*v) m` = a finite signed sum of `(coordOCut u i)*(coordOCut v j)` (verified all 8: probe_verify8.lean, 8s, simp[CD/Dbl mul/add/neg/star]+ring).
- The coordinate building block `Summable (fun k => |(coordOCut a_k) i|)` compiles (probe_coordsum, 9s) via expO_term_coord → mulVec entry = finite Cut-combo of expTerm_entry_abs_summable.
- The leaf `cut_summable_mul_of_abs` applies directly to projection-sequence products (probe_exact0, 8s). Product family = Summable.add/sub of 8 leaves per coordinate, transported entrywise through coordOCut (continuous lin equiv) by Pi.summable + coordOCut.symm.
- DECISION: bank parts 1 (hxy product family, the genuine hard core) + 2 (UNCONDITIONAL discharge expO D (x·y)=expO D x·expO D y for D = D'.restrictScalars ℤ of a Cut-linear Leibniz D') this run. CHILD parts 3 (bijection) + 4 (derivative) onto chain tail (W3) — each is its own substantial node.
- KILL never approached (all probes ≤ 22s incl import; no obligation near 60s). NO maxHeartbeats inflation anywhere.
