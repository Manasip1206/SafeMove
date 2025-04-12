import 'package:final_year_project_1/helper/global.dart';
import 'package:final_year_project_1/screen/firstScreen.dart';
import 'package:final_year_project_1/screen/profile.dart';
import 'package:final_year_project_1/screen/quiz.dart';
import 'package:final_year_project_1/screen/workouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    // Initializing device size
    mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 5, 81, 143), Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Image.asset("assets/images/logo.png"),
        title: const Text(
          appName,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white, size: 30),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // This will now work correctly
              },
            ),
          ),
        ],
      ),
      drawer: SizedBox(
        width: 250,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
               DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 5, 81, 143),
                ),
                // 
                child: LottieBuilder.asset("assets/lottie/askme.json"),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  _pageController.jumpToPage(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.fitness_center),
                title: const Text('Workouts'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  _pageController.jumpToPage(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.quiz),
                title: const Text('Quiz'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  _pageController.jumpToPage(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  _pageController.jumpToPage(3);
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              // New options added here
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);  // Close the Drawer
                  // Navigate to Settings page
                  // You can replace this with your actual Settings screen
                  print('Navigate to Settings');
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share with Friends'),
                onTap: () {
                  Navigator.pop(context);  // Close the Drawer
                  // Add your share logic here
                  print('Share with Friends');
                },
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Rate Us'),
                onTap: () {
                  Navigator.pop(context);  // Close the Drawer
                  // Add your rate us logic here
                  print('Rate Us');
                },
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          const Firstscreen(),
          WorkOutPage(),
          const QuizPage(),
          const SafeMovesProfile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.universal_access_solid),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.burn_solid), label: 'Workout'),
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.question_solid), label: 'Quiz'),
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.user), label: 'Profile'),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.purple,
      ),
    );
  }
}
