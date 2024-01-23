
import 'package:flutter/material.dart';
import 'package:meal_match/dashboard.dart';
import 'package:meal_match/login.dart';
import 'package:meal_match/main.dart';
import 'package:meal_match/navigatiob_bar_code.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
          title: Text('BMI Calculator'),
        ),body: Column(
          children: [
            DietPlanScreen(),
          ],
        ),
    );
  }
}

class DietPlanScreen extends StatefulWidget {
  @override
  _DietPlanScreenState createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  bool showSecondButton = false;
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController goalController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  String dietPlan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Plan App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter your age'),
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter your height in cm'),
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter your weight in kg'),
              ),
              TextField(
                controller: goalController,
                decoration: InputDecoration(labelText: 'Enter your goal(e.g lose weight,gain weight,maintain weight)'),
              ),
              TextField(
                controller: genderController,
                decoration: InputDecoration(labelText: 'Enter your gender'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  generateDietPlan();
                },
                child: Text('Generate Diet Plan'),
              ),
              SizedBox(height: 20),
              Text(
                'Diet Plan:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(dietPlan),
              Center(
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
                }, child: Text('Continue')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void generateDietPlan() {
    // Implement your diet plan generation logic based on user input
    // This is a placeholder, and you should consult a professional for actual diet planning
    setState(() {
      dietPlan = generateSampleDietPlan();
      // showSecondButton = !showSecondButton;
    });
  }

  String generateSampleDietPlan() {
    // This is a simplified example, and you should consult a professional for actual diet planning
    String age = ageController.text;
    String height = heightController.text;
    String weight = weightController.text;
    String goal = goalController.text;
    String gender = genderController.text;

    // Calculate Basal Metabolic Rate (BMR) using Harris-Benedict equation
    double bmr = calculateBMR(int.parse(age), double.parse(height), double.parse(weight),);

    // Determine calorie intake based on goal
    double calorieIntake = determineCalorieIntake(bmr, goal);

    // Generate a sample diet plan
    String dietPlan;

    if (goal.toLowerCase() == 'lose weight') {
      dietPlan = '''
      Weight Loss Diet Plan:
      - Breakfast: 300 calories
        - Scrambled eggs with vegetables
        - Whole grain toast
        - Green tea
      - Snack: 150 calories
        - Greek yogurt
        - Handful of blueberries
      - Lunch: 500 calories
        - Grilled chicken salad
        - Quinoa
        - Light vinaigrette dressing
      - Snack: 100 calories
        - Carrot sticks with hummus
      - Dinner: 550 calories
        - Baked fish
        - Steamed asparagus
        - Cauliflower rice
      Total Calories: $calorieIntake
    ''';
    } else if (goal.toLowerCase() == 'maintain weight') {
      dietPlan = '''
      Maintenance Diet Plan:
      - Breakfast: 400 calories
        - Whole grain cereal with milk
        - Banana
        - Coffee
      - Snack: 200 calories
        - Mixed nuts
        - Orange
      - Lunch: 600 calories
        - Turkey sandwich on whole grain bread
        - Vegetable soup
        - Green salad
      - Snack: 150 calories
        - Cottage cheese with pineapple
      - Dinner: 650 calories
        - Stir-fried tofu with broccoli
        - Quinoa
        - Steamed carrots
      Total Calories: $calorieIntake
    ''';
    } else if (goal.toLowerCase() == 'gain weight') {
      dietPlan = '''
      Weight Gain Diet Plan:
      - Breakfast: 500 calories
        - Peanut butter and banana smoothie
        - Whole wheat toast with avocado
        - Milk
      - Snack: 250 calories
        - Trail mix with dried fruits
      - Lunch: 700 calories
        - Beef and vegetable stir-fry
        - Brown rice
        - Avocado salad
      - Snack: 200 calories
        - Greek yogurt with granola
      - Dinner: 800 calories
        - Spaghetti with meatballs
        - Garlic bread
        - Mixed vegetables
      Total Calories: $calorieIntake
    ''';
    } else {
      // Default to a balanced diet if the goal is not recognized
      dietPlan = '''
      Balanced Diet Plan:
      - Breakfast: 400 calories
        - Whole grain pancakes with maple syrup
        - Fresh fruit salad
        - Herbal tea
      - Snack: 200 calories
        - Hummus with cucumber slices
        - Apple
      - Lunch: 600 calories
        - Grilled salmon
        - Quinoa salad
        - Steamed green beans
      - Snack: 150 calories
        - Yogurt parfait with granola
      - Dinner: 650 calories
        - Roast chicken
        - Sweet potato mash
        - Broccoli with cheese sauce
      Total Calories: $calorieIntake
    ''';
    }

    return dietPlan;
  }

  double calculateBMR(int age, double height, double weight) {
    // Harris-Benedict equation for BMR
    // Men: BMR = 88.362 + (13.397 * weight in kg) + (4.799 * height in cm) - (5.677 * age in years)
    // Women: BMR = 447.593 + (9.247 * weight in kg) + (3.098 * height in cm) - (4.330 * age in years)

    bool isMale = true; // Assume user's gender for simplicity

    if (isMale) {
      return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }
  }

  double determineCalorieIntake(double bmr, String goal) {
    double activityMultiplier;

    switch (goal.toLowerCase()) {
      case 'lose weight':
        activityMultiplier = 1.2; // Sedentary (little or no exercise)
        break;
      case 'maintain weight':
        activityMultiplier = 1.55; // Moderate exercise (3-4 days per week)
        break;
      case 'gain weight':
        activityMultiplier = 1.9; // Very active (6-7 days per week)
        break;
      default:
        activityMultiplier = 1.55; // Default to maintain weight
    }

    return bmr * activityMultiplier;
  }
}
