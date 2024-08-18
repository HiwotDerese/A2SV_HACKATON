
import 'package:dozer_mobile/presentation/details_screen.dart/details_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/models/construction_machine.dart';
import 'package:flutter/material.dart';

class BestOfferItemWidget extends StatelessWidget {
  final ConstructionMachineModel machine;

  BestOfferItemWidget({
    Key? key,
    required this.machine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailScreen(constructionMachine: machine);
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(machine.image[0]), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      machine.name,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      machine.location,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
