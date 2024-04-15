import sqlite3
from faker import Faker
import random


def sqlite_connection(db_name='students.db'):
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    return conn, cursor


def generate_fake_data(cursor, faker):
    for _ in range(3):
        cursor.execute("INSERT INTO groups (group_name) VALUES (?)", (faker.word(),))

    for _ in range(3):
        cursor.execute("INSERT INTO teachers (teacher_name) VALUES (?)", (faker.name(),))

    for teacher_id in range(1, 4):
        for _ in range(random.randint(5, 8)):
            cursor.execute("INSERT INTO subjects (subject_name, teacher_id) VALUES (?, ?)", (faker.word(), teacher_id))

    for group_id in range(1, 4):
        for _ in range(random.randint(30, 50)):
            cursor.execute("INSERT INTO students (student_name, group_id) VALUES (?, ?)", (faker.name(), group_id))

    num_students = cursor.execute("SELECT COUNT(*) FROM students").fetchone()[0]
    num_subjects = cursor.execute("SELECT COUNT(*) FROM subjects").fetchone()[0]
    for student_id in range(1, num_students + 1):
        for subject_id in range(1, num_subjects + 1):
            num_grades = random.randint(1, 20)
            for _ in range(num_grades):
                cursor.execute("INSERT INTO grades (student_id, subject_id, grade, date_received) VALUES (?, ?, ?, ?)",
                               (student_id, subject_id, random.randint(1, 10), faker.date_this_year()))

if __name__ == "__main__":
    faker = Faker()

    conn, cursor = sqlite_connection()

    generate_fake_data(cursor, faker)

    conn.commit()
    conn.close()