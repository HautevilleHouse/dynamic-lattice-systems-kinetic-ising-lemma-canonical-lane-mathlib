import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure GlauberDynamics where
  spinConfig : LatticeSpinConfig
  transition : KineticIsingTransition
  rateFunction : ℤ → ℝ
  heatBathRate : ℤ → ℝ

structure GlauberEvidence (G : GlauberDynamics) where
  rateFunctionClosed : G.rateFunction = G.heatBathRate

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse
