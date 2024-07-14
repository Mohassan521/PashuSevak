import 'package:flutter/material.dart';
import 'package:pashusevak/screens/FrontPage.dart';
import 'package:pashusevak/screens/selectLanguage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                buildPage(
                  context,
                  'assets/images/Carousel1.png',
                  'Doctor in 30 minutes',
                  'Emergency care for your cattle right at your doorstep in 30 minutes.',
                ),
                buildPage(
                  context,
                  'assets/images/Carousel2.png',
                  'CattleReport and Prescription',
                  'Subtitle for Page 2',
                ),
                buildPage(
                  context,
                  'assets/images/Carousel3.png',
                  'Title for Page 3',
                  'Subtitle for Page 3',
                ),
                buildPage(
                  context,
                  'assets/images/Carousel4.png',
                  'Title for Page 4',
                  'Subtitle for Page 4',
                ),
              ],
            ),
          ),
          SizedBox(height: 16), // Add some space between PageView and indicator
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.orange,
            ),
          ),
          SizedBox(height: 16), // Add some space between indicator and buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_controller.page == 3) {
                      // Handle proceed action for the last page
                    } else {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                  ),
                  child: Icon(Icons.arrow_forward),
                ),
                TextButton(
                  onPressed: () {
                    // Handle skip action
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectLanguageScreen()));
                  },
                  child: Text('Skip and proceed'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(
      BuildContext context, String imagePath, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(imagePath),
            ),
          ),
          SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
