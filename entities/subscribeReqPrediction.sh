curl -v  orion:1026/ngsi-ld/v1/subscriptions/ -s -S -H 'Content-Type: application/ld+json' -d @- <<EOF
{
  "description": "A subscription to get request predictions",
  "type": "Subscription",
  "entities": [{
    "id": "urn:ngsi-ld:ReqMalagaParkingPrediction1",
    "type": "ReqMalagaParkingPrediction"
    }],
  "watchedAttributes": [
      "predictionId",
      "socketId",
      "name",
      "year",
      "month",
      "day",
      "weekday",
      "time"
    ],
  "notification": {
    "endpoint": {
      "uri": "http://spark-master:9001",
      "accept": "application/json"
    }
  },
    "@context": [
        "https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld"
    ]
}
EOF
