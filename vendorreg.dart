import 'package:flutter/material.dart';

class VendorRegistration extends StatefulWidget {
  const VendorRegistration({super.key});
  @override
  State<VendorRegistration> createState() => _VendorRegistrationState();
}

class _VendorRegistrationState extends State<VendorRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xFFC87626),
        toolbarHeight: 40,
      ),
      body: SingleChildScrollView(
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
              const Text("Vendor's Registration"),
              const SizedBox(
                height: 20,
              ),
              const Text('Bussiness Category'),
              Padding(
                padding: const EdgeInsets.only(top: 10 ,bottom: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color(0xFFC87626),
                 //controller: _userPasswordController,
                 decoration:const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.8, 
                      color: Colors.black
                    ), 
                  ),
                     hintText: 'Venue',
                     focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  Color(0xFFC87626),
                      )
                     ),
                     labelStyle: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF000033)
                     ),
                     prefixIcon:  Icon(
                      Icons.business,
                      color: Color(0xFF000033),
                      size: 17,
                          ),
                        ),
                ),
                ),
                const Text('Name'),
              Padding(
                padding: const EdgeInsets.only(top: 10 ,bottom: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color(0xFFC87626),
                 //controller: _userPasswordController,
                 decoration:const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.8, 
                      color: Colors.black
                    ), 
                  ),
                     hintText: 'Your Name',
                     focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  Color(0xFFC87626),
                      )
                     ),
                     labelStyle: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF000033)
                     ),
                     prefixIcon:  Icon(
                      Icons.business,
                      color: Color(0xFF000033),
                      size: 17,
                          ),
                        ),
                ),
                ),const Text('Email'),
              Padding(
                padding: const EdgeInsets.only(top: 10 ,bottom: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color(0xFFC87626),
                 //controller: _userPasswordController,
                 decoration:const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.8, 
                      color: Colors.black
                    ), 
                  ),
                     hintText: 'Your Email',
                     focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  Color(0xFFC87626),
                      )
                     ),
                     labelStyle: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF000033)
                     ),
                     prefixIcon:  Icon(
                      Icons.business,
                      color: Color(0xFF000033),
                      size: 17,
                          ),
                        ),
                ),
                ),
                const Text('Phone Number'),
              Padding(
                padding: const EdgeInsets.only(top: 10 ,bottom: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color(0xFFC87626),
                 //controller: _userPasswordController,
                 decoration:const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.8, 
                      color: Colors.black
                    ), 
                  ),
                     hintText: 'Your Number',
                     focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  Color(0xFFC87626),
                      )
                     ),
                     labelStyle: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF000033)
                     ),
                     prefixIcon:  Icon(
                      Icons.business,
                      color: Color(0xFF000033),
                      size: 17,
                          ),
                        ),
                ),
                ),
                const Text('Password'),
              Padding(
                padding: const EdgeInsets.only(top: 10 ,bottom: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color(0xFFC87626),
                 //controller: _userPasswordController,
                 decoration:const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.8, 
                      color: Colors.black
                    ), 
                  ),
                     hintText: 'Your Password',
                     focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  Color(0xFFC87626),
                      )
                     ),
                     labelStyle: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF000033)
                     ),
                     prefixIcon:  Icon(
                      Icons.business,
                      color: Color(0xFF000033),
                      size: 17,
                          ),
                        ),
                ),
                ),
                const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: () {
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
                  child:  Text('SIGN UP AS VENDOR',style: TextStyle(fontWeight: FontWeight.w400),),
                ),
              ),
            ],
          ),
          ),
      ),
    );
  }
}