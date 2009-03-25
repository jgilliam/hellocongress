class ConstituentsController < ApplicationController

  def index
    @page_title = current_legislator.name_with_title.possessive + " constituents"
    @header_title = "Hello " + current_legislator.lastname_with_title + ", "
    @constituents = Wh2User.paginate(:all, :from => "/legislators/#{current_legislator.wh2_id}/constituents.xml", :params => {:page => params[:page], :per_page => @per_page})
  end

end
