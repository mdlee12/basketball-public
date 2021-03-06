begin;

drop table if exists ncaa_sr.coaches;

create table if not exists ncaa_sr.coaches (
	year				integer,
	coach				text,
	coach_url			text,
	school				text,
	school_url			text,
	school_id			text,
	conference			text,
	conference_url			text,
	conference_id			text,
	w				integer,
	l				integer,
	wlp				float,
	ap_pre				integer,
	ap_post				integer,
	ncaa_tournament			text,
	since				integer,
	cs_w				integer,
	cs_l				integer,
	cs_wlp				float,
	cs_ncaa				integer,
	cs_s16				integer,
	cs_ff				integer,
	co_w				integer,
	co_l				integer,
	co_wlp				float,
	co_ncaa				integer,
	co_s16				integer,
	co_ff				integer
);

copy ncaa_sr.coaches from '/tmp/coaches.csv' with delimiter as ',' csv header quote as '"';

commit;
