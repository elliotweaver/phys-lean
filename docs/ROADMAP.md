# THE ROADMAP — the nodes, as TARGETS only
*Each node states WHAT must be achieved, its dependency, and its drift trap. It does NOT state
HOW to prove it — the derivation is the worker's job (that is the whole point; a hardcoded
solution trains nothing). Read docs/STANDARD.md and docs/RUNBOOK.md first. Nodes are executed
in dependency order — a node may not start until its prerequisites are `done`.*

---

## The shape of the chain
The chain begins at the **fold** and unfolds by forced steps. Early nodes are pure structure
(no physics words needed at all). Physics *names* appear only once the derived structure is
rich enough that a physicist recognizes it — and even then the name is removable (STANDARD §2).

Depth layers (mirrored in the `Phys/` folder structure):
- **Foundation** (depth 0) — the fold and what it immediately forces.
- **Cascade** (depth 1) — the forced algebra sequence and its termination.
- **Algebra** (depth 2) — the structures the terminal algebra forces.
- **Emergent** (depth 3+) — the structures physics recognizes, each a theorem.

---

## N1 — THE FOLD  (Foundation, depth 0, the root)
**Target.** Formalize the fold — self-look-back — as a mathematical object, and prove the
first property it forces. The fold is the project's ONE permitted posit (STANDARD §3): it is
*defined*, not derived from anything prior. Everything after N1 must be *derived*, never
posited.
**What "done" requires.** A Lean definition of the fold/self-reference operator and a proved
theorem capturing its defining consequence (the self-blindness / fixed-point property that the
trunk rests on). Foundations-only, costume that a WRONG version fails, gate green, STANDARD met.
**Dependency.** None (it is the root).
**Drift trap.** Do NOT import any physics. Do NOT posit ℂ/ℍ/𝕆 or J²=−1 as given — N1 defines
the fold and proves its immediate forced property; the algebra cascade is N2's job to DERIVE.
Do NOT smuggle a target structure in by choosing a definition that "happens to" be the answer;
the definition must be the honest formalization of self-look-back, and the property must follow.
**Physics-words-removable.** N1 should contain essentially NO physics words — it is pure
structure. If it needs a physics word to state its theorem, that is a red flag.

## N2 — THE CASCADE AND ITS STOP  (Cascade, depth 1)
**Target.** Derive — not posit — the forced sequence of structures that the fold generates,
and prove it TERMINATES at a specific point (the cascade does not continue forever; something
forces it to stop). This is the crown node: the field at large *posits* its starting algebra;
here it must be *derived* from N1, with the stopping point *proved*.
**What "done" requires.** Each step of the cascade is a theorem (structure k forces structure
k+1), and a theorem that the cascade halts at the terminal structure (the step that would
continue is proved impossible / loses a required property). Foundations-only, costumes that a
wrong continuation and a wrong stop both fail, gate green, STANDARD met.
**Dependency.** N1.
**Drift trap.** Do NOT assume the terminal algebra and check properties backward — DERIVE the
sequence forward from N1 and let the stop be FORCED. Do NOT hardcode the number of steps. The
stop must be a proved impossibility, not an asserted halt. If any step "fights you," return to
the fold (THE ONE LAW) — do not add a hypothesis to force the next rung.
**Physics-words-removable.** Still essentially pure structure. No physics names should be load-
bearing.

## ⚠ STANDING DEPENDENCY GATE — THE BASE FIELD (the continuum)  (Foundation, cross-cutting)
**This is not a sequential node; it is a precondition attached to the entire Emergent layer.**

**The issue.** The cascade (N2) is purely algebraic: Cayley–Dickson *takes a base ring as
input and doubles it*. The base it doubles is currently a stand-in (ℚ for concrete witnesses;
some real-linear / ordered-ring scaffolding already appears, e.g. the even-dimension obstruction
and the dim-2 operator). That base field is, right now, **an INPUT to the cascade, not an OUTPUT
of the fold.** Physics needs the continuum — ℝ with completeness — for anything analytic: real
probabilities (Born), Lie *groups* (not just algebras), Hilbert space, spacetime as a continuum,
real-valued constants. None of that exists yet, and ℝ is neither derived nor (deliberately)
posited — it has merely been computationally stood in.

**The gate.** Before ANY node that requires analysis / the continuum / real-valued quantities
(the first such node is likely the first genuinely *physics-recognized* structure in the Emergent
layer), the chain MUST resolve where its base field comes from. There are exactly two honest
outcomes, and the choice must be CONSCIOUS and DOCUMENTED — never a silent `import`:
  (a) **DERIVE the continuum from the fold** — ℝ (and its completeness) arises as a forced
      consequence of the fold's dynamics, the same way the algebras did. Then the chain stays
      single-axiom and unbroken, and ℝ is the first analytic eigenform. (HOW is the worker's job —
      do NOT hardcode an approach here.)
  (b) **Adopt ℝ as an explicit, flagged second posit** — permitted ONLY by deliberate human
      decision recorded in STANDARD §3 and docs/LEDGER.md. Per the STANDARD ("exactly one
      irreducible posit; never let a second creep in"), this WEAKENS the unbroken-chain claim and
      should be resisted; if taken, it must be loud, not silent.

**The drift trap this gate exists to prevent.** A future physics node silently does
`import Mathlib...Real` and *uses* ℝ to get its result. That smuggles a SECOND axiom: the result
then descends from `Real` (a Mathlib-given object), not from the fold — an invisible second root,
the exact "no second posit" violation the STANDARD forbids. When the chain first needs the
continuum, the correct move is to STOP and resolve this gate (a dedicated "continuum from the
fold" node, or a flagged §3 decision), NOT to reach for `Real`.

**Status.** UNRESOLVED. No physics/analytic node may be marked ✅ until this gate is addressed.

## N3 onward — TO BE SPECIFIED AFTER N1, N2 LAND
The downstream nodes (the structures the terminal algebra forces, and the physics-recognized
structures that emerge) will be specified as targets ONLY after the foundation is proved and we
can see the exact shape of what N2 produced. Specifying them now would risk hardcoding a path
the derivation hasn't earned. The dependency-ordered skeleton (subject to revision by what the
proofs actually show) is recorded in docs/LEDGER.md as "anticipated," NOT as committed targets.

**Why we stop the spec here:** a roadmap that dictates the full derivation in advance is a
hardcoded solution. The agent earns each node, and the next target is specified against what
the chain actually produced — not against what we guessed it would. The fold is the start of
all physics; we let it unfold and specify the next target from the ground it actually creates.
