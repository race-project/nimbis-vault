# Packer instructions

Need to set the following environment variables in current shell before building with Packer:

- packer_aws_region
- packer_os_version
- packer_build_author

Example:

	  export packer_aws_region="us-east-1"
	  export packer_os_version="7.8"
	  export packer_build_author="John Doe"

Assumes you have 'aws_access_key_id' and 'aws_secret_access_key' set in your ~/.aws/credentials
file with necessary permissions for Packer to make calls to AWS CLI. Alternatively, you could
set these variables as environment variables in your current shell.

