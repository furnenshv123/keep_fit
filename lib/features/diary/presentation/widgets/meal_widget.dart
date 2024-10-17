import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_fit/config/router/router.gr.dart';
import 'package:keep_fit/features/diary/data/models/meal_model.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';
import 'package:keep_fit/features/diary/presentation/bloc/bloc/ingredient_bloc/ingredient_bloc.dart';
import 'package:keep_fit/features/diary/presentation/bloc/bloc/meal_bloc/meals_bloc_bloc.dart';

import 'package:keep_fit/themes/colors.dart';

class MealWidget extends StatefulWidget {
  MealWidget({
    super.key,
    required this.name,
    required this.icon,
    required this.model,
    required this.color,
  });

  MealModel model;
  final String name;
  final IconData icon;
  final Color color;

  @override
  State<MealWidget> createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {
  List<IngredientEntity> ingredients = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MealsBlocBloc>(create: (context) => MealsBlocBloc()),
        BlocProvider<IngredientBloc>(create: (context) => IngredientBloc()),
      ],
      // child: BlocBuilder<MealsBlocBloc, MealsBlocState>(
      //   builder: (context, state) {
      //     if(state is MealAcceptState){
      //       ingredients.add(state.ingredient);
      //       widget.model.allCalories = 0;
      //       widget.model.allCarbohydrates = 0;
      //       widget.model.allFats = 0;
      //       widget.model.allProteins = 0;
      //       for(var element in ingredients){
      //         widget.model.allCalories += element.calories;
      //         widget.model.allCarbohydrates +=element.carbohydrates;
      //         widget.model.allFats += element.fats;
      //         widget.model.allProteins += element.proteins;
      //       }
      //     }
      //     return
      child: Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            color: AppColors.colorForMealWidgets),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        widget.icon,
                        color: widget.color,
                      ),
                      Text(
                        widget.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Hanken",
                            fontSize: 22),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<MealsBlocBloc, MealsBlocState>(
                        builder: (context, state) {
                      if (state is MealAcceptState) {
                        ingredients.add(state.ingredient);
                        widget.model.allCalories = 0;
                        widget.model.allCarbohydrates = 0;
                        widget.model.allFats = 0;
                        widget.model.allProteins = 0;
                        for (var element in ingredients) {
                          widget.model.allCalories += element.calories;
                          widget.model.allCarbohydrates +=
                              element.carbohydrates;
                          widget.model.allFats += element.fats;
                          widget.model.allProteins += element.proteins;
                        }
                      }
                      return Container(
                        child: Column(
                          children: [
                            Text(
                              widget.model!.allCalories.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Hanken",
                                  fontSize: 22),
                            ),
                            const Text(
                              'calories',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Hanken",
                                  fontSize: 16),
                            )
                          ],
                        ),
                      );
                    }),
                    IconButton(
                        splashColor: Colors.black,
                        onPressed: () {
                          AutoRouter.of(context).push(ProductRouteWidget(ingredients: []));
                        },
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.colorForIconButtons,
                        )),
                  ],
                )
              ],
            ),
            const Divider(),
            BlocBuilder<MealsBlocBloc, MealsBlocState>(
                builder: (context, state) {
              if (state is MealAcceptState) {
                ingredients.add(state.ingredient);
                widget.model.allCalories = 0;
                widget.model.allCarbohydrates = 0;
                widget.model.allFats = 0;
                widget.model.allProteins = 0;
                for (var element in ingredients) {
                  widget.model.allCalories += element.calories;
                  widget.model.allCarbohydrates += element.carbohydrates;
                  widget.model.allFats += element.fats;
                  widget.model.allProteins += element.proteins;
                }
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.model!.allFats.toString(),
                    style: const TextStyle(
                        fontFamily: "Hanken",
                        fontSize: 22,
                        color: Colors.white),
                  ),
                  Text(
                    widget.model!.allProteins.toString(),
                    style: const TextStyle(
                        fontFamily: "Hanken",
                        fontSize: 22,
                        color: Colors.white),
                  ),
                  Text(
                    widget.model!.allCarbohydrates.toString(),
                    style: const TextStyle(
                        fontFamily: "Hanken",
                        fontSize: 22,
                        color: Colors.white),
                  ),
                  DropdownButton(
                    items: [DropdownMenuItem(child: Container())],
                    onChanged: (value) {},
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
