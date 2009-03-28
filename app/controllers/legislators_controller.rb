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
    @q = h(params[:legislator][:name])
    @legislators = Legislator.find(:all, :conditions => ["name LIKE ? or fullname like ?", @q,@q], :order => "name desc")
    if @legislators.size == 1
      redirect_to @legislators[0].url
      return
    end
    if @legislators.empty?
      govtrack_ids = []
      if @q.length == 5 # try the zip code
        for s in Sunlight::Legislator.all_in_zipcode(@q)
          govtrack_ids << s.govtrack_id
        end
      else
        sun = Sunlight::Legislator.all_for(:address => @q)
        if sun.size > 0
          govtrack_ids << sun[:senior_senator].govtrack_id
          govtrack_ids << sun[:junior_senator].govtrack_id
          govtrack_ids << sun[:representative].govtrack_id
        end
      end
      if govtrack_ids.any?
        @legislators = Legislator.by_state.find(:all, :conditions => ["govtrack_id in (?)",govtrack_ids])
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @legislators }
    end    
  end

end