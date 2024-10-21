import 'package:geocoding/geocoding.dart';

class GeocodingHelper {
  static Future<String> getSimpleAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];

      String street = place.street ?? '';
      String address = street.replaceFirst('대한민국', '').trim();

      // 원하는 주소 형식으로 반환: "서울특별시 강남구 삼성동 100-3"
      return address;
    } catch (e) {
      print('Error occurred: $e');
      return "Address not available";
    }
  }
}
