# 📦 Terraform tfvars Files

## 📌 What is a `.tfvars` file?

A `.tfvars` file is used in Terraform to store **values for variables** separately from your main code.

👉 In simple words:  
**Code = structure | tfvars = values**

---

## 🧠 Why do we use tfvars?

### 🔹 1. Separation of Code and Values
- Keeps Terraform code clean  
- Variables are stored separately  

---

### 🔹 2. Easy for Multiple Environments
You can use different values for:
- Development  
- Staging  
- Production  

Example:
- `dev.tfvars`
- `prod.tfvars`

---

### 🔹 3. Better Security
- Sensitive data like passwords or API keys can be stored separately  
- Helps avoid exposing secrets in main code  

---

### 🔹 4. Reusability
- Same Terraform code can be reused  
- Only values change using different `.tfvars` files  

---

### 🔹 5. Team Collaboration
- Each developer can use their own `.tfvars` file  
- Avoids conflicts in shared code  

---

## Summary

Here's how you typically use `.tfvars` files

1. Define your input variables in your Terraform code (e.g., in a `variables.tf` file).

2. Create one or more `.tfvars` files, each containing specific values for those input variables.

3. When running Terraform commands (e.g., terraform apply, terraform plan), you can specify which .tfvars file(s) to use with the -var-file option:

```
terraform apply -var-file=dev.tfvars
```

By using `.tfvars` files, you can keep your Terraform code more generic and flexible while tailoring configurations to different scenarios and environments.