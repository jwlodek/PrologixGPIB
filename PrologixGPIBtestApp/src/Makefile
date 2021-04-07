TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = PrologixGPIBtest
# PrologixGPIBtest.dbd will be created and installed
DBD += PrologixGPIBtest.dbd

# PrologixGPIBtest.dbd will be made up from these files:
PrologixGPIBtest_DBD += base.dbd

# Include dbd files from all support applications:
PrologixGPIBtest_DBD += drvPrologixGPIB.dbd
PrologixGPIBtest_DBD += calc.dbd
PrologixGPIBtest_DBD += stream.dbd

# Add all the support libraries needed by this IOC
PrologixGPIBtest_LIBS += drvPrologixGPIB
PrologixGPIBtest_LIBS += calc
PrologixGPIBtest_LIBS += stream
PrologixGPIBtest_LIBS += asyn

# PrologixGPIBtest_registerRecordDeviceDriver.cpp derives from PrologixGPIBtest.dbd
PrologixGPIBtest_SRCS += PrologixGPIBtest_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
PrologixGPIBtest_SRCS_DEFAULT += PrologixGPIBtestMain.cpp
PrologixGPIBtest_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#PrologixGPIBtest_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
PrologixGPIBtest_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

