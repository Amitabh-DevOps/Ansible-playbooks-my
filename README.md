Date : 07-12-2024

### Introduction

Today’s class in **DevOps Batch-8** led by **Shubham Londhe** was a game-changer in my DevOps journey. After completing all the exercises, I am feeling incredibly confident with **Ansible**. If you're familiar with infrastructure management and automation, you’ll understand how powerful and time-saving tools like Ansible can be. Here’s a detailed breakdown of everything I worked on and learned today.

---

### What I Covered in Today's Class

1. **Installation of Ansible**
    
2. **Password-less Authentication**
    
3. **System Patching with a Master Server**
    
4. **Installing Docker on Servers**
    
5. **Installing Nginx on Servers**
    
6. **Running a Web Page on Nginx (with index.html)** on both **Ubuntu** and **Amazon Linux**
    
7. **Understanding the Key Importance of Ansible in Time Saving**
    

---

### Practical Work: Ansible Playbooks

#### 1\. **Show Date Playbook (show\_date.yml)**

The `show_date.yml` playbook simply displays the date on all targeted servers. Here's the YAML configuration:

```yaml
- name: Show Date playbook
  hosts: servers
  tasks:
    - name: Show date
      command: date
```

This playbook is a starting point for getting comfortable with the basic syntax and structure of an Ansible playbook.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1733593524577/cbb1798b-295d-4596-89ed-d6c334936bf1.png align="center")

> avoid that warning , i have to use localhost , because i have deleted all servers before taking screenshot.

---

#### 2\. **System Services Playbook (system\_services\_playbook.yml)**

I created a playbook that runs multiple system-related commands, such as checking the system date, RAM usage, disk space, and more:

```yaml
- name: System service
  hosts: servers
  tasks:
    - name: show date
      command: date

    - name: show RAM
      command: free -h

    - name: show disk space
      command: df -h

    - name: show user
      command: whoami

    - name: show uptime of servers
      command: uptime
```

This playbook helps system administrators check critical system details across multiple machines at once.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1733593671329/4c223319-e988-4daa-b944-9a7316bd744d.png align="center")

> avoid that warning , i have to use localhost , because i have deleted all servers before taking screenshot.

---

#### 3\. **Install Docker Playbook (install\_docker\_playbook.yml)**

Docker is essential for containerization, and I wrote a playbook to install Docker on both **Ubuntu** and **Amazon Linux** servers:

```yaml
- name: Install Docker on Ubuntu and Amazon linux distribution
  hosts: servers
  become: yes
  tasks:
    - name: Install docker on Ubuntu linux
      apt:
        name: docker.io
        state: latest
      when: ansible_distribution == "Ubuntu"

    - name: Install docker on Amazon linux
      dnf:
        name: docker
        state: latest
      when: ansible_distribution == "Amazon"
```

This playbook ensures that Docker is installed on the right OS using the appropriate package manager (`apt` for Ubuntu and `dnf` for Amazon Linux).

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1733592348627/162c4b3e-83f2-482e-ad56-43e611cbb6c5.png align="center")

---

#### 4\. **System Patching Playbook (system\_patching\_playbook.yml)**

Patching systems is crucial for keeping everything up to date. I automated system updates and upgrades for both Ubuntu and Amazon Linux servers:

```yaml
- name: System patching (system upgrade)
  hosts: servers
  become: yes
  tasks:
    - name: Update apt cache on Ubuntu
      apt:
        update_cache: yes
      when: ansible_distribution == "Ubuntu"

    - name: Update dnf cache on Amazon Linux
      dnf:
        update_cache: yes
      when: ansible_distribution == "Amazon"

    - name: Upgrade systems on Ubuntu
      apt:
        upgrade: dist
        state: latest
      when: ansible_distribution == "Ubuntu"

    - name: Upgrade systems on Amazon linux
      dnf:
        name: "*"
        state: latest
      when: ansible_distribution == "Amazon"

    - name: reboot systems
      reboot:
        reboot_timeout: 600
        msg: "System rebooting after package upgrades"
      when: ansible_distribution in ['Ubuntu', 'Amazon']

    - name: Testing uptime of Systems
      command: uptime
      register: uptime_output
      when: ansible_distribution in ['Ubuntu', 'Amazon']

    - name: Display uptime
      debug:
        var: uptime_output.stdout_lines
      when: ansible_distribution in ['Ubuntu', 'Amazon']
```

This playbook updates the system’s package cache, upgrades installed packages, reboots the system if necessary, and checks the system uptime after the reboot.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1733592500940/d9598f1b-193e-4f05-9c09-ade113b3f648.png align="center")

---

#### 5\. **Install Nginx Playbook (install\_nginx\_playbook.yml)**

I also created a playbook to install and configure **Nginx** on both Ubuntu and Amazon Linux:

```yaml
- name: Install nginx
  hosts: servers
  become: yes
  tasks:
    - name: nginx install on ubuntu
      apt:
        name: nginx
        state: latest
      when: ansible_distribution == "Ubuntu"

    - name: nginx install on amazon linux
      dnf:
        name: nginx
        state: latest
      when: ansible_distribution == "Amazon"

    - name: start and enable nginx
      service:
        name: nginx
        state: started
        enabled: yes

    - name: show index.html content on nginx server
      copy:
        src: index.html
        dest: /var/www/html/
      when: ansible_distribution == "Ubuntu"

    - name: show index.html content on nginx server
      copy:
        src: index.html
        dest: /usr/share/nginx/html/
      when: ansible_distribution == "Amazon"
```

The above playbook installs Nginx on the target servers, starts the service, and places a custom `index.html` file in the server’s web directory. Below is the `index.html` file used in this playbook:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1733592600225/26eb763a-7a95-433f-ba7e-680cfa3d4806.png align="center")

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Amitabh's DevOps Journey</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: cyan;
            color: #333;
            line-height: 1.6;
            padding: 0;
            margin: 0;
        }

        header {
            background-color: #004d99;
            color: white;
            text-align: center;
            padding: 30px 0;
            font-size: 28px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            font-size: 36px;
        }

        .content {
            margin: 50px auto;
            padding: 20px;
            width: 80%;
            max-width: 1000px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .content h2 {
            font-size: 30px;
            color: #004d99;
            margin-bottom: 15px;
        }

        .content p {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
        }

        .highlight {
            color: #e60000;
            font-weight: bold;
        }

        .skills-list, .interests-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .skills-list li, .interests-list li {
            font-size: 18px;
            margin: 10px 0;
        }

        .skills-list li::before, .interests-list li::before {
            content: '→ ';
            color: #004d99;
            font-weight: bold;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 14px;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.1);
        }

        footer a {
            color: #e60000;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <header>
        <h1>Amitabh's DevOps Journey</h1>
        <p>Welcome to my world of technology, learning, and innovation!</p>
    </header>

    <div class="content">
        <h2>About Me</h2>
        <p>Hello! I'm <span class="highlight">Amitabh</span>, a passionate <span class="highlight">DevOps enthusiast</span> from India. I'm currently pursuing my Bachelor's degree in Computer Science, and I'm diving deep into the world of DevOps practices and tools. I love automating processes, working with cloud technologies, and contributing to open-source projects. I’m constantly learning and improving my skills to make a positive impact in the tech community.</p>

        <h2>Skills</h2>
        <ul class="skills-list">
            <li>Proficient in <span class="highlight">Git, Jenkins, Docker, and AWS</span></li>
            <li>Experienced in creating CI/CD pipelines for automation</li>
            <li>Skilled in Linux administration and system configuration</li>
            <li>Familiar with configuration management tools like <span class="highlight">Ansible</span> and <span class="highlight">Puppet</span></li>
            <li>Knowledge of cloud computing platforms such as <span class="highlight">AWS, GCP, and Azure</span></li>
            <li>Good understanding of containerization and microservices architecture</li>
        </ul>

        <h2>Interests</h2>
        <ul class="interests-list">
            <li>Exploring new DevOps tools and technologies</li>
            <li>Contributing to open-source projects</li>
            <li>Learning about automation and AI in software engineering</li>
            <li>Building hands-on projects that solve real-world problems</li>
            <li>Networking with other tech enthusiasts and professionals</li>
        </ul>

        <h2>My DevOps Journey</h2>
        <p>I embarked on my DevOps journey a while ago, starting with an exploration of Linux and Git. Over time, I learned about Docker and Kubernetes for containerization and orchestration. Through various hands-on projects, I’ve built automated deployment pipelines and worked on cloud infrastructure automation. My focus is always on improving efficiency, reliability, and scalability through automation.</p>

        <p>I’m excited about the future of DevOps, and I look forward to collaborating with others to tackle the challenges of continuous integration, continuous delivery, and cloud infrastructure management.</p>
    </div>

    <footer>
        <p>Created by <span class="highlight">Amitabh</span> | DevOps Enthusiast</p>
        <p>Connect with me on <a href="https://www.linkedin.com/in/amitabh-devops/" target="_blank">LinkedIn</a> | <a href="https://github.com/amitabhdev" target="_blank">GitHub</a></p>
    </footer>

</body>
</html>
```

This `index.html` file displays a about me on the browser when accessed via Nginx.  

1. Server 1 Output of `index.html` (Ubuntu):
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1733592719975/901da705-abbc-4f17-86c8-e321205fa74a.png align="center")
    
2. Server 2 Output of `index.html` (Amazon linux) :
    
    ![](https://cdn.hashnode.com/res/hashnode/image/upload/v1733592732807/9b7d551c-fcf4-4424-aa03-8ded28235502.png align="center")
    

---

### Key Learnings from Today

1. **Time-Saving Automation**: The key takeaway from today's class was the immense time savings that come with automating repetitive tasks such as system patching, Docker installation, and Nginx setup. Ansible allows me to manage and configure servers in bulk, saving hours of manual work.
    
2. **Password-less Authentication**: I practiced configuring **password-less SSH authentication** between my control node (the machine from where Ansible runs) and the target servers, ensuring smooth communication between them without the need for passwords every time Ansible runs a task.
    
3. **Hands-on Experience**: Running practical exercises on **Ubuntu** and **Amazon Linux** helped me solidify my understanding. Whether it was installing Docker or setting up a web server, the hands-on approach provided a deeper understanding of Ansible’s capabilities.
    

---

### Conclusion

I'm now super confident in my ability to use **Ansible** to automate tasks, install software, and manage configurations across multiple servers. This is a massive step forward in my DevOps journey, and I am looking forward to tackling more advanced automation tasks in the future.

**Thank you, Shubham Londhe**, for an insightful session!

---

### Connect with Me

* [**GitHub**](https://github.com/Amitabh-DevOps)
    
* [**LinkedIn**](https://linkedin.com/in/amitabh-devops)
    
* [**Twitter**](https://x.com/Amitabh_DevOps)
    

---

Let me know if you have any questions or thoughts in the comments below. Let’s connect and collaborate!
