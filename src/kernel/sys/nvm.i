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

/**
 * Start the file non-volatile memory.
 */
static int start_nvm(void)
{
    int res;

    if (nvm_module_init() != 0) {
        return (-1);
    }

    LOG_OBJECT_PRINT(NULL,
                     LOG_INFO,
                     OSTR("Mounting the non-volatile memory...\r\n"));
    res = nvm_mount();

    if (res != 0) {
        LOG_OBJECT_PRINT(NULL, LOG_INFO, OSTR("failed.\r\n"));
        LOG_OBJECT_PRINT(NULL,
                         LOG_INFO,
                         OSTR("Formatting the non-volatile memory...\r\n"));
        res = nvm_format();

        if (res != 0) {
            LOG_OBJECT_PRINT(NULL, LOG_INFO, OSTR("failed.\r\n"));
            return (-1);
        }

        LOG_OBJECT_PRINT(NULL, LOG_INFO, OSTR("done.\r\n"));
        LOG_OBJECT_PRINT(NULL,
                         LOG_INFO,
                         OSTR("Mounting the non-volatile memory...\r\n"));
        res = nvm_mount();

        if (res != 0) {
            LOG_OBJECT_PRINT(NULL, LOG_INFO, OSTR("failed.\r\n"));
            return (-1);
        }
    }

    LOG_OBJECT_PRINT(NULL, LOG_INFO, OSTR("done.\r\n"));

    return (0);
}
