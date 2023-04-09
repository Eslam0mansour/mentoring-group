
import 'package:flutter/material.dart';
import 'package:untitled1/signIn.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){

              },
              child: Image.asset(
                  'assets/image2.jpeg'
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return const SignIn();
                  },)
                );
              },
              child: Image.asset(
                  'assets/image3.jpeg'
              ),
            ),
          ],
        ),
      ),
    );
  }
}