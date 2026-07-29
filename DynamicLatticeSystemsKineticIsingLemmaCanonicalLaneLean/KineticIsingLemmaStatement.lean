import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean.GlauberDynamics
import HautevilleHouse.DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean.KawasakiDynamics

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure KineticIsingLemmaPackage {S : SpinDynamicsPackage} {G : GlauberDynamicsPackage S} {K : KawasakiDynamicsPackage S} where
  correlationFunction : Type u
  decayExponent : Prop
  dynamicScaling : Prop
  universalityClass : Prop

structure KineticIsingLemmaEvidence {S : SpinDynamicsPackage} {G : GlauberDynamicsPackage S} {K : KawasakiDynamicsPackage S}
    (L : KineticIsingLemmaPackage S G K) where
  correlationFunctionDefined : Prop
  decayExponentClosed : L.decayExponent
  dynamicScalingClosed : L.dynamicScaling
  universalityClassClosed : L.universalityClass

def KineticIsingLemmaClosed {S : SpinDynamicsPackage} {G : GlauberDynamicsPackage S} {K : KawasakiDynamicsPackage S}
    (L : KineticIsingLemmaPackage S G K) : Prop :=
  L.decayExponent ∧ L.dynamicScaling ∧ L.universalityClass

theorem kinetic_ising_lemma_closed_from_evidence {S : SpinDynamicsPackage} {G : GlauberDynamicsPackage S} {K : KawasakiDynamicsPackage S}
    (L : KineticIsingLemmaPackage S G K) (E : KineticIsingLemmaEvidence L) :
    KineticIsingLemmaClosed L := by
  exact And.intro E.decayExponentClosed (And.intro E.dynamicScalingClosed E.universalityClassClosed)

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse