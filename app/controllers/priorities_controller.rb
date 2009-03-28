class PrioritiesController < ApplicationController

  def index
    if current_legislator
      @per_page = 25
      @page_title = "Priorities of " + current_legislator.name_with_title.possessive + " constituents"
      @priorities = current_legislator.priorities.by_position.paginate :page => params[:page], :per_page => @per_page
      @rss_url = url_for(:only_path => false, :format => "rss")
      respond_to do |format|
        format.html
        format.xml { render :xml => @priorities.to_xml }
        format.rss
      end    
    else
      respond_to do |format|
        format.html { render :template => "priorities/homepage", :layout => false }
      end
    end
  end

end
