import 'package:firstapp/register.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>  {
  
//  late AnimationController _controller;
// late Animation _animation; 
//    late Animation textanimation;
//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
      
//       vsync: this,
//       upperBound: 1.0,
//       );
//       _animation = ColorTween(begin: const Color.fromARGB(255, 255, 255, 255),end: const  Color.fromARGB(255, 197, 5, 5)).animate(_controller);
//        textanimation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
//       _controller.forward();
//       // animation.addStatusListener((status) {
//       //   if (status == AnimationStatus.completed) {
//       //     controller.reverse(from: 1);
//       //   }else if(status == AnimationStatus.dismissed){
//       //     controller.forward();
//       //   }
//       // });
//       _controller.addListener(() {
//         setState(() {});
//             });


//   }

// @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        // title: const Center(child: Text("Login Page" ,style: TextStyle(color: Colors.black),)),
        backgroundColor:  const Color(0xFFC87626),
        toolbarHeight: 40,
      ),
          //backgroundColor: _animation.value,
          body: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 40,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Hero(
                  tag: 'logo',
                  child: Center(
                    child: Image(
                      image: AssetImage("assets/eventlogo.png"),width: 200,height: 200,
                    ),
                  ),
                  ),
                const SizedBox(
                  height: 50,
                ),
                MainButtons(tittle: "LOGIN", onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()),);
                      },),
                const SizedBox(
                  height: 30,
                ),
                MainButtons(tittle: "REGISTER", onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterPage()),);
                  
                   },
                  ),
                const SizedBox(
                  height: 150,
                ),
                const Divider(
                  color:Color(0xFFBEBEBE),
                  thickness: 2,
                ),
                  const SizedBox(
                  height: 50,
                ),
                const Center(child: Text('ALREADY HAVE ACCOUNT?', style: TextStyle(color: Color(0xFFA8B2C8) , fontSize: 15),)),
              ]),),
              
          ),
         
          );
          
  }
  
}

class MainButtons extends StatelessWidget {
  
  final String tittle;
  final VoidCallback onPressed;

  const MainButtons({
    required this.tittle,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(5),),
            backgroundColor: const Color(0xFFC87626),
               ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 12),
        child: Text(tittle, style: const TextStyle(fontSize: 14,color: Colors.white, fontWeight: FontWeight.w400),),
      ),),
    );
  }
}
