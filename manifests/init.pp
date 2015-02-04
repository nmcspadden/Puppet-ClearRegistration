class clear_registration {
	if $::operatingsystem != 'Darwin' {
			fail('The munki_ssl module is only supported on Darwin/OS X')
	}
	
	file { "/Library/Receipts/.SetupRegComplete":
		ensure	=>	present,
		content	=>	"",
	}
	
	file { "/private/var/db/.AppleSetupDone":
		ensure	=>	present,
		content	=>	"",
	}
	
	mac-defaults { 'DidSeeCloudSetup':
		domain	=>	'com.appleSetupAssistant',
		key		=>	'DidSeeCloudSetup',
		type	=>	'bool',
		value	=>	'TRUE',
	}

	mac-defaults { 'LastSeenCloudProductVersion':
		domain	=>	'com.appleSetupAssistant',
		key		=>	'LastSeenCloudProductVersion',
		type	=>	'bool',
		value	=>	'10.10.2',
	}

	mac-defaults { 'RunNonInteractive':
		domain	=>	'com.appleSetupAssistant',
		key		=>	'RunNonInteractive',
		type	=>	'bool',
		value	=>	'TRUE',
	}

	mac-defaults { 'LastSeenBuddyBuildVersion':
		domain	=>	'com.appleSetupAssistant',
		key		=>	'LastSeenBuddyBuildVersion',
		type	=>	'bool',
		value	=>	'14C109',
	}

}