import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Nenhuma Transação Cadastrada!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20), // espaçamento entre componentes
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit
                      .cover, // vai saber onde está, de acordo com uma propriedade definida, ou seja, o container
                ),
              ),
            ])
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(child: Text('R\$${tr.value}')),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
//O componente SingleChildScrollView só funciona com tamanho pai definido

/*ListView funciona também como componente mais especifico para o scroll: rolagem,
 a vantagem do ListView é a economia de memória que ele proporciona,
  ja que apenas mostra elementos na lista se der scroll
*/
