import 'package:firstapp/DatabaseHandler/databasehelper.dart';
import 'package:firstapp/Model/usermodel.dart';
import 'package:firstapp/constants/gettextformfield.dart';
import 'package:firstapp/constants/showtoast.dart';
import 'package:firstapp/login_screen.dart';
import 'package:flutter/material.dart';

class RegAsUser extends StatefulWidget {
  const RegAsUser({super.key});
  @override
  State<RegAsUser> createState() => _RegAsUserState();
}

class _RegAsUserState extends State<RegAsUser> {
  final _formkey =  GlobalKey<FormState>();

  final _cname = TextEditingController();
  final _cemail = TextEditingController();
  final _cnumber = TextEditingController();
  final _cpassword = TextEditingController();
  final _cpasswordconfirm = TextEditingController();

  //for visibility of passsword
  bool _passwordVisible = false;

  //object of dbHelper class
  var dbhelper= DbHelper();

  @override
  initState() {
    super.initState();
    _passwordVisible = false;
    dbhelper = DbHelper();
}
  signUp()async {

    String uname = _cname.text;
    String uemail = _cemail.text;
    String unumber = _cnumber.text;
    String upassword = _cpassword.text;
    String upasswordconfirm = _cpasswordconfirm.text;

    if (_formkey.currentState!.validate()) {
      if (upassword != upasswordconfirm) {
        alertDialog('Password Mismatched');
      }else{
        _formkey.currentState!.save();

        UserModel umodel = UserModel(name: uname, email: uemail, phone: unumber, password: upassword);
          await dbhelper.savedata(umodel).then((userdata) {
          alertDialog("User Registered Successfully");
         }).catchError((error){
          alertDialog( "Try Again");
        }).onError((error, stackTrace) {
          alertDialog( "Error Occured");
        });
        
        
      }
    }
    //to check that not any field is empty
    if (uname.isEmpty) {
      alertDialog( "Please Enter Your Name");
    }else if(uemail.isEmpty){
      alertDialog( "Please Enter Your Email");
    }else if(unumber.isEmpty){
      alertDialog( "Please Enter Your Number");
    }else if(upassword.isEmpty){
      alertDialog( "Please Enter Your Password");
    }else if(upasswordconfirm.isEmpty){
      alertDialog( "Please Confirm Your Password");
      
    }
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,),
                  child: TextFormField(
                   keyboardType: TextInputType.text,
                   cursorColor: const Color(0xFFC87626),
                   validator: (value) {
                   if (value == null || value.isEmpty) {
                    return "Please Re-Enter Password";
                     
                   }
                   return null;
                 },
                 onSaved:(newValue) => _cpasswordconfirm.text = newValue!,
                   controller: _cpasswordconfirm,
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
                    labelText: 'Confirm Password',
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
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () {
                    signUp();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),),
                    backgroundColor: const Color(0xFFC87626),
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 80 , vertical: 10),
                    child:  Text('SIGN UP AS USER',style: TextStyle(fontWeight: FontWeight.w400),),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const  LoginPage()),
                    (Route<dynamic> route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),),
                    backgroundColor: const Color(0xFFC87626),
                  ),
                  
                  child: const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 80 , vertical: 10),
                    child:  Text('Login',style: TextStyle(fontWeight: FontWeight.w400),),
                  ),
                ),
      
          
            ]),
          ),
        ),
      ),
    );
  }
}