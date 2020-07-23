module EndorsementHelper
  def random_endorsements num
    return @endorsements if @endorsements.present?
    num = [num, Endorsement.all.count].min
    @endorsements = ( Endorsement.limit(6).order(Arel.sql('RAND()')) || [] )
  end
end
