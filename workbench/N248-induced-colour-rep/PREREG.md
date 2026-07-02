# N248 PREREG — THE INDUCED COLOUR su(3)-REPRESENTATION ON THE CHARGED COMPLEMENT
### (ℂ-linear for the charge complex structure; gather-side, under the lock)

Frozen BEFORE production compute. Task t_fd8dc721. Tail = N247 (HEAD 208d42b).

## THE THEORY-FIRST CORRECTION (W5 / THE ONE LAW) — read first
The ticket SUGGESTS: "colour preserves the Uhol/Uah = 3 vs 3̄ split inside Vsub, colour acts
within each triplet." **This literal reading is FALSE mathematics** and I will NOT author it:
- `Uhol`/`Uah` are REAL 3-dim ℚ-subspaces; the charge complex structure `chargeOpV = J` SWAPS
  them (`Uhol_map_crossOpO_eq_Uah`, N241) — they are transverse to J, not J-stable.
- Colour su(3) COMMUTES with J (`colour_commute_chargeOp`, N245), i.e. acts ℂ-LINEARLY.
- A ℂ-linear operator maps J-stable subspaces to J-stable subspaces; `Uhol` is NOT J-stable
  (J : Uhol ≅ Uah). If colour preserved `Uhol` it would (commuting with J) also preserve
  `Uah = J(Uhol)`, giving a ℚ-invariant real `3+3` decomposition of `Vsub` transverse to J.
  That is exactly the realification of the non-self-conjugate `3` splitting into two real
  3-spaces — impossible: **Res_ℝ(3) is real-IRREDUCIBLE** because `3̄ ≇ 3` (complex type).
- CONCLUSION: over ℚ the charged 6-space is su(3)-irreducible; the "3 ⊕ 3̄" split lives in the
  COMPLEXIFICATION as the ±i-eigenspaces of J. The forced, TRUE, gather-native content is:
  **colour acts on the charged complement by maps that COMMUTE with the charge complex
  structure — a ℂ-linear representation.** THAT is what "3 ⊕ 3̄" means here. I author THAT.

This is THE ONE LAW in action: the framing (real 3+3 split) fights because it is wrong; the
theory (ℂ-linear action = the complex 3) is right. Return to the trunk = the complex structure J
the gather tear produces (N242/N244), and read the rep through it.

## THE TARGET (ONE, self-authored, worker-body STEP 5)
Production: `Phys/Algebra/TowerGatherInducedColourRep.lean`. Carrier = the charged complement
`range chargeOp` (submodule of `ImO`, dim 6, banked colour-invariant `colour_mapsTo_range_chargeOp`,
pushes onto `Vsub` `range_chargeOp_map_eq_Vsub`). Deliverables:

1. `chargeOpR : End ℚ (range chargeOp)` := `chargeOp.restrict` (range self-invariant, trivial).
   The charge complex structure restricted to the charged complement.
2. `chargeOpR_sq : chargeOpR.comp chargeOpR = -id`. On the complement the charge operator is the
   invertible complex structure (`chargeOp_sq_coe` + `gForm u1 = 0` on `Vsub`-pushforward). The
   6-space is genuinely the complex 3-space `(range chargeOp, chargeOpR)`.
3. `colourRepV : colourCentralizer →ₗ⁅ℚ⁆ End ℚ (range chargeOp)` — ★★★ THE INDUCED su(3)-REP,
   a genuine LIE-ALGEBRA hom (`imRep D` restricted to the invariant complement; map_lie' via
   `restrict_comp` + `restrict_sub`, imRep a LieHom). + coe lemma `colourRepV_apply`.
4. `colourRepV_commutes_chargeOpR : ∀ D, Commute (colourRepV D) chargeOpR` — ★★★ ℂ-LINEARITY:
   colour acts by complex-linear maps (the REAL meaning of "3 ⊕ 3̄"). From
   `colour_commute_chargeOp` restricted. THE CORE.
5. `colourRepV_ne_zero : colourRepV ⟨DI, DI_mem_colour⟩ ≠ 0` — ★★ W8 NON-TRIVIALITY (ticket
   requires it): a concrete colour generator MOVES some charged vector. Theory-native proof
   (THE ONE LAW, no coordinate bash): if `colourRepV DI = 0` then `imRep DI` vanishes on
   `range chargeOp`; it also kills `sgl` (`colour_kills_sgl`); `ImO = ker ⊔ range = span sgl ⊔
   range chargeOp` (helper `ker_sup_range_chargeOp`), so `imRep DI = 0`, so `DI = 0` by
   faithfulness (`imRep_injective`) — contradicting `DI ≠ 0` (`innerDeriv_hI_ne_zero`).
6. Helper `ker_sup_range_chargeOp : ker chargeOp ⊔ range chargeOp = ⊤` (disjoint via
   `sgl ∉ range` = `singlet_disj_Vsub` pushed + dimension 1+6=7, or `Submodule.eq_top_of_...`).
7. Capstone `induced_colour_rep_structure` bundling (rep is a Lie hom; commutes with the complex
   structure; complex structure squares to −id; nontrivial).

## GO / NO-GO
- GO iff ALL of: (a) `colourRepV` builds as a LieHom (map_lie' closes via restrict_comp);
  (b) `colourRepV_commutes_chargeOpR` closes from banked commute; (c) `colourRepV_ne_zero`
  closes via the faithful+singlet+decomposition argument; (d) `chargeOpR_sq` closes.
- NO-GO / DESCOPE ladder (W3): if the LieHom map_lie' resists → ship `colourRepV` as a plain
  ℚ-LINEAR rep (`→ₗ[ℚ]`) + note; still forward. If `ker_sup_range` resists → phrase
  nontriviality via an explicit witness x with imRep DI x ≠ 0 in range (may need coords) — if
  THAT resists, child a dedicated nontriviality node (still gather-side). NEVER weaken to the
  false "preserves Uhol" claim. NEVER build over ℚ[i].

## KILL CLASSES (declare instrument failure → measure/decompose, not grind — W9)
- K1: any single tactic >45s net-of-import on a probe → STOP, decompose.
- K2: any `ring`/`decide`/`simp` over expanded `O ℚ` coordinates blowing up → structural reframe
  (THE ONE LAW): route through banked `chargeOp_sq_coe` / `colour_commute_chargeOp` /
  `imRep_injective`, never coordinate-bash the non-associative octonion product.
- K3: ≥2 probe rounds banking nothing → the framing is wrong; return to trunk.

## COMPILE-COST BUDGET
Imports ~30–45s here. Net-of-import per probe target < 20s; whole-module olean < 60s net.
NO `maxHeartbeats` raise. NO `native_decide`. Measure each risky obligation in a bounded probe
BEFORE promotion. NEVER block-wait on the gate.

## RAILS
- UNBROKEN: type mentions banked `chargeOp`/`range chargeOp`/`colourCentralizer`/`imRep`/`chargeOpR`
  — NOT carrier-agnostic. Imports the N247 tail + banked DI/faithfulness/N244/N245 levers.
- COMPLEX FIELD = METALANGUAGE: `chargeOp`/`imRep`/`colourCentralizer`/`range chargeOp` stay
  DERIVED REAL; no `Algebra ℚ (Dbl ℚ)`, no `TensorProduct`, no `ℚ[i]`-as-ground. The "ℂ-linear"
  content is the REAL fact `Commute (colourRepV D) chargeOpR` with `chargeOpR² = −id`.
- STANDARD: unbroken / complete (#print axioms ⊆ {propext, Classical.choice, Quot.sound}, no
  sorry/axiom/native_decide) / physics-words-removable (delete colour/su(3)/charge/3/3̄/gauge:
  the induced-restriction Lie hom commuting with the square-root-of-−id endomorphism stands).
- W8: costume C279 (finrank ℚ (range chargeOp) = 6, "6 = 279") bites — carrier genuinely the 6,
  rep not on the 0-space; PLUS `colourRepV_ne_zero` (rep nontrivial) + `chargeOpR_sq` (complex
  structure genuine). A garbage "rep is trivial / carrier is 0" fails.
- W4.5: FORWARD — opens the representation-theoretic content (the induced rep AS a ℂ-linear su(3)
  action) the reductive algebra forces; NOT a re-pin of N245's mapsTo (which never packaged the
  rep as a hom, never stated ℂ-linearity, never proved nontriviality).
