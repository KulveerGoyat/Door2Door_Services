import 'package:Door2Door_Services/Constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../Constants/colors.dart';
import 'Professional_list/flooring_workers.dart';
import 'Professional_list/Shifting_wokers.dart';
import 'Professional_list/ac_service_workers.dart';
import 'Professional_list/beauticians.dart';
import 'Professional_list/carpenters.dart';
import 'Professional_list/chefs.dart';
import 'Professional_list/childcare_workers.dart';
import 'Professional_list/doctors.dart';
import 'Professional_list/electricians.dart';
import 'Professional_list/event_planners.dart';
import 'Professional_list/exterior_designers.dart';
import 'Professional_list/gardners.dart';
import 'Professional_list/home_tutors.dart';
import 'Professional_list/janitors.dart';
import 'Professional_list/painters.dart';
import 'Professional_list/pest_control_workers.dart';
import 'Professional_list/petcare_workers.dart';
import 'Professional_list/plumbers.dart';
import 'Professional_list/pool_cleaners.dart';
import 'Professional_list/roof_cleaners.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({
    super.key,
    required this.servicesText,
    required this.descriptionText,
    required this.servicesImg,
  });

  final String servicesText;
  final String descriptionText;
  final String servicesImg;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    bool isSvg(String img) {
      return img.endsWith('.svg');
    }

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      appBar: AppBar(
        backgroundColor: isDarkMode ? secondaryColor : primaryColor,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left_solid)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(
            defaultSize - 10,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: isSvg(servicesImg)
                    ?  SvgPicture.asset(servicesImg, height: 150, width: 150, fit: BoxFit.cover,)
                    :  Image(image: AssetImage(servicesImg), height: 150, width: 150, fit: BoxFit.cover,),
              ),
              Text(servicesText,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(
                height: defaultSize - 10,
              ),
              Text(
                descriptionText,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  height: 1.8,
                  letterSpacing: 0.8,
                  fontFamily: 'Georgia',
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: defaultSize - 10.0),
              Divider(
                thickness: 2.0,
                color: Colors.grey,
              ),
              SizedBox(height: defaultSize - 10.0),

              switch (servicesText) {
                "Doctor" => DoctorsList(isDarkMode: isDarkMode),
                "Plumber" => PlumbersList(isDarkMode: isDarkMode),
                "Janitor" => JanitorWorkersList(isDarkMode: isDarkMode),
                "Home Tutoring" => HomeTutorsList(isDarkMode: isDarkMode),
                "Carpenter" => CarpenterWorkersList(isDarkMode: isDarkMode),
                "Roof Cleaning" => RoofCleanersList(isDarkMode: isDarkMode),
                "Gardener" => GardenersList(isDarkMode: isDarkMode),
                "Flooring" => FlooringWorkersList(isDarkMode: isDarkMode),
                "Chef" => ChefsList(isDarkMode: isDarkMode),
                "Pet Care" => PetCareWorkersList(isDarkMode: isDarkMode),
                "Electrician" => ElectriciansList(isDarkMode: isDarkMode),
                "Ac Services" => ACServiceWorkersList(isDarkMode: isDarkMode),
                "Shifting" => ShiftingWorkersList(isDarkMode: isDarkMode),
                "Pest Control" => PestControlWorkersList(isDarkMode: isDarkMode),
                "Painter" => PaintersList(isDarkMode: isDarkMode),
                "Beautician" => BeauticiansList(isDarkMode: isDarkMode),
                "Exterior Design" => ExteriorDesignWorkersList(isDarkMode: isDarkMode),
                "Pool Cleaning" => PoolCleanersList(isDarkMode: isDarkMode),
                "Event Planning" => EventPlannersList(isDarkMode: isDarkMode),
                "Child Care" => ChildcareWorkersList(isDarkMode: isDarkMode),
                _ => throw UnimplementedError(),
              }

            ],
          ),
        ),
      ),
    );
  }
}

