import 'package:debt_note_client/debt_note_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(MaterialApp(
    title: 'Aplikasi Catatan Hutang Piutang',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Debt> debtData = [];
  bool isLoading = false;

  void getDebtData() async {
    setState(() => isLoading = !isLoading);
    final req = await client.debt.get();
    debtData = req;
    setState(() => isLoading = !isLoading);
  }

  @override
  void initState() {
    super.initState();
    getDebtData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aplikasi Catatan Hutang Piutang')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: debtData.length,
        separatorBuilder: (ctx, i) => const SizedBox(height: 6),
        itemBuilder: (ctx, i) {
          final debt = debtData[i];
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pemberi Hutang : ${debt.creditorName}'),
                Text('Pengutang : ${debt.debtorName}'),
                Text('Nominal Hutang : ${debt.debtNominal}'),
              ],
            ),
            subtitle: Text(
                'Jatuh Tempo : ${DateFormat('dd/MM/yyyy').format(debt.debtDueDate.toLocal())}'),
            trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await client.debt.delete(debt.id!);
                  getDebtData();
                }),
            onTap: () async {
              final route = MaterialPageRoute(
                  builder: (_) => DebtFormPage(debt: debt));
              await Navigator.push(context, route);
              getDebtData();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final route = MaterialPageRoute(builder: (_) => const DebtFormPage());
          await Navigator.push(context, route);
          getDebtData();
        },
      ),
    );
  }
}

class DebtFormPage extends StatefulWidget {
  final Debt? debt;

  const DebtFormPage({super.key, this.debt});

  @override
  State<DebtFormPage> createState() => _DebtFormPageState();
}

class _DebtFormPageState extends State<DebtFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _dateFormat = DateFormat('dd/MM/yyyy');

  //nama pemberi hutang
  String? creditorName;

  //nama yang berhutang
  String? debtorName;
  double? debtNominal;
  DateTime? debtDueDate;

  @override
  void initState() {
    super.initState();
    if (widget.debt != null) {
      creditorName = widget.debt!.creditorName;
      debtorName = widget.debt!.debtorName;
      debtNominal = widget.debt!.debtNominal;
      debtDueDate = widget.debt!.debtDueDate.toLocal();
    }
  }

  Future<void> _selectDueDate(BuildContext context) async {
    final initialDate = debtDueDate ?? DateTime.now();
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (selectedDate != null) {
      setState(() {
        debtDueDate = selectedDate;
      });
    }
  }

  String? _validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter the $fieldName';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.debt != null ? 'Edit Debt' : 'Add Debt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: creditorName,
                decoration: const InputDecoration(
                  labelText: 'Pemberi Hutang',
                ),
                validator: (value) => _validateField(value, 'pemberi hutang'),
                onSaved: (value) {
                  creditorName = value;
                },
              ),
              TextFormField(
                initialValue: debtorName,
                decoration: const InputDecoration(
                  labelText: 'Nama Pengutang',
                ),
                validator: (value) => _validateField(value, 'nama pengutang'),
                onSaved: (value) {
                  debtorName = value;
                },
              ),
              TextFormField(
                initialValue: debtNominal != null ? debtNominal.toString() : '',
                decoration: const InputDecoration(
                  labelText: 'Nominal Hutang',
                ),
                keyboardType: TextInputType.number,
                validator: (value) => _validateField(value, 'nominal hutang'),
                onSaved: (value) {
                  debtNominal = double.tryParse(value!);
                },
              ),
              GestureDetector(
                onTap: () {
                  _selectDueDate(context);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Jatuh Tempo Hutang',
                    ),
                    validator: (value) =>
                        _validateField(value, 'jatuh tempo hutang'),
                    onSaved: (value) {
                      // Parse the date from the input value
                      print('value $value');
                      debtDueDate = _dateFormat.parse(value!);
                    },
                    controller: TextEditingController(
                      text: debtDueDate != null
                          ? _dateFormat.format(debtDueDate!)
                          : '',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    final debt = Debt(
                        id: widget.debt?.id,
                        creditorName: creditorName!,
                        debtorName: debtorName!,
                        debtNominal: debtNominal!,
                        debtDueDate: debtDueDate!);

                    print(debt.toJson());

                    if (widget.debt == null) {
                      await client.debt.create(debt);
                    } else {
                      await client.debt.update(debt);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.debt == null ? 'Tambah' : 'Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
