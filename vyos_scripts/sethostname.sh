#!/bin/vbash

############################
## Alias for configuration
vyatta_sbindir=/opt/vyatta/sbin
SET=${vyatta_sbindir}/my_set
DELETE=${vyatta_sbindir}/my_delete
COPY=${vyatta_sbindir}/my_copy
MOVE=${vyatta_sbindir}/my_move
RENAME=${vyatta_sbindir}/my_rename
ACTIVATE=${vyatta_sbindir}/my_activate
DEACTIVATE=${vyatta_sbindir}/my_activate
COMMENT=${vyatta_sbindir}/my_comment
COMMIT=${vyatta_sbindir}/my_commit
DISCARD=${vyatta_sbindir}/my_discard
SAVE=${vyatta_sbindir}/vyatta-save-config.pl
############################

$SET system host-name $1
$COMMIT
