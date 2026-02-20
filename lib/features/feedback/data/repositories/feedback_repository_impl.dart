import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/feedback/domain/entities/feedback_entities.dart';
import 'package:savvy_pos/features/feedback/domain/repositories/i_feedback_repository.dart';

import 'dart:convert';
import 'package:drift/drift.dart' as drift;

@LazySingleton(as: IFeedbackRepository)
class FeedbackRepositoryImpl implements IFeedbackRepository {
  final AppDatabase _db;

  FeedbackRepositoryImpl(this._db);

  @override
  Future<void> submitFeedback(CustomerFeedback feedback) async {
    await _db.into(_db.customerFeedbackTable).insert(
      CustomerFeedbackTableCompanion.insert(
        uuid: feedback.uuid,
        orderUuid: feedback.orderUuid,
        customerUuid: drift.Value(feedback.customerUuid),
        rating: feedback.rating,
        tags: drift.Value(jsonEncode(feedback.tags.map((e) => e.name).toList())),
        comment: drift.Value(feedback.comment),
        sentiment: drift.Value(feedback.sentiment.name),
        createdAt: feedback.createdAt,
        isActioned: drift.Value(feedback.isActioned),
      ),
    );
  }

  @override
  Future<CustomerFeedback?> getFeedbackByOrder(String orderUuid) async {
    final row = await (_db.select(_db.customerFeedbackTable)
      ..where((tbl) => tbl.orderUuid.equals(orderUuid)))
      .getSingleOrNull();
      
    if (row == null) return null;
    return _mapToEntity(row);
  }

  @override
  Stream<List<CustomerFeedback>> watchRecentFeedback({int limit = 20}) {
    return (_db.select(_db.customerFeedbackTable)
      ..orderBy([(t) => drift.OrderingTerm(expression: t.createdAt, mode: drift.OrderingMode.desc)])
      ..limit(limit))
      .watch()
      .map((rows) => rows.map((r) => _mapToEntity(r)).toList());
  }

  @override
  Future<double> getAverageRating({DateTime? from}) async {
    final query = _db.select(_db.customerFeedbackTable);
    if (from != null) {
      query.where((tbl) => tbl.createdAt.isBiggerOrEqualValue(from));
    }
    
    final rows = await query.get();
    if (rows.isEmpty) return 0.0;
    
    final total = rows.fold<int>(0, (sum, row) => sum + row.rating);
    return total / rows.length;
  }

  CustomerFeedback _mapToEntity(CustomerFeedbackTableData row) {
    List<FeedbackTag> tags = [];
    if (row.tags != null) {
      try {
        final List<dynamic> json = jsonDecode(row.tags!);
        tags = json.map((e) => FeedbackTag.values.firstWhere((t) => t.name == e, orElse: () => FeedbackTag.other)).toList();
      } catch (_) {}
    }

    return CustomerFeedback(
      uuid: row.uuid,
      orderUuid: row.orderUuid,
      customerUuid: row.customerUuid,
      rating: row.rating,
      tags: tags,
      comment: row.comment,
      createdAt: row.createdAt,
      sentiment: FeedbackSentiment.values.firstWhere((e) => e.name == row.sentiment, orElse: () => FeedbackSentiment.neutral),
      isActioned: row.isActioned,
    );
  }
}
