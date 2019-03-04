#!/bin/sh

# Config line syntax: inFile:outFile[:owner:group[:mode]]

while read CONFIGLINE; do
  INFILE=$(echo CONFIGLINE | cut -d ':' -f 1)
  OUTFILE=$(echo CONFIGLINE | cut -d ':' -f 2)
  OWNER=$(echo CONFIGLINE | cut -d ':' -f 3)
  GROUP=$(echo CONFIGLINE | cut -d ':' -f 4)
  MODE=$(echo CONFIGLINE | cut -d ':' -f 5)
  envsubst <${INFILE} >${OUTFILE}
  if [ -n "$OWNER" -a -n "$GROUP"]; then
    chown $OWNER:$GROUP $OUTFILE
    if [ -n "$MODE" ]; then
      chmod $MODE $OUTFILE
    fi
  fi
done < $CONFIGBUILDER_CONFIG_FILE
