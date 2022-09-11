# YODA - ML parking malaga

Based on the TFM thesis of Antonio Hurtado (https://github.com/tonihurtado/fiware-kube-ml-parking)

https://datosabiertos.malaga.eu/dataset/ocupacion-aparcamientos-publicos-municipales
https://datosabiertos.malaga.eu/dataset/ubicacion-de-aparcamientos-publicos-municipales

## Training

* Clone this project


* Load and save the `prediction-job/malaga_parking.csv` [from external source](https://drive.upm.es/s/hA1jEQChEwZyVQj)
```shell
curl -o prediction-job/malaga_parking.csv https://drive.upm.es/s/hA1jEQChEwZyVQj/download
```

* If the model already exists (`prediction-job/model`) just build de project packages
```shell
docker compose -f docker-compose.build.packages.yml up -d
```

* If the model does not exist: Build the packages and train the model
```shell
docker compose -f docker-compose.train.yml up -d
```
* View the spark deployment in http://localhost:4040/jobs/

* Test that the `prediction-job/model` folder is generated with the ML model

## Testing (Development)

* Run the whole scenario in dev
```shell
docker compose -f docker-compose.dev.yml up -d
```

* Open browser in http://localhost:3000

* Select a date and time range

* Predict!

## Production (YODA)

* Run the whole scenario in prod within YODA (only spark). You need to create the predictionEntities and the subscriptions like in the `entities` folder. They are required the creation of entities and the subscription of spark, the other is optional, it depends on the application. There are two possibilities:
   - The application receives a notification when the prediction is made and receives the `urn:ngsi-ld:ResMalagaParkingPrediction1`
   - The application asks periodically to orion (`urn:ngsi-ld:ResMalagaParkingPrediction1`) and see if the prediction was made

```shell
docker compose up -d
```

* Example of petition made to ask for a prediction:

```
curl --location --request PATCH 'http://broker-yoda.dit.upm.es/ngsi-ld/v1/entities/urn:ngsi-ld:ReqMalagaParkingPrediction1/attrs' \
--header 'Content-Type: application/json' \
--data-raw '{
   "name":{
      "type":"Property",
      "value":"Camas"
   },
   "year":{
      "type":"Property",
      "value":2022
   },
   "month":{
      "type":"Property",
      "value":10
   },
   "day":{
      "type":"Property",
      "value":22
   },
   "weekday":{
      "type":"Property",
      "value":2
   },
   "time":{
      "type":"Property",
      "value":0
   },
   "predictionId":{
      "type":"Property",
      "value":"p-1662768034900"
   },
   "socketId":{
      "type":"Property",
      "value":"Fn0kKHEF-dOcr311AAAF"
   }
}'
```

Being:
- name: Name of the station ["Salitre", "Cervantes","El_Palo","Av._de_Andalucia","Camas","Cruz_De_Humilladero","Alcazaba","San_Juan_De_La_Cruz","Pz._de_la_Marina" or "Tejon_y_Rodriguez"]
- year: [2022, 2023, ...]
- month: [1, 2, 3, ..., 12]
- day: [1, 2, 3, ..., 31]
- weekday: [1, ..., 7] 1 ->Sunday  7->Saturday
- time: : [0, ... , 23]
- predictionId: String to identify the prediction in the consuming application
- socketId: String to identify the socket with the client in the consuming application

### Testing everything worked

1) Validate that the subscription and entities exist:
```
curl --location --request GET 'http://broker-yoda.dit.upm.es/ngsi-ld/v1/subscriptions/'
```

```
curl --location --request GET 'http://broker-yoda.dit.upm.es/ngsi-ld/v1/entities/urn:ngsi-ld:ReqMalagaParkingPrediction1'
```

```
curl --location --request GET 'http://broker-yoda.dit.upm.es/ngsi-ld/v1/entities/urn:ngsi-ld:ResMalagaParkingPrediction1'
```

2) Update the `ReqMalagaParkingPrediction1`
```
curl --location --request PATCH 'http://broker-yoda.dit.upm.es/ngsi-ld/v1/entities/urn:ngsi-ld:ReqMalagaParkingPrediction1/attrs' \
--header 'Content-Type: application/json' \
--data-raw '{
   "name":{
      "type":"Property",
      "value":"Salitre"
   },
   "year":{
      "type":"Property",
      "value":2022
   },
   "month":{
      "type":"Property",
      "value":10
   },
   "day":{
      "type":"Property",
      "value":22
   },
   "weekday":{
      "type":"Property",
      "value":2
   },
   "time":{
      "type":"Property",
      "value":0
   },
   "predictionId":{
      "type":"Property",
      "value":"p-1662768034900"
   },
   "socketId":{
      "type":"Property",
      "value":"Fn0kKHEF-dOcr311AAAF"
   }
}'
```

3) See if the `ResMalagaParkingPrediction1` changes

```
curl --location --request GET 'http://broker-yoda.dit.upm.es/ngsi-ld/v1/entities/urn:ngsi-ld:ResMalagaParkingPrediction1'
```

Response:
```
{
   "@context":"https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context.jsonld",
   "id":"urn:ngsi-ld:ResMalagaParkingPrediction1",
   "type":"ResMalagaParkingPrediction",
   "socketId":{
      "type":"Property",
      "value":"Fn0kKHEF-dOcr311AAAF"
   },
   "predictionId":{
      "type":"Property",
      "value":"p-1662768034900"
   },
   "predictionValue":{
      "type":"Property",
      "value":60
   },
   "name":{
      "type":"Property",
      "value":"Salitre"
   },
   "weekday":{
      "type":"Property",
      "value":2
   },
   "time":{
      "type":"Property",
      "value":0
   },
   "month":{
      "type":"Property",
      "value":10
   }
}
```
Result of prediction: 60% of occupancy
- predictionValue: % of occupancy
