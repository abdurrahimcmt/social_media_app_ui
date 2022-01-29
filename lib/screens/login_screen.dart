import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHight,
          child: Column(
            children: [
              Image(
                height: screenHight / 2.5,
                width: screenWidth,
                image: const AssetImage('assets/images/login_background.jpg'),
                fit: BoxFit.cover,
              ),
              Text(
                'HANGOUTS',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'User Name',
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30,
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 45,
                width: screenWidth * 0.7,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      color: Theme.of(context).primaryColor,
                      height: 80.0,
                      child: const Text(
                        'Dont\'t have an account? Sing up',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
