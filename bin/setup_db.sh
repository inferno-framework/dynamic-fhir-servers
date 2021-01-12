#!/bin/sh

bin/rake db:prepare
bin/rake db:seed json_file='package'
bin/rake db:seed json_file='synthea'
