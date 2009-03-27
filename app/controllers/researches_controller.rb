class ResearchesController < ApplicationController
  # GET /researches
  # GET /researches.xml
  def index
    @researches = Research.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @researches }
    end
  end

  # GET /researches/1
  # GET /researches/1.xml
  def show
    @research = Research.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @research }
    end
  end

  # GET /researches/new
  # GET /researches/new.xml
  def new
    @research = Research.new
    @page_title = "Request research from White House 2 members"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @research }
    end
  end

  # GET /researches/1/edit
  def edit
    @research = Research.find(params[:id])
  end

  # POST /researches
  # POST /researches.xml
  def create
    @research = Research.new(params[:research])

    respond_to do |format|
      if @research.save
        flash[:notice] = 'Research was successfully created.'
        format.html { redirect_to(@research) }
        format.xml  { render :xml => @research, :status => :created, :location => @research }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @research.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /researches/1
  # PUT /researches/1.xml
  def update
    @research = Research.find(params[:id])

    respond_to do |format|
      if @research.update_attributes(params[:research])
        flash[:notice] = 'Research was successfully updated.'
        format.html { redirect_to(@research) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @research.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /researches/1
  # DELETE /researches/1.xml
  def destroy
    @research = Research.find(params[:id])
    @research.destroy

    respond_to do |format|
      format.html { redirect_to(researches_url) }
      format.xml  { head :ok }
    end
  end
end
