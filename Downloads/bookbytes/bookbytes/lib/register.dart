import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'DashBoard.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();


  Future register() async {
    var url = Uri.http("10.205.175.168", '/register.php');
    var response = await http.post(url, body: {
      "name": user.text.toString(),
      "password": pass.text.toString(),
      "email": email.text.toString(),
    });
    var data = json.decode(response.body);

    if (data == "Success") {
      Fluttertoast.showToast(
        backgroundColor: Colors.green.shade100,
        textColor: Colors.green.shade900,
        msg: 'Registration Successful',
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashBoard(),
        ),
      );
    }
      else {
        Fluttertoast.showToast(
          backgroundColor: Colors.green.shade100,
          textColor: Colors.red.shade900,
          msg: 'User already exists',
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }

  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.green.shade50,
                const Color.fromRGBO(248, 249, 253, 1.0),
          ])),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.green, // Change to your desired color
                          Colors.lightGreenAccent,
                        ]),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 3,
                              color: Colors.black12)
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(200),
                            bottomRight: Radius.circular(200))),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 35, left: 65),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Let\'s',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                shadows: [
                                  Shadow(
                                      color: Colors.black45,
                                      offset: Offset(1, 1),
                                      blurRadius: 5)
                                ]),
                          ),
                          Text(
                            ' Register',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                shadows: [
                                  Shadow(
                                      color: Colors.black45,
                                      offset: Offset(1, 1),
                                      blurRadius: 5)
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(bottom: 10),
                  child: TextField(
                    controller: user,
                    style: const TextStyle(color: Colors.black, fontSize: 14.5),
                    decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 45),
                        prefixIcon: const Icon(
                          Icons.alternate_email_outlined,
                          color: Colors.black87,
                          size: 22,
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter Name',
                        hintStyle: const TextStyle(
                            color: Colors.black54, fontSize: 14.5),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100).copyWith(
                                bottomRight: const Radius.circular(0)),
                            borderSide:
                                const BorderSide(color: Colors.black45)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100).copyWith(
                                bottomRight: const Radius.circular(0)),
                            borderSide:
                                const BorderSide(color: Colors.black87))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 10),
                  child: TextField(
                    controller: email,  // Use the new TextEditingController
                    keyboardType: TextInputType.emailAddress,  // Set the keyboard type to email
                    style: const TextStyle(color: Colors.black, fontSize: 14.5),
                    decoration: InputDecoration(
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.email,  // Change the icon to an email icon
                        color: Colors.black87,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintText: 'Enter Email',  // Update the hint text
                      hintStyle: const TextStyle(color: Colors.black54, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100).copyWith(bottomRight: const Radius.circular(0)),
                        borderSide: const BorderSide(color: Colors.black45),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100).copyWith(bottomRight: const Radius.circular(0)),
                        borderSide: const BorderSide(color: Colors.black87),
                      ),
                    ),
                  ),
                ),


                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30)
                      .copyWith(bottom: 10),
                  child: TextField(
                    controller: pass,
                    style: const TextStyle(color: Colors.black, fontSize: 14.5),
                    obscureText: isPasswordVisible ? false : true,
                    decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 45),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black87,
                          size: 22,
                        ),
                        suffixIconConstraints:
                            const BoxConstraints(minWidth: 45, maxWidth: 46),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          child: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black87,
                            size: 22,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                        hintStyle: const TextStyle(
                            color: Colors.black54, fontSize: 14.5),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100).copyWith(
                                bottomRight: const Radius.circular(0)),
                            borderSide:
                                const BorderSide(color: Colors.black45)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100).copyWith(
                                bottomRight: const Radius.circular(0)),
                            borderSide:
                                const BorderSide(color: Colors.black87))),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    register();
                  },
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12.withOpacity(.2),
                              offset: const Offset(2, 2))
                        ],
                        borderRadius: BorderRadius.circular(100)
                            .copyWith(bottomRight: const Radius.circular(0)),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 184, 212, 123),
                          Color(0xffD5f591)
                        ])),
                    child: const Text('Signup',
                        style: TextStyle(
                            color: Color.fromRGBO(47, 50, 120, 1.0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text('Already have an account?',
                    style: TextStyle(color: Colors.black87, fontSize: 13)),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(100)
                          .copyWith(bottomRight: const Radius.circular(0)),
                    ),
                    child: Text('Login',
                        style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
