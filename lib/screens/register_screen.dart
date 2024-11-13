import 'package:assessment/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assessment/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Signup'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.settings),onPressed: (){},)
        ],
      ),
      body: Consumer<RegisterProvider>(builder: (context, value, child){
        return Container(
          child: Padding(
              padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(Icons.person),
                  ),
                  controller: nameController,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.number,
                  controller: phoneController,
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
                  String name = nameController.text;
                  String phone = phoneController.text;
                  String email = emailController.text;
                  String password = passwordController.text;
                  if (name.isNotEmpty && phone.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
                    bool signup = await Provider.of<RegisterProvider>(
                        context, listen: false).AddData(
                        name, phone, email, password);
                    if (signup) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Successfully')));
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid')));
                    }
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Enter you info')));
                  }
                }, child: Text('Signup'),
                ),
                SizedBox(height:20),
                TextButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context)=>LoginScreen()
                  ));
                }, child: Text('Already have account. login'),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
