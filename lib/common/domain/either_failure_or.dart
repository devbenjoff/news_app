import 'package:dartz/dartz.dart';
import 'package:news_app/common/domain/entities/failure.dart';

typedef EitherFailureOr<T> = Future<Either<Failure, T>>;
