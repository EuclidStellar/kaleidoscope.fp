// import 'package:flutter/material.dart';
// import 'package:kaleidoscope_fp/auth/signup.dart';
// import 'package:pin_input_text_field/pin_input_text_field.dart';


// class OTPScreen extends StatefulWidget {
//   @override
//   _OTPScreenState createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   final TextEditingController pinController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: SingleChildScrollView(
//         reverse: true,
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Padding(
//                     padding: EdgeInsets.only(left: 12.0),
//                     child: Image(
//                       image: AssetImage(
//                         'assets/images/back_arrow.png',
//                       ),
//                       width: 30,
//                       fit: BoxFit.scaleDown,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 28.0),
//                   child: Text(
//                     'OTP Verification',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 95, 95, 95),
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Image.asset(
//                   'assets/images/img8.png',
            
//                   fit: BoxFit.scaleDown,
//                   //width: 300,
//                 ),
//               ),
//             ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20.0, right: 20.0 , top: 20.0, bottom: 5.0),
//                 child: PinInputTextField(
//                   pinLength: 6,
//                   decoration: BoxLooseDecoration(
                    
//                     strokeColorBuilder: PinListenColorBuilder(
//                       const Color.fromARGB(255, 10, 10, 10),
//                       const Color.fromARGB(255, 10, 10, 10),
//                     ),
//                     radius:const Radius.circular(8),
//                     strokeWidth: 2,
//                     gapSpace: 10,
//                     bgColorBuilder: PinListenColorBuilder(
//                       Color.fromARGB(255, 205, 207, 207),
//                       Color.fromARGB(255, 205, 207, 207),
//                     ),
//                   ),
//                   controller: pinController,
//                   textInputAction: TextInputAction.done,
//                   enabled: true,
//                   keyboardType: TextInputType.number,
//                   textCapitalization: TextCapitalization.characters,
//                   autoFocus: true,
//                   onChanged: (pin) {
//                     if (pin.length == 6) {
//                       // Handle OTP verification here
//                     }
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               GestureDetector(
//               onTap: () {
//                 /*

//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ForgotPassword(),
//                   ),
//                 );

//                 */

//                 // Navigator.pushReplacement(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //         builder: (BuildContext context) => OTPScreen()));
//               },
//               child: const Padding(
//                 padding: EdgeInsets.only(right: 25.0),
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     'Resend OTP',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 95, 95, 95),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//               SizedBox(height: 40),
              
//               Padding(
//               padding: const EdgeInsets.all(20),
//               child: Container(
//                 height: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                 ),
//                 child: Form(
//                   //key: _formKey,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: SignUpButtonXd(
//                           buttonName: 'Verify',
//                           onTap: () async {
                           
//                           },
//                           bgColor: Colors.black,
//                           textColor: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


