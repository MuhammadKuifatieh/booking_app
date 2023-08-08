import '../../flutter_neumorphic/flutter_neumorphic.dart';

class MainLoadingWidget extends StatelessWidget {
  const MainLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
