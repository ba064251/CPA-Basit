import 'package:cpa/UI/screens/Analysis/analysis_page1.dart';
import 'package:cpa/export.dart';
import 'package:cpa/services/shared_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  final List<String> images = [
    'assets/images/cpalogo.png',
    'assets/Frame.png',
    'assets/images/cpalogo.png',
  ];
  int _currentPage = 0;
  final PageController _pageController = PageController();
  final int numberOfImages = 3;
  bool showContainer = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _nextPage();
    });
  }

  void _nextPage() {
    if (_currentPage < numberOfImages - 1) {
      _pageController.nextPage(
        duration: const Duration(seconds: 2),
        curve: Curves.ease,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: numberOfImages,
        onPageChanged: (page) {
          setState(() {
            _currentPage = page;
          });
          if (page == numberOfImages - 1) {
            _nextPage();
          }
        },
        itemBuilder: (context, index) {
          return SplashScreenPage(
            image: images[index],
            isLastScreen: index == numberOfImages - 1,
            pageController: _pageController,
          );
        },
      ),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  final String image;
  final bool isLastScreen;
  final PageController pageController;

  SplashScreenPage({
    required this.image,
    required this.isLastScreen,
    required this.pageController,
  });

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late Duration animationDuration;

  @override
  void initState() {
    super.initState();
    animationDuration = widget.isLastScreen
        ? const Duration(seconds: 3)
        : const Duration(seconds: 3);
    if (!widget.isLastScreen) {
      Future.delayed(const Duration(seconds: 3), () {
        _nextPage();
      });
    }
  }

  void _nextPage() {
    if (widget.pageController.page == 0) {
      widget.pageController.animateToPage(
        1,
        duration: const Duration(seconds: 3),
        curve: Curves.ease,
      );
    }
    if (widget.pageController.page == 1) {
      widget.pageController.animateToPage(
        2,
        duration: const Duration(seconds: 3),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/Framebg.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/bottom.png',
          ),
        ),
        if (widget.image == 'assets/images/cpalogo.png')
          Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: animationDuration,
              curve: Curves.easeOut,
              height: 200,
              width: 200,
              child: Image.asset(widget.image),
            ),
          ),
        if (widget.image == 'assets/Frame.png' && !widget.isLastScreen)
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBoxes.verticalExtraGargangua,
              Image.asset(CPAAssets.CpaLogo),
              Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedContainer(
                  duration: animationDuration,
                  curve: Curves.easeOut,
                  height: 200,
                  width: 200,
                  child: Image.asset(widget.image),
                ),
              ),
            ],
          ),
        if (widget.isLastScreen)
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 300,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Welcome!',
                      style: CPATextTheme().heading6.copyWith(
                            color: CPAColorTheme().primarygolden,
                          ),
                    ),
                    Text(
                      'Click the link below to get your Personal Comprehensive Preparedness Analysis (CPA) tailored specifically to you and your family\'s needs in a matter of minutes!',
                      style: CPATextTheme().body.copyWith(
                            color: CPAColorTheme().black,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBoxes.verticalBig,
                    SizedBox(
                      width: 238,
                      height: 37,
                      child: CustomButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AnalysisScreen1(),
                            ),
                          );
                        },
                        buttonText: 'Begin Analysis',
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: AnimatedContainer(
                  duration: animationDuration,
                  curve: Curves.easeOut,
                  height: 400,
                  width: 400,
                  child: Image.asset('assets/images/cpalogo.png'),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
