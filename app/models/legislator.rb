class Legislator < ActiveRecord::Base
  
  def name_with_title
    title + '. ' + name
  end
  
  def lastname_with_title
    title + '. ' + lastname
  end
  
end