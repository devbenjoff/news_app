import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/domain/entities/failure.dart';

final globalFailureProvider = StateProvider<Failure?>((_) => null);
