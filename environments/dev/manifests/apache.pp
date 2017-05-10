include apache
apache::mod {
	[
		'proxy',
		'actions',
		'proxy_fcgi',
		'rewrite'
	]:
		package_ensure => 'present'
}

###########################
# add vhost to apache
###########################
apache::vhost { 'typo3base.dev - non-ssl':
	servername      => 'typo3base.dev',
	port            => '80',
	docroot         => '/var/www/typo3base',
	docroot_owner   => 'ubuntu',
	docroot_group   => 'ubuntu',
	redirect_status => 'permanent',
	redirect_dest   => 'https://typo3base.dev/'
}

apache::vhost { 'typo3base.dev':
	port            => '443',
	docroot         => '/var/www/typo3base/web',
	docroot_owner   => 'ubuntu',
	docroot_group   => 'ubuntu',
	directories     => [
		{ path             => '/var/www/typo3base/web',
			directoryindex => '/index.php index.php',
			allow_override => 'All',
			require        => 'all granted'
		},
	],
	error_log_file  => "typo3base.dev.log",
	custom_fragment => 'ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:9000/var/www/typo3base/web/$1',
	ssl             => true,
	ssl_cert        => '/vagrant/environments/dev/files/typo3base.dev.cert',
	ssl_key         => '/vagrant/environments/dev/files/typo3base.dev.key',
}
