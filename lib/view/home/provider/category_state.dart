import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/manager/dio_error.dart';
import '../../../view/home/categpry_item.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  factory CategoryState.noError() = _$NoError;
  factory CategoryState.error(ErrorResponse er) = _$Error;
  factory CategoryState.fetching() = _$Fetching;
  factory CategoryState.categories(List<CategoryItem> categories) =
      _$Categories;
}

// @freezed
// class Person with _$Person {
//   const factory Person({
//     required String firstName,
//     required String lastName,
//     required int age,
//   }) = _Person;

//   factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
// }

// @freezed
// class Person with _$Person {
//   factory Person(String name, int? age) = _Person;
// }
