class PagesController < ApplicationController
	load_and_authorize_resource
  def importContractor
  	@tradesMenu = Trade.all
  end
end
