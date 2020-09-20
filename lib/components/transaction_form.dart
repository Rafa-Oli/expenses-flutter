import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      // verificandos e dados são válidos
      return;
    }

    widget.onSubmit(title,
        value); //passando essas informações para voltar para o componente pai User
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            TextField(
                controller: titleController,
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(labelText: 'Título')),
            TextField(
                controller: valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(labelText: 'Valor (R\$)')),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Nova Transação'),
                  textColor: Colors.red,
                  onPressed: _submitForm,
                ),
              ],
            )
          ]),
        ));
  }
}
