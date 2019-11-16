describe google_project_iam_binding(project: 'chef-inspec-gcp',  role: 'roles/compute.admin') do
  it { should exist }
end

describe google_project_iam_bindings(project: 'chef-inspec-gcp') do
  its('count') { should be <= 100}
end

describe google_project_iam_bindings(project: 'chef-inspec-gcp') do
  its('iam_binding_roles') { should include "roles/storage.admin" }
end

describe google_project_iam_bindings(project: 'chef-inspec-gcp').where(iam_binding_role: "roles/iam.securityReviewer") do
  it { should_not exist }
end