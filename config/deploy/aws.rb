raise ArgumentError, "Missing required environment variable, TRANSCRIPT_HOST." unless ENV['TRANSCRIPT_HOST']
raise ArgumentError, "Missing required environment variable, TRANSCRIPT_SSH_KEY." unless ENV['TRANSCRIPT_SSH_KEY']

server ENV['TRANSCRIPT_HOST'],
  user: 'ec2-user',
  roles: %w{web app db},
  ssh_options: {
    user: 'ec2-user',
    keys: [ENV['TRANSCRIPT_SSH_KEY']],
    forward_agent: false,
    auth_methods: %w(publickey)
  }
