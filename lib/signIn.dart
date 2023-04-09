
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/image2.jpeg',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Name',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye_outlined)
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            const Text(
              'Email',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            TextFormField(
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            TextFormField(
            )
          ],
        ),
      ),
    );
  }
}
