import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_user_entity.dart';
import 'package:keep_fit/features/diary/presentation/bloc/bloc/meal_bloc/meals_bloc_bloc.dart';
import 'package:keep_fit/features/diary/presentation/widgets/product_widget.dart';
import 'package:keep_fit/themes/colors.dart';

@RoutePage()
class ProductPageWidget extends StatefulWidget {
  ProductPageWidget({super.key, required this.ingredients});
  List<IngredientUserEntity> ingredients;
  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  void changeIngredient(int index, IngredientEntity ingredient, int weight){
    widget.ingredients[index].calories = (ingredient.calories  / 100 * weight).toInt();
    widget.ingredients[index].carbohydrates = (ingredient.carbohydrates  / 100 * weight).toInt();
    widget.ingredients[index].fats = (ingredient.fats  / 100 * weight).toInt();
    widget.ingredients[index].proteins = (ingredient.proteins  / 100 * weight).toInt();
    widget.ingredients[index].name = ingredient.name;
    widget.ingredients[index].weight = weight;
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealsBlocBloc(),
      child: BlocBuilder<MealsBlocBloc, MealsBlocState>(
        builder: (context, state) {
          if(state is MealAcceptState){
            changeIngredient(state.index, state.ingredient, state.weight);
          }
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.colorForFloating,
              onPressed: () {
                widget.ingredients.add(IngredientUserEntity(
                    calories: 0,
                    name: '',
                    proteins: 0,
                    carbohydrates: 0,
                    fats: 0,
                    urlPicture: '',
                    weight: 100));
                setState(() {
                  print(widget.ingredients);
                });
                
              },
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: BlocBuilder<MealsBlocBloc, MealsBlocState>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration:
                      const BoxDecoration(gradient: AppColors.gradientApp),
                  child: ListView.builder(
                    itemCount: widget.ingredients.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        name: widget.ingredients[index].name == ''
                            ? ''
                            : widget.ingredients[index].name,
                        weight: widget.ingredients[index].weight,
                        index: index,
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}



// DropdownButton(
//                 borderRadius: BorderRadius.circular(40),
//                 value: dropDownValue,
//                 style: const TextStyle(
//                     color: Colors.black, fontFamily: "Hanken", fontSize: 15),
//                 hint: const Text(
//                   'Chose the product',
//                   style: TextStyle(
//                       fontFamily: "Hanken", fontSize: 15, color: Colors.black),
//                 ),
//                 items: state.listIngredients 
//                     .map((value) => DropdownMenuItem(
//                           value: value.name,
//                           child: Text(value.name),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     dropDownValue = value;
//                   });
//                 },
//               ),



// ElevatedButton(
//                   style: const ButtonStyle(
//                     backgroundColor: MaterialStatePropertyAll<Color?>(
//                         AppColors.colorForMealWidgets),
//                   ),
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           backgroundColor: Colors.white,
//                           shape: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(40)),
//                           title: const Text('Enter the weight',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontFamily: "Hanken",
//                                   fontSize: 22)),
//                           content: TextField(
//                             cursorColor: AppColors.blackAppColor,
//                             decoration: const InputDecoration(
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(40))),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(40)),
//                                     borderSide: BorderSide(width: 3))),
//                             controller: weightController,
//                             obscureText: false,
//                           ),
//                           actions: [
//                             TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: const Text('Cancel',
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontFamily: "Hanken",
//                                         fontSize: 15))),
//                             TextButton(
//                                 onPressed: () {
//                                   //context.select((MealsBlocBloc bloc)=>bloc.add(MealWeightPost(name: dropDownValue!, weight: widget.weight)) );
                                  
                                 
                                  
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.all(6),
//                                   child: const Text(
//                                     'Accept',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontFamily: "Hanken",
//                                         fontSize: 15),
//                                   ),
//                                   decoration: BoxDecoration(
//                                       color: AppColors.firstForGradient,
//                                       borderRadius: BorderRadius.circular(20)),
//                                 )),
//                           ],
//                         );
//                       },
//                     );
                    
//                   },
                  
//                     Text(
//                         widget.weight.toString(),
//                         style: const TextStyle(
//                           fontFamily: "Hanken",
//                           fontSize: 15,
//                           color: Colors.white
//                         ),
//                       );
//                    )