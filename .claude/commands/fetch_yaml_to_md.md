# 🏠 Fetch HA Components from YAML Code

## 📋 Extended Task Description

### 🔍 Scope of Search
Traverse the entire Home Assistant project directory and scan all `.yaml` files, including:
- `automations.yaml`  
- `scripts.yaml`
- `blueprints/*.yaml`
- Any folder-based automation YAMLs

### 🎯 Extraction Targets
Identify and extract the following items:

- **🔗 Entities:** All entities defined or referenced in the YAML files
- **⚙️ Helpers:** Input booleans, input numbers, input selects, timers, counters, etc.
- **📱 Devices:** Physical or virtual devices associated with entities (via integrations or device IDs)
- **🤖 Automations:** Automation definitions, aliases, and triggers
- **📐 Blueprints:** Any custom or imported blueprint definitions

### 📊 Comparison with Existing Documentation
For each category (entities, helpers, devices, automations, blueprints), check the corresponding Markdown file:

- `entities.md`
- `helpers.md` 
- `devices.md`
- `automations_blueprint.md`

Compare extracted items with what is already documented.

### 🔄 Update Process
- Append **only missing items** to the Markdown files
- Ensure duplicates are avoided
- Maintain existing documentation structure

### 📝 Formatting Requirements

- Use a **consistent and informative structure**
- For each item, include:
  - Name
  - Type  
  - Source YAML file
- Add a **short description** if available (from `alias`, `friendly_name`, or comments in YAML)

### 🎯 Output Goal
Keep the Markdown files **informative and easy to navigate**. Each file should provide a complete overview of its category, with newly discovered items seamlessly integrated.

---

> **🔒 Security Note:** The generated documentation files contain device IDs and sensitive information, so they are automatically excluded from git commits via `.gitignore`.