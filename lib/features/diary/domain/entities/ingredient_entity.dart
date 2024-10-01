
import 'package:equatable/equatable.dart';

class IngredientEntity extends Equatable{
  final int id;
  final int calories;
  final String name;
  final int weight;
  final double proteins;
  final double carbohydrates;
  final double fats;
  final String urlPicture;
  IngredientEntity({required this.id, required this.calories, required this.name, required this.weight, required this.proteins, required this.carbohydrates, required this.fats, required this.urlPicture});
  
  @override
  // TODO: implement props
  List<Object?> get props => [calories, name, weight, proteins, carbohydrates, fats, id, urlPicture];
}
