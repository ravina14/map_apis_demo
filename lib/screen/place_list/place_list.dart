part of 'place_list_import.dart';

@RoutePage()
class PlaceList extends StatefulWidget {
  const PlaceList({super.key});

  @override
  State<PlaceList> createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  Timer? _debounce;
  final int typingDelayMillis = 1000;
  late final PlaceListViewModel placeViewModel;
  Position? _currentPosition;

  Future<void> _getLocation() async {
    LocationManager locationManager = LocationManager(context);
    Position? position = await locationManager.getCurrentPosition();
    setState(() {
      _currentPosition = position;
    });

    var latlng = "${_currentPosition!.latitude},${_currentPosition!.longitude}";
    placeViewModel.getCurrentAddress(context,latlng);
    placeViewModel.getNearByPlaces(context,"",latlng);
  }

_onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: typingDelayMillis), () {
    final search = placeViewModel.searchController.text.trim();
      if (search.isNotEmpty) {
        var latlng = "${_currentPosition!.latitude},${_currentPosition!.longitude}";
         placeViewModel.getNearByPlaces(context,search,latlng);
      }
    });
  }

  @override
  void initState() {
    
    placeViewModel = PlaceListViewModel(repository: context.read<Repository>());
     _getLocation();
    placeViewModel.searchController.addListener(_onSearchChanged);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String currentLocation = "";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0,
        leading: Icon( 
              Icons.location_pin , 
              size: 30.0.h,
            )
    ,   
        title: BlocBuilder<VelocityBloc<LocationModel>, VelocityState<LocationModel>>(
          bloc: placeViewModel.locationModelBloc,
          builder: (context, state) {
            if(state is VelocityUpdateState){
              currentLocation = state.data.results![0].formattedAddress!;
             return currentLocation.text.maxLines(2).make();
            }
            return "Fetcing Location..".text.size(25.0.sp).maxLines(1).make();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.r),
        child: Column(children: [
          20.h.heightBox,
          CustomTextFormField(
              hintText: "Search",
              isShowLable: true,
              prefixIcomnName: AppAssets.icSearch,
              controller: placeViewModel.searchController,
            ),
          20.h.heightBox,
          BlocBuilder<VelocityBloc<PlaceModel>, VelocityState<PlaceModel>>(
            bloc: placeViewModel.placeModelBloc,
            builder: (context, state) {
              if(state is VelocityUpdateState){
              List<Result> resultList = state.data.results ?? [];
              return ListView.separated(
                separatorBuilder: (context, index) => 20.h.heightBox,
                shrinkWrap: true,
                itemCount: resultList.length,
                itemBuilder: (context, index) {
                  Result result = resultList[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(20.0.r),
                    splashColor: AppColor.primaryColor.withOpacity(0.1),
                    onTap: () {
                      AutoRouter.of(context).push(PlaceDetailRoute(result: result,currentLocation: currentLocation));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.secondaryColor
                                .withOpacity(0.1),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20.0.r)),
                        child: Row(
                          children: [
                            10.0.w.widthBox,
                            CustomNetworkImage(
                              imageUrl: (result.photos != null && result.photos!.isNotEmpty )?Utility.getImagePlase(result.photos![0].photoReference!) : AppAssets.icPlaceholder,
                              cornerRadius: 25.0,
                              height: 85.0,
                              width: 85.0,
                            ),
                            10.widthBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                      result.name!,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 16.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    (result.rating == null) ? 
                                    "Rating : 0.0" :
                                    "Rating : ${result.rating.toString()}",
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: AppColor.secondaryColor,
                                        fontSize: 12.0.sp,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                  ),
                              ],
                            ).expand(),
                            10.widthBox,
                          ],
                        ).p(10.0.r),
                        ),
                  );
                },
              );
              }
              return SizedBox(
                height: 50.0.h,
                width: 50.0.h,
                child: const CircularProgressIndicator().centered(),
              );
            },
          ).expand(),
        ]),
      ),
    );
  }
}