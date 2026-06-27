# PREREG — N89: THE COMPOSITION-ADJOINT LEMMA + THE COMPACT PART k WITH k*k = 1 + POLAR RECONSTRUCTION

Frozen BEFORE compute. KILL classifies a fight as INSTRUMENT failure, not theory.

## TARGET (forced by the chain, ROADMAP §N89 frontier (i)+(ii))
Over the derived ℝ `Cut` + the terminal algebra `O Cut`, banked N49–N88:

(i) THE COMPOSITION-ADJOINT LEMMA (the missing prerequisite N88's frontier flagged):
    `IsEvCAdjoint a a'` + `IsEvCAdjoint b b'` ⟹ `IsEvCAdjoint (a.comp b) (b'.comp a')`.
    Two adjunction steps, pure EvC rewriting:
    `EvC ((a∘b) p) q = EvC (a (b p)) q = EvC (b p) (a' q) = EvC p (b' (a' q)) = EvC p ((b'∘a') q)`.

(ii) THE COMPACT PART k := g∘(p^{1/2})⁻¹ WITH k*k = 1 (the orthogonal/compact factor of g = k·p^{1/2}).
    For `IsEvCAdjoint g h`, `g` injective: N88 `comp_specInverse_exists` gives the orthonormal
    family `u`, eigenvalues `0 < c i`, `h∘g = specOpN c u`, and the two-sided concrete inverse
    pinv := specOpN ((cutSqrt∘c)⁻¹) u of psqrt := specOpN (cutSqrt∘c) u.
    Define k := g.comp pinv.
    The EvC-adjoint of k is kadj := pinv.comp h, BECAUSE:
      - pinv is EvC-self-adjoint (specOpN_isEvCSymm) ⟹ IsEvCAdjoint pinv pinv;
      - IsEvCAdjoint g h (given);
      - composition-adjoint (i): IsEvCAdjoint (g.comp pinv) (pinv.comp h)  [a=g,a'=h,b=pinv,b'=pinv].
    Then kadj∘k = pinv∘h∘g∘pinv = pinv∘(specOpN c u)∘pinv = pinv∘psqrt∘psqrt∘pinv
      (since specOpN c u = psqrt∘psqrt = specOpN (cutSqrt∘c)·(cutSqrt∘c) u by specOpN_comp + cutSqrt_sq)
      = (pinv∘psqrt)∘(psqrt∘pinv) = id∘id = id  (the two-sided inverse N88).
    So k*k = id, i.e. `(pinv.comp h).comp (g.comp pinv) = LinearMap.id`. THE COMPACT PART.

(iii) POLAR RECONSTRUCTION (the real payoff — the assembly g = k·p^{1/2}):
    g = k∘psqrt, i.e. `(g.comp pinv).comp psqrt = g`, because pinv∘psqrt = id (N88), so
    g∘pinv∘psqrt = g∘(pinv∘psqrt) = g∘id = g. So an injective g with an EvC-adjoint factors
    g = k∘psqrt with k EvC-adjoint-orthogonal (k*k = id) and psqrt = positive operator square root.

## GO / NO-GO
- GO if (i) compiles (almost certainly trivial) AND at least the compact part (ii) k*k = id compiles
  foundations-only over the g*g-family, AND a non-vacuity witness (3•id) yields a concrete k with k*k=1.
- STRETCH GO: also bank the polar reconstruction g = k∘psqrt (iii) — the genuine assembly payoff.
- NO-GO / DECOMPOSE if the compact part k*k = id resists after measure+reframe: bank (i) the
  composition-adjoint lemma alone (the immediately-bankable structural piece), child the compact part.
- This does NOT touch CONNECTEDNESS / global reverse KAK surjectivity / SO(9) exhaustion — those
  are the remaining HEAVY core, childed N90 regardless.

## KILL (W9 instrument budget)
- KILL = 180s / single obligation. If any one lemma's `lake env lean` probe exceeds 180s, STOP:
  it is an INSTRUMENT failure (framing wrong), NOT a theory failure. Measure the smallest
  sub-obligation, decompose, reframe through banked identities (specOpN_comp_two, the two-sided
  inverse). Do NOT inflate maxHeartbeats. Do NOT brute a coordinate monolith.
- Expectation: ALL pieces LIGHT (pure EvC/specOpN rewriting on banked lemmas, no coordinate bash).
  Probe family target < 20s each with imports warm. If a piece is heavy, the framing is wrong.

## ANTI-VACUITY (W8) — costume C120
The new costume MUST bite a WRONG compact-part / k*k=1 / composition-adjoint / polar-reconstruction
claim, reducing to a FALSE numeric DISTINCT from the banked battery (… C115 1=7, C116 4=13,
C117 36=9, C118 21=1, C119 16=1). Plan: a wrong k*k reading at an eigenblock — e.g. claim
k*k = psqrt∘psqrt = specOpN c u (eigenvalue, NOT id) so the eigenblock reads the eigenvalue (say
the banked mixB value) instead of 1; or a wrong composition-adjoint orientation reading a wrong
eigenblock value. Pick a false numeric ≠ {7,13,9,1,16}, e.g. `25 = 1` or `5 = 1`.

## STANDARD (the only bar)
- UNBROKEN: every object from banked N49–N88 ← derived ℝ Cut ← the fold. No posit but the fold.
- COMPLETE: #print axioms ⊆ {propext, Classical.choice, Quot.sound}, verified against built olean.
- WORDS-REMOVABLE: delete Lorentz/boost/rotation/compact/orthogonal/polar/KAK/Cartan/spectral/
  eigen*/adjoint/square-root/inverse/isometry/Spin/SO(9)/self-adjoint/positive-definite →
  pure linear-algebra over the derived complete ordered field Cut + the positive-definite form EvC.

## ROUTE LOG (anti-circling)
- (none yet)
