import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  KineticIsingWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse