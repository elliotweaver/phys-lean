# N120 PREREG — frozen GO/NO-GO + KILL before compute

## The node
N120 — THE GLOBAL OCTONION-BLOCK EXHAUSTION ASSEMBLY (the heavy group-manifold core).
ROADMAP §N120 FORWARD FRONTIER: assemble the per-axis factorization (N117/N118
`octDeflate_factorization`) + the rank-DROP restriction (N119 `isom_fixes_mapsTo_ePerp`/
`isomRestrict`/`ePerp_finrank`) into the FULL induction. Priority order:
 (i)(a) abstract ePerp finrank-recursion tower; (i)(b) finite 7-imaginary-basis enumeration;
 immediately-bankable fallback: a BOUNDED two-/three-axis exhaustion, OR the finrank-recursion
 scaffold lemma; (ii) operator topology over Cut.

## MEASURE-FIRST findings (before compute, from reading the banked chain)
1. TYPE SEAM. The per-axis factorization `octDeflate_factorization` lives on `Module.End Cut STVC`
   (STVC = Cut × Cut × O Cut); the rank-DROP restriction `isomRestrict`/`isom_fixes_mapsTo_ePerp`
   lives on `O Cut →ₗ[Cut] O Cut` with `gFormC`. To run the global induction one must connect them.
2. SUBSPACE-PRESERVATION OBSTRUCTION (route (a)). A bisector reflection of two vectors lying inside
   a subspace W ⊆ O Cut need NOT preserve W — so the abstract ePerp-recursion does not directly
   recurse with the EXISTING octDeflate reflections; the per-step reflection-within-subspace is the
   genuine hard core. → route (a) RESISTS as a one-run bank.
3. NO Cut-BASIS (route (b)). `finrank_O_eq_eight` is only over ℚ (`Module.finrank ℚ (O ℚ) = 8`),
   NOT over Cut, and NO Cut-basis of O Cut is banked. Building a Cut-basis + "fixes all 7 imaginary
   axes ⟹ id" is itself a heavy node. → route (b) RESISTS as a one-run bank.
4. THE CLEAN FORWARD PIECE (the missing connective tissue, the bounded two-axis exhaustion). The
   reflection identity `octRefl_reflect_imag` (banked N117): for imaginary m,v,
   `m·(v·m) = (gFormC m m)•v − (2·gFormC v m)•m`. With m = the normalized bisector n = r⁻¹•(e−w)
   (gFormC n n = 1, octBisector_unit) and an axis e₀ ⊥ n (gFormC e₀ n = 0), the m-line term
   VANISHES: `n·(e₀·n) = e₀`. So the bisector reflection octDeflate e w FIXES any axis e₀ orthogonal
   to its bisector e−w. THIS is exactly why Cartan–Dieudonné's induction stays inside the orthogonal
   complement — the second reflection preserves the first fixed axis. Composing two peels gives the
   bounded TWO-AXIS exhaustion + the two-reflection factorization, fully DERIVED.

## THE TARGET (the immediately-bankable structural piece — ROADMAP-named fallback)
THE ORTHOGONAL-AXIS-PRESERVING REFLECTION + BOUNDED TWO-AXIS EXHAUSTION:
  D1. `octDeflate_fixes_orthogonal_axis` — if gFormC e₀ (e−w) = 0 then
      octDeflate e w (0,0,e₀) = (0,0,e₀). [octRefl_reflect_imag + octBisector_unit; the reflection
      fixes the bisector's Born-orthogonal complement — the descent-stays-in-complement content]
  D2. the two-axis composite octDeflate e' w' · octDeflate e w · T fixes BOTH (0,0,e) and (0,0,e')
      under: T moves e→w, (R·T) moves e'→w', and e ⊥ bisector(e',w') (so the 2nd reflection preserves
      the 1st fixed axis).
  D3. the two-reflection factorization T = octDeflate e w · octDeflate e' w' ·
      (octDeflate e' w' · octDeflate e w · T) [from the two banked involutions].
  W8. concrete non-vacuous witness: e₀ = ke2je2 is FIXED by octDeflate e₂ je2 (ke2je2 ⊥ e₂−je2 since
      ke2je2 mutually-anticommutes with both e₂, je2 ⟹ Born-orthogonal); the deep coordinate reads
      ke2je2 back. Costume C152 bites a WRONG orthogonal-axis-preserving / two-axis coordinate.

## GO / NO-GO
- GO if D1 (the orthogonal-axis-preserving reflection) compiles clean DERIVED, foundations-only,
  with the concrete non-vacuous witness — bank it + the two-axis factorization that follows from it,
  child the global remainder (the full abstract finrank-recursion assembly / operator topology).
- NO-GO / DECOMPOSE further if even D1 resists: bank the smallest clean lemma, child the rest.
- NOT on the menu: grinding the full Cartan–Dieudonné global assembly (routes a/b) into a timeout;
  weakening; bridging; positing a Lorentz/orthogonal group.

## KILL (W9 instrument-failure budget)
- KILL = 90s per single obligation in isolated `lake env lean`. If any obligation exceeds 90s it is
  an INSTRUMENT failure (W9): measure/decompose/reframe through the trunk, NOT a longer grind.
- Expect each obligation to be a structural rewrite through octRefl_reflect_imag + gFormC bilinearity
  (no brute, no native_decide, no inflated maxHeartbeats). If a brute appears → reframe.
- Checkpoint ~50% turns; bank-as-you-go the instant a lemma compiles; FINALIZE (commit + gate-bg +
  child + complete) with turns AND iterations to spare. Single-flight: child N121 on the chain tail.

## ANTI-DRIFT (THE ONE LAW)
Rather than grind the global surjectivity or build an operator topology Mathlib lacks over Cut, the
descent-stays-in-complement connective lemma (the genuine reason the induction terminates inside the
orthogonal complement) is isolated and banked DERIVED; the heavy global assembly is honestly childed.
