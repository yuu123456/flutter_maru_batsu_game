import 'package:flutter/material.dart';
import 'package:flutter_maru_batsu_game/models/match_history.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../views/menu_drawer.dart';

class MatchHistoryView extends ConsumerWidget {
  const MatchHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('対戦履歴'),
      ),
      drawer: const MenuDrawer(),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: MatchHistoryTable(),
      ),
    );
  }
}

class MatchHistoryTable extends StatelessWidget {
  const MatchHistoryTable({super.key});

  static const dataColumns = ['回数', '先手', '後手', '勝者'];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MatchHistory>>(
      // featureにセットしたメソッドの戻り値がsnapshot.dataに格納される
      future: MatchHistory.getMatchHistorys(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('データなし');
        } else {
          return SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: [
                for (final dataColumn in dataColumns)
                  DataColumn(
                    label: Expanded(
                      flex: 1,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          dataColumn,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
              ],
              rows: snapshot.data!.map(
                (history) {
                  var dataCells = [
                    history.playCount,
                    history.playerXName,
                    history.playerOName,
                    history.isPlaying == 1
                        ? '中断'
                        : (history.isDraw == 1
                            ? '引き分け'
                            : (history.isPlayerXWin == 1
                                ? history.playerXName
                                : history.playerOName)),
                  ];

                  return DataRow(
                    cells: [
                      for (final dataCell in dataCells)
                        DataCell(
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              '$dataCell',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ).toList(),
            ),
          );
        }
      },
    );
  }
}
