#! /bin/sh

# temporary file to store original mail
TEMPFILE=$(mktemp -p ~/tmp mail.XXXXXXXXXX) || exit 1
/bin/cat - > $TEMPFILE

# Get the original date header
# Find the line that starts with "Date: ", pipe that to cut and take everything
# after the "Date: "
ORIGINALDATE=$(gawk '/^Date: / { print $0; exit }' $TEMPFILE | cut -d ' ' -f 2-)

# Convert to local timezone
LOCALDATE=$(date -d "$ORIGINALDATE" +"%a, %d %b %Y %T %z")

gawk -v localdate="$LOCALDATE" '{ if (/^Date: /) print "Date: " localdate; else print $0;}' $TEMPFILE

# Delete temp file
rm -rf $TEMPFILE
