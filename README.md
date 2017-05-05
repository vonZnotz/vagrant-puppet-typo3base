typo3base vagrant
=================

## Description

This is a simple lamp stack sandbox

## Installation

Make use of librarian-puppet to get avoid of git submodules

https://github.com/voxpupuli/librarian-puppet

	cd environments/dev
	librarian-puppet install

You're done!

## Create the share folder

The project uses "nfs" to share files. You need to create an empty "share" folder to get nfs work.

	mkdir share

## Make it run

	vagrant up

## Machine data

IP: 192.168.56.212

OS: Ubuntu/Xenial 64

Apache ServerName: typo3base.dev

PHP Version 7.1 (fpm)

MailHog - current (http://typo3base.dev:8025)

## SSH user

Username: typo3base

Password: start100

## MySQL user

Username: root

Password: start100
