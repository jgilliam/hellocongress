class ConstituentsController < ApplicationController

  def index
    @page_title = current_legislator.name_with_title.possessive + " constituents"
  end

end
