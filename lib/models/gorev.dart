import 'package:hive/hive.dart';
part 'gorev.g.dart';

@HiveType(typeId: 0)
class Gorev extends HiveObject {
  @HiveField(0)
  String aciklama;

  @HiveField(1)
  bool tamamlanma;

  Gorev({required this.aciklama, this.tamamlanma = false});
}
