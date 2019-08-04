require 'awspec'
require 'aws-sdk'
require 'rhcl'

iam_role = Rhcl.parse(File.open('examples/main.tf'))

role_name = iam_role['module']['iam_role']['name']
environment_tag = iam_role['module']['iam_role']['tags']['Environment']
owner_tag = iam_role['module']['iam_role']['tags']['Owner']

describe iam_role(role_name) do
  it { should exist }
end

