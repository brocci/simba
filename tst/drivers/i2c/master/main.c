/**
 * @file main.c
 * @version 0.5.0
 *
 * @section License
 * Copyright (C) 2014-2016, Erik Moqvist
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * This file is part of the Simba project.
 */

#include "simba.h"

#define I2C_SLAVE_ADDRESS          0x01
#define I2C_BAD_SLAVE_ADDRESS      0x02

struct i2c_driver_t i2c;

static int test_baudrates(struct harness_t *harness_p)
{
    uint8_t value;
    int i;
    int baudrates[3] = {
        I2C_BAUDRATE_100K,
        I2C_BAUDRATE_400K,
        I2C_BAUDRATE_1MBPS
    };

    for (i = 0; i < membersof(baudrates); i++) {
        BTASSERT(i2c_init(&i2c, &i2c_0_dev, baudrates[i], -1) == 0);
        BTASSERT(i2c_start(&i2c) == 0);
        BTASSERT(i2c_read(&i2c,
                          I2C_BAD_SLAVE_ADDRESS,
                          &value,
                          1) == -1);
        BTASSERT(i2c_stop(&i2c) == 0);
    }

    return (0);
}

static int test_init(struct harness_t *harness_p)
{
    BTASSERT(i2c_init(&i2c, &i2c_0_dev, I2C_BAUDRATE_100K, -1) == 0);
    BTASSERT(i2c_start(&i2c) == 0);

    return (0);
}

static int test_bad_slave(struct harness_t *harness_p)
{
    uint8_t buf[3];

    /* Try to read three bytes from the bad slave device. Is should
       fail. */
    memset(buf, 0, sizeof(buf));

    BTASSERT(i2c_read(&i2c,
                      I2C_BAD_SLAVE_ADDRESS,
                      buf,
                      3) == -1);

    BTASSERT(i2c_write(&i2c,
                       I2C_BAD_SLAVE_ADDRESS,
                       buf,
                       3) == -1);

    return (0);
}

static int test_read(struct harness_t *harness_p)
{
    int i;
    uint8_t buf[3];

    /* Read three bytes from the slave device. */
    memset(buf, 0, sizeof(buf));

    BTASSERT(i2c_read(&i2c,
                      I2C_SLAVE_ADDRESS,
                      buf,
                      3) == 3);

    /* Print and verify the received data.*/
    for (i = 0; i < 3; i++) {
        std_printf(FSTR("[%d]: %d\r\n"), i, buf[i]);
    }

    BTASSERT(buf[0] == 5);
    BTASSERT(buf[1] == 3);
    BTASSERT(buf[2] == 1);

    return (0);
}

static int test_write(struct harness_t *harness_p)
{
    uint8_t buf[5];

    buf[0] = 1;
    buf[1] = 3;
    buf[2] = 5;
    buf[3] = 7;
    buf[4] = 9;

    /* Write 5 bytes to the slave. */
    BTASSERT(i2c_write(&i2c,
                       I2C_SLAVE_ADDRESS,
                       buf,
                       5) == 5);

    return (0);
}

static int test_echo(struct harness_t *harness_p)
{
    uint8_t value;

    /* Write ping value. */
    value = 35;

    BTASSERT(i2c_write(&i2c,
                       I2C_SLAVE_ADDRESS,
                       &value,
                       1) == 1);

    /* Read pong value (ping + 1). */
    value = 0;

    BTASSERT(i2c_read(&i2c,
                      I2C_SLAVE_ADDRESS,
                      &value,
                      1) == 1);

    /* Print and verify the value. */
    std_printf(FSTR("value = %d\r\n"), value);
    BTASSERT(value == 36);

    return (0);
}

static int test_mem_read(struct harness_t *harness_p)
{
    uint8_t address;
    uint8_t value;

    address = 0x34;

    BTASSERT(i2c_write(&i2c,
                       I2C_SLAVE_ADDRESS,
                       &address,
                       1) == 1);

    BTASSERT(i2c_read(&i2c,
                      I2C_SLAVE_ADDRESS,
                      &value,
                      1) == 1);

    BTASSERT(value == 0x54);

    return (0);
}

static int test_stop(struct harness_t *harness_p)
{
    BTASSERT(i2c_stop(&i2c) == 0);

    return (0);
}

int main()
{
    struct harness_t harness;
    struct harness_testcase_t harness_testcases[] = {
        { test_baudrates, "test_baudrates" },
        { test_init, "test_init" },
        { test_bad_slave, "test_bad_slave" },
        { test_read, "test_read" },
        { test_write, "test_write" },
        { test_echo, "test_echo" },
        { test_mem_read, "test_mem_read" },
        { test_stop, "test_stop" },
        { NULL, NULL }
    };

    sys_start();
    uart_module_init();
    i2c_module_init();

    harness_init(&harness);
    harness_run(&harness, harness_testcases);

    return (0);
}
