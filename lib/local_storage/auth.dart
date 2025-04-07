import 'package:drift/drift.dart';



class Auth extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  BoolColumn get isAuth => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};

   @override
  List<String> get customConstraints => [
    'CHECK (id = 1)'
  ];
}
