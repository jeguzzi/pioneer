#!/bin/sh

ifdown wlan0
ifup wlan0=drone_wifi
