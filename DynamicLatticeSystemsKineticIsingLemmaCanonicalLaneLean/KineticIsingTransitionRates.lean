import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure KineticIsingSystem where
  spinConfiguration : Type u
  lattice : Type v
  hamiltonian : spinConfiguration → ℝ
  inverseTemperature : ℝ
  magneticField : ℝ
  transitionRates : spinConfiguration → spinConfiguration → ℝ
  detailedBalanceCondition : Prop
  ratePositivity : Prop
  detailedBalanceConditionTerm : detailedBalanceCondition
  ratePositivityTerm : ratePositivity

structure TransitionRatePackage (S : KineticIsingSystem) where
  glauberDynamics : Prop
  kawasakiDynamics : Prop
  singleSpinFlip : Prop
  spinExchange : Prop
  glauberDynamicsClosed : glauberDynamics
  kawasakiDynamicsClosed : kawasakiDynamics
  singleSpinFlipClosed : singleSpinFlip
  spinExchangeClosed : spinExchange

structure TransitionRateEvidence {S : KineticIsingSystem} (P : TransitionRatePackage S) where
  glauberDynamicsClosed : P.glauberDynamics
  kawasakiDynamicsClosed : P.kawasakiDynamics
  singleSpinFlipClosed : P.singleSpinFlip
  spinExchangeClosed : P.spinExchange

def TransitionRateClosed {S : KineticIsingSystem} (P : TransitionRatePackage S) : Prop :=
  P.glauberDynamics ∧ P.kawasakiDynamics ∧ P.singleSpinFlip ∧ P.spinExchange

theorem transition_rate_closed_from_evidence
    {S : KineticIsingSystem} (P : TransitionRatePackage S)
    (E : TransitionRateEvidence P) : TransitionRateClosed P := by
  exact And.intro E.glauberDynamicsClosed
    (And.intro E.kawasakiDynamicsClosed
      (And.intro E.singleSpinFlipClosed E.spinExchangeClosed))

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse