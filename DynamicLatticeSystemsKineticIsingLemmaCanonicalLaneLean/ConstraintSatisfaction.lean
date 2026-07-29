import canonicalLaneMathlib.AdmissibleClass
import DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean.LatticeState

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure ConstraintSatisfactionPackage where
  transitionOperator : (LatticeConfiguration → ℝ) → (LatticeConfiguration → ℝ)
  invariantMeasure : Prop
  spectralGapPositivity : Prop
  existenceProof : Prop

structure ConstraintSatisfactionEvidence (p : ConstraintSatisfactionPackage) where
  invariantMeasureClosed : p.invariantMeasure
  spectralGapPositivityClosed : p.spectralGapPositivity
  existenceProofClosed : p.existenceProof

def ConstraintSatisfactionClosed (p : ConstraintSatisfactionPackage) : Prop :=
  p.invariantMeasure ∧ p.spectralGapPositivity ∧ p.existenceProof

theorem constraint_satisfaction_closed_from_evidence (p : ConstraintSatisfactionPackage) 
  (e : ConstraintSatisfactionEvidence p) : ConstraintSatisfactionClosed p :=
  And.intro e.invariantMeasureClosed (And.intro e.spectralGapPositivityClosed e.existenceProofClosed)

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse
