/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 27.01.2022, 20:59
 */

class Geo {
    String? lat;
    String? lng;

    Geo({this.lat, this.lng});

    factory Geo.fromJson(Map<String, dynamic> json) {
        return Geo(
            lat: json['lat'], 
            lng: json['lng'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['lat'] = this.lat;
        data['lng'] = this.lng;
        return data;
    }
}