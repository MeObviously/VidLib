select rental_id, 
		rental_date, 
		rental_days,
		DATEADD(day,rental_days, rental_dateS) AS return_date_2, 
		title 
from	tblrentals