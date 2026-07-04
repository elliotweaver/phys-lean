# NODE SELECTION — the SELECT protocol (the first and hardest job of every node)

> **Read this in FULL at the start of every run, BEFORE STEP 0.** This is the single highest-stakes
> act in the whole project. Executing a node — the proofs, the discipline, the gate — is already
> gold-standard and does not fail. **The project's one live failure mode is choosing the WRONG NEXT
> NODE: a target framed in standard-math / standard-physics terms instead of the theory's own
> terms.** Every wall this project has hit traces back to a node that was set up the standard way
> instead of the theory-native way. Getting THIS right is the rest of the ballgame.

---

## WHY SELECTION MOVED OFF THE FINISHING WORKER

The finishing worker holds *maximal execution context* — but that is exactly the problem. At
wind-down it is saturated with the standard-math machinery it just used to close the proof, and it
reaches for "the next adjacent property" — faithful → image → commutant → … — a chain of
standard-rep-theory characterization nodes that each pass the gate yet drift, one clean step at a
time, away from the theory. **A finishing worker no longer decides the next target.** It hands
forward a *SELECTION ticket* — a fixed, standard instruction to the next worker to come up to speed
and DERIVE, from the theory's own terms, what the node should be. A **fresh** worker, not yet
saturated, does the selection. That is the whole design.

**Priority order, drilled into every run: (1) select the theory-native target  ≫  (2) justify it and
write the ticket  ≫  (3) execute it.** (3) is already perfect; do not let its polish tempt you to
rush (1). (1) is where the project is won or lost.

---

## THE SELECT PROTOCOL — five phases, in order, no skipping

### PHASE S1 — COME UP TO SPEED (load the whole picture, not a fragment)
You are a fresh worker. Before you can judge where the chain SHOULD go, you must see where it IS
and what the theory IS. Read, in full:
- `docs/STANDARD.md` (the bar), `SOUL.md` (the trunk, THE ONE LAW, the moat, the QUIET DRIFT rail).
- `docs/ROADMAP.md` — the recent LANDED sections (the last ~8–10 nodes: what was actually banked).
- `docs/LEDGER.md` — the chain status (tail rows).
- `docs/CONSTELLATION.md` — the stars (WHERE physics can be reached from what is banked).
- The last ~5 tickets' comment threads (`kanban_show` on recent done nodes) — the recent *arc*.
- `git log --oneline -15` — the concrete banked commits.
Write, in your first `kanban_comment`, a 3–4 line synthesis: *what the last few nodes built, what
arc that traces, and which stars are now in reach.* If you cannot state the arc crisply, you are not
yet up to speed — keep reading. **Do not select from a fragment.**

### PHASE S2 — DERIVE, FROM THE THEORY'S OWN TERMS, WHAT SHOULD COME NEXT (the core act)
Set the current ticket / recent arc ASIDE for a moment. Ask the two theory-native questions FRESH,
as if the standard-physics roadmap did not exist:

- **THE GOAL LENS.** *On the theory's own terms — the fold, self-blindness, the closure/distortion,
  the gather, the local→global (sheaf) failure — where are we in the story, and what is the next
  thing the theory itself is trying to say?* Not "what property of the last object is unproven,"
  but "what is the fold DOING here, and what does it do NEXT?" The physics the field recognizes is
  a *shadow* of this story; name the story's next beat, then find its shadow.
- **THE REFRAMING LENS.** *What does the theory say about the objects in play that standard
  math/physics does not?* The theory changes the framing in subtle, profound ways: it turns
  standard WALLS into dissolved CONSEQUENCES. A quantity the field computes with a heavy invariant
  tower may already be sitting, readable, in the fold's own measures. A "hard theorem" the field
  proves may be a one-line corollary of the ONE CAUSE. Ask: *is there a fold-native framing under
  which the obvious-looking next target is not a target at all but a free consequence — and a
  DIFFERENT, deeper target is the real next beat?*

Produce, from these two lenses, **the theory-native answer to "what is the next node"** — arrived at
independently of the current arc.

- **BOTH METHODS ARE OPEN — weigh the GATHER side and the ASCENT side (no method-lock).** As of
  2026-07-03 there is no method restriction (docs/ROADMAP.md). Two derivation methods are available
  and BOTH must be considered explicitly for the target you are weighing:
    · the **GATHER side** — deriving from the inter-world gluing obstruction (the associator cocycle,
      its representation content, its consequences);
    · the **ASCENT side** — the invariant-tower method (trace form / cubic norm / Freudenthal /
      Peirce idempotents on J₃(𝕆); the un-parked N218 normalization front).
  Ask what EACH side offers as the next beat, then choose on the merits — which is more forced, more
  theory-native, higher novelty/ROI, opens more structure. Near a constant / the mixing angle /
  a normalization, the ascent's invariant tower may now be exactly the right instrument; near
  representation/obstruction structure, the gather side may be. Neither is privileged; neither is
  forbidden. Name the comparison in your S4 write-up (what each side would do, why you chose one).
  The theory-nativeness bar and the ONE LAW apply to BOTH: if the chosen method fights you, reframe
  or switch side — do not grind.

### PHASE S3 — RECONCILE with the current arc (does the chain match the theory?)
Now compare your S2 answer against where the arc is actually heading (the current ticket's implied
direction, the recent trajectory):
- **If they ALIGN** — the arc is on the theory's own path — GOOD. Your target is the next logical
  beat that both the theory and the arc point to. Proceed.
- **If they DIVERGE** — the arc is drifting into standard-math characterization while the theory
  wants something else — **this is the moment the entire architecture exists for. Follow the
  THEORY, not the arc.** Push the target back onto the theory-native path. Say so explicitly in
  your reasoning ("the arc was heading toward X, a standard-math characterization; the theory says
  the live beat is Y; I am selecting Y"). Do not inherit a drifting direction just because it is
  there. Redirecting here is not overstepping — it is your single most important job.

### PHASE S4 — THE ANTI-BULLSHIT GATE (run EVERY candidate target through this, honestly)
You have a known failure mode: **self-justifying a standard-math/standard-physics target by
draping theory language over it.** This gate exists to stop exactly that. Do NOT wave it through.
For your chosen target, answer each — in writing, in your selection comment — with specifics, not
slogans:

1. **THE FOLD-CAUSAL TEST.** *Trace the target back to the fold in ONE unbroken causal line.* Not
   "it involves banked objects that descend from the fold" (everything does) — but "the fold does
   THIS, which forces THIS, which is why THIS node is the next thing the structure demands."
   If your trace routes through "…and the standard theory of X says we now need Y," you have
   drifted. A genuine trace is *fold → … → this node* with each arrow forced.
2. **THE DISSOLUTION TEST.** *Name the standard-math/standard-physics version of this step, and say
   what the theory does to it.* If the theory leaves it exactly as the field would do it, ask hard
   whether you have found the theory-native target at all, or just relabeled a textbook step. The
   best targets are ones where the theory DISSOLVES a wall the field would grind — name that
   dissolution, or name honestly that you have not found one here.
3. **THE GOAL-WORDS-REMOVABLE TEST (for the SELECTION, mirroring the STANDARD's for the proof).**
   Delete the physics words from your JUSTIFICATION. Does a genuine theory-native REASON remain for
   why this node comes next, or does the justification evaporate into "because the field studies
   this next"? If it evaporates, the target is standard-math in disguise.
4. **NAME THE STANDARD-MATH TEMPTATION.** State plainly: *what is the obvious, standard, adjacent
   next step here that a saturated finishing worker would have picked?* Then state why your target
   is either that step genuinely re-derived as forced by the theory, OR a deliberately different,
   deeper, theory-native beat. If your target IS the obvious adjacent step, you must show it passes
   tests 1–3 on the theory's own terms — not assume it does because it is convenient.
5. **THE HONESTY CLAUSE (say this to yourself and mean it).** Standard math and the theory OVERLAP;
   sometimes the honest theory-native target genuinely IS a standard-looking step, and that is fine
   — *when it truly survives tests 1–4.* But do not BULLSHIT. Do not manufacture a fold-native story
   for a target you actually picked because it was the easy adjacent lemma. If, being honest, you
   cannot give a non-bullshit theory-native justification, that is a signal the target is wrong —
   go back to S2. It is far better to spend this run FINDING the right theory-native target (even if
   that means the node's "deliverable" is a sharp reframing or a named dissolution ticket) than to
   execute a standard-math node flawlessly. Executing the wrong node perfectly is the failure.

If a candidate cannot pass S4 honestly, it is not the node. Return to S2. Iterate until you have a
target that survives the gate WITHOUT bullshit.

### PHASE S5 — COMMIT THE TARGET INTO THE TICKET (then execute)
Once you have a target that passes S4:
- **Rewrite this ticket's TITLE and BODY** with the decided target, in the standard node format
  (below). The title becomes the compact node headline; the body becomes the full execution spec.
- Your selection reasoning (S1 synthesis + S2 lenses + S3 reconcile + S4 gate answers) goes in the
  **kanban_comment thread** as the permanent record of WHY this node, on the theory's terms.
- **Then, and only then, proceed to STEP 0 and execute** the target under full discipline
  (STEP 0–4 unchanged — that machinery is gold and does not change).

---

## THE STANDARD SELECTION-TICKET (what a finishing worker hands forward — verbatim shape)

A finishing worker does NOT decide the next target. It creates the next ticket as a **SELECTION
ticket** — a fixed, standard handoff whose FIRST job is to run the SELECT protocol above. Use this
exact template (title + body):

**TITLE:** `N### — SELECT + derive the next node (theory-native FIRST; come up to speed, then choose and justify the target)`

**BODY:**
```
THIS IS A SELECTION TICKET. Your FIRST job is NOT to execute a pre-decided target — there is none.
Your first job is to SELECT the next node by running docs/NODE_SELECTION.md (the SELECT protocol),
IN FULL, before anything else. Priority: (1) select the theory-native target ≫ (2) justify it and
rewrite this ticket ≫ (3) execute it. (1) is the whole point; do not shortcut it.

THE ONE RISK THAT MATTERS: setting up a target in standard-math / standard-physics terms instead of
the theory's own terms. Every wall this project has hit came from that. The theory reframes things
in subtle, profound ways — it turns standard walls into dissolved consequences. Your job is to find
what the theory ITSELF says comes next, run it through the ANTI-BULLSHIT GATE (S4), and refuse to
self-justify a standard-math step as theory-native. Do NOT bullshit at this decision point — lean in.

WHAT IS BANKED (the launch platform): <finishing worker fills THIS section only — the banked state
its node produced, the exact new lemmas/objects with node numbers, and a NEUTRAL one-line note of
where the arc currently sits. NO next-target decision, NO menu, NO "you should do X next." Just the
factual banked state so the selecting worker comes up to speed fast.>

PROCEDURE:
  S1 come up to speed (docs + recent tickets + git log) — post the arc synthesis comment.
  S2 derive, from the GOAL lens and the REFRAMING lens, what the theory itself says comes next.
  S3 reconcile with the current arc — if they diverge, FOLLOW THE THEORY, redirect the target.
  S4 run the chosen target through the ANTI-BULLSHIT GATE (fold-causal / dissolution / goal-words-
     removable / name-the-temptation / honesty) — in writing, with specifics.
  S5 rewrite THIS ticket's title+body with the decided target in the standard node format, put the
     selection reasoning in the comment thread, THEN execute under full discipline (STEP 0-4).

⚠ NO METHOD-LOCK IS IN FORCE (the 2026-06-30 gather-side lock was LIFTED 2026-07-03; docs/ROADMAP.md).
BOTH the GATHER side (mining the gluing obstruction) and the ASCENT side (the invariant-tower method
— trace form / cubic norm / Freudenthal / Peirce on J₃(𝕆); the un-parked N218 normalization front)
are OPEN. At S2/S4 you MUST consider BOTH directions explicitly and choose on the merits (depth,
theory-nativeness, novelty/ROI), recording the comparison in your SELECT reasoning — name what each
side offers for the target you weigh and why you picked the one you did. Neither is privileged;
neither is forbidden; the ONE LAW still applies (if the chosen method fights you, reframe or switch
side, don't grind). The SELECT protocol chooses WHERE and by WHICH method — neither hands you the
answer. If SELECT concludes the honest next step needs a NEW AXIOM or an EXTERNAL/EMPIRICAL NUMBER,
do not invent it.
⛔ **CHAIN RUNWAY IS NOT "complete the node." NEVER `kanban_complete` a node with an empty board —
that silently kills autonomy (the N283 stall).** Two cases:
  (1) **An autonomous forward direction EXISTS** (any theory-native node the chain can still build
     WITHOUT a new axiom/number — e.g. a richer ambient, a toolkit node, a route-finder toward the
     blocked target). Then this is NOT a full runway: CHILD that autonomous node as your single
     successor and complete normally. A specific VALUE being un-forceable does NOT stall the chain
     while autonomous structural work remains — child the structural climb the value needs.
  (2) **The ONLY remaining step is a NEW AXIOM or an EXTERNAL/EMPIRICAL NUMBER** (nothing autonomous
     is left). Then `kanban_comment "CHAIN RUNWAY: <which>"` and **`kanban_block` with
     kind=needs_input** — a BLOCKED board is visible and safe (a human sees it, the chain is paused
     not dead). Do NOT `kanban_complete`; a done node with no successor is the invisible stall.

⚠ **STRUCTURAL/IDENTITY VALUE vs EMPIRICAL NUMBER — do NOT conflate them (the N283 mis-label).** A
physics constant has TWO separable parts, and only the second is ever out of your reach:
  · **The STRUCTURAL / IDENTITY value** — the exact value the theory FORCES as an algebraic fact of
    the derived tower (a kernel-checkable identity, no measured input). This is **AUTONOMOUS and is
    the PRIZE** — the single highest-value kind of node on the arc (the first place the chain
    produces a number the field treats as a free input). It is **NEVER human-gated.** Deriving it is
    exactly your job; a wall in front of it means BUILD the richer structure (case 1), never "block
    on the human."
  · **The EMPIRICAL COMPARISON** — that identity run to a measured scale and checked against a
    measured value. The measured value is **data-comparison PROSE, out of scope** (the world supplies
    the number; the Lean proves the identity; the match is asserted in prose, never derived). This is
    not a "node the chain is blocked on" — it is simply not a derivation the chain owes.
  So when a target is a constant: the identity is the autonomous prize you PURSUE; only "invent the
  measured number / its empirical scale" is off-limits, and that off-limits sliver is PROSE, not a
  reason to defer the structural derivation. **NEVER stamp a whole constant "human-gated CHAIN
  RUNWAY" — that mothballs the prize.** Separate the two: pursue the identity, leave the measured
  comparison as prose. Only a genuine NEW AXIOM (not an identity you have not yet found the route to)
  is the human-gated line.

max_retries=25, --max-runtime 120m, --workspace dir:/Users/elliotweaver/phys-lean, assignee phys-novelty.
```

⚠ WHEN YOU `kanban create` THIS SELECTION TICKET, you MUST pass ALL of these flags explicitly —
they do NOT default: `--max-runtime 120m` (selection + execution in one run needs the full window; the
system default is only 45m and a selection run that also executes WILL time out and thrash on
requeue — harder nodes now need the longer research/search phase), `--max-retries 25`, `--assignee phys-novelty`, `--workspace dir:/Users/elliotweaver/phys-lean`.
Omitting `--max-runtime 120m` is a known regression — the ticket silently gets 45m and times out.
A manager-side watchdog also raises any active phys-novelty ticket below the 120m floor, but pass the
flag correctly regardless.

The finishing worker fills ONLY the "WHAT IS BANKED" section with neutral facts. It writes NO
target, NO menu, NO recommendation. The next worker selects.

---

## THE NON-NEGOTIABLE: EXECUTION IS UNCHANGED

Everything from STEP 0 onward in the worker body — PREREG, numerics-with-teeth, scratch Lean,
production Lean, costume, gate, the STANDARD check, foundations-only audit, commit, LEDGER —
is GOLD and does NOT change. This protocol governs ONLY the choice of WHAT node to build. Once the
target is selected and passes the anti-bullshit gate, you execute it with the exact same
perfect discipline as always. Selection is the new front door; the house behind it is untouched.
