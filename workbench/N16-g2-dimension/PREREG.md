# N16 — PREREG (frozen GO/NO-GO + KILL before compute)

Node: THE DIMENSION / g₂ CHARACTERIZATION of `Der(O ℚ)` (the N6 derivation Lie
algebra of the terminal algebra). Target: `dim_ℚ Der(O ℚ) = 14` and that it is
the exceptional `g₂` — derived FORWARD (explicit basis + bracket), NOT a posited
Mathlib `G₂` import.

## What is banked (re-verified independently, W6)
- N6 `Phys/Algebra/Derivation.lean` (ns `Phys.Algebra`, over `CD (CD B)`):
  `IsDeriv D := ∀ x y, D (x*y) = D x*y + x*D y` for `D : Module.End ℤ (CD (CD B))`;
  `isDeriv_zero/add/neg/smul`; `isDeriv_bracket` (commutator closure, NO assoc);
  `derivation` (`LieSubalgebra ℤ`); the Lie laws; `liftEnd`/`liftEnd_isDeriv`;
  `adHom`/`adHom_isDeriv`/`adHom_star_comm`; `innerDeriv q` (= `liftEnd (adHom q)`,
  a derivation for imaginary `q`); concrete nonzero `witnessDeriv = innerDeriv e₂`
  on `O ℚ` (`witnessDeriv_ne_zero`).
- The exact CD product (`Phys/Cascade/Double.lean`):
  `(z*w).re = z.re*w.re + -(star w.im * z.im)`, `(z*w).im = w.im*z.re + z.im*star w.re`,
  `(star z).re = star z.re`, `(star z).im = -z.im`.
- `O ℚ = CD (H ℚ) = CD (CD (Dbl ℚ))`, 8-dim ℚ-vector space.
- KEY METALANGUAGE FACT: `O ℚ` is a ℚ-vector space (divisible, torsion-free), so a
  ℤ-linear endo is automatically ℚ-linear ⟹ `Module.End ℤ (O ℚ)` = ℚ-linear endos,
  and `Der(O ℚ)` is a ℚ-vector space; "dimension" = ℚ-dimension. (To verify in Lean.)

## GO / NO-GO
GO (full): `dim_ℚ Der(O ℚ) = 14` PROVED + the `g₂` structure derived forward.
GO (decomposed, W3 — explicitly permitted by the ticket): the honestly-scoped
bankable CORE proved this run (e.g. `D 1 = 0`; derivations preserve the imaginary
subspace; an explicit independent family ⟹ a proved LOWER bound `dim ≥ k`; the
finite-dimensional framing), with the HARD upper bound (`dim ≤ 14`) and the full
`≅ g₂` Lie-isomorphism childed as W1 dissolution tickets onto the chain tail.
NO-GO is NOT on the menu (SOUL): never shrink the claim, never name a bridge,
never mark done by bypass. A stalled board (honest block + queued dissolution) is
the correct terminal state if the full target resists.

## KILL (compile-cost budget — classifies a FIGHT as INSTRUMENT, not theory, W9)
- THIS NODE IS A PRIME W9 RISK. The full rank computation (a 512×64 ℚ-system, rank
  50, nullity 14) over fully-expanded octonion coordinates is the EXACT
  monolithic-brute-on-coordinates signature W9 forbids. It will NOT be attempted as
  a `decide`/`ring` monolith.
- KILL bound: any single Lean obligation that does not elaborate to exit 0 inside a
  bounded **90 s** throwaway probe is declared an INSTRUMENT failure → MEASURE the
  smallest sub-obligation, DECOMPOSE into separately-banked sub-lemmas, or REFRAME
  through the trunk. NEVER inflate `maxHeartbeats` past the tree default to "wait it
  out"; NEVER re-run a route already measured dead (anti-circling note kept in
  FINDINGS.md).
- BANK-AS-YOU-GO: the instant a sub-lemma elaborates clean (`#print axioms` ⊆
  {propext, Classical.choice, Quot.sound}), move it to production + commit BEFORE
  attacking the next piece. Never hoard for a grand assembly.
- NEVER run an unbounded compile inside the turn budget — measure in a bounded probe
  first, decompose with turns to spare (W3). Finish or decompose; never run out of
  turns mid-task (auto-blocks).

## Anti-vacuity (W8) — the costume MUST bite
A dimension claim is easy to make vacuously. Costume design (to be confirmed by
numerics): a WRONG dimension (13 or 15) or a fake "basis" carrying a ℚ-linear
dependence must FAIL to compile. Reuse the banked nonzero witness (`witnessDeriv`)
and the banked `CD`/`Dbl` structure — never a fresh table.

## Physics-words-removable (STANDARD §2)
Delete "gauge / g₂ / automorphism": the theorems must remain a complete proof that
the Leibniz-derivation Lie algebra of the Cayley–Dickson double of a double has
dimension 14 (or the proved bounds) with the exhibited bracket structure. Any name
left load-bearing is a HOLE.

## Plan (this run)
1. Faithful exact-rational numerics (Python `fractions`): build `O ℚ` from the EXACT
   CD product, the 8×8×8 structure tensor, the derivation linear system; compute
   nullity (expect 14); build & verify an explicit independent derivation family;
   design the biting costume (wrong count). Reconnaissance — NOT the deliverable.
2. From the numerics, fix the Lean scope: bank the cleanest structural core
   foundations-only this run, child the hard remainder. Decompose with turns to spare.
