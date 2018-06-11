/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2014-2018, Erik Moqvist
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * This file is part of the Simba project.
 */

#include <avr/eeprom.h>

uint8_t nvm_eeprom_area[CONFIG_NVM_SIZE]
__attribute__ ((section (".eeprom"), weak));

static int nvm_port_module_init()
{
    return (0);
}

static int nvm_port_mount()
{
    return (0);
}

static int nvm_port_format()
{
    return (0);
}

static ssize_t nvm_port_read(void *dst_p, size_t src, size_t size)
{
    eeprom_read_block(dst_p, &nvm_eeprom_area[src], size);

    return (size);
}

static ssize_t nvm_port_write(size_t dst, const void *src_p, size_t size)
{
    eeprom_update_block(src_p, &nvm_eeprom_area[dst], size);

    return (size);
}
