

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences_app/login_screen.dart';

class AdminScreen extends StatefulWidget  {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String email='',type='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    email=sp.getString('Email')??'';
    type=sp.getString('type')??'';
    setState(() {

    });
    print(email);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            children: [
              Text('Email:$email'),
              SizedBox(height: 10,),
              Text('UserType:$type'),

              InkWell(
                onTap: ()async{
                  SharedPreferences sp=await SharedPreferences.getInstance();
                  sp.clear();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                },
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text('Logout',style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
