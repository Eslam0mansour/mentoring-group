// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:grade_proj/core/cubit.dart';
// import 'package:grade_proj/widgets/my_form_field.dart';
// import 'package:grade_proj/core/staets.dart';
//
// import '../../styles/colors.dart';
//
// class Register extends StatelessWidget {
//   Register({Key? key}) : super(key: key);
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppState>(
//       listener: (context, state) {
//         if (state is SignUpErrorState) {
//           Fluttertoast.showToast(
//             msg: state.error,
//             toastLength: Toast.LENGTH_LONG,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 1,
//             backgroundColor: AppColors.primaryColor,
//             textColor: Colors.white,
//             fontSize: 16.0,
//           );
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           extendBodyBehindAppBar: true,
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             automaticallyImplyLeading: true,
//             iconTheme: const IconThemeData(
//               color: Colors.black,
//             ),
//           ),
//           body: Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 alignment: Alignment.topCenter,
//                 image: AssetImage('assets/img_3.png'),
//                 fit: BoxFit.contain,
//               ),
//             ),
//             child: SafeArea(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Create an Account',
//                           style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         MyFormField(
//                           hint: 'User Name',
//                           prefixIcon: const Icon(
//                             Icons.person,
//                             color: AppColors.primaryColor,
//                             size: 30,
//                           ),
//                           controller: nameController,
//                           validator: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your name';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         MyFormField(
//                           hint: 'Email',
//                           prefixIcon: const Icon(
//                             Icons.email,
//                             color: AppColors.primaryColor,
//                             size: 30,
//                           ),
//                           controller: emailController,
//                           validator: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your email';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         MyFormField(
//                           hint: 'Password',
//                           prefixIcon: const Icon(
//                             Icons.lock,
//                             color: AppColors.primaryColor,
//                             size: 30,
//                           ),
//                           controller: passwordController,
//                           validator: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         MyFormField(
//                           hint: 'Confirm Password',
//                           prefixIcon: const Icon(
//                             Icons.lock,
//                             color: AppColors.primaryColor,
//                             size: 30,
//                           ),
//                           controller: confirmPasswordController,
//                           validator: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your password';
//                             } else if (value != passwordController.text) {
//                               return 'Password not match';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(
//                           height: 50,
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             if (formKey.currentState!.validate()) {
//                               AppCubit.get(context).signUp(
//                                 email: emailController.text,
//                                 password: passwordController.text,
//                               );
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.primaryColor,
//                             minimumSize: const Size(double.infinity, 50),
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 15,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                           child: state is SignUpLoadingState
//                               ? const Center(
//                                   child: CircularProgressIndicator(
//                                     color: Colors.white,
//                                   ),
//                                 )
//                               : const Text(
//                                   'Register',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 height: 2,
//                                 color: AppColors.primaryColor,
//                               ),
//                             ),
//                             TextButton(
//                                 onPressed: () {},
//                                 child: const Text(
//                                   'Or Connect with',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: AppColors.primaryColor,
//                                   ),
//                                 )),
//                             Expanded(
//                               child: Container(
//                                 height: 2,
//                                 color: AppColors.primaryColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
