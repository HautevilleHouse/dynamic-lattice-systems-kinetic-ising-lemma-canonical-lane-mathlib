import canonicalLaneMathlib.AdmissibleClass
import DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean.KineticIsingTransitionRates

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure KineticIsingLemmaPackage {S : KineticIsingSystem}
    (P : TransitionRatePackage S) where
  spectralGapPositive : Prop
  relaxationTimeFinite : Prop
  mixingTimeFinite : Prop
  logSobolevConstantPositive : Prop
  spectralGapPositiveClosed : spectralGapPositive
  relaxationTimeFiniteClosed : relaxationTimeFinite
  mixingTimeFiniteClosed : mixingTimeFinite
  logSobolevConstantPositiveClosed : logSobolevConstantPositive

structure KineticIsingLemmaEvidence {S : KineticIsingSystem}
    {P : TransitionRatePackage S} (L : KineticIsingLemmaPackage P) where
  spectralGapPositiveClosed : L.spectralGapPositive
  relaxationTimeFiniteClosed : L.relaxationTimeFinite
  mixingTimeFiniteClosed : L.mixingTimeFinite
  logSobolevConstantPositiveClosed : L.logSobolevConstantPositive

def KineticIsingLemmaClosed {S : KineticIsingSystem}
    {P : TransitionRatePackage S} (L : KineticIsingLemmaPackage P) : Prop :=
  L.spectralGapPositive ∧ L.relaxationTimeFinite ∧ L.mixingTimeFinite ∧ L.logSobolevConstantPositive

theorem kinetic_ising_lemma_closed_from_evidence
    {S : KineticIsingSystem} {P : TransitionRatePackage S}
    (L : KineticIsingLemmaPackage P) (E : KineticIsingLemmaEvidence L) :
    KineticIsingLemmaClosed L := by
  exact And.intro E.spectralGapPositiveClosed
    (And.intro E.relaxationTimeFiniteClosed
      (And.intro E.mixingTimeFiniteClosed E.logSobolevConstantPositiveClosed))

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse