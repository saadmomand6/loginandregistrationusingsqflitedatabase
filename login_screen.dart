import 'package:firstapp/Model/usermodel.dart';
import 'package:firstapp/usersetting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DatabaseHandler/databasehelper.dart';
import 'constants/gettextformfield.dart';
import 'constants/showtoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //shared preference reference
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final _formkey =  GlobalKey<FormState>();

  final _cemail = TextEditingController();
  final _cpassword = TextEditingController();

  //for visibility of password
  bool _passwordVisible = false;
  
  //object of dbHelper class
  var dbhelper= DbHelper();

  login()async{
    String uemail = _cemail.text;
    String upassword = _cpassword.text;

    if (uemail.isEmpty) {
      alertDialog("Please Enter Your Email");
    }else if(upassword.isEmpty){
      alertDialog( "Please Enter Your Password");
    }else{
      await dbhelper.getloginuser(uemail, upassword).then((userData) {
        if (userData != null) {

          //if valid user add user UserData to shared preferences
          setSp(userData).whenComplete(() {
            
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const  UserSettingPage()),
                    (Route<dynamic> route) => false);
          });

        }else{
          alertDialog( "Error: Given Credentials Not Correct!");
        }
        
      }).catchError((error){
        alertDialog( "Error Login Failed");
      });
    }
  }

  //create function for add shared preferences
  Future setSp(UserModel user) async{
    final SharedPreferences sp = await _pref;
    sp.setString("name", user.name!);
    sp.setString("email", user.email!);
    sp.setString("phone", user.phone!);
    sp.setString("password", user.password!);

  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    dbhelper = DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xFFC87626),
        toolbarHeight: 40,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                
                Center(
                  child: Image.asset('assets/eventlogo.png',width: 200, height: 200,),
                ),
                const SizedBox(
                  height: 50,
                ),
                GetTextFormField(labelName: "Email", icon: Icons.person, controller: _cemail,isObscureText: false,),
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,),
                  child: TextFormField(
                   keyboardType: TextInputType.text,
                   cursorColor: const Color(0xFFC87626),
                   controller: _cpassword,
                   obscureText: !_passwordVisible,//This will obscure text dynamically
                   decoration:  InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                      width: 1.5, 
                    
                      color: Colors.black),
                      ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:  Color(0xFFC87626),
                        )
                       ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontSize: 17,
                      color: Color(0xFF000033)
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xFF000033),
                      size: 17,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                        color:const  Color(0xFF000033),
                        size: 17,
                      ),
                      onPressed: () {
                        setState(() {
                        _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot Password ?' ,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000033)
                  ),),
                ),
                // const Align(
                //   alignment: Alignment.centerRight,
                //   child:  Text.rich(
                //     TextSpan(
                //       text: "FORGOT ",
                //       style: TextStyle(
                //         fontSize: 12,
                //         fontFamily: 'Roboto',
                //         fontWeight: FontWeight.bold,
                //         color: Colors.black,
                //       ),
                //       children: [
                //         TextSpan(
                //           text: 'PASSWORD ? ',
                //           style: TextStyle(
                //             fontSize: 12,
                //             fontWeight: FontWeight.bold,
                //             fontFamily: 'Roboto',
                //             color: Colors.black,
                //           ),
                          
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () {
                    login();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ,
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),),
                    backgroundColor: const Color(0xFFC87626),
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 80 , vertical: 10),
                    child:  Text('LOGIN',style: TextStyle(fontWeight: FontWeight.w400),),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Divider(
                  color:Color(0xFFBEBEBE),
                  thickness: 2,
                ),
                  const SizedBox(
                  height: 30,
                ),
                const Center(child: Text('DONT HAVE ACCOUNT? SIGNUP', style: TextStyle(color: Color(0xFFA8B2C8) , fontSize: 15),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// class Sign extends StatelessWidget {
//   final String labeltext;
//   final IconData iconData;

//   const Sign({
//     Key? key,
//     required this.labeltext,
//     required this.iconData,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: const EdgeInsets.only(left: 20),
//         color: Colors.transparent,
//         width: 350,
//         child: Center(
//             child: TextField(
//           style: const TextStyle(
//             color: Colors.black,
//           ),
//           decoration: InputDecoration(
//             labelText: labeltext,
//             labelStyle:const TextStyle(
//               color: Colors.black,
//               fontSize: 14
//             ),
//             prefixIcon: Icon(
//               (iconData),
//               color:  Colors.black,
//               size: 18,
//             ),
//           ),
//         )));
//   }
// }
