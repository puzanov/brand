class MapController < ApplicationController
  def index
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([42.878408,74.618534],18)
    @map.overlay_init(GMarker.new([42.878948,74.618534],:title => "Компания BRAND", :info_window => "Info! Info!"))
    @map.set_map_type_init(GMapType::G_HYBRID_MAP)
  end
end
