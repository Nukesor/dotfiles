#!/bin/bash

sudo tee /sys/class/backlight/acpi_video0/brightness <<< $1
