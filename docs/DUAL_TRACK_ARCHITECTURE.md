# Dual-Track Architecture — Magnitude + Phase

*Decided in design discussion. Apply going forward (after N2 lands). This is the
magnitude/phase ontology expressed in the repo structure itself.*

---

## The core idea

The repo carries **two tracks** for the same derivation:

- **MAGNITUDE track (`Phys/`)** — the rigorous spine. Full gate standard: unbroken,
  foundations-only, no sorry / no axiom / no native_decide / no bridge. **LOAD-BEARING.**
  This is exactly what exists today; it is untouched by this proposal.

- **PHASE track (`Phase/`)** — the category-theory **map**. One file per node. Names the
  functor / universal property / **seam** for that node, and predicts *where blind-spots
  and gaps will surface*. **NEVER load-bearing. NEVER imported by `Phys/`.**

Framing that keeps it honest:
> **Category theory = the THEORY (hypothesis): it predicts what should be true and where
> the obstructions live. Magnitude = the EXPERIMENT: it confirms, rigorously.**

The phase track is also the **blind-spot early-warning radar**: the seams it marks are
exactly where RH-shaped / P-vs-NP-shaped / physical-blind-spot phenomena will appear in
our own chain. Magnitude proof-search is blind to global structure; categorical framing
sees global structure but not local hard detail. Carrying both means neither has to do
the other's job — and we never "find the seam in the dark."

Pedigree: this is the Grothendieck/Deligne division of labor (étale cohomology = the map,
the hard estimates = the magnitude). We give it an ontological grounding it never had:
the magnitude/phase split *is* the fold.

---

## Folder structure

```
Phys/         MAGNITUDE. Rigorous spine. Full gate. LOAD-BEARING. (unchanged)
Phase/        PHASE. Categorical track. One file per node. The map.
              Allowed to be a sketch. NEVER load-bearing. NEVER imported by Phys/.
docs/SEAMS.md The accumulating global map: per node — categorical interpretation +
              where the seams are + what gap-phenomena are coming.
```

---

## Per-node deliverable (going forward)

Each node owes **two** things:

1. **Magnitude proof** (`Phys/`) — required, unbroken, gate-verified, complete
   **on its own with ZERO reference to `Phase/`.**
2. **Categorical interpretation** (`Phase/`) — required to *exist*; names the
   functor / universal property / seam; honestly marked at one of three tiers.

---

## Phase-track 3-tier honesty marking (GRADE, never HEDGE)

- **Tier A — RIGOROUS:** a real categorical proof whose *leaves are magnitude theorems*
  (the hard computation is `exact Phys.theorem_name`). The aspiration: an unbroken
  categorical proof skeleton with magnitude lemmas as its load-bearing leaves. **No sorry.**

- **Tier B — STRUCTURAL:** the categorical *statement* is well-typed and diagram-coherent
  (functors compose, objects/morphisms well-formed, the claimed universal property is the
  right *shape*), but coherence *proofs* are deferred — marked `sorry` with label
  `STRUCTURAL: shape verified, coherence deferred`.

- **Tier C — SKETCH:** prose + diagram, explicitly `CONJECTURAL MAP`. Allowed only as a
  forward-pointer to a seam not yet reached.

Rule: prefer A, allow B, mark C honestly. Never let a tier claim more than it is.

---

## THE MAKE-OR-BREAK DISCIPLINE (the no-bridge rule at the meta-level)

> **The categorical track can NEVER discharge a magnitude obligation. The magnitude proof
> must be complete and gate-clean STANDING ENTIRELY ALONE, with zero dependence on `Phase/`.**

The lethal failure mode: a gap in a magnitude proof gets "covered" by a hand-wavy
categorical story ("categorically this obviously holds"). **That is the bridge, resurrected.**

Enforcement (structural, gate-checkable):
- The gate verifies `Phys/` imports **nothing** from `Phase/`. One grep. Hard rule.
- `Phys/` passes the full no-sorry / foundations-only / no-bridge gate **on its own**.
- `Phase/` may contain `sorry` (it's a map) but is **quarantined**: the gate's
  no-sorry/no-bridge detector runs on `Phys/` only; `Phase/` is checked instead for
  honest tier-marking.
- **Dependency arrow points ONE WAY:** Phase *may* cite Phys (Tier-A leaves);
  Phys *never* cites Phase. The map reads the territory; the territory never leans on the map.

---

## Guardrails (conscience notes)

1. **Don't let the phase track become its own gold-plating vector.** Keep the map LIGHT —
   a Tier-C sketch is an acceptable discharge when rigor is premature. Never spend a
   session perfecting a categorical proof when a one-paragraph seam-map would do.

2. **A wrong map is worse than no map.** Where the phase and magnitude tracks overlap,
   they MUST agree. A categorical prediction contradicted by a magnitude theorem means
   *the map is wrong — fix the map immediately.* Magnitude is always the arbiter; the map
   yields when they disagree.

3. **"Structurally sound" is enforced (phys-math's lane).** A Tier-A/B categorical claim
   must have correctly-shaped universal properties, well-formed functors, and coherence
   conditions at least *stated* even when proofs are deferred. A malformed categorical
   claim ("this is a monad" when unit/assoc laws can't be coherently stated) is NOT
   "structurally sound."

---

## Rollout

- **Now:** nothing that disturbs the running agent. Bank N2 in pure magnitude as planned.
- **First application (controlled experiment):** once N2 lands, **backfill N1/N2 with
  their categorical interpretations** in `Phase/`. Known material → we can judge whether
  the phase track genuinely adds clarity, whether Tier-A-with-magnitude-leaves works in
  Lean, and what the coherence tax really costs — without risking an unknown target.
  The deliverable (cascade as an endofunctor; the stop as where it stops preserving the
  norm; the seam = the associator obstruction) is itself the first piece of the global map.
- **Going forward:** dual deliverable per node, three-tier honesty marking, one-way
  dependency rule enforced by the gate.

---

## One-line summary

Not a compromise between two foundations. **The theory and the experiment, in one repo,
each doing only what it's good at** — which is what the fold says reality is. The whole
thing lives or dies on one arrow pointing one way: `Phase/` → `Phys/`, never the reverse.
