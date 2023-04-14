
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences_app/admin_screen.dart';
import 'package:sharedpreferences_app/home_screen.dart';
import 'package:sharedpreferences_app/login_screen.dart';
import 'package:sharedpreferences_app/sign_up.dart';
import 'package:sharedpreferences_app/student_screen.dart';
import 'package:sharedpreferences_app/teacher_screen.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();

  }
  void isLogin()async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    bool isLogin=sp.getBool('isLogin')??false;
    String type=sp.getString('type')??'';

    if(isLogin){
      if(type=='student'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));
        });
      }
      else if(type=='teacher'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherScreen()));
        });
      }

      else{
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminScreen()));
        });
      }

    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
      });
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage('https://images.pexels.com/photos/35629/bing-cherries-ripe-red-fruit.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),),
    );
  }
}
