class SubscriptionsController < ApplicationController

  # GET /subscriptions/new
  # GET /subscriptions/new.xml
  def new
    @subscription = Subscription.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subscription }
    end
  end

  # POST /subscriptions
  # POST /subscriptions.xml
  def create
    @subscription = Subscription.new(params[:subscription])
    @subscription.legislator = current_legislator
    respond_to do |format|
      if @subscription.save
        flash[:notice] = 'You are now subscribed to a weekly email about the priorities of ' + current_legislator.name_with_title.possessive + ' constituents'
        format.html { redirect_to "/" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /subscriptions/unsubscribe
  def unsubscribe
    @page_title = "Hello Congress unsubscribe"
    @subscription = Subscription.new
  end  
  
  # POST /subscriptions/remove
  def remove
    @subscriptions = Subscription.find_all_by_email(params[:subscription][:email])
    @number = @subscriptions.size || 0
    for sub in @subscriptions
      sub.destroy
    end
    flash[:error] = 'Removed ' + @number.to_s + ' subscription(s) for ' + params[:subscription][:email]
    redirect_to("/")
  end

end
