class Subscription < ActiveRecord::Base

  named_scope :not_sent_this_week, :conditions => "subscriptions.sent_at < date_add(now(), INTERVAL -6 DAY)"

  belongs_to :legislator

  validates_presence_of :email
  validates_format_of :email, :with => /^[-^!$#%&'*+\/=3D?`{|}~.\w]+@[a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])*(\.[a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])*)+$/x
  validates_uniqueness_of :email, :scope => :legislator_id, :message => "is already subscribed"

end
