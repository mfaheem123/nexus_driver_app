import 'package:driver_app_alpha/Component/textStyle.dart';
import 'package:driver_app_alpha/Routes/app_pages.dart';
import 'package:driver_app_alpha/View/Auth/Controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Component/color.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _keepLoggedIn = true;

  AuthController controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                // Top Image and Title Section remains the same
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      const Opacity(opacity: 0.2),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/login.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Log In",
                              style: gilroySemiBold(
                                color: DynamicColors.whiteColor,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Please Sign in to Continue',
                              style: gilroyMedium(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Form Section
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 120,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 50),

                          /// Username Field with validation
                          TextFormField(
                            controller: controller.DriverUserName,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: _buildPrefixIcon(Icons.person),
                              hintText: 'Username',
                              hintStyle: gilroyMedium(color: Colors.white),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 91, 19, 128),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              errorStyle: const TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// Password Field with validation
                          TextFormField(
                            controller: controller.DriverPassword,
                            obscureText: _obscureText,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },

                            decoration: InputDecoration(
                              prefixIcon: _buildPrefixIcon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),

                              hintText: 'Password',
                              hintStyle: gilroyMedium(color: Colors.white),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 91, 19, 128),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              errorStyle: const TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Keep me Login',
                                  style: gilroyMedium(
                                    fontSize: 18,
                                    color: const Color.fromARGB(
                                      255,
                                      91,
                                      19,
                                      128,
                                    ),
                                  ),
                                ),
                                Transform.scale(
                                  scale: 0.70,
                                  child: Switch(
                                    value: _keepLoggedIn,
                                    onChanged: (value) {
                                      setState(() {
                                        _keepLoggedIn = value;
                                      });
                                    },
                                    activeColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          ElevatedButton(
                            onPressed: () {
                            
                              if (_formKey.currentState!.validate()) {
                                  controller.authApi();
                              }
            
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                63,
                                172,
                                67,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 100,
                                vertical: 15,
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: gilroyMedium(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrefixIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_buildCircleIcon(icon), const SizedBox(width: 10)],
      ),
    );
  }

  Widget _buildCircleIcon(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.lightBlueAccent.withOpacity(0.5),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(5),
      child: Icon(icon, color: Colors.deepPurple, size: 30),
    );
  }
}

// class _LoginScreenState extends State<LoginScreen> {
//
//   bool _obscureText = true;
//   bool _keepLoggedIn = true;
//
//   AuthController controller = Get.put(AuthController());
//   final _formKey = GlobalKey<FormState>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             child: Column(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Stack(
//                     children: [
//                       Opacity(opacity: 0.2),
//                       Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage('assets/login.png'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: 20,
//                         bottom: 40,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Log In",
//                               style: gilroySemiBold(
//                                   color:DynamicColors.whiteColor,
//                                   fontSize: 30,
//                                   // fontWeight: FontWeight.w700
//                               ),
//                             ),
//                              SizedBox(height: 5),
//                              Text(
//                               'Please Sign in to Continue',
//                               style: gilroyMedium(
//                                 color: Colors.white,
//                                 fontSize: 22,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Container(
//                     margin: EdgeInsets.only(top: 0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30),
//                       ),
//                     ),
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Container(
//                           width: 140,
//                           height: 5,
//                           decoration: BoxDecoration(
//                             color: Colors.deepPurple,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         SizedBox(height: 120),
//                         Column(
//                           children: [
//
//                             TextFormField(
//                               controller: controller.DriverUserName,
//                               decoration: InputDecoration(
//                                 prefixIcon: Container(
//                                   margin: EdgeInsets.only(left: 1),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       SizedBox(width: 10),
//                                       _buildCircleIcon(Icons.person),
//                                       SizedBox(width: 12),
//                                     ],
//                                   ),
//                                 ),
//                                 hintText: 'Username',
//                                 hintStyle: gilroyMedium(color: Colors.white),
//                                 filled: true,
//                                 fillColor: Color.fromARGB(255, 91, 19, 128),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide: BorderSide.none,
//                                 ),
//                               ),
//                               style: TextStyle(color: Colors.white, fontSize: 22),
//                             ),
//                             SizedBox(height: 20),
//                             TextField(
//                               controller: controller.DriverPassword,
//                               obscureText: _obscureText,
//                               decoration: InputDecoration(
//                                 prefixIcon: Container(
//                                   margin: EdgeInsets.only(left: 1),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       SizedBox(width: 10),
//                                       _buildCircleIcon(Icons.lock),
//                                       SizedBox(width: 12),
//                                     ],
//                                   ),
//                                 ),
//                                 suffixIcon: IconButton(
//                                   icon: Icon(
//                                     _obscureText
//                                         ? Icons.visibility_off
//                                         : Icons.visibility,
//                                     color: Colors.white,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       _obscureText = !_obscureText;
//                                     });
//                                   },
//                                 ),
//                                 hintText: 'Password',
//                                 filled: true,
//                                 fillColor: Color.fromARGB(255, 91, 19, 128),
//                                 hintStyle: gilroyMedium(color: Colors.white),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide: BorderSide.none,
//                                 ),
//                               ),
//                               style: TextStyle(color: Colors.white, fontSize: 22),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 30),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Keep me Login',
//                               style: gilroyMedium(fontSize: 18),
//                             ),
//                             Transform.scale(
//                               scale: 0.70,
//                               child: Switch(
//                                 value: _keepLoggedIn,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     _keepLoggedIn = value;
//                                   });
//                                 },
//                                 activeColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: () {
//                             if(controller.DriverUserName.text==""||controller.DriverPassword.text==""){
//                               BotToast.showText(text: "Please Enter Your Details");
//                             }
//                             else{
//                               Get.toNamed(Routes.tokenScreen);
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color.fromARGB(255, 63, 172, 67),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             padding:
//                                 EdgeInsets.symmetric(horizontal: 100, vertical: 15),
//                           ),
//                           child: Text(
//                             'Login',
//                             style: gilroyMedium(color: Colors.white, fontSize: 25),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildCircleIcon(IconData icon) {
//     double heights = MediaQuery.of(context).size.height;
//     double widths = MediaQuery.of(context).size.width;
//     return Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white,
//         border: Border.all(
//             color: Colors.lightBlueAccent.withOpacity(0.5), width: 1),
//       ),
//       padding: EdgeInsets.all(5),
//       child: Icon(
//         icon,
//         color: Colors.deepPurple,
//         size: 30,
//       ),
//     );
//   }
//
//
// }
