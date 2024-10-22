import 'package:equatable/equatable.dart';
import 'package:keep_fit/features/diary/data/models/ingerdient_user_model.dart';

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

extension IngredientUserEntityEx on IngredientUserEntity{
  IngredientUserModel toModel(){
    return IngredientUserModel(calories: calories, name: name, proteins: proteins, carbohydrates: carbohydrates, fats: fats, urlPicture: urlPicture, weight: weight);
  }
  
}