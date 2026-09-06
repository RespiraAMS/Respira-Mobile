import 'package:dio/dio.dart';

import '../../../core/network/api_response.dart';
import '../models/clinical_dtos.dart';

/// Clinical endpoints of Respira.Clinical (`/api/1/...`): diseases,
/// criteria, pathogens and the two diagnose calls.
class ClinicalService {
  ClinicalService(this._dio);

  final Dio _dio;

  /// `GET /diseases/list`.
  Future<List<DiseaseItemDto>> getDiseases() async {
    final res = await _dio.get('/api/1/diseases/list');
    final data = unwrapDataField(res) as List<dynamic>? ?? [];
    return data
        .map((e) => DiseaseItemDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// `GET /diseases/{id}/criteria` — ICU / resistance / other check-lists.
  ///
  /// The server dedupes only the other-criteria list; the ICU and
  /// resistance lists can carry duplicate rows sharing one criterion id
  /// (seeded associations) — ticking one would tick both. Dedupe by id
  /// here so every rendered row is independently selectable.
  Future<DiseaseCriteriaDto> getDiseaseCriteria(String diseaseId) async {
    final res = await _dio.get('/api/1/diseases/$diseaseId/criteria');
    final criteria = unwrapData(
      res,
      (json) => DiseaseCriteriaDto.fromJson(json),
    );
    return DiseaseCriteriaDto(
      icuHospitalizeCriteria: _distinctById(criteria.icuHospitalizeCriteria),
      resistanceRiskFactorCriteria:
          _distinctById(criteria.resistanceRiskFactorCriteria),
      otherCriteria: _distinctById(criteria.otherCriteria),
    );
  }

  List<CriterionItemDto> _distinctById(Iterable<CriterionItemDto> items) {
    final seen = <String>{};
    return [
      for (final item in items)
        if (seen.add(item.id)) item,
    ];
  }

  /// `GET /pathogens/list`.
  Future<List<PathogenItemDto>> getPathogens() async {
    final res = await _dio.get('/api/1/pathogens/list');
    final data = unwrapDataField(res) as List<dynamic>? ?? [];
    return data
        .map((e) => PathogenItemDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// `POST /diagnose/empirical` — severity, treatment site, medicines,
  /// infection probabilities and reference protocols.
  Future<EmpiricalDiagnoseResultDto> diagnoseEmpirical(
    EmpiricalDiagnoseRequest request,
  ) async {
    final res = await _dio.post(
      '/api/1/diagnose/empirical',
      data: request.toJson(),
    );
    return unwrapData(
      res,
      (json) => EmpiricalDiagnoseResultDto.fromJson(json),
    );
  }

  /// `POST /diagnose/target` — CrCl + recommended medicines for the
  /// identified pathogen.
  Future<TargetedDiagnoseResultDto> diagnoseTargeted(
    TargetedDiagnoseRequest request,
  ) async {
    final res = await _dio.post(
      '/api/1/diagnose/target',
      data: request.toJson(),
    );
    return unwrapData(
      res,
      (json) => TargetedDiagnoseResultDto.fromJson(json),
    );
  }
}
