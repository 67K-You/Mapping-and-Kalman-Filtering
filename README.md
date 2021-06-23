# Mapping-and-Kalman-Filtering

Matlab simulation of an exploring robot which tries to resolve a S.L.A.M problem. It gets knowledge about its environment using 2 sensors : one using odometry which estimates its change in position, and one using vision which locates points of interest around the map and estimate their positions.
The data from those sensors is provided in the param folder where there is 2 datasets : one called FullObservation which contains the position of all points of interest at all time, and one more realist model called PartialObservation where the robot can only see some of the points of interest at each time step and decides whether a point of interest is new or if it has alredy located it.

# Results on FullObservation

![alt text](https://github.com/67K-You/Mapping-and-Kalman-Filtering/blob/main/Images%20pr%C3%A9sentation/Full1.png "At the beginning")
![alt text](https://github.com/67K-You/Mapping-and-Kalman-Filtering/blob/main/Images%20pr%C3%A9sentation/Full2.png "Then...")
![alt text](https://github.com/67K-You/Mapping-and-Kalman-Filtering/blob/main/Images%20pr%C3%A9sentation/Full3.png "Finally")

The dotted line corresponds to the raw odometry data, each cross represents a point of interest, the circles surrounding these crosses is the uncertainty about their position and the full line corresponds to the full trajectory.
SLAM is observed because the robot corrects its trajectory and uncertainty about the position of the points of interests decreases when getting closer.

# Results on PartialObservation

![alt text](https://github.com/67K-You/Mapping-and-Kalman-Filtering/blob/main/Images%20pr%C3%A9sentation/Partial1.png "At the beginning")
![alt text](https://github.com/67K-You/Mapping-and-Kalman-Filtering/blob/main/Images%20pr%C3%A9sentation/Partial2.png "Then...")
![alt text](https://github.com/67K-You/Mapping-and-Kalman-Filtering/blob/main/Images%20pr%C3%A9sentation/Partial3.png "Finally")

It can be seen that over time new points of interest are discovered and the robot uses them to locate itself.
