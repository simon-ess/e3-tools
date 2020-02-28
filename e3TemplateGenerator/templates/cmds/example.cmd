#var requireDebug 1
require ${_EPICS_MODULE_NAME},master
#

epicsEnvSet(TOP, "$(E3_CMD_TOP)")
epicsEnvSet("IOCNAME", "example")

dbLoadRecords("dbExample1.db" "user=$(IOCNAME)")
dbLoadRecords("dbExample2.db" "user=$(IOCNAME), no=1, scan=1 second")
dbLoadRecords("dbExample2.db" "user=$(IOCNAME), no=2, scan=2 second")
dbLoadRecords("dbExample2.db" "user=$(IOCNAME), no=3, scan=5 second")

dbLoadRecords("dbSubExample.db", "user=$(IOCNAME)")

iocInit()

## Start any sequence programs
seq sncExample, "user=$(IOCNAME)"
