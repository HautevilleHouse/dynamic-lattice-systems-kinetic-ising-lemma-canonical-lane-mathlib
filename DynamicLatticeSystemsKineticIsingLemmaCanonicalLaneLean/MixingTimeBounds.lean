import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean.KineticIsingLemma

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure MixingTimeBoundPackage {Λ : Type} [Fintype Λ] {L : LocalDynamicsPackage Λ}
    {G : GlauberDynamicsPackage L} {S : SpectralGapPackage G}
    (K : KineticIsingLemmaPackage S) where
  mixingTime : ℕ
  boundProof : mixingTime ≤ (Fintype.card Λ)^2
  mixingTimeClosed : boundProof

structure MixingTimeBoundEvidence {Λ : Type} [Fintype Λ] {L : LocalDynamicsPackage Λ}
    {G : GlauberDynamicsPackage L} {S : SpectralGapPackage G}
    {K : KineticIsingLemmaPackage S} (M : MixingTimeBoundPackage K) where
  boundProofClosed : M.boundProof

def MixingTimeBoundClosed {Λ : Type} [Fintype Λ] {L : LocalDynamicsPackage Λ}
    {G : GlauberDynamicsPackage L} {S : SpectralGapPackage G}
    {K : KineticIsingLemmaPackage S} (M : MixingTimeBoundPackage K) : Prop :=
  M.boundProof

theorem mixing_time_bound_closed_from_evidence {Λ : Type} [Fintype Λ]
    {L : LocalDynamicsPackage Λ} {G : GlauberDynamicsPackage L} {S : SpectralGapPackage G}
    {K : KineticIsingLemmaPackage S} (M : MixingTimeBoundPackage K)
    (E : MixingTimeBoundEvidence M) : MixingTimeBoundClosed M := by
  exact E.boundProofClosed

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse