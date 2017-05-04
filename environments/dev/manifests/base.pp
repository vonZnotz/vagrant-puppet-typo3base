package {
	[
		"sendmail",
		"software-properties-common"
	]:
		ensure => present;
}

accounts::user { 'typo3base':
	groups  => [
		'www-data',
		'adm'
	],
	shell => '/bin/bash',
	password => '$6$FsvJM0mx$MkRjvOTE/Sxyv7PeXFU5WGUQ2GgyiYTNpjdbB3wdOgiuTeWTUR.MRXyprrW585XIE/Njt/MjseSJNnHm82uDO0',
}

file { '/var/www/typo3base':
	ensure => 'directory',
	owner  => 'typo3base',
	group  => 'typo3base',
	mode   => '0755',
}