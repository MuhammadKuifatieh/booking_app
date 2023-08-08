enum CategoriesEnum { hotel, restaurant, clinic, carOffice }

extension CategoriesExtension on CategoriesEnum {
  int get status => switch (this) {
        CategoriesEnum.restaurant => 1,
        CategoriesEnum.hotel => 2,
        CategoriesEnum.clinic => 3,
        CategoriesEnum.carOffice => 2,
      };
}
