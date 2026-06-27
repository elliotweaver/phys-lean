import Phys.Algebra.LorentzContinuumMetricCondition

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

variable {g h : Module.End Cut STVC}

theorem sigOpC_injective : Function.Injective (sigOpC : Module.End Cut STVC) := by
  intro p q hpq
  have := congrArg sigOpC hpq
  rw [← LinearMap.comp_apply, ← LinearMap.comp_apply, sigOpC_comp_self] at this
  simpa using this

theorem linIsom_injective (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    Function.Injective g := by
  have hmc := linIsom_metric_condition hg H
  intro p q hpq
  apply sigOpC_injective
  have e1 : (h.comp (sigOpC.comp g)) p = sigOpC p := by rw [hmc]
  have e2 : (h.comp (sigOpC.comp g)) q = sigOpC q := by rw [hmc]
  simp only [LinearMap.comp_apply] at e1 e2
  rw [← e1, ← e2, hpq]

/-- ITEM 6 — THE INVERSE / TWO-SIDED METRIC CONDITION `g∘J∘h = J`. From `h∘J∘g = J` (N90) and
    `g` bijective (injective + FiniteDimensional Cut STVC): `m := J∘h∘J` is a left inverse of `g`
    (`m∘g = id`), and by surjectivity it is also a right inverse (`g∘m = id`), giving
    `g∘J∘h∘J = id`, hence `g∘J∘h = J`. Equivalently, `h` is also a `QvC`-isometry. -/
theorem linIsom_inverse_metric_condition (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    g.comp (sigOpC.comp h) = sigOpC := by
  have hmc := linIsom_metric_condition hg H           -- h∘(J∘g) = J
  have hinj := linIsom_injective hg H
  have hsurj := LinearMap.injective_iff_surjective.mp hinj
  -- m := J∘h∘J, left inverse: m∘g = id
  set m : Module.End Cut STVC := sigOpC.comp (h.comp sigOpC) with hm
  have hleft : m.comp g = LinearMap.id := by
    -- m∘g = J∘h∘J∘g = J∘(h∘J∘g)? careful with associativity: m∘g = J∘h∘J∘g
    apply LinearMap.ext; intro p
    simp only [hm, LinearMap.comp_apply, LinearMap.id_coe, id_eq]
    -- goal: sigOpC (h (sigOpC (g p))) = p
    have : h (sigOpC (g p)) = sigOpC p := by
      have := congrArg (fun (f : Module.End Cut STVC) => f p) hmc
      simpa only [LinearMap.comp_apply] using this
    rw [this, ← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]
  -- right inverse via surjectivity: g∘m = id
  have hright : g.comp m = LinearMap.id := by
    apply LinearMap.ext; intro y
    obtain ⟨x, hx⟩ := hsurj y
    simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq]
    -- g (m y) = y ; y = g x ; m (g x) = x by hleft
    have hmx : m (g x) = x := by
      have := congrArg (fun (f : Module.End Cut STVC) => f x) hleft
      simpa only [LinearMap.comp_apply, LinearMap.id_coe, id_eq] using this
    rw [← hx, hmx]
  -- g∘m = id means g∘J∘h∘J = id ; right-compose by J gives g∘J∘h = J
  -- g.comp m = g.comp (J.comp (h.comp J)) = id
  -- want: g.comp (J.comp h) = J
  apply LinearMap.ext; intro q
  -- evaluate hright at (sigOpC q): g (m (sigOpC q)) = sigOpC q
  have e := congrArg (fun (f : Module.End Cut STVC) => f (sigOpC q)) hright
  simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq] at e
  -- e : g (sigOpC (h (sigOpC (sigOpC q)))) = sigOpC q
  simp only [hm, LinearMap.comp_apply] at e
  -- sigOpC (sigOpC q) = q
  rw [show sigOpC (sigOpC q) = q by
        rw [← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]] at e
  -- e : g (sigOpC (h q)) = sigOpC q ; goal g (sigOpC (h q)) = sigOpC q
  simp only [LinearMap.comp_apply]
  exact e

/-- ITEM 7 — `J p J = p⁻¹`: conjugating the positive part `p := h∘g (= g*g)` by the signature
    involution INVERTS it. Stated as `J∘p∘J∘p = id` (purely composition algebra, NO sqrt, NO
    spectral inverse): from `g∘J∘h = J` (item 6) and `h∘J∘g = J` (N90),
    `J p J p = J∘h∘g∘J∘h∘g = J∘h∘(g∘J∘h)∘g = J∘h∘J∘g = J∘(h∘J∘g) = J∘J = id`. THE PRECISE LEVER
    the operator-sqrt-uniqueness step (`J p^{1/2} J = (p^{1/2})⁻¹`) consumes. -/
theorem linIsom_posPart_J_conj_inv (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    (sigOpC.comp ((h.comp g).comp sigOpC)).comp (h.comp g) = LinearMap.id := by
  have hmc := linIsom_metric_condition hg H               -- h∘(J∘g) = J
  have hinv := linIsom_inverse_metric_condition hg H       -- g∘(J∘h) = J
  apply LinearMap.ext; intro p
  simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq]
  -- goal: sigOpC (h (g (sigOpC (h (g p))))) = p
  -- inner: g (sigOpC (h (g p))) ; let w := g p ; g (sigOpC (h w)) = (g∘J∘h) w = sigOpC w
  have step1 : g (sigOpC (h (g p))) = sigOpC (g p) := by
    have := congrArg (fun (f : Module.End Cut STVC) => f (g p)) hinv
    simpa only [LinearMap.comp_apply] using this
  rw [step1]
  -- goal: sigOpC (h (sigOpC (g p))) = p
  have step2 : h (sigOpC (g p)) = sigOpC p := by
    have := congrArg (fun (f : Module.End Cut STVC) => f p) hmc
    simpa only [LinearMap.comp_apply] using this
  rw [step2, ← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]

end

end Phys.Algebra
