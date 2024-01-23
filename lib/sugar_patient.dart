import 'package:flutter/material.dart';
import 'package:meal_match/contact_with_dietitian.dart';
import 'package:sizer/sizer.dart';

class SugarPatientScreen extends StatefulWidget {
  const SugarPatientScreen({Key? key}) : super(key: key);

  @override
  State<SugarPatientScreen> createState() => _SugarPatientScreenState();
}

class _SugarPatientScreenState extends State<SugarPatientScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Diabaties Patient'),
      ),
      body: Sizer(  builder: (context, orientation, deviceType)=>
          Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 3.w),
                  child: SingleChildScrollView(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text('What foods can I eat if I have diabetes?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      SizedBox(height: 10,),
                      Text(
                          'You may worry that having diabetes means going without foods you enjoy. The good news is that you can still eat your favorite foods, but you might need to eat smaller portions or enjoy them less often. Your health care team will help create a diabetes meal plan for you that meets your needs and likes.'
                          'The key to eating with diabetes is to eat a variety of healthy foods from all food groups, in the amounts your meal plan outlines.',
                      textAlign: TextAlign.justify,),
                      SizedBox(height: 5,),
                    Text('The food groups are '),
                    SizedBox(height: 10,),
                    Text('Vegetables',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                    Text('•nonstarchy: includes broccoli, carrots, greens, peppers, and tomatoes\n •tarchy: includes potatoes, corn, and green peas'),
                      SizedBox(height: 10,),
                      Text('Fruits',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('includes oranges, melon, berries, apples, bananas, and grapes'),
                      SizedBox(height: 10,),
                      Text('Grains',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('at least half of your grains for the day should be whole grains includes wheat, rice, oats, cornmeal, barley, and quinoa examples: bread, pasta, cereal, and tortillas',textAlign: TextAlign.justify,),
                      SizedBox(height: 10,),
                      Text('Proteins',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('•lean meat\n•chicken or turkey without the skin\n•fish\n•eggs\n•nuts and peanuts\n•dried beans and certain peas, such as chickpeas and split peas\n•meat substitutes, such as tofu'),
                      SizedBox(height: 10,),
                      Text('For more details consult with dietatian',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Center(
                      child: ElevatedButton(onPressed: (){
                    
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactListScreen()));
                      },
                          child:Text('Consult')),
                    ),
                    
                    ],
                    ),
                  ),
                ),
              ),
        ),
    );
  }
}
