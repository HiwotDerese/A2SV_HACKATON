
import 'package:flutter/material.dart';

class BestOffer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Offer',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'See All',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          // ...listOffer.map(
          //   (machineData) => BestOfferItemWidget(machine: machineData),
          // ),
        ],
      ),
    );
  }
}
