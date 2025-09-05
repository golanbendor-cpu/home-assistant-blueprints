# 🤖 Fetch Blueprint Automations to YAML Files

## 📋 Scope of Extraction

### 🎯 Target File
Focus **only** on `automations\automation.yaml`

Ignore any other YAML files in the project.

### 🔍 Filtering Rule
Extract **only automations** that are based on blueprints:
- Must contain `use_blueprint:` key
- **Do not extract** regular automations that are not linked to a blueprint

## 📁 Output Structure

### 🗂️ Folder Organization
For each blueprint automation, use a dedicated folder under `automations\blueprints\`:

- **Folder name** should match the blueprint alias or meaningful identifier
- **File name** should match the automation alias

### 📂 Example Structure:
```
automations\blueprints\bedroom_led_blueprint\
    ├── bedroom_led_left.yaml
    └── bedroom_led_right.yaml

automations\blueprints\room_presence_plus\
    ├── bathroom.yaml
    ├── entrance.yaml
    ├── bedroom.yaml
    └── living_room.yaml
```

## 📝 File Content Rules

### ✅ Include:
- **Full automation block** from `automation.yaml`
- Complete `alias`, `description`, and `use_blueprint` structure
- All input parameters and values
- Proper indentation and formatting

### ❌ Exclude:
- **Do not include `id:` field** (will be auto-generated when imported to HA GUI)
- No additional metadata or comments

### 📐 Consistency & Naming
- **Folder names:** `lower_case_with_underscores`
- **File names:** `lower_case_with_underscores.yaml`
- File names should **clearly correspond** to the automation alias

## 🎯 Goal
- ✅ **Split** one large `automation.yaml` into clean, modular YAML files
- ✅ **Organize** in predictable folder structure under `automations\blueprints\`
- ✅ **Ready for copy-paste** import into Home Assistant GUI
- ✅ **Blueprint-focused** organization for easy maintenance

---

> **🔄 Workflow:** Use this command to extract blueprint automations from the main automation file into organized, individual files for better management and GUI import.