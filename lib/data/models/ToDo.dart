/*
 * Created by Kosyachenko Roman on 13.02.2022, 22:44
 * Copyright (c) 2022 . All rights reserved.
 * Last modified 27.01.2022, 20:59
 */

class ToDo {
    bool? completed;
    int? id;
    String? title;
    int? userId;

    ToDo({this.completed, this.id, this.title, this.userId});

    factory ToDo.fromJson(Map<String, dynamic> json) {
        return ToDo(
            completed: json['completed'], 
            id: json['id'], 
            title: json['title'], 
            userId: json['userId'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['completed'] = this.completed;
        data['id'] = this.id;
        data['title'] = this.title;
        data['userId'] = this.userId;
        return data;
    }
}