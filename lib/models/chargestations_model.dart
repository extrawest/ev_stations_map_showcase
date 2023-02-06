class ChargestationsModel {
  String? stationId;
  String? tenantId;
  String? chargePointId;
  double? longitude;
  double? latitude;
  Status? status;

  ChargestationsModel({
    required this.stationId,
    required this.tenantId,
    required this.chargePointId,
    required this.longitude,
    required this.latitude,
    required this.status,
  });

  factory ChargestationsModel.fromJson(Map<String, dynamic> json) =>
      ChargestationsModel(
          stationId:
              json['stationId'] == null ? null : json['stationId'] as String,
          tenantId:
              json['tenantId'] == null ? null : json['tenantId'] as String,
          chargePointId: json['chargePointId'] == null
              ? null
              : json['chargePointId'] as String,
          longitude:
              json['longitude'] == null ? null : json['longitude'] as double,
          latitude:
              json['latitude'] == null ? null : json['latitude'] as double,
          status: getStatus(json['status'] as String));
}

enum Status { BUSY, AVAILABLE, OFFLINE }

Status getStatus(String status) {
  Status result;
  switch (status) {
    case 'available':
      result = Status.AVAILABLE;
      break;
    case 'busy':
      result = Status.BUSY;
      break;
    default:
      result = Status.OFFLINE;
      break;
  }
  return result;
}
