import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_fit/config/router/router.gr.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_entity.dart';
import 'package:keep_fit/features/diary/domain/entities/ingredient_user_entity.dart';
import 'package:keep_fit/features/diary/presentation/bloc/bloc/meal_bloc/meals_bloc_bloc.dart';
import 'package:keep_fit/features/diary/presentation/widgets/product_widget.dart';
import 'package:keep_fit/themes/colors.dart';

@RoutePage()
class ProductPageWidget extends StatefulWidget {
  ProductPageWidget({super.key, required this.ingredients, required this.valueBloc});
  List<IngredientUserEntity> ingredients;
  final MealsBlocBloc valueBloc;
  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  void changeIngredient(int index, IngredientEntity ingredient, int weight) {
    widget.ingredients[index].calories =
        (ingredient.calories / 100 * weight).toInt();
    widget.ingredients[index].carbohydrates =
        (ingredient.carbohydrates / 100 * weight).toInt();
    widget.ingredients[index].fats = (ingredient.fats / 100 * weight).toInt();
    widget.ingredients[index].proteins =
        (ingredient.proteins / 100 * weight).toInt();
    widget.ingredients[index].name = ingredient.name;
    widget.ingredients[index].weight = weight;
    print(widget.ingredients);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.valueBloc,
      child: BlocBuilder<MealsBlocBloc, MealsBlocState>(
        builder: (context, state) {
          if (state is MealAcceptState) {
            changeIngredient(state.index, state.ingredient, state.weight);
          }
          return PopScope(
            onPopInvoked: (didPop) {
              print(didPop);
              widget.valueBloc
                  .add(MealTransferDataEvent(ingredients: widget.ingredients));
            },
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    AutoRouter.of(context).navigate(DiaryRoute());
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 35,
                  ),
                  splashRadius: null,
                ),
                iconTheme: const IconThemeData(color: Colors.white),
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColors.secondForGradient,
                      AppColors.firstForGradient,
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  ),
                ),
              ),
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

                  setState(() {});
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
            ),
          );
        },
      ),
    );
  }
}
