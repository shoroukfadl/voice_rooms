import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_query.dart';
import 'firebase_query_operator.dart';

sealed class FirebaseFirestoreHelper {
  FirebaseFirestoreHelper._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ---------------------------------------------------------------------------
  // References
  // ---------------------------------------------------------------------------

  static DocumentReference<Map<String, dynamic>> _document(
    String path,
  ) {
    return _firestore.doc(path);
  }

  static CollectionReference<Map<String, dynamic>> _collection(
    String path,
  ) {
    return _firestore.collection(path);
  }

  // ---------------------------------------------------------------------------
  // GET DOCUMENT
  // ---------------------------------------------------------------------------

  static Future<T?> get<T>({
    required String path,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    final snapshot = await _document(path).get();

    if (!snapshot.exists || snapshot.data() == null) {
      return null;
    }

    return fromJson(snapshot.data()!);
  }

  // ---------------------------------------------------------------------------
  // GET COLLECTION
  // ---------------------------------------------------------------------------

  static Future<List<T>> getCollection<T>({
    required String path,
    required T Function(Map<String, dynamic> json) fromJson,
    FirebaseQuery? query,
  }) async {
    Query<Map<String, dynamic>> firebaseQuery = _collection(path);

    if (query != null) {
      firebaseQuery = _applyQuery(
        query: firebaseQuery,
        firebaseQuery: query,
      );
    }

    final snapshot = await firebaseQuery.get();

    return snapshot.docs
        .map(
          (document) => fromJson(document.data()),
        )
        .toList();
  }

  // ---------------------------------------------------------------------------
  // SET DOCUMENT
  // ---------------------------------------------------------------------------

  static Future<void> set({
    required String path,
    required Map<String, dynamic> data,
    SetOptions? options,
  }) {
    return _document(path).set(
      data,
      options,
    );
  }

  // ---------------------------------------------------------------------------
  // UPDATE DOCUMENT
  // ---------------------------------------------------------------------------

  static Future<void> update({
    required String path,
    required Map<String, dynamic> data,
  }) {
    return _document(path).update(data);
  }

  // ---------------------------------------------------------------------------
  // DELETE DOCUMENT
  // ---------------------------------------------------------------------------

  static Future<void> delete({
    required String path,
  }) {
    return _document(path).delete();
  }

  // ---------------------------------------------------------------------------
  // QUERY
  // ---------------------------------------------------------------------------

  static Query<Map<String, dynamic>> _applyQuery({
    required Query<Map<String, dynamic>> query,
    required FirebaseQuery firebaseQuery,
  }) {
    var result = query;

    // Filters
    for (final filter in firebaseQuery.filters) {
      result = _applyFilter(
        query: result,
        filter: filter,
      );
    }

    // Order By
    for (final order in firebaseQuery.orderBy) {
      result = result.orderBy(
        order.field,
        descending: order.descending,
      );
    }

    // Limit
    if (firebaseQuery.limit != null) {
      result = result.limit(
        firebaseQuery.limit!,
      );
    }

    return result;
  }

  // ---------------------------------------------------------------------------
  // FILTER
  // ---------------------------------------------------------------------------

  static Query<Map<String, dynamic>> _applyFilter({
    required Query<Map<String, dynamic>> query,
    required FirebaseQueryFilter filter,
  }) {
    return switch (filter.operator) {
      FirebaseQueryOperator.isEqualTo => query.where(
          filter.field,
          isEqualTo: filter.value,
        ),
      FirebaseQueryOperator.isNotEqualTo => query.where(
          filter.field,
          isNotEqualTo: filter.value,
        ),
      FirebaseQueryOperator.isLessThan => query.where(
          filter.field,
          isLessThan: filter.value,
        ),
      FirebaseQueryOperator.isLessThanOrEqualTo => query.where(
          filter.field,
          isLessThanOrEqualTo: filter.value,
        ),
      FirebaseQueryOperator.isGreaterThan => query.where(
          filter.field,
          isGreaterThan: filter.value,
        ),
      FirebaseQueryOperator.isGreaterThanOrEqualTo => query.where(
          filter.field,
          isGreaterThanOrEqualTo: filter.value,
        ),
      FirebaseQueryOperator.arrayContains => query.where(
          filter.field,
          arrayContains: filter.value,
        ),
      FirebaseQueryOperator.arrayContainsAny => query.where(
          filter.field,
          arrayContainsAny: [filter.value],
        ),
      FirebaseQueryOperator.whereIn => query.where(
          filter.field,
          whereIn: [filter.value],
        ),
      FirebaseQueryOperator.whereNotIn => query.where(
          filter.field,
          whereNotIn: [filter.value],
        ),
    };
  }
}
