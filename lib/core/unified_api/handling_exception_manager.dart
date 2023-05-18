import 'dart:async';

import 'package:dartz/dartz.dart';

import '../error/failures.dart';

mixin HandlingExceptionManager {
  Future<Either<Failure, T>> wrapHandling<T>({
    required Future< T> Function() tryCall,
    Future<T?> Function()? tryCallLocal,
  }) async {
    try {
      final right = await tryCall();
      return Right(right);
    } catch (e) {
      return const Left(ServerFailure(".message"));
    }
  }
}
