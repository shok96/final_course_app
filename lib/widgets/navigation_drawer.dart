import 'package:final_course_app/controller/pageRoutes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class navigationDrawer extends StatelessWidget {

  SharedPreferences? prefs = null;

  Future<void> _remove() async {
    prefs = await SharedPreferences.getInstance();
    await prefs?.remove("login");
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(context),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Пользователи',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.users),
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: 'Список дел',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.todo),
          ),

          ListTile(
            title: Text('выйти'),
            onTap: () async{
              await _remove();
              Navigator.pushReplacementNamed(context, pageRoutes.splash);
            },
          ),
        ],
      ),
    );
  }

  Widget createDrawerBodyItem(
      {IconData? icon, required String text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: Colors.blueAccent,),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget createDrawerHeader(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacementNamed(context, pageRoutes.profile);
      },
      child: DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image:  AssetImage('assets/profile.jpg'))), child: SizedBox.shrink(),),
    );
  }
}