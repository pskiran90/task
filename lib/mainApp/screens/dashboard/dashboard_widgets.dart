import 'package:flutter/material.dart';

import '../../reusables/colors.dart';
import '../../reusables/sized_box.dart';

class DashboardCard extends StatelessWidget {
  final String course;
  const DashboardCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.25,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: none,
        child: Container(
            decoration: BoxDecoration(
              gradient: primaryGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hb20,
                  const Text(
                    "Hi Good Morning!",
                    style: TextStyle(color: white),
                  ),
                  Text(
                    course,
                    style: const TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  hb20,
                  Container(
                    height: size.height * 0.08,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                              children: [
                                const TextSpan(
                                  text: 'Selected Course\n',
                                  style: TextStyle(color: grey, fontSize: 12),
                                ),
                                TextSpan(
                                  text: course,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    return secondaryColor;
                                  },
                                ),
                              ),
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Text(
                                    "Change",
                                    style: TextStyle(color: white),
                                  ),
                                  Icon(
                                    Icons.swap_horiz,
                                    color: white,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  final Gradient? bgClr;
  final String? imgUrl;

  const SmallCard({
    Key? key,
    required this.bgClr,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.15,
      width: size.width * 0.3,
      decoration: BoxDecoration(
        gradient: bgClr,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.network(
        imgUrl!,
        fit: BoxFit.contain,
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Gradient? bgClr;
  final String? imgUrl;
  final String? title;

  const CourseCard({
    Key? key,
    required this.bgClr,
    required this.imgUrl,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width * 0.3,
          height: size.height * 0.17,
          decoration: BoxDecoration(
            gradient: bgClr,
            borderRadius: BorderRadius.circular(80),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                imgUrl!,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        hb10,
        SizedBox(
          width: size.width * 0.25,
          child: Text(
            title!,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
