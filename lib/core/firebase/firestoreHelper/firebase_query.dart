import 'package:roomly/core/firebase/firestoreHelper/firebase_query_operator.dart';

class FirebaseQuery {
  final List<FirebaseQueryFilter> filters;
  final List<FirebaseQueryOrder> orderBy;
  final int? limit;

  const FirebaseQuery({
    this.filters = const [],
    this.orderBy = const [],
    this.limit,
  });
}

class FirebaseQueryFilter {
  final String field;
  final FirebaseQueryOperator operator;
  final Object? value;

  const FirebaseQueryFilter({
    required this.field,
    required this.operator,
    required this.value,
  });
}

class FirebaseQueryOrder {
  final String field;
  final bool descending;

  const FirebaseQueryOrder({
    required this.field,
    this.descending = false,
  });
}
