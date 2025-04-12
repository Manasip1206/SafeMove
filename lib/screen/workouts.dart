import 'package:flutter/material.dart';
import 'package:final_year_project_1/widget/search_bar.dart'  as custom_search;


const Color cardioColor = Color(0xFF953CE6);
const Color pilatesColor = Color(0xFF00b87c);
const Color yogaColor = Color(0xFF353491);
const Color textColor = Colors.white;

class WorkOutPage extends StatelessWidget {
  final List<Map<String, String>> workouts = [
    {
      'title': 'Cardio',
      'duration': '30 minutes',
      'activity': 'Medium activity',
      'image': 'assets/images/cardio.PNG',
      'color': '#953CE6'
    },
    {
      'title': 'Pilates',
      'duration': '45 minutes',
      'activity': 'Heavy activity',
      'image': 'assets/images/pilates.PNG',
      'color': '#00b87c'
    },
    {
      'title': 'Yoga',
      'duration': '20 minutes',
      'activity': 'Light activity',
      'image': 'assets/images/yoga.PNG',
      'color': '#353491'
    },
  ];

 WorkOutPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // Added SafeArea to prevent content obstruction
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // SizedBox(height: 50),
              // Text(
              //   'Workout',
              //   style: TextStyle(
              //     color: Color(0xFFFE7C7C),
              //     fontWeight: FontWeight.bold,
              //     fontSize: 28.0,
              //   ),
              // ),
              Image.asset('assets/images/workout.PNG'),
              const SizedBox(height: 10),
              const custom_search.SearchBar('What do you want to do today?'),

              const SizedBox(height: 10),
              Expanded( // Use Expanded to fill available space
                child: ListView.builder(
                  itemCount: workouts.length,
                  itemBuilder: (context, index) {
                    final workout = workouts[index];
                    return WorkoutContainer(
                      title: workout['title']!,
                      duration: workout['duration']!,
                      activity: workout['activity']!,
                      image: workout['image']!,
                      color: Color(int.parse('0xFF${workout['color']!.substring(1)}')),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutContainer extends StatelessWidget {
  final String title;
  final String duration;
  final String activity;
  final String image;
  final Color color;

  const WorkoutContainer({super.key, 
    required this.title,
    required this.duration,
    required this.activity,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  duration,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
                Text(
                  activity,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(image,scale: 1.5),
          ],
        ),
      ),
    );
  }
}
