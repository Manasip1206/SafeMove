import 'package:final_year_project_1/helper/global.dart';
import 'package:final_year_project_1/screen/onboarding_screen.dart';
import 'package:final_year_project_1/widget/custom_loading.dart';
import 'package:flutter/material.dart';

Size mq = Size.zero; // Initialize MediaQuery size variable

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return const OnboardingScreen();
      }));
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => Pref.showOnboarding
      //         ? const OnboardingScreen()
      //         : const HomeScreen(),
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(flex: 2),
            Card(
              color: Colors.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(mq.width * 0.05),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: mq.width * 0.4,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Text(appName,style: TextStyle(
              color: Colors.black,fontSize: 30,fontWeight: FontWeight.w900,
            ),),
            const Spacer(),
            const CustomLoading(),
            // const CircularProgressIndicator(), // Simplified loading indicator
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
