# N191 PREREG — so(4) = su(2) × su(2) ⊂ g₂ = Der(O), the embedded isospin su(2) as the DIAGONAL

FROZEN before compute. GO/NO-GO + KILL.

## MEASURE-FIRST verdict on the ticket's named fronts (W4.5 / W9 measure-first)
- Front (i) CENTRALIZER of the embedded su(2)=⟨innerDeriv hI/J/K⟩ inside g₂: the embedded su(2) is
  the DIAGONAL of an so(4) (it acts componentwise `⟨a,b⟩↦⟨ad_P a, ad_P b⟩`). The centralizer of the
  DIAGONAL su(2) in so(4) is trivial (0), and in g₂ the diagonal su(2)'s commutant is trivial too —
  VACUOUS as posed (reject per W8). BUT the front was groping for the right object: the embedded
  su(2) is NOT alone — it sits inside a 6-dim so(4) = su(2)_S × su(2)_T of TWO COMMUTING su(2)'s,
  and THAT is the genuine new g₂-subalgebra structure. The honest commutant statement: su(2)_T's
  commutant contains su(2)_S (they commute). This is the node.
- Front (ii) full SU(3)×SU(2)×U(1) commuting product in ONE g₂: FALSE — su(3) and su(2) do NOT
  commute inside a single g₂ (the diagonal su(2) restricts the 14 to 3⊕3⊕3⊕5 with NO singlet, so no
  su(3) commutes with it). Reject.
- `Der(O) ⊆ so(7)` already banked (N17/N18). Reject (re-pin).

## THE TARGET (GENUINE, NEW, LIGHT)
The Cayley–Dickson double `O ℚ = CD (H ℚ) = ⟨H,H⟩`. Define a SECOND family of derivations beyond
the inner derivations `innerDeriv P` (N6, `⟨a,b⟩↦⟨ad_P a, ad_P b⟩`):

  leftImDeriv Q : `⟨a,b⟩ ↦ ⟨0, Q·b⟩`  (left-multiply the im-slot by Q, kill the re-slot)

PROVED BY HAND to satisfy the Leibniz law for imaginary Q (`star Q = −Q`) in the banked CD product
convention (`(z*w).re = z.re*w.re − star w.im * z.im`, `(z*w).im = w.im*z.re + z.im*star w.re`):
  re: `−d̄(Qb) + d̄Q b = 0` (uses star Q = −Q + base associativity); im: `Q(da+bc̄)` ✓.

Brackets (all verified by hand, componentwise):
  - ⁅leftImDeriv Q, leftImDeriv Q'⁆ = leftImDeriv (Q·Q' − Q'·Q)          [T-factor su(2)]
  - ⁅innerDeriv P, leftImDeriv Q⁆   = leftImDeriv (P·Q − Q·P)            [cross]
  - secondSU2 P := innerDeriv P − leftImDeriv P
  - ⁅secondSU2 P, secondSU2 P'⁆     = secondSU2 (P·P' − P'·P)            [S-factor su(2)]
  - ⁅secondSU2 P, leftImDeriv Q⁆    = 0                                  [★★ COMMUTING — so(4)]
  - innerDeriv P = secondSU2 P + leftImDeriv P                           [diagonal]
Structure constants at H ℚ: ⁅leftImDeriv hI, leftImDeriv hJ⁆ = 2·leftImDeriv hK (cyclic);
  ⁅secondSU2 hI, secondSU2 hJ⁆ = 2·secondSU2 hK (cyclic).

So: g₂ = Der(O ℚ) contains TWO COMMUTING su(2)'s (su(2)_S ⊥ su(2)_T = so(4)), and the embedded
weak-isospin su(2) (N187 `innerDeriv hI/J/K`) is precisely their DIAGONAL.

## GO / NO-GO
GO if: leftImDeriv_isDeriv compiles foundations-only AND the commuting bracket
`secondSU2_commutes_leftImDeriv = 0` compiles. NO-GO (reframe/look wider) if leftImDeriv is NOT a
derivation in the banked convention (would mean the hand-derivation is wrong → THE ONE LAW, return
to trunk, re-measure).

## W8 NON-VACUITY
The commuting `⁅S,T⁆=0` is NOT a vacuous "everything commutes": (a) both su(2)_S and su(2)_T are
genuinely NONZERO non-abelian (T-factor bracket `⁅leftImDeriv hI,leftImDeriv hJ⁆ = 2·leftImDeriv hK ≠ 0`),
(b) the DIAGONAL isospin su(2) does NOT commute with T (`⁅innerDeriv hI, leftImDeriv hJ⁆ ≠ 0`), so the
commuting of S with T is a genuine selection — a real 6-dim so(4), not a degeneracy.
Costume C223: the T-factor structure constant witnessing coordinate
`(⁅leftImDeriv hI, leftImDeriv hJ⁆ (⟨0,1⟩:O ℚ)).im.im.im = 2` is GENUINELY 2; the WRONG claim (the
second su(2) is fake / T doesn't close / wrong constant) forces `2 = 191` in ℚ. Pair (2,191) FRESH
(battery has C216 2=184, C220 2=188 — distinct RHS).

## KILL (W9 instrument budget)
KILL = 90s per obligation, 180s per file. Every obligation is a componentwise `ext <;> simp <;>
ring/noncomm_ring` over the associative base, mirroring N6 liftEnd_isDeriv / N187 innerDeriv_bracket
(both LIGHT). If any single obligation exceeds 90s → STOP, it is an instrument signal (the framing is
wrong), reframe; do NOT inflate heartbeats.

## PHYSICS-WORDS-REMOVABLE
Delete "isospin/colour/gauge/su(2)/so(4)/g₂/SU(2)/SO(4)/diagonal/weak/commuting-as-physics": what
remains is pure math — for the CD double `CD (CD B)`, the maps `⟨a,b⟩↦⟨0,Q·b⟩` (imaginary Q) are
Leibniz-derivations; together with the inner derivations they generate two bracket-closed families
that mutually commute, the inner derivations being the sum of the two. No theorem statement needs a
physics word.
