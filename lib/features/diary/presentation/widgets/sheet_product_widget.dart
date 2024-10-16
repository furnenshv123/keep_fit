import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keep_fit/features/diary/presentation/bloc/bloc/ingredient_bloc/ingredient_bloc.dart';
import 'package:keep_fit/features/diary/presentation/bloc/bloc/meal_bloc/meals_bloc_bloc.dart';

import 'package:keep_fit/themes/colors.dart';

class SheetProductWidget extends StatefulWidget {
  SheetProductWidget({super.key, this.weight = 100});
  int weight;

  @override
  State<SheetProductWidget> createState() => _SheetProductWidgetState();
}

class _SheetProductWidgetState extends State<SheetProductWidget> {
  final weightController = TextEditingController();
  String? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IngredientBloc()..add(IngredientGetEvent()),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<IngredientBloc, IngredientState>(
              builder: (context, state) {
                if (state is IngerdientLoaded) {
                  return DropdownButton(
                    borderRadius: BorderRadius.circular(40),
                    value: dropDownValue,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Hanken",
                        fontSize: 15),
                    hint: const Text(
                      'Chose the product',
                      style: TextStyle(
                          fontFamily: "Hanken",
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    items: state.listIngredients
                        .map((value) => DropdownMenuItem(
                              value: value.name,
                              child: Text(value.name),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        dropDownValue = value;
                      });
                    },
                  );
                }
                if (state is IngredientLoadFailure) {
                  return Container(
                    child: Text('Failure'),
                  );
                }
                return Container();
              },
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color?>(
                      AppColors.colorForMealWidgets),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                        title: const Text('Enter the weight',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Hanken",
                                fontSize: 22)),
                        content: TextField(
                          cursorColor: AppColors.blackAppColor,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide(width: 3))),
                          controller: weightController,
                          obscureText: false,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Hanken",
                                      fontSize: 15))),
                          TextButton(
                              onPressed: () {
                                context.select((MealsBlocBloc bloc) =>
                                    bloc.add(MealWeightPost(
                                        name: dropDownValue!,
                                        weight: int.parse(
                                            weightController.text))));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                child: const Text(
                                  'Accept',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Hanken",
                                      fontSize: 15),
                                ),
                                decoration: BoxDecoration(
                                    color: AppColors.firstForGradient,
                                    borderRadius: BorderRadius.circular(20)),
                              )),
                        ],
                      );
                    },
                  );
                },
                child: BlocBuilder<IngredientBloc, IngredientState>(
                  builder: (context, state) {
                    return Text(
                      widget.weight.toString(),
                      style: const TextStyle(
                        fontFamily: "Hanken",
                        fontSize: 15,
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
