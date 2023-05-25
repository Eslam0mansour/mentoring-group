// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:grade_proj/core/cubit.dart';
// import 'package:grade_proj/screens/intro/login.dart';
// import 'package:grade_proj/screens/intro/register.dart';
// import 'package:grade_proj/core/staets.dart';
// import 'package:grade_proj/styles/colors.dart';
//
// class OnBoarding extends StatelessWidget {
//   const OnBoarding({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AppCubit, AppState>(
//       builder: (context, state) {
//         return Scaffold(
//           body: Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 alignment: Alignment.topCenter,
//                 image: AssetImage('assets/img_2.png'),
//                 fit: BoxFit.contain,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//                 vertical: 120,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                    Text(
//                     'Welcome to',
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SvgPicture.asset(
//                     'assets/plantcare.svg',
//                     color: (Theme.of(context).brightness == Brightness.light)
//                         ? Colors.black
//                         : Colors.white,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Text(
//                     'sign in to get your plants into their best shape\nwith personalized recommendations ',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (
//                           context) => Register()));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryColor,
//                       minimumSize: const Size(double.infinity, 50),
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 10,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     child: const Text(
//                       'Create an account',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (
//                             context) => Login()));
//                       },
//                       child: const Text(
//                         'SIGN IN',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: AppColors.primaryColor,
//                         ),
//                       )),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
