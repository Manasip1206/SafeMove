
import 'package:final_year_project_1/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../model/onboard.dart';

Size mq = Size.zero; // Ensure proper initialization for global mq

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController c = PageController();
  final List<Onboard> list = [
    Onboard(
      title: "Welcome to Safe Moves!",
      subtitle:
          "Your personal guide to mastering safe movements and avoiding injuries!",
      lottie: "assets/lottie/workoutman.json",
    ),
    Onboard(
      title: "Your Journey to Injury-Free Movement",
      subtitle:
          "🎯 Track your progress over time.💡 Learn proper techniques with expert guidance.💪 Build confidence in every movement.",
      lottie: "assets/lottie/women.json",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
      
        controller: c,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final isLast = index == list.length - 1;
          return Column(
            children: [
              Lottie.asset(list[index].lottie, height: mq.height * 0.6),
              Center(
                child: Text(
                  list[index].title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              SizedBox(height: mq.height * 0.01),
              SizedBox(
                width: mq.width * 0.7,
                child: Text(
                  list[index].subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    letterSpacing: 0.5,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Wrap(
                spacing: 10,
                children: List.generate(
                  list.length,
                  (i) => Container(
                    width: i == index ? 15 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (isLast) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  } else {
                    c.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(mq.width * 0.4, 50),
                ),
                child: Text(
                  isLast ? "Finish" : "Next",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
