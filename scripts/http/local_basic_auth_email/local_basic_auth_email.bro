#source: https://github.com/srunnels/bro-scripts.git

module BASIC_AUTH;

# Generate an email when a local machine is detected to be using basic auth
redef Notice::policy += {
	[$pred(n: Notice::Info) =
		{
		return n$note == HTTP::Basic_Auth_Server && Site::is_local_addr(n$id$resp_h);
		},
        $action = Notice::ACTION_EMAIL
	]
};