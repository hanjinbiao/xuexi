#!/bin/bash

case $1 in
redhat)
	echo fedora;;
fedora)
	echo redhat;;
*)
	echo Usage.... >&2
esac
