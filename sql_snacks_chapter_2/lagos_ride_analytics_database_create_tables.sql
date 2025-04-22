use lagos_ride_analytics_database;

CREATE TABLE DRIVERS (
		DriverID			int 				not null auto_increment,
        Name				char(50) 			not null,
        Rating				DECIMAL(3,2)		not null,
        TotalRides			int					not null,
        CONSTRAINT 			DRIVERS_PK			PRIMARY KEY(DriverID)
        );
        
CREATE TABLE RIDERS (
			RiderID			int					not null,
            Name 			char(50)			not null,
            City			VarChar(25)			not null,
			CONSTRAINT		RIDERS_PK 			PRIMARY KEY (RiderID)
);

CREATE TABLE RIDES (
			RideID				int				not null auto_increment,
			DriverID			int 			not null,
			RiderID				int 			not null,
			Fare				Numeric(9,2)	not null,
            Rating				DECIMAL(3,2)	not null,
            DistanceKM			int				not null,
            CONSTRAINT			RIDES_PK		PRIMARY KEY (RideID),
            CONSTRAINT			RIDES_RIDERS_FK		FOREIGN KEY (RiderID)
								REFERENCES 		RIDERS(RiderID),
			CONSTRAINT 			RIDES_DRIVERS_FK		FOREIGN KEY (DriverID)
								REFERENCES		DRIVERS(DriverID)
			);

CREATE TABLE PAYMENTS (
			PaymentID			int 			not null auto_increment,
            RideID				int 			not null,
            Amount				Numeric(9,2)	not null,
            PaymentMethod		VarChar(15)		not null,
            CONSTRAINT			PAYMENTS_PK		PRIMARY KEY (PaymentID),
			CONSTRAINT			PAYMENTS_RIDES_FK 	FOREIGN KEY (RideID)
								REFERENCES		RIDES(RideID)
);


