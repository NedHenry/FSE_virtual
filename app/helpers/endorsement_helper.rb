module EndorsementHelper
  def random_sponsors num
    sponsors = Endorsement.where(enabled: true, endorsement_type: "sponsor")
    num = [num, sponsors.count].min
    sponsors.limit(num).order(Arel.sql('RAND()')) || []
  end

  def premier_sponsors num=3
    get_sponsors('premier',num)
  end
  
  def secondary_sponsors num=4
    get_sponsors('sponsor',num)
  end

  def get_sponsors(sponsor_type, num = 0)
    sponsors = Endorsement.where(enabled: true, endorsement_type: sponsor_type)
    sponsors = sponsors.limit(num) if (num > 0)
    sponsors = sponsors.order(Arel.sql('RAND()')).to_a
    return [] unless sponsors.count > 0
    while sponsors.count < num do
      sponsors << sponsors.first
    end
    return sponsors
  end

  def endorsements_by_type(type,n=nil)
    endorsements = Endorsement.where(enabled: true, endorsement_type: type)
    endorsements = endorsements.limit(n) if n.present?
    endorsements = endorsements.order(Arel.sql('RAND()')) || []
  end

  def cruise_spaces(n=nil)
    endorsements_by_type("cruise",n)
  end

  def experience_partners(n=nil)
    endorsements_by_type("experience",n)
  end

  def top_banner
    @top_banner ||= (Endorsement.where(enabled: true, endorsement_type: "top").limit(1).order(Arel.sql('RAND()')).first || Endorsement.new)
  end

  def vendors hall
    Endorsement.where(enabled: true, endorsement_type: "vendor-#{hall}").order(Arel.sql('RAND()'))
  end
  
end
