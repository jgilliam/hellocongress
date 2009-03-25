xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @page_title
    xml.description "We're your constituents, and we're here to serve you."
    xml.link url_for :format => "rss"
    for priority in @priorities
      xml.item do
        xml.title '#' + priority.position.to_s + ' ' + priority.name
        xml.description priority_sentence(priority)
        xml.pubDate priority.created_at.to_s(:rfc822)
        xml.link priority_url(priority)
      end
    end
  end
end