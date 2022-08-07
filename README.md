# YODA - ML parking malaga

Based on the TFM thesis of Antonio Hurtado (https://github.com/tonihurtado/fiware-kube-ml-parking)

https://datosabiertos.malaga.eu/dataset/ocupacion-aparcamientos-publicos-municipales
https://datosabiertos.malaga.eu/dataset/ubicacion-de-aparcamientos-publicos-municipales

* Clone this project
```shell
git clone https://github.com/ging/BootCamp-FIWARE-ML
cd BootCamp-FIWARE-ML
```

* Load and save the `prediction-job/malaga_parking.csv` [from external source](https://drive.upm.es/s/hA1jEQChEwZyVQj)

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

* Run the whole scenario
```shell
docker-compose up -d
```

* Open browser in http://localhost:3000

* Select a date and time range

* Predict!
