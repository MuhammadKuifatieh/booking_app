import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection.dart';
import '../../config/app_colors.dart';
import '../../data/models/favorite_object.dart';
import '../../enums/categories_enum.dart';
import '../../extensions/gradian.dart';
import '../blocs/bloc/favorite_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.modelId,
    required this.modelType,
  });
  final int modelId;
  final CategoriesEnum modelType;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<FavoriteBloc>(),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        bloc: serviceLocator<FavoriteBloc>(),
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              serviceLocator<FavoriteBloc>().add(ToggleFavoriteEvent(
                modelId: modelId,
                modelType: modelType.status,
              ));
            },
            child: CircleAvatar(
              radius: 17.5,
              backgroundColor: AppColors.grayLight,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => AppColors.mainGradent.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: state.favoriteList
                        .getObject(modelId, modelType.status)!
                        .isFavorite
                    ? const Icon(
                        Icons.favorite,
                      ).gradient()
                    : const Icon(
                        Icons.favorite_border,
                        color: AppColors.offWhite,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
