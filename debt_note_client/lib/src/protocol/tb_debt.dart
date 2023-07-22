/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Debt extends _i1.SerializableEntity {
  Debt({
    this.id,
    required this.creditorName,
    required this.debtorName,
    required this.debtNominal,
    required this.debtDueDate,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String creditorName;

  String debtorName;

  double debtNominal;

  DateTime debtDueDate;

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
}
