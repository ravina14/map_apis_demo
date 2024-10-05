part of 'place_detail_import.dart';

class PlaceDetailViewModel {

  final Repository repository;
  VelocityBloc<PlaceDistanceMatrixModel> placeDistanceMatrixModelBloc = VelocityBloc<PlaceDistanceMatrixModel>(PlaceDistanceMatrixModel());
  PlaceDetailViewModel({required this.repository});

  getTimeDistance(String destinations,String origins) async{
    try{
      var response = await repository.placeRepo.getTimeDistance(destinations,origins);
          if(response.status == "OK"){
              debugPrint("response get success");
              placeDistanceMatrixModelBloc.onUpdateData(response);
          }else{
              debugPrint(response.errorMessage);
          }
    }on ApiException catch (e){
      debugPrint(e.message);
    }
  }
}