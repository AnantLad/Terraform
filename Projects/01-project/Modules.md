# 📦 Terraform Modules

## 📌 What is a Module?

A **module** in Terraform is a container for multiple resources that are used together.

👉 In simple words:  
**Module = Reusable block of Terraform code**

---

## 🧠 Why Use Modules?

Modules help you write **clean, reusable, and organized code**.

---

## 🚀 Benefits of Terraform Modules

### 🔹 1. Modularity
- Break infrastructure into smaller parts  
- Example:
  - EC2 module  
  - VPC module  
  - Database module  

---

### 🔹 2. Reusability
- Write code once, use it many times  
- Avoid duplicate code  

---

### 🔹 3. Easy Collaboration
- Team members can work on different modules  
- Reduces conflicts in code  

---

### 🔹 4. Version Control
- Modules can have versions  
- You can control when to update  

---

### 🔹 5. Abstraction
- Hide complex details  
- Users only provide simple inputs  

---

### 🔹 6. Testing & Reliability
- Modules can be tested separately  
- Reduces errors in main project  

---

### 🔹 7. Self Documentation
- Variables and outputs explain usage  
- Easy to understand for others  

---

### 🔹 8. Scalability
- Helps manage large infrastructure  
- Keeps code organized  

---

### 🔹 9. Security & Best Practices
- Enforce security rules inside modules  
- Ensures consistent setup  

---

## 📄 Example Structure

``` id="modstruct01"
project/
│
├── main.tf
├── variables.tf
│
├── modules/
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf