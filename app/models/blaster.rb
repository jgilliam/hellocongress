class Blaster < ActionMailer::Base

  def weekly_newsletter(subscription)
    setup_email(subscription.email)
    @subject = "Hello Congress update for " + subscription.legislator.name_with_title
    @body[:email] = subscription.email
    @body[:legislator] = subscription.legislator
    @body[:priorities] = subscription.legislator.priorities.by_position.find(:all, :limit => 50)
  end

  protected
    def setup_email(email)
      @recipients  = "#{email}"
      @from        = "Jim Gilliam <jim@whitehouse2.org>"
      headers        "Reply-to" => "jim@whitehouse2.org"
      @sent_on     = Time.now
      @content_type = "text/plain"      
    end  

end
