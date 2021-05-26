import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signin_firebase/authentication/AuthenticationService.dart';
import 'package:signin_firebase/screens/SignInScreen.dart';
import 'package:signin_firebase/styles/Colors.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    final ButtonStyle signUpButtonStyle = TextButton.styleFrom(
      backgroundColor: AppColors.ColorWhite,
      padding: EdgeInsets.symmetric(vertical: 15.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        color: AppColors.ColorBlack,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 50.0, bottom: 45.0, left: 25.0, right: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                      color: AppColors.ColorBlack,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Create \nAccount.',
                      style: TextStyle(
                        fontSize: 32.5,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppColors.ColorBlack,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: AppColors.ColorWhite,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: 40.0, bottom: 60.0, left: 30.0, right: 30.0),
                child: Column(
                  children: [
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          // name
                          TextFormField(
                            controller: _nameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Name cannot be empty';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.ColorWhite),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.ColorWhite),
                              ),
                              labelText: 'Full Name',
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.5,
                                fontWeight: FontWeight.w400,
                                color: AppColors.ColorWhite.withOpacity(0.4),
                                letterSpacing: 0.5,
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17.5,
                              color: AppColors.ColorWhite,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 12.5),
                          // email
                          TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Email cannot be empty';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.ColorWhite),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.ColorWhite),
                              ),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.5,
                                fontWeight: FontWeight.w400,
                                color: AppColors.ColorWhite.withOpacity(0.4),
                                letterSpacing: 0.5,
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17.5,
                              color: AppColors.ColorWhite,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 12.5),
                          // phone
                          TextFormField(
                            controller: _phoneController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Phone No cannot be empty';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.ColorWhite),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.ColorWhite),
                              ),
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.5,
                                fontWeight: FontWeight.w400,
                                color: AppColors.ColorWhite.withOpacity(0.4),
                                letterSpacing: 0.5,
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17.5,
                              color: AppColors.ColorWhite,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 12.5),
                          // password
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password cannot be empty';
                              } else if (value.length < 6) {
                                return 'Password cannot be less than 6 character';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.ColorWhite),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.ColorWhite),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12.5,
                                fontWeight: FontWeight.w400,
                                color: AppColors.ColorWhite.withOpacity(0.4),
                                letterSpacing: 0.5,
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17.5,
                              color: AppColors.ColorWhite,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      width: double.infinity,
                      child: TextButton(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: AppColors.ColorBlack,
                            letterSpacing: 0.5,
                          ),
                        ),
                        style: signUpButtonStyle,
                        onPressed: () {
                          if (_key.currentState.validate()) {
                            createUser();
                            _nameController.clear();
                            _emailController.clear();
                            _phoneController.clear();
                            _passwordController.clear();
                            Fluttertoast.showToast(
                              msg: "Sign Up Successful",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: AppColors.ColorWhite,
                              textColor: AppColors.ColorBlack,
                              fontSize: 15.0,
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an Account?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.25,
                              color: AppColors.ColorWhite,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.25,
                                color: AppColors.ColorWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createUser() async {
    dynamic result =
        await _auth.createUser(_emailController.text, _passwordController.text);
    if (result == null) {
      print('Invalid data');
    } else {
      print(result.toString());
    }
  }
}
