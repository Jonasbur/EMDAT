DROP DATABASE IF EXISTS emdat;
CREATE DATABASE emdat CHARACTER SET utf8mb4;
USE emdat;
 
CREATE TABLE desastre(
    id_disaster_number INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT ,
    disaster_year INT(10) NOT NULL,
	disaster_sequential_number INT(10) UNSIGNED NOT NULL ,
	disaster_group VARCHAR(20) NOT NULL,
	disaster_subgroup VARCHAR(20) NOT NULL,
	disaster_type VARCHAR(20) NOT NULL,
	disaster_subtype VARCHAR(20) NOT NULL,
	disaster_subsubtype VARCHAR(20),
	disaster_entry_criteria VARCHAR(20) NOT NULL,
	disaster_origin VARCHAR(20) NOT NULL,
	disaster_associated_dis VARCHAR(20) NOT NULL,
	disaster_associated_dis2 VARCHAR(20) ,
	disaster_mag_value VARCHAR(20) NOT NULL,
    disaster_mag_scale VARCHAR(20) NOT NULL,
	start_year VARCHAR(20) NOT NULL,
	start_month VARCHAR(20) NOT NULL,
	start_day VARCHAR(20) NOT NULL,
	end_year VARCHAR(20) NOT NULL,
	end_month VARCHAR(20) NOT NULL,
	end_day VARCHAR(20) NOT NULL,
	PRIMARY KEY (`id_disaster_number`)
) ;

CREATE TABLE pais( 
    id_country_isocode int(10) UNSIGNED AUTO_INCREMENT,
	country_name VARCHAR(50) NOT NULL,
	country_region VARCHAR(50) NOT NULL,
	country_continent VARCHAR(50) NOT NULL,
	country_location VARCHAR(50) NOT NULL,
	country_river_basin VARCHAR(50),
	country_latitude int(10)  NOT NULL,
	country_longitude int(10)  NOT NULL,
    id_disaster_number int(10)  UNSIGNED NOT NULL  ,
	PRIMARY KEY (`id_country_isocode`),
	FOREIGN KEY (`id_disaster_number`) REFERENCES `desastre` (`id_disaster_number`) 	
);

CREATE TABLE danoshumanos( 
    id_human_impact int(10) UNSIGNED AUTO_INCREMENT,
	human_impact_total_affected int(50),
	human_impact_total_deaths int(50),
	human_impact_no_injured int(50),
	human_impact_no_affected int(50),
	human_impact_no_homeless int(50),
    id_disaster_number int(10)  UNSIGNED NOT NULL  ,
	PRIMARY KEY (`id_human_impact`),
	FOREIGN KEY (`id_disaster_number`) REFERENCES `desastre` (`id_disaster_number`) 	
);

CREATE TABLE danoseconomicos( 
    id_economic_impact int(10) UNSIGNED AUTO_INCREMENT,
	economical_impact_reconstruction_costs int(50),
    economical_impact_insured_damages int(50),
	economical_impact_total_damages int(50),
    economical_impact_cpi int(50),
	id_disaster_number int(10)  UNSIGNED NOT NULL  ,
	PRIMARY KEY (`id_economic_impact`),
	FOREIGN KEY (`id_disaster_number`) REFERENCES `desastre` (`id_disaster_number`) 	
);

CREATE TABLE situacion( 
    id_status int(10) UNSIGNED AUTO_INCREMENT,
	status_ofda_response int(50),
    status_appeal int(50),
	status_declaration int(50),
    status_id_contribution int(50),
	id_disaster_number int(10)  UNSIGNED NOT NULL  ,
	PRIMARY KEY (`id_status`),
	FOREIGN KEY (`id_disaster_number`) REFERENCES `desastre` (`id_disaster_number`) 	
);