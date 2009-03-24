# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def time_ago(time, options = {})
    if request.xhr?
      distance_of_time_in_words_to_now(time) + ' ago'
    else
      options[:class] ||= "timeago"
      content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
    end
  end  
  
  def flash_div *keys
    keys.collect { |key| content_tag(:div, flash[key], :class => "flash_#{key}") if flash[key] }.join
  end

  def priority_sentence(priority)
    r = []
    r << pluralize(priority.endorsers_count, "endorser") if priority.endorsers_count > 0
    r << pluralize(priority.opposers_count, "opposer") if priority.opposers_count > 0
    r << pluralize(priority.documents_count, "document") if priority.documents_count > 0    
    r << pluralize(priority.points_count, "talking point") if priority.points_count > 0
    r.to_sentence        
  end
  
  def revisions_sentence(user)
    return "" if user.points_count+user.documents_count+user.document_revisions_count+user.point_revisions_count == 0
    r = []
    r << '<a href="' + user.url + '/points">' + pluralize(user.points_count,"talking point") + '</a>' if user.points_count > 0 
    r << '<a href="' + user.url + '/documents">' + pluralize(user.documents_count,"document") + '</a>' if user.documents_count > 0   
    r << pluralize(user.document_revisions_count+user.point_revisions_count,"revision") if user.document_revisions_count > 0 or user.point_revisions_count > 0
    "contributed " + r.to_sentence
  end

end
