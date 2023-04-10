import 'package:firstapp/Model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DatabaseHandler/databasehelper.dart';
import 'constants/gettextformfield.dart';
import 'constants/showtoast.dart';
import 'login_screen.dart';

class UserSettingPage extends StatefulWidget {
  const UserSettingPage({super.key});

  @override
  State<UserSettingPage> createState() => _UserSettingPageState();
}

class _UserSettingPageState extends State<UserSettingPage> {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String username = '';
  var dbhelper = DbHelper();
  

  @override
  void initState() {
    super.initState();
    getuserdata();
    dbhelper = DbHelper();
  }

  //get userdata from sgared preferences
  Future<void> getuserdata() async{
    final SharedPreferences sp= await _pref;
    setState(() {
      _cname.text = sp.getString("name")!;
      _cemail.text = sp.getString("email")!;
      _cnumber.text = sp.getString("phone")!;
      _cpassword.text = sp.getString("password")!;
      _cdeletemail.text = sp.getString("email")!;
    });
  }
  
  update()async{
    String uname = _cname.text;
    String uemail = _cemail.text;
    String unumber = _cnumber.text;
    String upassword = _cpassword.text;

    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      UserModel user = UserModel(name: uname, email: uemail, phone: unumber, password: upassword);
    await dbhelper.updateuser(user).then((value) {
      if (value == 1) {
        alertDialog("Successfully Updated");

        updateSP(user , true).whenComplete((){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const  LoginPage()),
                    (Route<dynamic> route) => false);
        });

      }else{
        alertDialog("Error: can't Updated");
      }
    }).catchError((error){
      alertDialog("Error");
    });
    }
  }

  Future updateSP(UserModel user , bool add)async{
    final SharedPreferences sp = await _pref;
    
    if (add) {
    sp.setString("name", user.name!);
    sp.setString("email", user.email!);
    sp.setString("phone", user.phone!);
    sp.setString("password", user.password!);
      
    }else{
      sp.remove("name");
      sp.remove("email");
      sp.remove("phone");
      sp.remove("password");
    }


  }

  delete() async {
    String uname = _cname.text;
    String uemail = _cemail.text;
    String unumber = _cnumber.text;
    String upassword = _cpassword.text;
    String deleteuseremail = _cdeletemail.text;
    UserModel user = UserModel(name: uname, email: uemail, phone: unumber, password: upassword);
    await dbhelper.deleteuser(deleteuseremail).then((value) {
       alertDialog("Successfully Deleted");
        updateSP(user, false).whenComplete((){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const  LoginPage()),
                    (Route<dynamic> route) => false);
        });
    });
  }

  final _formkey =  GlobalKey<FormState>();
  //for visibility of passsword
  bool _passwordVisible = false;
  final _cname = TextEditingController();
  final _cemail = TextEditingController();
  final _cnumber = TextEditingController();
  final _cpassword = TextEditingController();
  final _cdeletemail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //update
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Image.asset('assets/eventlogo.png',width: 200, height: 200,),
                ),
                const SizedBox(
                  height: 50,
                ),
                GetTextFormField(labelName: "Your Name", icon: Icons.business, controller: _cname,isObscureText: false,),
                 GetTextFormField(labelName: "Email", icon: Icons.person, controller: _cemail, isObscureText: false,),
                 GetTextFormField(labelName: "Your Number", icon: Icons.phone, controller: _cnumber,isObscureText: false,),
                
                  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,),
                  child: TextFormField(
                   keyboardType: TextInputType.text,
                   controller: _cpassword,
                   obscureText: !_passwordVisible,//This will obscure text dynamically
                   cursorColor: const Color(0xFFC87626),
                   validator: (value) {
                   if (value == null || value.isEmpty) {
                    return "Please Enter Password";
                     
                   }
                   return null;
                 },
                 onSaved:(newValue) => _cpassword.text = newValue!,
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
                
                ElevatedButton(
                  onPressed: () {
                    update();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),),
                    backgroundColor: const Color(0xFFC87626),
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 80 , vertical: 10),
                    child:  Text('UPDATE',style: TextStyle(fontWeight: FontWeight.w400),),
                  ),
                ),

                //update
                GetTextFormField(labelName: "Email", icon: Icons.person, controller: _cdeletemail, isObscureText: false,),
                const SizedBox(
                  height: 5,
                ),
                
                ElevatedButton(
                  onPressed: () {
                    delete();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),),
                    backgroundColor: const Color(0xFFC87626),
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 80 , vertical: 10),
                    child:  Text('DELETE',style: TextStyle(fontWeight: FontWeight.w400),),
                  ),
                ),
                
            ]),
          ),
        ),
      ),
    );
  }
}