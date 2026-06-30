# N197 — FINDINGS (front measurement, frozen reasoning)

## DECISIVE MEASUREMENT (probe1.lean, 7.6s, clean foundations-only, 7 lemmas)

FRONT CHOSEN: **(i) THE RELATION BETWEEN THE TWO BANKED DECOMPOSITIONS OF THE 7** —
colour complex structure J=L_{u1} (N42c) vs isospin action innerDeriv (N187/N191).

### The structural punchline (genuinely NEW, NOT a re-pin)
- ★ `u1 = iotaO hI` — THE colour complex unit u1 (N42c, JO z = u1·z) IS the O-embedding
  of the isospin Cartan generator hI = ιJ (N184). The two decompositions of the SAME 7 are
  built on the SAME element, read two ways.
- ★ THE COMMUTATOR LAW (`commutator_innerDeriv_JO`): for imaginary q,
    innerDeriv q (JO z) = (innerDeriv q u1)·z + JO(innerDeriv q z)
  — i.e. [innerDeriv q, JO] = L_{innerDeriv q (u1)}. PURE Leibniz (innerDeriv is a derivation,
  JO is left-mult by u1). NO associativity, NO coordinate bash.
- ★ `innerDeriv_u1`: innerDeriv q u1 = iotaO(adHom q hI). So the obstruction to commuting is
  EXACTLY the isospin bracket [q, hI] embedded.
- ★ THE DICHOTOMY (the colour⊗isospin entanglement, derived):
    - `innerDeriv_hI_u1`: innerDeriv hI u1 = 0  — the Cartan generator hI PRESERVES the colour
      complex structure J ([hI,hI]=0). So J commutes with the isospin Cartan.
    - `innerDeriv_hJ_u1`: innerDeriv hJ u1 = iotaO(-2•hK) ≠ 0 (W8 `hK_ne_zero`) — the OFF-Cartan
      isospin generators ROTATE the colour structure J. So J does NOT commute with full su(2).
  ⟹ The colour complex structure and the isospin su(2) DO NOT commute as operators; they
  intersect exactly along the isospin Cartan u(1) = ⟨hI⟩. This is the genuine relational content
  the field reads off colour⊗isospin BY HAND.

### Why this is RIGHT (anti-W8, anti-re-pin)
- NOT a re-pin of either branching: it is the CROSS-relation [J, isospin], never banked.
- NOT vacuous: the commutator is genuinely NONZERO on hJ/hK (entangled) AND genuinely ZERO on
  hI (Cartan-preserved) — a real dichotomy with teeth, not "all commute" or "all fail".
- NOT trivial-from-associativity: O ℚ is NON-associative; the law uses the DERIVATION property
  (Leibniz) of innerDeriv, not base associativity. The commutator = L_{D(u1)} is the genuine
  derivation-vs-left-mult identity.
- NO ℚ/ℤ bridge needed: JO (ℚ-linear) and innerDeriv (ℤ-linear) are BOTH additive endos of O ℚ;
  the identity is an equation of O ℚ elements, computed directly.

## TARGET FOR PRODUCTION (the full clean statement)
Bank the general commutator law + innerDeriv_u1 + BOTH dichotomy lemmas + the
Cartan-characterization: innerDeriv q u1 = 0 ⟺ adHom q hI = 0 (q commutes with hI), and the
sharper "the colour structure is preserved by the isospin generator iff that generator is in
the Cartan ⟨hI⟩-centralizer". W8 witness hK_ne_zero + the nonzero entanglement.

## COST / KILL: LIGHT. Every obligation a Leibniz rewrite + a one-coordinate ext/simp/module.
KILL 90s/400000 hb never approached (whole 7-lemma probe 7.6s). No `ring`/`noncomm_ring` over O ℚ
(no Sub instance — use ADDITIVE commutator form: D(JO z) = D(u1)·z + JO(D z), never D(JO z) − ...).

## NOTE: front (ii) forced-generic cascade stop = HARD (trunk defers it, Sedenion.lean L55-61);
needs classical composition⟹alternative polarization. NOT this node. If a future node wants it,
it is a dedicated W1 dissolution ticket. Chosen front (i) is light + genuinely new — GO.
