#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/uart_cli.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/uart_cli.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
<<<<<<< HEAD
SOURCEFILES_QUOTED_IF_SPACED=src/leddrv.c src/swdrv.c src/isruartdrv.c ../../FreeRTOS/Source/list.c ../../FreeRTOS/Source/queue.c ../../FreeRTOS/Source/tasks.c ../../FreeRTOS/Source/portable/MemMang/heap_2.c ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S src/main.c src/myTasks.c src/isr_registry.S src/ButtonPollingTask.c src/ElevatorControl.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/leddrv.o ${OBJECTDIR}/src/swdrv.o ${OBJECTDIR}/src/isruartdrv.o ${OBJECTDIR}/_ext/1147412712/list.o ${OBJECTDIR}/_ext/1147412712/queue.o ${OBJECTDIR}/_ext/1147412712/tasks.o ${OBJECTDIR}/_ext/1386115845/heap_2.o ${OBJECTDIR}/_ext/843873358/port.o ${OBJECTDIR}/_ext/843873358/port_asm.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/myTasks.o ${OBJECTDIR}/src/isr_registry.o ${OBJECTDIR}/src/ButtonPollingTask.o ${OBJECTDIR}/src/ElevatorControl.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/leddrv.o.d ${OBJECTDIR}/src/swdrv.o.d ${OBJECTDIR}/src/isruartdrv.o.d ${OBJECTDIR}/_ext/1147412712/list.o.d ${OBJECTDIR}/_ext/1147412712/queue.o.d ${OBJECTDIR}/_ext/1147412712/tasks.o.d ${OBJECTDIR}/_ext/1386115845/heap_2.o.d ${OBJECTDIR}/_ext/843873358/port.o.d ${OBJECTDIR}/_ext/843873358/port_asm.o.d ${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/myTasks.o.d ${OBJECTDIR}/src/isr_registry.o.d ${OBJECTDIR}/src/ButtonPollingTask.o.d ${OBJECTDIR}/src/ElevatorControl.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/leddrv.o ${OBJECTDIR}/src/swdrv.o ${OBJECTDIR}/src/isruartdrv.o ${OBJECTDIR}/_ext/1147412712/list.o ${OBJECTDIR}/_ext/1147412712/queue.o ${OBJECTDIR}/_ext/1147412712/tasks.o ${OBJECTDIR}/_ext/1386115845/heap_2.o ${OBJECTDIR}/_ext/843873358/port.o ${OBJECTDIR}/_ext/843873358/port_asm.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/myTasks.o ${OBJECTDIR}/src/isr_registry.o ${OBJECTDIR}/src/ButtonPollingTask.o ${OBJECTDIR}/src/ElevatorControl.o

# Source Files
SOURCEFILES=src/leddrv.c src/swdrv.c src/isruartdrv.c ../../FreeRTOS/Source/list.c ../../FreeRTOS/Source/queue.c ../../FreeRTOS/Source/tasks.c ../../FreeRTOS/Source/portable/MemMang/heap_2.c ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S src/main.c src/myTasks.c src/isr_registry.S src/ButtonPollingTask.c src/ElevatorControl.c
=======
SOURCEFILES_QUOTED_IF_SPACED=src/leddrv.c src/swdrv.c src/isruartdrv.c ../../FreeRTOS/Source/list.c ../../FreeRTOS/Source/queue.c ../../FreeRTOS/Source/tasks.c ../../FreeRTOS/Source/portable/MemMang/heap_2.c ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S src/main.c src/myTasks.c src/isr_registry.S

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/leddrv.o ${OBJECTDIR}/src/swdrv.o ${OBJECTDIR}/src/isruartdrv.o ${OBJECTDIR}/_ext/1147412712/list.o ${OBJECTDIR}/_ext/1147412712/queue.o ${OBJECTDIR}/_ext/1147412712/tasks.o ${OBJECTDIR}/_ext/1386115845/heap_2.o ${OBJECTDIR}/_ext/843873358/port.o ${OBJECTDIR}/_ext/843873358/port_asm.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/myTasks.o ${OBJECTDIR}/src/isr_registry.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/leddrv.o.d ${OBJECTDIR}/src/swdrv.o.d ${OBJECTDIR}/src/isruartdrv.o.d ${OBJECTDIR}/_ext/1147412712/list.o.d ${OBJECTDIR}/_ext/1147412712/queue.o.d ${OBJECTDIR}/_ext/1147412712/tasks.o.d ${OBJECTDIR}/_ext/1386115845/heap_2.o.d ${OBJECTDIR}/_ext/843873358/port.o.d ${OBJECTDIR}/_ext/843873358/port_asm.o.d ${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/myTasks.o.d ${OBJECTDIR}/src/isr_registry.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/leddrv.o ${OBJECTDIR}/src/swdrv.o ${OBJECTDIR}/src/isruartdrv.o ${OBJECTDIR}/_ext/1147412712/list.o ${OBJECTDIR}/_ext/1147412712/queue.o ${OBJECTDIR}/_ext/1147412712/tasks.o ${OBJECTDIR}/_ext/1386115845/heap_2.o ${OBJECTDIR}/_ext/843873358/port.o ${OBJECTDIR}/_ext/843873358/port_asm.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/myTasks.o ${OBJECTDIR}/src/isr_registry.o

# Source Files
SOURCEFILES=src/leddrv.c src/swdrv.c src/isruartdrv.c ../../FreeRTOS/Source/list.c ../../FreeRTOS/Source/queue.c ../../FreeRTOS/Source/tasks.c ../../FreeRTOS/Source/portable/MemMang/heap_2.c ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S src/main.c src/myTasks.c src/isr_registry.S
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/uart_cli.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX360F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/843873358/port_asm.o: ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/843873358" 
	@${RM} ${OBJECTDIR}/_ext/843873358/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/843873358/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/843873358/port_asm.o.ok ${OBJECTDIR}/_ext/843873358/port_asm.o.err 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/843873358/port_asm.o.d" "${OBJECTDIR}/_ext/843873358/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/843873358/port_asm.o.d"  -o ${OBJECTDIR}/_ext/843873358/port_asm.o ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/843873358/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_REAL_ICE=1
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/843873358/port_asm.o.d" "${OBJECTDIR}/_ext/843873358/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/843873358/port_asm.o.d"  -o ${OBJECTDIR}/_ext/843873358/port_asm.o ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/843873358/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_REAL_ICE=1
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/src/isr_registry.o: src/isr_registry.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/isr_registry.o.d 
	@${RM} ${OBJECTDIR}/src/isr_registry.o 
	@${RM} ${OBJECTDIR}/src/isr_registry.o.ok ${OBJECTDIR}/src/isr_registry.o.err 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/isr_registry.o.d" "${OBJECTDIR}/src/isr_registry.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/isr_registry.o.d"  -o ${OBJECTDIR}/src/isr_registry.o src/isr_registry.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/src/isr_registry.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_REAL_ICE=1
=======
	@${FIXDEPS} "${OBJECTDIR}/src/isr_registry.o.d" "${OBJECTDIR}/src/isr_registry.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/isr_registry.o.d"  -o ${OBJECTDIR}/src/isr_registry.o src/isr_registry.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/src/isr_registry.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_REAL_ICE=1
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
else
${OBJECTDIR}/_ext/843873358/port_asm.o: ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/843873358" 
	@${RM} ${OBJECTDIR}/_ext/843873358/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/843873358/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/843873358/port_asm.o.ok ${OBJECTDIR}/_ext/843873358/port_asm.o.err 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/843873358/port_asm.o.d" "${OBJECTDIR}/_ext/843873358/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/843873358/port_asm.o.d"  -o ${OBJECTDIR}/_ext/843873358/port_asm.o ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/843873358/port_asm.o.asm.d",--gdwarf-2
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/843873358/port_asm.o.d" "${OBJECTDIR}/_ext/843873358/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/843873358/port_asm.o.d"  -o ${OBJECTDIR}/_ext/843873358/port_asm.o ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/843873358/port_asm.o.asm.d",--gdwarf-2
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/src/isr_registry.o: src/isr_registry.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/isr_registry.o.d 
	@${RM} ${OBJECTDIR}/src/isr_registry.o 
	@${RM} ${OBJECTDIR}/src/isr_registry.o.ok ${OBJECTDIR}/src/isr_registry.o.err 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/isr_registry.o.d" "${OBJECTDIR}/src/isr_registry.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/isr_registry.o.d"  -o ${OBJECTDIR}/src/isr_registry.o src/isr_registry.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/src/isr_registry.o.asm.d",--gdwarf-2
=======
	@${FIXDEPS} "${OBJECTDIR}/src/isr_registry.o.d" "${OBJECTDIR}/src/isr_registry.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/isr_registry.o.d"  -o ${OBJECTDIR}/src/isr_registry.o src/isr_registry.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/src/isr_registry.o.asm.d",--gdwarf-2
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/leddrv.o: src/leddrv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/leddrv.o.d 
	@${RM} ${OBJECTDIR}/src/leddrv.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/leddrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/leddrv.o.d" -o ${OBJECTDIR}/src/leddrv.o src/leddrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/src/leddrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/leddrv.o.d" -o ${OBJECTDIR}/src/leddrv.o src/leddrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/src/swdrv.o: src/swdrv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/swdrv.o.d 
	@${RM} ${OBJECTDIR}/src/swdrv.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/swdrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/swdrv.o.d" -o ${OBJECTDIR}/src/swdrv.o src/swdrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/src/swdrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/swdrv.o.d" -o ${OBJECTDIR}/src/swdrv.o src/swdrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/src/isruartdrv.o: src/isruartdrv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/isruartdrv.o.d 
	@${RM} ${OBJECTDIR}/src/isruartdrv.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/isruartdrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/isruartdrv.o.d" -o ${OBJECTDIR}/src/isruartdrv.o src/isruartdrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/src/isruartdrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/isruartdrv.o.d" -o ${OBJECTDIR}/src/isruartdrv.o src/isruartdrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/_ext/1147412712/list.o: ../../FreeRTOS/Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1147412712" 
	@${RM} ${OBJECTDIR}/_ext/1147412712/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1147412712/list.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/1147412712/list.o.d" -o ${OBJECTDIR}/_ext/1147412712/list.o ../../FreeRTOS/Source/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/1147412712/list.o.d" -o ${OBJECTDIR}/_ext/1147412712/list.o ../../FreeRTOS/Source/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/_ext/1147412712/queue.o: ../../FreeRTOS/Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1147412712" 
	@${RM} ${OBJECTDIR}/_ext/1147412712/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1147412712/queue.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/1147412712/queue.o.d" -o ${OBJECTDIR}/_ext/1147412712/queue.o ../../FreeRTOS/Source/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/1147412712/queue.o.d" -o ${OBJECTDIR}/_ext/1147412712/queue.o ../../FreeRTOS/Source/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/_ext/1147412712/tasks.o: ../../FreeRTOS/Source/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1147412712" 
	@${RM} ${OBJECTDIR}/_ext/1147412712/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1147412712/tasks.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/1147412712/tasks.o.d" -o ${OBJECTDIR}/_ext/1147412712/tasks.o ../../FreeRTOS/Source/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/1147412712/tasks.o.d" -o ${OBJECTDIR}/_ext/1147412712/tasks.o ../../FreeRTOS/Source/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/_ext/1386115845/heap_2.o: ../../FreeRTOS/Source/portable/MemMang/heap_2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386115845" 
	@${RM} ${OBJECTDIR}/_ext/1386115845/heap_2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1386115845/heap_2.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/1386115845/heap_2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/1386115845/heap_2.o.d" -o ${OBJECTDIR}/_ext/1386115845/heap_2.o ../../FreeRTOS/Source/portable/MemMang/heap_2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/1386115845/heap_2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/1386115845/heap_2.o.d" -o ${OBJECTDIR}/_ext/1386115845/heap_2.o ../../FreeRTOS/Source/portable/MemMang/heap_2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/_ext/843873358/port.o: ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/843873358" 
	@${RM} ${OBJECTDIR}/_ext/843873358/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/843873358/port.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/843873358/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/843873358/port.o.d" -o ${OBJECTDIR}/_ext/843873358/port.o ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/843873358/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/843873358/port.o.d" -o ${OBJECTDIR}/_ext/843873358/port.o ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/src/myTasks.o: src/myTasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/myTasks.o.d 
	@${RM} ${OBJECTDIR}/src/myTasks.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/myTasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/myTasks.o.d" -o ${OBJECTDIR}/src/myTasks.o src/myTasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/src/ButtonPollingTask.o: src/ButtonPollingTask.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ButtonPollingTask.o.d 
	@${RM} ${OBJECTDIR}/src/ButtonPollingTask.o 
	@${FIXDEPS} "${OBJECTDIR}/src/ButtonPollingTask.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/ButtonPollingTask.o.d" -o ${OBJECTDIR}/src/ButtonPollingTask.o src/ButtonPollingTask.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/src/ElevatorControl.o: src/ElevatorControl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ElevatorControl.o.d 
	@${RM} ${OBJECTDIR}/src/ElevatorControl.o 
	@${FIXDEPS} "${OBJECTDIR}/src/ElevatorControl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/ElevatorControl.o.d" -o ${OBJECTDIR}/src/ElevatorControl.o src/ElevatorControl.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/src/myTasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_REAL_ICE=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/myTasks.o.d" -o ${OBJECTDIR}/src/myTasks.o src/myTasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
else
${OBJECTDIR}/src/leddrv.o: src/leddrv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/leddrv.o.d 
	@${RM} ${OBJECTDIR}/src/leddrv.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/leddrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/leddrv.o.d" -o ${OBJECTDIR}/src/leddrv.o src/leddrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/src/leddrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/leddrv.o.d" -o ${OBJECTDIR}/src/leddrv.o src/leddrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/src/swdrv.o: src/swdrv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/swdrv.o.d 
	@${RM} ${OBJECTDIR}/src/swdrv.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/swdrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/swdrv.o.d" -o ${OBJECTDIR}/src/swdrv.o src/swdrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/src/swdrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/swdrv.o.d" -o ${OBJECTDIR}/src/swdrv.o src/swdrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/src/isruartdrv.o: src/isruartdrv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/isruartdrv.o.d 
	@${RM} ${OBJECTDIR}/src/isruartdrv.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/isruartdrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/isruartdrv.o.d" -o ${OBJECTDIR}/src/isruartdrv.o src/isruartdrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/src/isruartdrv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/isruartdrv.o.d" -o ${OBJECTDIR}/src/isruartdrv.o src/isruartdrv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/_ext/1147412712/list.o: ../../FreeRTOS/Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1147412712" 
	@${RM} ${OBJECTDIR}/_ext/1147412712/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1147412712/list.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/1147412712/list.o.d" -o ${OBJECTDIR}/_ext/1147412712/list.o ../../FreeRTOS/Source/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/1147412712/list.o.d" -o ${OBJECTDIR}/_ext/1147412712/list.o ../../FreeRTOS/Source/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/_ext/1147412712/queue.o: ../../FreeRTOS/Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1147412712" 
	@${RM} ${OBJECTDIR}/_ext/1147412712/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1147412712/queue.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/1147412712/queue.o.d" -o ${OBJECTDIR}/_ext/1147412712/queue.o ../../FreeRTOS/Source/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/1147412712/queue.o.d" -o ${OBJECTDIR}/_ext/1147412712/queue.o ../../FreeRTOS/Source/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/_ext/1147412712/tasks.o: ../../FreeRTOS/Source/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1147412712" 
	@${RM} ${OBJECTDIR}/_ext/1147412712/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1147412712/tasks.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/1147412712/tasks.o.d" -o ${OBJECTDIR}/_ext/1147412712/tasks.o ../../FreeRTOS/Source/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/1147412712/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/1147412712/tasks.o.d" -o ${OBJECTDIR}/_ext/1147412712/tasks.o ../../FreeRTOS/Source/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/_ext/1386115845/heap_2.o: ../../FreeRTOS/Source/portable/MemMang/heap_2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1386115845" 
	@${RM} ${OBJECTDIR}/_ext/1386115845/heap_2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1386115845/heap_2.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/1386115845/heap_2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/1386115845/heap_2.o.d" -o ${OBJECTDIR}/_ext/1386115845/heap_2.o ../../FreeRTOS/Source/portable/MemMang/heap_2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/1386115845/heap_2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/1386115845/heap_2.o.d" -o ${OBJECTDIR}/_ext/1386115845/heap_2.o ../../FreeRTOS/Source/portable/MemMang/heap_2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/_ext/843873358/port.o: ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/843873358" 
	@${RM} ${OBJECTDIR}/_ext/843873358/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/843873358/port.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/_ext/843873358/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/_ext/843873358/port.o.d" -o ${OBJECTDIR}/_ext/843873358/port.o ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/_ext/843873358/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/_ext/843873358/port.o.d" -o ${OBJECTDIR}/_ext/843873358/port.o ../../FreeRTOS/Source/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
${OBJECTDIR}/src/myTasks.o: src/myTasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/myTasks.o.d 
	@${RM} ${OBJECTDIR}/src/myTasks.o 
<<<<<<< HEAD
	@${FIXDEPS} "${OBJECTDIR}/src/myTasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/myTasks.o.d" -o ${OBJECTDIR}/src/myTasks.o src/myTasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/src/ButtonPollingTask.o: src/ButtonPollingTask.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ButtonPollingTask.o.d 
	@${RM} ${OBJECTDIR}/src/ButtonPollingTask.o 
	@${FIXDEPS} "${OBJECTDIR}/src/ButtonPollingTask.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/ButtonPollingTask.o.d" -o ${OBJECTDIR}/src/ButtonPollingTask.o src/ButtonPollingTask.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/src/ElevatorControl.o: src/ElevatorControl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ElevatorControl.o.d 
	@${RM} ${OBJECTDIR}/src/ElevatorControl.o 
	@${FIXDEPS} "${OBJECTDIR}/src/ElevatorControl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -I"include" -MMD -MF "${OBJECTDIR}/src/ElevatorControl.o.d" -o ${OBJECTDIR}/src/ElevatorControl.o src/ElevatorControl.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
=======
	@${FIXDEPS} "${OBJECTDIR}/src/myTasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"./include" -I"../../FreeRTOS/Source/include" -I"../../FreeRTOS/Source/portable/MPLAB/PIC32MX" -I"../../FreeRTOS-Plus-CLI" -MMD -MF "${OBJECTDIR}/src/myTasks.o.d" -o ${OBJECTDIR}/src/myTasks.o src/myTasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
>>>>>>> d21edf9bb8704bb4e9691e1b03cfab57b2fd211e
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/uart_cli.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_REAL_ICE=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/uart_cli.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_REAL_ICE=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/uart_cli.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/uart_cli.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/uart_cli.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
