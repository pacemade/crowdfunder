module UsersHelper

  def sum_of_pledges
    total = 0
    @pledges.each do |pledge|
      total += pledge.dollar_amount
    end
    return total
  end
end
