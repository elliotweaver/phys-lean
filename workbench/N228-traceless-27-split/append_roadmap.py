block = '''

## ✅ N228 LANDED — THE FINER SPLIT OF THE SYMMETRIC 28: `Sym²7 = 1 (trivial rep, ℚ·id) ⊕ 27 (traceless-symmetric)` as g₂-modules — the LAST irreducible piece of `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` (still-deeper cut of N219–N227, under the OVERNIGHT LOCK)

**Banked** (`Phys/Algebra/TowerGatherTracelessSym27.lean`, 15 decls foundations-only;
costume C260 `27 = 260`; production olean build 19s, full Phys build 35s / 3662 jobs):

N227 banked the whole split `End ℚ ImO = Sym²7 (28) ⊕ Λ²7 (21 = so(7))` and ISOLATED the trivial rep
`1 = ℚ·id` inside the symmetric side (`one_mem_selfAdj`, `one_adEnd_zero`), but never split the 28
itself. N228 splits `Sym²7 = 1 ⊕ 27` on the banked tower and proves it a decomposition of g₂-MODULES —
completing all four irreducibles of `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`.

THE OBJECT (derived, not posited). On `End ℚ ImO` with the banked `selfAdjointSubmodule bornBil`
(= `Sym²7`, N227) and the Mathlib trace functional `LinearMap.trace ℚ ImO` (MACHINERY on the derived
`ImO`):
- **`trivialLine := ℚ ∙ (1 : Module.End ℚ ImO)`** — the trivial rep line (the metric `ℚ·id`).
- **`tracelessSym := selfAdjointSubmodule bornBil ⊓ LinearMap.ker (LinearMap.trace ℚ ImO)`** — the 27.
- **`trace_one_eq_seven`** — `trace 1 = 7` (Mathlib `trace_one` + banked `finrank_ImO = 7`, N22).
  Hence `one_ne_zero_End` (`(1 : End) ≠ 0`, char 0) and `finrank_trivialLine = 1`
  (`finrank_span_singleton`).
- **`trivialTracefree_isCompl_in_selfAdj`** — ★★★ THE FINER DECOMPOSITION: `trivialLine ⊓ tracelessSym
  = ⊥` (`trivialTracefree_disjoint`: a `c•1` of trace 0 forces `7c = 0 ⇒ c = 0`, char 0) and
  `trivialLine ⊔ tracelessSym = selfAdjointSubmodule bornBil` (`trivialTracefree_span`: a self-adjoint
  `φ` of trace `t` splits `φ = (t/7)•1 + (φ − (t/7)•1)`, first in the line, second self-adjoint AND
  traceless). `Sym²7 = 1 ⊕ 27`.
- **`finrank_tracelessSym_eq_27`** — ★★ the traceless-symmetric side has finrank `27` (`28 − 1`) via
  `Submodule.finrank_sup_add_finrank_inf_eq` + banked `finrank_selfAdj_eq_28` (N227). `28 = 1 + 27`.
- **`trivialLine_adEnd_inv`** / **`tracelessSym_adEnd_inv`** — ★★ both pieces g₂-stable under
  `adEnd D : X ↦ ⁅imRep D, X⁆`: `adEnd D` kills the line (banked `one_adEnd_zero`, N227); the
  self-adjoint side is preserved (banked `selfAdj_adEnd_inv`, N227) AND the trace of a commutator
  vanishes (Mathlib `trace_lie`), so `ker(trace)` — and the intersection — is preserved.
- **`one_mem_trivialLine`** — W8 non-vacuity (`1 ∈ trivialLine`); `finrank_tracelessSym_eq_27` (27 > 0).
- Capstone **`traceless_sym_27_structure`** bundles the finer isCompl-within-`selfAdj` + dims (1, 27,
  28) + both g₂-submodules.

ONE CAUSE, THE LAST FACE. The same Born POSITIVITY that (N223–N227) made `so(7)` the skew half and
split `End` symmetric/antisymmetric is precisely the metric whose TRACE (the derived `finrank ImO = 7`)
isolates its own line `ℚ·id` inside the symmetric side; the traceless complement is the last
irreducible `27`. All four g₂-modules of `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` are now explicit on the banked
tower.

**W9:** a LIGHT node — probe1 measured all 6 key obligations clean (`trace_one`+`finrank_ImO` ⇒ 7,
`finrank_span_singleton` on End ℚ ImO, `trace_lie` closing the ker(trace) g₂-invariance,
`finrank_sup_add_finrank_inf_eq`, `mem_ker`) BEFORE writing production; production olean build 19s,
full Phys build 35s (3662 jobs), 13 theorems independently axiom-audited 13/13 foundations-only vs the
built olean, costume bite `⊢ 27 = 260` (exit 1). Every obligation structural over banked facts
(`selfAdjointSubmodule bornBil`/`one_mem_selfAdj`/`one_adEnd_zero`/`finrank_selfAdj_eq_28`/
`selfAdj_adEnd_inv`/`adEnd` N227, `finrank_ImO` N22) + Mathlib trace/finrank MACHINERY. NO coordinate
ring, NO degree-4 expansion, NO maxHeartbeats proof-search raise (kept the N227 synthInstance ceiling
for the ℚ-End instance diamond).

**§N228-superseded forward frontier — next (childed N229, single-flight tail).** UNDER THE OVERNIGHT
LOCK the chain STAYS ON THE GATHER. All four g₂-modules of `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27` are now explicit
on the banked tower (`Λ²7 = so(7) = 14 ⊕ 7`, N225/N226; `Sym²7 = 28 = 1 ⊕ 27`, N227/N228): EITHER the
g₂-equivariant projector `End ℚ ImO → so(7)` along `Sym²7` (`selfSkew_isCompl.projection`, the
retraction of `End` onto the banked so(7), commuting with `adEnd D`); OR the DUAL projector so(7) →
imRep(g₂) along crossEmb(7) (`1 − projFun`) + the g₂-module ISO `so(7) ≃ 14 ⊕ 7` as an explicit
LinearEquiv/g₂-equivariant equivalence; OR the trace/metric form as an explicit g₂-invariant
`bornBil`-pairing on `Sym²7` isolating the 27 as the kernel of a g₂-invariant functional; OR the
`Phase/` category track NAMING the sheaf-like local→global obstruction ABOVE the concrete `Phys/`
cocycle (Phase/ cites Phys/, never the reverse; the Phys/ magnitude proof stands ALONE); OR the
owner-authorized PHYSICAL reading (GRAVITY / MATTER / DARK) on the banked tower; OR a module-level
world-notion. MEASURE the smallest obligation of each front BEFORE committing (W9); posit nothing; NO
carrier-agnostic / free-floating result (the magnitude theorem's TYPE must mention the banked tower
objects `O ℚ` / `crossEmb` / `imRep` / `bornBil` / `projFun` / `bAdj` / `adEnd` / `trivialLine` /
`tracelessSym` / `selfAdjointSubmodule bornBil` / `assoc` / `gluingDefect` / `ImO`); keep the strand
UNBROKEN. If a gather front needs a not-yet-banked structural fact, NAME it and child a route-finding
node TOWARD THE GATHER. ⛔ The hypercharge ascent / Freudenthal sharp / Peirce / isospin /
gauge-completion fronts remain FORBIDDEN while the lock stands.
'''
with open("docs/ROADMAP.md", "a") as f:
    f.write(block)
print("appended N228 LANDED block")
import subprocess
print(subprocess.run(["wc","-l","docs/ROADMAP.md"],capture_output=True,text=True).stdout)
