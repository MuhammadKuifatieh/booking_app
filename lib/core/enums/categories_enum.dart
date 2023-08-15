enum CategoriesEnum { hotel, restaurant, clinic, carOffice }

extension CategoriesExtension on CategoriesEnum {
  int get status => switch (this) {
        CategoriesEnum.restaurant => 1,
        CategoriesEnum.hotel => 2,
        CategoriesEnum.clinic => 3,
        CategoriesEnum.carOffice => 4,
      };

  String get name => switch (this) {
        CategoriesEnum.restaurant => "Restaurant",
        CategoriesEnum.hotel => "Hotel",
        CategoriesEnum.clinic => "Clinic",
        CategoriesEnum.carOffice => "Car Offer",
      };
}
