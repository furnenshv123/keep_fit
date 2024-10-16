
import 'package:equatable/equatable.dart';

class IngredientEntity extends Equatable{
  
  final int calories;
  final String name;
  final int proteins;
  final int carbohydrates;
  final int fats;
  final String urlPicture;
  IngredientEntity({ required this.calories, required this.name,  required this.proteins, required this.carbohydrates, required this.fats, required this.urlPicture});
  
  @override
  // TODO: implement props
  List<Object?> get props => [calories, name,  proteins, carbohydrates, fats,  urlPicture];
}
