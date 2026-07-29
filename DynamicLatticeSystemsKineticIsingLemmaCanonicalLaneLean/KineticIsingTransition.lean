import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure KineticIsingTransition where
  flipRate : ℝ → ℝ → ℝ
  detailedBalance : Prop
  singleSpinFlipRate : ℤ → ℝ

structure KineticIsingEvidence (T : KineticIsingTransition) where
  detailedBalanceClosed : T.detailedBalance

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse
