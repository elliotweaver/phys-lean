/-
  Phys.Quantum.TransitionAmplitude — N399 (arc-K K3): THE TRANSITION AMPLITUDE + THE OPTICAL THEOREM.
  (The scattering amplitude is the derived look-back transport between asymptotic (dressed singlet)
   states; the optical theorem — the imaginary part of the forward amplitude equals the total over
   the intermediate channels — is a CONSEQUENCE of K1's unitarity, NOT a separate postulate.)
  ===========================================================================
  THE THIRD NODE OF ARC K — the DYNAMICAL half of quantum field theory. K1 (N397,
  `Unitarity.lean`) derived that TRANSPORT is unitary (the emergent unit-phase group,
  probability conservation = idempotency of the gather). K2 (N398, `AsymptoticStates.lean`)
  derived WHICH states the transport acts between: the asymptotic (in/out) states are the
  banked colour singlets DRESSED as Born-fibre states. K3 (this node) derives the TRANSITION
  between two asymptotic states — the amplitude — and reads off the optical theorem.

  ── THE FORWARD DERIVATION (fold → the amplitude → the optical theorem; nothing posited) ──
  A state is a look-back (arc J). Its transport is `evolve U` = left-multiplication by a
  unit phase `U` in the derived complex algebra `Dbl Cut` (K1). The transition between an
  incoming asymptotic state `inp` and an outgoing one `out` is the fold's look-back of `out`
  against the TRANSPORTED `inp` — exactly the banked Hermitian inner product `hInner` (N393):

    · `transAmp U out inp := ⟨out | evolve U | inp⟩ = hInner (toDbl out) (toDbl (evolve U inp))`.

  This is DERIVED from banked objects (`hInner` N393 ⊗ `evolve` N397), not a posited S-matrix.
  On a NORMALIZED dressed singlet (`a² + b² = 1`, N398 `gForm_singletElt`), the forward
  amplitude IS the transport phase itself (`transAmp_forward`, `transAmp U s s = U`) — the
  normalized asymptotic state carries the transport transparently.

  ── THE INTERACTION OPERATOR (S = 1 + i·T) ──
  Split the transport into "does nothing" plus "interacts": `S = 1 + i·T`, so the interaction
  operator is `T = (S − 1)/i = (S − 1)·(−J)` (`intOp U := (U − 1) * (−Dbl.J)`), with
  `Re T = Im U` (`intOp_re`) and `Im T = 1 − Re U` (`intOp_im`).

  ── THE OPTICAL THEOREM (a CONSEQUENCE of K1's unitarity) ──
  K1 forces the transport to be a unit phase: `dblNormSq U = 1`, i.e. `Re U² + Im U² = 1`.
  Then, purely by the two-square algebra of `dblNormSq` (K1 `dblNormSq_mul`):

    · `optical_theorem`      : `2 · Im T = dblNormSq T` — twice the imaginary part of the
                               forward interaction amplitude equals its modulus-square. This is
                               `2(1 − Re U) = (1 − Re U)² + Im U²` given `Re U² + Im U² = 1`.
    · `optical_completeness` : ★ the modulus-square `dblNormSq T` is EXACTLY the idempotent
                               gather's completeness sum `wIn + wOut` (N394 `outcome_weights_sum`
                               via `bornForm_fromDbl`). So the "total over the intermediate
                               channels / the total cross-section" is the completeness of the
                               orthogonal gather-resolution of Unity — the same idempotency K1
                               identified with unitarity. The optical theorem is unitarity read
                               on the forward amplitude.

  The heavy standard apparatus (a posited free-particle Fock space, LSZ reduction, an imposed
  `S S† = 1`, cutting rules) DISSOLVES: the amplitude is the banked inner product of a
  transported dressed singlet, and the optical theorem is a two-square identity plus the banked
  gather completeness — both consequences of the ALREADY-banked `dblNormSq U = 1` (K1), never
  a fresh unitarity postulate.

  ── STANDARD ──
  Unbroken: every object banked — `Dbl Cut`/`Dbl.J` (N2), `StateFibre`/`bornForm` (N391),
  `toDbl`/`hInner`/`dblConj`/`dblNormSq` (N393), `wIn`/`wOut`/`outcome_weights_sum` (N394),
  `evolve`/`fromDbl`/`toDbl_fromDbl`/`bornForm_fromDbl`/`dblNormSq_mul` (N397), `dress`/
  `gForm_singletElt` (N398). Complete: every claim proved, foundations-only. Physics-words-
  removable: delete "scattering"/"amplitude"/"cross-section"/"S-matrix"/"optical theorem"/
  "interaction" — what remains is: the Hermitian inner product of a state with a left-mult-by-U
  transported state; for a unit-modulus `U`, setting `T := (U − 1)·(−J)`, twice `Im T` equals
  `dblNormSq T` equals the outcome-weight sum `wIn + wOut`. Pure math about the banked objects.
  FREE-FLOATING guard: every theorem TYPE mentions the banked concrete objects (`Dbl Cut`,
  `Dbl.J`, `hInner`, `toDbl`, `evolve`, `dress`, `dblNormSq`, `wIn`, `wOut`, `fromDbl`) — not
  generic over an arbitrary carrier. W4.5 SUFFICIENCY: this derives EXACTLY K3 (the amplitude
  structure + the optical theorem), NOT the constructive-QFT frontier (K4) or the consolidation
  (K5). Grade: theorem-route for the structure; cross-section NUMBERS are candidate, NEVER fit
  (G2 NO-FIT) — no numerical claim is made.

  Foundations-only: no posited axiom, no proof-hole tactic, no kernel-trust bypass, no
  heartbeat inflation, no Mathlib number system as content, no bridge, no posited S-matrix.
-/
import Mathlib.Tactic
import Phys.Quantum.BornRule
import Phys.Quantum.Measurement
import Phys.Quantum.Unitarity
import Phys.Quantum.AsymptoticStates

/-!
  ## N399 (arc-K K3) — declaration map (all over the banked `Dbl Cut` / banked fold objects)

    dbl_sub_re / dbl_sub_im     — the missing `Dbl` subtraction coordinate lemmas (machinery).
    dblConj_mul_self            — `z̄ · z = ⟨dblNormSq z, 0⟩` (the modulus as a diagonal element).
    transAmp                    — ★ THE TRANSITION AMPLITUDE `⟨out | evolve U | in⟩` (hInner ∘ evolve).
    transAmp_forward           — ★ on a normalized dressed singlet the forward amplitude IS `U`.
    intOp                       — THE INTERACTION OPERATOR `T = (U − 1)·(−J)` (from `S = 1 + i·T`).
    intOp_re / intOp_im         — `Re T = Im U`, `Im T = 1 − Re U`.
    optical_theorem             — ★ `2 · Im T = dblNormSq T`, a CONSEQUENCE of `dblNormSq U = 1` (K1).
    optical_completeness        — ★★ `2 · Im T = wIn + wOut` — the optical theorem IS the gather
                                  completeness (N394): the total over channels is the idempotency of K1.
    intOp_J_nontrivial          — [W8] `Dbl.J` genuinely interacts (`Im T = 1`, `dblNormSq T = 2 ≠ 0`).
    transition_amplitude_optical_theorem — ★★ THE CAPSTONE.
-/

namespace Phys.Quantum

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

/-! ## Machinery — the missing `Dbl` subtraction coordinate lemmas. -/

/-- The real part of a difference on the banked algebra `Dbl Cut`. -/
@[simp] theorem dbl_sub_re (z w : Dbl ContinuumQ.Cut) : (z - w).re = z.re - w.re := by
  rw [sub_eq_add_neg, sub_eq_add_neg]; simp

/-- The imaginary part of a difference on the banked algebra `Dbl Cut`. -/
@[simp] theorem dbl_sub_im (z w : Dbl ContinuumQ.Cut) : (z - w).im = z.im - w.im := by
  rw [sub_eq_add_neg, sub_eq_add_neg]; simp

/-- The conjugate-times-self is the modulus as a diagonal algebra element:
    `z̄ · z = ⟨dblNormSq z, 0⟩`. (`dblConj`/`dblNormSq` are banked N393.) -/
theorem dblConj_mul_self (z : Dbl ContinuumQ.Cut) :
    dblConj z * z = ⟨dblNormSq z, 0⟩ := by
  apply Dbl.ext <;> simp [dblConj, dblNormSq, Dbl.mul_re, Dbl.mul_im] <;> ring

/-! ## The transition amplitude — the derived look-back transport between asymptotic states. -/

/-- ★ THE TRANSITION AMPLITUDE. The transition between an incoming asymptotic state `inp` and an
    outgoing one `out` is the fold's look-back of `out` against the K1-TRANSPORTED `inp` — the
    banked Hermitian inner product (N393) of `out` with `evolve U inp` (N397):
    `⟨out | evolve U | inp⟩ = hInner (toDbl out) (toDbl (evolve U inp))`. DERIVED from banked
    objects (`hInner` ⊗ `evolve`), not a posited S-matrix. -/
noncomputable def transAmp (U : Dbl ContinuumQ.Cut) (out inp : StateFibre) : Dbl ContinuumQ.Cut :=
  hInner (toDbl out) (toDbl (evolve U inp))

/-- ★ THE FORWARD AMPLITUDE ON A NORMALIZED DRESSED SINGLET IS THE TRANSPORT PHASE. On a
    normalized dressed singlet (`a² + b² = 1`, N398 `gForm_singletElt`), the forward transition
    amplitude equals the transport phase itself: `transAmp U (dress a b) (dress a b) = U`. The
    normalized asymptotic (in/out) state carries the transport transparently — the amplitude is
    literally the K1 transport read on the diagonal. -/
theorem transAmp_forward (U : Dbl ContinuumQ.Cut) (a b : ℚ)
    (h : (a : ContinuumQ.Cut) ^ 2 + (b : ContinuumQ.Cut) ^ 2 = 1) :
    transAmp U (dress a b) (dress a b) = U := by
  unfold transAmp hInner
  have hev : toDbl (evolve U (dress a b)) = U * toDbl (dress a b) := by
    unfold evolve; rw [toDbl_fromDbl]
  rw [hev]
  have hcomm : dblConj (toDbl (dress a b)) * (U * toDbl (dress a b))
      = U * (dblConj (toDbl (dress a b)) * toDbl (dress a b)) := by ring
  rw [hcomm, dblConj_mul_self]
  have hnorm : dblNormSq (toDbl (dress a b)) = 1 := by
    unfold dblNormSq; simp only [toDbl, dress]; linear_combination h
  rw [hnorm]
  apply Dbl.ext <;> simp

/-! ## The interaction operator `S = 1 + i·T` and the optical theorem (a consequence of K1). -/

/-- THE INTERACTION OPERATOR. Split the transport into "does nothing" plus "interacts",
    `S = 1 + i·T`, so `T = (S − 1)/i = (S − 1)·(−J)`: `intOp U := (U − 1) * (−Dbl.J)`. -/
noncomputable def intOp (U : Dbl ContinuumQ.Cut) : Dbl ContinuumQ.Cut := (U - 1) * (- Dbl.J)

/-- The real part of the interaction operator: `Re T = Im U`. -/
theorem intOp_re (U : Dbl ContinuumQ.Cut) : (intOp U).re = U.im := by
  simp [intOp, Dbl.J, Dbl.mul_re]

/-- The imaginary part of the interaction operator: `Im T = 1 − Re U`. -/
theorem intOp_im (U : Dbl ContinuumQ.Cut) : (intOp U).im = 1 - U.re := by
  simp [intOp, Dbl.J, Dbl.mul_im]

/-- ★ THE OPTICAL THEOREM. For a unit-phase transport (`dblNormSq U = 1`, forced by K1's
    norm-multiplicativity `dblNormSq_mul`), twice the imaginary part of the forward interaction
    amplitude equals its modulus-square: `2 · Im T = dblNormSq T`. This is the two-square identity
    `2(1 − Re U) = (1 − Re U)² + Im U²` under `Re U² + Im U² = 1` — a CONSEQUENCE of K1's
    unitarity, never a separate postulate. -/
theorem optical_theorem (U : Dbl ContinuumQ.Cut) (hU : dblNormSq U = 1) :
    2 * (intOp U).im = dblNormSq (intOp U) := by
  rw [intOp_im]
  have hnn : dblNormSq (intOp U) = 2 * (1 - U.re) := by
    unfold dblNormSq
    rw [intOp_re, intOp_im]
    have hUnit : U.re ^ 2 + U.im ^ 2 = 1 := hU
    nlinarith [hUnit]
  rw [hnn]

/-- ★★ THE OPTICAL THEOREM IS THE GATHER COMPLETENESS. The modulus-square `dblNormSq T` — the
    right side of the optical theorem — is EXACTLY the idempotent gather's completeness sum
    `wIn + wOut` (N394 `outcome_weights_sum`, via `bornForm_fromDbl`). So the "total over the
    intermediate channels / the total cross-section" the optical theorem relates the forward
    imaginary part to IS the completeness of the orthogonal gather-resolution of Unity — the same
    idempotency K1 identified with unitarity. `2 · Im T = wIn (fromDbl T) + wOut (fromDbl T)`. -/
theorem optical_completeness (U : Dbl ContinuumQ.Cut) (hU : dblNormSq U = 1) :
    2 * (intOp U).im = wIn (fromDbl (intOp U)) + wOut (fromDbl (intOp U)) := by
  rw [outcome_weights_sum, bornForm_fromDbl, optical_theorem U hU]

/-! ## [W8] Non-vacuity — the fold's own phase genuinely interacts. -/

/-- ★ [W8] NON-VACUITY. The fold's own phase `Dbl.J` is a GENUINE interaction: its interaction
    amplitude has `Im T = 1` and modulus-square `dblNormSq T = 2 ≠ 0`. So the optical theorem is
    not the vacuous `0 = 0` — there is a real forward imaginary part balanced by a real total. -/
theorem intOp_J_nontrivial :
    (intOp (Dbl.J : Dbl ContinuumQ.Cut)).im = 1
      ∧ dblNormSq (intOp (Dbl.J : Dbl ContinuumQ.Cut)) = 2 := by
  refine ⟨?_, ?_⟩
  · rw [intOp_im]; simp [Dbl.J]
  · unfold dblNormSq; rw [intOp_re, intOp_im]; simp [Dbl.J]; ring

/-! ## THE CAPSTONE — the transition amplitude + the optical theorem. -/

/-- ★★ THE CAPSTONE — THE TRANSITION AMPLITUDE + THE OPTICAL THEOREM, DERIVED. Over the banked
    complex algebra `Dbl Cut` (N2), the banked Hermitian inner product `hInner` (N393), the banked
    transport `evolve` and its emergent unit-phase group (N397), the banked dressed asymptotic
    singlets `dress` (N398), and the banked idempotent gather `wIn`/`wOut` (N394):
    (i)   the TRANSITION AMPLITUDE is the derived look-back transport between asymptotic states,
          `⟨out | evolve U | inp⟩`, and on a normalized dressed singlet the forward amplitude IS
          the transport phase `U` (`transAmp_forward`);
    (ii)  writing `S = 1 + i·T` (`intOp`), for a UNIT-PHASE transport (`dblNormSq U = 1`, K1) the
          OPTICAL THEOREM holds: `2 · Im T = dblNormSq T` (`optical_theorem`); and
    (iii) that modulus-square IS the idempotent gather's completeness sum `wIn + wOut`
          (`optical_completeness`) — the total over the intermediate channels is the completeness
          of the orthogonal gather-resolution of Unity, the same idempotency K1 identified with
          unitarity.
    Nothing is posited: the amplitude is the banked inner product of a K1-transported dressed
    singlet, and the optical theorem is a two-square identity plus the banked gather completeness —
    both consequences of the ALREADY-banked `dblNormSq U = 1` (K1), never a fresh unitarity
    postulate. Non-vacuity: the fold's own phase `Dbl.J` genuinely interacts (`intOp_J_nontrivial`).
    Grade: theorem-route for the structure; cross-section NUMBERS are candidate, never fit. -/
theorem transition_amplitude_optical_theorem :
    -- (i) the transition amplitude = look-back transport; forward on a normalized singlet is U.
    (∀ (U : Dbl ContinuumQ.Cut) (out inp : StateFibre),
        transAmp U out inp = hInner (toDbl out) (toDbl (evolve U inp))) ∧
    (∀ (U : Dbl ContinuumQ.Cut) (a b : ℚ),
        (a : ContinuumQ.Cut) ^ 2 + (b : ContinuumQ.Cut) ^ 2 = 1 →
        transAmp U (dress a b) (dress a b) = U) ∧
    -- (ii) the interaction operator T = (U − 1)·(−J) with Re T = Im U, Im T = 1 − Re U;
    --      the optical theorem 2·Im T = dblNormSq T for a unit-phase transport (K1).
    (∀ U : Dbl ContinuumQ.Cut, (intOp U).re = U.im ∧ (intOp U).im = 1 - U.re) ∧
    (∀ U : Dbl ContinuumQ.Cut, dblNormSq U = 1 →
        2 * (intOp U).im = dblNormSq (intOp U)) ∧
    -- (iii) the optical theorem IS the idempotent gather completeness wIn + wOut.
    (∀ U : Dbl ContinuumQ.Cut, dblNormSq U = 1 →
        2 * (intOp U).im = wIn (fromDbl (intOp U)) + wOut (fromDbl (intOp U))) ∧
    -- non-vacuity: the fold's own phase genuinely interacts.
    ((intOp (Dbl.J : Dbl ContinuumQ.Cut)).im = 1
        ∧ dblNormSq (intOp (Dbl.J : Dbl ContinuumQ.Cut)) = 2) := by
  refine ⟨fun _ _ _ => rfl, transAmp_forward,
    fun U => ⟨intOp_re U, intOp_im U⟩, optical_theorem, optical_completeness,
    intOp_J_nontrivial⟩

end Phys.Quantum
