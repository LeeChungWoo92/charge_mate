import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class ChargingMapScreen extends StatefulWidget {
  const ChargingMapScreen({super.key});

  @override
  State<ChargingMapScreen> createState() => _ChargingMapScreenState();
}

class _ChargingMapScreenState extends State<ChargingMapScreen> {
  double? latitude;
  double? longitude;
  bool _isMapReady = false;

  final List<NMarker> _markers = [
    NMarker(
      id: '1',
      position: NLatLng(37.506932467450326, 127.05578661133796),
      icon: NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
      size: Size(60, 60),
    ),
    NMarker(
      id: '2',
      position: NLatLng(37.606932467450326, 127.05578661133796),
      icon: NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
      size: Size(60, 60),
    ),
    NMarker(
      id: '3',
      position: NLatLng(37.517752, 126.886437),
      icon: NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
      size: Size(60, 60),
    ),
    NMarker(
      id: '4',
      position: NLatLng(37.527752, 126.896437),
      icon: NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
      size: Size(60, 60),
    ),
    NMarker(
      id: '5',
      position: NLatLng(37.526752, 126.897437),
      icon: NOverlayImage.fromAssetImage('assets/icons/ic_charging_location.png'),
      size: Size(60, 60),
    ),
  ];
  final List<NInfoWindow> _markersInfo = [
    NInfoWindow.onMarker(id: '1', text: '200원'),
    NInfoWindow.onMarker(id: '2', text: '221원'),
    NInfoWindow.onMarker(id: '3', text: '221원'),
    NInfoWindow.onMarker(id: '4', text: '321원'),
    NInfoWindow.onMarker(id: '5', text: '324원'),
  ];

  @override
  void initState() {
    super.initState();
    initMap(); // 맵 초기화 함수 호출
  }

  // 비동기적으로 위치 권한과 현재 위치 정보를 얻는 함수
  Future<void> initMap() async {
    await _permission(); // 위치 권한 요청
    await getMyCurrentLocation(); // 현재 위치 요청
  }

  // 현재 위치를 가져오는 함수
  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission(); // 위치 정보 권한 요청
      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high); // 현재 위치 구하기
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
        _isMapReady = true; // 위치 정보 수신 후 맵 로딩을 허용
      });
    } catch (e) {
      print('Error occurred while getting location: $e');
    }
  }

  // 위치 권한 요청 함수
  Future<void> _permission() async {
    var requestStatus = await Permission.location.request();
    var status = await Permission.location.status;
    if (requestStatus.isPermanentlyDenied || status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  // 마커를 추가하고 정보창을 설정하는 함수
  void _addMarkersAndInfoWindows(NaverMapController controller) {
    controller.addOverlayAll(_markers.toSet());

    for (int i = 0; i < _markers.length; i++) {
      _markers[i].openInfoWindow(_markersInfo[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isMapReady
          ? NaverMap(
              options: NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                  target: NLatLng(latitude!, longitude!), // 위치 정보로 초기 맵 위치 설정
                  zoom: 17,
                ),
                indoorEnable: true,
                consumeSymbolTapEvents: false,
                locationButtonEnable: true,
                logoClickEnable: false,
              ),
              onMapReady: (controller) {
                print('네이버 맵 로딩 완료');
                _addMarkersAndInfoWindows(controller); // 마커 및 정보창 추가
              },
            )
          : const Center(
              // 위치 정보 로딩 중일 때 로딩 스피너 표시
              child: CircularProgressIndicator(),
            ),
    );
  }
}
