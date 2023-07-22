import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../../../../core/presentation/widgets/ratting_card.dart';
import '../../../hotel/presentation/widgets/hotel_card.dart';
import 'clicnic_detailes_screen.dart';

class ClinicScreen extends StatefulWidget {
  static const routeName = "clinic_screen";
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  List<String> types = [
    "All",
    "test1",
    "test2",
    "test3",
  ];
  ValueNotifier<int> selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        size: size,
        title: "Clinics",
      ),
      body: Column(
        children: [
          ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (context, value, _) {
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 25),
                    scrollDirection: Axis.horizontal,
                    itemCount: types.length,
                    itemBuilder: (context, index) {
                      return NeumorphicButton(
                        onPressed: () {
                          selectedIndex.value = index;
                        },
                        style: NeumorphicStyle(
                          depth: value == index ? -10 : 4,
                          shape: NeumorphicShape.flat,
                          lightSource: LightSource.topRight,
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(25),
                          ),
                          color: Colors.transparent,
                        ),
                        padding: EdgeInsets.zero,
                        margin: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: 100,
                          height: 15,
                          child: Center(
                            child: Text(
                              types[index],
                              style: AppTextStyles.styleWeight500(
                                fontSize: size.width * .04,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemCount: 15,
              padding: EdgeInsets.only(top: size.width * .025),
              itemBuilder: (context, index) {
                return ClinicCard(
                  size: size,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ClinicDetailsScreen.routeName,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ClinicCard extends StatelessWidget {
  const ClinicCard({
    super.key,
    required this.size,
    required this.onTap,
  });

  final Size size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: size.width * .05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CacheImage(
                  width: size.width * .45,
                  height: size.width * .45,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(25),
                  ),
                  imageUrl:
                      "https://cdn.sanity.io/images/0vv8moc6/diag_imaging/299673abf1f3d5e6c1e45cf05eff17274c935008-940x788.png?fit=crop&auto=format",
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FavoriteButton(
                    onTap: () {},
                    isFavorite: true,
                  ),
                ),
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: RattingCard(
                    rate: 4.8,
                    size: size,
                  ),
                )
              ],
            ),
            Container(
              width: size.width * .45,
              height: size.width * .45,
              padding: EdgeInsets.only(
                left: size.width * .025,
                right: size.width * .025,
                top: size.width * .05,
                bottom: size.width * .05,
              ),
              decoration: const BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dr. Muhammad",
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .04,
                    ),
                  ),
                  Text(
                    "test1",
                    style: AppTextStyles.styleWeight500(
                      fontSize: size.width * .04,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "data data data data" * 5,
                      style: AppTextStyles.styleWeight500(
                        fontSize: size.width * .04,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
