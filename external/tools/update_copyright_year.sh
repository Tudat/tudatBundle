#!/bin/sh
#   Copyright (c) 2010-2018, Delft University of Technology
#   All rigths reserved
#
#   This file is part of the Tudat. Redistribution and use in source and
#   binary forms, with or without modification, are permitted exclusively
#   under the terms of the Modified BSD license. You should have received
#   a copy of the license with this file. If not, please or visit:
#   http://tudat.tudelft.nl/LICENSE.
find . -not -path '*/\.git*' -type f -exec \
    sed -i 's/Copyright\s(c)\s[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9],\sDelft\sUniversity\sof\sTechnology/Copyright (c) 2010-'"$(date +'%Y')"', Delft University of Technology/g' {} +
