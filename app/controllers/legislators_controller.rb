class LegislatorsController < ApplicationController

  # GET /legislators
  # GET /legislators.xml
  def index
    if params[:q] and request.xhr?
      @legislators = Legislator.find(:all, :conditions => ["name LIKE ? or fullname like ?", "%#{h(params[:q])}%","%#{h(params[:q])}%"], :order => "name desc")
    else
      @legislators1 = Legislator.by_state.find(:all, :conditions => "state in ('AK','AL','AR','AZ','CA','CO','CT','DC','DE','FL')")
      @legislators2 = Legislator.by_state.find(:all, :conditions => "state in ('GA','HI','IA','ID','IL','IN','KS','KY','LA','MA','MD','ME','MI','MN')")
      @legislators3 = Legislator.by_state.find(:all, :conditions => "state in ('MO','MS','MT','NC','ND','NE','NH','NJ','NM','NV','NY','OH','OK','OR')")
      @legislators4 = Legislator.by_state.find(:all, :conditions => "state in ('PA','RI','SC','SD','TN','TX','UT','VA','VT','WA','WI','WV','WY')")
    end
    @legislator = Legislator.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @legislators }
      format.js { render :text => @legislators.collect{|p|p.name}.join("\n") }      
    end
  end
  
  def search
    @q = params[:q]
    @legislators = Legislator.search(@q)
    if @legislators.size == 1
      redirect_to @legislators[0].url
      return
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @legislators }
    end    
  end

end