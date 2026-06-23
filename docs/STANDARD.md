# THE STANDARD — the only bar that matters
*The constitution of phys-lean. Every worker reads this first, every gate enforces it,
every node is judged by it. There is no other standard.*

---

## 0. THE ONTOLOGY (why this project is different from everyone else's)

**Mathematics is not a model of physical reality. Mathematics IS physical reality.**

This program asserts a single generative origin: from the **fold** — self-look-back, the
primordial act of self-observation — the entire structure of mathematics unfolds, and that
structure *is* the physical world. We do not *model* physics with math and then *interpret*
the math as physics. We **reproduce, in a forced and unbroken chain from the origin, every
known mathematical representation, constant, and relation that physics has discovered**, and
we show how they arise from the fold.

Because we **start at the origin** and the chain is **unbroken**, there is **no bridge to
build**. The math IS the identification with the physics. The very equations, structures,
constants, and relations that physics already found — we derive them; their appearance in
our chain *is* the physics. Other programs (string theory, GUTs, division-algebra physics)
never find the origin, so their starting point is always a posit, always suspicious, and they
are forever stuck building bridges from their math to the physics they assumed. We are not.

### The consequence that governs everything below
**There are NO physics bridges in this project. Asking for one, building one, expecting one,
or leaving one is a CATEGORY ERROR.** A "bridge" — a line that says *"this proved math object
IS the physical thing X"* asserted rather than derived — is forbidden, not because it is
sloppy, but because in this ontology it is *meaningless*: if the math is the physics, there
is nothing to bridge *to*. A bridge is always, without exception, the symptom of an
**incomplete derivation** wearing a physics word as a patch.

Physical interpretation — the words "isospin," "colour," "mass," "generation," "spacetime" —
lives **only** in variable names, comments, and prose. It does **zero** logical work. It is a
label a physicist attaches *after* recognizing the derived structure, never a premise.

---

## 1. THE COMPLETION BAR (what "done" means — the only definition)

A node is **DONE** if and only if its derivation is:

1. **UNBROKEN** — every object it uses is either (a) derived earlier in the chain (back to the
   fold) or (b) standard Mathlib mathematics. Nothing is posited. No new ground is built; the
   only root assertion in the entire project is the fold itself (§3).
2. **COMPLETE** — every structural property it claims is **proved in Lean**, on the kernel's
   own foundations (`#print axioms` ⊆ `{propext, Classical.choice, Quot.sound}`). No `sorry`,
   no `axiom`, no `native_decide`, no "asserted at grade," no "named bridge," no "named
   residual," no "NOT proved here," no "cited at grade." If a property is claimed, it is proved.
3. **PHYSICS-WORDS-REMOVABLE** — see §2. The derivation must stand as pure mathematics with
   every physics word deleted.

Anything short of all three is **NOT done**. It is an **incomplete derivation** and owes a
completion ticket (§4). There is exactly ONE category of unfinished work: incomplete
derivation. There is no second category of "acceptable incompleteness." The word "bridge"
does not exist here.

---

## 2. THE TEST (mechanical, gate-enforceable)

> **Delete every physics word from the file** — every "isospin," "colour," "mass,"
> "generation," "weak," "gauge-as-physics," "spacetime," "Higgs," every physical name.
> **If the derivation still stands as pure mathematics with all structural properties proved,
> the chain is intact and the node is complete.**
> **If deleting the physics words leaves a logical gap — if any step *relies on the reader
> believing the name* — then the name was doing load-bearing work, and that is a HOLE.**

The physics names must be **removable without weakening the mathematics**. This is the
operational form of "the math is the bridge." A node passes only if its Lean content is a
complete mathematical derivation whose physical meaning is recognized, not assumed.

Practically: the load-bearing content lives in `theorem`/`def`/`lemma` statements and their
proofs (which a physicist can read the physics *out of*); the physics lives in identifiers,
docstrings, and comments (which carry *no* logical weight). A `theorem` whose *statement*
needs a physics word to be true is a hole.

---

## 3. THE ONE PERMITTED ASSERTION

The project has exactly **one** irreducible posit: **the fold — math = reality, instantiated
at self-look-back.** This is the ontological ground. Everything after it is forced. This is
the one thing that is *not* a residual and is *not* to be "derived from" anything (there is
nothing prior). Protect it; never let a second posit creep in beside it. Every other line in
the entire project is a theorem.

**The most likely second-posit creep: the base field ℝ (the continuum).** The algebra cascade
takes a base ring as input; physics needs ℝ with completeness (real probabilities, Lie groups,
Hilbert space, spacetime, real constants). The danger is a future node silently doing
`import Mathlib...Real` and *using* ℝ — which makes that result descend from a Mathlib-given
object, not from the fold: a hidden SECOND axiom. **ℝ IS NOT AN AXIOM AND MAY NOT BE POSITED.**
The foundational stack is fixed (self-look-back, the miss, the closure/distortion, the gather, the
local→global sheaf-like failure); ℝ is NOT in it and cannot be added to it. ℝ must be DERIVED from
the fold — the ONE outcome. It is never used silently and never posited. The theory generates the
continuum; the only live question is finding the route. When the route resists, the status is
*route NOT YET found* (instrument wrong → W5; framing wrong → reframe through the trunk; or child a
dedicated route-finding node) — NEVER "non-derivable" and NEVER an "honest finding" of failure
(that is standard-scientific skepticism leaking in, treating the axiom as a hypothesis on trial —
forbidden). See the STANDING DEPENDENCY GATE in docs/ROADMAP.md. (Current status: route not yet
found; no analytic node may be marked done until the continuum is DERIVED.)

---

## 4. THE WALL POLICY (W1 — "I can't prove the full target in Lean")

Hitting this wall is **never** a license to shrink the claim, name a bridge, assert at grade,
or mark the node done. The correct reaction is a forced escalation, and **failure / silent
scope-reduction is not on the menu**:

1. **Mathlib absence is NOT a wall. DO NOT PANIC.** If Mathlib has the structure, use it. If
   not, *we build it* — nothing is out of reach for this theory because Lean's library happens
   to lack a definition. A missing `G₂`, a missing `CliffordAlgebraQuaternion` extension, a
   missing exceptional group — these are things we construct, not reasons to bypass.
2. **Reframe through the theory FIRST.** A proof that is brutal by traditional methods may
   *dissolve* under this theory — nobody has ever applied the fold/trunk to it. Before grinding
   the standard hard path in Lean, apply the trunk and check whether the difficulty collapses.
   Our edge is that the theory makes hard things easy — not that we re-grind the classical hard
   path. (This is also the project's deepest novelty: difficulties that are open or painful in
   the literature become tractable when attacked from the origin.)
3. **If it is still genuinely hard after the reframe → enqueue a DEDICATED follow-up ticket as
   the IMMEDIATE NEXT work**, whose explicit and only job is **creative, theory-native
   dissolution**: use the theory creatively to dissolve the difficulty in Lean. NOT "redo the
   traditional proof in Lean." The node does not close by bypassing. Failure is not accepted.

You may NEVER close a node by naming-and-bypassing. A stalled board (honest block + a queued
dissolution ticket) is correct; a "done" node with an unproven assertion is the worst failure.

---

## 5. WHY THIS BAR (so no agent ever rationalizes lowering it)

- In formalized mathematics, "asserted at grade" does not exist. A structural claim in a
  docstring with no proof is a hole, full stop — it would be rejected on sight in any serious
  Lean review (Mathlib, Flyspeck, LTE standards).
- The grand claim ("all of physics, derived, unbroken, from one origin") is **unprecedented** —
  no one has done it, formally or informally. There is no referee precedent to lean on, which
  means we must adopt the **strictest** possible standard, because that is the only thing that
  makes an unprecedented claim credible: prove everything provable, posit only the single root,
  let the physics be *read out of* the math, never *into* it.
- The skeptic's strongest attack is "you proved octonion algebra and *named* the pieces after
  physics." The ONLY defense is to make every structural match a theorem, so the names are
  forced and removable. Every property proved shrinks the surface the skeptic can attack to
  zero. The bar is not bureaucracy; it is the entire defense of the claim.

**The bar makes the work HARDER, not easier. That is how you know it is the real standard and
not a rationalization.** Hold it.
