import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean.KineticIsingSpinDynamics

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure KawasakiDynamicsPackage {S : SpinDynamicsPackage} where
  pairExchange : Prop
  conservationLaw : Prop
  detailedBalancePair : Prop
  diffusionRate : Prop

structure KawasakiDynamicsEvidence {S : SpinDynamicsPackage} (K : KawasakiDynamicsPackage S) where
  pairExchangeClosed : K.pairExchange
  conservationLawClosed : K.conservationLaw
  detailedBalancePairClosed : K.detailedBalancePair
  diffusionRateClosed : K.diffusionRate

def KawasakiDynamicsClosed {S : SpinDynamicsPackage} (K : KawasakiDynamicsPackage S) : Prop :=
  K.pairExchange ∧ K.conservationLaw ∧ K.detailedBalancePair ∧ K.diffusionRate

theorem kawasaki_dynamics_closed_from_evidence {S : SpinDynamicsPackage} (K : KawasakiDynamicsPackage S)
    (E : KawasakiDynamicsEvidence K) : KawasakiDynamicsClosed K := by
  exact And.intro E.pairExchangeClosed
    (And.intro E.conservationLawClosed
      (And.intro E.detailedBalancePairClosed E.diffusionRateClosed))

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse