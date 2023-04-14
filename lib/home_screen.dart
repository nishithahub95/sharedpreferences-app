
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences_app/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   String email='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    email=sp.getString('Email')??'';
    setState(() {

    });
    print(email);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            children: [
              Text('Email'),
              Text(email),
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
