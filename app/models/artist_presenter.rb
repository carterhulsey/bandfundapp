class ArtistPresenter < SimpleDelegator
  def formatted_location
    "#{city.capitalize}, #{state.upcase}"
  end

  def number_of_fans
    199
  end

  def number_of_followers
    942
  end

  def current_monthly_contributions
    1450
  end
end
