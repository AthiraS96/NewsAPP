import 'package:flutter/material.dart';
import 'package:news_app/Pages/Home_page.dart';
import 'package:news_app/Pages/Login_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background3.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: SingleChildScrollView(
            // get started form
            child: Form(
              key: _formSignupKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // get started text
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  // full name
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Full name';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.person), 
                      //label: const Text('Full Name'),
                      hintText: 'User Name',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black45, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black45, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  // email
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      if (!RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail),
                      hintText: 'Enter Email',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black45, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black45, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  // password
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: ' Password',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black45, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black45, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    // obscureText: true,
                    // obscuringCharacter: '*',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Phone number';
                      }
                      if (num.tryParse(value) == false) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: ' Phone Number',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black45, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black45, // Default border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  // i agree to the processing
                  Row(
                    children: [
                      Checkbox(
                        value: agreePersonalData,
                        onChanged: (bool? value) {
                          setState(() {
                            agreePersonalData = value!;
                          });
                        },
                        // activeColor: lightColorScheme.primary,
                      ),
                      const Text(
                        'I agree to the processing of ',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        'Personal data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // color: lightColorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  // signup button
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {
                      if (_formSignupKey.currentState!.validate() &&
                          agreePersonalData) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                      }
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  // sign up divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.7,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),
                  // already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (e) => const SignInScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            //color: lightColorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:news_app/Pages/Login_page.dart';

// class register extends StatefulWidget {
//   const register({super.key});

//   @override
//   State<register> createState() => _registerState();
// }

// class _registerState extends State<register> {
//   @override
//   Widget build(BuildContext context) {
//     final Size screensize = MediaQuery.of(context).size;
//     return SafeArea(
//         child: Scaffold(
//       body: Center(
//         child: Container(
//           height: double.maxFinite,
//           width: double.maxFinite,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/background3.jpg'),
//                   fit: BoxFit.cover)),
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Text(
//                     'Register',
//                     style: GoogleFonts.acme(
//                       color: Colors.black,
//                       textStyle: TextStyle(fontSize: 30),
//                     ),
//                     // style: TextStyle(
//                     //     color: Colors.black,
//                     //     fontSize: 22,
//                     //     fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: screensize.height * 0.04,
//                   ),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           fillColor: Colors.transparent,
//                           filled: true,
//                           border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20))),
//                           hintText: 'Name',
//                           prefixIcon: Icon(Icons.person))),
//                   SizedBox(
//                     height: screensize.height * 0.02,
//                   ),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           fillColor: Colors.transparent,
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                           ),
//                           hintText: 'Email',
//                           prefixIcon: Icon(Icons.mail))),
//                   SizedBox(
//                     height: screensize.height * 0.02,
//                   ),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           fillColor: Colors.transparent,
//                           filled: true,
//                           border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20))),
//                           hintText: 'Phone number',
//                           prefixIcon: Icon(Icons.mobile_friendly))),
//                   SizedBox(
//                     height: screensize.height * 0.02,
//                   ),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           fillColor: Colors.transparent,
//                           filled: true,
//                           border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20))),
//                           hintText: 'Password',
//                           prefixIcon: Icon(Icons.lock))),
//                   SizedBox(
//                     height: screensize.height * 0.02,
//                   ),
//                   TextFormField(
//                       decoration: const InputDecoration(
//                           fillColor: Colors.transparent,
//                           filled: true,
//                           border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20))),
//                           hintText: 'Repeat Password',
//                           prefixIcon: Icon(Icons.lock))),
//                   SizedBox(
//                     height: screensize.height * 0.04,
//                   ),
//                   Container(
//                       height: screensize.height * 0.05,
//                       width: screensize.width * 0.30,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30)),
//                               backgroundColor: Colors.black),
//                           onPressed: () {},
//                           child: Text(
//                             'SIGN UP',
//                             style: GoogleFonts.aDLaMDisplay(
//                                 textStyle: TextStyle(color: Colors.white)),
//                           ))),
//                   SizedBox(
//                     height: screensize.height * 0.12,
//                   ),
//                   Text(
//                     'Already have an account?',
//                     style: TextStyle(fontSize: 10, color: Colors.black),
//                   ),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30)),
//                           backgroundColor: Colors.black),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Login()));
//                       },
//                       child: Text(
//                         'Login',
//                         style: TextStyle(color: Colors.white),
//                       ))
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
