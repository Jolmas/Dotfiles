#!/usr/bin/env bash

sleep 1
pkill xdg-desktop-portal-kde
pkill xdg-desktop-portal-wlr
pkill sxdg-desktop-portal
/usr/libexec/xdg-desktop-portal-wlr &
sleep 2
/usr/libexec/xdg-desktop-portal &
