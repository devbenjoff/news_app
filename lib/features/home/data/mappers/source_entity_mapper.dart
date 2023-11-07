import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/data/entity_mapper.dart';
import 'package:news_app/features/home/data/models/source_response.dart';
import 'package:news_app/features/home/domain/entities/source.dart';

final sourceEntityMapperProvider =
    Provider<EntityMapper<Source, SourceResponse>>(
  (ref) => (response) => Source(
        response.id,
        response.name,
      ),
);
