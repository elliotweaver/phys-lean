"""
GO-FULL last probe — does Nrm-multiplicativity, applied to SPECIFIC simple arguments,
directly force the base commutator [p,q]=0, giving a SHORT Lean closing?

Target (frozen PREREG): H: Nrm mult on CD(CD B) ==> B commutative.
We have banked: iota_iota_e2_assoc_iff: (ia*ib)*e2 = ia*(ib*e2)  <=>  a*b=b*a   in CD B.
So B commutative <=> CD B associates on (iota_B a, iota_B b, e2_B) triples.

KEY new idea: in CD(CD B), set A = CD B. The relevant inner non-associativity of A=CD B
is detected by an associator (ia,ib,e2) in A.  But Nrm lives on CD A = CD(CD B). The
Hurwitz link is: Nrm mult on CD A ==> A alternative ==> A associative (all triples) ==>
in particular A associates on (ia,ib,e2) ==> B commutative.

We test the MIDDLE: does Nrm mult on CD A force A=CD B FULLY associative?  Equivalent
test: over the cascade, when is A=CD B associative?  A=CD B is associative <=> B
commutative+associative (banked). And Nrm mult on CD A <=> A associative (the iff).
So the backward is EXACTLY: Nrm mult on CD A ==> A associative, the SAME iff one level
down -- it's SELF-SIMILAR.  The cleanest closing is the genuine alternativity lemma.

CONCLUSION CHECK: confirm the self-similar reading numerically -- Nrm mult on CD A
holds iff A associative, at the concrete rungs:
  A=H (assoc)  -> CD A=O : Nrm mult? YES
  A=O (nonassoc)-> CD A=S : Nrm mult? NO
This is forced_stop_boundary, already banked. So the backward IS 'A nonassoc => Nrm
not mult on CD A', and the honest proof is the alternativity chain. GO-DECOMPOSE.
"""
print("This probe documents the GO/NO-GO reasoning; the numeric facts are already banked")
print("(forced_stop_boundary). The backward is genuine alternativity depth => GO-DECOMPOSE.")
print()
print("Banked-this-run forced content (compiles, foundations-only):")
print("  polarization: bilin, bilin_diag/symm/add_left/add_right, Nrm_add, P1, P2")
print("  reflection:   iota_mul, iota_assoc_iff, base_assoc_of_image_assoc")
print()
print("Child node target (the Hurwitz middle): H:Nrm mult on CD A  ==>  A alternative")
print("  ==> A associative on ALL triples ==> (iota_assoc_iff) base associative")
print("  ==> (banked iota_iota_e2_assoc_iff at the lower rung) base commutative.")
