import psycopg2

conn = psycopg2.connect("postgresql://pharmacy_user:1@localhost/pharmacy_db")
cur = conn.cursor()

while True:
    print("Please enter patient ID")
    patient_id = int(input())

    print("Please enter medicine ID")
    medicine_id = int(input())

    print("Enter notes for this medication")
    notes = input()

    cur.execute("""
        INSERT INTO patient_medications
        (patient_medication_id, patient_id, medicine_id, start_date, notes)
        VALUES (nextval('patient_medication_seq'), %s, %s, NOW(), %s)
        RETURNING patient_medication_id;
    """, (patient_id, medicine_id, notes))

    patient_medication_id = cur.fetchone()[0]

    print(f"Meds submitted: ID {patient_medication_id}")

    conn.commit()

cur.close()
conn.close()