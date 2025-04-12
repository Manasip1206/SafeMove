import 'package:flutter/material.dart';



class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _answered = false;
  int? _selectedOption;

  final List<String> _questions = [
  "What is the best way to warm up before a workout?",
  "How many minutes should a warm-up typically last?",
  "What should you avoid doing during stretches?",
  "What is the proper way to breathe during exercise?",
  "Which exercise helps improve posture?",
  "Why is hydration important during workouts?",
  "How can you prevent injury during weightlifting?",
  "What is the best time to stretch your muscles?",
  "Which muscle group does a plank target?",
  "How often should you take breaks during long workouts?",
  "What is a common sign that you’re overtraining?",
  "Which of these is a low-impact exercise?",
  "Why is cooling down after exercise important?",
  "What should you avoid during a yoga session?",
  "Which is a safe move for core strengthening?",
  "What should you do if you feel pain during exercise?",
  "What is a benefit of using proper workout shoes?",
  "Which exercise is ideal for strengthening your back?",
  "Why should you avoid locking your knees during squats?",
  "What is the correct posture for lifting heavy objects?"
];

final List<List<String>> _options = [
  ["Light cardio", "Heavy lifting", "Skipping warm-up", "Eating a snack"],
  ["2-3 minutes", "5-10 minutes", "15-20 minutes", "30 minutes"],
  ["Hold your breath", "Stretch gently", "Hold for 10 seconds", "Breathe deeply"],
  ["Hold your breath", "Inhale during exertion", "Exhale during exertion", "Breathe naturally"],
  ["Plank", "Push-ups", "Deadlifts", "Wall sits"],
  ["Keeps muscles hydrated", "Improves focus", "Prevents cramps", "All of the above"],
  ["Lift as much as possible", "Maintain proper form", "Skip rest breaks", "Rush through reps"],
  ["Before exercising", "After exercising", "During the workout", "At any time"],
  ["Core muscles", "Arms", "Legs", "Shoulders"],
  ["Every 30 minutes", "Every hour", "Every 15 minutes", "No breaks needed"],
  ["Increased energy", "Feeling rested", "Constant fatigue", "Improved strength"],
  ["Running", "Swimming", "Jump squats", "Burpees"],
  ["Increases flexibility", "Prevents dizziness", "Promotes recovery", "All of the above"],
  ["Wear tight clothing", "Stay relaxed", "Hold your breath", "Move too quickly"],
  ["Sit-ups", "Leg raises", "Plank", "Bench press"],
  ["Push through the pain", "Stop immediately", "Drink water", "Slow down slightly"],
  ["Improves balance", "Reduces injury risk", "Provides comfort", "All of the above"],
  ["Pull-ups", "Deadlifts", "Lat pull-downs", "All of the above"],
  ["Ensures proper blood flow", "Increases weight lifted", "Prevents injuries", "Reduces fatigue"],
  ["Bend your back", "Use your legs", "Twist while lifting", "Lift with straight legs"]
];

final List<int> _answers = [
  0, // Light cardio
  1, // 5-10 minutes
  0, // Hold your breath
  2, // Exhale during exertion
  0, // Plank
  3, // All of the above
  1, // Maintain proper form
  1, // After exercising
  0, // Core muscles
  2, // Every 15 minutes
  2, // Constant fatigue
  1, // Swimming
  3, // All of the above
  0, // Wear tight clothing
  2, // Plank
  1, // Stop immediately
  3, // All of the above
  3, // All of the above
  2, // Prevents injuries
  1  // Use your legs
];


  void _checkAnswer(int selectedOption) {
    setState(() {
      _answered = true;
      _selectedOption = selectedOption;

      if (_selectedOption == _answers[_currentQuestionIndex]) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _answered = false;
        _selectedOption = null;
      });
    } else {
      _showScoreDialog();
    }
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _answered = false;
      _selectedOption = null;
    });
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.deepPurple[100],
        title: const Text(
          "Quiz Completed!",
          style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
        content: Text(
          "Your final score: $_score / ${_questions.length}",
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _restartQuiz();
            },
            child: const Text(
              "Restart",
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple,],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: Colors.white,
                height: 120,
                child: Center(
                  child: Text(
                    "Current Score: $_score",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question ${_currentQuestionIndex + 1}:",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _questions[_currentQuestionIndex],
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ..._options[_currentQuestionIndex].asMap().entries.map((entry) {
                      int idx = entry.key;
                      String text = entry.value;

                      return GestureDetector(
                        onTap: !_answered
                            ? () {
                                _checkAnswer(idx);
                              }
                            : null,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: _answered
                                ? idx == _answers[_currentQuestionIndex]
                                    ? Colors.green
                                    : idx == _selectedOption
                                        ? Colors.red
                                        : Colors.white24
                                : Colors.white24,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _restartQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: const Text("Restart",style: TextStyle(color: Colors.white),),
                  ),
                  ElevatedButton(
                    onPressed: _answered ? _nextQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: const Text("Next",style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 50, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
