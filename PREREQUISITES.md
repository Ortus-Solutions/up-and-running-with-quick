# Prerequisites

Here's what you'll need to have ready on the day of the workshop:

## Join the BoxTeam Slack Channel
Visit boxteam.herokuapp.com and invite yourself to the Slack.

## CommandBox
Download and installation instructions are here: https://commandbox.ortusbooks.com/setup/download

## CommandBox Modules

Once CommandBox is installed we will need to install some global modules. Start by opening a box shell by typing `box`. Once in the shell you can type:
```bash
install commandbox-dotenv,commandbox-migrations,commandbox-cfconfig
```

## MySQL 5.7
We tend to use a Docker container for this, but it is not a requirement. Here is a command that will give you a local MySQL container you can interact with:

```sh
docker run -d --name=quick_blog_example -p 3306:3306 -e MYSQL_DATABASE=quick_blog_example -e MYSQL_ROOT_PASSWORD=root mysql:5.7
```

After you have created the container, you can start and stop it using the following commands:

```bash
docker start quick_blog_example
docker stop quick_blog_example
```

(You may choose to use a different database that Quick supports if you desire, but all examples will be ran against MySQL 5.7. We won't be able to support you with database-specific issues in the workshop.)

## MySQL Client
You will want a SQL client to inspect and interact with your database.
You can use any client you would like. Here are a few we like ourselves:

* [DBeaver](https://dbeaver.io/) (Cross Platform, Free)
* [Sequel Pro](https://sequelpro.com) (Mac, Free)
* [Heidi SQL](https://www.heidisql.com) (Windows, Free)
* [TablePlus](https://tableplus.io/) (Cross Platform, Commercial / Free Trial)
* [Data Grip](https://www.jetbrains.com/datagrip/) (Cross Platform, Commercial / Free Trial)

## IDE

We recommend the following IDEs for development for this workshop
* [Microsoft VSCode](https://code.visualstudio.com/)
* [Sublime](https://www.sublimetext.com/)

If using VS Code, please install the following extensions:
* CFML - KamasamaK
* vscode-coldbox
* vscode-testbox
* Docker
* Yaml

If using Sublime, please install the following extensions:
* ColdBox Platform
* CFML
* CFMLDocPlugin
* Enhanced HTML and CFML
* DockerFile Syntax Highlighting
* Yaml

## Useful Resources
* Quick Docs: https://quick.ortusbooks.com
* QB Docs: https://qb.ortusbooks.com
* CommandBox Migrations: https://www.forgebox.io/view/commandbox-migration