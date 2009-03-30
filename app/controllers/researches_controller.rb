class ResearchesController < ApplicationController

  # GET /researches
  # GET /researches.xml
  def index
    @page_title = "Hello Congress research requests"
    @researches = Research.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @researches.to_xml(:except => [:email]) }
      format.rss
    end
  end

  # GET /researches/1
  # GET /researches/1.xml
  def show
    @research = Research.find(params[:id])
    @page_title = "Hello Congress research request: " + @research.name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @research.to_xml(:except => [:email]) }
    end
  end

  # GET /researches/new
  # GET /researches/new.xml
  def new
    @research = Research.new
    @page_title = "Request research from White House 2 members"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @research.to_xml(:except => [:email]) }
    end
  end

  # POST /researches
  # POST /researches.xml
  def create
    @research = Research.new(params[:research])
    @research.legislator = current_legislator
    respond_to do |format|
      if @research.save
        flash[:notice] = 'Your research request has been submitted.  Keep your eye on an email from White House 2 with updates on your request.'
        format.html { redirect_to(@research) }
        format.xml  { render :xml => @research, :status => :created, :location => @research }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @research.errors, :status => :unprocessable_entity }
      end
    end
  end

end
