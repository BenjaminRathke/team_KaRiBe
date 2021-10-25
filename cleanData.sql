CREATE table vaccByCounty(
	FIPS varchar(5),
	dateAdmin date,
	MMWR_week int,
	Recip_County VARCHAR(40),
	Recip_State VARCHAR,
	Series_Complete_Pop_Pct decimal,
	Series_Complete_Yes decimal,
	Series_Complete_12Plus decimal,
	Series_Complete_12PlusPop_Pct decimal,
	Series_Complete_18Plus decimal,
	Series_Complete_18PlusPop_Pct decimal,
	Series_Complete_65Plus decimal,
	Series_Complete_65PlusPop_Pct decimal,
	Completeness_pct decimal,
	Administered_Dose1_Recip int,
	Administered_Dose1_Pop_Pct decimal,
	Administered_Dose1_Recip_12Plus int,
	Administered_Dose1_Recip_12PlusPop_Pct decimal,
	Administered_Dose1_Recip_18Plus int,
	Administered_Dose1_Recip_18PlusPop_Pct decimal,
	Administered_Dose1_Recip_65Plus int,
	Administered_Dose1_Recip_65PlusPop_Pct decimal,
	SVI_CTGY varchar,
	Series_Complete_Pop_Pct_SVI decimal,
	Series_Complete_12PlusPop_Pct_SVI decimal,
	Series_Complete_18PlusPop_Pct_SVI decimal,
	Series_Complete_65PlusPop_Pct_SVI decimal,
	Metro_status varchar,
	Series_Complete_Pop_Pct_UR_Equity decimal,
	Series_Complete_12PlusPop_Pct_UR_Equity decimal,
	Series_Complete_18PlusPop_Pct_UR_Equity decimal,
	Series_Complete_65PlusPop_Pct_UR_Equity int,
	primary key (dateAdmin, recip_county, recip_state)
);

copy vaccByCounty
from 'C:/Users/Public/Documents/vaccByCounty.csv'
with (format csv, header);


create view vwvaccByCounty as
	select * from vaccByCounty
	where dateAdmin = '10/21/2021'
;

drop table demographics;
create table demographics (
		county varchar(50),
		states varchar(2),
		percentage16_Donald_Trump decimal,
		percentage16_Hillary_Clinton decimal,
		total_votes16 int,
		votes16_Donald_Trump int,
		votes16_Hillary_Clinton	int,
		percentage20_Donald_Trump decimal,
		percentage20_Joe_Biden	decimal,
		total_votes20 int,
		votes20_Donald_Trump int,
		votes20_Joe_Biden int,
		lat	varchar,
		long varchar,
		cases int,
		deaths int,
		TotalPop int,
		Men	int,
		Women int,
		Hispanic decimal,
		White decimal,
		Black decimal,
		Native decimal,
		Asian decimal,
		Pacific	decimal,
		VotingAgeCitizen int,
		Income int,
		IncomeErr int,
		IncomePerCap int,
		IncomePerCapErr int,
		Poverty	decimal,
		ChildPoverty decimal,
		Professional decimal,
		Service	decimal,
		Office decimal,
		Construction decimal,
		Production decimal,
		Drive decimal,
		Carpool	decimal,
		Transit	decimal,
		Walk decimal,
		OtherTransp	decimal,
		WorkAtHome decimal,
		MeanCommute decimal,
		Employed int,
		PrivateWork	decimal,
		PublicWork decimal,
		SelfEmployed decimal,
		FamilyWork decimal,
		Unemployment decimal
);

select * from vwvaccByCounty as vw
inner join demographics as d
	on (d.county = substring(recip_county, 1, position('County' in recip_county) -2 ))
	and (d.states = vw.recip_state)
	where recip_county like '%County%';
	
select
    -- takes substring of beginning of county minus where it says county
    -- to join to other table
	substring(recip_county, 1, position('County' in recip_county) -2 ) as county, * 
	into cleanCounty
	from vwvaccByCounty as vw
	where recip_county like '%County%'
	order by recip_county