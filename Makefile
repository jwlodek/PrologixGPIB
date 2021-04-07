# Makefile for Asyn PrologixGPIB support
#
# Created by wenorum on Wed Jun 27 09:14:16 2012
# Based on the Asyn devGpib template

TOP = .
include $(TOP)/configure/CONFIG

DIRS := configure
DIRS += $(wildcard *[Ss]up)
DIRS += $(wildcard *[Aa]pp)
DIRS += $(wildcard ioc[Bb]oot)

include $(TOP)/configure/RULES_TOP
