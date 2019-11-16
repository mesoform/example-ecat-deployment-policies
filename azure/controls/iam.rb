describe azurerm_role_definition(name: 'policy-reader-only')
  it { should exist }
    its('permissions_allowed') { should include 'Microsoft.Authorization/policyassignments/read'}
    its('permissions_allowed') { should_not include 'Microsoft.Authorization/policyassignments/write'}
    its('permissions_allowed') { should_not include '*'}
end

describe azurerm_role_definitions do
  its ('properties.first.permissions.first')  { should have_attributes(notActions: [
      'Microsoft.Authorization/*/Delete',
      'Microsoft.Authorization/*/Write',
      'Microsoft.Authorization/elevateAccess/Action',
      'Microsoft.Blueprint/blueprintAssignments/write',
      'Microsoft.Blueprint/blueprintAssignments/delete'
  ]) }
end