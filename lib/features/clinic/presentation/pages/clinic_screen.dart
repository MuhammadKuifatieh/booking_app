import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/models/clinic_specialization_response.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../../core/presentation/widgets/main_error_widget.dart';
import '../../../../core/presentation/widgets/main_loading_widget.dart';
import '../bloc/clinics/clinics_bloc.dart';
import '../widgets/clinic_card.dart';

class ClinicScreen extends StatefulWidget {
  static const routeName = "clinic_screen";
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  late Size size;
  late final ClinicsBloc clinicsBloc;
  @override
  void initState() {
    clinicsBloc = ClinicsBloc()..add(GetClinicSpecializationEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  late final ValueNotifier<ClinicSpecializationModel> selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => clinicsBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          title: "Clinics",
        ),
        body: BlocConsumer<ClinicsBloc, ClinicsState>(
          listener: (context, state) {
            if (state.getClinicSpecializationStatus ==
                GetClinicSpecializationStatus.succ) {
              selectedIndex = ValueNotifier(state.clinicSpecializations.first);
            }
          },
          builder: (context, state) {
            if (state.getClinicSpecializationStatus ==
                    GetClinicSpecializationStatus.loading ||
                state.getClinicSpecializationStatus ==
                    GetClinicSpecializationStatus.init) {
              return const MainLoadingWidget();
            } else if (state.getClinicSpecializationStatus ==
                GetClinicSpecializationStatus.failed) {
              return MainErrorWidget(
                size: size,
                onTap: () {
                  clinicsBloc.add(GetClinicSpecializationEvent());
                },
              );
            }
            return Column(
              children: [
                ValueListenableBuilder<ClinicSpecializationModel>(
                    valueListenable: selectedIndex,
                    builder: (context, value, _) {
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 25),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.clinicSpecializations.length,
                          itemBuilder: (context, index) {
                            return NeumorphicButton(
                              onPressed: () {
                                selectedIndex.value =
                                    state.clinicSpecializations[index];
                                clinicsBloc.add(
                                  GetClinicsEvent(
                                    isReload: true,
                                    clinicSpecializationId:
                                        state.clinicSpecializations[index].id,
                                  ),
                                );
                              },
                              style: NeumorphicStyle(
                                depth:
                                    value == state.clinicSpecializations[index]
                                        ? -10
                                        : 4,
                                shape: NeumorphicShape.flat,
                                lightSource: LightSource.topRight,
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(25),
                                ),
                                color: Colors.transparent,
                              ),
                              margin: const EdgeInsets.all(10),
                              child: SizedBox(
                                width: 100,
                                height: 15,
                                child: Center(
                                  child: Text(
                                    state.clinicSpecializations[index].name!,
                                    style: AppTextStyles.styleWeight500(
                                      fontSize: size.width * .04,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                  child: (state.getClinicsStatus == GetClinicsStatus.loading ||
                              state.getClinicsStatus ==
                                  GetClinicsStatus.init) &&
                          state.clinics.isEmpty
                      ? const MainLoadingWidget()
                      : state.getClinicsStatus == GetClinicsStatus.failed &&
                              state.clinics.isEmpty
                          ? MainErrorWidget(
                              size: size,
                              onTap: () {
                                clinicsBloc.add(GetClinicsEvent(
                                  isReload: true,
                                  clinicSpecializationId:
                                      selectedIndex.value.id,
                                ));
                              },
                            )
                          : RefreshIndicator(
                              onRefresh: () async {
                                await Future.delayed(const Duration(seconds: 1))
                                    .then((value) =>
                                        clinicsBloc.add(GetClinicsEvent(
                                          isReload: true,
                                          clinicSpecializationId:
                                              selectedIndex.value.id,
                                        )));
                              },
                              child: ListView.builder(
                                padding:
                                    EdgeInsets.only(top: size.width * .025),
                                itemCount: state.clinics.length +
                                    (state.isEndPage ? 0 : 1),
                                itemBuilder: (context, index) {
                                  if (state.clinics.length == index) {
                                    clinicsBloc.add(GetClinicsEvent(
                                      clinicSpecializationId:
                                          selectedIndex.value.id,
                                    ));
                                    return const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: MainLoadingWidget(),
                                    );
                                  }
                                  return ClinicCard(
                                    size: size,
                                    clinic: state.clinics[index],
                                  );
                                },
                              ),
                            ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
