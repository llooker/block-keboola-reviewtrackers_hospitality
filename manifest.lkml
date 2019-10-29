project_name: "block-keboola-reviews"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-keboola-reviews-config"
  export: override_required
}

constant: CONNECTION {
  value: "keboola_block_reviewtrackers_hospitality"
  export: override_required
}

constant: SCHEMA_NAME {
  value: "WORKSPACE_506436037"
  export: override_required
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: SCHEMA_NAME {
    value: "@{SCHEMA_NAME}"
  }
}
