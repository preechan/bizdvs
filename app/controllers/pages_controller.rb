class PagesController < ApplicationController
  def importContractor
  	@tradesMenu = Trade.all
  end
end
