# docker-teamcity

A `docker-compose` based development instance of Teamcity with data persistence.

## Dependecies

The only dependecy is that `docker` is installed in your environment and `docker-compose` is available.

You can check these with the following commands
```sh
docker --version
docker-compose --version
```

## Usage

### Startup

Clone this repo and `cd` to the root directory of the project. From there you can run the following to start to the single-agent TeamCity cluster.

```sh
docker-compose -f ./docker/full-cluster.yaml up
```

### Initial Setup

At first run, the TeamCity instance will need your intervention to get things in order. You'll need to: 

1. Select a database type to use
2. Setup a primary account
3. Authorize the agent on the server

Once the TeamCity server is running, you can do all of this in the TeamCity ui at http://localhost:8111. 

#### Database & Account

The UI should guide you through these first two steps.

#### Authorizing the Agent

Once you're logged in to the server instance, authorizing the agent only takes a few mouse clicks.

In the main navigation you should see an "Agents" link. Click that to view the available agents. (It should initially have a badge with "0" in it because you haven't authorized the single agent we have yet.)

On the Agents screen there should be a tab labeled "Unathorized" (with a "1" badge next to it - meaning there's one unauthorized agent.) Click that tab to show the unauthorized agents that have requested access to the server.

On the single agent we have you should be able to click a button labeled "Authorize". Once you do, the agent will be available for use.

### Stopping and Teardown

#### Stopping

The startup command will run the composed conatiners interactively, so shutting TeamCity back down is as easy as focusing your terminal session and executing a `Cmd-C` or `Ctrl-C` to stop the process.

#### Teardown

Hard stopping the TeamCity process tree with `Cmd-C` will stop the conatiners but it leaves things behind. If you need to cleanup the TeamCity resource completely you can run the `down` command to teardown your resources.

```sh
docker-compose -f ./docker/full-cluster.yaml down
```

*NOTE:* This can be run after a `Cmd-C`, or you can run this from a  second terminal window to stop a running instance and tear things down in one step.

#### Data Cleanup

If you need to start fresh after making some server changes or configs, simply teardown the TeamCity instance (as above) and delete the `data/` directory. This will force your instance to rerun the initial setup.