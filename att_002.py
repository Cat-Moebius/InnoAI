import os

import psycopg2


def main():
    postgres_password = os.getenv('POSTGRES_PASSWORD')
    with psycopg2.connect(database='demo', user='postgres', password=postgres_password) as conn:
        with conn.cursor() as cur:
            cur.execute('SELECT * FROM bookings.top10_aircrafts_model_by_range_view;')
            for values in cur.fetchall():
                print(*values, sep='\t')


if __name__ == '__main__':
    main()