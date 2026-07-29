import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean

structure KineticIsingRate where
  temperature : ℝ
  coupling : ℝ
  magneticField : ℝ
  rateFunction : ℤ → ℤ → ℝ
  detailedBalanceCondition : Prop
  ratePositive : Prop

structure RateEvidence (r : KineticIsingRate) where
  detailedBalanceClosed : r.detailedBalanceCondition
  ratePositiveClosed : r.ratePositive

def KineticIsingRateClosed (r : KineticIsingRate) : Prop :=
  r.detailedBalanceCondition ∧ r.ratePositive

theorem kinetic_ising_rate_closed_from_evidence (r : KineticIsingRate) (e : RateEvidence r) :
  KineticIsingRateClosed r :=
  And.intro e.detailedBalanceClosed e.ratePositiveClosed

end DynamicLatticeSystemsKineticIsingLemmaCanonicalLaneLean
end HautevilleHouse
