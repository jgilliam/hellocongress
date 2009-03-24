class PrioritiesController < ApplicationController

  def index
    @per_page = 25
    @page_title = "Hello, " + current_legislator.name_with_title + "."
    @header_title = "Hello " + current_legislator.lastname_with_title + ", "
    @priorities = current_legislator.priorities.by_position.paginate :page => params[:page], :per_page => @per_page
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @priorities }
    end    
  end

end
