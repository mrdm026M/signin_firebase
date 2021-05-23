import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
                  autoPlay: false,
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
              children: [
                Container(
                  height: 80.0,
                  color: Colors.red,
                ),
                Container(
                  height: 80.0,
                  color: Colors.blue,
                ),
                Container(
                  height: 100.0,
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _imagePaths.map((url) {
                      int index = _imagePaths.indexOf(url);
                      return Container(
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
              AppColors.ColorBlack.withOpacity(0.5), BlendMode.dstATop),
          image: new AssetImage(imgPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
