# N1 — THE FOLD — PREREG (frozen BEFORE compute)

*Frozen at the start of the N1 run. Do NOT edit to fit the result. This is the anti-drift
contract: it fixes what would count as success BEFORE any theorem is seen.*

## The node
Formalize the fold — self-look-back — as a mathematical object, and prove the FIRST property
it forces: self-blindness (the look-back has no nonzero fixed point). The fold is the project's
ONE permitted posit (STANDARD §3); everything after N1 is derived.

## The honest formalization (the ONE posit, stated as a definition — not derived)
The fold is **self-look-back as self-opposition**: a state and its look-back annihilate to the
neutral state. Formally, on an additive group `V` (the minimal home for a distinguished `0` and
a notion of "nonzero"), the fold is a self-map `look : V → V` satisfying the **look-back law**

        ∀ x,  look x + x = 0.

Reading: looking back returns the *other* that, combined with the state, returns to void —
the unity that looks back finds its own annihilator and so cannot contain itself. This is the
single posit; it is DEFINED, not derived.

## What must FOLLOW (proved theorems, not restatements)
1. **look is forced/unique** — `look x = -x`. The self-look-back is not an arbitrary map; the
   law forces it to be the unique annihilating reflection. (genuine content: uniqueness)
2. **void sees itself** — `look 0 = 0`. The trivial state is the only candidate fixed point.
3. **the fold closes** — `look (look x) = x`, i.e. `look² = id` (looking back twice returns).
   ★ EXPLICITLY this is `look² = id`, NOT `look² = -id`. The complex unit J²=−1 is N2's to
   DERIVE; N1 must NOT contain it. (drift-trap guard)
4. **SELF-BLINDNESS (the forced first property)** — on a 2-torsion-free carrier
   (`∀ y, y + y = 0 → y = 0`), `look x = x → x = 0`. The look-back has NO nonzero fixed point.
   The proof genuinely USES torsion-freeness (`look x = x ⇒ -x = x ⇒ x + x = 0 ⇒ x = 0`), so
   it is not a definitional restatement — it is a theorem whose hypothesis is load-bearing.
5. **tightness / non-vacuity of the hypothesis** — exhibit a carrier WITH 2-torsion (`ZMod 2`)
   on which the fold has a nonzero fixed point: self-blindness is FALSE there. This proves the
   torsion-free hypothesis in (4) is essential, and is the logical complement of the costume.

## Non-vacuity witness (anti-W8)
Concrete instance over `ℤ`: `look = (· * -1)` satisfies the law; `(1 : ℤ)` is nonzero and
`look 1 = -1 ≠ 1`. So self-blindness is non-vacuously true and nonzero non-fixed states exist.
The theorem is NOT vacuously true and the structure is inhabited.

## GO / NO-GO bars
- GO iff ALL of (1)–(5) are proved in `Phys/Foundation/Fold.lean`, foundations-only
  (`#print axioms` ⊆ {propext, Classical.choice, Quot.sound}), no sorry/axiom/native_decide,
  no bridge marker; gate.sh green; the costume (5-complement) BITES (a wrong/torsion carrier
  claim is rejected by the kernel); physics-words-removable holds (delete "fold/look-back/
  self-blindness" → a complete theorem about additive groups remains, no gap).
- NO-GO if self-blindness can only be obtained by ASSUMING "no fixed point" directly (that would
  be a restatement, not a derivation), or by importing a structure that "happens to be" ℂ/J²=−1,
  or if the costume does not bite (theorem vacuous), or if any physics word is load-bearing.

## KILL conditions (a fight = INSTRUMENT failure, never theory failure — THE ONE LAW / W5)
- If self-blindness "won't close," the framing is wrong, not the theory. Return to the trunk
  (self-blindness IS a trunk primitive; it cannot be false). Do NOT add a hypothesis beyond the
  honest torsion-free condition to force it; do NOT weaken the claim. If genuinely hard after
  re-framing → W1 dissolution ticket, NOT a smaller win.
- If I find myself reaching to define `look` as a rotation / quarter-turn / anything with
  `look² = -id`, STOP: that is drift toward smuggling N2's answer into N1. The fold closes as
  `look² = id`. The complex unit is DERIVED downstream, never posited here.

## Drift-trap checklist (must all stay TRUE)
- [ ] No physics imported. No ℂ/ℍ/𝕆. No J²=−1 anywhere in N1.
- [ ] `look` defined by an honest law, self-blindness DERIVED (real proof using torsion-free).
- [ ] Costume bites (char-2 carrier ⟹ nonzero fixed point ⟹ self-blindness claim rejected).
- [ ] Physics words removable with zero logical gap.
