
# Using Github

We will be using Github in this class to share and manage all files, including the lectures, labs, homework assignments, and your final projects.

## Why Git and Github?

Git is a version control system that enables you to track the history of your files and to share them with others. Github  is a cloud-based platform that allows you to share these files and easily synchronize them. For example, I can push new lectures to Github and you can pull them onto your computer with a click of a button.

There are several benefits of these tools. First, it is a convenient way to share course materials and assignments. Second, it will help you to manage and keep track of your projects, which can easily become unwieldy. Third, it will encourage you to develop a reproducible workflow, helping to improve transparency in social science research. Fourth, the open-source software we will be using in class is all maintained via Github. Knowledge of how the platform works will make it easier for you to understand this software and potentially contribute to it.

Github is not intended for storage of large files. You should use another service like Google Drive or Box for this purpose. And be careful what you share. By default, most repositories are public, so ensure not to share sensitive data or credentials.

## Setting up Git, Github, and RStudio integration

Follow these steps to get a Github account, install and set up Git on your computer, integrate it with RStudio, and verify that it is working. The process should take approximately 15 minutes to complete (assuming nothing goes wrong).

1. Set up an account on Github https://github.com (we will be using the free version so no need to pay). Skip this step if you already have a Github account.

Use your Rutgers email and make a short, memorable username. Store your password securely. You may also be required to set up two-factor authorization.

2. Install Git on your computer following instructions here https://github.com/git-guides/install-git.

Please note that the instructions vary depending on your operating system. If you are using a recent computer with MacOS then you may have Github installed already. Mac users may also be prompted to install XCode.

3. Now you have Git on your computer. You need to run a command in R to associate it with the account you set up in Step 1.

Luckily there is an R package to help you do this All you need to do is install the following package and run this command in the R console, replacing `USERNAME` and `EMAIL` with your Github username and the email you used to register).

```
install.packages("usethis")
library(usethis)
use_git_config(user.name = "USERNAME", user.email = "EMAIL")
```

If you get an access or permission error then you may need to complete this step to generate and store an access token: https://happygitwithr.com/https-pat.html. Otherwise, proceed to the next step.

4. Finally, you can use Github to get the latest version of all the course files (including this one!) on your computer.

Return to RStudio and click the `File` tab at the top of the page and select `New Project...` from the dropdown. This will open up the project wizard. Click the `Version Control` option then `Git`. Paste the URL for this project (https://github.com/t-davidson/SOC542) into the Repository URL box and select an appropriate directory to store it (the folder you made in class). When you're ready, click `Create Project`

You will see a window pop up and then you will return to RStudio when the process is completed. If you look in the `Files` pane you should see the files from the course. You should also see a tab titled `Git` at the top. Now, whenever there is an update to the course, all you need to do is click the downwards facing green arrow to "pull" the files onto your computer.


## Using Github for homework assignments

We will be using something called Github Classroom for the homework assignments. Each homework assignment will be a separate Github repository, where each student gets a personal version. 


### How to download ("clone") the homework repository

You will need to clone this repository using the same process as in Step 4 above. Just use the URL for your unique repository in place of the course website. Make sure to save it somewhere separate (e.g. *not* inside the `SOC542` directory). Once you have cloned it, the project should automatically open in RStudio. Clicking the project file will also open up RStudio within the homework repository.

### How to commit and push changes to the homework

- Verify that your RStudio is using the correct project and that you are not in the main class project since you will be switching back and forth between projects
- Save the files you want to update
- Navigate to the Git tab in RStudio and click the check-box for the file then click `Commit`. Only check the boxes next to the required files.
- A dialogue box will open. Add a short message to the `Commit message` box, e.g. `Final HW1 solutions` then click the `Commit` button again. 
- Finally, click the `Push` button with the green upwards arrow to send the change to your cloud-based repository
	- Note: If you are asked for your username and password, click `Cancel` and exit the process. Follow these instructions to set up a personal access token (https://happygitwithr.com/https-pat.html#tldr) then attempt again.
- Once you have pushed the changes, visit the Github webpage for your homework repository and you should see your commit message next to the file name, showing it is updated.

You can commit as many times as you want. I recommend testing this process our before your final submission.

For the final submission, please use the commit message indicated at the bottom of the `.Rmd` file to confirm it is the final submission.

## On projects

Over the course of the semester you will likely have multiple different Github repositories (main course repo, homeworks, papers).

The simplest way to open a project is to open the `.RProj` file located in each folder or to use the dropdown menu in RStudio to open projects.

Make sure you know what project you are currently in. You will need to switch between projects. For example, you might have a homework open in one project and will need to close RStudio and open the main project to work on in class problems.

You can learn more about projects in the *R for Data Science* book: https://r4ds.hadley.nz/workflow-scripts.html#projects

## Resources

Some of the instructions here are part of detailed guide to all you could every want to know about RStudio and Github: https://happygitwithr.com/index.html
Github provides guides and lots of documentation on its website: https://github.com/git-guides
Github cheatsheet (multilingual): https://training.github.com/

### Student developer pack
Students can get free access to some premium features by signing up for the Student Developer Pack: https://education.github.com/pack. It is not essential for our purposes, but I highly recommend doing so. The most obvious perk is the ability to create private repositories.
