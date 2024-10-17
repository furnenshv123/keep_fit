import 'package:equatable/equatable.dart';

class IngredientUserEntity extends Equatable {
  int calories;
  String name;
  int proteins;
  int carbohydrates;
  int fats;
  String urlPicture;
  int weight;

  IngredientUserEntity(
      {required this.calories,
      required this.name,
      required this.proteins,
      required this.carbohydrates,
      required this.fats,
      required this.urlPicture,
      required this.weight});
  @override
  List<Object?> get props => [
        calories,
        name,
        proteins,
        carbohydrates,
        fats,
        urlPicture,
        weight,
      ];
}
