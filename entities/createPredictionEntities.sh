curl orion:1026/ngsi-ld/v1/entities -s -S -H 'Content-Type: application/ld+json' -d @- <<EOF
{
    "id": "urn:ngsi-ld:ReqTicketPrediction1",
    "type": "ReqTicketPrediction",
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
  "id": "urn:ngsi-ld:ResTicketPrediction1",
  "type": "ResTicketPrediction",
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
