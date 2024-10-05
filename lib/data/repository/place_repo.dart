import 'package:map_apis_demo/data/api_client.dart';
import 'package:map_apis_demo/data/api_constant.dart';
import 'package:map_apis_demo/data/api_exception.dart';
import 'package:map_apis_demo/data/models/place_model.dart';

import '../models/location_model.dart';
import '../models/place_distance_matrix.dart';

class PlaceRepo extends ApiClient{
  
    Future<LocationModel> getCurrentAddress(String latlng) async {
      var path = "${ApiConstant.geocode}${ApiConstant.latlng}=$latlng&${ApiConstant.key}=${ApiConstant.mapKey}";

      var response = await getDataRequest(path: path);
      if(response.statusCode == 200){
          return LocationModel.fromJson(response.data);
      }else{
        throw ApiException(message: "Response Fail Status Code:${response.statusCode} \n Error:${response.statusMessage}");
      }
     
  }

  Future<PlaceModel> nearBySearch(String nearBySearch,String latlng) async {
      var path = "${ApiConstant.nearBySearch}${ApiConstant.keyword}=$nearBySearch&${ApiConstant.location}=$latlng&${ApiConstant.radius}=1000&${ApiConstant.key}=${ApiConstant.mapKey}";

      var response = await getDataRequest(path: path);
      if(response.statusCode == 200){
          return PlaceModel.fromJson(response.data);
      }else{
        throw ApiException(message: "Response Fail Status Code:${response.statusCode} \n Error:${response.statusMessage}");
      }
     
  }
  
  Future<PlaceDistanceMatrixModel> getTimeDistance(String destinations,String origins) async {
      var path = "${ApiConstant.distanceMatrix}${ApiConstant.destinations}=$destinations&${ApiConstant.origins}=$origins&${ApiConstant.units}=imperial&${ApiConstant.key}=${ApiConstant.mapKey}";

      var response = await getDataRequest(path: path);
      if(response.statusCode == 200){
          return PlaceDistanceMatrixModel.fromJson(response.data);
      }else{
        throw ApiException(message: "Response Fail Status Code:${response.statusCode} \n Error:${response.statusMessage}");
  }
     
  }
}