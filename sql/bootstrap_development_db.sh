#!/bin/bash

dbs="reddit changes email query_queue reddit_test changes_test email_test query_queue_test"

for db in $dbs; do
    sudo -u postgres dropdb $db
    sudo -u postgres createdb -E utf8 $db --lc-ctype 'en_US.utf8' --lc-collate 'en_US.utf8' --template template0
done

psql -U reddit -W < sql/functions.sql
psql -U reddit -d reddit_test -W < sql/functions.sql
