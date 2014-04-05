hist(arrival_time_unsorted$V1, col='lightblue', main='Inter-arrivals of calls 20 intervals',breaks=20, color='blue', xlab="Inter-Arrival time in secs", ylab="Frequency of inter-arrival time")

hist(calldurations$V1,  main='Call duration for 20 intervals', breaks=20, col='lightblue', xlab="Call duration in secs", ylab="Frequency of calls", plot=TRUE)

hist(car.speeds$V1, main='Speed of cars for 40 intervals',breaks=40, col='lightblue', xlab="Car speeds in kmph", ylab="Frequency of cars")

arrivalMean = mean(arrival_time_unsorted$V1);

arrivalMean

durationMean = mean(calldurations$V1);

durationMean

carSpeedMean = mean(car.speeds$V1);

carSpeedMean

summary(car.speeds$V1)

install.packages("car")

library("car")

help(Prestige)

Prestige

#adjusted R-squared
#Residual standard Error

install.packages("effects")

library("effects")
plot()

install.packages("stats")
