#!/bin/bash

psql basketball -f sos/standardized_results.sql

psql basketball -c "drop table if exists ncaa_women._basic_factors;"
psql basketball -c "drop table if exists ncaa_women._parameter_levels;"

psql basketball -c "vacuum analyze ncaa_women.results;"

R --vanilla -f sos/lmer.R

psql basketball -c "vacuum full verbose analyze ncaa_women._basic_factors;"
psql basketball -c "vacuum full verbose analyze ncaa_women._parameter_levels;"

psql basketball -f sos/normalize_factors.sql

psql basketball -c "vacuum full verbose analyze ncaa_women._factors;"

psql basketball -f sos/schedule_factors.sql

psql basketball -c "vacuum full verbose analyze ncaa_women._schedule_factors;"

psql basketball -f sos/connectivity.sql > sos/connectivity.txt

psql basketball -f sos/current_ranking.sql > sos/current_ranking.txt

psql basketball -f sos/division_ranking.sql > sos/division_ranking.txt

psql basketball -f sos/test_predictions.sql > sos/test_predictions.txt

psql basketball -f sos/predict_daily.sql > sos/predict_daily.txt
