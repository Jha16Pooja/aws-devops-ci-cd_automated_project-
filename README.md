![image](https://github.com/Jha16Pooja/aws-devops-ci-cd_automated_project-/assets/155782646/09b7edc1-3365-4649-8858-ab88db72fa9e)

This repository contains the following components:

Simple Java Code
Dockerfile
Kubernetes manifests (deployment.yaml & service.yaml)
Jenkinsfile (CI & CD)
Terraform code

# DevOps Project 

This project demonstrates setting up a CI/CD pipeline using Terraform, Jenkins, Docker, and Kubernetes.

## Infrastructure Setup

### 1. Create AWS EC2 Instances

Using Terraform, create two EC2 instances:

- `Master-Server`: Installed with Java, Jenkins, Maven, Docker, Ansible, and Trivy.
- `Node-Server`: Installed with Docker, Kubeadm, and Kubernetes.

### 2. Establish a Passwordless SSH Connection

- **On Node-Server:**

  ```bash
  sudo su -
  passwd ec2-user  # Set a password for ec2-user
  vi /etc/ssh/sshd_config  # Enable 'PermitRootLogin yes' & 'PasswordAuthentication yes'
  service sshd restart

- **On Master-Server:**

On Master-Server:

ssh-keygen  # Generate SSH key, press enter when prompted
ssh-copy-id ec2-user@<Node_Private_IP>  # Enter 'yes' and then ec2-user's password when prompted



Jenkins Configuration
1. Add Credentials in Jenkins
Dockerhub credentials (username & password).
Kubernetes (K8s) server username with private key.
GitHub username & token.
Dockerhub token (optional).
2. Install Required Plugins
Install the 'ssh agent' plugin in Jenkins for SSH connection management.

3. Configure CI/CD Pipelines
CI-pipeline: Set up and run the Continuous Integration pipeline.
CD-pipeline: Set up and run the Continuous Deployment pipeline.
Pipeline Execution
Access the deployed application via http://<Node_Server_Public_IP>:<NodePort_No>.
Automation
Automate the CD pipeline to run after the CI pipeline is successful.
Set up GitHub webhooks to trigger the CI pipeline on code changes.
Cleanup
To destroy the entire infrastructure created by Terraform, use the following command:

bash
Copy code
terraform destroy --auto-approve
