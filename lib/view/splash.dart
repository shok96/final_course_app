import 'package:final_course_app/controller/pageRoutes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatelessWidget {
  static const String routeName = '/splash';
  Splash({Key? key}) : super(key: key);

  SharedPreferences? prefs = null;

  Future<void> _load(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    var res = await prefs?.getInt("login");

    await Future.delayed(Duration(seconds: 2), (){});
    if(res != null)
      if(res == 1){
        Navigator.of(context).pushNamed(pageRoutes.users);
        return;
      }
    Navigator.of(context).pushReplacementNamed(pageRoutes.reg);
  }

  @override
  Widget build(BuildContext context) {

    _load(context);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/bg.png", height: double.infinity, fit: BoxFit.cover,),
          Center(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Loading...", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black),),
              CircularProgressIndicator.adaptive()
            ],
          ),)
        ],
      ),
    );
  }
}
