import mysql.connector
import time
import os
db_password=os.getenv("DB_PASSWORD")
connection=mysql.connector.connect(host="localhost",username="root",password=db_password,database="college_db")
cursor=connection.cursor()
queries_executed=0
start=time.perf_counter()
cursor.execute("select concat(s.first_name,' ',s.last_name) as full_name,course_id,e.enrollment_date,e.grade from enrollments e join students s using(student_id)")
queries_executed+=1
rows=cursor.fetchall()
for i in rows:
    print(i)
end=time.perf_counter()
print("queries_executed=",queries_executed)
print("time_taken=",end-start)
connection.close()

"""
version_1 database_round_trips=12
version_2 database_round_trips=1

time saved in version_2 compared with version_1 = version_1 time - version_2 time
                                                = 0.011188800097443163 - 0.0022945000091567636
                                                = 0.0088943001
                                                may look like small as of now but as the database grows this will prove to be efficient
"""

"""
If there are 10,000 enrollments:
Version 1 executes:
1 query to fetch all enrollments
+ 10,000 queries to fetch each student's details
= 10,001 total queries.

Version 2 uses a single JOIN query.
Total queries = 1.

Extra queries issued by the N+1 version = 10,000.
"""
