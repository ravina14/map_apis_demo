// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
    List<ResultLocation>? results;
    String? status;
    String? errorMessage;

    LocationModel({
        this.results,
        this.status,
         this.errorMessage,
    });

    factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        results: json["results"] == null ? [] : List<ResultLocation>.from(json["results"]!.map((x) => ResultLocation.fromJson(x))),
        status: json["status"],
        errorMessage : json["error_message"],
    );

    Map<String, dynamic> toJson() => {
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "status": status,
         "error_message": errorMessage,
    };
}

class ResultLocation {
    String? formattedAddress;

    ResultLocation({
        this.formattedAddress,
    });

    factory ResultLocation.fromJson(Map<String, dynamic> json) => ResultLocation(
        formattedAddress: json["formatted_address"],
    );

    Map<String, dynamic> toJson() => {
        "formatted_address": formattedAddress,
    };
}
