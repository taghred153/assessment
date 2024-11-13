import 'package:assessment/providers/login_provider.dart';
import 'package:assessment/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assessment/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Login'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.settings),onPressed: (){},)
        ],
      ),
      body: Consumer<LoginProvider>(builder: (context, value, child){
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://th.bing.com/th/id/R.888bc721f186b5ed8523e1b62b9ea4c1?rik=wDh%2fEOD1neb%2ftw&riu=http%3a%2f%2f2.bp.blogspot.com%2f-BVgTOe82aaI%2fVZln4Ny-LPI%2fAAAAAAAAA6Y%2fhKchnruxKtg%2fs1600%2f2000px-User_icon_2.svg.png&ehk=tqoN99TuPqya5KKZfVLDePulcbdqeufKK%2bYeSvfDvWw%3d&risl=&pid=ImgRaw&r=0'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(height: 40),
                ElevatedButton(onPressed: () async {
                  String email = emailController.text;
                  String password = passwordController.text;
                  if (email.isNotEmpty && password.isNotEmpty) {
                    bool signup = await Provider.of<LoginProvider>(
                        context, listen: false).AddData(
                         email, password);
                    if (signup) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Successfully')));
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => ProductScreen()));
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid')));
                    }
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Enter you info')));
                  }
                }, child: Text('Login'),
                ),
                SizedBox(height:20),
                TextButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context)=>RegisterScreen()
                  ));
                }, child: Text('donot have account. signup'),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
