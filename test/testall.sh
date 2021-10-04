#!/bin/bash
#** (C) Copyright 2013, Applied Physical Sciences Corp., A General Dynamics Company
#**
#** Gravity is free software; you can redistribute it and/or modify
#** it under the terms of the GNU Lesser General Public License as published by
#** the Free Software Foundation; either version 3 of the License, or
#** (at your option) any later version.
#**
#** This program is distributed in the hope that it will be useful,
#** but WITHOUT ANY WARRANTY; without even the implied warranty of
#** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#** GNU Lesser General Public License for more details.
#**
#** You should have received a copy of the GNU Lesser General Public
#** License along with this program;
#** If not, see <http://www.gnu.org/licenses/>.
#**

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $SCRIPT_DIR

for script in `find . -name test.sh`
do
    echo Running $script
    echo
    chmod +x $script
    timeout 300 $script
    ret=$?
    if [ $ret == 124 ]; then
        echo test timed out
    fi

    if [ $ret != 0 ]; then
        echo test failed with error code $ret
        exit $ret
    fi

    echo
    echo Success!
done

popd 

echo
echo All tests completed Successfully
echo
