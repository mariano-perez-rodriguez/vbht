#! /usr/bin/env bash

##
## vbht.sleepbtn.sh - forward a sleep button ACPI event to vbht
## Copyright (C) 2012  Mariano Perez Rodriguez
##
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU Affero General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU Affero General Public License for more details.
##
## You should have received a copy of the GNU Affero General Public License
## along with this program. If not, see <http://www.gnu.org/licenses>.
##

set +H  # DISABLE HISTORY EXPANSION FOR CRYING OUT LOUD!!!

# if there's a vbht instance running, forward the event,
if [[ "$(/opt/vbht/vbht info -M)" != '' ]]; then
  exec /opt/vbht/vbht forward sleep > /dev/null 2> /dev/null
# otherwise, just call the old ACPI handler
else
  exec /etc/acpi/pre-vbht-sleepbtn.sh
fi

