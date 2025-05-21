import 'package:dartz/dartz.dart';
import '../error/failure.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaginationParams extends Equatable {
  final int offset;
  final int limit;

  const PaginationParams({
    this.offset = 0,
    this.limit = 20,
  });

  @override
  List<Object?> get props => [offset, limit];
}

class UserPaginationParams extends Equatable {
  final int offset;
  final int limit;
  final String userId;

  const UserPaginationParams({
    this.offset = 0,
    this.limit = 20,
    required this.userId,
  });

  @override
  List<Object?> get props => [offset, limit, userId];
}
