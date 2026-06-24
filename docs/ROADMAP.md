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

## ⚠ STANDING DEPENDENCY GATE — THE NUMBER TOWER (ℕ → ℤ → ℚ → ℝ) FROM THE FOLD  (Foundation, cross-cutting)
**This is not a sequential node; it is a precondition attached to the entire Emergent layer.**
**It governs the WHOLE number tower, not just the continuum. The continuum (ℝ) is the TOP of the
tower; ℕ, ℤ, ℚ are the BOTTOM. As of N7–N14 BOTH ENDS now descend from the fold — the gate is
RESOLVED (see Status below). The text below is retained as the standing discipline this gate enforces
for every future node.**

**The issue (historical — now resolved; retained as the motivating problem).** The cascade (N2) is
purely algebraic: Cayley–Dickson *takes a base ring as input and doubles it*. That base ring — and the
whole number system under it — was originally a STAND-IN imported wholesale from Mathlib:
`import Mathlib.Data.Int.Basic` (ℤ), `import Mathlib.Data.Rat.Defs` (ℚ), with ℝ-scaffolding in the
even-dimension / why-double argument (`Module ℝ`, `finrank ℝ`, `LinearMap.det`). **ℕ, ℤ, ℚ, ℝ were
then INPUTS borrowed from Mathlib, not OUTPUTS of the fold** — the single largest unowned gap in the
chain. It has since been closed rung by rung (N7–N14); the description below records the problem the
gate existed to prevent. A reviewer attacks here
first: *"your thesis is ONE axiom generates everything — but you imported the rationals. Where do
ℕ, ℤ, ℚ come from: your fold, or Mathlib?"* The honest answer must be **the fold**, and the Lean
must show it.

**The gate.** Before the foundation is sound — and certainly before any physics-recognized /
analytic node — the chain MUST derive the FULL number tower from the fold. There is exactly ONE
permitted outcome at every rung:
  **DERIVE it from the fold.** ℕ, then ℤ, then ℚ, then ℝ-with-completeness must each arise as a
  FORCED consequence of the fold's own dynamics — the same way the algebras did. The ontology has
  the engine: the fold re-entering / iterating itself is the genesis of COUNTING (ℕ); the additive
  and multiplicative closure of that counting gives ℤ and ℚ; and the gather of closures (self-fold
  missing itself → covering the miss with a closure → the gather of those closures → the
  local→global / sheaf-like failure) is the structure the continuum (ℝ) is completed from. HOW is
  the worker's job — do NOT hardcode an approach; reframe through the trunk first (W1 step 2).

**THE BOTTOM OF THE TOWER — ℕ, ℤ, ℚ (owed backfill, currently imported).** Each is a dedicated
foundation node that must be banked, ℝ-free and Mathlib-number-import-free:
  - **ℕ from the fold** — counting/arity as the fold's own iteration (re-entry of the distinction),
    not `Mathlib`'s inductive `Nat` smuggled in as content.
  - **ℤ from ℕ** — the additive (group) closure of the derived counting.
  - **ℚ from ℤ** — the multiplicative (field-of-fractions) closure of the derived integers.
  Only once ℚ is the DERIVED ℚ does the continuum work (N6, the cuts/gathers over ℚ) rest on the
  fold rather than on a borrowed ground. The N6 construction is structurally correct and is NOT torn
  down — it ports verbatim onto the derived ℚ; but the gate is not resolved while its ground is
  imported. The cap value "3", the dimension counts, and every witness arity ultimately trace to
  this derived ℕ.

**NOTE — content vs. metalanguage (the one honest distinction).** ℕ used as Lean *type-theory
arity/indexing* (the `n` in `Fin n`, a matrix dimension, the kernel's own `Nat`) is substrate, like
`propext` — it is the metalanguage the proof is written in, not a posited mathematical object inside
the derivation. What MUST be derived is the number tower used as **CONTENT**: the ground ring the
cascade is built over, the field analysis happens in, the integers/rationals that carry the
witnesses and constants. When in doubt, ask: *is this number system the OBJECT the result is a
statement about, or the METALANGUAGE counting the statement's parts?* The former must be earned; the
latter is substrate. Do not weaponize this distinction to wave through a borrowed content ring.

**ℝ / ℤ / ℚ ARE NOT AXIOMS AND CANNOT BE ADDED AS ONES.** The foundational stack is fixed:
self-look-back, the miss, the closure/distortion, the gather, the local→global (sheaf-like)
failure. No number system is in it. Adopting any of ℕ/ℤ/ℚ/ℝ as a posit — or importing it from
Mathlib as the load-bearing ground — is FORBIDDEN: it is the second-axiom smuggling the STANDARD
exists to prevent. The tower is DERIVED from the fold — the ONE outcome, never papered over by
positing or by `import Mathlib.Data.{Nat,Int,Rat,Real}` used to GET a result. When the route
resists, the status is *route NOT YET found* (reframe through the trunk / W5 / child a route-finding
node) — NEVER "non-derivable" and NEVER an "honest finding" of failure. The theory generates the
number tower; the only live question is how and when we find the route, never whether it can be
reached.

**⚠ THE UNEARNED-IMPORT WARNING LIGHT (a standing alarm, every run).** The moment a node does
`import Mathlib.Data.Nat.*` / `Int.*` / `Rat.*` / `Real.*` / `Complex.*` — or uses ℕ/ℤ/ℚ/ℝ/ℂ as the
CONTENT ground ring, field, or coefficient system of a derivation (not as metalanguage arity) — a
warning light fires: **you are about to build a load-bearing result on a number object the fold has
not yet earned.** STOP. Either the object is already derived-and-banked (import the BANKED one and
USE it — RUNBOOK W2) or it is a prerequisite NODE that must be built first (RUNBOOK W1). Never let a
borrowed number system silently become load-bearing. This is the exact mechanism by which an
unjustified foundation slips past every local gate while each node looks clean — the project's own
local→global failure, in the operator's domain.

**The drift trap this gate exists to prevent.** A future node silently does
`import Mathlib...Real` (or `Rat`, or `Int`) and *uses* it to get its result. That smuggles a
structure the chain never derived: the result then descends from a Mathlib-given object, not from
the fold — a broken chain. When the chain needs a number system, the correct move is to STOP and
DERIVE it from the fold (a dedicated node), NOT to reach for the import and NOT to posit it.

**Status.** ✅ RESOLVED — the WHOLE tower ℕ→ℤ→ℚ→ℝ descends from the fold AND no node leans on imported
Mathlib ℝ (or any Mathlib number system) as load-bearing content. ℕ (N7), ℤ (N8), ℚ (N9) all
descend from the fold (Mathlib-number-import-free), and the ORDER on the derived ℕ→ℤ→ℚ is derived
from counting's comparability (N10 `OrderedTower`, the derived ℚ is a LinearOrderedField). The
continuum's ORDER-COMPLETENESS half is now RE-GROUNDED onto the derived ℚ (N10
`ContinuumDerived.lean`, namespace `ContinuumQ`): the gather/cut/completeness + the derived √2
re-stated over `Phys.Foundation.Q`, with the analytic obstruction supplied by the banked
`Q.no_q_sq_two` (infinite descent on counting) instead of Mathlib `Rat.den_pow`. ★ THE ℝ FIELD-OPS,
INCREMENT 1 — BANKED (N11 `ContinuumField.lean`): the derived ℚ is ARCHIMEDEAN (`Q.instArchimedean`,
itself derived from counting via `Re.toNat`, NOT imported), and the completion `Cut` is now a
DEDEKIND-COMPLETE LINEARLY ORDERED ABELIAN GROUP — cut addition (gather of pairwise sums), negation =
the fold's reflection (reflect the upper complement), the additive inverse `add_neg_self` (the
eternal approach / Archimedean made load-bearing via the cut-approximation lemma `approx`),
`AddCommGroup Cut` + `LinearOrder Cut` + `IsOrderedAddMonoid Cut`, with `zero_lt_sqrt2` the
strictly-positive √2 witness (non-degeneracy). ★ THE ℝ FIELD-OPS, INCREMENT 2 — BANKED (N12
`ContinuumFieldMul.lean`): the POSITIVE-CONE MULTIPLICATION on `Cut` (the gather of pairwise
products of nonnegative approximants — Born=self-overlap=positivity one level up), sign-extended
to `Mul Cut` via the banked negation + `LinearOrder Cut`, `One = Qcut 1`; and ★★ THE CAPSTONE
`sqrt2 * sqrt2 = Qcut 2` (`pmul_sqrt2_sqrt2`/`sqrt2_mul_sqrt2`) — the analytic gap N6 forced
(`x²=2` unsolvable in the derived ℚ, banked `Q.no_q_sq_two`) is SOLVED in the completion via
`sq_dense` (density of rational squares, a geometrically-contracting Heron iteration closed by
the banked `Q.instArchimedean`); the completion strictly extends the derived ℚ AND closes the
square the ground could not. The original N6-pre files over imported ℚ are retained
as the imported-ground statement; the load-bearing re-grounded version is `ContinuumQ`. ★★ THE ℝ
FIELD-OPS, INCREMENTS 3+4 — BANKED (N13 `ContinuumFieldRing` + `ContinuumFieldInverse`): the cone
RING LAWS (`pmul_assoc_cone`, `pmul_distrib_cone`, `pmul_one_cone`) + sign extension (the banked
`neg_mul`/`mul_neg`) give ★ `CommRing Cut`; the multiplicative INVERSE of a positive cut = the
REFLECT-AND-RECIPROCATE set `pinvS` (the multiplicative swap one level up, mirroring N9's q/p swap),
with `pmul_pinv_cancel` closed by the C6 eternal approach a third time (`mul_approx`, the ratio of
an interior point to an exterior bound forced past any `t<1` by the banked Archimedean lever),
sign-extended ⟹ ★★ `Field Cut`; and `mul_pos` (the positive cone closed under the product — Born
positivity as an ORDER fact) ⟹ ★★ `IsStrictOrderedRing Cut`. With the banked Dedekind completeness
(`completion_coherence_closed`), `ContinuumQ.Cut` is now a LINEARLY ORDERED FIELD WITH THE LUB
PROPERTY — the ℝ rung, over the derived ℚ, with NO posited ℝ. ★ WHAT STILL
KEEPS THE GATE UNRESOLVED: nothing remains. ★★ THE N2 ℝ-SCAFFOLDING DISCHARGED — BANKED (N14
`ComplexUnit.lean`): the why-double / even-dimension argument no longer leans on imported ℝ. Reframed
through the trunk (THE ONE LAW): the why-double law is NOT a fact about ℝ — it is the trunk's
positivity (`det(J)² = det(J∘J) = det(-id) = (-1)^finrank`, and `det(J)² ≥ 0` by `sq_nonneg`, forcing
`finrank` even), a fact about ANY linearly ordered field. `foldRoot_forces_even_dim` is now ABSTRACT
over `[Field K][LinearOrder K][IsStrictOrderedRing K]` (Mathlib `LinearMap.det`/`finrank`/`sq_nonneg`
as field-generic MACHINERY) and INSTANTIATED at the DERIVED ℝ `ContinuumQ.Cut`: `J₂` on `Cut × Cut`,
the dim-1 obstruction on the derived line `Cut`, non-vacuity over the derived ℚ `Q`. NO `import
Mathlib.Data.{Real,Rat,Complex}` content anywhere in the file (`ZMod 5` kept only as the negative
tightness witness — order is load-bearing). Strictly STRONGER than the imported-ℝ original.

**THE GATE IS RESOLVED.** Every rung of the number tower ℕ→ℤ→ℚ→ℝ descends from the fold, and NO node
leans on imported Mathlib ℝ (or any Mathlib number system) as load-bearing CONTENT. The
analytic/physics-recognized (Emergent) layer is no longer blocked by a borrowed number ground — N6
onward (the first physics-recognized structures) become specifiable.

## N3 — WHAT THE TERMINAL ALGEBRA FORCES: the operator (Clifford) structure  (Algebra, depth 2)
**Target.** Derive the FIRST purely-algebraic structure the terminal algebra `𝕆` forces: the
reorganization of its NON-associative multiplication into an ASSOCIATIVE operator algebra. Prove
that the left-multiplication maps `L_a : x ↦ a·x` of the imaginary terminal algebra satisfy the
quadratic (Clifford) relation `L_a ∘ L_b + L_b ∘ L_a = −bilin(a,b) · id` (equivalently
`L_a² = −Nrm(a)·id` on imaginaries, polarized). This is the algebraic seed of the spinor/gauge
structure physics recognizes — and it is DERIVED from the cascade (the trunk), where the
division-algebra-physics field merely POSITS `𝕆` and reads its Clifford structure off by hand.
**What "done" requires.** A Lean theorem, over the banked terminal algebra (the cascade's `O`,
no new carrier posited), that the imaginary left-multiplication endomorphisms satisfy the
quadratic relation, with the form `bilin`/`Nrm` being the already-banked Born self-overlap (N2),
NOT a freshly posited inner product. Foundations-only, costume that a WRONG sign / the relation
asserted WITHOUT non-associativity (e.g. on an associative base where the squares vanish wrongly)
fails, gate green, STANDARD met.
**Dependency.** N2 (all rungs + the forced stop + the forced iff). The natural route is the
just-closed LEFT SCALING LAW `x·(star x·y) = ι(Nrm x)·y`: on an imaginary `a` (where
`star a = −a`) it reads `a·(a·y) = −Nrm(a)·y`, i.e. `L_a² = −Nrm(a)·id`; polarizing in `a`
gives the Clifford relation. (This is a HINT, not a mandate — the worker derives the HOW.)
**Drift trap.** Do NOT import Mathlib's `CliffordAlgebra`/`QuadraticForm` machinery and ASSERT
that `𝕆`'s operators ARE a Clifford algebra — derive the relation FORWARD from the banked `CD`
product + `star` (the POSIT-vs-DERIVE moat; the SAME drift trap as the forbidden Hurwitz import).
Do NOT posit the bilinear/inner-product form — it is the banked `bilin`/`Nrm`. Do NOT reach for
`ℝ`: stay over the cascade's base ring. **If the honest derivation needs the continuum, STOP and
resolve the ⚠ STANDING DEPENDENCY GATE first — never silently `import Mathlib...Real`.** (N3 as
specified is purely algebraic and should NOT need the continuum; if it fights you toward `ℝ`,
that is the gate, not a workaround.)
**Physics-words-removable.** Delete "Clifford", "spinor", "gauge": the theorem is a pure
statement that the left-multiplication endomorphisms of the terminal algebra satisfy a quadratic
relation governed by the self-overlap form. No physics name may be load-bearing.

## N4 — THE GENERATED OPERATOR ALGEBRA + THE MODULE (SPINOR) STRUCTURE  (Algebra, depth 2)
**Target.** Derive the SECOND purely-algebraic structure the terminal algebra forces, building
directly on N3's Clifford relation. N3 proved each imaginary `Lop a` is (with `clifford_op`) an
anticommuting root of `−bilin`-scalars in the ASSOCIATIVE operator ring `AddMonoid.End (CD (CD B))`.
The forced next structure is the associative subalgebra those operators GENERATE and the fact that
the terminal algebra `𝕆` is itself a MODULE over it (the object physics recognizes as the spinor
module on which the Clifford/operator algebra acts). Concretely, prove: (i) the left-multiplications
by a full basis of imaginaries pairwise anticommute and square to `−Nrm·id` (generalizing N3's
single-pair `units_anticommute` / `L_unit_sq` to the whole imaginary basis — the complete set of
generating relations), and (ii) the unital associative subalgebra of `End` they generate, acting on
`𝕆`, is the operator/Clifford representation, with `𝕆` its module. This is the algebraic seed of the
spinor/gauge structure physics recognizes — DERIVED from the cascade, where the field POSITS the
Clifford module by hand. THE MOAT: posit-vs-derive.
**What "done" requires.** Lean theorems, over the banked octonion shape (no new carrier posited):
the full anticommutation/square relations on an imaginary basis, and the generated-subalgebra +
module statement, with the form the banked `bilin`/`Nrm` (N3) — NOT a freshly posited inner product.
Foundations-only, costume that a WRONG relation (e.g. two distinct basis units that COMMUTE, or a
`+` square) fails, gate green, STANDARD met.
**Dependency.** N3 (the operator/Clifford relation). PURELY ALGEBRAIC — stays over the cascade's
base ring (`ℚ` witnesses); should NOT need the continuum.
**Drift trap.** Derive FORWARD from N3's `Lop`/`clifford_op` + the banked `CD` product/`star`/
`bilin`/`Nrm`. Do NOT import Mathlib's `CliffordAlgebra`/`QuadraticForm` and ASSERT the generated
algebra IS a Clifford algebra / its module IS a spinor module (POSITS the structure — the same drift
trap N3 avoided). Build the generated subalgebra + the module action yourself if Mathlib lacks the
exact shape (RUNBOOK W1: Mathlib absence is not a wall). Do NOT posit the bilinear form (banked
`bilin`/`Nrm`). **If the honest derivation needs the continuum (e.g. it forces a Lie GROUP, a
completion, or a real-spectral argument), STOP and resolve the ⚠ STANDING DEPENDENCY GATE first —
never silently `import Mathlib...Real`.** (N4 as specified is purely algebraic and should NOT need
the continuum; the gate bites at the first physics-recognized/analytic node, likely N5+.)
**Physics-words-removable.** Delete "spinor", "gauge", "Clifford": the theorems are pure statements
that the left-multiplication endomorphisms generate an associative subalgebra with prescribed
anticommutation/square relations governed by the self-overlap form, and that the terminal algebra is
a module over it. No physics name may be load-bearing.

## N5 — THE HERMITIAN JORDAN TOWER AND ITS FORCED CAP AT 3 (Algebra, depth 2)
**Target.** Derive the THIRD purely-algebraic structure the terminal algebra `𝕆` forces, and make
it the first proved instance of the trunk's flagship claim — **ONE CAUSE, MANY TERMINATIONS**. The
SAME octonionic non-associativity that stopped the cascade (banked `not_associative` : `O ℚ` is not
associative) *also* caps a second tower: the Hermitian self-adjoint elements `H_n(𝕆)` under the
symmetrized (Jordan) product `a ∘ b = ½(a·b + b·a)` form a Jordan algebra **iff `n ≤ 3`**. Prove the
cap: (i) for `n = 3`, `H_3(𝕆)` satisfies the Jordan identity — forced because `𝕆` is ALTERNATIVE
(the left/right-alternative law, banked as N3's hypothesis-free `scaling_law`), which is *exactly*
the property `n = 3` needs and no more; (ii) for `n ≥ 4` (concretely `n = 4`), the Jordan identity
FAILS on `H_n(𝕆)` — forced because `n ≥ 4` would require `𝕆` ASSOCIATIVE, and `𝕆` is not
(`not_associative`). The cap value `3` is therefore not posited — it is the exact gap between
"alternative" (which `𝕆` has) and "associative" (which it lost at the cascade stop). The three-fold
structure a physicist recognizes (three of something) appears here for the FIRST time, as a PROVED
algebraic cap, not a named coincidence.
**What "done" requires.** Lean theorems over the banked terminal algebra (`O ℚ` witnesses; no new
carrier posited): the Hermitian matrix carrier and the symmetrized product built from the banked `CD`
product + `star`; a theorem that `H_3(O ℚ)` satisfies the Jordan identity (deriving it from
alternativity / `scaling_law`, NOT asserting it); and a theorem that `H_4(O ℚ)` does NOT (a concrete
Jordan-identity-violating witness whose defect is traced to a non-vanishing associator, i.e. to
`not_associative`). The "one cause" connection (alternativity-not-associativity is the single fact
behind both the cascade stop and the n=3 cap) must be a PROVED link in Lean (e.g. the `n ≥ 4`
obstruction reduces to the same non-associativity witness), never an asserted comment. Foundations-
only, costume that a WRONG cap (e.g. the Jordan identity asserted to hold on `H_4`, or claiming `𝕆`
associative to force a higher cap) FAILS to compile, gate green, STANDARD met.
**Dependency.** N4 (the generated operator algebra + module — the `n = 2` case is essentially the
operator/Clifford/module structure already built) + banked `not_associative` + `scaling_law`
(alternativity) + banked `CD`/`star`. PURELY ALGEBRAIC — stays over the cascade ground ring `ℚ`;
should NOT need the continuum (the cap is a COUNT, not an analytic object).
**Drift trap.** Derive the cap FORWARD: the n=3 Jordan-ness from alternativity, the n≥4 failure from
non-associativity — never POSIT the cap value `3`, never import a Mathlib `JordanAlgebra`/exceptional-
algebra structure and ASSERT `H_3(𝕆)` IS the Albert algebra (the SAME posit-vs-derive drift trap N3/N4
avoided). If Mathlib lacks the Hermitian-matrix-over-a-non-associative-algebra carrier or the Jordan
identity machinery, BUILD it (W1: Mathlib absence is not a wall) — note `O ℚ` has NO `Ring` instance,
so Mathlib's `Matrix` ring API does not apply directly; the Hermitian carrier + symmetrized product
must be built at the non-associative level. Do NOT reach for `ℝ`: the cap is purely algebraic.
**★ If the honest derivation forces a Lie GROUP / a completion / a real-spectral / eigenvalue
argument (e.g. you find yourself wanting `H_3(𝕆)`'s automorphism GROUP `F₄`, or real eigenvalues),
STOP and resolve the ⚠ STANDING DEPENDENCY GATE first — never silently `import Mathlib...Real`.**
(The cap itself is a polynomial-identity fact and should NOT need the continuum; the gate bites only
if you drift toward the automorphism GROUP, which is a later node.)
**THE ONE LAW (W5).** If the Jordan identity on `H_3` fights you, return to the trunk: the identity
holds *because* `𝕆` is alternative — `scaling_law` is the left-alternative law, banked and hypothesis-
free. If the `n ≥ 4` failure fights you, return to the trunk: it fails *because* `𝕆` is non-
associative — `not_associative` is banked. Do NOT add a hypothesis; do NOT weaken to `H_2`. If a hard
sub-lemma still fights after the theory-native reframe → DECOMPOSE (W3): bank the cap direction that
compiles foundations-only + a costume that bites, child the remainder onto the chain tail, complete
as "decomposed."
**Physics-words-removable.** Delete "generation", "Jordan-as-physics", any physical name: the
theorems are pure statements that the symmetrized product on the Hermitian elements of the terminal
algebra satisfies the Jordan identity exactly when the matrix order is ≤ 3, the cap being forced by
the algebra's alternativity-without-associativity. No physics name may be load-bearing.

## N6 — THE DERIVATION ALGEBRA OF THE TERMINAL ALGEBRA: the gauge-structure seed  (Emergent, depth 3)
**Target.** Derive the FIRST physics-recognized structure that emerges now the algebra layer (N3–N5)
and the full number tower (N7–N14, ⚠ gate RESOLVED) are banked: the **infinitesimal automorphisms —
the derivations — of the terminal algebra `𝕆`** form a Lie algebra. This is the algebraic seed of the
gauge symmetry physics recognizes (the literature — Furey, Dixon, Günaydin–Gürsey — *reads gauge groups
off* the automorphism structure of `𝕆`; we DERIVE the structure forward from the cascade instead of
positing it — the posit-vs-derive moat). A derivation is a linear `D : 𝕆 → 𝕆` satisfying the Leibniz
law `D(x·y) = D(x)·y + x·D(y)` over the banked `CD` product. Prove: (i) the commutator `[D,E] = D∘E −
E∘D` of two derivations is again a derivation (closure — uses only Leibniz, NOT associativity of `𝕆`,
so it is exactly the kind of structure `𝕆`'s non-associativity still permits); (ii) `Der(𝕆)` is a Lie
algebra (bilinear, alternating, Jacobi); (iii) NON-VACUITY: a concrete NONZERO derivation exists on
`O ℚ`, so the structure is non-trivial (not the zero algebra). The deeper characterization (its
dimension / that it is `g₂`) and the Lie GROUP of automorphisms (which exponentiates over the now-derived
continuum) are downstream children, NOT this node.
**What "done" requires.** Lean theorems over the banked terminal algebra (`O ℚ` witnesses; no new
carrier posited): the Leibniz-derivation predicate built from the banked `CD` product, the
commutator-closure theorem, the Lie-algebra structure, and a concrete nonzero derivation witness.
Foundations-only, costume that a WRONG claim (e.g. a non-derivation asserted to satisfy Leibniz, or the
commutator of two derivations asserted NOT to be one) FAILS to compile, gate green, STANDARD met.
**Dependency.** N5 (the banked algebra layer) + banked `CD` product/`star` + `not_associative`. PURELY
ALGEBRAIC over the cascade ground ring `ℚ`; the continuum becomes load-bearing only at the Lie GROUP /
exponentiation node downstream (now unblocked, since the ⚠ gate is RESOLVED).
**Drift trap.** Derive FORWARD from the banked `CD` product + the Leibniz law. Do NOT import Mathlib's
`Derivation` / `LieAlgebra` / `G₂` machinery and ASSERT that `𝕆`'s derivations ARE `g₂` / a Lie algebra
(the SAME posit-vs-derive drift trap N3/N4/N5 avoided) — build the predicate and prove the bracket
closes yourself (W1: Mathlib absence is not a wall; note `O ℚ` has NO `Ring` instance, so generic
derivation API may not apply). Do NOT posit the bracket as a structure; PROVE the commutator of two
derivations satisfies Leibniz. Do NOT claim the dimension or that it is `g₂` (downstream child). Do NOT
reach for `ℝ` — the derivation algebra is purely algebraic; if it fights you toward the continuum, that
is the GROUP node, not this one.
**THE ONE LAW (W5).** If the bracket-closure fights you, return to the trunk: the commutator of two
Leibniz-derivations is a derivation *because* the Leibniz law is bilinear in the product — no
associativity needed, which is exactly why this structure survives on the non-associative `𝕆`. Do NOT
add a hypothesis; do NOT weaken to an associative base. If a sub-lemma still fights after the
theory-native reframe → DECOMPOSE (W3): bank the closure + a costume that bites, child the remainder
onto the chain tail, complete as "decomposed."
**Physics-words-removable.** Delete "gauge", "symmetry", "automorphism-as-physics": the theorems are a
pure statement that the Leibniz-derivations of the terminal algebra form a Lie algebra under the
commutator bracket, non-trivially. No physics name may be load-bearing.

## N7-physics onward — TO BE SPECIFIED AFTER N6 LANDS
The downstream nodes (the deeper gauge content — the automorphism Lie GROUP and its dimension/`g₂`/`F₄`
characterization, which exponentiate over the now-derived continuum; mixing; spacetime signature) will
be specified as targets ONLY after N6 lands — the next target is specified against what the chain
actually produced, never against what we guessed it would.

**Why we stop the spec here:** a roadmap that dictates the full derivation in advance is a
hardcoded solution. The agent earns each node, and the next target is specified against what
the chain actually produced — not against what we guessed it would. The fold is the start of
all physics; we let it unfold and specify the next target from the ground it actually creates.
