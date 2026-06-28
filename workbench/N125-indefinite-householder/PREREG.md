# N125 PREREG — THE INDEFINITE-SIGNATURE HOUSEHOLDER REFLECTION + THE ANISOTROPIC PEEL ORACLE
# (lifting N124's positive-definite Householder peel from `O Cut` to the full 10-dim `STVC`)
# FROZEN before compute. The KILL classifies any fight as INSTRUMENT failure, not theory.

## THE MEASURE-FIRST FINDING (done by READING the banked chain, not guessing)

N124 banked the Householder peel oracle of the POSITIVE-DEFINITE Born form `gFormC` on `O Cut`
(8-dim, signature (8)). N125's frontier (ROADMAP §N125 (i)) is to LIFT it to the FULL
`STVC = Cut × Cut × O Cut` (10-dim) carrying the INDEFINITE Minkowski form
`BvC p q = t·t' − x·x' − gFormC v v'` (signature (1,9)).

THE KEY MEASURE the ticket flags: does the reflect-back scalar identity
`BvC a a = 2·BvC a (T v)` (a := T v − v) survive the indefinite signature?

ANSWER (from reading N124's `houseHolder_oracle` proof + the banked `BvC_*` bilinearity lemmas):
  - The identity decomposes as
      BvC a a = BvC(Tv)(Tv) − 2·BvC(Tv)v + BvC v v       [bilinearity only]
      BvC a (Tv) = BvC(Tv)(Tv) − BvC v (Tv)              [bilinearity only]
    and the isometry fact `BvC(Tv)(Tv) = BvC v v` (T preserves BvC) collapses both to
      BvC a a = 2·(BvC v v − BvC(Tv)v) = 2·BvC a (Tv).
    EVERY step is pure bilinearity + the isometry equation. ⟹ THE IDENTITY SURVIVES UNCHANGED.
    Positivity is NOWHERE used in the reflect-back; N124 used positivity ONLY to know
    `a := Tv − v ≠ 0 ⟹ gFormC a a ≠ 0` (anisotropy of the difference vector).

  - THE GENUINE NEW OBSTRUCTION (the indefinite signature's real content): for an INDEFINITE form
    `a ≠ 0` does NOT imply `BvC a a ≠ 0` — `a` can be NULL/isotropic (`BvC a a = 0`), so the
    normalizing scalar `(BvC a a)⁻¹` is undefined. This is the ONLY place positivity was load-bearing.

⟹ THE FORWARD DECOMPOSITION (W1/W3 — the ticket explicitly authorizes this):
   BANK (N125): the indefinite Householder reflection `houseHolderM a` of `BvC` for any ANISOTROPIC
     `a` (`BvC a a ≠ 0`) — apply / fixes_ortho / neg_self / isom / involutive — PLUS the
     ANISOTROPIC peel oracle (the reflect-back identity O4 + the fixed-axis O5, assembled into:
     involution, `R·T` isometry, strict finrank growth of the fixed subspace) over the full 10-dim
     `STVC`. This is the clean structural lift; positivity replaced by the explicit anisotropy
     hypothesis the indefinite signature forces.
   CHILD (N126): the NULL/isotropic case (when every moved difference `Tv − v` is isotropic — the
     standard indefinite-Cartan–Dieudonné complication, the W1 heavy remainder) + the full
     SO⁺(1,9) assembly stitching the boost (spectral) strand to this rotation exhaustion.

## GO / NO-GO

GO (full N125): bank, foundations-only ([propext, Classical.choice, Quot.sound]) and
  independently axiom-audited vs the built olean:
    BvCRight, fixSubmoduleM, mem_fixSubmoduleM, IsBvIsomLin (+ comp, id),
    houseHolderM, houseHolderM_apply, houseHolderM_fixes_ortho, houseHolderM_neg_self,
    BvC_houseterm, houseHolderM_isom, houseHolderM_involutive,
    houseHolderM_oracle (the anisotropic peel: involution, R·T isometry, strict finrank growth),
    W8 witnesses (timelike `eT`: self-overlap 1; spacelike `eX`: self-overlap −1 — the
      genuinely-indefinite demonstration that NEGATIVE-norm vectors still carry clean reflections).
  Gate D0–D6 green, costume C157 bites (1 = 125, distinct from C156 1=123), STANDARD applied,
  committed + LEDGER + ROADMAP, N126 childed onto the chain tail.

NO-GO / DECOMPOSE-FURTHER: if the peel oracle's strict finrank growth resists (Module.Finite Cut
  STVC instance / Submodule.finrank_lt_finrank_of_lt), bank at minimum `houseHolderM` + its 5
  reflection properties + the reflect-back O4/O5 lemmas (the indefinite Householder reflect-back
  lemma the ticket names), child the oracle assembly + null case.

## KILL (instrument budget — W9)

- PER-OBLIGATION KILL: every probe lemma must elaborate under 90s in an isolated `lake env lean`.
  If any single lemma exceeds 90s → W9 instrument failure → MEASURE the smallest sub-obligation,
  DECOMPOSE, prefer structural reduction through banked `BvC_*` / `linIsom_BvC_preserved`. NEVER
  inflate maxHeartbeats, NEVER throw a monolithic ring/simp at a fully-expanded 10-coordinate goal.
- WHOLE-NODE KILL: checkpoint at ~50% turn budget. If no clean production banked by then, decompose
  what compiles, child the remainder, complete as "decomposed". NEVER run out of turns mid-task.

## W8 — anti-vacuity

Costume C157 must FAIL to compile, reducing to a FALSE numeric `1 = 125` (distinct from the banked
battery … C154 8=119, C155 8=121, C156 1=123). The WRONG indefinite-Householder claim: the
Householder reflection at the timelike unit axis `eT := (1,0,0)` NEGATES it
(`houseHolderM eT eT = −eT`), so the Minkowski self-overlap of the image is
`BvC (−eT) (−eT) = BvC eT eT = 1`, NOT `125`.

PHYSICS-WORDS-REMOVABLE: delete Lorentz/boost/rotation/reflection/Householder/Minkowski/metric/
signature/timelike/spacelike/null/isotropic/anisotropic/isometry/peel/oracle/fixed/orthogonal —
the statements stand as pure linear algebra over the derived complete ordered field `Cut`: for
`a` with the bilinear `BvC a a ≠ 0`, the `Cut`-linear map `v ↦ v − (2·(BvC a a)⁻¹·BvC a v)•a`
preserves `BvC`, is involutive, fixes `ker (BvC a ·)`, and for a `BvC`-preserving `S ≠ id` with
`a := S v − v` anisotropic at a moved `v`, `ker(houseHolderM a · S − id) ⊋ ker(S − id)`.

## ANTI-TIMEOUT (W9 bank-as-you-go)

The instant a lemma compiles clean → MOVE to production
`Phys/Algebra/LorentzContinuumGenerationIndefiniteHouseholder.lean` → wire (Phys.lean +
Audits/AxiomAudit.lean import AT END of import list + #print axioms lines) → check name collisions
→ commit BEFORE the gate ceremony. Gate in BACKGROUND. The instant production+gate committed →
IMMEDIATELY child N126 + kanban_complete. Do NOT polish.
