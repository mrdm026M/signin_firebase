import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:signin_firebase/screens/SignInScreen.dart';
import 'package:signin_firebase/screens/SignUpScreen.dart';
import 'package:signin_firebase/styles/Colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<String> _imagePaths = [
    './assets/images/1.jpg',
    './assets/images/2.jpg',
    './assets/images/3.jpg',
    './assets/images/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    final ButtonStyle signInButtonStyle = TextButton.styleFrom(
      backgroundColor: AppColors.ColorBlack,
      padding: EdgeInsets.symmetric(vertical: 15.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: deviceSize.width,
            height: deviceSize.height,
            color: AppColors.ColorBlack,
            child: Center(
              child: CarouselSlider.builder(
                itemCount: _imagePaths.length,
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  autoPlay: true,
                  height: deviceSize.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return ImageView(imgPath: _imagePaths[index]);
                },
              ),
            ),
          ),
          Container(
            width: deviceSize.width,
            height: deviceSize.height,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                    width: double.infinity,
                    child: Text(
                      'My Social',
                      style: TextStyle(
                        fontSize: 17.5,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: AppColors.ColorWhite.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                  width: double.infinity,
                  child: Text(
                    'Start a new \nsocial adventure.',
                    style: TextStyle(
                      fontSize: 32.5,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.ColorWhite,
                      letterSpacing: 0.25,
                      height: 1.25,
                    ),
                  ),
                ),
                Container(
                  height: 275.0,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 0, bottom: 22.5, left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: _imagePaths.map((url) {
                            int index = _imagePaths.indexOf(url);
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              width: 8.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == index
                                    ? Color.fromRGBO(0, 0, 0, 0.9)
                                    : Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 25.0),
                          child: Column(
                            children: [
                              Text(
                                'Get involved with people and events around you',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.ColorBlack,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 25.0),
                                width: double.infinity,
                                child: TextButton(
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.ColorWhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  style: signInButtonStyle,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInScreen()),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Or Create Account',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.25,
                                          color: AppColors.ColorBlack,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7.5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen(),
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_rounded,
                                        size: 30.0,
                                        color: AppColors.ColorBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.ColorWhite,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  final String imgPath;
  ImageView({Key key, this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              AppColors.ColorBlack.withOpacity(0.3), BlendMode.dstATop),
          image: new AssetImage(imgPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
