import mysql.connector
import time
connection=mysql.connector.connect(host="localhost",user="root",password="Dharunkg05@",database="college_db")
cursor=connection.cursor()
queries_executed=0
start=time.perf_counter()
cursor.execute("select * from enrollments")
queries_executed+=1
rows=cursor.fetchall()
for i in rows:
    enrollment_id,student_id,course_id,enrollment_date,grade=i
    cursor.execute("select concat(first_name,' ',last_name) as fullname from students where student_id=%s",(student_id,))
    queries_executed+=1
    name=cursor.fetchone()[0]
    print(name,course_id,enrollment_date,grade)
end=time.perf_counter()
print("queries_executed=",queries_executed)
print("time taken=",end-start)
connection.close()
