import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../clinic/presentation/pages/clinic_screen.dart';
import '../../../hotel/presentation/pages/hotel_screen.dart';
import '../../../resturant/presentation/pages/resturant_screen.dart';
import '../../../trip/presentation/pages/trip_screen.dart';
import '../widgets/category_card.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = "category_screen";
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Size size;

  List<CategoryClass> categories = [
    CategoryClass(
      image:
          "https://cdn.britannica.com/96/115096-050-5AFDAF5D/Bellagio-Hotel-Casino-Las-Vegas.jpg",
      name: "Hotel",
    ),
    CategoryClass(
      image:
          "https://media.istockphoto.com/id/954802966/photo/healthcare-photos.jpg?s=612x612&w=0&k=20&c=DlouWo1_kZGmDwylkTElgkQUMWhFAy62D8BoyGiZX_0=",
      name: "Clinic ",
    ),
    CategoryClass(
      image:
          "https://assets.gqindia.com/photos/62a9d4653e8cdc9b632eb2ad/16:9/pass/10%20restaurants%20in%20Mumbai%20that%20offer%20the%20best%20sunset%20views.jpg",
      name: "Restaurant",
    ),
    CategoryClass(
      image:
          "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cm9hZCUyMHRyaXB8ZW58MHx8MHx8&w=1000&q=80",
      name: "Road Trips",
    )
  ];
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        size: size,
        hasPop: false,
        title: "Category",
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            size: size,
            category: categories[index],
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.of(context).pushNamed(HotelScreen.routeName);
                  return;
                case 1:
                  Navigator.of(context).pushNamed(ClinicScreen.routeName);
                  return;
                case 2:
                  Navigator.of(context).pushNamed(ResturantScreen.routeName);
                  return;
                case 3:
                  Navigator.of(context).pushNamed(TripScreen.routeName);
                  return;
              }
            },
          );
        },
      ),
    );
  }
}

class CategoryClass {
  final String image;
  final String name;

  CategoryClass({
    required this.image,
    required this.name,
  });
}
