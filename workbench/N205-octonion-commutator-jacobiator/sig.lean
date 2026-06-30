import Mathlib.Tactic
example {G : Type*} [AddCommGroup G] (a b : G) (h : a + b = 0) : b = -a := eq_neg_of_add_eq_zero_left h
example {G : Type*} [AddCommGroup G] (a b : G) (h : a + b = 0) : a = -b := eq_neg_of_add_eq_zero_right h
