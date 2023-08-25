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
        ));
  }
}

class MatchHistoryTable extends StatelessWidget {
  const MatchHistoryTable({super.key});

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
            return DataTable(
              columns: const [
                DataColumn(label: Expanded(child: Text('回数'))),
                DataColumn(label: Expanded(child: Text('先手'))),
                DataColumn(label: Expanded(child: Text('後手'))),
                DataColumn(label: Expanded(child: Text('勝者'))),
              ],
              rows: snapshot.data!.map((history) {
                return DataRow(cells: [
                  DataCell(FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('${history.playCount}'))),
                  DataCell(FittedBox(
                      fit: BoxFit.fitWidth, child: Text(history.playerXName))),
                  DataCell(FittedBox(
                      fit: BoxFit.fitWidth, child: Text(history.playerOName))),
                  DataCell(FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(history.isPlaying == 1
                          ? '中断'
                          : (history.isDraw == 1
                              ? '引き分け'
                              : (history.isPlayerXWin == 1
                                  ? history.playerXName
                                  : history.playerOName)))))
                ]);
              }).toList(),
            );
          }
        });
  }
}
