require 'nokogiri'
#require 'occme/config'
require 'occme/channels'


module CME::Generator

  def self.config(args)
    @chans=[]
    @data=args
    @data[:sym].each do |sym|
      
      next if inchan?(sym)
      CME::Channels.build(sym)
    end
  end
 
  def inchan?(sym)

  end

end
