import 'package:go_router/go_router.dart';

import '../antibiograms/screens/antibiogram_list_screen.dart';
import '../antibiotic/screens/antibiotic_list_screen.dart';
import '../antibioticGroup/screens/antibiotic_group_list_screen.dart';
import '../diseases/screens/disease_list_screen.dart';
import 'screens/medical_lookup_screen.dart';
import '../pathogen/screens/pathogen_list_screen.dart';

class LookupRoutes {
  static const lookup = '/lookup';
  static const pathogens = '/lookup/pathogens';
  static const antibiotics = '/lookup/antibiotics';
  static const antibioticGroups = '/lookup/antibiotic-groups';
  static const antibiograms = '/lookup/antibiograms';
  static const diseases = '/lookup/diseases';
}

final List<RouteBase> lookupRoutes = [
  GoRoute(
    path: LookupRoutes.lookup,
    builder: (context, state) => const MedicalLookupScreen(),
  ),
  GoRoute(
    path: LookupRoutes.pathogens,
    builder: (context, state) => const PathogenListScreen(),
  ),
  GoRoute(
    path: LookupRoutes.antibiotics,
    builder: (context, state) => const AntibioticListScreen(),
  ),
  GoRoute(
    path: LookupRoutes.antibioticGroups,
    builder: (context, state) => const AntibioticGroupListScreen(),
  ),
  GoRoute(
    path: LookupRoutes.antibiograms,
    builder: (context, state) => const AntibiogramListScreen(),
  ),
  GoRoute(
    path: LookupRoutes.diseases,
    builder: (context, state) => const DiseaseListScreen(),
  ),
];
