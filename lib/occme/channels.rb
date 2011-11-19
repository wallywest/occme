module CME
class Channels
  attr_reader :channels 

  def self.build(sym)
      @cmeconfig=File.open("conf/config.xml",'r')
      @cme=Nokogiri::XML(@cmeconfig)
      @channels=[]
      @sym=sym
      findchannel
  end

  def self.findchannel
    @cme.xpath("//configuration/channel").each do |ch|
        setAttributes(ch) unless findcode(ch).empty?
    end
  end
  def self.findcode(ch)
      code=ch.xpath("products/product[@code='#{@sym}']")
  end
  
  def self.setAttributes ch
      @label=ch.attributes["label"].value.rstrip.chomp
      @id=ch.attributes["id"].value.rstrip.chomp
      @chpath=ch.path
      getConnections
  end
  def self.getConnections
      %w{ IA IB NA NB SA SB}.each do |feed|
          %w{ip port}.each do |child|
              config=@cme.xpath("#{@chpath}/connections/connection[@id='#{@id}#{feed}']/#{child}")
              define(feed,child,config.children.text)
          end
      end
  end
  def self.define(*args)
      p args
  end
end
end
