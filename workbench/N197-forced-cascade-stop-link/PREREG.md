# N197 — PREREG (frozen before compute)

## THE PIVOT (W4.5 decisive: 12-node gauge-rep arc N184–N196 CLOSED)
Genuinely DIFFERENT physics joint. FRONT CHOSEN after measuring: **(ii-a) THE FORCED GENERIC
CASCADE-STOP LINK** — the honestly-DEFERRED node named in the trunk itself
(`Phys/Cascade/Sedenion.lean` lines 55–61): upgrade the *witnessed* sedenion stop
(`born_law_fails`/`zero_divisor_prod`, concrete in S ℚ) to a *forced, generic* impossibility:
**base NON-ASSOCIATIVITY is what FORCES the Cayley–Dickson double to lose the
alternative/composition law** — the deepest "one cause, many terminations" crown.

Why genuinely different + not a re-pin:
- The cascade currently banks: base non-COMMUTATIVE ⟹ double non-ASSOCIATIVE
  (`iota_iota_e2_assoc_iff`, N2/rung3). It does NOT bank: base non-ASSOCIATIVE ⟹ double loses
  ALTERNATIVITY/composition (THE STOP). The stop is currently only a CONCRETE witness over the
  FIXED base O ℚ — never the generic forced link.
- N44 chains chirality-block ⟺ generation-cap ⟺ non-assoc (`chirality_block_iff_jordan_cap`),
  but NOT the cascade-STOP. Adding the stop to the "one cause" web is genuinely-new content.

## OBJECTS (all DERIVED / Mathlib-machinery, STANDARD §3)
- `CD` doubling (N1 `Phys/Cascade/Double.lean`): raw `Mul/Add/Neg/Star` instances need only
  `[Mul A][Add A][Neg A][Star A]`; product `(z*w).re = z.re*w.re + -(star w.im * z.im)`,
  `(z*w).im = w.im*z.re + z.im*star w.re`; `iota a = ⟨a,0⟩`, `e2 = ⟨0,1⟩`.
- ⚠ A generic NON-associative base needs `[NonAssocRing A] [StarRing A]` (Lean `Ring` = associative;
  `ring`/`noncomm_ring` will NOT close goals over a non-assoc base — proofs are manual associator
  tracking). ℚ/ℤ never imported as content; the base is an abstract `[NonAssocRing A][StarRing A]`.
- Concrete instantiation of the stop uses the banked O ℚ = CD(H ℚ) (N4) non-associativity
  (`not_associative`/`not_associative_witness`, N2 rung3).

## GO / NO-GO  (frozen)
- GO if: a GENERIC clean identity compiles foundations-only expressing a CD alternator / composition
  deviation of explicit embedded witnesses in terms of a base associator, yielding the forced link
  "base non-associative ⟹ double non-alternative / composition fails" as a PROVED theorem (an Iff or
  a clean implication, never asserted), DERIVED from the CD product + star anti-hom, NON-VACUOUS
  (W8 witness genuinely nonzero over a non-associating base).
- NO-GO / REJECT (look WIDER or decompose): the only clean lever is the TRIVIAL iota-transport
  associativity (`iota` is a re-homomorphism ⟹ mechanical, W8 REJECT); OR the statement re-states a
  banked fact; OR it needs the full classical polarization (composition ⟹ alternative) that does not
  fit the budget — then DECOMPOSE: bank the clean alternator/deviation FORMULA lever now, child the
  closure as a dedicated W1 dissolution node.

## KILL (W9 — classify a fight as INSTRUMENT failure, not theory)
- Per obligation: KILL at 90 s wall / 400000 heartbeats. If the smallest sub-obligation (a single
  CD-coordinate alternator identity) exceeds this, the monolith will not close → MEASURE-decompose,
  never inflate the ceiling. No `ring`/`noncomm_ring` over the non-assoc base (it is unsound there
  and will silently fail) — manual `simp [mul_re,mul_im,star_re,star_im,star_mul']` + `abel`/explicit
  rewrites only. Brute coordinate `decide` is FORBIDDEN (no Decidable over abstract A).
- ANTI-CIRCLING: record each route tried + failure mode in FINDINGS.md; never re-run a blown route.

## COSTUME (next id C229; W8 must BITE)
A WRONG claim of the chosen front reducing to a false numeric DISTINCT from the banked battery
(… C226 194=1, C227 195=-2, C228 196=1). Use a fresh pair, e.g. `197 = <distinct>` — bites the
genuine relational content (the alternator/deviation is genuinely nonzero over a non-assoc base;
the wrong claim that it vanishes / the stop is not forced reduces to the false numeric).

## DISCIPLINE
PREREG frozen → probe isolated (`lake env lean`, grep full errors) → production in Phys/ (zero
axioms; VERIFY #print axioms ⊆ {propext,Classical.choice,Quot.sound} vs built olean; register in
Audits/AxiomAudit.lean WITH import at END + #print axioms at END; add to Phys.lean) → costume ONE
row in scripts/costume_manifest.tsv (C229, TAB-separated) → gate scripts/gate.sh (bg,
notify_on_complete; poll log with SHORT bounded reads) → STANDARD check → commit + LEDGER + ROADMAP
→ child next node onto chain tail → kanban_complete. Gate-green NECESSARY≠SUFFICIENT.
BANK-AS-YOU-GO: the instant a lemma compiles clean, MOVE to production + wire + commit BEFORE
chasing the full theorem.
