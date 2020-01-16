#!/bin/bash

currentHostName=$(hostname)
export hostname="ldnpsr2937.intranet.barcapint.com"
if [ "${currentHostName}" != "${hostname}" ]; then
	sudo hostnamectl set-hostname ${hostname}
else
	echo -e "hostname already set!.Avoding reapply.."
fi
exit 0
