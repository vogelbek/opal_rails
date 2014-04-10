class Timeout
  def initialize(time=0, &block)
    `setTimeout(function(){#{block.call}}, time)`
  end
end

class GeoLocate
  attr_accessor :coords
  def get_pos
    `navigator.geolocation.getCurrentPosition(function(position){#{yield(`position`)}});`
  end
end

a = GeoLocate.new
a.get_pos do |position|
  a.coords = JSON.parse(`JSON.stringify(#{position}.coords)`, symbolize_names: true)
end


Timeout.new 5000 do
  a.coords.map{|k,v| puts "Key: #{k}, Value: #{v}"}
end

