/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 27.01.2022, 20:59
 */

class Company {
    String? bs;
    String? catchPhrase;
    String? name;

    Company({this.bs, this.catchPhrase, this.name});

    factory Company.fromJson(Map<String, dynamic> json) {
        return Company(
            bs: json['bs'], 
            catchPhrase: json['catchPhrase'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['bs'] = this.bs;
        data['catchPhrase'] = this.catchPhrase;
        data['name'] = this.name;
        return data;
    }
}