import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref {
  static late Box _box;

  // Initialize Hive and open the box
  static Future<void> initialize() async {
    // For initializing Hive in the app's documents directory
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _box = await Hive.openBox("FinalData");
  }

  // Getter for 'showOnboarding'
  static bool get showOnboarding =>
      _box.get("showOnboarding", defaultValue: true);

  // Setter for 'showOnboarding'
  static Future<void> setShowOnboarding(bool value) =>
      _box.put('showOnboarding', value);
}
