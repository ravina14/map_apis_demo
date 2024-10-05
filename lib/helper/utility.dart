import '../data/api_constant.dart';

class Utility {
Utility._();
 
 static String getImagePlase(String photoreference){
   return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoreference&key=${ApiConstant.mapKey}";
  }

 static double metersToKilometers(int meters) {
  return meters / 1000; // 1 kilometer = 1000 meters
}
}