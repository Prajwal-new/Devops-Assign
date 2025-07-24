# 🚀 DevOps Assignment – EC2 Deployment using Terraform

## 📌 Objective

Automate the deployment of a Java application (`.jar`) on an AWS EC2 Ubuntu instance using **Terraform** and a **user data script**.

---

## 🗂️ Project Structure

```
Prajwal-Devops/
├── backend/
│   └── parcel.jar                 # Compiled Java application
├── scripts/
│   └── user_data.sh              # Shell script for EC2 bootstrapping
└── terraform/
    ├── main.tf                   # Terraform config for EC2 and security group
    ├── variables.tf              # Input variables
    └── outputs.tf                # Outputs like EC2 public IP
    └── dev.tfvars                #dev stage
    └── prod.tfvars               #prod stage
    
    
```

---

## 🧰 Tools & Technologies

- AWS EC2 (Ubuntu)
- Terraform
- Java 21 (Amazon Corretto / OpenJDK)
- Spring Boot (for parcel.jar)
- Bash scripting (user data)
- SSH / SCP

---

## 🛠️ Prerequisites

-  Create an AWS account and  create the access keys  (`~/.aws/credentials`)
- Install Terraform in your system (windows/mac /etc..).
- Install Amazon CLI in your System.
- Install any IDE -VS code/Ecclipse/etc...
- I preffered VS code
     Install Hashicop ,AWS cli, terraform Extensions -which make to write code easier
      Configure the aws secrets keys

 
## 🛠️ Create the Project
Create a Project Folder  and create subfolders as shown in above infrastructure.
Write the  Teraform automation  Scripts and user data scripts 

## ⚙️ Steps to Deploy without stages

### 1. Initialize Terraform

```bash
cd terraform
terraform init
```

### 2. See the project plan and  Apply Configuration

```bash
terraform plan
terraform apply
  └──it will Automatically create us EC2 instance and jar file.
  

```

### 3. Copy the jar file to backend folder.
USE SCP connection in our powershell /vs code  new terminal.
Syntax: scp -i .pem location username@<publc_ip>:<location of .jar file><location Where you want to copy parcel.pem>
scp -i "C:\Users\DEEPA\Downloads\day3.pem" ubuntu@54.165.2.221:/home/ubuntu/backend/parcel.jar "C:\Users\DEEPA\OneDrive\Desktop\Prajwal-Devops\backend\"


## 🌐 4.Run the application in your browser

Visit:

```
http://<EC2_PUBLIC_IP>/hello
```

Expected Output:

```
Hello from Spring MVC!
```

---

## 5. Destroy Resources (Cleanup)--MAnual destroy

```bash
terraform destroy
```
 After some time the Instance will be automatically destroyed


---

## 🔐 Deploy In stages DEV and Prod

- Create separte tfvars file for dev and prod
  Ex: dev.tfvars and prod.tfvars

Steps to Deploy

 **1.Initialize Terraformr**
      cd terraform
      terraform init

  **2.create the workspace for dev and prod**
       terraform workspace new dev
       terraform workspace new prod

   **3.Select the workspace**
      terraform workspace select dev

  **4.Apply the configuration**
      terraform apply -var-file="dev.tfvars"
      
         It will create new instance for dev stage 
         It will run the application with port 80

   **5.Run the application in your browser**

  Visit:

   ```
     http://<EC2_PUBLIC_IP>/hello
  ```

    Expected Output:

   ```
    Hello from Spring MVC
         
---
You can to same for prod stage aslo.
In order to track what are created see terraform.tfstate

## 🧑‍💻 Author

**Prajwal T.**  
DevOps | Terraform | EC2 Deployment – 2025
