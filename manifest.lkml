project_name: "block-keboola-reviewtrackers-hospitality"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-keboola-reviewtrackers_hospitality-config"
  export: override_required
}

constant: CONNECTION {
  value: "keboola_block_reviewtrackers_hospitality"
}

constant: SCHEMA_NAME {
  value: "WORKSPACE_506436037"
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
}
