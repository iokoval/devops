#!/bin/bash

# Test Task after deploy on server
if [ "$state" = "draining" ]
	then 
		echo "Deployment has been successfully!"
		exit 0
	else
		echo "Deployment FAILED"
		exit 1
fi
