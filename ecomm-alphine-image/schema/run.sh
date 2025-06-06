# !/bin/bash
mkdir /app
git clone $APP_GIT_URL /app

set -x

if ["$DB_TYPE" == "mongo"]; then
    for file in $SCHEMA_FILES ; do
        mongosh --host $DB_HOST </app/db/$file.js
    done
fi
if ["$DB_TYPE" == "mysql"]; then
    for file in $SCHEMA_FILES ; do
        mysql -h $DB_HOST -u$DB_USER -p$DB_PASS </app/db/$file.sql
    done

fi
