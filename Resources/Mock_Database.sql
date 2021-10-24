Drop table if exists vaccByCounty;
CREATE table vaccByCounty(
	dateAdmin date not null,
	FIPS int NOT NULL,
	MMWR_week int NOT NULL,
	Recip_County VARCHAR(30) NOT NULL,
	Recip_State VARCHAR NOT NULL,
	Series_Complete_Pop_Pct decimal NOT NULL,
	Series_Complete_Yes decimal NOT NULL,
	Series_Complete_12Plus decimal NOT NULL,
	Series_Complete_12PlusPop_Pct decimal NOT NULL,
	Series_Complete_18Plus decimal not null,
	Series_Complete_18PlusPop_Pct decimal not null,
	Series_Complete_65Plus decimal not null,
	Series_Complete_65PlusPop_Pct decimal not null,
	Completeness_pct decimal not null,
	Administered_Dose1_Recip int not null,
	Administered_Dose1_Pop_Pct decimal not null,
	Administered_Dose1_Recip_12Plus int not null,
	Administered_Dose1_Recip_12PlusPop_Pct decimal not null,
	Administered_Dose1_Recip_18Plus int not null,
	Administered_Dose1_Recip_18PlusPop_Pct decimal not null,
	Administered_Dose1_Recip_65Plus int not null,
	Administered_Dose1_Recip_65PlusPop_Pct decimal not null,
	SVI_CTGY varchar not null,
	Series_Complete_Pop_Pct_SVI decimal not null,
	Series_Complete_12PlusPop_Pct_SVI decimal not null,
	Series_Complete_18PlusPop_Pct_SVI decimal not null,
	Series_Complete_65PlusPop_Pct_SVI decimal not null,
	Metro_status varchar not null,
	Series_Complete_Pop_Pct_UR_Equity decimal not null,
	Series_Complete_12PlusPop_Pct_UR_Equity decimal not null,
	Series_Complete_18PlusPop_Pct_UR_Equity decimal not null,
	Series_Complete_65PlusPop_Pct_UR_Equity int not null,
	PRIMARY KEY (Recip_County)
);

copy vaccByCounty
from 'C:/Users/Public/Documents/Mock-Data-File.csv'
with (format csv, header);