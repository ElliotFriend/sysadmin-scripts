#!/bin/bash

# Grab some stats from my script and send an email to myself

SUBJECT="Larryboy Status Report"
FROM="larryboy@stlchristian.edu"
TO="evoris@stlchristian.edu"
MESSAGE="`echo $HOME`/tmp/report-message.txt"

# Record a title, and the date/time
echo -e "Larryboy Status Report\n`date`" >> $MESSAGE

# Get the pertinent information from 'top'
echo -e "\nCurrent Server Load\n" >> $MESSAGE
top -n 1 -b | head -n 5 >> $MESSAGE

# Get the pertinent information from 'df'
echo -e "\nFree Disk Space\n" >> $MESSAGE
df -h >> $MESSAGE

# Send off the report
mail -s "$SUBJECT" -r $FROM $TO <<EOF
`cat $MESSAGE`
EOF

# Get rid of the message so that we're ready for the next run
rm $MESSAGE
