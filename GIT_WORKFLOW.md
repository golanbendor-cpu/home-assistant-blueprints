# Git Workflow Guide - Home Assistant Automation System

## 🎯 **Dual Repository Strategy**

### **LOCAL GIT (Private - Everything):**
- Tracks ALL files for complete version control
- Includes automations with real device IDs
- Full backup of your entire setup

### **GITHUB (Public - Blueprint Templates Only):**  
- Only blueprint templates (sanitized)
- Community sharing of blueprints
- URL: https://github.com/golanbendor-cpu/home-assistant-blueprints

## 🎯 **Quick Commit Workflow**

After making changes to automation files, blueprints, or documentation:

```bash
# Add all changes (local git gets everything)
git add .

# Commit with descriptive message  
git commit -m "Brief description of what you changed

Detailed explanation if needed:
- What was modified
- Why it was changed  
- Any important notes

🤖 Generated with Claude Code

Co-Authored-By: Claude <noreply@anthropic.com>"

# Push only blueprints to GitHub (via .gitignore)
git push  
```

## 📂 **What Gets Committed Where**

### 🏠 **LOCAL GIT (Everything):**
- `automations/` - All automation files (with real device IDs)
- `blueprints/` - Blueprint templates  
- `scripts/` - Helper scripts
- `*.md` - All documentation files
- `traces/` - Debug traces
- Complete version control and backup

### 🌐 **GITHUB PUBLIC (Blueprints Only):**
- `blueprints/*.yaml` - Only blueprint templates (sanitized)
- `helpers.md`, `bugs.md`, etc. - Safe documentation
- `scripts/` - Utility scripts
- Everything else IGNORED by .gitignore

### 🛡️ **Protected by .gitignore (Local Only):**
- `automations/` - Contains real device IDs
- `traces/` - Contains debug information  
- `added_features.md` - Contains Gist links
- `github_credentials.md` - Contains tokens
- `secrets.yaml`, `*.log`, `*.db*` - Sensitive files

## 🔒 **Security Summary**

### **File Types:**
1. **Blueprint Templates** → GitHub (public, sanitized)
2. **Automation Instances** → Local only (real device IDs)
3. **Specialized Automations** → Local only (real device IDs)
4. **Documentation** → Both (safe to share)
5. **Credentials/Traces** → Local only (sensitive)

## 🚀 **Common Scenarios**

### **After Fixing a Bug:**
```bash
git add .
git commit -m "Fix bedroom light immediate turn-off issue

- Updated bedroom_bed_presence_control.yaml  
- Lights now turn off immediately when bed is occupied
- Updated bugs.md with fix status

🤖 Generated with Claude Code"
git push
```

### **After Adding New Automation:**
```bash
git add .
git commit -m "Add kitchen ambient lighting automation

- Created kitchen_ambient_control.yaml
- Added new helper: input_boolean.kitchen_ambient_enable
- Updated helpers.md with new helper documentation

🤖 Generated with Claude Code"
git push
```

### **After Blueprint Updates:**
```bash
git add .
git commit -m "Enhance room_presence_plus blueprint with lux gating

- Added optional lux sensor support
- Improved day/night auto-switching logic
- Updated public template in public_gist_templates/

🤖 Generated with Claude Code"
git push
```

## 📊 **Repository Status Commands**

```bash
# Check what files have changed
git status

# See exactly what changed in files
git diff

# View commit history
git log --oneline -10

# Check if you're up to date with GitHub
git fetch && git status
```

## 🔄 **Sync with GitHub Desktop**

1. **GitHub Desktop** will show all your committed changes
2. **Push** button syncs to your private GitHub repository  
3. **Repository settings** should be set to **PRIVATE**
4. **Never change to public** - contains sensitive device information

## 📝 **Commit Message Best Practices**

### **Good Commit Messages:**
```
✅ "Fix bedroom LED strip TV conflict detection"
✅ "Add office computer monitor automation" 
✅ "Update night dimming curve for smoother transitions"
✅ "Organize automation files by room and blueprint type"
```

### **Bad Commit Messages:**
```
❌ "Update files"
❌ "Changes"  
❌ "Fix bug"
❌ "asdf"
```

## 🚨 **Emergency Recovery**

### **If You Accidentally Commit Sensitive Data:**
```bash
# DON'T PANIC - your repo is private but let's fix it
git reset --soft HEAD~1  # Undo last commit but keep changes
# Edit files to remove sensitive data
git add .
git commit -m "Fixed commit - removed sensitive information"
git push --force-with-lease  # Force push the corrected version
```

### **If You Need to Restore a File:**
```bash
git checkout HEAD -- filename.yaml  # Restore single file to last commit
git reset --hard HEAD~1  # Go back one commit (DESTRUCTIVE - be careful)
```

## 📋 **Daily Workflow Checklist**

- [ ] Made changes to automation files
- [ ] Tested changes work in Home Assistant  
- [ ] Updated relevant documentation (helpers.md, bugs.md, etc.)
- [ ] Added all changes: `git add .`
- [ ] Committed with good message including Claude co-author line
- [ ] Pushed to GitHub: `git push`
- [ ] Verified changes appear in GitHub Desktop

---

**🎯 Remember: This repository is your private backup and version control system. Keep it PRIVATE and commit frequently!**