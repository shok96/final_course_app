import 'package:final_course_app/controller/pageRoutes.dart';
import 'package:final_course_app/extensions/app_utils.dart';
import 'package:final_course_app/widgets/button.dart';
import 'package:final_course_app/widgets/input.dart';
import 'package:final_course_app/widgets/panel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reg extends StatefulWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  static const String routeName = '/reg';

  Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  SharedPreferences? prefs = null;

  Future<void> _load() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> _save() async {
    await prefs?.setInt('login', 1);
  }

  TextEditingController TlLogin =
      new TextEditingController(text: "" != null ? "" : "");
  bool VLogin = false;

  TextEditingController TSms =
  new TextEditingController(text: "" != null ? "" : "");
  bool VSms = false;

  bool eLogin = true;
  bool esms = false;

  Map<String, dynamic> profileResponse = {};

  @override
  Widget build(BuildContext context) {
    _load();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/bg.png",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Panel(
                        errorText: "Пустое поле",
                        error: VLogin,
                        marginTop: true,
                        hint: "Номер телефона",
                        child: Input(
                          type: TextInputType.phone,
                          hint: "+79241111111",
                          obscure: false,
                          controller: TlLogin,
                          onchange: (e) {
                            profileResponse.update("number", (value) => e,
                                ifAbsent: () => e);
                          },
                        ),
                      ),
                      Button(
                        enabled: eLogin,
                        text: "Прислать смс",
                        action: () async {
                          showInSnackBar(context, "Ожидайте смс");
                          setState(() {
                            eLogin = false;
                          });
                          await widget.auth.verifyPhoneNumber(
                            phoneNumber: profileResponse["number"],
                            codeSent:
                                (String verificationId, int? resendToken) async {
                                  profileResponse.update("verifi", (value) => verificationId,
                                      ifAbsent: () => verificationId);
                                  setState(() {
                                    esms = true;
                                    eLogin = true;
                                  });
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {},
                            verificationFailed: (FirebaseAuthException error) {},
                            verificationCompleted:
                                (PhoneAuthCredential phoneAuthCredential) {
                                 setState(() {
                                   esms = true;
                                   eLogin = true;
                                 });
                                },
                          );
                        },
                      ),
                      Panel(
                        errorText: "Пустое поле",
                        error: VSms,
                        marginTop: true,
                        hint: "Код из смс",
                        child: Input(
                          type: TextInputType.phone,
                          hint: "Код из смс",
                          obscure: false,
                          controller: TSms,
                          onchange: (e) {
                            profileResponse.update("sms", (value) => e,
                                ifAbsent: () => e);
                          },
                        ),
                      ),
                      Button(
                      enabled: esms,
                        text: "Проверка",
                        action: () async {



                          PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: profileResponse["verifi"],
                              smsCode: profileResponse["sms"]);


                          try {
                            var response = await widget.auth.signInWithCredential(
                                credential);
                            if(response.user != null){
                              await _save();
                              Navigator.of(context).pushNamed(pageRoutes.users);
                            }
                          }
                          catch(e){
                            showInSnackBar(context, e.toString());
                          }

                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
