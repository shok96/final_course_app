import 'package:final_course_app/controller/pageRoutes.dart';
import 'package:final_course_app/models/ToDo.dart';
import 'package:final_course_app/models/users/User.dart';
import 'package:final_course_app/widgets/navigation_drawer.dart';
import 'package:final_course_app/widgets/users_tile.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class UserList extends StatelessWidget {
  static const String routeName = '/users';
  UserList({Key? key}) : super(key: key);

  Future<List<User>> _getUsers() async {
    final response = await net.asyncResult(net.api.getUsers());
    List<User> result = [];
    if (response.isSuccessfull) {
      result.addAll(response.body!);
      return result;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Пользователи"),
      ),
      drawer: navigationDrawer(),
      body: Stack(
        children: [
          Image.asset("assets/bg.png", fit: BoxFit.cover, height: double.infinity,),
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: FutureBuilder<List<User>>(
                        future: _getUsers(),
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
                                      child: InkWell(
                                        splashColor: Color(data.hashCode).withOpacity(1),
                                        onTap: (){
                                          Navigator.of(context).pushNamed(pageRoutes.profile, arguments: data.id);
                                        },
                                        child: UsersTile(data: data,),
                                      ),
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
