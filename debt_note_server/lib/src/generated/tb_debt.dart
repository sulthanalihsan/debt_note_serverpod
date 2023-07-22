/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Debt extends _i1.TableRow {
  Debt({
    int? id,
    required this.creditorName,
    required this.debtorName,
    required this.debtNominal,
    required this.debtDueDate,
  }) : super(id);

  factory Debt.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Debt(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      creditorName: serializationManager
          .deserialize<String>(jsonSerialization['creditorName']),
      debtorName: serializationManager
          .deserialize<String>(jsonSerialization['debtorName']),
      debtNominal: serializationManager
          .deserialize<double>(jsonSerialization['debtNominal']),
      debtDueDate: serializationManager
          .deserialize<DateTime>(jsonSerialization['debtDueDate']),
    );
  }

  static final t = DebtTable();

  String creditorName;

  String debtorName;

  double debtNominal;

  DateTime debtDueDate;

  @override
  String get tableName => 'debt_tb';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creditorName': creditorName,
      'debtorName': debtorName,
      'debtNominal': debtNominal,
      'debtDueDate': debtDueDate,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'creditorName': creditorName,
      'debtorName': debtorName,
      'debtNominal': debtNominal,
      'debtDueDate': debtDueDate,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'creditorName': creditorName,
      'debtorName': debtorName,
      'debtNominal': debtNominal,
      'debtDueDate': debtDueDate,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'creditorName':
        creditorName = value;
        return;
      case 'debtorName':
        debtorName = value;
        return;
      case 'debtNominal':
        debtNominal = value;
        return;
      case 'debtDueDate':
        debtDueDate = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Debt>> find(
    _i1.Session session, {
    DebtExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Debt>(
      where: where != null ? where(Debt.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Debt?> findSingleRow(
    _i1.Session session, {
    DebtExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Debt>(
      where: where != null ? where(Debt.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Debt?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Debt>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required DebtExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Debt>(
      where: where(Debt.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Debt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Debt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Debt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    DebtExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Debt>(
      where: where != null ? where(Debt.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef DebtExpressionBuilder = _i1.Expression Function(DebtTable);

class DebtTable extends _i1.Table {
  DebtTable() : super(tableName: 'debt_tb');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final creditorName = _i1.ColumnString('creditorName');

  final debtorName = _i1.ColumnString('debtorName');

  final debtNominal = _i1.ColumnDouble('debtNominal');

  final debtDueDate = _i1.ColumnDateTime('debtDueDate');

  @override
  List<_i1.Column> get columns => [
        id,
        creditorName,
        debtorName,
        debtNominal,
        debtDueDate,
      ];
}

@Deprecated('Use DebtTable.t instead.')
DebtTable tDebt = DebtTable();
