import 'package:hive/hive.dart';

part 'source.g.dart';

@HiveType(typeId: 1)
class Source {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;

  Source(
    this.id,
    this.name,
  );
}
