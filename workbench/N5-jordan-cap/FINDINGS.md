# N5c — H₃(𝕆) JORDAN-IDENTITY ASSEMBLY: FINDINGS (corrected run 47)

Target: prove `jdef (Hm …) (Hm …) = 0` for the general Hermitian 3×3 over the terminal
algebra `O ℚ` — pinning N5's cap EXACTLY at 3 (Part 1 proved failure at n≥4). The cap value
3 = the exact gap between `𝕆` ALTERNATIVE (kept) and ASSOCIATIVE (lost at the cascade stop).

## ⚠⚠ CRITICAL CORRECTION (run 47) — the prior premise was WRONG
The pre-run-47 version of this file (and the task body / parent handoff) asserted:
  "every defect entry IS a sum of octonion associators, killed by the alternating-form laws."
**THIS IS FALSE.** It was inferred from `assoc_decompose2.py`'s *associative+central
collapse* test (which only shows the entries vanish in the ASSOCIATIVE quotient — i.e. each
entry lies in the associator ideal as a SET), NOT from an actual span computation. Run 46
tried to turn it into a `linear_combination (norm := abel)` certificate, but its dense
Gauss-Jordan solver HUNG (50k–130k instances, exact-ℚ dense elimination) and banked NOTHING
in 45 min — it never discovered the premise was false.

Run 47 built a FAST sparse incremental span-membership solver (`cert_span.py`,
`cert_span_broad.py`, dict vectors + incremental pivot basis, ~0.5–4 s/entry) and the
verdict is DECISIVE and reproducible:

  **ALTERNATION-ONLY IS INSUFFICIENT.** Every one of the 9 defect entries is NO-SOLUTION
  in the ℚ-span of alternating-law instances — even with the BROAD 129 600-instance pool
  (all degree-≤2 products of the 12 generators as arguments). Residual = 52 monomials/entry.
  `cert_span.py` (own-subtree pool): all 9 entries NO-SOLUTION, residual 50–52.
  `cert_span_broad.py` (full generator pool): entry(0,1) NO-SOLUTION, residual 52.

This is THE ONE LAW in action: the theory is right (H₃(𝕆) IS Jordan), the FRAMING was wrong
(the alternating-form laws alone do not span the defect).

## THE CORRECTED, CONFIRMED RELATION SET (run 47)
`cert_confirm.py` — the faithful split-octonion (Zorn vector-matrix) model, which is
alternative AND a composition algebra (norm/trace central) — confirms:
  - n=3, REAL diagonal: jdef = 0 in 0/50 samples  → **alt + composition SUFFICES.**
  - n=3, octonion diagonal (control): jdef ≠ 0 in 50/50 → the REAL diagonal is essential.
  - n=4, real diagonal (cap control): jdef ≠ 0 in 50/50 → the cap at 3 bites.

So the entrywise assembly needs THREE ingredients, ALL in-chain:
  1. **Alternativity** — banked: `Phys/Algebra/Alternative.lean` (`alt_*`, `assoc_swap*`,
     Moufang). The associator is an alternating trilinear form.
  2. **Composition-centrality of the involution** — the symmetric trace `a + star a` and
     norm `a · star a` are CENTRAL/NUCLEAR. This is the classical Jacobson/Schafer condition
     ("`H₃(A)` Jordan ⟺ `A` alternative AND involution nuclear"). It traces back to N2's
     banked scaling/composition law (`CDcore.scaling_of_H`, the multiplicative norm). NOT
     yet expressed as the Lean lemma set the assembly consumes — THE CHILD'S MAIN JOB.
  3. **Centrality of the real diagonal `ocR r`** — banked THIS run:
     `Phys/Algebra/HermitianJordan/Helpers.lean` (`ocR_comm`, `ocR_assocL/M/R`, `ocR_star`,
     all foundations-only). `ocR r` commutes & associates with all of `O ℚ` and is
     self-adjoint.

## ⛔ DEAD ROUTES — DO NOT RE-RUN (W9.5 anti-circling)
The FOUR brute whole-expression normalizers (all INSTRUMENT-WALL casualties, W9):
| # | route | result |
|---|-------|--------|
| 1 | brute ℚ-coordinate `ring` on diagonal entry | 16 min, RSS >9 GB, SIGTERM, zero output |
| 2 | `noncomm_ring` over the associative base H | LOGICALLY INSUFFICIENT (88–148 residuals) |
| 3 | brute abstract-`CD (CD B)` `ring` | 357 s, 6 GB, FAILED (simp max-recursion) |
| 4 | brute ℚ-coordinate `ring` on off-diagonal (0,1) | 71 s, 4.3 GB, deterministic whnf-timeout |

NEW dead approach (run 46): the **dense Gauss-Jordan certificate solver** (`certificate.py`,
`certificate2.py`, `cert_fast.py`) — generates 12k–130k law instances per entry then does
EXACT-ℚ DENSE elimination on a matrix that wide. HANGS past any sane budget; banks nothing.
**Use the SPARSE incremental span solver (`cert_span.py`/`cert_span_broad.py`) instead** —
it is the same question answered in <4 s.

## THE CHILD'S JOB (the corrected dissolution)
The honest, in-chain assembly of `jdef_H3 = 0` WITHOUT a brute normalizer:
1. **Express composition-centrality as Lean lemmas over `O ℚ`** (the missing ingredient):
   `(a + star a)` central and `(a * star a)` central (= `ocR`-valued), forward from the
   banked CD product / N2 scaling law. Measure compile cost first (W9.2); these are the same
   `ext <;> simp only […] <;> ring` shape as `ocR_comm` (cheap, ~seconds each) — confirm.
2. **Re-run the SPARSE span solver with the composition relations added to the law pool**
   (trace-central and norm-central difference-vectors as extra columns). Confirm each entry
   becomes SOLVED, and EXTRACT the explicit ℚ-certificate (which law instances + coeffs).
3. Port each entry's certificate into Lean as `linear_combination (norm := abel) Σ cᵢ·lawᵢ`
   — additive-only closer, NO `ring` blowup. Each entry its OWN lemma in its OWN file
   (freeze-on-compile banks the olean once, W9.3). MEASURE per-entry cost; KILL at 90 s/2 GB
   → decompose the entry into associator-group sub-lemmas.
4. Assemble the 9 entries → `jdef_H3 = 0` via `Matrix.ext` + `fin_cases`. Reassemble
   `jordan_cap_pinned_at_three := ⟨jdef_H3, jordan_fails_H4⟩`.
5. Re-add the H3 wrong-cap costume (a defect-entry coordinate asserted ≠ its true value →
   false core) once an entry lemma exists; ONE row in scripts/costume_manifest.tsv.

Lever (Alternative), carrier (Setup), and the real-diagonal centrality (Helpers) are all
BANKED. The child needs ingredient (2) — composition-centrality as Lean lemmas — then the
sparse certificate + abel port.

## WORKBENCH INVENTORY (run 47, all under workbench/N5-jordan-cap/)
- `cert_span.py` — ✅ FAST sparse span solver (own-subtree pool). All 9 entries NO-SOLUTION (alt-only).
- `cert_span_broad.py` — ✅ FAST sparse span solver (full generator pool). Confirms NO-SOLUTION isn't a pool artifact.
- `cert_confirm.py` — ✅ split-octonion model: alt+composition SUFFICES (n=3 real-diag 0/50; controls bite).
- `diag_size.py` — diagnostic: per-entry pool sizes (why the dense solver hangs).
- `cert_fast.py`, `certificate.py`, `certificate2.py` — ⛔ DENSE solvers, HANG. Kept as the anti-circling record; DO NOT RE-RUN.
