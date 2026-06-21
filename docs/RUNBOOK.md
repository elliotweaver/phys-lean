# THE RUNBOOK — walls and the correct reaction to each
*When a worker hits a wall, it consults this. Each wall has ONE correct reaction. The wrong
reactions listed are the ones that actually happened in the predecessor project (phys-clay)
and that this project exists to prevent. Read docs/STANDARD.md first — this operationalizes it.*

---

## W1 — "I cannot prove the full target in Lean"
**THE central wall. Every past failure routed through a wrong reaction here.**

- ❌ WRONG (forbidden): shrink the theorem to what you *could* prove and "fix the docstring";
  write `NAMED BRIDGE` / `asserted at grade` / `NOT proved here`; mark the node done anyway.
- ✅ CORRECT (forced escalation — STANDARD §4):
  1. Is the blocker just "Mathlib lacks the structure"? Then **build the structure.** That is
     not a wall. Do not panic, do not block, do not bypass.
  2. Reframe through the trunk (fold → cascade → derived algebra). Does the difficulty
     *dissolve* when attacked from the origin instead of by the classical path? Try this BEFORE
     grinding the standard hard proof.
  3. Still genuinely hard? **Enqueue a dedicated dissolution ticket as the IMMEDIATE NEXT node**
     (title: `<node> — creative theory-native dissolution of <the hard lemma>`), write a crisp
     handoff of exactly what is hard and what trunk facts are available, then `kanban_block`
     THIS node on that child. You did not fail; you scoped the hard part to a dedicated attack.

## W2 — "I need a result that isn't banked yet (e.g. a dimension, a simplicity fact)"
- ❌ WRONG: cite it "at grade," proceed as if proved, mark done. (This created circular debt in
  phys-clay: a node cited `dim g₂ = 14` that a *later* node was supposed to prove.)
- ✅ CORRECT: it is a HARD dependency. Either (a) it is already a banked theorem — `import` and
  USE it (not "cite at grade"); or (b) it is not banked — then it is a prerequisite NODE. Build
  the prerequisite first, or block this node on a new prerequisite ticket. You may never depend
  on an *unproven* assertion. If you can't import it as a real theorem, you can't use it.

## W3 — "This node is too big for one session / I'm running low on turns"
- ✅ CORRECT (this worked in phys-clay, keep it): DECOMPOSE before you run out of turns. Commit
  what is safely bankable, `kanban_create` a child for the remainder, `kanban_link` parent=this
  child=new (LINEAR chain — see W4), write a crisp handoff, then `kanban_complete` THIS task as
  "decomposed: part N done, part N+1 enqueued." Never end a run by silently running out of turns
  (that auto-blocks and stalls autonomy). Keep nodes small by design.

## W4 — "What do I enqueue next / how do I keep the board single-flight?"
- ❌ WRONG: create two successor tasks, or a task with no parent link → two become `ready` → the
  dispatcher spawns TWO workers → concurrent lean compiles corrupt the shared tree.
- ✅ CORRECT: the board is single-flight via a STRICTLY LINEAR dependency chain. Before creating
  the next node: (a) `kanban_list` — if a ready/blocked successor already exists, do NOT create
  another; (b) link the new node onto the TAIL of the chain (A→B→C, never A→B and A→C); (c) honor
  the idempotency-key. A stalled (empty) board is SAFE; a forked board is NOT.

## W5 — "The numerics won't converge / the proof won't close / it feels forced"
- ❌ WRONG: search for a *weaker* claim that does close, then bank the weaker claim. (This is W1's
  disease in disguise — quietly lowering the target.)
- ✅ CORRECT (THE ONE LAW): if it fights you, you are likely DRIFTING — the instrument/framing is
  wrong, not the theory. Return to the trunk. NEVER add a new hypothesis or axiom to get past a
  fight. NEVER weaken the target to make it close. If after returning to the trunk it is still
  hard, that is a W1 dissolution ticket, not a reason to bank less.

## W6 — "A previous worker left partial/uncommitted work on this node"
- ❌ WRONG: rubber-stamp it ("looks gate-green, complete it"). The verifier did exactly this to a
  scope-reduced node in phys-clay.
- ✅ CORRECT: VERIFY independently against THE STANDARD before trusting it. Run the gate yourself.
  Apply the physics-words-removable test. Check `#print axioms` yourself. Only then commit. A
  green gate is necessary, NEVER sufficient — the STANDARD is the second gate.

## W7 — "The gate passed — am I done?"
- ❌ WRONG: gate-green ⟹ done. (The gate cannot see scope-reduction unless it's coded to; even
  then it is necessary, not sufficient.)
- ✅ CORRECT: gate-green is NECESSARY, NEVER SUFFICIENT. The node is done only when it ALSO meets
  THE STANDARD §1 (unbroken, complete, physics-words-removable). The completion claim in your
  handoff must assert all three explicitly, with the real `#print axioms` output pasted in.

## W8 — "The result came out surprisingly easy"
- ❌ WRONG: celebrate, bank it, move on.
- ✅ CORRECT: a too-easy result is a BUG until proven otherwise. Check the costume actually BITES
  (a wrong value MUST fail to compile). Check you didn't prove a vacuous/trivial statement. Check
  the physics-words-removable test didn't pass *because the theorem says nothing*. Anti-vacuity is
  as important as anti-overclaim.

---

## The single question that resolves every wall
> *Is the chain still unbroken and every claim still fully proved back to the fold?*
If yes → proceed. If no → you owe a completion/dissolution ticket, NOT a bridge, NOT a weaker
claim, NOT a "done." There is one category of unfinished work: incomplete derivation.
