#!/usr/bin/env python
# ----------------------------------------------------------------------
# Created: Wed 30 May 2018 23:21:14 IST
# Last-Updated: Wed 30 May 2018 23:58:01 IST
#
# get-public-license.py is part of dotfiles
# URL: https://github.com/justinethomas009/dotfiles
# Description:
#
# Copyright (c) 2018, Justine T Kizhakkinedath
# All rights reserved
#
# Licensed under the terms of MIT License
# See LICENSE file in the project root for full license information.
# ----------------------------------------------------------------------

import urllib
import json
import sys


def github_license(temp_var):
    # print(temp_var)
    # temp_var = "justinethomas009/dotfiles"
    url = "https://api.github.com/repos/" + temp_var + "/license"
    response = urllib.urlopen(url)
    data = json.loads(response.read())
    print data["license"]["name"]


if __name__ == "__main__":
    github_license(sys.argv[1])
