##!/bin/bash

INTERNAL="eDP-1"
EXTERNAL="HDMI-A-1"

if hyprctl monitors | grep -q "$EXTERNAL"; then
    hyprctl keyword monitor "$INTERNAL,disable"
else
    hyprctl keyword monitor "$INTERNAL,preferred,auto,1"
fi
