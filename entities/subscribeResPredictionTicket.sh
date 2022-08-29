curl -v  orion:1026/ngsi-ld/v1/subscriptions/ -s -S -H 'Content-Type: application/ld+json' -d @- <<EOF
{
  "description": "A subscription to get response predictions",
  "type": "Subscription",
  "entities": [{
    "id": "urn:ngsi-ld:ResTicketPrediction1",
    "type": "ResTicketPrediction"
    }],
  "watchedAttributes": [
      "predictionId",
      "socketId",
      "predictionValue",
      "name",
      "weekday",
      "time",
      "month"
    ],
  "notification": {
    "endpoint": {
      "uri": "http://web:3000/notify",
      "accept": "application/json"
    }
  },
    "@context": [
        "https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld"
    ]
}
EOF

