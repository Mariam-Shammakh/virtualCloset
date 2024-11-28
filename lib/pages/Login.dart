import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_info.dart';
import '../provider/userpro.dart';
import '../shared/colors.dart';

late TabController _tabController;
void _goToTab(int index) {
  _tabController.animateTo(index);
}

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController signupUsernameController =
      TextEditingController();
  final TextEditingController signupEmailController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool IsVisible = false;

  void _goToHomePage(BuildContext context, bool isSignIn) {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      // Send data to HomePage based on the form state (sign-in or sign-up)

      // Get the provider
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      // Update the provider with form data
      userProvider.setUserInfo(UserInfo(
        email: emailController.text,
        password: passwordController.text,
        username: "UserName12", // Add a username if not provided
      ));

      // Navigate to the next page (e.g., HomePage)
      Navigator.pushNamed(context, 'HomePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        //return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: appbarGreen,
              bottom: const TabBar(tabs: [
                Tab(
                  child: Text("Log in",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 147, 83, 0),
                          fontWeight: FontWeight.bold)),
                ),
                Tab(
                  child: Text("Sing up",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 147, 83, 0),
                          fontWeight: FontWeight.bold)),
                )
              ]),
            ),
            body: TabBarView(children: [
              Stack(
                children: [
                  Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                         Color.fromARGB(124, 218, 197, 175),
                        Color.fromARGB(92, 236, 171, 93),
                        Color.fromARGB(103, 220, 144, 63),
                      ],)),
                      child: const Padding(
                          padding: EdgeInsets.only(top: 60.0, left: 22),
                          child: Text(
                            "Hello\n Log in!",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 147, 83, 0),
                                fontWeight: FontWeight.bold),
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Colors.white,
                      ),
                      height: double.infinity,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19.0, right: 18),
                        child: SingleChildScrollView(
                          child: Form(
                            key: loginFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your email";
                                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                                        .hasMatch(value)) {
                                      return "Enter a valid email address";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.email,
                                        color: Colors.grey,
                                      ),
                                      label: Text(
                                        'Gmail',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(202, 220, 144, 63),
                                        ),
                                      )),
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: !IsVisible,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your password";
                                    } else if (value.length < 6) {
                                      return "Password must be at least 6 characters";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              IsVisible = !IsVisible;
                                            });
                                          },
                                          icon: Icon(IsVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off)),
                                      label: const Text(
                                        'Password',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(202, 220, 144, 63),
                                        ),
                                      )),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: const LinearGradient(colors: [
                                        Color.fromARGB(124, 218, 197, 175),
                                        Color.fromARGB(92, 236, 171, 93),
                                        Color.fromARGB(103, 220, 144, 63),
                                      ], ),),
                                  child: Center(
                                      child: MaterialButton(
                                    onPressed: () {
                                      if (loginFormKey.currentState!
                                          .validate()) {
                                        _goToHomePage(context, false);
                                      }
                                    },
                                    child: const Text(
                                      'Log in',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color.fromARGB(255, 147, 83, 0),),
                                    ),
                                  )),
                                ),
                                const SizedBox(
                                  height: 150,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromARGB(124, 218, 197, 175),
                        Color.fromARGB(92, 236, 171, 93),
                        Color.fromARGB(103, 220, 144, 63),
                      ])),
                      child: const Padding(
                          padding: EdgeInsets.only(top: 60.0, left: 22),
                          child: Text(
                            "Hello\n Sign up!",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 147, 83, 0),
                                fontWeight: FontWeight.bold),
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Colors.white,
                      ),
                      height: double.infinity,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19.0, right: 18),
                        child: SingleChildScrollView(
                          child: Form(
                            key: signupFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: signupUsernameController,
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                      label: Text(
                                        'User Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(202, 220, 144, 63),
                                        ),
                                      )),
                                ),
                                TextFormField(
                                  controller: signupEmailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your email";
                                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                                        .hasMatch(value)) {
                                      return "Enter a valid email address";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.email,
                                        color: Colors.grey,
                                      ),
                                      label: Text(
                                        'Gmail',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(202, 220, 144, 63),
                                        ),
                                      )),
                                ),
                                TextFormField(
                                  controller: signupPasswordController,
                                  obscureText:  !IsVisible,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your password";
                                    } else if (value.length < 6) {
                                      return "Password must be at least 6 characters";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      label: Text(
                                        'Password',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(202, 220, 144, 63),
                                        ),
                                      )),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                    height: 55,
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: const LinearGradient(colors: [
                                          Color.fromARGB(124, 218, 197, 175),
                                          Color.fromARGB(92, 236, 171, 93),
                                          Color.fromARGB(103, 220, 144, 63),
                                        ])),
                                    child: Center(
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          MaterialButton(
                                            child: const Text(
                                              'SIGN UP',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Color.fromARGB(255, 147, 83, 0),),
                                            ),
                                            
                                            onPressed: () {
                                              if (signupFormKey.currentState !=
                                                      null &&
                                                  signupFormKey.currentState!
                                                      .validate()) {
                                                signupFormKey.currentState!
                                                    .save();

                                                // Update the provider with signup information
                                                final userProvider =
                                                    Provider.of<UserProvider>(
                                                        context,
                                                        listen: false);
                                                userProvider
                                                    .setUserInfo(UserInfo(
                                                  email: signupEmailController
                                                      .text,
                                                  password:
                                                      signupPasswordController
                                                          .text,
                                                  username:
                                                      signupUsernameController
                                                          .text,
                                                ));

                                                // Navigate to HomePage
                                                Navigator.pushReplacementNamed(
                                                    context, 'HomePage');
                                              }
                                            },
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                        ]),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ])));
  }
}
