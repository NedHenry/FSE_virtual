module EndorsementHelper
  def random_sponsors num
    sponsors = Endorsement.where(endorsement_type: "sponsor")
    num = [num, sponsors.count].min
    sponsors.limit(num).order(Arel.sql('RAND()')) || []
  end

  def cruise_spaces
    Endorsement.where(endorsement_type: "cruise").limit(6)
  end
  
end
