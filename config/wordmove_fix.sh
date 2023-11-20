#!/bin/bash
#
# The MIT License (MIT)
# Copyright (c) Kiyo Chinzei (kchinzei@gmail.com)
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

GEMDIR=`gem env gemdir`
WM_VER=5.2.2
WM_PATH=`find ${GEMDIR}/gems -name wordmove-${WM_VER} -print`/lib/wordmove

ERB_FILE=dump.php.erb
PATCH_FILE=dump_patch.txt

ERB_PATH=${WM_PATH}/assets/${ERB_FILE}
ERB_ORG=${ERB_PATH}.org

# Start patch.
mv ${ERB_PATH} ${ERB_ORG}
patch -o ${ERB_PATH} ${ERB_ORG} ${PATCH_FILE}
