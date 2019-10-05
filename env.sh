#!/bin/bash

if [ $1 = "start" ]; then
	if [ ! -f db/trac.db ]; then
		cp db/trac-initial.db db/trac.db
	fi
	docker-compose up -d
fi

if [ $1 = "restart" ]; then
	docker-compose down
	if [ ! -f db/trac.db ]; then
		cp db/trac-initial.db db/trac.db
	fi
	docker-compose up -d
fi

if [ $1 = "stop" ]; then
	docker-compose down
fi
