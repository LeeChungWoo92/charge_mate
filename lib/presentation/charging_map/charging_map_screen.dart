import 'dart:async';

import 'package:charge_mate/presentation/component/persistent_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/repository/marker_repository.dart';
import '../../utils/geocoding_helper.dart';

class ChargingMapScreen extends StatefulWidget {
  const ChargingMapScreen({super.key});

  @override
  State<ChargingMapScreen> createState() => _ChargingMapScreenState();
}

class _ChargingMapScreenState extends State<ChargingMapScreen> {
  double? latitude;
  double? longitude;
  bool _isMapReady = false;
  String address = "Fetching address...";

  final List<NMarker> _markers = MarkerRepository.getMarkers();
  final List<NInfoWindow> _markersInfo = MarkerRepository.getMarkerInfoWindows();

  @override
  void initState() {
    super.initState();
    initMap();
    //_getAddress();
  }

  Future<void> initMap() async {
    await _permission(); // 위치 권한 요청
    await getMyCurrentLocation(); // 현재 위치 요청
  }

  Future<void> _getAddress(double markerLatitude, double markerLongitude) async {
    String result = await GeocodingHelper.getSimpleAddressFromLatLng(
        markerLatitude, markerLongitude); // 위도, 경도 예시
    setState(() {
      address = result; // 주소 값으로 업데이트
      print('주소: $address');
    });
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
      _markers[i].setOnTapListener((NMarker marker) {
        print('마커클릭');
        //print(_markersInfo[i].info);
        _getAddress(_markers[i].position.latitude, _markers[i].position.longitude);
        print(_markers[i].position.latitude);
        print(_markers[i].position.longitude);
        controller.updateCamera(NCameraUpdate.withParams(
            target: NLatLng(_markers[i].position.latitude, _markers[i].position.longitude)));
        showBottomSheet(
            context: context,
            builder: (context) {
              return PersistentBottomSheet(address: address);
            });
      });
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
