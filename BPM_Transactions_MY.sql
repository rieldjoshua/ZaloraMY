select distinct n.full_name, p.person_number, h.transaction_id, module_identifier as Action,
object, object_id, subject,
SUBJECT_ID, H.CREATED_BY, H.CREATION_DATE, STATUS
from hrc_txn_header h, hrc_txn_data d, PER_ALL_ASSIGNMENTS_M a,
per_all_people_f p, per_person_names_f n
where h.transaction_id = d.transaction_id  
and object_id = a.assignment_id
and a.person_id = p.person_id
--and status in ('PENDING', 'ERROR')
and sysdate between a.effective_start_date and a.effective_end_date
and n.person_id = p.person_id
and n.name_type = 'GLOBAL'
and TRUNC(sysdate) BETWEEN n.EFFECTIVE_START_DATE AND n.EFFECTIVE_END_DATE

and a.legislation_code='MY'

order by person_number desc