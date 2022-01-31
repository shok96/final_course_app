import 'package:final_course_app/models/ToDo.dart';
import 'package:final_course_app/models/users/User.dart';
import 'package:final_course_app/widgets/navigation_drawer.dart';
import 'package:final_course_app/widgets/todo_tile.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ToDoList extends StatelessWidget {
  static const String routeName = '/todo';
  ToDoList({Key? key}) : super(key: key);

  Future<List<ToDo>> _getToDo(int id) async {
    final response = await net.asyncResult(net.api.getToDo(id));
    List<ToDo> result = [];
    if (response.isSuccessfull) {
      result.addAll(response.body!);
      return result;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationDrawer(),
      appBar: AppBar(title: Text("Задачи"),),
      body: Stack(
        children: [
          Image.asset("assets/bg.png", fit: BoxFit.cover, height: double.infinity,),
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: FutureBuilder<List<ToDo>>(
                        future: _getToDo(1),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final data = snapshot.data![index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 2),
                                    child: Card(
                                      color: Colors.white24,
                                      child: TodoTile(data: data),
                                    ),
                                  );
                                });
                          }
                        }),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
