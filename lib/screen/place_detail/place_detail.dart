part of 'place_detail_import.dart';

@RoutePage()
class PlaceDetail extends StatefulWidget {
  const PlaceDetail(
      {super.key, required this.result, required this.currentLocation});

  final Result result;
  final String currentLocation;
  @override
  State<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  late final PlaceDetailViewModel placeDetailViewModel;

  @override
  void initState() {
    placeDetailViewModel =
        PlaceDetailViewModel(repository: context.read<Repository>());
    super.initState();
  }

  final int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Place Details".text.make(),
      ),
      body: Column(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 1.5,
                color: AppColor.secondaryColor,
                child: CustomNetworkImage(
                    imageUrl: (widget.result.photos != null && widget.result.photos!.isNotEmpty )?Utility.getImagePlase(widget.result.photos![0].photoReference!) : AppAssets.icPlaceholder,
                    cornerRadius: 25.0,
                    height: 85.0,
                    width: 85.0,
                ),
              ),
              20.0.h.heightBox,
              Container(
                width: MediaQuery.of(context).size.width,
                color: AppColor.primaryColor.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.result.name}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColor.bgColor,
                        fontSize: 25.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Rating :",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColor.bgColor,
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        5.0.w.widthBox,
                        RatingBarIndicator(
                          rating: (widget.result.rating != null)?widget.result.rating!.toDouble() : 0.0,
                          itemCount: 5,
                          itemSize: 20.0,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 25.0.h,
                          color: AppColor.secondaryColor,
                        ),
                        5.0.w.widthBox,
                        Text(
                          "${widget.result.vicinity}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColor.secondaryColor,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ).expand(),
                      ],
                    ),
                    BlocBuilder<VelocityBloc<PlaceDistanceMatrixModel>, VelocityState<PlaceDistanceMatrixModel>>(
                      bloc: placeDetailViewModel.placeDistanceMatrixModelBloc,
                      builder: (context, state) {
                        if(state is VelocityUpdateState){
                          var element = state.data.rows![0].elements![0];
                          String distance = Utility.metersToKilometers(element.distance!.value!).toString();
                          String durationTime = element.duration!.text!;
                          return Column(
                            children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.social_distance,
                                      size: 25.0.h,
                                      color: AppColor.secondaryColor,
                                    ),
                                    5.0.w.widthBox,
                                    Text(
                                      "$distance KM",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: AppColor.secondaryColor,
                                        fontSize: 14.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).expand(),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.punch_clock_sharp,
                                      size: 25.0.h,
                                      color: AppColor.secondaryColor,
                                    ),
                                    5.0.w.widthBox,
                                    Text(
                                      durationTime,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: AppColor.secondaryColor,
                                        fontSize: 14.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).expand(),
                                  ],
                                ),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                    
                  ],
                ).p(10.0.r),
              ).p(10.0.r).cornerRadius(40.0.r),
              
            ],
          ),
        ).expand(),
        CustomButton(
          title: "Get Directions",
          onPressed: () => {
            placeDetailViewModel.getTimeDistance(context,
                widget.result.vicinity!, widget.currentLocation),
          },
        ).p(20.0.r),
        30.0.h.heightBox,
      ]),
    );
  }
}
