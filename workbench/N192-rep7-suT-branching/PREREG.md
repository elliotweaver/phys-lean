# N192 — PREREG (frozen before compute)

## Node
N192 — THE BRANCHING OF THE `7` UNDER su(2)_T (the second-slot family `leftImDeriv`),
distinct from N190's diagonal branching: `7 = 3·(trivial) ⊕ 4`, with the SINGLET↔ADJOINT
ROLE SWAP relative to the diagonal su(2).

## MEASURE-FIRST verdict on the ROADMAP §N191-superseded fronts (W9 / W4.5, look WIDE)
- Front (i) — **CHOSEN**. The `7` under `su(2)_T = ⟨leftImDeriv hI/J/K⟩` (N191). MEASURES
  LIGHT + GENUINELY NEW. Key facts (all immediate from `leftImDeriv Q ⟨a,b⟩ = ⟨0,Q·b⟩`):
    * `leftImDeriv Q (iotaO a) = 0` — su(2)_T ANNIHILATES the first slot (the OLD line / OLD
      adjoint 3 → 3 trivials).
    * `leftImDeriv Q (kappaO b) = kappaO (Q·b)` — su(2)_T acts on the second slot by LEFT
      MULTIPLICATION L_Q (a NEW intertwiner, ≠ the adjoint action `innerDeriv`).
    * Decomposition `ImO = iotaO(ImH) ⊔ kappaO(⊤)`, dims `3 + 4 = 7` (cleaner than N190: the
      `star x = −x` constraint forces `x.re ∈ ImH` but leaves `x.im ∈ H` free).
    * ROLE SWAP: diagonal FIXES the singlet e₄ (N189), su(2)_T MOVES it
      (`leftImDeriv hI (kappaO 1) = kappaO hI ≠ 0`); diagonal acts nontrivially on iotaO(ImH)
      (N190), su(2)_T ANNIHILATES it (`leftImDeriv hI (iotaO hJ) = 0`).
  NOT a re-statement of N190: different OPERATOR (leftImDeriv ≠ innerDeriv), different
  DECOMPOSITION (3+4 ≠ 3+1+3), provable CONTRAST (the role swap).
- Front (ii) so(4)⊕complement / commutant in g₂ — DEFERRED (N191 already measured the
  diagonal's commutant in so(4) vacuous; the 14-dim complement needs a dimension count over a
  type bridge ℤ↔ℚ — heavier, child later).
- Front (iii) right-slot family `⟨a,b⟩↦⟨0,b·Q⟩` — DEFERRED (speculative whether it is a NEW
  derivation independent of leftImDeriv; child later).
- Front (iv) hypercharge normalization — DEFERRED.

## GO / NO-GO (frozen)
GO if ALL of:
  1. `leftImDeriv_iotaO` : `leftImDeriv Q (iotaO a) = 0` compiles foundations-only.
  2. `leftImDeriv_kappaO` : `leftImDeriv Q (kappaO b) = kappaO (Q*b)` compiles.
  3. `invariant_kappaTop_T` : `leftImDeriv Q` maps `map kappaO ⊤` into itself.
  4. `branchingT_sup_eq_ImO` : `map iotaO ImH ⊔ map kappaO ⊤ = ImO`.
  5. `finrank_kappaTop = 4` and `branchingT_dim_sum : 3 + 4 = 7 = finrank ImO`.
  6. W8 ROLE SWAP: `leftImDeriv_moves_singlet` (`leftImDeriv hI (kappaO 1) ≠ 0`) AND
     `leftImDeriv_annihilates_iotaImH` (`leftImDeriv hI (iotaO hJ) = 0`).
  7. costume C224 bites a WRONG claim at a DISTINCT numeric (some_value = 192).

NO-GO / look WIDER if: the decomposition re-states N190 (it does not — measured); any map is
identically zero on the WHOLE 7 (it is not — leftImDeriv hI moves e₄); the role swap fails to
compile (would mean the contrast is not real → drop front (i), go to (iii)).

## KILL (instrument-failure classifier, W9)
- No proof obligation here is coordinate-heavy: every lemma is a one-slot CD computation
  (`ext <;> simp`) or a sup/finrank manipulation reusing banked N190 levers. KILL THRESHOLD:
  if ANY single lemma does not close in < 30 s with `ext <;> simp [...]` / `noncomm_ring` /
  the banked finrank levers, STOP — it means I mis-measured the slot algebra; reframe, do NOT
  inflate maxHeartbeats. (No heavy tactic is expected anywhere; the whole node should compile
  in the same ballpark as N190's ~20 decls.)
- BANK-AS-YOU-GO: the instant the core intertwiners (1,2) + role swap (6) compile, move to
  production + wire + commit BEFORE the finrank decomposition (5).

## Costume C224 (W8 anti-vacuity)
File: `Counterexamples/DerivationRep7SU2TBranchingWrongValueCostume.lean`.
Bites: the genuine witness `(leftImDeriv hI (kappaO 1)).im.re.im = 1` (the deep coordinate of
`kappaO hI`, since `hI = CD.iota Dbl.J`, `hI.re.im = Dbl.J.im = 1`) — su(2)_T MOVES the singlet.
WRONG claim: that coordinate `= 192` → forces `1 = 192` in ℚ → exit 1. DISTINCT from the
battery (… C221 1=189, C222 3=190, C223 2=191; pair (1,192) fresh, RHS 192 distinct).

## Physics-words-removable
Delete isospin/su(2)/so(4)/g₂/singlet/adjoint/branching/rep/diagonal/gauge → pure statement:
for the Cayley–Dickson double `CD (CD B)`, the second-slot family `⟨a,b⟩↦⟨0,Q·b⟩` annihilates
the first coordinate embedding `a↦⟨a,0⟩` and acts on the second embedding `b↦⟨0,b⟩` by
`b↦Q·b`; the imaginary subspace is the internal sup of the imaginary-first-slot image and the
full second-slot image, dims 3+4=7; and this family moves the second-slot unit `⟨0,1⟩` (which
every inner derivation fixes) while annihilating the first-slot imaginaries (on which the inner
derivations act nontrivially). No theorem statement needs a physics word.
