# THE LEDGER — chain status (the global view Clay never had)
*The ONE place where the whole chain's health is visible. Every node: its status, what it
proves, what (if anything) it owes. Updated on every node completion. If this file ever shows
an unproven assertion standing as "done," the project has failed its own standard — that is
exactly the invisibility (Clay root cause #3) this file exists to prevent.*

Legend: ✅ DONE (unbroken, complete, physics-words-removable, gate-green) · 🔨 IN PROGRESS ·
⛔ BLOCKED (on a dissolution/prerequisite ticket) · ⬜ NOT STARTED · 🔭 ANTICIPATED (not yet a
committed target — specified only after upstream lands).

---

## THE CHAIN

| Node | Layer | Status | Proves | Owes |
|------|-------|--------|--------|------|
| N1 fold | Foundation | ✅ | The fold = self-look-back, defined by the look-back law `look x + x = 0` on an additive group, FORCES: `look x = -x` (unique annihilating reflection), `look 0 = 0`, `look² = id` (the fold closes — NOT `-id`), and ★ SELF-BLINDNESS: on a 2-torsion-free carrier the look-back has no nonzero fixed point (`look x = x → x = 0`). Tightness/non-vacuity banked (char-2 carrier has a nonzero fixed point; ℤ witness). 8 theorems, foundations-only. `Phys/Foundation/Fold.lean`. | — |
| N2 rung 1 (complex unit) | Cascade | ✅ | ★ THE FORCED COMPLEX UNIT (first rung of the cascade). *Recursive self-blindness* = a square root of the fold (`IsFoldRoot J := IsFold (J∘J)`, rooted in N1). OBSTRUCTION: on the ordered base line no scalar squares to `-1` (`sqrt_fold_not_on_line`, self-overlap `≥0>−1`); and ★ the WHY-DOUBLE LAW `foldRoot_forces_even_dim` (a real-linear fold-root forces EVEN dimension via `det(J)²=(−1)^dim≥0`), blocking the base (dim 1, odd). RESOLUTION by doubling 1→2: operator `J₂` on ℝ×ℝ (self-blind via N1's `fold_self_blind`); the complex ALGEBRA `Dbl R` (a `CommRing`), with ★ `Dbl.mul_forced` (the product is UNIQUELY forced by `J²=−1`+bilinearity) and ★ `Dbl.J_mul_J` (`J*J=−1` DERIVED). Tightness: `ZMod 5` solves `j²=−1` once order is dropped (positivity is the cause). 29 theorems, foundations-only. `Phys/Cascade/ComplexUnit.lean`. | — |
| N2b cascade rung 2 (ℍ) + doubling op | Cascade | ✅ | ★ THE CASCADE'S DOUBLING OPERATION + rung 2. `Phys/Cascade/Double.lean`: the generic Cayley–Dickson double `CD A` of a `*`-ring (ONE operation, reused at every rung — `CD` specializes to rung 1's `Dbl` when the base conjugation is trivial). Proves `Ring (CD A)` (★ associativity SURVIVES doubling a commutative associative `*`-ring), `StarRing (CD A)` (the conjugation propagates, so the cascade can iterate), and ★ `CD.iota_e2_comm_iff` (THE ONE CAUSE: in the double `ι a` and the new generator `e₂` commute IFF `a = star a`). `Phys/Cascade/Quaternion.lean`: rung 2 `H R := CD (Dbl R)` (doubling 2→4). Makes the rung-1 algebra a `StarRing` (complex conjugation), proves `Dbl.star_J` (`J*=−J`), `Dbl.J_ne_star_J` (`J≠J*` when `2≠0` — the SAME 2-torsion condition the trunk's self-blindness rests on), `H_associative` (associativity PRESERVED), and ★ `not_commutative` / `not_commutative_witness` / `commutativity_cause` (DOUBLING LOSES COMMUTATIVITY, caused EXACTLY by the rung-1 complex unit `J ≠ J*` — one cause, propagated one rung up). Costumes C6 (`H` commutative) + C7 (doubled star multiplicative) both bite. 37 theorems foundations-only. | — |
| N2c cascade rung 3 (𝕆) + STOP | Cascade | ✅ | ★ THE CASCADE'S TERMINAL TAIL. `Phys/Cascade/Double.lean`: ★ `CD.iota_iota_e2_assoc_iff` (THE ONE CAUSE of the stop of associativity: in the double, the triple `(ι a, ι b, e₂)` associates IFF the base pair `a, b` commutes; `[Ring A]`, so it holds over a NON-commutative base). `Phys/Cascade/Octonion.lean`: rung 3 `O R := CD (H R)` (doubling 4→8; NOT a `Ring` — the banked `Ring (CD A)` needs `CommRing A`, and `H` is non-commutative — so `O` is a genuinely non-associative algebra, not forced into a false `Ring`). Proves `assoc_triple_iff`, `not_associative_witness`, ★ `not_associative` (DOUBLING THE NON-COMMUTATIVE ALGEBRA LOSES ASSOCIATIVITY — a theorem), and ★ `associativity_cause` (the rung-3 loss is caused EXACTLY by the rung-2 non-commutativity, which traces to `J ≠ J*` — one seed, two rungs up). `Phys/Cascade/Sedenion.lean`: ★ THE PROVED STOP `S R := CD (O R)` (doubling 8→16). Concrete witnesses `zdX = e₁+e₁₀`, `zdY = e₅+e₁₄` (probe-verified, exact rational): ★ `zero_divisor_prod` (`zdX*zdY = 0`) + `zdX_ne_zero`/`zdY_ne_zero` ⇒ `has_zero_divisor` (DIVISION FAILS); the Born self-overlap form `N z := (z·z*)` (a true scalar, `N zdX = N zdY = 2`) with ★ `born_law_fails` (`N(xy) ≠ N x·N y`, `0 ≠ 4` — the composition/Born law DIES); and ★ `zero_divisor_breaks_composition` (ONE FACT, BOTH TERMINATIONS — a zero divisor with non-degenerate self-overlap forces both losses at once). The stop is a PROVED loss, not an asserted halt; no Mathlib Octonion/Zorn import; step count NOT hardcoded. Costumes C8 (`O` associative→`1=-1`), C9 (no zero divisor→`0≠0`), C10 (Born law holds→`0=2*2`) all bite. 51 theorems foundations-only. | — |
| N2d generic norm + easy direction + generic loss (DECOMPOSED) | Cascade | 🔨 | ★ THE CROWN'S CLOSURE, PART 1 (the generic self-overlap norm, banked). `Phys/Cascade/ForcedStop.lean`: ★ `CD.Nrm z := (z·star z).re` — THE GENERIC SELF-OVERLAP NORM on the doubling, derived FORWARD from the banked `CD` product + `star` (no Mathlib CompositionAlgebra/Hurwitz import). `Nrm_def` (read off the product); ★ `selfMul` (`z·star z = ι(Nrm z)` — the Born self-overlap is "REAL"/lands in the base, for ANY involutive `*`-base, zero algebraic hypothesis beyond a ring with star — the trunk's positivity made structural); `Nrm_one`/`Nrm_iota`; ★ `Nrm_mul_of_comm` (THE EASY DIRECTION — on a COMMUTATIVE associative `*`-base the norm is MULTIPLICATIVE on `CD A`, `Nrm(xy)=Nrm x·Nrm y` — a GENERIC theorem covering rungs ℂ and ℍ, not a per-rung computation); `N_eq_proj` (the generic `Nrm` PROJECTS to N2c's concrete scalar `N` on `S ℚ` — same object); ★ `genNrm_not_mul_at_S` (THE GENERIC NORM DIES AT THE STOP: `Nrm(zdX·zdY) ≠ Nrm zdX·Nrm zdY`, left `0`, right projects `4` — the concrete N2c stop is the generic norm's failure, not a scalar-projection artifact). 10 theorems foundations-only. Costume C11 (generic norm STAYS multiplicative at S → `0=4`) bites. NUMERICS (workbench/N2d-forced-stop, exact rational, independently re-verified): the norm is multiplicative on C/H/O and dies ONLY at S — the link is base ASSOCIATIVITY, not commutativity. | the FULL forced iff (`t_84e0917e`) — see OWED |
| N2d-hard forced link | Cascade | ⬜ | — | active next node (`t_84e0917e`, linked child of N2d) — see OWED |
| N3+ | — | 🔭 | specified after N2d-hard lands | — |

## OWED WORK (dissolution / prerequisite tickets — the ONLY form of unfinished work)
*There is exactly one category of unfinished work: incomplete derivation. Each entry here is a
TICKET on the board, never a "bridge" left in the source. Empty is the goal.*

- N2d-hard (board ticket `t_84e0917e`, linked child of N2d `t_d16b009f`): THE FORCED LINK, the
  crown's airtight closure. N2d banked the generic self-overlap norm `Nrm` on `CD A` + the EASY
  direction (commutative base ⇒ multiplicative) + the generic-norm loss at the stop `S`. The FULL
  forced impossibility — `Nrm` multiplicative on `CD A` ⟺ `A` associative, so the loss past `𝕆`
  is forced for EVERY base (`𝕆` non-associative ⟹ `CD 𝕆 = S` cannot satisfy the composition law)
  — is genuinely Hurwitz-depth and is the dedicated next node. WHY decomposed (verified, not a
  dodge): over a BARE associative noncommutative `*`-ring the norm defect is NONZERO (12 commutator
  terms; 0 pure-associator witnesses) — so the link is FALSE as a bare-`*`-ring statement and holds
  on the cascade ONLY because its self-overlaps are CENTRAL (the trunk's Born positivity). The
  forced link must carry that central-self-overlap structure (built FORWARD on `CD`, not imported),
  under which the norm defect collapses to the base ASSOCIATOR — dissolving the iff into an
  associator computation (the defect tracks base non-association EXACTLY: 168 biting witnesses ==
  168 non-associating 𝕆 triples). NOT a bridge and NOT a hole repair — a sanctioned W3 decompose
  (the N2d task body explicitly permits banking the generic norm + easy direction first and childing
  the hard direction). Then specify N3 (what `𝕆` forces).

## INVARIANTS THIS LEDGER ENFORCES
1. No node is ✅ unless the gate is green AND the STANDARD (unbroken/complete/words-removable)
   is met. Gate-green alone is 🔨, never ✅.
2. Every "owes" is a board ticket, never a source-code marker. The gate's D3 check guarantees
   no bridge/residual marker can exist in the tree — so this ledger and the tree cannot diverge.
3. The chain is LINEAR and unbroken: every node's prerequisites are ✅ before it starts.
