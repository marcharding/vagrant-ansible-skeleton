server 'hostnameorip', user: 'user', roles: %w{web}, e: { forward_agent: true }

set :deploy_to, '~/path/to/deployment'
