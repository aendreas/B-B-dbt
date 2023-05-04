WITH joins AS (
	SELECT planned_timestamp, scheduled_time.hhmm, d.yyyymmdd, tr.train_id, event_type, timetable_variation, variation_status, company_id, location_id, start_time, end_time, loc_id_start, loc_id_end 
	FROM {{ref('int__train')}} tr INNER JOIN {{ref('stg__movements')}} m ON (tr.train_id = m.train_id)
								INNER JOIN {{ref('stg__time')}} scheduled_time ON (scheduled_time.hour = m.hour AND scheduled_time.minute = m.minute)
								INNER JOIN {{ref('stg__date')}} d ON (d.year = m.year AND d.month = m.month AND d.day = m.day)
								INNER JOIN {{ref('stg__schedules')}} s ON (tr.train_id = s.train_id)
								INNER JOIN {{ref('stg__companies')}} c ON (m.company_id = c.sector_code)
								INNER JOIN {{ref('stg__loc_stanox_translation')}} l ON (l.loc_stanox = m.loc_stanox)
),

int AS (
	SELECT hhmm, yyyymmdd, train_id, company_id,
	CAST(CASE
		WHEN variation_status = 'LATE' THEN timetable_variation
		WHEN variation_status = 'EARLY' THEN -timetable_variation
		ELSE 0
	END AS SMALLINT) AS leg_delay, location_id, start_time, end_time, loc_id_start, loc_id_end
	FROM joins
),

final AS (
	SELECT hhmm AS planned_leg_arrival_hhmm, yyyymmdd AS planned_leg_arrival_yyyymmdd, train_id, company_id, leg_delay,
	CASE
		WHEN leg_delay > 2 THEN TRUE
		ELSE FALSE
	END AS has_leg_delay, location_id AS current_location_id_leg, start_time AS departure_journey_hhmm, end_time AS end_of_journey_hhmm, loc_id_start AS location_id_start_of_journey, loc_id_end AS location_id_end_of_journey
	FROM int
)

SELECT * FROM final