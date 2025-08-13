// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:Medikalam/src/views/widgets/appbar/backappbar.dart';

class PrescriptionGridview extends StatelessWidget {
  const PrescriptionGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppbar(context, 'Prescription'),
      body: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of columns
            ),
            itemCount: 6, // number of pages
            itemBuilder: (context, index) {
              // ignore: use_colored_box
              return Container(
                color: Colors.accents[index % Colors.accents.length],
                child: Center(
                  child: Text('Page ${index + 1}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
