part of 'place_list_import.dart';

class PlaceListViewModel {

  final Repository repository;
  TextEditingController searchController = TextEditingController();

  VelocityBloc<PlaceModel> placeModelBloc = VelocityBloc<PlaceModel>(PlaceModel());
  VelocityBloc<LocationModel> locationModelBloc = VelocityBloc<LocationModel>(LocationModel());
  PlaceListViewModel({required this.repository});

  getNearByPlaces(BuildContext context,String nearBySearch,String latlng) async{
    try{
      var response = await repository.placeRepo.nearBySearch(nearBySearch,latlng);
          if(response.status == "OK"){
              debugPrint("response get success");
              placeModelBloc.onUpdateData(response);
          }else{
              debugPrint(response.errorMessage);
          }
    }on ApiException catch (e){
        debugPrint(e.message);
        VxToast.show(context, msg: "Error: ${e.message}");
    }
  }

  getCurrentAddress(BuildContext context,String latlng) async{
     debugPrint("latlng:$latlng");
    try{
      var response = await repository.placeRepo.getCurrentAddress(latlng);
          if(response.status == "OK"){
              debugPrint("response get success");
              locationModelBloc.onUpdateData(response);
          }else{
              debugPrint(response.errorMessage);
          }
    }on ApiException catch (e){
      debugPrint(e.message);
      VxToast.show(context, msg: "Error: ${e.message}");
    }
  }
}