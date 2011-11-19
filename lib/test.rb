require 'nokogiri'
f=File.open("conf/config.xml",'r')
@cme=Nokogiri::XML(f)
channels=@cme.xpath("//configuration/channel")
channels.each do |ch|
  #p ch.attributes["label"].value.rstrip
  #p ch.attributes["id"].value.rstrip
  p ch.path
  code=ch.xpath("products/product[@code='ES']")
  unless code.empty?
    #p code.first.attributes["code"].value
  end
end
@cme.xpath("//configuration/channel[1]/connections").each do |conn|
  conn.children.each do |children|
    p children
    p children.attributes
    p children.values
  end
end
