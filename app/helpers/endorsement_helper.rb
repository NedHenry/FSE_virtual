module EndorsementHelper
  def random_sponsors num
    sponsors = Endorsement.where(enabled: true, endorsement_type: "sponsor")
    num = [num, sponsors.count].min
    sponsors.limit(num).order(Arel.sql('RAND()')) || []
  end

  def cruise_spaces
    Endorsement.where(enabled: true, endorsement_type: "cruise").limit(6).order(Arel.sql('RAND()')) || []
  end

  def top_banner
    @top_banner ||= (Endorsement.where(enabled: true, endorsement_type: "top").limit(1).order(Arel.sql('RAND()')).first || Endorsement.new)
  end

  def vendors hall
    Endorsement.where(enabled: true, endorsement_type: "vendor-#{hall}").order(Arel.sql('RAND()'))
  end
  
end
