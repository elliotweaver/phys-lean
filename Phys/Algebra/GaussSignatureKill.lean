/-
  # THE SIGNATURE RATIO KILL — the 2-tower cannot repeat (GQ SG-r)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The signature-injectivity engine (PREREG-36b: the (2-power,
  deep-part) signature map is injective across the ENTIRE deferring
  population to 1e5 — zero collisions; this file transcribes the
  mechanism):

  * `window_double_kill` — ★★★ THE DOUBLING OVERFLOW: a ratio-≤2
    window holds no value 2w× another (L < u, v ≤ 2L, v = 2wu, w ≥ 1
    ⟹ False).
  * `value_window_ratio` — ★ the band-touch value window (A/4, A/3]
    is ratio-4/3 in integer form: 3V' < 4V for any two residents —
    under the kill's threshold.

  CONSEQUENCE: at fixed deep-part and band core, at most ONE 2-power
  puts the value in the window — signatures cannot repeat through the
  2-tower. With the cofactor kill (N638) and the window (N639):
  #band-touch signatures ≤ #deep-parts ≤ 2^(m−1) under deferral at m
  ⟹ B_touch ≤ f(m), |D|-FREE — the uniform H(m)'s engine.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussValueWindow

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE DOUBLING OVERFLOW: a ratio-≤2 window holds no value twice
    another times a positive factor. -/
theorem window_double_kill {L u v w : Z}
    (hupos : 0 < u)
    (hu : L < u) (hv : v ≤ 2 * L)
    (hdvd : v = 2 * w * u) (hw : 1 ≤ w) : False := by
  nlinarith

/-- ★ THE WINDOW RATIO: two value-window residents are within ratio
    4/3 — in integer form 3·V' < 4·V for any residents V, V'. -/
theorem value_window_ratio {A V V' : Z}
    (hV : A < 4 * V) (hV' : 3 * V' ≤ A) :
    3 * V' < 4 * V := by
  linarith


#print axioms window_double_kill
#print axioms value_window_ratio

end BQF
end GaussForms
end Phys.Foundation
