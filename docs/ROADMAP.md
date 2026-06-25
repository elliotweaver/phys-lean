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
**✅ LANDED** (`Phys/Algebra/Derivation.lean`, namespace `Phys.Algebra`). `IsDeriv` (the Leibniz-derivation
predicate over the banked `CD` product) + `isDeriv_bracket` (★★ the commutator closure — uses ONLY Leibniz
+ biadditivity + distributivity, NEVER associativity, the trunk reframe vindicated) + `derivation`
(`Der(𝕆)` as a `LieSubalgebra ℤ (Module.End ℤ 𝕆)`, with `deriv_lie_add_left`/`deriv_lie_add_right`/
`deriv_lie_self`/`deriv_lie_jacobi` exposing BILINEAR/ALTERNATING/JACOBI) + the concrete NONZERO
`witnessDeriv = innerDeriv e₂` on `O ℚ` (`derivation_nontrivial`/`derivation_ne_bot`, nonzero
theory-natively via `iota_e2_comm_iff` + `J_ne_star_J`). The moat held: NO Mathlib `Derivation`/`G₂`
import; Lie MACHINERY only on the DERIVED endomorphism ring. 30 decls foundations-only; costume C34 bites;
gate D0–D6 green. See the LEDGER N6 row. The deeper characterization (dimension / that it is `g₂`) and the
automorphism Lie GROUP are downstream children (see below), NOT this node.

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

## N15 — MAKE "RESOLVED" LITERAL: purge the last vestigial Mathlib number-content imports  (Foundation hygiene)  ✅ LANDED (commits f984224 STEP A + 9587bf2 STEP B)
**LANDED.** ZERO `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` anywhere in `Phys/` (grep returns nothing
tree-wide) — the ⚠ NUMBER-TOWER/CONTINUUM gate is now LITERALLY, not merely substantively, resolved.
STEP A (subtractive, safe): retired the two superseded imported-ℚ continuum files `Continuum.lean` +
`CompletionContinuum.lean` (the N6-pre obstruction+resolution halves over imported ℚ — re-grounded over the
derived ℚ at N10 `ContinuumDerived.lean`, verified each theorem has a derived analogue before deletion);
dropped from `Phys.lean` + `AxiomAudit.lean`; retired costume C23 (role taken by derived-ℚ C28), re-pointed
costume C24 to the derived `ContinuumQ.sqrt2` (still bites). STEP B (N1 root): purged `Mathlib.Data.Int.Basic`
from `Fold.lean`; the tightness witness `fold_int_nonzero_not_fixed` (over imported ℤ) re-expressed as
`fold_nonzero_not_fixed` over `ZMod 3` — MACHINERY, 2-torsion-free (so `fold_self_blind` genuinely applies),
no content number system. THE ONE LAW: importing the derived ℤ would CYCLE (`Fold → Counting → IntegerTower`),
so the generic/machinery reframe for a tightness witness was the forced route. Full-tree rebuild from the N1
root (3332 jobs, legitimate cascade); gate D0–D6 green, 33/33 costumes, 392 theorems foundations-only. The
deliverable: the chain's number ground is now literally fold-derived — a reviewer finds ZERO Mathlib number-
content imports in `Phys/`. (Historical spec below, retained for the record.)

**Target (as specified).** The ⚠ NUMBER-TOWER/CONTINUUM gate is *substantively* RESOLVED — the load-bearing spine
(cascade → algebras → Jordan cap → derived continuum → the N6 derivation Lie algebra) is number-import-free.
But a whole-tree scan still finds THREE vestigial `Mathlib.Data.{Int,Rat}` imports that must be retired so a
reviewer finds ZERO `Mathlib.Data.{Nat,Int,Rat,Real,Complex}` anywhere in `Phys/` — making "RESOLVED"
LITERAL, not merely substantive. This is the LEDGER's flagged "★ NEXT OBLIGATION — small, do it before it
grows," now overdue (N6 just accreted the first Emergent-layer physics on top of the stragglers). It is a
MECHANICAL cleanup node — **no new derivation** — but it touches the foundation file `Fold.lean` (N1) and
forces a full-tree rebuild, so it earns its own node (do NOT bolt it onto a physics bank).
**The three stragglers (verified present at N6 bank):**
  1. **`Phys/Foundation/Continuum.lean`** (`import Mathlib.Data.Rat.Defs` + `Mathlib.Data.Rat.Lemmas`) —
     the ORIGINAL N6-pre obstruction half over *imported* ℚ, SUPERSEDED by `ContinuumDerived.lean` (the
     re-grounded version over the derived ℚ `Q`). Still aggregated in `Phys.lean` (line ~37) though nothing
     load-bearing builds on it. RETIRE it: drop it (and `CompletionContinuum.lean` if it too is the
     superseded imported-ℚ version — VERIFY via dependency grep first) from `Phys.lean`, delete the file(s),
     confirm the tree still builds + gate green. ⚠ Before deleting, grep for any downstream importer
     (`search_files "import Phys.Foundation.Continuum"`) — if anything outside the superseded pair imports
     it, re-point to `ContinuumDerived` first.
  2. **`Phys/Foundation/Fold.lean`** (`import Mathlib.Data.Int.Basic`) — used ONLY by the tightness witness
     `fold_int_nonzero_not_fixed` (over ℤ a nonzero state is moved by the look-back — a NEGATIVE/tightness
     witness, not the load-bearing spine, like N1's char-2 carrier or N2's `ZMod 5`). Re-express that witness
     over the DERIVED ℤ (`Phys.Foundation.Z`, banked N8) or a generic 2-torsion-free ordered group, so NO
     `Mathlib.Data.Int` import remains in the foundational file. THE ONE LAW check: if the derived-ℤ
     re-expression fights, the witness is a TIGHTNESS witness (machinery), so a generic-ordered-group framing
     is the reframe — do NOT keep the imported ℤ "because it's just a witness" (that is the exact
     rationalization the moat forbids; a witness in N1 the foundation file is the most visible straggler).
**What "done" requires.** ZERO `Mathlib.Data.{Nat,Int,Rat,Real,Complex}` imports tree-wide in `Phys/`
(grep returns nothing), the tree builds, gate D0–D6 green, the deleted-file's costume (if any) re-pointed or
retired, LEDGER updated (move the "★ NEXT OBLIGATION" out of OWED, mark the gate row literally resolved).
**Dependency.** None new — purely subtractive + one witness re-expression over banked N8 `Z`.
**W9 note.** Deleting `Continuum.lean` + editing `Fold.lean` (N1, near the root) forces a FULL-TREE recompile
(~3 min cold, legitimate — like the N14 N2-edit cascade). PREREG a KILL budget; the witness re-expression
itself is light (a single `∃`-witness lemma over the derived ℤ). Do NOT inflate maxHeartbeats; if the
re-expression is heavy, that is a framing signal (reframe through a generic ordered group).
**Physics-words-removable.** Trivially — this node removes content, proves nothing physical; the only
deliverable is that the chain's ground is literally, not just substantively, fold-derived.

## N16 — TOWARD THE DIMENSION / g₂ CHARACTERIZATION of Der(O ℚ)  (Emergent, depth 3)  ✅ STRUCTURAL CORE BANKED + DECOMPOSED (W3)
**LANDED (structural core).** `Phys/Algebra/DerivationDim.lean` (ns `Phys.Algebra`). The theory-native
STRUCTURAL CORE of the deeper claim N6 deferred, derived FORWARD from the banked `IsDeriv` predicate,
NO posited `G₂` import (the posit-vs-derive moat held): ★ `deriv_one` — every Leibniz-derivation of the
terminal algebra kills the unit (`D 1 = 0`; pure Leibniz + the unit law, `D 1 = D(1·1) = D1 + D1` ⟹
`D 1 = 0`; no associativity, no coordinates) — the FIRST structural reduction cutting `Der(𝕆)` toward
`g₂` (a derivation is determined by its restriction to the imaginary subspace); ★ `witnessDeriv_one` —
the banked NONZERO witness (N6) kills the unit (anti-vacuity: a genuinely nonzero map annihilating `1`).
Costume C35 (`DerivationUnitCostume`: the nonzero `witnessDeriv` asserted to PRESERVE the unit → false
core `0 = 1`) bites. Foundations-only `[propext, Quot.sound]` / `[propext, Classical.choice, Quot.sound]`.

**Confirmed by faithful exact-rational numerics (workbench/N16-g2-dimension, re-runnable):** the model
builds `O ℚ = CD(CD(Dbl ℚ))` from the EXACT banked CD product + star (byte-for-byte the Lean formula),
reproduces the standard octonion table, and computes the FULL Leibniz linear system (512 eqns, 64
unknowns) by EXACT Gaussian elimination: **rank = 50, nullity = 14 ⟹ dim_ℚ Der(O ℚ) = 14** (= dim g₂).
Every derivation: kills the unit, is skew for the Born form (`M = −Mᵀ` ⟹ `Der ⊆ so(7)`), preserves the
imaginary subspace, commutes with conjugation; an explicit 14-element integer basis exists (saved
`nullbasis.pkl`).

**WHY DECOMPOSED (W3 — explicitly permitted by the ticket).** The EXACT `dim = 14` count is a 512×64 ℚ-rank
over fully-expanded octonion coordinates — the monolithic-brute-on-coordinates signature **W9 forbids**.
Moreover `O ℚ` carries only a ℤ-module structure (`narCD` ⟹ `NonAssocRing`; `Module ℚ (O ℚ)` does NOT
synthesize — measured), so the dimension framing first needs `Module ℚ (O ℚ)` built, and the so(7)/`g₂`
skew reduction needs ℚ-linearity of `D` (to kill the trace ℚ-scalar). These are genuine prerequisite
infrastructure + the W9-prime rank, correctly scoped to a dedicated dissolution child, NOT bypassed.
The child starts from: dim=14 confirmed, the explicit basis, the so(7) reduction, and the structural
lemmas banked here. **The full `dim = 14` and the `≅ g₂` Lie-isomorphism are CHILDED (N17), never asserted.**

## N17 — Module ℚ (O ℚ) + THE COORDINATE-FREE SKEW REDUCTION Der(O ℚ) ⊆ so(Born) = so(7)  (Emergent, depth 3)  ✅ STRUCTURAL REDUCTION BANKED + DECOMPOSED (W3)
**LANDED (the forward structural reduction — the route's HEART).** `Phys/Algebra/DerivationSkew.lean`
(ns `Phys.Algebra`, commit 06171e4). The prerequisite infra + the so(7) containment N16 W3-scoped, all
derived FORWARD from the banked `IsDeriv` predicate, foundations-only ⊆ {propext, Classical.choice,
Quot.sound}, NO posited `G₂`/`LieAlgebra.g2` import (the posit-vs-derive moat held):
  • ★ `instModuleQO` / `instModuleQH` / `cdModuleQ` / `dblModuleQ` — `Module ℚ (O ℚ)` (the terminal
    algebra as an 8-dim ℚ-vector space), built componentwise (machinery on the DERIVED object, STANDARD
    §3 — like `Matrix`/`Module` at N3/N4, NOT a posited number system). The measured-missing infra is DONE.
  • `deriv_qsmul` — every ℤ-linear derivation is automatically ℚ-linear (`map_rat_smul`).
  • `trace_id` — `x + star x = (2 reQ x) • 1` (the real part lands on the unit line).
  • `deriv_star` — `D (star x) = -D x` (a derivation reflects conjugation).
  • `deriv_real_zero` — a derivation KILLS every self-conjugate (real) element (2-torsion-freeness of the
    derived ℚ made load-bearing — the same self-blindness `2 ≠ 0` the trunk rests on).
  • `selfMul_selfconj` — the Born self-overlap `x · star x` is self-conjugate.
  • ★★ `deriv_norm_preserve` — `D x · star x = x · D x` = the SKEW-ADJOINTNESS = the containment
    `Der(O ℚ) ⊆ so(Born) = so(7)` (dim ≤ 21), derived COORDINATE-FREE: THE ONE LAW / TRUNK REFRAME —
    the Born self-overlap is self-conjugate ⟹ a derivation kills it ⟹ Leibniz gives skew. The W9
    monolithic 8-coordinate / 512×64 rank ENTIRELY AVOIDED. This is the bankable HEART of the count.
  • `deriv_skew_polar` — the polarized bilinear skew form.
  • `witnessDeriv_skew` — non-vacuous on the banked NONZERO witness (W8).
Costume C36 (`DerivationSelfOverlapCostume`: the nonzero `witnessDeriv` asserted to kill the self-overlap
to `1` → false core `0 = 1`) bites. Gate D0–D6 green (35/35 costumes, 403 theorems foundations-only).

**Numerics RE-VERIFIED independently this node (W6):** `deriv_dim.py` → rank 50 / nullity 14 ⟹ dim = 14;
`structural.py` → every basis derivation kills the unit, is skew (M = −Mᵀ), preserves Im, commutes with
star; 14 integer-sparse basis matrices, rank 14, pivot columns [10,11,12,13,14,15,19,20,21,22,23,37,38,39].

**WHY DECOMPOSED (W3 — the frozen PREREG's expected outcome given W9).** The EXACT `dim = 14` (the so(7)→g₂
cut 21→14) is a 512×64 ℚ-rank over fully-expanded octonion coordinates — the monolithic-brute-on-coordinates
signature W9 FORBIDS (workbench/N16-g2-dimension/FINDINGS.md records the Lean brute route as DEAD); and the
`≅ g₂` Lie isomorphism is W1 (Mathlib may lack a usable `g₂` to compare against). Both are CHILDED to N18
(t_c0b5786d, linked on the chain tail), never asserted, never a bridge. The structural reduction — the route
the count descends — is banked forward, which is the bankable core. This is legitimate decomposition (NOT
scope reduction): the exact count is W9-prime and the iso is W1, both explicitly scoped, not bypassed.
**Dependency.** N16 (the structural core + numerics). **Drift trap.** Same posit-vs-derive moat.

## N18 — THE TRACE-FREE / Im-PRESERVING refinement of `Der(O ℚ) ⊆ so(Born)`  (Emergent, depth 3)  ✅ LANDED (the qualitative so(7) picture COMPLETE; exact dim=14 + ≅g₂ childed N19)
**What landed (commit 2681c45, `Phys/Algebra/DerivationTraceFree.lean`).** The QUALITATIVE so(7)
characterization of `Der(O ℚ)` is now COMPLETE in Lean — all FOUR structural constraints the
exact-rational numerics record for every derivation, each derived COORDINATE-FREE (the W9 512×64
monolith ENTIRELY AVOIDED): (1) `D 1 = 0` (N16), (2) skew `D x·star x = x·D x` ⟹ `Der ⊆ so(7)`
(N17), ★ (3) TRACE-FREE `reQ (D x) = 0` / `star (D x) = −D x` (`deriv_reQ_zero`/`deriv_maps_im`:
`D` maps `O` into the 7-dim imaginary subspace), ★ (4) commutes with conjugation
(`deriv_comm_star`). THE TRUNK REFRAME (THE ONE LAW): for imaginary x, skew gives the Jordan/Born
anticommutation `{Dx,x}=0` (`deriv_jordan_anticomm`); conjugate + sum + the trace identity (the
symmetric part lands central) collapse to `(4 reQ Dx)•x = 0`; x imaginary nonzero + the derived ℚ
a field ⟹ reQ Dx = 0; general x → its imaginary part (real part killed by `deriv_one`). NO
coordinates, NO posited `G₂`. Non-vacuous on the banked nonzero witness
(`witnessDeriv_reQ_zero`/`_maps_im`/`_comm_star`). 10 theorems + corollaries foundations-only;
costume C37 (`DerivationTraceFreeCostume`) bites `⊢ 0 = 1`; gate D0–D6 green (36/36 costumes, 413
theorems audited). STANDARD applied: unbroken / complete / physics-words-removable.
**Why this is forward progress, NOT a re-child.** N16 banked `D 1 = 0`; N17 banked the skew
reduction; both childed the exact count. N18 banks the two genuinely-NEW qualitative constraints
(trace-free + conj-commute) that COMPLETE the so(7) picture — a new theorem family, not a
restatement. The exact `dim = 14` is childed with a SHARPER target (the finrank scaffold is now
the named first sub-node), never asserted, never a bridge.

## N19 — THE FINITE-DIMENSIONALITY SCAFFOLD on `O ℚ` + the LOWER BOUND `dim_ℚ Der(O ℚ) ≥ 14`  (Emergent, depth 3)  ✅ LANDED (scaffold + lower bound; the upper bound ≤14 + ≅g₂ childed N20)
**What landed — PART 1, the scaffold (commit 0aab339, `Phys/Algebra/DerivationFinrank.lean`).** The PREREQUISITE
finite-dimensionality scaffold the exact count needs — N18 FINDINGS flagged it as "the real
first blocker, a node of its own." Derived FORWARD, foundations-only ⊆ {propext, Classical.choice,
Quot.sound}, NO posited `G₂`/`LieAlgebra.g2`: ★ the STRUCTURAL product equivalences
`cdProdEquiv : CD A ≃ₗ[ℚ] A × A` / `dblProdEquiv : Dbl ℚ ≃ₗ[ℚ] ℚ × ℚ` (the W9.4 structure-over-
expansion route); `Module.Finite ℚ` for `Dbl/H/O ℚ`; ★★ `finrank_O_eq_eight` (`finrank ℚ (O ℚ) = 8`
via `2 → 4 → 8` through the equivs — NO 8×8 coordinate basis matrix, the W9 expansion AVOIDED as
N17/N18 avoided the 512×64 kernel); `finrank_End_eq_64`; the ℚ-scalar/product compatibility
`qsmul_mul_left/right`; ★ `derivationQ : Submodule ℚ (Module.End ℚ (O ℚ))` (so `Module.finrank ℚ
derivationQ` is a WELL-TYPED ℕ); the ℤ→ℚ correspondence `toEndQ`/`toEndQ_isDerivQ` (N6's `Der`
lifts in via `map_rat_smul`); the banked NONZERO witness as a ℚ-derivation `witnessDerivQ` (anti-
vacuity, W8); ★ `derivationQ_ne_bot` + ★★ `finrank_derivationQ_pos` (`0 < dim`) + `finrank_derivationQ_le`
(`dim ≤ 64`) ⟹ the WELL-TYPED bounds `1 ≤ dim_ℚ Der(O ℚ) ≤ 64`.
**What landed — PART 2, the lower bound (run 121, `Phys/Algebra/DerivationLowerBound.lean`).**
★★ `finrank_derivationQ_ge_14` (`14 ≤ Module.finrank ℚ derivationQ`) — the well-typed lower frame
sharpened from `1` to the EXACT `≥ 14` by EXHIBITING 14 explicit linearly-independent derivations.
The 14 `DkE : Module.End ℚ (O ℚ)` are the explicit integer-sparse nullbasis of the Leibniz ℚ-system
(workbench/N16-g2-dimension/nullbasis.pkl, re-verified exact-rational this run: all 14 are genuine
derivations of the EXACT octonion product, rank 14), each built componentwise on the DERIVED `O ℚ`
(machinery, STANDARD §3) and PROVED to satisfy the Leibniz law (`DkE_isDerivQ`, ≈8s each). ★ THE
INDEPENDENCE IS DIAGONAL (the W1/W9.4 reframe that dissolves a 14×14 determinant): each `DkE` has a
coordinate where it is the UNIQUE nonzero among the 14, so the read-off functionals `φₖ(D) :=
(D eᵢₖ).coord_aₖ` form a NEGATED identity (`φₖ(Dⱼ) = -δₖⱼ`) ⟹ `Dvec_linearIndependent` with no
determinant. Their span sits in `derivationQ` (`Dvec_mem`), so `Submodule.finrank_mono` gives the
bound. Costume C39 (`DerivationLowerBoundWrongCountCostume`: `finrank ≤ 13` collides with the
banked `≥ 14` → omega refutes) bites. Gate D0–D6 green (38/38 costumes, 438 theorems audited),
default maxHeartbeats (NEVER inflated); the full 14-derivation file elaborates in ≈21s, well under
the frozen 90s/obligation KILL budget.
**Why this is forward progress, NOT a re-child.** N18 completed the qualitative so(7)
characterization but `Module.finrank ℚ Der(O ℚ)` was not even a well-typed statement (no
finite-dimensionality on `O ℚ`). N19 banks exactly that infra AND the EXACT lower bound `≥ 14` (the
14 explicit derivations, the literature's actual content for the dimension count, here CONSTRUCTED
and PROVED rather than read off a posited `g₂`). The matching upper bound `≤ 14` (the so(7)→g₂ cut
21→14, the rep-theoretic W9-prime half) + the `≅ g₂` structure are childed (N20), never asserted,
never a bridge.
**W9.2 measurement that de-risked the lower bound (workbench/N19-g2-exact/FINDINGS.md):** the full
lower-bound architecture (3-derivation probe: LinearMap construction + IsDerivQ + the diagonal-
functional `LinearIndependent` idiom) elaborated clean in ≈8s BEFORE committing to all 14 — the
independence idiom (the previously-unmeasured risk) works; the per-matrix IsDerivQ checks are NOT a
W9 wall. The N6 `innerDeriv` family gives only 3 (Der(H)=so(3)); the other 11 are genuinely
octonionic outer derivations (the explicit matrices).

## N20 — THE UPPER BOUND `dim_ℚ Der(O ℚ) ≤ 14` (the so(7)→g₂ cut 21→14) ⟹ THE EXACT `= 14`  (Emergent, depth 3)  ✅ LANDED (run 123)
**What landed (`Phys/Algebra/DerivationUpperBound.lean`, commits 58b9cc5 + 90de722).** ★★★ THE
EXACT DIMENSION IS CLOSED: `finrank_derivationQ_eq_14` (`Module.finrank ℚ derivationQ = 14`),
the `dim g₂` value DERIVED end-to-end from the fold's cascade — NO posited `G₂`/`LieAlgebra.g2`
(the SAME posit-vs-derive moat N3/N4/N5/N6/N16/N17/N18/N19 held). ★ THE UPPER BOUND
`finrank_derivationQ_le_14` is the so(7)→g₂ cut 21→14, DISSOLVED from the trunk: `O ℚ` is
multiplicatively GENERATED by e1,e2,e4 (e3=e1·e2, e5=e1·e4, e6=e2·e4, e7=e3·e4) so a derivation
is COMPLETELY DETERMINED by `D e1, D e2, D e4` (`determined`) ⟹ `Der ↪ (O ℚ)³`; each `D ei`
trace-free (banked N18, here `derivQ_reQ_zero`) ⟹ naive 3×7=21; the Leibniz law on the
generator PRODUCTS imposes EXACTLY 7 structural c0-coordinate cut constraints (`cut_e1_c1`/
`cut_e2_c2`/`cut_e4_c4` diagonal skew, `cut_e12_c0`/`cut_e14_c0`/`cut_e24_c0` off-diagonal skew,
★ `cut_e34_c0` the ONE octonionic step e3·e4=e7 — the non-associativity `associator(e1,e2,e4)=
2e7≠0` that STOPPED the cascade, entering through `D e3=0` from `D e1=D e2=0`) cutting 21→14. The
14 pivot coords assemble into the injective `coordMap`/`coordMapR : derivationQ →ₗ[ℚ] (Fin 14 →
ℚ)` (`coordMapR_injective` via the cascade `gens_zero` + `determined`), so
`LinearMap.finrank_le_finrank_of_injective` + `finrank ℚ (Fin 14 → ℚ)=14` gives `≤ 14`;
`le_antisymm` against the banked N19 `finrank_derivationQ_ge_14` CLOSES `= 14`.
**W9 discipline held.** No brute 512×64 kernel, no inflated maxHeartbeats — the cut is STRUCTURAL
(7 bounded c0-coordinate constraint lemmas ~6–7s each + a bounded determination cascade), each
banked-as-you-go (W9.8). Run-122 inherited an INCOMPLETE production file (timed out mid-write, no
olean); the W6 fix was a one-line simp-set repair (3 diagonal lemmas missing `CD.zero_re` left
`(re 0).re.re` unreduced so `linarith` failed), then the missing assembly written fresh and
banked. Foundations-only ⊆ {propext, Classical.choice, Quot.sound} (all 11 new decls, AxiomAudit
registered). Costume C40 (`DerivationUpperBoundWrongCountCostume`: `finrank = 15` collides with
`≤ 14` ⟹ `15 ≤ 14`, omega refutes) bites. Physics-words-removable: delete gauge/g₂/automorphism
⟹ the pure statement that the Leibniz-derivation ℚ-submodule of the Cayley–Dickson double of a
double of a double of ℚ has dimension exactly 14.
**What is childed to N21 (never asserted here, never a bridge).** The `g₂` STRUCTURE: the explicit
14-element derivation basis + the Lie-bracket structure constants (from N6 `isDeriv_bracket`, the
commutator of two derivations is a derivation) + the `≅ g₂` Lie isomorphism, derived FORWARD.

## N21 — THE g₂ STRUCTURE of Der(O ℚ): explicit basis + Lie-bracket structure constants + ≅ g₂  (Emergent, depth 3)  ✅ LANDED (a + b; the ≅ g₂ Lie-isomorphism childed N22)
**What landed (commits 32f418f + 05c4345; finalize-verified this run after the run-125 mid-finalization
timeout).** The g₂ LIE STRUCTURE of `Der(O ℚ)` is now EXHIBITED as an explicit 14-dimensional Lie
algebra with a fully proved bracket table, derived FORWARD, NO posited `G₂`/`LieAlgebra.g2` (the moat
held). PART 1 `Phys/Algebra/DerivationBracket.lean`: ★ `isDerivQ_bracket` (the ℚ-analog of N6 — the
commutator of two ℚ-linear derivations is a derivation, distributivity + Leibniz ALONE, no
associativity); ★ `derivationLieQ : LieSubalgebra ℚ (Module.End ℚ (O ℚ))` carved by `IsDerivQ` (carrier
= `derivationQ`), inheriting LieRing+LieAlgebra (bilinear/alternating/Jacobi); ★★ `derivBasis :
Module.Basis (Fin 14) ℚ derivationQ` — the 14 `D0E..D13E` form a BASIS (independence lifted into the
submodule via `Dsub_indep`, spanning via the banked `finrank_derivationQ_eq_14`,
`basisOfLinearIndependentOfCardEqFinrank`). PART 2 `Phys/Algebra/DerivationStructureConstants.lean`:
★★ ALL 91 distinct pairs `⁅DiE,DjE⁆ = Σ cᵏᵢⱼ DkE` proved FORWARD (`br_0_1 … br_12_13`, each by
`ext`+`simp`+`ring` on the derived CD product, bounded per entry — NO monolithic table-bash); integer
constants in {−2,−1,1,2}, 84/91 nonzero; the two-term octonionic entries (e.g. `br_4_7 = 2 D0E + 2 D3E`)
are the associator contribution of the SAME non-associativity that stopped the cascade. Costume C41
(a WRONG structure constant `⁅D0E,D1E⁆ = D2E` vs the proved `−2 • D2E`) bites. 7 key theorems
independently axiom-audited ⊆ {propext, Classical.choice, Quot.sound}; gate D0–D6 green (40/40 costumes,
453 theorems). The `≅ g₂` Lie-isomorphism is childed N22 (W1 — Mathlib's exceptional-Lie support is thin,
BUILD the comparison object, never posit it to "match"; the basis + bracket table is the legitimate
bankable forward increment). (Historical target spec below.)

**Target.** On the banked exact dimension `finrank_derivationQ_eq_14` + the 14 explicit
derivations `D0E..D13E` (N19) + the bracket source `isDeriv_bracket` (N6, the commutator of two
derivations is a derivation), derive the `g₂` LIE STRUCTURE FORWARD: (a) the 14 `DkE` form a
BASIS of `derivationQ` (independent — N19 `Dvec_linearIndependent` — + spanning, now that
`dim = 14` is banked, via `finrank` + `LinearIndependent.span_eq_top_of_card_eq_finrank` or the
basis-from-independent-and-card route); (b) the Lie-bracket structure constants `[DiE, DjE] =
Σ cᵏᵢⱼ DkE` computed explicitly (each `[DiE,DjE]` is a derivation by `isDeriv_bracket`, hence a
ℚ-combination of the basis — read off the `cᵏᵢⱼ` by the same diagonal-functional route N19 used);
(c) the `≅ g₂` Lie isomorphism — the 14-dim Lie algebra with this proved bracket table IS `g₂`.
**W1 (if Mathlib lacks a usable `g₂`).** Per W1 NOT a wall: do NOT posit/import a `G₂` to "match."
The 14-dim Lie algebra with its proved bracket table IS the bankable object; "this 14-dim Lie
algebra IS g₂" asserted without the structure-constant proof is a D3 bridge. Reframe through the
trunk FIRST; if the full `≅ g₂` Lie-isomorphism resists (Mathlib may lack a usable exceptional-Lie
`g₂` to compare against — then BUILD the comparison object, W1), child the isomorphism and bank the
explicit basis + bracket table as the forward increment.
**W9.** The bracket computation is `[DiE,DjE] x = DiE(DjE x) − DjE(DiE x)`, a composition of the
explicit sparse coordinate maps — bounded per entry; bank each structure-constant family
separately (W9.3/W9.8). Do NOT attempt the whole 14×14 bracket table in one monolithic tactic.
**Dependency.** N20 (`finrank_derivationQ_eq_14` + `derivationQ`) + N19 (`D0E..D13E`,
`Dvec_linearIndependent`) + N6 (`isDeriv_bracket`). **Drift trap.** Same posit-vs-derive moat; the
bracket table must be PROVED from the explicit derivations, the `≅ g₂` never cited at grade or read
off a posited `G₂`.

## N22 — THE ≅ g₂ LIE ISOMORPHISM: the 14-dim Lie algebra `derivationLieQ` with its proved bracket table IS g₂  (Emergent, depth 3)  ✅ LANDED (the FAITHFUL 7-dim g₂ fundamental rep banked; the compact-form perfectness banked N23; Killing-definiteness + simplicity childed N24)
**What landed (commit b87b6c1, `Phys/Algebra/DerivationRep7.lean`).** The g₂ FUNDAMENTAL
REPRESENTATION of `derivationLieQ` is now exhibited in Lean — the 14-dim derivation Lie algebra
acting FAITHFULLY on the 7-dim imaginary subspace, derived FORWARD, NO posited `G₂`. ★ `ImO :=
ker(starL + 1)` (the imaginary subspace; `starL` = conjugation as a ℚ-linear endomorphism). ★★
`finrank_ImO` (`finrank ℚ ImO = 7`) via rank–nullity: `range(starL+1) = ℚ·1` (the banked N17
trace identity promoted to a range statement) is 1-dim, `finrank (O ℚ) = 8` is banked N19, so the
kernel is `8 − 1 = 7` — NO 7-coordinate basis matrix (the W9 expansion AVOIDED). ★ `derivLieQ_mapsTo`
— every `D ∈ derivationLieQ` maps `ImO` into `ImO` (banked N18 `deriv_maps_im`: a derivation output
is purely imaginary). ★ `imRep : derivationLieQ →ₗ⁅ℚ⁆ Module.End ℚ ImO` — the restriction-to-Im Lie
homomorphism (bracket respected because `ImO` is invariant). ★★ `imRep_injective` — FAITHFUL:
`imRep D = 0 ⟹ D u1 = D u2 = D u4 = 0` (u1,u2,u4 ∈ ImO) `⟹ D = 0` by the banked N20 `determined`.
A 14-dim Lie algebra acting faithfully on a 7-dim space = the G₂ fundamental representation.
Anti-vacuity: `imRep_witness_ne_zero` (the banked NONZERO witness has nonzero image). Costume C42
(`DerivationRep7WrongCostume`: the nonzero witness asserted to act as ZERO under `imRep` ⟹ `rfl`
cannot close `imRep witnessLieQ = 0`) bites. Foundations-only ⊆ {propext, Classical.choice,
Quot.sound} (5 key decls audited); gate D0–D6 green.

**★ THE W1 SURVEY + THE COMPACT-vs-SPLIT FINDING (why NOT a literal `LieEquiv` — THE ONE LAW).**
Mathlib HAS `LieAlgebra.g₂ R := Matrix.ToLieAlgebra R CartanMatrix.G₂` (the Serre-relation quotient
of the free Lie algebra on the G₂ Cartan matrix — a genuinely DERIVED type-G₂ object, NOT a posited
G₂), and `FreeLieAlgebra.lift` to map out of it; but it has NO structure theory (no `finrank = 14`,
no simplicity, no root system). The route-deciding numerics (exact-rational, reusing the BANKED 14
derivations + proved bracket table — W6) compute the Killing form `K(Di,Dj) = tr(adDi·adDj)`:
nondegenerate (rank 14), diagonal all −16, and NEGATIVE-DEFINITE (leading principal minors of −K all
> 0). ⟹ `Der(O ℚ)` is the COMPACT real form of g₂ (the DIVISION/anisotropic octonions), whereas the
Serre `LieAlgebra.g₂ ℚ` is the SPLIT form. Compact ≇ split over ℚ (a definite vs. indefinite Killing
form is an isomorphism invariant), so a literal `LieEquiv ℚ derivationLieQ (LieAlgebra.g₂ ℚ)` is
FALSE. THE ONE LAW (W5): forcing it would fight because the TARGET is wrong, not the theory. Per W1
step 3 / W3 the honest move taken: bank the sharpest TRACTABLE invariant pinning `derivationLieQ` as
type-G₂ (the faithful 7-rep) and child the compact-form completion.

**What is childed to N23 (never asserted here, never a bridge).** The full compact-form pinning: the
Killing-form negative-definiteness / nondegeneracy (the compact signature, a 14×14 rational
definiteness — W9 beast) and the simplicity (no nonzero proper ideal, from the bracket table) that,
with the faithful 7-rep + banked dim = 14 + the bracket table, complete the identification of
`derivationLieQ` as the compact real form of g₂. Then the automorphism Lie GROUP (exponentiating over
the derived continuum). (Historical target spec below.)

**Target.** N21 banked the explicit 14-element `derivBasis` + the FULL 91-pair structure-constant table
of `derivationLieQ`. The remaining claim — "this 14-dim Lie algebra IS `g₂`" — must be PROVED FORWARD as
a Lie-algebra isomorphism, never asserted at grade and never read off a posited `G₂`. Concretely: either
(i) Mathlib has a usable exceptional-Lie `g₂` (e.g. via `LieAlgebra.IsKilling` / a Cartan-matrix /
root-system presentation) and we exhibit an explicit `LieEquiv` from `derivationLieQ` to it, matching the
proved bracket table to its structure constants; OR (ii) per W1 — Mathlib's exceptional-Lie support is
thin and lacks a usable `g₂` — we BUILD the comparison object (the abstract 14-dim simple Lie algebra of
type G₂, e.g. from its Cartan matrix / Chevalley relations or as the derivation algebra of the split
octonions) and prove the `LieEquiv` against it. The deliverable is the proved isomorphism (or, if it
genuinely resists after the trunk reframe, the sharpest invariant that pins `derivationLieQ` as G₂ —
e.g. that it is a 14-dim simple Lie algebra with the G₂ root system / Killing-form signature — with the
remaining gap childed, NEVER a bridge).
**What "done" requires.** A Lean `LieEquiv ℚ derivationLieQ <g₂-object>` (or the built comparison object
+ the equivalence), with the bracket table N21 proved matching the target's structure constants;
foundations-only; a costume that a WRONG isomorphism (mismatched bracket / wrong dimension / non-simple
target) FAILS; gate green; STANDARD met. NO posited `G₂` asserted equal at grade.
**Dependency.** N21 (`derivationLieQ`, `derivBasis`, the `br_*` bracket table) + N20
(`finrank_derivationQ_eq_14`).
**Drift trap.** The SAME posit-vs-derive moat: the isomorphism must be PROVED from the explicit basis +
bracket table, the `≅ g₂` never cited at grade or read off a posited `G₂`. If Mathlib lacks the target,
BUILD it (W1: Mathlib absence is not a wall) — do NOT import a `G₂` and ASSERT the equality. If the full
isomorphism fights you after the trunk reframe → DECOMPOSE (W3): bank the largest proved invariant +
a costume that bites, child the remainder onto the chain tail.
**Physics-words-removable.** Delete "g₂/gauge/exceptional": the theorem is a pure statement that the
14-dim Lie algebra of Leibniz-derivations of the Cayley–Dickson double of a double of a double of ℚ,
under the commutator, is isomorphic to a specific 14-dim simple Lie algebra with the exhibited
structure constants. No physics name may be load-bearing.

## N23 — THE COMPACT-FORM / TYPE-G₂ PINNING, increment 1: PERFECTNESS + NON-SOLVABILITY of `derivationLieQ`  (Emergent, depth 3)  ✅ LANDED (the cleanly-tractable type-G₂ invariant banked; irreducibility / Killing nondegeneracy+definiteness / simplicity childed N24)
**What landed (commit pending, `Phys/Algebra/DerivationPerfect.lean`).** The 14-dim derivation Lie
algebra `derivationLieQ` is now proved PERFECT (`⁅⊤,⊤⁆ = ⊤`, `derivationLieQ_perfect`) and hence
NOT solvable (`derivationLieQ_not_solvable`) and NOT abelian (`derivationLieQ_not_lieAbelian`),
derived FORWARD from the banked 91-pair bracket table (N21), NO posited `G₂`. THE GIFT (a bounded
MEASUREMENT, workbench/N23-g2-compact-form/design_probe.py): every basis derivation is a SINGLE
banked bracket — `D0 = -½⁅D1,D2⁆`, `D1 = ½⁅D0,D2⁆`, …, `D13 = ⁅D3,D8⁆` (all entries of the banked
`br_*` table) — so the whole algebra lies in its own derived ideal. ★ `bL : Fin 14 → derivationLieQ`
(the 14 basis derivations as Lie-algebra elements), `bL_span_top` (they span ⊤, transported from the
banked `derivBasis` along the carrier identity `derivationQ ≃ₗ derivationLieQ`), the 14 generator-
bracket certificates `cert0..cert13` (lifted from the banked `br_*` End-level table via
`LieSubalgebra.coe_bracket`), ★ `bL_mem_derived` (each `bL k ∈ ⁅⊤,⊤⁆` — a smul of a single bracket),
★★ `derivationLieQ_perfect` (`⁅⊤,⊤⁆ = ⊤` — the generators span and each lies in the derived ideal),
★★ `derivationLieQ_not_solvable` (the derived series is CONSTANT ⊤, never ⊥, since ⊤ ≠ ⊥ via the
nonzero basis vector `bL 0`). Perfect ⟹ non-solvable, non-nilpotent, non-abelian — the structural
OPPOSITE of a solvable radical, the cleanly-tractable NECESSARY edge of semisimplicity/simplicity.
Costume C43 (`DerivationPerfectSolvableCostume`: the generator bracket `⁅bL 0, bL 1⁆` asserted to
VANISH — abelian/solvable ⟹ non-perfect — contradicts banked `cert2`/`br_0_1 = -2•bL 2` with
`bL 2 ≠ 0`, left with the false core `bL 2 = 0`) bites. Foundations-only ⊆ {propext, Classical.choice,
Quot.sound} (6 decls audited); gate D0–D6 green. NO `LieAlgebra.g₂`/`G₂` imported to assert anything —
`LieIdeal`/`derivedSeries`/`IsSolvable` are MACHINERY on the DERIVED object (STANDARD §3).

**Why this route (W1/W9, decided by a bounded MEASUREMENT not a guess — PREREG.md).** The route
numerics (exact-rational, reusing the banked 14 derivations + bracket table — W6) settle: (A)
IRREDUCIBILITY of the faithful 7-rep HOLDS (the ρ(D_k) generate the full 49-dim End(ImO) — absolutely
irreducible by Burnside) but formalizing needs a LieRingModule + no-invariant-submodule setup over
the abstract 7-space (multi-run) → CHILD; (B) the KILLING form is NONDEGENERATE and the feared 14×14
det FACTORS into 7 disjoint 2×2 blocks `[[-16,±8],[±8,-16]]` (det 192 each, det K = 192⁷) but
`killingForm = trace(ad∘ad)` must be computed abstractly over the basis — the W9 beast → CHILD; (C)
NEGATIVE-DEFINITENESS each block neg-definite, full W9 → CHILD; (D) SIMPLICITY hard from the bracket
table directly → CHILD. ★ PERFECTNESS is THE GIFT — no 14×14 det, no abstract-7-space rep setup, just
14 per-bracket-cheap certificates + basis-spanning + Mathlib's derived-series API. Banked this node.

**What is childed to N24 (never asserted here, never a bridge).** The full compact-form pinning:
(A) irreducibility of the faithful 7-rep, (B) Killing-form nondegeneracy (semisimplicity by Cartan),
(C) negative-definiteness (the compact signature), (D) simplicity (no nonzero proper ideal) — which,
with the banked perfectness + faithful 7-rep + dim = 14 + bracket table, complete the identification
of `derivationLieQ` as the compact real form of g₂. Then the automorphism Lie GROUP (exponentiating
`Der(𝕆)` over the derived continuum `ContinuumQ.Cut`).

## N24 — THE COMPACT-FORM / TYPE-G₂ PINNING, increment 2: NEGATIVE-DEFINITENESS + NONDEGENERACY of the defining trace form of `derivationLieQ` (the COMPACT SIGNATURE)  (Emergent, depth 3)  ✅ LANDED (the feared 14×14 Killing-determinant W9 beast DISSOLVED through the trunk; semisimplicity / irreducibility / simplicity childed N25)
**What landed (`Phys/Algebra/DerivationCompact.lean`).** The defining trace form of the 14-dim
derivation Lie algebra is now proved NEGATIVE-DEFINITE — hence NONDEGENERATE — the COMPACT SIGNATURE
that is the defining feature of the compact real form of type G₂, derived FORWARD from the banked
Born self-overlap + skew-adjointness (N17/N18) and the bracket table (N21), NO posited `G₂`.
★ THE ONE LAW / W1 TRUNK DISSOLUTION (the headline): the N23 PREREG flagged the Killing-form
definiteness as the hardest W9 beast — a 14×14 nested-rational determinant. It DISSOLVES through the
trunk and is NEVER computed. Every derivation `D` is SKEW-ADJOINT for the positive-definite Born
self-overlap form `g v w := reQ (v · star w)` (`gFormQ_skew`, lifting banked N17 `deriv_skew_polar`
+ N18 `deriv_maps_im` to ℚ). Hence the CHEAP 8-dim DEFINING trace form `B(D,E) := tr_{O ℚ}(D ∘ E)`
(Mathlib `LieModule.traceForm`) satisfies `B(D,D) = − Σ_j g(D bO_j, D bO_j)` (`traceForm_apply_neg`,
over the orthonormal coordinate frame `coordO : O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ)` / `bO`), with the Born form
anisotropic (`gForm_self_eq_zero : g x x = 0 ↔ x = 0`, sum of 8 coordinate squares — the trunk's
Born = self-overlap = POSITIVITY one level up). So ★★ `traceForm_self_nonpos` (`B(D,D) ≤ 0`) and
★★ `traceForm_self_eq_zero` (`B(D,D) = 0 → D = 0`) — NEGATIVE-DEFINITE, NO determinant, the CHEAP
8-dim form (NOT the 14×14 adjoint Killing). ★★ `traceForm_nondegenerate` (the Cartan-criterion input,
direct from negative-definiteness + `traceForm_comm` symmetry). Anti-vacuity (W8): ★ `traceForm_witness_neg`
(`B(witnessLieQ, witnessLieQ) < 0` — the banked NONZERO witness has strictly negative self-form, NOT
in the radical; purely structural, no coordinate value). Costume C44 (`DerivationCompactWrongSignatureCostume`:
the WRONG claim `0 ≤ B(w,w)` — the indefinite/degenerate/non-compact signature — discharged from the
banked strict-negativity leaves the unsatisfiable core, `linarith failed`) bites. Foundations-only
⊆ {propext, Classical.choice, Quot.sound} (6 decls independently audited via `lake env lean`); gate
D0–D6 green (43/43 costumes, 470 theorems). Compile cost LIGHT (~18s file, NOT a W9 fossil — bounded
probes measured every piece ≤12s, default maxHeartbeats never inflated). `LieModule.traceForm` is
MACHINERY on the DERIVED object (STANDARD §3); NO `LieAlgebra.g₂`/`G₂` imported to assert anything.

**Why semisimplicity is NOT banked here (childed N25, W1 — NOT scope reduction, NOT a bridge).**
`LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate` needs, beyond the three banked inputs
(nondegenerate + `lieInvariant` (FREE) + reflexive (FREE)), the clause "no abelian atoms" — which is
NOT free from nondegeneracy of the DEFINING (module) trace form. For the ADJOINT (Killing) form an
abelian ideal lies in the radical (Dieudonné); but here `B(D,D) < 0` for every `D ≠ 0` (negative-
DEFINITE), so a nonzero abelian ideal is NEVER in the radical of `B` — that route is FALSE. The clean
route (skew-adjoint-for-a-definite-form ⟹ reductive, + N23 perfectness ⟹ no abelian centre ⟹
semisimple; or via irreducibility of the faithful 7-rep) is a genuine W1 next step → childed N25.

**What is childed to N25 (never asserted here, never a bridge).** (B′) SEMISIMPLICITY (the no-abelian-
atoms clause, via the reductive/skew-adjoint or irreducibility route — the three other Cartan inputs
already banked N24), (A) irreducibility of the faithful 7-rep, (D) simplicity (no nonzero proper
ideal) — which, with the banked negative-definite nondegenerate trace form + perfectness + faithful
7-rep + dim = 14 + bracket table, complete the identification of `derivationLieQ` as the compact real
form of g₂. Then the automorphism Lie GROUP (exponentiating `Der(𝕆)` over the derived continuum
`ContinuumQ.Cut`).

## N25 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 3: SEMISIMPLICITY of `derivationLieQ` (the no-abelian-atoms clause + the trivial centre)  (Emergent, depth 3)  ✅ LANDED (irreducibility of the faithful 7-rep + simplicity childed N26; then the automorphism Lie GROUP)
**What landed (`Phys/Algebra/DerivationCompact.lean`).** The 14-dim derivation Lie algebra is now
proved SEMISIMPLE — `LieAlgebra.IsSemisimple ℚ derivationLieQ` — the defining type-G₂ structural
property, derived FORWARD from the banked NEGATIVE-DEFINITE nondegenerate defining trace form (N24)
and PERFECTNESS (N23), NO posited `G₂`. The Mathlib entry
`LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate` on `Φ := LieModule.traceForm ℚ
derivationLieQ (O ℚ)` discharges semisimplicity from the nondegenerate (`traceForm_nondegenerate`,
banked N24) + reflexive (`(traceForm_isSymm …).isRefl`, FREE) + Lie-invariant
(`traceForm_lieInvariant`, FREE) form PLUS the lone clause `∀ I, IsAtom I → ¬IsLieAbelian I`.
★ THE ONE LAW navigated (the N24-flagged trap NOT repeated): that clause is NOT free from the
DEFINING module form — the classical "abelian ideal ⊆ radical" Dieudonné argument is the ADJOINT
(Killing) fact whose premise is the OPPOSITE of the truth here (`B(D,D) < 0` for every `D ≠ 0`).
The clean route is THEORY-NATIVE. ★★ `derivationLieQ_center_eq_bot` (`center = ⊥`): PERFECTNESS
(`⁅⊤,⊤⁆ = ⊤`) puts every element into `lowerCentralSeries 1`, trace-orthogonal to the centre
(`traceForm_apply_eq_zero_of_mem_lcs_of_mem_center`), so a central `z` has `B(z,z) = 0` ⟹ `z = 0`
(negative-definiteness, `traceForm_self_eq_zero'`). ★★ `derivationLieQ_no_abelian_atom`: an abelian
atom `I` has `⁅I,I⁆ = ⊥`; the atom dichotomy `⁅⊤,I⁆ ∈ {⊥, I}` gives — `⁅⊤,I⁆ = ⊥` ⟹ `I ≤ center =
⊥` (contra); `⁅⊤,I⁆ = I` ⟹ `↑I` is the span of brackets `⁅x,n⁆` on which invariance forces
`B(⁅x,n⁆, w) = B(x, ⁅n,w⁆) = 0` (as `⁅n,w⁆ ∈ ⁅I,I⁆ = ⊥`), span-induction ⟹ `B(z,z) = 0` ⟹ `z = 0`
⟹ `I = ⊥` (contra). ★★★ `derivationLieQ_semisimple`: the assembly. 4 decls foundations-only
⊆ {propext, Classical.choice, Quot.sound} (independently axiom-audited via `lake env lean`, not
trusting the gate); gate D0–D6 GREEN (45 costumes, 474 theorems). Costume C45
(`DerivationSemisimpleAbelianCentreCostume`: the WRONG `center = ⊤` — the abelian/non-semisimple
reading — rewritten through banked `center = ⊥` leaves the unsatisfiable `⊢ ⊥ = ⊤`) bites. Compile
cost LIGHT (~9s scratch, 19s file; all probes ≤8s, default maxHeartbeats never inflated — NOT a W9
beast). `LieModule.traceForm`/`LieIdeal`/`IsAtom`/`IsLieAbelian`/`InvariantForm` are MACHINERY on the
DERIVED object (STANDARD §3). STANDARD applied: unbroken (every object derived back to the trunk or
standard Mathlib machinery), complete (foundations-only, no sorry/axiom), physics-words-removable
(delete "g₂/gauge/compact" → the pure statement that the 14-dim Lie algebra of Leibniz-derivations
of the Cayley–Dickson double of a double of a double of ℚ is semisimple with trivial centre).

**What is childed to N26 (never asserted here, never a bridge).** (A) IRREDUCIBILITY of the faithful
7-rep `imRep` on `ImO` — `LieModule.IsIrreducible ℚ derivationLieQ ImO` (needs `LieRingModule`/
`LieSubmodule` instance setup on the abstract 7-space, N23 flagged multi-run); (D) SIMPLICITY
(`LieAlgebra.IsSimple ℚ derivationLieQ` — likely from semisimple + (A) or the single-block
structure) — which, with the banked semisimplicity + negative-definite nondegenerate trace form +
perfectness + faithful 7-rep + dim = 14 + bracket table, complete the identification of
`derivationLieQ` as the compact real form of g₂. Then the automorphism Lie GROUP (exponentiating
`Der(𝕆)` over the derived continuum `ContinuumQ.Cut`).

## N26 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 4: the INVARIANT 7-dim Lie SUBMODULE `ImLie` + the ORTHOGONAL (COMPACT) EMBEDDING of the faithful 7-rep + the SIMPLICITY SKELETON  (Emergent, depth 3)  ✅ LANDED (the full irreducibility of the 7-rep + the `IsSimpleOrder(LieIdeal)` simplicity core childed N27; then the automorphism Lie GROUP)
**What landed (`Phys/Algebra/DerivationIrreducible.lean`).** Four forward increments, all from the
banked structure, NO posited `G₂`. ★ `ImLie : LieSubmodule ℚ derivationLieQ (O ℚ)` — the banked
imaginary subspace `ImO` (N22) promoted to a genuine invariant Lie submodule (via `derivLieQ_mapsTo`),
`Nontrivial ImLie` (the banked nonzero `u1`, anti-vacuity), `finrank_ImLie = 7` (transports
`finrank_ImO`) — the representation space of the faithful 7-rep as a genuine `LieSubmodule`, the
object N25's child needed. ★★ THE PREREG W3-DECOMPOSE GUESS DISSOLVED: the `LieRingModule`/
`LieSubmodule`/`IsIrreducible` instance plumbing on the abstract 7-space (N23/N25 flagged as the likely
multi-run node) SYNTHESIZES FREE (bounded probe ≤8s) — the real work is the mathematics, not the
plumbing. ★ `gBil : BilinForm ℚ (O ℚ)` — the Born self-overlap form `g v w := reQ (v · star w)`
(banked N24 `gForm`, the trunk's self-overlap = positivity) as a bilinear form; `gBil_separatingLeft`
(anisotropic/nondegenerate, the banked `gForm_self_eq_zero`). ★ `deriv_isSkewAdjoint_gBil` — every
`IsDerivQ` derivation is SKEW-ADJOINT for `gBil` (directly from the banked N24 `gFormQ_skew`). ★★
`derivationLieQ_le_skewAdjoint` — THE COMPACT EMBEDDING `g₂ ↪ so(7)`: the whole 14-dim algebra lands
in `skewAdjointLieSubalgebra gBil`, the skew-adjoint operators of the POSITIVE-DEFINITE Born form —
the COMPACT (definite) `so(7)`, NOT the split one, the compact real form's defining feature at the
REPRESENTATION level, derived FORWARD from skew-adjointness + anisotropy, NO posited G₂. ★
`isSimple_of_isSimpleOrder` — THE SIMPLICITY SKELETON: with the banked non-abelianness
(`derivationLieQ_not_lieAbelian`, N23), `derivationLieQ` is SIMPLE iff its Lie-ideal lattice is a
simple order (`isSimple_iff_of_not_isLieAbelian`), reducing the remaining simplicity claim to
`IsSimpleOrder (LieIdeal ℚ derivationLieQ)` — an honest W1 *implication*, the `IsSimpleOrder` core
childed N27, NEVER asserted (NOT a bridge). 12 decls foundations-only ⊆ {propext, Classical.choice,
Quot.sound} (independently axiom-audited via `lake env lean`, not trusting the gate); gate D0–D6 GREEN
(45 costumes, 481 theorems). Costume C46 (`DerivationIrreducibleWrongAdjointCostume`: the WRONG
SELF-ADJOINT/SYMMETRIC reading `g(wx,y)=g(x,wy)` of the nonzero witness — the non-compact reading —
which `linarith` cannot derive from the banked skew identity, since it would force `w=0`) bites.
Compile cost LIGHT (~12s file; all probes ≤8s, default maxHeartbeats never inflated — NOT a W9 beast).
`LieSubmodule`/`BilinForm`/`skewAdjointLieSubalgebra`/`IsSimpleOrder`/`LieIdeal` are MACHINERY on the
DERIVED object (STANDARD §3). STANDARD applied: unbroken (every object derived back to the trunk or
standard Mathlib machinery), complete (foundations-only, no sorry/axiom), physics-words-removable
(delete "g₂/gauge/compact/exceptional/fundamental representation" → the pure statement that the 14-dim
Lie algebra of Leibniz-derivations of the Cayley–Dickson double of a double of a double of ℚ acts on
its invariant 7-dim subspace `ker(star+id)` by operators skew-adjoint for the anisotropic self-overlap
form, and is simple iff its ideal lattice is a simple order).

**What is childed to N27 (never asserted here, never a bridge).** (A) the FULL `LieModule.IsIrreducible
ℚ derivationLieQ ↥ImLie` — needs joint-kernel-zero (banked numerics: rank 7) + a dimension count
excluding invariant subspaces of dim 2..5 (`dim so(d)+so(7−d) ≤ 11 < 14`, an `so(n)` finrank fact
Mathlib may lack → BUILD per W1; the d=1/d=6 cases dissolve through the banked perfectness — the "one
cause many terminations" flagship); (D) the `IsSimpleOrder (LieIdeal ℚ derivationLieQ)` core ⟹
`IsSimple` via the banked skeleton. Then the automorphism Lie GROUP (exponentiating `Der(𝕆)` over the
derived continuum `ContinuumQ.Cut`).

## N27 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 5: COMPLETE REDUCIBILITY of the faithful 7-rep + the d=1 EXCLUSION  (Emergent, depth 3)  ✅ LANDED (the d∈{2,3,4,5} `so(n)`-count → full irreducibility + the `IsSimpleOrder(LieIdeal)` core → `IsSimple` childed N28; then the automorphism Lie GROUP)
**What landed (`Phys/Algebra/DerivationIrreducible.lean`).** Two forward increments, both from the
banked structure via the trunk's Born positivity, NO posited `G₂`. ★ THE WEYL / BORN-ORTHOGONAL
LEVER: `gBil_isSymm` (the Born self-overlap form is symmetric ⟹ reflexive); `gBil_restrict_nondegenerate`
(the DEFINITE/anisotropic form restricts NONDEGENERATELY to EVERY subspace, from the banked
`gForm_self_eq_zero`); ⟹ `isCompl_gBil_orthogonal` (`IsCompl W (gBil.orthogonal W)` for ALL `W` — the
Born-orthogonal complement is a genuine linear complement, `BilinForm.isCompl_orthogonal_of_restrict_nondegenerate`
reframed through the trunk's positivity). ★ `deriv_mapsTo_orthogonal` — skew-adjointness (banked
`gFormQ_skew`, N24) ⟹ the orthogonal complement of a `D`-invariant subspace is `D`-invariant. ★★
`gPerp` / `isCompl_gPerp` — THE COMPLETE REDUCIBILITY: every Lie submodule `N` of `O ℚ` (invariant
subspace under all Leibniz-derivations) has an INVARIANT (Lie-submodule) COMPLEMENT, its `gBil`-orthogonal
complement `gPerp N`. The module is semisimple — the Weyl complete-reducibility theorem DERIVED from
the trunk's Born positivity (the self-overlap is definite, so the orthogonal complement is genuine and
is invariant because derivations are skew-adjoint), NO averaging, NO posited compact group, NO posited
G₂. ★ THE d=1 EXCLUSION (the "one cause many terminations" flagship at the representation level):
`deriv_eigenvalue_zero` (a Leibniz-derivation, skew-adjoint for the DEFINITE Born form, has NO nonzero
real eigenvalue — `2λ·g(v,v)=0` with `g(v,v)≠0` by anisotropy ⟹ `λ=0`); `no_common_eigenvector_ImO` (a
nonzero common eigenvector in `ImO` would be killed by every derivation, hence by the three banked
`{D0E,D3E,D8E}` whose joint kernel on `ImO` is `0` — probe-verified rank 7 — so it vanishes, contradiction);
`no_one_dim_invariant_ImO` (hence NO 1-dim invariant subspace inside `ImO`) — the SAME perfectness/faithfulness
that makes the joint kernel vanish forbids any trivial 1-dim subrepresentation. 9 decls foundations-only
⊆ {propext, Classical.choice, Quot.sound} (independently axiom-audited via `lake env lean`, not trusting
the gate); gate D0–D6 GREEN (46 costumes, 490 theorems). Costume C47 (`DerivationIrreducibleOneDimInvariantCostume`:
the DEGENERATE-form reading — the Born-orthogonal complement of the FULL space `⊤` is again `⊤`, which
`isCompl_gBil_orthogonal ⊤` forces to `⊥`, collapsing to the false `⊥ = ⊤`) bites with signature `⊢ ⊥ = ⊤`.
Compile cost LIGHT (~10s file; default maxHeartbeats never inflated — NOT a W9 beast; the trunk-native
Born-orthogonal route avoided all coordinate expansion). `BilinForm.orthogonal`/`IsCompl`/`finrank`/
`finrank_eq_one_iff'` are MACHINERY on the DERIVED object (STANDARD §3). STANDARD applied: unbroken,
complete (foundations-only, no sorry/axiom), physics-words-removable (delete "g₂/gauge/compact/Weyl/Born"
→ the pure statement that the 14-dim Lie algebra of Leibniz-derivations of the Cayley–Dickson double of a
double of a double of ℚ acts completely reducibly on its invariant 7-dim subspace `ker(star+id)` — every
invariant subspace has an invariant orthogonal complement — with no 1-dim invariant subspace).

**What is childed to N28 (never asserted here, never a bridge).** (A) the FULL `LieModule.IsIrreducible
ℚ derivationLieQ ↥ImLie` — with complete reducibility + the d=1/d=6 exclusion banked, the remaining gap
is the d∈{2,3,4,5} dimension count (`dim so(d)+so(7−d) ≤ 11 < 14`, an `so(n)` finrank fact Mathlib may
lack → BUILD per W1) excluding the middle invariant-subspace dimensions; (D) the `IsSimpleOrder (LieIdeal
ℚ derivationLieQ)` core ⟹ `IsSimple` via the banked `isSimple_of_isSimpleOrder` (route: full irreducibility
+ faithfulness ⟹ any nonzero ideal acts as the whole). Then the automorphism Lie GROUP (exponentiating
`Der(𝕆)` over the derived continuum `ContinuumQ.Cut`).

## N28 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 6: FULL IRREDUCIBILITY of the faithful 7-rep (the so(n)-type dimension bound BUILT per W1)  (Emergent, depth 3)  ✅ LANDED (the `IsSimpleOrder(LieIdeal)` simplicity core → `IsSimple` + the automorphism Lie GROUP childed N29)
**What landed (`Phys/Algebra/DerivationIrreducibleFull.lean`).** The faithful 7-rep of `derivationLieQ`
is FULLY IRREDUCIBLE — `LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie` — all FORWARD from the banked
structure, NO posited `G₂`. ★★ THE W1 BUILD (docs/RUNBOOK W1; Mathlib LACKS `dim so(n) = C(n,2)`): the
so(n)-type DIMENSION BOUND `finrank_skewAdjoint_le_choose` — a skew-adjoint operator `D` of a SYMMETRIC
NONDEGENERATE form `Φ` on a `d`-dimensional space lies in a space of `finrank ≤ C(d,2)` — DERIVED FORWARD
via the alternating-Fin-2 / exterior-power injection `D ↦ ((x,y)↦Φ(D x) y)` (`bml_zero_diag` — skew + symm
⟹ vanishing diagonal; `aml` — the alternating form; `skewToDual` — the linear injection into `Dual(⋀²V)`
via `exteriorPower.alternatingMapLinearEquiv`; `skewToDual_injective` from nondegeneracy; `exteriorPower.finrank_eq`
gives `finrank ⋀²V = C(d,2)`), NO coordinate matrix, NO posited `so(n)`. ★ THE ASSEMBLY: `restrictOp_skew`
(a derivation restricted to an invariant subspace is skew-adjoint for `gBil.restrict W`, from banked
`gFormQ_skew`), `restrictToSkew` (the linear map `D ↦ D|W` into the skew-adjoints), `gBil_restrict_symm`,
`finrank_restrictSkew_le` (the bound on the restricted form). ★★ `no_proper_invariant_ImO` — NO proper
nonzero invariant subspace of `ImO`: the Born-orthogonal complement `W' = gBil.orthogonal W ⊓ ImO`
(invariant via banked `deriv_mapsTo_orthogonal`, complementary via banked `isCompl_gBil_orthogonal`) splits
`ImO = W ⊕ W'`; FAITHFULNESS (banked `imRep_injective`) injects `derivationLieQ` into `skew(Φ|W) × skew(Φ|W')`,
forcing `14 ≤ C(d,2)+C(7−d,2)` = `11,9,9,11 < 14` for `d∈{2,3,4,5}` (`decide`), and `d=1,6` excluded by the
banked `no_one_dim_invariant_ImO` (N27). ★★★ `ImLie_isIrreducible` — `LieModule.IsIrreducible` (= `IsSimpleOrder
(LieSubmodule …)`): a proper nonzero Lie submodule pushes forward (banked `ImLie.incl`, `map_incl_le_ImO`/
`finrank_map_incl`) to a proper nonzero invariant subspace of `ImO` (`0 < dim < 7`), excluded by
`no_proper_invariant_ImO`. 10 decls foundations-only ⊆ {propext, Classical.choice, Quot.sound} (independently
axiom-audited; the whole audited tree's axiom set is exactly the trio); gate D0–D6 GREEN (48 costumes, 500
theorems). Costume C48 (`DerivationFullIrreducibleReducibleCostume`: the WRONG claim that the 7-rep is REDUCIBLE,
`¬ LieModule.IsIrreducible …` — the banked `ImLie_isIrreducible` proves it IS irreducible, so the goal `⊢ False`
is unprovable) bites with signature `⊢ False`. Compile cost LIGHT (~12s file; default maxHeartbeats never
inflated — NOT a W9 beast; the structural exterior-power injection avoided all coordinate expansion). The run
was a W6/W9.8 CRIME-SCENE recovery of run 138's stranded clean `no_proper_invariant_ImO` lever (the `Module.Free`
synthesis gap fixed) + a fresh forward `ImLie_isIrreducible` increment + finalize. `LieModule.IsIrreducible`/
`IsSimpleOrder`/`AlternatingMap`/`⋀²`/`BilinForm`/`finrank` are MACHINERY on the DERIVED object (STANDARD §3);
NO `LieAlgebra.g₂`/`G₂` imported to assert anything. STANDARD applied: unbroken, complete (foundations-only,
no sorry/axiom), physics-words-removable (delete "g₂/gauge/compact/exceptional/fundamental representation" →
the 14-dim Lie algebra of Leibniz-derivations of the Cayley–Dickson double of a double of a double of ℚ acts
IRREDUCIBLY on its invariant 7-dim subspace `ker(star+id)`, with the so(n)-type dimension bound a structural fact).

**What is childed to N29 (never asserted here, never a bridge).** (D) the `IsSimpleOrder (LieIdeal ℚ
derivationLieQ)` core ⟹ `LieAlgebra.IsSimple` via the banked `isSimple_of_isSimpleOrder` (N26). NB: with full
irreducibility + faithfulness banked, this is NOT near-free — Mathlib has NO "faithful irreducible ⟹ simple"
lemma (faithful+irreducible alone is insufficient: `so(4)` on its 4-rep is the standard counterexample), so it
genuinely needs the irreducible-faithful-module ⟹ simple structure theorem (Schur/tensor-decomposition + the
prime-dimension `7` argument), a substantial BUILD per W1. Then the automorphism Lie GROUP (exponentiating
`Der(𝕆)` over the derived continuum `ContinuumQ.Cut`).

## N29 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 7: the SIMPLICITY-REDUCTION levers toward `LieAlgebra.IsSimple ℚ derivationLieQ`  (Emergent, depth 3)  ✅ LANDED (DECOMPOSED — the structure-theorem BUILD childed N30; then the automorphism Lie GROUP)
**What landed (`Phys/Algebra/DerivationSimple.lean`).** The simplicity of `derivationLieQ` is reduced
to one lattice fact, with the FAITHFULNESS LEVER it turns on banked — all FORWARD from the banked
structure, NO posited `G₂`. ★ `lieIdeal_nontrivial : Nontrivial (LieIdeal ℚ derivationLieQ)` — the
`⊥ ≠ ⊤` (Nontrivial) HALF of `IsSimpleOrder`, established from the banked non-abelianness
(`derivationLieQ_not_lieAbelian`, N23). ★★ `eq_bot_of_lie_ImLie_bot` — THE FAITHFULNESS LEVER: a Lie
ideal that brackets to `⊥` against the faithful 7-rep `ImLie` is itself `⊥` (its elements act as `0`
on `ImO`, so `imRep` vanishes on them, and faithfulness `imRep_injective` (N22) forces them to `0`).
★ `lie_ImLie_ne_bot_of_ne_bot` — its contrapositive: every NONZERO Lie ideal acts NONTRIVIALLY on the
irreducible 7-rep — the lever the structure theorem (N30) turns on to rule out a direct-summand ideal
acting trivially. 3 decls foundations-only ⊆ {propext, Classical.choice, Quot.sound} (independently
axiom-audited). Gate D0–D6 GREEN (49 costumes, 503 theorems). Costume C49
(`DerivationSimpleTrivialActionCostume`: the WRONG "algebra acts trivially" claim `⊤ = ⊥` reduces
through the faithfulness lever to the unprovable `⁅⊤, ImLie⁆ = ⊥`) bites. Compile cost LIGHT (~8s).

**Why DECOMPOSED (W3/W9 — not scope reduction, NOT a bridge).** The MEASUREMENT (W9, bounded
reconnaissance): `IsSimpleOrder (LieIdeal ℚ derivationLieQ)` = irreducibility of the ADJOINT rep; the
banked 7-rep irreducibility (N28) does NOT transfer directly (THE ONE LAW / N28 LOCKED finding:
`so(4)` on its 4-rep is faithful+irreducible but NOT simple). Banked semisimplicity (N25) ⟹ Mathlib
`IsSemisimple.instBooleanAlgebra` makes the ideal lattice a Boolean algebra, atomistic,
`sSup{atoms}=⊤`, so `IsSimpleOrder ⟺ exactly ONE atom`. Mathlib LACKS the Lie-module isotypic
decomposition / outer-tensor / Lie-Schur (it has only the ASSOCIATIVE `IsSemisimpleModule` /
`isotypicComponent` / `Module.End.instDivisionRing` Schur + Wedderburn–Artin). The genuine route is the
prime-dimension-7 / isotypic-Schur STRUCTURE THEOREM — a substantial W1 BUILD childed N30 (the ticket
itself flagged "may be its own node"). N28 timed out twice on a comparable build, so per W9 anti-timeout
the levers were banked and the structure theorem scoped to a dedicated node, finalized with turns to spare.

**What is childed to N30 (never asserted here, never a bridge).** The irreducible-faithful-module ⟹
simple STRUCTURE THEOREM ⟹ `IsSimpleOrder (LieIdeal ℚ derivationLieQ)` ⟹ `LieAlgebra.IsSimple` via the
banked `isSimple_of_isSimpleOrder` (N26): if `derivationLieQ = I ⊕ J` (commuting nonzero ideals from a
2-atom split), the faithful irreducible 7-rep is `I`-isotypic, forcing `7 = r·dim W`; `7` is PRIME so
either a factor acts by a 1-dim character (perfect ⟹ acts `0` ⟹ faithfulness ⟹ `⊥`) or `V` is
factor-irreducible and Schur gives a division ℚ-algebra `Δ` with `dim_ℚ Δ ∈ {1,7}`, each branch
collapsing via the skew-trace / the `dim I + dim J = 14` centre count. Then the automorphism Lie GROUP.

## N30 — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 8: the irreducible-faithful-module ⟹ simple STRUCTURE THEOREM levers (the atom → two-commuting-ideals reduction)  (Emergent, depth 3)  ✅ LANDED (DECOMPOSED — the reduction levers banked; the Lie→associative semisimple-module bridge → prime-7 collapse childed N30a)
**What landed (`Phys/Algebra/DerivationSimpleStructure.lean`).** The `IsSimpleOrder (LieIdeal ℚ
derivationLieQ)` target is reduced to refuting a faithful irreducible 7-rep of a product of two
nonzero COMMUTING ideals (the prime-7 hypothesis), with all route-independent forward levers
banked — all FORWARD from the banked structure, NO posited `G₂`. ★ `exists_atom_ne_top` — if the
ideal lattice is NOT a simple order, semisimplicity's atomisticity (`sSup{atoms}=⊤`, N25) forces an
atom `I ≠ ⊤` (≥ 2 atoms): the entry point. ★ `atom_compl_decomp` — the Boolean complement `J = Iᶜ`
gives two NONZERO COMMUTING ideals (`I ≠ ⊥`, `Iᶜ ≠ ⊥`, `I ⊔ Iᶜ = ⊤`, `I ⊓ Iᶜ = ⊥`, `⁅I, Iᶜ⁆ = ⊥`
since `⁅I,Iᶜ⁆ ≤ I ⊓ Iᶜ = ⊥`): the `⊤ = I ⊕ J` split the prime-7 argument refutes. ★
`imRep_commute_of_lie_zero` — commuting elements act by COMMUTING operators on the faithful 7-rep
(`imRep` a Lie hom — `map_lie`): lands one factor's action in the commutant of the other (Schur).
★ `atom_isPerfect` — an atom is simple hence perfect (`⁅⊤,⊤⁆=⊤`): kills the `dim W = 1` (1-dim
character) branch (perfect ⟹ acts `0` ⟹ faithfulness ⟹ `⊥`). ★ `atom_center_eq_bot` — an atom has
trivial centre (simple ⟹ trivial radical, `center_eq_bot`): kills the `dim Δ = 7` branch (there
`I ≅ Δᵒᵖ` carries the nonzero scalar centre `ℚ·id`). 5 decls foundations-only ⊆ {propext,
Classical.choice, Quot.sound} (independently axiom-audited). Gate D0–D6 GREEN (49 costumes, 508
theorems). Costume C50 (`DerivationSimpleStructureWrongDecompCostume`: the WRONG claim that the two
complementary commuting ideals do NOT commute — `⁅I, Iᶜ⁆ = ⊤` — rewriting through the banked
`⁅I, Iᶜ⁆ = ⊥` reduces to the false `⊥ = ⊤`) bites with signature `⊢ ⊥ = ⊤`. Compile cost LIGHT (~15s).

**Why DECOMPOSED (W3/W9 — not scope reduction, NOT a bridge).** The MEASUREMENT (W9, bounded
probes): the prime-7 collapse's crux — STEP A, "V = ImO is I-isotypic" — fundamentally needs the
Lie→associative semisimple-module BRIDGE Mathlib LACKS for Lie modules. MEASURED that
`A := Algebra.adjoin ℚ (imRep '' I)` forms cleanly and `ImO` is an `A`-module via `A.moduleLeft`
automatically; Mathlib HAS the associative isotypic/Schur machinery
(`IsIsotypicOfType.linearEquiv_fun`, `isSimpleModule_iff_finrank_eq_one`,
`Module.End.instDivisionRing`) once `IsSemisimpleModule A ImO` is in hand; that BRIDGE is the
substantial Mathlib-absent BUILD, supplied trunk-natively by N27's Born-orthogonal complete
reducibility transported to the SUBalgebra `A_I`. The ticket itself pre-authorized splitting
("decompose further if the bridge is itself multi-lemma — e.g. child 'N30a: the Lie→associative
semisimple-module bridge' then 'N30b: the prime-7 collapse'"). N28 timed out TWICE on a comparable
monolith; per W9 anti-timeout the levers were banked and the bridge scoped to a dedicated node,
finalized with turns to spare.

**What is childed to N30a (never asserted here, never a bridge).** The Lie→associative
semisimple-module BRIDGE: build `A_I := Algebra.adjoin ℚ (imRep '' I)` ⊆ `End ℚ ImO`, prove
`IsSemisimpleModule A_I ↥ImO` via the Born-orthogonal complemented lattice (an `A_I`-submodule = an
`I`-invariant subspace; its `gBil`-orthogonal complement is `I`-invariant since each element of `I`
acts skew-adjointly — banked `deriv_mapsTo_orthogonal`/`isCompl_gBil_orthogonal`), plus the submodule
dictionary lemmas. Then N30b (childed onto N30a's tail) = the prime-7 / isotypic-Schur COLLAPSE
consuming the banked levers ⟹ `IsSimpleOrder` ⟹ `LieAlgebra.IsSimple` via `isSimple_of_isSimpleOrder`
(N26). Then the automorphism Lie GROUP (exponentiating `Der(𝕆)` over the derived continuum
`ContinuumQ.Cut`).

## N30a — THE COMPACT-FORM / TYPE-G₂ COMPLETION, increment 9: the Lie→associative SEMISIMPLE-MODULE BRIDGE (`IsSemisimpleModule A_I ↥ImO` via Born-orthogonality)  (Emergent, depth 3)  ✅ LANDED (DECOMPOSED — the bridge banked; the commutant lemma + dictionary + prime-7 collapse childed N30b)

**LANDED (`Phys/Algebra/DerivationSemisimpleModule.lean`).** The Lie→associative semisimple-module
bridge is BUILT FORWARD, NO posited `G₂`, foundations-only ⊆ {propext, Classical.choice, Quot.sound}
(8 decls, independently axiom-audited). The W9 MEASUREMENT picked the CHEAPER framing the ticket
flagged: work ENTIRELY within `↥ImO` with the definite form `gBil.restrict ImO`, so the orthogonal
complement of a ℚ-subspace of `↥ImO` is ALREADY a genuine complement in `↥ImO` (no `⊓ ImO`, no
subtype image/comap order-iso). ★★★ `semisimpleModule_imRep_adjoin (I : LieIdeal ℚ derivationLieQ) :
IsSemisimpleModule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ↥ImO` — for ANY
Lie ideal `I`, the invariant 7-rep is a SEMISIMPLE module over the associative subalgebra `A_I`
generated by the `I`-action. Proved by INSTANTIATING the GENERIC bridge ★★ `isSemisimpleModule_adjoin`
(for any symmetric reflexive form `B` whose restriction to every subspace is nondegenerate — the
DEFINITE/Born-positivity hypothesis — and any set `S` of `B`-skew-adjoint operators, `V` over
`Algebra.adjoin K S` is semisimple: every `A`-submodule has the `B`-orthogonal complement as an
`A`-submodule complement). The supporting generic levers: `skewAdjoint_mapsTo_orthogonal` (a
skew-adjoint operator preserving `N` preserves `B.orthogonal N`, mirror of N27 `deriv_mapsTo_orthogonal`),
`adjoin_stable_orthogonal` (the orthogonal is `A`-stable by `Algebra.adjoin_induction` since `A` is
generated by skew-adjoint operators), `isCompl_of_restrictScalars` (`IsCompl` transfers down the
scalar-restriction order-embedding), `orthogonalASubmodule` (the candidate complement). Instantiated at
`B = gBil.restrict ImO`: `imRep_isSkewAdjoint_gImO` (reuse banked N28 `restrictOp_skew`) +
`gImO_restrict_nondegenerate` (the Born anisotropy `gForm_self_eq_zero` on `↥ImO`). This is N27's
Born-orthogonal complete reducibility transported from the whole derivation algebra to the SUBalgebra
`A_I`. Gate D0–D6 green (50/50 costumes, costume C51 `DerivationSemisimpleModuleWrongCostume` bites:
the WRONG `¬ IsSemisimpleModule A_I ↥ImO` reduces to `⊢ False` after `intro h` since the banked bridge
proves it IS semisimple). `IsSemisimpleModule`/`ComplementedLattice`/`Submodule A`/`Algebra.adjoin`/
`Module.End`/`BilinForm.orthogonal` are MACHINERY on the DERIVED object (STANDARD §3); NO `LieAlgebra.g₂`
imported to assert anything. STANDARD applied: unbroken (every object derives back to the banked trunk
— N27 anisotropy, N28 skew-adjointness, N22 `imRep` — or standard Mathlib machinery), complete
(foundations-only, no sorry/axiom/native_decide), physics-words-removable (delete "g₂/gauge/compact/simple"
→ the pure statement that the associative subalgebra generated by the action of a Lie ideal on the
invariant 7-dim subspace `ker(star+1)` of the Cayley–Dickson double of a double of a double of ℚ acts
SEMISIMPLY). **DECOMPOSED (W3/W9):** the bridge banked; the commutant lemma (a commuting ideal `J` with
`⁅I,J⁆=⊥` acts in `End_{A_I}(↥ImO)`), the submodule dictionary, and the prime-7 / isotypic-Schur
COLLAPSE childed N30b onto the chain tail (never asserted here).

**N30b — THE PRIME-7 / ISOTYPIC-SCHUR COLLAPSE ⟹ `IsSimpleOrder` ⟹ `IsSimple`.**  ✅ LANDED (the CAPSTONE of the type-G₂/compact-form identification; the automorphism Lie GROUP is now the forward node — see below).

**HOW IT LANDED (the retrospective).** `Phys/Algebra/DerivationSimpleCollapse.lean`. The generic
prime-dimension structure-theorem layer (`commutantHom`, `isotypic_prime_split`,
`prime_split_dichotomy`) was proved over an ABSTRACT subalgebra (the concrete `A_I` blows up
`SMul A_I` typeclass synthesis — measured W9). The heavy Schur branch the FINDINGS flagged as a
W1 decompose point (division-algebra dimension classification + Jacobson density) DISSOLVED through
the trunk via `skew_odd_det_zero`: a `B`-skew-adjoint operator on an ODD-dimensional nondegenerate
space is SINGULAR (`det = 0`); on the odd (7) DEFINITE Born 7-rep, a commuting-ideal generator
`imRep b` lands in the Schur division ring `End_{A_I}(↥ImO)` (Schur `injective_of_ne_zero`) yet is
skew-adjoint-singular ⟹ not injective ⟹ `0` ⟹ `b = 0` by faithfulness — ONE CAUSE (odd-dim skew
singularity) terminating the branch, no division-algebra count needed. `collapse_scalar_branch`
(character branch ⟹ `I = ⊥` by atom perfectness + faithfulness) + `collapse_schur_branch`
(Schur branch ⟹ `Iᶜ = ⊥`) make `derivationLieQ_isSimpleOrder` forward (the dichotomy instantiated at
the concrete `A_I`, M1-measured clean — the W9 risk that timed out 3 prior runs DISCHARGED), then
`derivationLieQ_isSimple := isSimple_of_isSimpleOrder derivationLieQ_isSimpleOrder` (banked N26).
12 decls foundations-only, gate D0–D6 green, costume C52 bites `⊢ False`. NO posited `G₂`, NO bridge.
The original forward-spec is preserved below for the record.

**(superseded forward-spec, for the record)**
Consume the banked N30a bridge `semisimpleModule_imRep_adjoin` + the N30 levers (`exists_atom_ne_top`,
`atom_compl_decomp` giving two nonzero COMMUTING ideals `⊤ = I ⊕ J` with `⁅I,J⁆=⊥`, `imRep_commute_of_lie_zero`,
`atom_isPerfect`, `atom_center_eq_bot`) + Mathlib's associative isotypic/Schur machinery
(`IsIsotypicOfType.linearEquiv_fun`, `isSimpleModule_iff_finrank_eq_one`, `Module.End.instDivisionRing`).
The argument: if `derivationLieQ` is NOT a simple order, `atom_compl_decomp` splits `⊤` into two nonzero
commuting ideals; by the N30a bridge `↥ImO` is `A_I`-semisimple, so it decomposes into isotypic
components; the commutant lemma (build it as part of N30b — `J` acts in `End_{A_I}`) + Schur force the
faithful irreducible 7-rep to be `I`-isotypic, giving `7 = r·dim W` with 7 PRIME ⟹ either `dim W = 1`
(killed by `atom_isPerfect` + faithfulness — a perfect ideal acting by 1-dim characters acts as 0,
forced to ⊥) or `dim W = 7`, `r = 1` (the Schur branch: `J` acts by a scalar in the division ring
`End_{A_I}(↥ImO)`, skew-traceless by `derivationLieQ_le_skewAdjoint` ⟹ scalar 0 ⟹ `J` acts trivially
⟹ faithfulness forces `J = ⊥`, contradicting `atom_compl_decomp`'s `Iᶜ ≠ ⊥`; or via `atom_center_eq_bot`
+ `finrank_derivationQ_eq_14`). Either branch contradicts the two-nonzero-commuting-ideals split ⟹
`IsSimpleOrder (LieIdeal ℚ derivationLieQ)` ⟹ `LieAlgebra.IsSimple ℚ derivationLieQ` via banked
`isSimple_of_isSimpleOrder`. Then the automorphism Lie GROUP. NO posited `G₂`.
**Target.** Build the Lie→associative bridge the prime-7 / isotypic-Schur structure theorem (N30b)
runs on, FORWARD from the banked N30 levers + N27 Born-orthogonal complete reducibility + N28 full
irreducibility, NO posited `G₂`. For a nonzero Lie ideal `I` of `derivationLieQ`: form the
associative ℚ-subalgebra `A_I := Algebra.adjoin ℚ (Set.range (imRep ∘ I.incl)) ⊆ Module.End ℚ ImO`
(measured to form cleanly; `ImO` is an `A_I`-module via `A_I.moduleLeft`), and prove
`IsSemisimpleModule A_I ↥ImO` (= `ComplementedLattice (Submodule A_I ImO)`). THE TRUNK ROUTE (THE
ONE LAW, reuse N27): an `A_I`-submodule of `ImO` is exactly an `I`-invariant subspace (since `A_I`
is generated by the `I`-action); its `gBil`-orthogonal complement (banked `isCompl_gBil_orthogonal`)
is ALSO `I`-invariant because each element of `I` acts skew-adjointly (banked
`deriv_mapsTo_orthogonal` holds for every derivation). So the lattice of `A_I`-submodules is
COMPLEMENTED ⟹ `IsSemisimpleModule A_I ↥ImO`. Also bank the SUBMODULE DICTIONARY: the bijection
`A_I`-submodule ↔ `I`-invariant subspace, and that the action of a COMMUTING ideal `J` (with `⁅I,J⁆=⊥`)
lands in the commutant `End_{A_I}(ImO)` (via banked `imRep_commute_of_lie_zero`).
**Dependency.** N30 (the reduction levers). **What "done" requires.** `IsSemisimpleModule A_I ↥ImO`
PROVED forward (foundations-only, costume that a WRONG semisimplicity/complement claim fails, gate
green, STANDARD met), the submodule dictionary banked, the prime-7 COLLAPSE childed N30b (never
asserted). **Drift trap.** Same posit-vs-derive moat: build the bridge forward; do NOT import a
Mathlib G₂. **W9.** MEASURE the `IsSemisimpleModule` construction cost first (bounded probe); the
`Submodule A_I ImO` ↔ `I`-invariant-subspace dictionary is the crux — if heavy, decompose. The
collapse N30b is the FORWARD node once the bridge lands. See the N30 task handoff + workbench/N30
FINDINGS.md for the full measured argument.


  - **The automorphism Lie GROUP** — exponentiating `Der(𝕆)` over the now-derived continuum (`ContinuumQ.Cut`,
    the derived ℝ) to the compact automorphism group, the gauge group physics recognizes.
    **✅ INCREMENT 1 LANDED (N31, `Phys/Algebra/DerivationAutGroup.lean`).** The algebra-automorphism
    group `AutO` of the terminal algebra `O ℚ` is DEFINED — as a `Subgroup` of the ℚ-linear automorphism
    group `(O ℚ ≃ₗ[ℚ] O ℚ)` carved by the multiplicative-and-unital predicate `IsAlgAut` (the W1 BUILD:
    `O ℚ` is non-associative, so there is NO `Algebra ℚ (O ℚ)` instance / Mathlib `AlgEquiv` to import and
    assert against — measured; the carrier is built FORWARD, `Subgroup`/`LinearEquiv` MACHINERY on the
    DERIVED object, STANDARD §3) — and the FORWARD seed facts proved: an automorphism preserves the real
    part (`aut_reQ`, via the octonion quadratic `octo_quadratic`), commutes with conjugation (`aut_star`),
    ★★ PRESERVES the Born self-overlap form (`aut_gForm` — the group analogue of the banked infinitesimal
    skew-adjointness `derivationLieQ_le_skewAdjoint`, the SAME Born positivity from the trunk integrated;
    ONE cause), preserves the trace-zero subspace `ImO` (`aut_mapsTo_ImO`), fixes the unit (`aut_map_one`);
    group closure proved, non-vacuous (`one_mem_AutO`). 18 decls foundations-only, costume C53 bites
    `⊢ 1 = -1`, NO posited `G₂`/`Aut`, NO bridge. The numerics re-verified (W6): Killing det
    9618527719784448, NEG-definite — the definiteness that makes the group COMPACT.

  - **✅ INCREMENT 2 LANDED (N32, `Phys/Algebra/DerivationAutCompact.lean`).** The continuum-free
    COMPACTNESS SKELETON of `AutO` is banked. W9 MEASURE-FIRST (workbench/N32-aut-exp/PREREG.md, bounded
    `#check`/`#synth` probes) DECIDED the increment scope: the derived ℝ `ContinuumQ.Cut` carries
    `Field`+`LinearOrder`+`IsStrictOrderedRing` but NO `TopologicalSpace`/`UniformSpace`/`NormedField`/
    `Archimedean`, and Mathlib's `NormedSpace.exp` wants a topological/normed field — so the analytic
    operator-exp `Der(𝕆) → Aut(𝕆)` is a genuine W1 BUILD of an analytic sub-tower OVER the derived ℝ
    (DECOMPOSED per W3, childed N33). The COMPACTNESS's continuum-free algebraic heart was banked
    instead: in the `gForm`-orthonormal coordinate frame `bO` (N24), the banked form-preservation
    `aut_gForm` (N31) makes every automorphism an ISOMETRY — `gForm_polar` (★ the Born self-overlap form
    IS the standard inner product in the frame, polarizing `gForm_self_sum_sq`), `gForm_orthonormal`,
    `aut_col_unit` (each coordinate column is a unit vector), `aut_col_orthogonal` (the columns are
    mutually orthonormal — the algebraic `MᵀM = I`), ★★ `aut_entry_abs_le_one` (THE BOUNDEDNESS: every
    coordinate entry has `|entry| ≤ 1` — the algebraic skeleton of compactness, descending from the
    definite Born form exactly as the skew-adjointness did, ONE cause). Member-level corollaries on
    `AutO` + non-vacuity (the identity saturates the bound, `one_entry_diag = 1`). 16 decls
    foundations-only, costume C54 bites `⊢ 1 = 2`, NO posited exp/`G₂`/`Aut`/orthogonal-group, NO
    Mathlib ℝ as content, NO bridge.

  - **✅ INCREMENT 3 (3a) LANDED (N33, `Phys/Foundation/ContinuumCCLO.lean`).** The first analytic-tower
    rung over the derived ℝ is banked: the derived ℝ `ContinuumQ.Cut` is now a
    `ConditionallyCompleteLinearOrder` in Mathlib's STANDARD `IsLUB`/`sSup` idiom. The genuine W1 BUILD
    the N32 measurement forced, attacked by REFRAMING through the trunk (W1 step 2): order-completeness IS
    the banked C6 eternal-approach / gather-of-closures completion one level up — the banked bespoke
    Dedekind completeness `completion_coherence_closed` (N6/N10–N14: every gather of cuts has a coherence
    point = the union cut) RE-EXPRESSED as the standard least-upper-bound property. `sSupCutS` (the union
    of lower sets of a `Set Cut`), `sSupCutGather` (the union of a nonempty bounded family of cuts is a
    cut — a verbatim port of the `hgather` block), the `SupSet Cut` instance, `isLUB_csSupCut` (★★ union
    cut = LEAST UPPER BOUND), `not_bddAbove_univ`, and `condCompleteLinearOrder` (★★ the
    `ConditionallyCompleteLinearOrder`, via `conditionallyCompleteLatticeOfLatticeOfsSup` reusing the
    banked `LinearOrder Cut`). This UNLOCKS the standard ORDER TOPOLOGY +
    `ConditionallyCompleteLinearOrder.toCompactIccSpace` ⟹ `isCompact_Icc` — Heine–Borel on the DERIVED ℝ
    — as MACHINERY (STANDARD §3: a property OF the derived ℝ, not a posited number system / topology;
    confirmed reachable in a bounded probe). 8 decls foundations-only, costume C55 bites `⊢ 0 = 1`, NO
    posited ℝ/topology/exp/G₂, NO Mathlib ℝ as content, NO bridge. (DECOMPOSED per W3, childed N34.)

  - **✅ INCREMENT 4 LANDED (N34, `Phys/Foundation/ContinuumTopology.lean` + `Phys/Algebra/DerivationAutCompactTopo.lean`).**
    The TOPOLOGY RUNG over the derived ℝ + the Heine–Borel TOPOLOGICAL COMPACTNESS of the automorphism
    group are banked. W9 MEASURE-FIRST (workbench/N34-operator-exp/PREREG.md, bounded `#check`/`example`
    probes, all clean ~8s) sized the increment: with N33's `ConditionallyCompleteLinearOrder Cut`, the
    standard ORDER TOPOLOGY (`Preorder.topology` + `OrderTopology` by `rfl`) is reachable cheaply as
    MACHINERY, giving `T2Space`, ★ `IsTopologicalRing` (continuous +, ·, neg — the derived ℝ is a
    topological ring), `CompactIccSpace` ⟹ ★★ `isCompact_Icc_cut` (HEINE–BOREL on the derived ℝ), and
    finite-product box compactness `isCompact_box`. THE COMPACTNESS over the derived ℝ:
    `bornIsometrySet` (the `MᵀM = I` matrices over `Cut` = Born-form preservation in the `bO` frame),
    `bornIsometry_isClosed` (intersection of continuous-bilinear level sets, Hausdorff),
    `matBox_isCompact` (Heine–Borel per factor + finite Tychonoff), `bornIsometry_subset_box` (the
    diagonal condition bounds each entry — the N32 boundedness over `Cut`), ★★ `bornIsometry_isCompact`
    (closed ⊆ compact box ⟹ COMPACT), ★ `autMatrix_mem_bornIsometry` (the banked `AutO` coordinate image,
    cast `ℚ → Cut`, LANDS IN the compact orthogonal-isometry set — transporting `AutO_col_orthogonal`,
    N32) + identity non-vacuity. ONE CAUSE: the SAME definite Born positivity (self-overlap) that gave
    skew-adjointness (N26), simplicity (N30b) and entry-boundedness (N32) now gives topological
    COMPACTNESS once the derived ℝ is order-complete (N33) + carries the order topology (N34). 13 decls
    foundations-only, costume C56 bites `⊢ (1:Cut) = 2`, NO posited exp/G₂/Aut/orthogonal-group, NO
    Mathlib ℝ as content, NO bridge. (DECOMPOSED per W3/W9, childed N35.) The W1 reframe through the
    trunk: the topology is the banked C6 eternal-approach / N33 order-completeness spoken in the
    standard-topology dialect, never a posited ℝ/topology.

  - **✅ INCREMENT 5 LANDED (N35, `Phys/Foundation/ContinuumArchimedean.lean`).** The ARCHIMEDEAN /
    C6-eternal-approach analytic FOUNDATION RUNG over the derived ℝ is banked — the first analytic
    rung the operator-exp tower rests on, BELOW the metric/uniform structure. W9 MEASURE-FIRST
    (workbench/N35-operator-exp/PREREG.md + probes, all exit 0 ~8s — DECISIVE, fixed the scope)
    established: with N33's `ConditionallyCompleteLinearOrder` + N34's order topology, `Archimedean Cut`
    is reachable cheaply as MACHINERY (`ConditionallyCompleteLinearOrderedField.to_archimedean` on the
    banked `Field` + `ConditionallyCompleteLinearOrder` + `IsStrictOrderedRing`) and the order-native
    monotone convergence rides `SupConvergenceClass` (from `OrderTopology`); but `UniformSpace`/
    `MetricSpace`/`CompleteSpace Cut` ALL fail to synthesize, and ℝ's own completeness is a whole
    `UniformSpace/Real.lean` via `CauSeq` with no generic metric-from-order-topology — so building a
    `PseudoMetricSpace Cut` (dist `=|x-y|`) whose induced topology equals the FIXED `Preorder.topology Cut`
    is a genuine multi-file W1 BUILD (childed N36, NOT asserted). Banked here: ★ `instArchimedeanCut`
    (the derived ℝ is ARCHIMEDEAN — the C6 eternal-approach / no-infinite-element fact, MACHINERY via
    `to_archimedean`, a property OF the derived ℝ, STANDARD §3), `cut_exists_nat_gt` (the explicit
    no-infinite-element form), ★ `cut_tendsto_atTop_ciSup`/`ciInf`/`isLUB` (the C6 eternal-approach read
    as analytic CONVERGENCE with NO metric — bounded monotone sequences converge to their sup/inf in the
    banked order topology; the bounded approach eternally tends to its LUB coherence point, banked N33),
    + non-vacuity witnesses. ONE CAUSE: the SAME C6 eternal-approach that built the cut and gave
    order-completeness (N33) + the order topology (N34) now gives the Archimedean property + the analytic
    limit. 7 decls foundations-only, costume C57 bites `⊢ (0:Cut) = 1`, NO posited exp/G₂/Aut/metric/
    number-system, NO Mathlib ℝ as content, NO bridge. (DECOMPOSED per W3/W9, childed N36.) The W1 reframe
    through the trunk: the Archimedean property + the analytic limit are the banked C6 eternal-approach
    spoken one level up, never a posited ℝ/metric.

  - **✅ INCREMENT 6 LANDED (N36, `Phys/Foundation/ContinuumUniform.lean`).** The UNIFORM STRUCTURE on
    the derived ℝ is banked — and crucially its induced topology AGREES with the banked order topology.
    ★ THE W1 REFRAME THROUGH THE TRUNK THAT DISSOLVED THE FEARED HARD PART. The N35 measurement isolated
    "a `PseudoMetricSpace Cut` with `dist x y = |x - y|` whose induced topology = the FIXED
    `Preorder.topology Cut`" as the genuine remaining hard part — but that route is ALSO a CONTENT TRAP:
    Mathlib's `PseudoMetricSpace.dist` is ℝ-VALUED, so `dist x y = |x - y|` would cast `|x - y| : Cut`
    into Mathlib's ℝ = importing ℝ as content (STANDARD §3). THE TRUNK DODGES BOTH AT ONCE: `Cut` is a
    banked TOPOLOGICAL RING (`isTopologicalRing_cut`, N34) ⟹ `IsTopologicalAddGroup Cut`, and every
    topological additive group carries its CANONICAL GROUP UNIFORMITY
    `IsTopologicalAddGroup.rightUniformSpace` whose `.toTopologicalSpace` is, BY CONSTRUCTION, the ambient
    topology — so it equals the banked `instTopologicalSpaceCut` BY `rfl`, with NO ℝ-valued metric, NO
    `replaceTopology` proof obligation, and NO content import. The topology-agreement the N35 measurement
    feared holds DEFINITIONALLY. (W9 measured clean ~7s: workbench/N36-operator-exp/PREREG.md + probes.)
    Banked: ★ `instUniformSpaceCut` (the group uniformity — uniform-space MACHINERY on the DERIVED
    topological ring, a property OF the derived ℝ, STANDARD §3), ★★ `cut_uniformSpace_toTopologicalSpace_eq`
    (THE TOPOLOGY AGREEMENT: the uniformity's induced topology = the banked order topology, by construction
    — the rung the N35 measurement isolated as the hard part, here `rfl`), `instIsUniformAddGroupCut`
    (left=right uniformity coincide, the comm case), `cut_uniformity_eq` (the order-native explicit
    uniformity — entourages = "difference near 0"), + non-vacuity `cut_tsum_statable` (the `tsum ∑' n, f n`
    is now a well-formed `Cut` — the operator-exp partial sums can be STATED) / `cut_const_cauchySeq` (the
    constant sequence is CAUCHY — the uniform structure is non-degenerate, not the indiscrete collapse).
    ONE CAUSE: the SAME C6 eternal-approach that built the cut (N6), gave order-completeness (N33), the
    order topology + topological-ring continuity (N34), and the Archimedean/convergence rung (N35) now gives
    the uniform refinement. 6 decls foundations-only, costume C58 bites `⊢ instTopologicalSpaceCut = ⊥`
    (the discrete-topology garbage claim routes through the NEW agreement theorem and dies on dense order),
    NO posited exp/G₂/Aut/metric/number-system, NO Mathlib ℝ as content, NO bridge. (DECOMPOSED per W3/W9,
    childed N37.) The W1 reframe through the trunk: the uniform structure is the banked topological-ring
    continuity spoken one level up as nearness, never a posited ℝ-valued metric.

  - **✅ INCREMENT 7 LANDED (N37, `Phys/Foundation/ContinuumComplete.lean`).** `CompleteSpace Cut` — the
    CAUCHY-COMPLETENESS of the derived ℝ is banked, the completeness rung the operator-exp power series
    rests on. ★ THE W1 REFRAME THROUGH THE TRUNK THAT DODGED THE CONTENT TRAP: Mathlib's `CompleteSpace ℝ`
    goes through `CauSeq` + an ℝ-VALUED metric (`Mathlib.Topology.UniformSpace.Real`) — a CONTENT TRAP
    here (an ℝ-valued `dist` casts `|x - y| : Cut` into Mathlib's ℝ = importing ℝ as content, STANDARD §3).
    The trunk dodges it: completeness IS the banked C6 eternal-approach one level up, closing from TWO
    already-banked trunk facts with NO metric and NO `CauSeq` — (i) THE NEARNESS IS COUNTABLY GENERATED
    BECAUSE THE APPROACH IS: the neighbourhood filter at `0` has the countable basis `{x | |x| < 1/(n+1)}`,
    the eternal approach by reciprocals of the Archimedean naturals (N35 `exists_nat_one_div_lt`), so `𝓝 0`
    and hence the group uniformity `𝓤 Cut` (N36) is `IsCountablyGenerated` (`FirstCountableTopology Cut`
    does NOT synthesize — this BUILD supplies the countable generation the completeness criterion needs);
    (ii) A CAUCHY SEQUENCE IS BOUNDED, so it lives in a banked-COMPACT closed box `Icc lb ub` (N34
    Heine–Borel `isCompact_Icc`), has a convergent subsequence (`IsCompact.tendsto_subseq`), hence — being
    Cauchy — converges (`tendsto_nhds_of_cauchySeq_of_subseq`). `UniformSpace.complete_of_cauchySeq_tendsto`
    assembles them — a genuine Bolzano–Weierstrass / liminf-flavoured BUILD over the N36 uniform structure,
    attacked from the trunk rather than by porting ℝ's `CauSeq` completeness. (W9 measured clean ~7.4s:
    workbench/N37-operator-exp/PREREG.md + probe1..6.) Banked: `cut_nhds_zero_countablyGenerated` (the C6
    eternal-approach as countable nearness), `cut_uniformity_countablyGenerated` (via comap through
    subtraction, N36 `cut_uniformity_eq`), `cut_uniformity_hasBasis_abs` (the order-native abs entourage
    basis), `cauchySeq_bddAbove_range`/`cauchySeq_bddBelow_range` (Cauchy ⟹ bounded), ★★
    `instCompleteSpaceCut` (THE TARGET — `CompleteSpace Cut`, MACHINERY on the DERIVED `Cut`, a property OF
    the derived ℝ, STANDARD §3), + non-vacuity `cut_const_tendsto_complete`/`cut_cauchySeq_const_converges`.
    ONE CAUSE: the SAME C6 eternal-approach that built the cut (N6), gave order-completeness (N33), the
    order topology + Heine–Borel (N34), the Archimedean property + monotone convergence (N35), and the
    uniform structure (N36) now closes CAUCHY COMPLETENESS — the approach is countable (so the nearness is)
    and every Cauchy approach is trapped in a compact box (so it converges). 8 decls foundations-only,
    costume C59 bites `⊢ (0:Cut) = 1` (the limit of the constant-zero Cauchy sequence asserted = 1 routes
    through `CauchySeq.tendsto_limUnder` — gated on `instCompleteSpaceCut` — and dies on Hausdorff
    uniqueness), NO posited exp/G₂/Aut/metric/CauSeq/number-system, NO Mathlib ℝ as content, NO bridge.
    (DECOMPOSED per W3/W9, childed N38.) The W1 reframe through the trunk: Cauchy completeness is the
    banked C6 eternal-approach one level up — the approach is countable so the nearness is, and the
    bounded approach is trapped in a compact box so it converges; never a ported `CauSeq` / ℝ-valued metric.

  - **✅ INCREMENT 8 (part b) LANDED (N38, `Phys/Algebra/DerivationAutOpNorm.lean`).** The Cut-VALUED
    OPERATOR NORM on the 8×8 coordinate matrices over the derived ℝ is banked — the convergence-controlling
    magnitude the operator-exp power series rides. ★ THE W1 / THE-ONE-LAW REFRAME THROUGH THE TRUNK (the
    content-trap dodge, MEASURED first): Mathlib's `Norm`/`NormedRing`/`NormedSpace` typeclass is ℝ-VALUED
    (`norm : α → ℝ`) — instantiating it would cast a Cut-valued magnitude into Mathlib's ℝ = importing ℝ as
    CONTENT (STANDARD §3, the SAME trap the metric N35→N36 and Cauchy-completeness N37 dodged). The trunk
    dodges it again: `opNorm : Matrix (Fin 8) (Fin 8) Cut → Cut` is a Cut-VALUED function built from the
    order-native `abs` on the derived ℝ + finite `Finset.sum` — pure MACHINERY on the DERIVED `Cut`, NO
    `Norm` typeclass, NO ℝ. (W9 measured clean ~2s user CPU: workbench/N38-operator-exp/PREREG.md +
    probe1..3; the submultiplicativity closes with ABSTRACT `Finset` lemmas, never `Fin 8` expansion /
    `decide` / `ring`.) THE NORM: the entrywise ℓ¹ sum `opNorm M = ∑ᵢⱼ |Mᵢⱼ|`, chosen because it is
    SUBMULTIPLICATIVE WITH NO DIMENSION FACTOR — the load-bearing property the convergence of `∑ Dⁿ/n!`
    rests on (`opNorm (Dⁿ) ≤ (opNorm D)ⁿ` for `n ≥ 1` ⟹ the series is majorized by an absolutely
    convergent geometric-over-factorial, the C6 eternal-approach as a convergent series). Banked:
    `opNorm_nonneg`, `opNorm_zero`, ★ `opNorm_eq_zero` (DEFINITENESS — a genuine norm), `entry_abs_le_opNorm`
    (dominates each entry — the N32 unit-box handle), ★ `opNorm_add_le` (triangle), ★ `opNorm_smul`
    (absolute homogeneity), ★★ `opNorm_mul_le` (SUBMULTIPLICATIVITY — the convergence seed), `opNorm_pow_le`
    (the series-term bound, `n ≥ 1`), ★ `opNorm_autMatrix_le` (`≤ 64`, the N32 unit-box: 64 entries each
    `|·| ≤ 1`), `opNorm_one` (`= 8`, non-vacuity — the norm is not the zero map, and `8 ≰ 1` is why the
    power bound needs `n ≥ 1`). ONE CAUSE: the SAME Born positivity (self-overlap) that made every
    derivation skew-adjoint (N26), forced the simple type-G₂ Lie algebra (N24/N30b), bounded every
    automorphism entry (N32) and made the automorphism group topologically compact (N34), read through the
    `abs` of the derived ℝ now gives the Cut-valued submultiplicative norm in which the exponential series
    will converge. 10 theorems foundations-only, costume C60 bites `⊢ 8 = 8 * 8` (the WRONG claim that the
    norm is MULTIPLICATIVE rather than merely submultiplicative — collapses to `8 = 64` via the banked
    `opNorm_one`), NO posited exp/G₂/Aut/metric/norm-system, NO Mathlib ℝ as content, NO ℝ-valued `Norm`
    typeclass, NO bridge. (DECOMPOSED per W3/W9, childed N39.) The W1 reframe through the trunk: the operator
    norm is the order-native `abs` of the derived ℝ summed over coordinates, never a ported ℝ-valued `Norm`.

  - **N39 — the power-series exp convergence over the derived ℝ (part c)** ✅ LANDED (DECOMPOSED per
    W3/W9, childed N40). With the Cut-valued submultiplicative operator norm banked (N38) on top of
    order-completeness (N33), Heine–Borel (N34), Archimedean/convergence (N35), the uniform structure (N36)
    and Cauchy-completeness (N37), N39 banked the CONVERGENCE half of the analytic core: the matrix
    exponential series `exp(D) = ∑ₙ (1/n!)·Dⁿ` of any 8×8 coordinate matrix over the derived ℝ is
    ABSOLUTELY CONVERGENT. ★ THE W1 / THE-ONE-LAW REFRAME (the content-trap dodge, MEASURED first, CONFIRMED):
    Mathlib's STANDARD convergence machinery is ℝ-VALUED — `Summable.of_norm_bounded`, `Summable.of_nonneg_of_le`,
    `summable_geometric_of_lt_one`, the ratio test ALL take an ℝ-valued `Norm`/`NormedRing`; using any casts
    a Cut-valued magnitude into Mathlib's ℝ = importing ℝ as CONTENT (STANDARD §3, the SAME trap the metric
    N35→N36 / completeness N37 / operator norm N38 dodged). The trunk dodges it again: every lever is a
    property OF the derived `Cut`, proved from order-completeness + order topology + Archimedean +
    Cauchy-completeness, NO ℝ-valued `Norm`. (W9 measured clean ≤ 3s user CPU each: workbench/N39-operator-exp/
    PREREG.md + probe1..11, every lever green standalone before assembly.) Two oleans: PART c·1
    `Phys/Foundation/ContinuumSummable.lean` banks the 5 scalar summability levers over the derived ℝ —
    `cut_summable_of_nonneg_of_bddAbove` (nonneg + bounded partial sums ⟹ Summable, via N33 `isLUB_csSup` +
    `hasSum_of_isLUB_of_nonneg` — the C6 eternal-approach as a convergent series), `cut_summable_of_nonneg_of_le`
    (comparison), `cut_summable_of_abs` (absolute, on the N37 complete ℝ), `cut_summable_geometric` (`0≤r<1`,
    via an inline telescope — GeomSum.olean absent from the prebuilt slice), ★ `cut_summable_pow_div_factorial`
    (THE ANALYTIC CRUX: `0≤c ⟹ Summable cⁿ/n!`, a ratio-test BY HAND dominating the tail from an Archimedean
    M>c by a geometric majorant). PART c·2 `Phys/Algebra/DerivationAutExp.lean` banks the matrix-level result —
    `matrix_summable_of_entrywise` (entrywise via `Pi.summable`, the Matrix instances LITERALLY Pi's, NO
    ℝ-norm), `expTerm` (= `(1/n!)•Dⁿ`), `expTerm_entry_abs_le` (entry bound via N38 `entry_abs_le_opNorm` +
    `opNorm_pow_le`), ★★ `expTerm_summable` (THE TARGET). ONE CAUSE: the SAME Born positivity that gave the
    submultiplicative operator norm (N38) makes the exp series absolutely convergent — the factorial outruns
    `(opNorm D)ⁿ`; the norm built to control convergence controls it. 12 theorems foundations-only, costume
    C61 bites `⊢ 1 < 1` (the WRONG claim that the divergent geometric series at ratio `1` is Summable —
    `cut_summable_geometric` discharges `0≤1` and leaves the false `(1:Cut)<1`), NO posited exp/G₂/Aut/metric/
    norm-system, NO Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`, NO bridge.

  - **N40 — the EXPONENTIAL ONE-PARAMETER SUBGROUP over the derived ℝ (the group-theoretic content of `exp`)**
    ✅ LANDED (DECOMPOSED per W3/W9 + ★ THE ONE LAW reframe, childed N41). With the matrix exponential series
    proved CONVERGENT (N39) on top of the full analytic sub-tower (N33–N38), N40 banked the GROUP LAW of the
    exponential: `expMap D := ∑' n, expTerm D n` (`Phys/Algebra/DerivationAutExpHom.lean`, the `tsum` existing
    by N37 `CompleteSpace` + N39 `expTerm_summable`) is MULTIPLICATIVE along a commuting flow —
    ★★ `expMap_mul_of_commute` (`exp(A)·exp(B) = exp(A+B)` for `Commute A B`) — whence ★ `expMap_mul_neg`/
    `expMap_neg_mul` (`exp(D)·exp(-D) = 1 = exp(-D)·exp(D)`, exp INVERTIBLE, the GL-landing) + `expMap_zero`
    (`exp 0 = 1`). ★ THE ONE LAW (RUNBOOK W5 / STANDARD §4) — WHY THE GROUP-LAW, NOT THE LITERAL `exp(D) ∈ AutO`:
    a bounded MEASUREMENT (workbench/N40-exp-aut/PREREG.md + probe1..11, each ≤ 3s) found the literal ticket
    target TYPE-INCOHERENT — the banked `AutO` is `Subgroup (O ℚ ≃ₗ[ℚ] O ℚ)` over the RATIONALS, but `exp(D)`
    has TRANSCENDENTAL Cut entries (exp of a nonzero rational derivation), so a Cut-matrix cannot be an element
    of a group of ℚ-linear equivs; there is no Cut-side `≃ₗ[Cut]`/`IsAlgAut` infrastructure banked. Returning to
    the trunk: the MATHEMATICAL CONTENT that "exp lands in the automorphism group" IS the one-parameter-subgroup
    HOMOMORPHISM LAW + INVERTIBILITY, which is Cut-native, reuses the banked N39 convergence, and has teeth.
    ★ THE W1 / CONTENT-TRAP REFRAME (MEASURED, NO ℝ-valued norm): the engine is the Cauchy product; Mathlib's
    `…_of_summable_norm` is ℝ-NORM bound (a CONTENT trap), but the TRUNK-NATIVE
    `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` needs only `[T3Space][NonUnitalNonAssocSemiring]
    [IsTopologicalSemiring]` — all synthesize on `Matrix (Fin 8) (Fin 8) Cut` with NO norm. PART 1
    (`Phys/Foundation/ContinuumSummable.lean`) banked the Cut-native product-summability engine
    (`cut_summable_of_nonneg_of_bddAbove'`/`_of_le'`/`_of_abs'` general-index, ★ `cut_summable_prod_of_nonneg`
    via `Finset.sum_mul_sum`, `cut_summable_mul_of_abs`); PART 2 banked the one-parameter subgroup
    (`matrix_prod_summable`, ★ `expTerm_antidiagonal` THE BINOMIAL CRUX via `Commute.add_pow'` +
    `Nat.choose_mul_factorial_mul_factorial`, ★★ `expMap_mul_of_commute`, the GL-landing + non-vacuity). 16
    theorems foundations-only `[propext, Classical.choice, Quot.sound]` (independently axiom-audited). ONE CAUSE:
    the SAME Born positivity that made the exp series converge (N39, the factorial outrunning the operator norm)
    is what lets the Cauchy product rearrange absolutely and the binomial identity close — convergence and the
    group law are the same self-overlap positivity read twice. Costume C62 bites `⊢ Commute A B` (the WRONG
    claim that the homomorphism law holds for ARBITRARY non-commuting matrices). NO posited exp/G₂/Aut, NO
    Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`, NO bridge.

  - **N41a — the ITERATED LEIBNIZ BINOMIAL over the non-associative octonion algebra (part a of N41)** ✅
    LANDED (DECOMPOSED per W3/W9, childed N41b). With the one-parameter subgroup banked (N40) on top of the
    convergent exp (N39) and the full analytic sub-tower (N33–N38), N41a banked the PURE-ALGEBRA CORE of the
    exponential flow's product-preservation: for a Leibniz derivation `D` of the non-associative
    `CD (CD B)` (so `O Cut`/`O ℚ` verbatim), `Dⁿ(x·y) = ∑_{k+l=n} C(n,k)·(Dᵏx · Dˡy)`
    (`iter_leibniz_range` + the antidiagonal form `iter_leibniz_antidiag` matching the downstream Cauchy
    product) — the piece needing NO topology, NO coordinates, NO completeness, only the Leibniz law +
    binomial combinatorics. `Phys/Algebra/DerivationLeibnizPow.lean`. ★ THE ONE LAW (the genuine finding):
    the SAME Leibniz bilinearity that made `Der(𝕆)` a Lie algebra at order 1 (N6 `isDeriv_bracket`, which
    used ONLY bilinearity + Leibniz, NEVER associativity) integrates to the binomial flow on a product at
    order n. ★ WHY NON-ASSOCIATIVITY IS NO OBSTRUCTION (W1 reframe): every step expands `D(u·v)` into
    `Du·v + u·Dv` by distributivity + Leibniz alone, NO associator appears — so we CANNOT use
    `Commute.add_pow'` (the route the banked matrix `expTerm_antidiagonal` used on the associative matrix
    ring) and instead use a DIRECT induction via the Leibniz split `dterm_split` (the only place `IsDeriv`
    enters) + the pure ℕ-scalar Pascal identity `pascal_smul_sum`. Non-vacuity `iter_leibniz_two` exhibits
    the genuine `C(2,1)=2` cross-term `2•(Dx·Dy)`. 6 theorems foundations-only `[propext, Classical.choice,
    Quot.sound]` (independently axiom-audited). Costume C63 bites `⊢ IsDeriv D` (the WRONG claim the binomial
    holds for an ARBITRARY endomorphism — the dropped Leibniz hypothesis). NO posited exp/`G₂`/`Aut`, NO
    Mathlib ℝ as content (`Nat.choose`/`Finset.antidiagonal` are machinery on the iteration index, the fold's
    re-entry count N7, not a content number system), NO bridge.

  - **N41b — the TOPOLOGICAL `*`-ALGEBRA STRUCTURE on `O Cut` over the derived ℝ (part b of N41)** ✅
    LANDED (DECOMPOSED per W3/W9, childed N41c; W6/W9.8 finalization-recovery of run 173). With the
    iterated-Leibniz binomial banked (N41a) + the one-parameter subgroup (N40) on the convergent exp (N39)
    and the full analytic sub-tower (N33–N38), N41b banked the FOUNDATIONAL TOPOLOGICAL GROUND the literal
    `O Cut` automorphism + derivative stand on: `O Cut = CD (CD (Dbl Cut))` is a COMPLETE UNIFORM
    TOPOLOGICAL `*`-ALGEBRA over the derived ℝ — Hausdorff (`T2`), regular (`T3`), CAUCHY-COMPLETE, with
    continuous `+`/`−`/`·`/`star`/scalar-`•`, and `IsTopologicalSemiring`. `Phys/Cascade/OctonionTopology.lean`.
    ★ THE ROUTE: each double `CD A` / rung-1 double `Dbl R` is given the COMPLETELY INDUCED uniform structure
    `UniformSpace.comap toProd` pulled back along the pair projection `toProd : CD A → A × A`; the induced
    topology = the order-pullback by `rfl` (NO topology/uniformity DIAMOND — only `UniformSpace` is defined,
    `.toTopologicalSpace` is `induced toProd` definitionally). CompleteSpace (`completeSpace_iff_isComplete_range`
    + range = univ), T2/T3 (`IsEmbedding.t2Space`/`.t3Space`), and all the continuity instances transfer
    because each coordinate of the Cayley–Dickson product/sum/conjugation is a continuous `Cut`-polynomial in
    the projections (`Continuous.add/mul/neg/star`). ★ THE NON-ASSOCIATIVITY IS NO OBSTRUCTION (W1 reframe):
    continuity is a statement about the BILINEAR product map, NOT reassociation — exactly as the derivation
    Lie algebra (N6) and the iterated Leibniz binomial (N41a) survive non-associativity using only
    bilinearity. `instIsTopologicalSemiring` gives the EXACT hypothesis shape
    `[T3Space][NonUnitalNonAssocSemiring][IsTopologicalSemiring]` the trunk-native Cauchy product
    `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` consumes, with NO ℝ-valued `Norm`. ★ ONE CAUSE (THE ONE
    LAW): the SAME Born-positivity completion that made `Cut` a complete uniform topological ring (N33–N37 —
    the C6 eternal-approach as Cauchy-completeness) propagates up every rung of the cascade unchanged. 39
    decls foundations-only `[propext, Classical.choice, Quot.sound]` (independently axiom-audited). Costume
    C64 bites `TopologicalSpace.induced CD.toProd inferInstance = ⊥` (the WRONG claim that the genuine induced
    topology on `O Cut` is the DISCRETE topology `⊥` — under which every continuity/separation theorem in the
    rung would be VACUOUS). NO posited topology/metric/exp/`G₂`/`Aut`, NO Mathlib ℝ as content, NO ℝ-valued
    `Norm`, NO bridge.

  - **N41c — the ANALYTIC INTEGRATION: the vector exp `expO` + the LITERAL `O Cut` product-preservation
    `expO D (x·y) = expO D x · expO D y` over the derived ℝ (part c of N41)** ✅ LANDED (DECOMPOSED per
    W3/W9, childed N41d; W6/W9.8 finalization-recovery of run 175 — which MEASURED the whole increment
    clean (probes ≤16s, KILL=60s never approached, the genuine analytic core confirmed elaborating in
    probe4/6) and wrote `DerivationOExp.lean` + C65 + wired Phys.lean/AxiomAudit/manifest, then timed out
    90/90 BEFORE building/gating/auditing/finalizing — NOTHING committed; this run verified-then-finalized,
    NOT a fresh build, NOT a W9.6 fossil). With BOTH the per-`n` algebraic identity (N41a iterated-Leibniz
    binomial) AND the topological ground (N41b complete topological `*`-algebra on `O Cut`) banked, N41c
    banked the analytic integration in `Phys/Algebra/DerivationOExp.lean` (14 decls foundations-only,
    independently axiom-audited): (1) THE VECTOR EXPONENTIAL `expO D x := ∑' n, (1/n!)•(Dⁿ x)` on `O Cut`
    (over the `Module Cut (O Cut)` built by transfer up the cascade, defeq to the `CD.instSMul` N41b's
    `oCut_continuousSMul` is stated over), with `expO 0 = id`; (2) the smul-centrality bundle
    `SmulCompat`/`smulCompat_oCut` (the bilinearity of `•` over `·`, lifted from the base `Dbl Cut` up
    through the two `CD` doublings — surviving non-associativity exactly as N6's bracket and N41a's binomial
    do, because each is about the BILINEAR product, never reassociation); (3) ★ `expO_term_antidiag` (THE
    PER-`n` ALGEBRAIC INTEGRATION: combine N41a `iter_leibniz_antidiag` + `C(n,k)/n!=1/(k!·l!)` + the
    smul-centrality bundle to rewrite `(1/n!)•(Dⁿ(x·y))` as `∑_{k+l=n} ((1/k!)•Dᵏx)·((1/l!)•Dˡy)`); (4) ★★
    `expO_mul_of_summable` (THE LITERAL PRODUCT-PRESERVATION `expO D (x·y) = expO D x · expO D y` for a
    Leibniz derivation `D`, passing the per-`n` identity to the `tsum` limit by the trunk-native Cauchy
    product `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` over the banked N41b `oCut_t3Space` +
    `oCut_completeSpace` + `oCut_isTopologicalSemiring`, with NO ℝ-valued `Norm`) — CONDITIONAL on three
    honest `Summable` premises (the two series + the product family), a fully proved conditional implication.
    ★ ONE CAUSE (THE ONE LAW): the SAME Leibniz bilinearity that made `Der(𝕆)` a Lie algebra (N6, order 1)
    and gave the iterated binomial (N41a, order n) integrates — once N41b's topological ground lets the
    finite identity pass to the limit — to the product-preservation of the flow (order ∞). The non-vacuity
    `expO_term_antidiag_one` exhibits the `n=1` integration collapsing EXACTLY to the Leibniz law
    `D(x·y)=D x·y+x·D y` (the derivative seed). Costume C65 bites `IsDeriv D` (the WRONG claim that the
    per-`n` exp product-integration holds for an ARBITRARY endomorphism — routing through
    `expO_term_antidiag` leaves the undischargeable `IsDeriv D`). NO posited exp/`G₂`/`Aut`/metric/norm, NO
    Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO
    bridge.

  - **N41d — the CUT-SIDE COORDINATIZATION + the UNCONDITIONAL SUMMABILITY of the `O Cut` vector exp
    series over the derived ℝ (part d of N41)** ✅ LANDED (DECOMPOSED per W3/W9, childed N41e; W6/W9.8
    finalization-recovery of run 177 — which MEASURED the increment clean (probes ≤16s, KILL=60s never
    approached) and COMMITTED `DerivationOExpSummable.lean` + wired Phys.lean/AxiomAudit (commit 7a00fcb)
    but timed out 90/90 BEFORE building/gating/auditing/finalizing (no costume, no manifest, no gate, no
    LEDGER/ROADMAP) — the recurring N28–N41c finalization-miss; this run verified-then-finalized (built
    the olean clean 3388 jobs, independently axiom-audited all 11 decls, added the missing costume C66 +
    manifest row, gated D0–D6 green), NOT a fresh build, NOT a W9.6 fossil — all 11 proofs lightweight
    `ext`/`simp`/`induction`). N41d banked THE GENUINE HARD CORE the N41c retrospective isolated as "the
    gating dependency for everything below", in `Phys/Algebra/DerivationOExpSummable.lean` (11 decls
    foundations-only, independently axiom-audited via /tmp/n41d_axcheck.lean against the built olean): (1)
    `coordOCut : O Cut ≃ₗ[Cut] (Fin 8 → Cut)` — the Cut-side coordinate frame (the `![e0..e7]` of the
    nested `.re/.im` projections, the analogue of the banked ℚ-side `coordO`/`bO`, now over the derived ℝ),
    CONTINUOUS both ways over the N41b uniform topology (`coordOCut_continuous`/`coordOCut_symm_continuous`
    via the banked `CD.continuous_re/im` + `Dbl.continuous_re/im`); (2) `derivMatrix D' := toMatrix'
    (coordOCut.conjRingEquiv D')` + ★ `expO_matrix_rep` (THE POWER TRANSPORT `coordOCut ((D'ⁿ) x) =
    (derivMatrix D')ⁿ *ᵥ coordOCut x`, via `map_pow` of `toMatrixAlgEquiv'` + `map_pow` of `conjRingEquiv`
    + `toMatrix'_mulVec`); (3) `expO_term_coord` (the `n`-th term to the banked N39 `expTerm`) +
    `mulVecHom`/`mulVecHom_continuous` (`(· *ᵥ v)` a continuous AddMonoidHom — the summability transport
    vehicle); (4) ★★ `expO_summable` (THE TARGET — the UNCONDITIONAL `Summable (fun n => (1/n!)•((D'ⁿ) x))`
    for a `Cut`-linear endomorphism `D'`: its image under the continuous `coordOCut` is `n ↦ expTerm
    (derivMatrix D') n *ᵥ coordOCut x`, summable by the banked N39 `expTerm_summable.map mulVecHom`;
    transported back by the continuous `coordOCut.symm`) + `expO_summable_restrict` (carrying it to the
    `ℤ`-restriction `D'.restrictScalars ℤ` — same underlying powers — the form N41c's `expO` consumes), +
    non-vacuity `expO_summable_one`. ★ ONE CAUSE (THE ONE LAW): the convergence of the octonion-valued
    vector series is not bashed analytically on the non-associative `O Cut` — it is DISSOLVED THROUGH THE
    TRUNK, reduced through the Cut-side coordinate frame (the same Born-positive structure the cascade
    provides) to the already-banked convergence of the matrix series majorized by the `Cut`-valued operator
    norm `opNorm = ∑ᵢⱼ|Mᵢⱼ|`; the convergence of the matrices (N39, the factorial outrunning `(opNorm M)ⁿ`)
    and of the vectors are the same C6 eternal-approach read through the coordinatization. Costume C66
    (`DerivationOExpSummableNoFactorialCostume`) bites `factorial.*=.*x` (the WRONG claim that the
    UN-normalized series `n ↦ (D'ⁿ) x` — the `1/n!` factorial that makes the majorant converge DROPPED — is
    `Summable`; routing through `expO_summable` via `.congr` leaves the false per-term identity
    `(1/n!)•((D'ⁿ) x) = (D'ⁿ) x`). NO posited exp/`G₂`/`Aut`/metric/norm, NO Mathlib ℝ as content, NO
    ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO bridge.

  - **N41e — the OCTONION-PRODUCT-FAMILY SUMMABILITY `hxy` + the DISCHARGE to the UNCONDITIONAL LITERAL
    `O Cut` PRODUCT-PRESERVATION `expO D (x·y) = expO D x · expO D y` over the derived ℝ (part e of
    N41)** ✅ LANDED (DECOMPOSED per W3/W9, childed N41f). Run 179 froze the PREREG GO(decompose): the
    exact-DECOMPOSITION route (NOT the nlinarith inequality bound, which hit the W9 wall as predicted) was
    MEASURED clean — all 8 product coordinates verified (`probe_verify8`, 8s, `simp[CD/Dbl mul/add/neg/star]
    + ring`), the coordinate-sequence summability (`probe_coordsum`, 9s), the leaf `cut_summable_mul_of_abs`
    (`probe_exact0`, 8s), KILL=60s never approached — but run 179 timed out 90/90 BEFORE writing the
    production file. This run (run 180) lifted the measured proof forms into production: the full assembly
    compiled clean ~12s on the first real `lake build` (3390 jobs), NO inflated maxHeartbeats, then
    independently axiom-audited, costumed (C67), gated D0–D6 green (66/66 costumes, 712 audited theorems),
    LEDGER/ROADMAP finalized — the N28–N41d finalization-miss NOT repeated. N41e banked, in
    `Phys/Algebra/DerivationOProductPreserving.lean` (6 decls foundations-only, independently axiom-audited
    via /tmp/n41e_axcheck.lean against the built olean): (1) `oCut_term_abs_summable` — each coordinate
    sequence `k ↦ |(coordOCut ((1/k!)•((D'ᵏ) x))) i|` is absolutely summable (its coordinate image, banked
    `expO_term_coord`, is a finite `Cut`-combination of the banked N40 entrywise factorial majorants
    `expTerm_entry_abs_summable`; comparison `cut_summable_of_nonneg_of_le` over the abs-triangle bound);
    (2) `oCut_prod_leaf` — a product of two coordinate-projection sequences is summable over `ℕ×ℕ` (banked
    `cut_summable_mul_of_abs`); (3) ★★ `oCut_prod_summable` — THE GENUINE HARD CORE: the `hxy` octonion-
    PRODUCT-family `(k,l) ↦ a k · b l` is summable. THE ONE LAW / the dissolution: the non-associative
    product is NOT bashed — each product coordinate `coordOCut (a·b) m` reduces, through the SAME coordinate
    frame N41d built, to a FINITE signed sum of `(coordOCut a) i · (coordOCut b) j` (the octonion
    multiplication expanded ONCE via the banked `@[simp]` CD/Dbl `mul_re`/`mul_im`/`add_*`/`neg_*`/`star_*`
    + `ring`), each a `Summable.add`/`.sub` of the `oCut_prod_leaf` leaves; `Pi.summable` assembles the 8
    coordinates, the continuous `coordOCut.symm` transports back to `O Cut` — NO structure-constant table,
    NO new analysis; (4) ★★★ `expO_mul` — THE UNCONDITIONAL LITERAL PRODUCT-PRESERVATION
    `expO (D'.restrictScalars ℤ) (x·y) = expO (…) x · expO (…) y` for a `Cut`-linear `D'` whose
    `ℤ`-restriction is a Leibniz derivation: feeds `expO_summable_restrict` (the two single-variable series,
    banked unconditional N41d) + `oCut_prod_summable` (the product family) into the banked N41c
    `expO_mul_of_summable`, discharging all THREE summability premises — the only remaining hypothesis is
    the Leibniz law, the defining property of the class; (5) `restrictScalars_pow_apply` (the `ℤ`-restriction
    power = the `Cut`-power pointwise) + non-vacuity `expO_mul_zero` (the zero endomorphism's `ℤ`-restriction
    is a Leibniz derivation, inhabiting the hypothesis class). ★ ONE CAUSE: the SAME Born positivity that
    gave the operator norm (N38), the convergent matrix series (N39) and the unconditional vector-exp
    summability (N41d) carries, through the coordinate frame, to the summability of the octonion PRODUCT
    family; the product law of the exponential flow rests on the same C6 eternal-approach. Costume C67
    (`DerivationOProductPreservingDropFactorialCostume`) bites `factorial.*=.*coordOCut` (the WRONG claim
    that the coordinate sequence of the UN-normalized power series `k ↦ (D'ᵏ) x` — the `1/k!` factorial
    DROPPED — is absolutely summable; routing through `oCut_term_abs_summable` via `.congr` leaves the false
    `|coordOCut ((1/k!)•((D'ᵏ) x)) i| = |coordOCut ((D'ᵏ) x) i|`). Physics-words-removable: delete
    "exp/derivation/automorphism" → the convergent power series `∑(1/n!)•Dⁿ` of a Leibniz endomorphism of
    the 8-dim non-associative complete-topological `*`-algebra over the derived ℝ preserves the product
    unconditionally (an algebra endomorphism). NO posited exp/`G₂`/`Aut`/metric/norm, NO Mathlib ℝ as
    content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO bridge.

  - **N41f — LANDED (run 182, DECOMPOSED per W3/W9 — the AUTOMORPHISM banked, the derivative childed
    N41g).** Built `Phys/Algebra/DerivationOAutomorphism.lean` (12 decls, foundations-only
    `[propext, Classical.choice, Quot.sound]`, independently axiom-audited, gate D0–D6 green / costume C68,
    committed 8bff5f6). ★★★ THE EXPONENTIAL OF A LEIBNIZ DERIVATION IS A GENUINE Cut-SIDE ALGEBRA
    AUTOMORPHISM of the non-associative octonion algebra `O Cut` over the derived ℝ — `Cut`-linear (a
    `≃ₗ[Cut]`, `expOEquiv`), structure-preserving (banked N41e `expO_mul`), unital (`expO_one`), invertible
    with inverse `expO (-D)` (`expOEquiv_symm_apply`). ★ THE ONE LAW (matrix-transport, reframe through the
    trunk): the `Cut`-linearity and invertibility are NOT bashed over the non-associative product — they
    transport, through the SAME N41d coordinate frame `coordOCut`, to the banked N40 MATRIX one-parameter-
    subgroup law `expMap_mul_neg`. `coordOCut_expO` (the W9-exposed crux, MEASURED 8s) is the INTERTWINING
    `coordOCut (expO D x) = expMap (derivMatrix D') *ᵥ coordOCut x` (the `tsum` analogue of the banked
    per-power `expO_matrix_rep`); `expOLin` is the MANIFESTLY `Cut`-linear `coordOCut.symm ∘ₗ
    mulVecLin (expMap M) ∘ₗ coordOCut`, equal to `expO` by `coordOCut_expO` (the `Cut`-linearity FOR FREE
    from the coordinate frame); `expOEquiv = LinearEquiv.ofLinear (expOLin D') (expOLin (-D'))`, the
    composition identities collapsing through `Matrix.mulVec_mulVec` + `derivMatrix_neg` to `expMap_mul_neg`/
    `expMap_neg_mul` (the inverse of the flow is the flow of the NEGATED derivation); `expO_one` is unital
    via `deriv_one_eq_zero` (a Leibniz derivation kills the unit); `expOEquiv_isAlgAut` is the HEADLINE
    `IsAlgAutCut (expOEquiv D')`. ★ ONE CAUSE: the SAME Born positivity that gave the operator norm (N38),
    the matrix series (N39), the matrix one-parameter subgroup (N40), and the unconditional product law
    (N41e) now closes the GROUP structure — `Der(𝕆)` integrates to `Aut(𝕆)`. Costume C68
    (`DerivationOAutomorphismWrongInverseCostume`) bites `expOLin D'. x = .expOLin` (the WRONG involution
    `expOLin D' (expOLin D' x) = x`, FALSE unless `D'=0` — the group inverse is `expO (-D)`, not `expO D`).
    Physics-words-removable: delete "exp/derivation/automorphism" → the convergent power series `∑(1/n!)•Dⁿ`
    of a Leibniz endomorphism of the 8-dim non-associative complete-topological `*`-algebra over the derived
    ℝ is a `Cut`-linear structure-preserving bijection (an algebra automorphism), invertible with inverse the
    series of `-D`. NO posited exp/`G₂`/`Aut`/metric/norm, NO Mathlib ℝ as content, NO ℝ-valued `Norm`, NO
    Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`, NO bridge.

  - **N41g — `d/dt exp(tD)|₀ = D`, THE `Der → Aut` TANGENT HALF over the derived ℝ** (the immediate
    forward node, childed onto the chain tail). N41f banked THE AUTOMORPHISM (the group end of
    `Der(𝕆) → Aut(𝕆)`). What remains, over the derived ℝ (the ⚠ STANDING DEPENDENCY GATE: NEVER
    `import Mathlib.Data.Real`): the TANGENT half `d/dt exp(tD)|₀ = D` — the `n=1` term of the series, the
    rest `o(t)` — a trunk-native `Tendsto` of the difference quotient `(expO (t•D) x − x)/t → D x` as
    `t → 0` over the N36 uniform structure, NOT Mathlib `HasDerivAt` (which needs a `NormedField`-valued
    derivative = an ℝ-content trap). THE REDUCTION IS CLEAN (measured run 182):
    `(((t•D').restrictScalars ℤ)^n) x = t^n • (D'^n x)` (via `smul_pow`), so `coordOCut (expO (t•D) x) =
    expMap (t • derivMatrix D') *ᵥ coordOCut x`, reducing to the ENTRYWISE matrix-exponential derivative
    `d/dt expMap(tM)|₀ = M`. THE GENUINE OBSTRUCTION (why it is its own node): the banked trunk-native limit
    infrastructure over `Cut` is SEQUENCE-only (`cut_tendsto_atTop_ciSup`/`ciInf`/`isLUB`,
    `tendsto_const_nhds`, the N37 Cauchy-completeness — all `atTop` over ℕ); there is NO banked
    continuous-parameter `𝓝[≠] 0` difference-quotient / function-limit-at-a-point machinery, and NO banked
    remainder-tail bound `∑_{n≥2} t^n M^n/n! = O(t²)` with the order-topology squeeze. Building that
    trunk-native continuous-limit + tail-squeeze infrastructure (W1 "our library lacks the structure →
    BUILD it", NOT a fight with the theory — the reduction is clean) is the dedicated analytic node N41g.
    It COMPLETES the Lie-algebra ↔ Lie-group correspondence; the SU(3) ⊂ G₂ / 7 = 3 ⊕ 3̄ ⊕ 1 colour
    branching is downstream of the banked automorphism. Decompose aggressively — never import Mathlib ℝ or
    assert a `HasDerivAt` without a proof.


  - then mixing, spacetime signature — each specified only after its predecessor lands.


**Why we stop the spec here:** a roadmap that dictates the full derivation in advance is a
hardcoded solution. The agent earns each node, and the next target is specified against what
the chain actually produced — not against what we guessed it would. The fold is the start of
all physics; we let it unfold and specify the next target from the ground it actually creates.
