#
# @file Makefile
# @version 4.1.0
#
# @section License
# Copyright (C) 2014-2016, Erik Moqvist
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# This file is part of the Simba project.
#

.PHONY: tags doc

SIMBA_VERSION ?= $(shell cat VERSION.txt)

BOARD ?= linux

ifeq ($(BOARD), linux)
    TESTS = $(addprefix tst/kernel/, sys \
                                     thrd \
                                     time \
                                     timer)
    TESTS += $(addprefix tst/sync/, bus \
                                    event \
                                    queue \
                                    rwlock \
                                    sem)
    TESTS += $(addprefix tst/collections/, binary_tree \
                                           bits \
                                           fifo \
                                           hash_map)
    TESTS += $(addprefix tst/alloc/, circular_heap \
                                     heap)
    TESTS += $(addprefix tst/text/, configfile \
				    std \
                                    re)
    TESTS += $(addprefix tst/debug/, log)
    TESTS += $(addprefix tst/oam/, fs \
	        		   shell)
    TESTS += $(addprefix tst/storage/, fat16 \
				       setting \
                                       spiffs)
    TESTS += $(addprefix tst/encode/, base64 \
                                      json)
    TESTS += $(addprefix tst/hash/, crc \
                                    sha1)
    TESTS += $(addprefix tst/inet/, http_server \
				    http_websocket_client \
				    http_websocket_server \
				    inet \
				    mqtt_client)
    TESTS += $(addprefix tst/multimedia/, midi)
endif

ifeq ($(BOARD), arduino_due)
    TESTS = $(addprefix tst/kernel/, sys \
                                     thrd \
                                     time \
                                     timer)
    TESTS += $(addprefix tst/sync/, bus \
                                    event \
                                    queue \
                                    rwlock \
                                    sem)
    TESTS += $(addprefix tst/collections/, binary_tree \
                                           bits \
                                           fifo \
                                           hash_map)
    TESTS += $(addprefix tst/alloc/, circular_heap \
                                     heap)
    TESTS += $(addprefix tst/text/, configfile \
				    std \
                                    re)
    TESTS += $(addprefix tst/debug/, log)
    TESTS += $(addprefix tst/oam/, fs \
	        		   shell)
    TESTS += $(addprefix tst/storage/, setting \
                                       spiffs)
    TESTS += $(addprefix tst/encode/, base64 \
                                      json)
    TESTS += $(addprefix tst/hash/, crc \
                                    sha1)
    TESTS += $(addprefix tst/inet/, http_server \
				    http_websocket_client \
				    http_websocket_server \
				    inet \
				    mqtt_client)
    TESTS += $(addprefix tst/drivers/, chipid \
				       can \
				       flash)
endif

ifeq ($(BOARD), arduino_mega)
    TESTS = $(addprefix tst/kernel/, sys \
                                     thrd \
                                     time \
                                     timer)
    TESTS += $(addprefix tst/sync/, bus \
                                    event \
                                    queue \
                                    rwlock \
                                    sem)
    TESTS += $(addprefix tst/collections/, binary_tree \
                                           bits \
                                           fifo \
                                           hash_map)
    TESTS += $(addprefix tst/alloc/, circular_heap \
                                     heap)
    TESTS += $(addprefix tst/text/, configfile \
				    std \
                                    re)
    TESTS += $(addprefix tst/debug/, log)
    TESTS += $(addprefix tst/oam/, fs \
	        		   shell)
    TESTS += $(addprefix tst/storage/, fat16 \
				       setting)
    TESTS += $(addprefix tst/encode/, base64 \
                                      json)
    TESTS += $(addprefix tst/hash/, crc \
                                    sha1)
    TESTS += $(addprefix tst/inet/, http_server \
				    http_websocket_client \
				    http_websocket_server \
				    inet \
				    mqtt_client)
    TESTS += $(addprefix tst/drivers/, adc \
				       ds3231 \
				       sd)
endif

ifeq ($(BOARD), arduino_nano)
    TESTS = $(addprefix tst/drivers/, ds18b20 \
				      exti \
				      owi \
				      pin)
    APPS = $(addprefix tst/drivers/, uart)
endif

ifeq ($(BOARD), arduino_pro_micro)
    TESTS = $(addprefix tst/kernel/, sys \
                                     thrd \
                                     timer)
endif

ifeq ($(BOARD), esp01)
    TESTS = $(addprefix tst/kernel/, sys \
                                     thrd \
                                     timer)
endif

ifeq ($(BOARD), esp12e)
    TESTS = $(addprefix tst/kernel/, sys \
                                     thrd \
                                     timer)
    TESTS += $(addprefix tst/sync/, bus \
                                    event \
                                    queue \
                                    rwlock \
                                    sem)
    TESTS += $(addprefix tst/collections/, binary_tree \
                                           bits \
                                           fifo \
                                           hash_map)
    TESTS += $(addprefix tst/alloc/, circular_heap)
    TESTS += $(addprefix tst/text/, std \
                                    re)
    TESTS += $(addprefix tst/debug/, log)
    TESTS += $(addprefix tst/oam/, fs \
	        		   shell)
    TESTS += $(addprefix tst/encode/, base64 \
                                      json)
    TESTS += $(addprefix tst/hash/, crc \
                                    sha1)
    TESTS += $(addprefix tst/inet/, http_websocket_client \
				    http_websocket_server \
				    inet \
				    mqtt_client \
				    network_interface/wifi_station_espressif)
endif

ifeq ($(BOARD), stm32vldiscovery)
    TESTS = $(addprefix tst/kernel/, sys \
                                     thrd \
                                     timer)
    TESTS += $(addprefix tst/sync/, bus \
                                    event \
                                    queue \
                                    rwlock \
                                    sem)
    TESTS += $(addprefix tst/collections/, binary_tree \
                                           bits \
                                           fifo \
                                           hash_map)
    TESTS += $(addprefix tst/alloc/, circular_heap)
    TESTS += $(addprefix tst/text/, std \
                                    re)
    TESTS += $(addprefix tst/debug/, log)
    TESTS += $(addprefix tst/oam/, fs \
	        		   shell)
    TESTS += $(addprefix tst/encode/, base64 \
                                      json)
    TESTS += $(addprefix tst/hash/, crc \
                                    sha1)
    TESTS += $(addprefix tst/inet/, http_websocket_client \
				    http_websocket_server \
				    inet \
				    mqtt_client)
endif

ifeq ($(BOARD), photon)
    TESTS = $(addprefix tst/kernel/, sys \
                                     thrd \
				     time \
                                     timer)
    TESTS += $(addprefix tst/sync/, bus \
                                    event \
                                    queue \
                                    rwlock \
                                    sem)
    TESTS += $(addprefix tst/collections/, binary_tree \
                                           bits \
                                           fifo \
                                           hash_map)
    TESTS += $(addprefix tst/alloc/, circular_heap)
    TESTS += $(addprefix tst/text/, std \
                                    re)
    TESTS += $(addprefix tst/debug/, log)
    TESTS += $(addprefix tst/oam/, fs \
	        		   shell)
    TESTS += $(addprefix tst/encode/, base64 \
                                      json)
    TESTS += $(addprefix tst/hash/, crc \
                                    sha1)
    TESTS += $(addprefix tst/inet/, http_websocket_client \
				    http_websocket_server \
				    inet \
				    mqtt_client)
endif

# List of all application to build
APPS += $(TESTS)

all: $(APPS:%=%.all)

release: $(APPS:%=%.release)

clean: $(APPS:%=%.clean)

run: all
	for test in $(TESTS) ; do \
	    $(MAKE) -C $$test run || exit 1 ; \
	done

size: $(TESTS:%=%.size)

report:
	for test in $(TESTS) ; do \
	    $(MAKE) -C $(basename $$test) report ; \
	    echo ; \
	done

test: run
	$(MAKE) report

coverage: $(TESTS:%=%.cov)
	lcov $(TESTS:%=-a %/coverage.info) -o coverage.info
	genhtml coverage.info
	@echo
	@echo "Run 'firefox index.html' to open the coverage report in a web browser."
	@echo

jenkins-coverage: $(TESTS:%=%.jc)

travis:
	$(MAKE) test

release-test:
	+bin/release.py

clean-arduino-due:
	$(MAKE) BOARD=arduino_due SERIAL_PORT=/dev/simba-arduino_due clean

clean-arduino-mega:
	$(MAKE) BOARD=arduino_mega SERIAL_PORT=/dev/simba-arduino_mega clean

clean-arduino-nano:
	$(MAKE) BOARD=arduino_nano SERIAL_PORT=/dev/simba-arduino_nano clean

clean-arduino-pro-micro:
	$(MAKE) BOARD=arduino_pro_micro SERIAL_PORT=/dev/simba-arduino_pro_micro clean

clean-esp01:
	$(MAKE) BOARD=esp01 SERIAL_PORT=/dev/simba-esp01 clean

clean-esp12e:
	$(MAKE) BOARD=esp12e SERIAL_PORT=/dev/simba-esp12e clean

clean-stm32vldiscovery:
	$(MAKE) BOARD=stm32vldiscovery SERIAL_PORT=/dev/simba-stm32vldiscovery clean

clean-photon:
	$(MAKE) BOARD=photon SERIAL_PORT=/dev/simba-photon clean

test-arduino-due:
	@echo "Arduino Due"
	$(MAKE) BOARD=arduino_due SERIAL_PORT=/dev/simba-arduino_due test

test-arduino-mega:
	@echo "Arduino Mega"
	$(MAKE) BOARD=arduino_mega SERIAL_PORT=/dev/simba-arduino_mega test

test-arduino-nano:
	@echo "Arduino Nano"
	$(MAKE) BOARD=arduino_nano SERIAL_PORT=/dev/simba-arduino_nano test

test-arduino-pro-micro:
	@echo "Arduino Pro Micro"
	$(MAKE) BOARD=arduino_pro_micro SERIAL_PORT=/dev/simba-arduino_pro_micro test

test-esp01:
	@echo "ESP-01"
	$(MAKE) BOARD=esp01 SERIAL_PORT=/dev/simba-esp01 test

test-esp12e:
	@echo "ESP12-E"
	$(MAKE) BOARD=esp12e SERIAL_PORT=/dev/simba-esp12e test

test-stm32vldiscovery:
	@echo "STM32VLDISCOVERY"
	$(MAKE) BOARD=stm32vldiscovery SERIAL_PORT=/dev/simba-stm32vldiscovery test

test-photon:
	@echo "Photon"
	$(MAKE) BOARD=photon SERIAL_PORT=/dev/simba-photon test

test-all-boards:
	$(MAKE) test-arduino-due
	$(MAKE) test-arduino-mega
	$(MAKE) test-arduino-nano
	$(MAKE) test-arduino-pro-micro
	$(MAKE) test-esp01
	$(MAKE) test-esp12e
	$(MAKE) test-stm32vldiscovery
	$(MAKE) test-photon

clean-all-boards:
	$(MAKE) clean-arduino-due
	$(MAKE) clean-arduino-mega
	$(MAKE) clean-arduino-nano
	$(MAKE) clean-arduino-pro-micro
	$(MAKE) clean-esp01
	$(MAKE) clean-esp12e
	$(MAKE) clean-stm32vldiscovery
	$(MAKE) clean-photon

doc:
	+bin/dbgen.py > database.json
	+bin/docgen.py database.json
	$(MAKE) -s -C doc

arduino:
	+make/arduino/arduino.py --remove-outdir --version $(SIMBA_VERSION)

$(APPS:%=%.all):
	$(MAKE) -C $(basename $@) all

$(APPS:%=%.release):
	$(MAKE) -C $(basename $@) release

$(APPS:%=%.clean):
	$(MAKE) -C $(basename $@) clean

$(APPS:%=%.size):
	$(MAKE) -C $(basename $@) size

$(TESTS:%=%.report):
	$(MAKE) -C $(basename $@) report

$(TESTS:%=%.cov):
	$(MAKE) -C $(basename $@) coverage

$(TESTS:%=%.jc):
	$(MAKE) -C $(basename $@) jenkins-coverage

tags:
	echo "Creating tags file .TAGS"
	etags -o .TAGS --declarations $$(git ls-files *.[hci] | xargs)

cloc:
	cloc $$(git ls-files | xargs)

pmccabe:
	pmccabe $$(git ls-files "*.[hic]") | sort -n

help:
	@echo "--------------------------------------------------------------------------------"
	@echo "  target                      description"
	@echo "--------------------------------------------------------------------------------"
	@echo "  all                         compile and link the application"
	@echo "  clean                       remove all generated files and folders"
	@echo "  run                         run the application"
	@echo "  report                      print test report"
	@echo "  test                        run + report"
	@echo "  release                     compile with NASSERT=yes"
	@echo "  size                        print executable size information"
	@echo "  cloc                        print source code line statistics"
	@echo "  pmccabe                     print source code complexity statistics"
	@echo "  doc                         Generate the documentation."
	@echo "  help                        show this help"
	@echo
