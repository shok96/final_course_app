
/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 14.01.2022, 21:32
 */

import 'dart:convert';

MTaskResult MTaskResultFromJson(String str) => MTaskResult.fromJson(json.decode(str));

String MTaskResultToJson(MTaskResult data) => json.encode(data.toJson());
class MTaskResult<T> {
    bool isSuccessfull;
    String? data;
    String? error;
    Map<String, dynamic>? json_data;
    T? body;

    String? getJsonData(String key){
        try {
           return json_data![key];
        }
        catch(e){
            return data?.replaceAll("{", "").replaceAll("}", "");
        }
        return data;
    }

    MTaskResult({this.data, this.isSuccessfull = false, this.body, this.json_data, this.error});

    factory MTaskResult.fromJson(Map<String, dynamic> json) {
        return MTaskResult(
            data: json['data'],
            isSuccessfull: json['isSuccessfull'],
            body: json['body'],
            error: json['error'],
        );
    }

    factory MTaskResult.createBlank(T data) {
        return MTaskResult(
            data: null,
            isSuccessfull: true,
            body: data,
            error: null,
        );
    }

    factory MTaskResult.createFailure({String? error = "null blank"}) {
        return MTaskResult(
            data: null,
            isSuccessfull: false,
            body: null,
            error: error,
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['data'] = this.data;
        data['isSuccessfull'] = this.isSuccessfull;
        data['body'] = this.body;
        data['error'] = this.error;
        return data;
    }
}