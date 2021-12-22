---
layout: post
title:  "TiDB & its community"
date: 2021-02-24 19:10:10 +0800
categories: [Large Scale Software Engineering]
tags: [Large Scale Software Engineering, paper2]
---

# Summary. 
`TiDB` is an open-source NewSQL database that supports Hybrid Transactional and Analytical Processing (HTAP) workloads. It is MySQL compatible and features horizontal scalability, strong consistency, and high availability. This project has more than 26.9k stars. [repository link](https://github.com/pingcap/tidb)  
# README.md file
there are some tabs in this file for starters to use or for the contributor to contribute to this project.  
`What is TiDB`: introduce what does TiDB do and some core features of TiDB.  
`Quick Start`: Made for users and tells the users how to set up environments.  
`To Start developing TiDB`: Made for contributors.  it shows how does the contributors contribute to TiDB.[1]  
`case studies`: Made for learners, someone has to understand TiDB before he becomes a contributor.  
`blog`: posts something interesting on the blog for everyone interested in this project.  
`documentation`: provide all the documents on these tabs.  
`TiDB monthly`: post something like a blog about monthly news of TiDB.
`Architecture`: for starters. help starters understand the whole structure of TiDB.  
For starters, they can quickly know what the TiDB is and how to deploy environments through `quick start` tab, instead of looking through the whole code or the whole documents.  
For contributors, they can know how to make contributions to the project through `Quick Start` tab instead of emailing the founder all the time.  
For leaders, they can post the most recent news about TiDB to get everyone to know what the future is and what TiDB team is doing.  
It can make people in different roles collaborate well with each other in this layout.  

# how do contributors communicate with each other?
1. Slack channel.  
![Slack Community](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/TiDB_slack_community.png)  
TiDB has created a Slack community for any members to communicate with each other. this community has grown up to 2500 members and every member can share anything on Slack.  This community is more like a chatting box, when someone meets some personal technical problems like the environment is set up unsuccessfully, he could go to this community for help and the problems are always being solved in minutes.  
2. `Issues` tab.  
![Issues](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/TiDB_issues.png)  
every project has a tab named with issues. everyone could go to this tab posting an issue on it and wait for other contributors to deal with it. At the same time, every contributor can help others fix the problems. The issues are always formal and usually, no one meets the same problems before. The issues are always bugs waiting for someone to solve them out.  
3. `Community`. This repository has been created for contributors to contribute to the project. the details are delivered later.   
4. there are some other ways, such as `Reddit`, `Twitter`, and `email`. some news or some activities are posted on this media website and make everyone knows what TiDB teams have been doing recently. 

# how to make a contribution. 
1. there is a document named with `how to contribute`. Contributors have to read this guideline before contributing. This document help contributors make contributions efficiently.  
2. Contributors could ask for any helps through the ways shown above when they meet any kinds of problems. 
3. Submitting a `pull request` after all the tests are running successfully.  
4. Waiting for the leader to accept the request and merge it to a repository.  

# Learning Resources. 
For starters, they could everything about TiDB they want which can help them learn and contribute to TiDB. there are two versions: Chinese and English versions.  
# Community.[2]
Community is really important for this project. It is efficient for contributors to collaborate.  
### Architecture. 
![Architecture](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/TiDB_community_architecture.png)  
the architecture shows the structure of the whole community. Every member are responsible for different parts. 
##### PMC.
PMC is short for Project Management Committee. PMC is the core management team and oversees TiDB community. it is responsible for making the whole process work smoothly and doing the decision-making about what the future of TiDB goes to.  
##### Organizer Committee
`Organizer Committee` is in charge of community events or activity operations, they ensure the execution of PMC's strategies and decisions.
##### TiDB user group.
3 roles. `Leader`, `Co-leader`, and `Ambassador`. The TiDB User Groups (TUGs) are groups for facilitating communication and discovery of information related to topics that have long-term relevance to large groups of TiDB users. `Leader` makes overall plans and tracks progress. `Co-leader` shares TUG responsibilities. `Ambassador` are passionate about sharing and promoting on blogs.  
##### TiDB developer group. 
5 roles: `Maintainer`, `Committer`, `Reviewer`, `Active Contributor` and `Contributor`. `Contributor`, and `Active Contributor` are responsible for making any PRs to the community. `Reviewer` are responsible for reviewing the code to ensure quality and correctness. `Maintainers` are the planners and designers of the TiDB project, with the authority to merge branches into the master.  

### BDFL.
`BDFL` is short for Benevolent dictator for life. Actually, the members in PMC are BDFL. they are responsible for decision-making and retaining the final say in disputes or arguments within the community.  

### Governance.
Governance is followed by all the repositories in TiDB.  
two groups: 
Special Interest Groups (SIGs) are persistent open groups that focus on a module of TiDB.  
Working Groups (WGs) are temporary groups that are formed to address issues that cross SIG boundaries.  
##### Principle.
`Open`: TiDB is open-source.  
`Welcoming and respectful`: welcome everyone to make a contribution and respect contributors.  
`Transparent and accessible`: Work and collaboration are done in public.  
`Merit`: Good contribution can be accepted.  
##### Code of conduct.
> In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to make participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, sex characteristics, gender identit, and expression, level of experience, education, socio-economic status, nationality, personal appearance, race, religion, or sexual identity and orientation.[3].

##### Decision-making and voting. 
Proposals and ideas can be submitted for agreement via a github issue or PR. Major changes such as feature proposals and organization or process changes should be brought to the PMC or Maintainers’ attention through the Request for Comments (RFC) process. For the change to happen, the RFC must earn the supermajority (2/3) votes in the corresponding group.[3].  

##### Conflict resolution.
the conflict happens when the agreement is not achieved by everyone. `Voting` comes in when dealing with this situation based on `Principle` and `Code of Conduct`.  

##### Adding new project.
the projects can be added via issue discussion. Once sufficient discussions have taken place, the `maintainer` should decide whether the new project should be added or not.  

### Roadmap.
![Roadmap](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/TiDB_community_roadmap.png)  
Roadmap is like a route where the TiDB goes on. Roadmap is really an important part in TiDB. It is made by PMC and tells tons of contributors what to do in the future. When one task is done, a tick should be listed before the task. In that case, every member could see the progress TiDB makes.

### Comunity Activities.
![Activities](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/TiDB_community_activities.png)  
it lists all the activities since the communities have been set up. it tells all the members the activities are being held in the future. In this way, it can make members being more passionate about contributions to the projects.  

### RFC.
RFC is short for request for command. TiDB community requests everyone to upload a markdown file to the remote repository when they make a contribution to TiDB project. It would let other contributors know what does the code do easily.  
# Conclusion.
as of today, TiDB has grown up to be a large cloud database. The progress is achieved by the combination of leaders, contributors and Users. `Community` plays an important role in the development of TiDB.  

# Reference.
[1] [https://github.com/pingcap/community/blob/master/communicating.md](https://github.com/pingcap/community/blob/master/communicating.md)  
[2] [https://github.com/pingcap/community](https://github.com/pingcap/community)  
[3] [https://github.com/pingcap/community/blob/master/GOVERNANCE.md](https://github.com/pingcap/community/blob/master/GOVERNANCE.md)  