import 'package:flutter/material.dart';

import '../shared/colors.dart';

late TabController _tabController;
void _goToTab(int index) {
  _tabController.animateTo(index);
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
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
                  child: Text("Sing in",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Tab(
                  child: Text("Sing up",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
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
                        const Color.fromARGB(124, 218, 197, 175),
                        Color.fromARGB(92, 236, 171, 93),
                        Color.fromARGB(103, 220, 144, 63),
                      ])),
                      child: const Padding(
                          padding: EdgeInsets.only(top: 60.0, left: 22),
                          child: Text(
                            "Hello\n Sing in!",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
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
                                  obscureText: true,
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
                                  height: 50,
                                ),
                                Container(
                                  height: 55,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: const LinearGradient(colors: [
                                        Color.fromARGB(124, 218, 197, 175),
                                        Color.fromARGB(92, 236, 171, 93),
                                        Color.fromARGB(103, 220, 144, 63),
                                      ])),
                                  child: Center(
                                      child: MaterialButton(
                                    onPressed: () {
                                      if (loginFormKey.currentState!
                                          .validate()) {
                                        Navigator.pushReplacementNamed(
                                            context, 'HomePage');
                                      }
                                    },
                                    child: const Text(
                                      'Log in',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
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
                            "Hello\n Sing in!",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextField(
                                decoration: InputDecoration(
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
                              const TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
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
                              const TextField(
                                obscureText: true,
                                decoration: InputDecoration(
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
                              const TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.grey,
                                    ),
                                    label: Text(
                                      'PhoneNumber',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(202, 220, 144, 63),
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Container(
                                  height: 55,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: const LinearGradient(colors: [
                                        Color.fromARGB(124, 218, 197, 175),
                                        Color.fromARGB(92, 236, 171, 93),
                                        Color.fromARGB(103, 220, 144, 63),
                                      ])),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        MaterialButton(
                                          onPressed: () =>
                                              Navigator.pushReplacementNamed(
                                                  context, 'HomePage'),
                                          child: const Text(
                                            'SIGN UP',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
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
                ],
              )
            ])));
  }
}
