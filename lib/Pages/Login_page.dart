import 'package:flutter/material.dart';
import 'package:news_app/Items/validateemail.dart';
import 'package:news_app/Pages/Home_page.dart';
import 'package:news_app/Pages/Register_page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            // Column(
            //   children: [
            //     SizedBox(
            //       height: 10,
            //     ),
            Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background2.jpg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formSignInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
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
                      // label: const Text('Email'),
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
                      //label: const Text('Password'),
                      hintText: 'Enter Password',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberPassword,
                            onChanged: (bool? value) {
                              setState(() {
                                rememberPassword = value!;
                              });
                            },
                            // activeColor: lightColorScheme.primary,
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: Text(
                          'Forget password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {
                      //validateEmail()
                      if (_formSignInKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.7,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                        child: Text(
                          'Login in with',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.7,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/facebook_logo.png',
                        scale: 70,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/twitter_logo.png', scale: 45),
                      SizedBox(width: 5),
                      Image.asset('assets/google_logo.png', scale: 14)
                    ],
                  ),
                  const SizedBox(
                    height: 120.0,
                  ),
                  // don't have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
// import 'package:news_app/Items/validateemail.dart';
// import 'package:news_app/Pages/Home_page.dart';
// import 'package:news_app/Pages/Register_page.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
//   bool _isChecked = false;

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   String _emailError = "";
//   String _passwordError = "";

//   void _onSavePressed() {
//     void _onSavePressed() {
//       final emailError = validateEmail(_emailController.text);
//       final passwordError = validatePassword(_passwordController.text);

//       if (emailError == "" && passwordError == "") {
//         // Successful login logic goes here
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Login successful!'),
//             duration: Duration(seconds: 3),
//           ),
//         );

//         Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => Home(),
//         ));
//       } else {
//         // Show validation errors
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Please correct the errors.'),
//             duration: Duration(seconds: 3),
//           ),
//         );

//         setState(() {
//           _emailError = emailError;
//           _passwordError = passwordError;
//         });
//       }
//     }

//     // final emailError = validateEmail(_emailController.text);
//     // final passwordError = validatePassword(_passwordController.text);
//     // if (emailError == "" && passwordError == "") {
//     //   ScaffoldMessenger.of(context).showSnackBar(
//     //     const SnackBar(
//     //       content: Text('Login successful!'),
//     //       duration: Duration(seconds: 3),
//     //     ),
//     //   );

//     //   Navigator.of(context).push(MaterialPageRoute(
//     //       builder: (context) => Home(
//     //           // email: _emailController.text,
//     //           )));
//     // } else {
//     //   setState(() {
//     //     _emailError = emailError;
//     //     _passwordError = passwordError;
//     //   });
//     // }
//   }

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
//             padding: const EdgeInsets.all(20),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Text(
//                     'Login',
//                     style: GoogleFonts.acme(
//                       textStyle: TextStyle(fontSize: 30),
//                     ),
//                   ),
//                   SizedBox(
//                     height: screensize.height * 0.03,
//                   ),
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       hintText: 'Email address',
//                       errorText: _emailError,
//                       hintStyle: const TextStyle(color: Colors.black),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.4),
//                       prefixIcon: const Icon(
//                         Icons.email,
//                         color: Colors.black,
//                       ),
//                     ),
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                   SizedBox(
//                     height: screensize.height * 0.01,
//                   ),
//                   TextFormField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       errorText: _passwordError,
//                       hintStyle: const TextStyle(color: Colors.black),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(0.4),
//                       //.withOpacity(0.3),
//                       prefixIcon: const Icon(
//                         Icons.lock,
//                         color: Colors.black,
//                       ),
//                     ),
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                   Row(
//                     children: [
//                       Spacer(),
//                       TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             'Forgot password?',
//                             style: TextStyle(color: Colors.black),
//                           ))
//                     ],
//                   ),
//                   SizedBox(
//                     height: screensize.height * 0.02,
//                   ),
//                   Container(
//                     height: screensize.height * 0.05,
//                     width: screensize.width * 0.30,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(150),
//                       color: Colors.transparent,
//                     ),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         backgroundColor: Colors.black,
//                       ),
//                       onPressed:
//                           _onSavePressed, // Remove the extra onPressed label
//                       child: Text(
//                         'LOGIN',
//                         style: GoogleFonts.aDLaMDisplay(
//                           textStyle: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),

//                   // Container(
//                   //     height: screensize.height * 0.05,
//                   //     width: screensize.width * 0.30,
//                   //     decoration: BoxDecoration(
//                   //       borderRadius: BorderRadius.circular(150),
//                   //       color: Colors.transparent,
//                   //     ),
//                   //     child: ElevatedButton(
//                   //         style: ElevatedButton.styleFrom(
//                   //             shape: RoundedRectangleBorder(
//                   //                 borderRadius: BorderRadius.circular(30)),
//                   //             backgroundColor: Colors.black),
//                   //         onPressed: () {
//                   //           onPressed:
//                   //           () {
//                   //             _onSavePressed();
//                   //           };
//                   //           // Navigator.push(
//                   //           //     context,
//                   //           //     MaterialPageRoute(
//                   //           //         builder: (context) => Home()));
//                   //         },
//                   //         child: Text(
//                   //           'LOGIN',
//                   //           style: GoogleFonts.aDLaMDisplay(
//                   //               textStyle: TextStyle(color: Colors.white)),
//                   //         ))),
//                   SizedBox(
//                     height: screensize.height * 0.10,
//                   ),
//                   Text(
//                     'Or Signup using',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: screensize.height * 0.02),
//                   ),
//                   SizedBox(
//                     height: screensize.height * 0.01,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/facebook_logo.png',
//                         scale: 70,
//                       ),
//                       SizedBox(
//                         width: screensize.width * 0.02,
//                       ),
//                       Image.asset('assets/twitter_logo.png', scale: 45),
//                       SizedBox(
//                         width: screensize.width * 0.02,
//                       ),
//                       Image.asset('assets/google_logo.png', scale: 14)
//                     ],
//                   ),
//                   SizedBox(
//                     height: screensize.height * 0.170,
//                   ),
//                   Text(
//                     'New here?',
//                     style: TextStyle(
//                         color: Colors.black,
//                         // fontWeight: FontWeight.bold,
//                         fontSize: screensize.height * 0.02),
//                   ),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30)),
//                           backgroundColor: Colors.black),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => register()));
//                       },
//                       child: Text(
//                         'Register',
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
