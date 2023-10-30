#!/bin/sh

##
## Copyright (c) 2001-2022 by TIBCO Software Inc.
## ALL RIGHTS RESERVED
##
## $Id: setup.sh 142714 2022-07-21 22:45:04Z $
##
## This setup file can be used to setup the environment for 
## compiling and running EMS samples with Java
## 

## run via '. setup.sh'
## 
## Set TIBEMS_ROOT to the root of your installation of
## TIBCO Enterprise Message Service software
## 

if [ -z "${TIBEMS_ROOT}" ]
then
TIBEMS_ROOT=../..
fi

## 
## You should not need to change the text below
## 

TIBEMS_JAVA=${TIBEMS_ROOT}/lib

if [ ! -d ${TIBEMS_ROOT} ]
then
    echo "The TIBEMS_ROOT variable (${TIBEMS_ROOT}) does not correctly "
    echo "specify the root directory of the TIBCO Enterprise Message Service "
    echo "software."
    echo "Please correct the TIBEMS_ROOT variable at the beginning "
    echo "of this script."
    return
fi

if [ ! -f ${TIBEMS_JAVA}/jakarta.jms-api-2.0.3.jar ]
then
    echo "${TIBEMS_JAVA}/jakarta.jms-api-2.0.3.jar file not found."
    return
fi

if [ ! -f ${TIBEMS_JAVA}/tibjms.jar ]
then
    echo "${TIBEMS_JAVA}/tibjms.jar file not found."
    return
fi

if [ ! -f ${TIBEMS_JAVA}/tibjmsadmin.jar ]
then
    echo "${TIBEMS_JAVA}/tibjmsadmin.jar file not found."
    return
fi

CLASSPATH=${TIBEMS_JAVA}/jakarta.jms-api-2.0.3.jar:${CLASSPATH}
CLASSPATH=.:${TIBEMS_JAVA}/tibjms.jar:${TIBEMS_JAVA}/tibjmsadmin.jar:${CLASSPATH}
CLASSPATH=${TIBEMS_JAVA}/tibjmsufo.jar:${CLASSPATH}

export CLASSPATH
