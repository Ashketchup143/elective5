import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiMeals extends StatefulWidget {
  @override
  _ApiMealsState createState() => _ApiMealsState();
}

class Meal {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  Meal({required this.strMeal, required this.strMealThumb, required this.idMeal});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }
}

class _ApiMealsState extends State<ApiMeals> {
  List<Meal> _meals = [];

  @override
  void initState() {
    super.initState();
    _getMeals();
  }

  void _getMeals() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final mealsData = data['meals'] as List;
      setState(() {
        _meals = mealsData.map((meal) => Meal.fromJson(meal)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
 Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext , BoxConstraints constraints){
        if(constraints.maxWidth>400){
          return webUI(context);
        } else{
          return mobileUI(context);
        }
      },
      );
  }

  @override
  Widget mobileUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seafood Meals'),
        backgroundColor: const Color.fromARGB(255, 207, 65, 229),
      ),
      body: _meals.length > 0
          ? Container(
            color: Color.fromARGB(255, 234, 172, 244),
            child: ListView.builder(
                itemCount: _meals.length,
                itemBuilder: (context, index) {
                  final meal = _meals[index];
                  return ListTile(
                    leading: Image.network(meal.strMealThumb),
                    title: Text(meal.strMeal),
                    subtitle: Text('ID: ${meal.idMeal}'),
                  );
                },
              ),
          )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
  Widget webUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seafood Meals'),
        backgroundColor: const Color.fromARGB(255, 207, 65, 229),
      ),
       body: _meals.length > 0
          ? Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: _meals.map((meal) {
              return Container(
                width: 200.0,
                child: Card(
                  child: Container(
                    width: 250.0,
                    height: 300.0,
                    child: Column(
                      children: [
                        Image.network(meal.strMealThumb),
                        SizedBox(height: 20.0),
                        Text(meal.strMeal),
                        SizedBox(height: 20.0),
                        Text('ID: ${meal.idMeal}'),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          )
          : Center(
              child: CircularProgressIndicator(),
            ),
                            // Image.network(meal.strMealThumb),
                            // SizedBox(height: 20.0),
                            // Text(meal.strMeal),
                            // SizedBox(height: 20.0),
                            // Text('ID: ${meal.idMeal}'),
                        
                       
          
    );
          }
}

