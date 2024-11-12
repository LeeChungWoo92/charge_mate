import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class MarkerRepository {
  static List<NMarker> getMarkers() {
    return [
      NMarker(
        id: '1',
        position: const NLatLng(37.506932467450326, 127.05578661133796),
        icon: const NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
        size: const Size(60, 60),
      ),
      NMarker(
        id: '2',
        position: const NLatLng(37.606932467450326, 127.05578661133796),
        icon: const NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
        size: const Size(60, 60),
      ),
      NMarker(
        id: '3',
        position: const NLatLng(37.517752, 126.886437),
        icon: const NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
        size: const Size(60, 60),
      ),
      NMarker(
        id: '4',
        position: const NLatLng(37.527752, 126.896437),
        icon: const NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
        size: const Size(60, 60),
      ),
      NMarker(
        id: '5',
        position: const NLatLng(37.526752, 126.897437),
        icon: const NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
        size: const Size(60, 60),
      ),
      NMarker(
        id: '6',
        position: const NLatLng(37.56552, 126.897537),
        icon: const NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
        size: const Size(60, 60),
      ),
      NMarker(
        id: '7',
        position: const NLatLng(37.5388, 127.0893),
        icon: const NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
        size: const Size(60, 60),
      ),
      NMarker(
        id: '8',
        position: const NLatLng(37.5386, 127.0882),
        icon: const NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
        size: const Size(60, 60),
      ),
      NMarker(
        id: '9',
        position: const NLatLng(37.5383, 127.0869),
        icon: const NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
        size: const Size(60, 60),
      ),
    ];
  }

  static List<NInfoWindow> getMarkerInfoWindows() {
    return [
      NInfoWindow.onMarker(id: '1', text: '350원'),
      NInfoWindow.onMarker(id: '2', text: '311원'),
      NInfoWindow.onMarker(id: '3', text: '341원'),
      NInfoWindow.onMarker(id: '4', text: '321원'),
      NInfoWindow.onMarker(id: '5', text: '324원'),
      NInfoWindow.onMarker(id: '6', text: '364원'),
      NInfoWindow.onMarker(id: '7', text: '374원'),
      NInfoWindow.onMarker(id: '8', text: '375원'),
      NInfoWindow.onMarker(id: '9', text: '380원'),
    ];
  }
}
