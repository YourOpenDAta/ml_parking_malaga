curl orion:1026/ngsi-ld/v1/entities -s -S -H 'Content-Type: application/ld+json' -d @- <<EOF
{
    "id": "urn:ngsi-ld:ReqMalagaParkingPrediction1",
    "type": "ReqMalagaParkingPrediction",
    "predictionId": {
        "value": 0,
        "type": "Property"
      },
      "socketId": {
        "value": 0,
        "type": "Property"
      },
      "name":{
        "value": 0,
        "type": "Property"
      },
      "year":{
        "value": 0,
        "type": "Property"
      },
      "month":{
        "value": 0,
        "type": "Property"
      },
      "day":{
        "value": 0,
        "type": "Property"
      },
      "weekday": {
        "value": 0,
        "type": "Property"
      },
      "time": {
        "value": 0,
        "type": "Property"
      },
    "@context": [
      "https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld"
    ]
}
EOF



curl orion:1026/ngsi-ld/v1/entities -s -S -H 'Content-Type: application/ld+json' -d @- <<EOF
{
  "id": "urn:ngsi-ld:ResMalagaParkingPrediction1",
  "type": "ResMalagaParkingPrediction",
  "predictionId": {
    "value": "0",
    "type": "Property"
  },
  "socketId": {
    "value": 0,
    "type": "Property"
  },
  "predictionValue":{
    "value": 0,
    "type": "Property"
  },
  "name":{
    "value": 0,
    "type": "Property"
  },
  "weekday":{
    "value": 0,
    "type": "Property"
  },
  "time": {
    "value": 0,
    "type": "Property"
  },
  "month": {
    "value": 0,
    "type": "Property"
  },
  "@context": [
    "https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld"
  ]
}
EOF
