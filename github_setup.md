
# Using Github

## Why Git and Github?

Git and Github provide an excellent way to organize and share code and other files related to statistical research projects. Git is primarily a version control system, which allows you to track the history of your files and to share them with others. It allows you to easily synchronize files on your computer with those in stored in the cloud on Github. For example, I can push new lectures to Github and you can pull them onto your computer with a click of a button.

We use Github in this class for several reasons. First, it is a convenient way to share course materials. Second, it will help you to manage and keep track of your projects, which can easily become unwieldy. Third, it will encourage you to develop a reproducible workflow, helping to improve transparency in social scientific research.

Github is not intended for storage of large files. You should use another service like Google Drive or Box for this purpose. And be careful what you share. By default, most repositories are public, so ensure not to share sensitive data or credentials.

## Setting up Git and Github

Follow these steps to get a Github account, install and set up Git on your computer, integrate it with RStudio, and verify that it is working. The process should take approximately half an hour to complete, although there are always things that go wrong.

I strongly recommend browsing the resources below and familiarizing yourself with Git and Github before proceeding. If you get stuck at any point, there are plenty of resources to assist, but feel free to reach out with any questions.

1. Set up an account on Github https://github.com (we will be using the free version so no need to pay).

2. Install Git on your computer following instructions here https://github.com/git-guides/install-git

3. Now you have Git on your computer. You need to run a command in R to associate it with the account you set up in Step 1.

Luckily there is an R package to help you do this All you need to do is install the following package and run this command in the R console (replacing the username and email address).

```
library(usethis)
use_git_config(user.name = “t-davidson", user.email = “thomas.davidson@rutgers.edu”)
```

4. At this point Git is set up on your computer, but we still need to perform a final step to connect to Github.
Follow these instructions to generate and store an access token: https://happygitwithr.com/https-pat.html

5. You’re nearly there! Now we need to check that everything is working. This will also be a chance to learn core Git/Github functionality.

You will set up a new repository on the Github website, clone it using RStudio, then commit and push a change, before verifying it on the website.

Follow the instructions here: https://happygitwithr.com/rstudio-git-github.html

6. Finally, you can use Github to get the latest version of all the course files (including this one!) on your computer.

Return to RStudio and click the `File` tab at the top of the page and select `New Project...` from the dropdown. This will open up the project wizard. Click the `Version Control` option then `Git`. Paste the URL for this project (https://github.com/t-davidson/SOC542) into the Repository URL box and select an appropriate directory to store it (this is where the files will all live). When you're read, click `Create Project`

You will see a window pop up and then you will return to RStudio. If you look in the `Files` pane you should see the files from the course. You should also see a tab titled `Git` at the top. Now, whenever there is an update to the course, all you need to do is click the downwards facing green arrow to "pull" the files onto your computer.

## Using Github for homework assignments

Each homework assignment will be a separate Github repository, where each student has a personal version. You will need to clone this repository using the same process as in Step 6. You can then submit your solutions by committing changes and pushing them to your repository.

## Resources

There are a ton of videos on YouTube, from short explainers to multi-hour marathons
Some of the instructions here are part of detailed guide to all you could every want to know about RStudio and Github https://happygitwithr.com/index.html
Github provides guides and lots of documentation on its website https://github.com/git-guides
Github cheatsheet (multilingual) https://training.github.com/

## Student developer pack
Students can get free access to some premium features by signing up for the Student Developer Pack: https://education.github.com/pack. It is not essential for our purposes, but I highly recommend doing so. The most clear perk is the ability to create private repositories.
