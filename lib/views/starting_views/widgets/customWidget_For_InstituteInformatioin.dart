import 'package:flutter/material.dart';
import 'package:yusur_app/models/institute_model.dart';

class CustomwidgetForInstituteinformatioin extends StatelessWidget {
  const  CustomwidgetForInstituteinformatioin({super.key, required this.institute});
    final Institute institute;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  institute.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: institute.isFavorite ? Colors.red : Colors.grey,
                  size: 25,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 8),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      institute.nameAr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      institute.address!,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: AssetImage(institute.photoPath!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}