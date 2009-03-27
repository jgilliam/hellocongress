class Research < ActiveRecord::Base

  belongs_to :legislator
  belongs_to :issue
  
  validates_presence_of :research_request
  validates_length_of :research_request, :in => 3..60
  validates_presence_of :requester
  validates_length_of :requester, :in => 3..100
  validates_length_of :organization, :maximum => 100
  validates_presence_of :email
  validates_format_of :email, :with => /^[-^!$#%&'*+\/=3D?`{|}~.\w]+@[a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])*(\.[a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])*)+$/x

  alias_attribute :research_request, :name

end
