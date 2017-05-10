typo3base vagrant
=================

# Description

This lamp stack can be used for the project: https://github.com/vonZnotz/typo3base

All files are synced from "share" to "/var/www/typo3base". The owner of the files is "ubuntu". If you need special
write permissions in you application, you have to resolve this by hand.

# Installation

## Resolve dependencies

Make use of librarian-puppet to get avoid of git submodules

https://github.com/voxpupuli/librarian-puppet

	cd environments/dev
	librarian-puppet install

You're done!

## Create the share folder

The project uses "rsync" to share files. You need to create a "share" item (link or folder)  to get rsyncswork.

## Make it run

	vagrant up

## Machine data

IP: 192.168.56.212

OS: Ubuntu/Xenial 64

Apache ServerName: typo3base.dev

PHP Version 7.1 (fpm)

MailHog - current (http://typo3base.dev:8025)

## SSH user

Username: ubuntu

Password: start100

## MySQL user

Username: root

Password: start100
