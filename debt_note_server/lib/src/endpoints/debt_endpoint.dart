import 'package:debt_note_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DebtEndpoint extends Endpoint {
  Future<List<Debt>> get(Session session) async {
    return await Debt.find(session);
  }

  Future<void> create(Session session, Debt row) async {
    return await Debt.insert(session, row);
  }

  Future<bool> update(Session session, Debt row) async {
    final req = await Debt.update(session, row);
    print('update $req');
    return req;
  }

  Future<int> delete(Session session, int debtId) async {
    final req = await Debt.delete(
      session,
      where: (row) => row.id.equals(debtId),
    );
    print('delete $req');
    return req;
  }
}
