part of 'place_detail_import.dart';

class PlaceDetailViewModel {

  final Repository repository;
  VelocityBloc<PlaceDistanceMatrixModel> placeDistanceMatrixModelBloc = VelocityBloc<PlaceDistanceMatrixModel>(PlaceDistanceMatrixModel());
  PlaceDetailViewModel({required this.repository});

  getTimeDistance(BuildContext context,String destinations,String origins) async{
    showLoading(context);
    try{
      var response = await repository.placeRepo.getTimeDistance(destinations,origins);
          hideLoading(context);
          if(response.status == "OK"){
              debugPrint("response get success");
              placeDistanceMatrixModelBloc.onUpdateData(response);
          }else{
              debugPrint(response.errorMessage);
          }
    }on ApiException catch (e){
        hideLoading(context);
        debugPrint(e.message);
        VxToast.show(context, msg: "Error:${e.message}");
    }
  }
}