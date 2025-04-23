import 'dart:ui';

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:newhotelyemeni/view/screen/hotelsLocations/controller/hotel_controller.dart';

var pointLayer = {
  "id": "point_layer",
  "type": "symbol",
  "source": "point_source"
};

var mapIconStyle = {
  "icon-image": "icon",
  "icon-opacity": 1.0,
  "icon-size": [
    "interpolate",
    ["linear"],
    ["zoom"],
    8,
    0.0,
    10,
    0.015,
    12,
    0.025,
    13,
    0.038,
  ],
  "icon-allow-overlap": true,
  "icon-halo-color": null,
  "icon-halo-blur": 0,
  "icon-halo-width": 0,
  "icon-color": "RED"
};

var textHotelLayer = {
  "id": "hotels-text-layer",
  "type": "symbol",
  "source": "point_source"
};

var textHotelStyle = {
  // "minZoom": 10,
  "layout": {
    "text-field": ["get", "name"],
    "text-size": [
      "interpolate",
      ["linear"],
      ["zoom"],
      8,
      0.0,
      10,
      8,
      12,
      10,
    ],
    "text-offset": [0, 1.9],
    // "text-visibility": [
    //   "step",
    //   ["zoom"],
    //   8,
    //   "none",
    //   13,
    //   "visible"
    // ]
  },
  "paint": {
    "text-color": "#e74c3c",
    // "text-halo-color": "#ffffff",
    "text-halo-width": 1.5
  }
};

iconHotelsData(List<HotelModel> hotels) {
  return {
    'type': 'geojson',
    'data': {
      'type': 'FeatureCollection',
      'features': hotels
          .map(
            (e) => e.toGeoJson(),
          )
          .toList()
    }
  };
}

LineLayer lineLayerStyle = LineLayer(
  id: 'layer',
  sourceId: 'source',
  lineCap: LineCap.ROUND,
  lineJoin: LineJoin.ROUND,
  lineBlur: 1.0,
  lineColor: const Color.fromARGB(255, 26, 147, 247).value,
  // lineDasharray: [1.0, 2.0],
  lineWidth: 6.0,
  // draw layer with gradient
  // lineGradientExpression: [
  //   "interpolate",
  //   ["linear"],
  //   ["line-progress"],
  //   0.0,
  //   ["rgb", 255, 255, 255],
  //   0.4,
  //   ["rgb", 255, 255, 255],
  //   1.0,
  //   ["rgb", 0, 0, 255]
  // ],
);
