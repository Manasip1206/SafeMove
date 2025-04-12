import 'package:flutter/material.dart';

import 'package:final_year_project_1/widget/search_bar.dart'  as custom_search;
class Firstscreen extends StatelessWidget {
  

  static const String id = 'main_screen';

  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 50),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Text(
            //     'Safe Moves',
            //     style: TextStyle(
            //       color: Color(0xFFFE7C7C),
            //       fontWeight: FontWeight.bold,
            //       fontSize: 28.0,
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Text(
            //     'Prevent Your Injury',
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.w400,
            //       fontSize: 18.0,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 10),
            Image.asset('assets/images/align.PNG'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: const SizedBox(
                child: custom_search.SearchBar('What pose do you wish to align?'),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Perfect Your Posture',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                scrollDirection: Axis.horizontal,
                children: [
                  _buildExerciseButton(
                      context, 'assets/images/crunch.PNG', () => print('hello')),
                  _buildExerciseButton(
                      context,
                      'assets/images/arm_press.PNG',
                      ()=>{}),
                  _buildExerciseButton(
                      context, 'assets/images/push_up.PNG', () => print('hello')),
                  _buildExerciseButton(
                      context,
                      'assets/images/squat.PNG',
                      ()=>{}),
                  _buildExerciseButton(
                      context, 'assets/images/plank.PNG', () => print('hello')),
                  _buildExerciseButton(
                      context, 'assets/images/lunge_squat.PNG', () => print('hello')),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Safe Yoga Practices',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                scrollDirection: Axis.horizontal,
                children: [
                  _buildExerciseButton(
                      context, 'assets/images/yoga1.PNG', () => print('hello')),
                  _buildExerciseButton(
                      context,
                      'assets/images/yoga4.PNG',
                     ()=>{}),
                  _buildExerciseButton(
                      context, 'assets/images/yoga2.PNG', () => print('hello')),
                  _buildExerciseButton(
                      context, 'assets/images/yoga3.PNG', () => print('hello')),
                  _buildExerciseButton(
                      context, 'assets/images/yoga5.PNG', () => print('hello')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseButton(
      BuildContext context, String imagePath, VoidCallback onPressed) {
    return Stack(
      children: <Widget>[
        Container(
          width: 140,
          height: 140,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              backgroundColor: Colors.white,
            ),
            onPressed: onPressed,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(imagePath),
            ),
          ),
        ),
      ],
    );
  }

}