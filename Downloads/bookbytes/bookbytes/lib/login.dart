import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'DashBoard.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var url = Uri.http("10.205.175.168", '/login.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "userInput": email.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
        msg: 'Login Successful',
        backgroundColor: Colors.green,
        textColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashBoard(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.green.shade100,
        textColor: Colors.red.shade900,
        msg: 'Email or password invalid',
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
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green, // Change to your desired color
                            Colors.lightGreenAccent, // Change to your desired color
                          ],
                        ),
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
                            ' Login',
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
                    controller: email,
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
                        hintText: 'Enter Email',
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
                    login();
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
                    child: const Text('Login',
                        style: TextStyle(
                            color: Color.fromRGBO(47, 50, 120, 1.0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text('Don\'t have an account?',
                    style: TextStyle(color: Colors.black87, fontSize: 13)),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
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
                    child: Text('Sign Up',
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
