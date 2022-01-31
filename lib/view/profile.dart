import 'package:final_course_app/main.dart';
import 'package:final_course_app/models/ToDo.dart';
import 'package:final_course_app/models/users/User.dart';
import 'package:final_course_app/network/responseModel/MTaskResult.dart';
import 'package:final_course_app/widgets/navigation_drawer.dart';
import 'package:final_course_app/widgets/todo_tile.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';
  Profile({Key? key}) : super(key: key);

  Future<MTaskResult<User>> _getUser(int id) async{
    return net.asyncResult(net.api.getUser(id));
  }

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

    final args = ModalRoute.of(context)?.settings?.arguments;

    final id = args != null ? args as int : 1;

    return Scaffold(
      drawer: navigationDrawer(),
      appBar: AppBar(title: Text("Профиль"),),
      body: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: FutureBuilder<MTaskResult<User>>(
                          future: _getUser(id),
                          builder: (context, snapshot) {
                            if(!snapshot.hasData){
                              return Center(child: CircularProgressIndicator(),);
                            }
                            else {
                              if(!snapshot.data!.isSuccessfull){
                                return ErrorWidget(Exception("error"));
                              }
                              else {
                                final profile = snapshot.data!.body;
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    Text(profile?.username ?? ""),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text("Имя ${profile?.name ?? ""}"),
                                            Text("Email ${profile?.email ?? ""}"),
                                            Row(
                                              children: [
                                                Icon(Icons.phone,
                                                  color: Colors.white,),
                                                SizedBox(width: 10,),
                                                Text("${profile?.phone ?? ""}"),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 8),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 1),
                                                    borderRadius: BorderRadius
                                                        .circular(15)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      8.0),
                                                  child: Column(
                                                    children: [
                                                      Icon(Icons.map,
                                                        color: Colors.white,),
                                                      Text("${profile?.address
                                                          ?.city ?? ""}"),
                                                      Text("${profile?.address
                                                          ?.street ?? ""}"),
                                                      Text("${profile?.address
                                                          ?.suite ?? ""}"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        CircleAvatar(
                                          child: Icon(Icons.person, size: 80,),
                                          maxRadius: 60,)
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.greenAccent,
                                              width: 1),
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.work, color: Colors.white,),
                                              SizedBox(width: 15,),
                                              Text("${profile?.company?.name ??
                                                  ""}"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],

                                );
                              }
                            }
                          }
                        ),
                      ),
                    ),
                    ),
                    Expanded(
                      flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:15, vertical: 15),
                          child: FutureBuilder<List<ToDo>>(
                            future: _getToDo(id),
                            builder: (context, snapshot) {
                              if(!snapshot.hasData){
                                return Center(child: CircularProgressIndicator(),);
                              }
                              else{
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                  final data = snapshot.data![index];
                                  return TodoTile(data: data);
                                }
                                );
                              }
                            }
                          ),
                        )),
                  ],
                ),
    );
  }
}
