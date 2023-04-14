import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences_app/admin_screen.dart';
import 'package:sharedpreferences_app/home_screen.dart';
import 'package:sharedpreferences_app/student_screen.dart';
import 'package:sharedpreferences_app/teacher_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final ageController=TextEditingController();
  String dropdownValue = 'student';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                  hintText: 'Age'
              ),
            ),
      Row(
        children: [
          Text('type'),
          SizedBox(width: 10,),
          DropdownButton<String>(
            // Step 3.
            value: dropdownValue,
            // Step 4.
            items: <String>['student', 'teacher', 'admin']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15),
                ),
              );
            }).toList(),
            // Step 5.
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
          ),
        ],
      ),
            SizedBox(height: 30,),
            InkWell(
              onTap: ()async{
                SharedPreferences sp=await SharedPreferences.getInstance();
                sp.setString('Email', emailController.text.toString());
                sp.setString('type', dropdownValue);
                sp.setBool('isLogin', true);
                if(sp.getString('type')=='teacher'){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherScreen()));
                }
                else if(sp.getString('type')=='student'){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));
                }
                else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminScreen()));
                }
                


              },
              child: Container(
                height: 50,
                child: Center(
                  child: Text('SignUp',style: TextStyle(fontSize: 20,color: Colors.white),),
                ), decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15)

                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
