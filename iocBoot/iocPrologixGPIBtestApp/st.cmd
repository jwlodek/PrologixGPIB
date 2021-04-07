#!../../bin/darwin-x86/PrologixGPIBtest

##############################################################################
# Set up environment
< envPaths
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/db")
epicsEnvSet("PROLOGIX_ADDRESS", "$(PROLOGIX_ADDRESS=192.168.3.17)");
epicsEnvSet("P", "$(P=Prologix:)");
epicsEnvSet("R", "$(R=Test:)");
epicsEnvSet("A", "$(A=5)");

##############################################################################
# Register all support components
cd "$(TOP)"
dbLoadDatabase "dbd/PrologixGPIBtest.dbd"
PrologixGPIBtest_registerRecordDeviceDriver pdbbase

##############################################################################
# Set up ASYN port
prologixGPIBConfigure("L0", "$(PROLOGIX_ADDRESS)")
asynOctetSetInputEos("L0", -1, "\n")
asynSetTraceIOMask("L0_TCP", -1, 0x2)
asynSetTraceMask("L0_TCP", -1, 0x9)
asynSetTraceIOMask("L0", $(A), 0x2)
asynSetTraceMask("L0", $(A), 0x9)

##############################################################################
# Load record instances
dbLoadRecords("db/devSCPI.db", "P=$(P),R=$(R),PORT=L0,A=$(A)")
dbLoadRecords("db/asynRecord.db", "P=$(P)$(R),R=asyn,PORT=L0,ADDR=-1,IMAX=0,OMAX=0")

##############################################################################
# Start IOC
cd $(TOP)/iocBoot/$(IOC)
iocInit
