import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';
import 'package:keep_fit/features/diary/presentation/bloc/bloc/ingredient_bloc/ingredient_bloc.dart';
import 'package:keep_fit/features/diary/presentation/bloc/bloc/meal_bloc/meals_bloc_bloc.dart';
import 'package:keep_fit/themes/colors.dart';

class ProductWidget extends StatefulWidget {
  ProductWidget(
      {super.key,
      required this.name,
      required this.weight,
      required this.index});
  String name;
  int weight;
  int index;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  String? dropDownValue;
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IngredientBloc()..add(IngredientGetEvent()),
      child: BlocBuilder<IngredientBloc, IngredientState>(
        builder: (context, state) {
          // context.watch<MealsBlocBloc>();
          if (state is IngerdientLoaded) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: DropdownButton(
                      iconEnabledColor: Colors.black,
                      underline: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(40),
                      value: widget.name == '' ? dropDownValue : widget.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Hanken",
                          fontSize: 15),
                      hint: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Chose the product',
                          style: TextStyle(
                              fontFamily: "Hanken",
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ),
                      items: state.listIngredients
                          .map((value) => DropdownMenuItem(
                                value: value.name,
                                child: Text(
                                  value.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Hanken",
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          dropDownValue = value;
                          context.read<MealsBlocBloc>().add(MealLoading());
                          context.read<MealsBlocBloc>().add(MealWeightPost(
                              index: widget.index,
                              name: value!,
                              weight: widget.weight));
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<MealsBlocBloc>()
                          .add(MealDeleteProductEvent(index: widget.index));
                    },
                    icon: const Icon(Icons.cancel),
                    color: AppColors.lunchIconColor,
                    iconSize: 45,
                    splashColor: AppColors.blackAppColor,
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
                                autofocus: true,
                                cursorColor: AppColors.blackAppColor,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40)),
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
                                      widget.weight =
                                          int.parse(weightController.text);
                                      setState(() {});
                                      Navigator.of(context).pop();
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
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    )),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        widget.weight.toString(),
                        style: const TextStyle(
                            fontFamily: "Hanken",
                            fontSize: 15,
                            color: Colors.white),
                      ))
                ],
              ),
            );
          }
          if (state is IngredientLoading) {
            return const CircularProgressIndicator(
              color: Colors.black,
            );
          }
          if (state is IngredientLoadFailure) {
            return const Text('Error');
          }
          return Container();
        },
      ),
    );
  }
}
