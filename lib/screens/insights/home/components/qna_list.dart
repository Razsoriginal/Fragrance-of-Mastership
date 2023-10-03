import 'package:flutter/material.dart';
import 'package:fragrance_of_mastership/screens/insights/insights_page/insights_page.dart';
import 'package:provider/provider.dart';

import '../../../../constants/sizes.dart';
import '../../../../controllers/services/insights/provider/insights_provider.dart';

class QnaList extends StatelessWidget {
  const QnaList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SizedBox(
        height: SizeConfig.screenHeight,
        child: Consumer<InsightsProvider>(
          builder: (context, qnaProvider, _) {
            var qna = qnaProvider.insights;

            if (qna.isEmpty) {
              qnaProvider.refreshInsights();
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                shrinkWrap: false,
                itemCount: qna.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InsightsPage(insight: qna[index]),
                          ),
                        ),
                        title: Text(qna[index].title),
                        trailing: const Icon(Icons.question_answer_outlined),
                      ),
                      const Divider(),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
