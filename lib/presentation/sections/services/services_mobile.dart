part of 'services.dart';

class ServiceMobile extends StatelessWidget {
  const ServiceMobile({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const CustomSectionHeading(
          text: 'Technical Expertise',
        ),
        const CustomSectionSubHeading(
          text: "Specialized engineering domains",
        ),
       
        Space.y!,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: ServicesUtils.servicesTitles.asMap().entries.map((e) {
              int i = e.key;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: _ServiceCard(
                  serviceIcon: ServicesUtils.servicesIcons[i],
                  serviceTitle: ServicesUtils.servicesTitles[i],
                  serviceDescription: ServicesUtils.servicesDescription[i],
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
