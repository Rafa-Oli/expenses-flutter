import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final void Function(String) onRemove;
  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Nenhuma Transação Cadastrada!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20), // espaçamento entre componentes
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit
                        .cover, // vai saber onde está, de acordo com uma propriedade definida, ou seja, o container
                  ),
                ),
              ]);
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                tr: tr,
                onRemove: onRemove,
              );
            },
          );
  }
}

//O componente SingleChildScrollView só funciona com tamanho pai definido

/*ListView funciona também como componente mais especifico para o scroll: rolagem,
 a vantagem do ListView é a economia de memória que ele proporciona,
  ja que apenas mostra elementos na lista se der scroll
*/
