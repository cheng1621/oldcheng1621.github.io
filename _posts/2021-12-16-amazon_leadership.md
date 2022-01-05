---
layout: post
title:  "Amazon bq question"
date: 2021-09-30 19:10:10 +0800
categories: [interview]
tags: [Amazon]
---

# why Amazon?
Amazon is one of the big tech company nowdays, and I believe working at Amazon is everyone's dream. so am I. Besides of that, there are a lot of talented people in amazon creating amazing products to make people's life easier. This spirit touch me a lot. I am always curious about the new stuff and I also have a great passion to learn something. when I heard about the word "distributed system", I implemented a key/value storage system based on raft. I heard that facebook changed its name to meta, then I try to know what the metauniverse is. and I hope to work with someone who is also curious about everything and has a great passion to learn, and I think we can apply our idea into reality in the future to make the world better. that's why I want to join amazon.

# why I choose this position.
the first and the most important reason is that my experience matched the job description. the second reason that I like to create great services for customers to save their time and money. In my distributed system project, I care about low-latency and performance. When I implemented it. I implemented **snapshot** to improve the performance of log replaying. I divide the whole service into several partition to avoid the situation that one of the server becomes hot spot. I think in aws, there must be many ways to improve performance of the service. and I want to learn more about that. that's what brings me here with this good opportunity.   


# The biggest mistake you made and what did you learn from it? (earn trust, customer obsession.)
Overview: **miscalcuate the workload** and **working in CISDI**
S: When I was working as a software engineer in CISDI. My responsibility is to implement a web crawler. Sometimes my team member need a dataset from the internet and my responsiblity is to implement a web crawler and generate a dataset. 
T: I remembered that I got a task that I needed to implemented a web crawler to crawl a webpage in a week. 
A: My intentions to join the company was to learn new things and improve my programming skills. When I got this task. I tried to finish it in a perfect way. For example, I tried to choose multi-thread over single-thread. I implemented a filter which is used to filter the duplicate url out. I spent a log of time on searching for resources on the Internet. Then On Friday, After I finished the implementation, I ran the program on my local machine and started to generate the dataset. Until then, I noticed that the data is huge. Traffic Condition could be changed in a second. 
R: I just couldn't finish it by the due date. I got a negative feedback from my boss. From that experience, I learned that I need to communicate with my mentor about my plan and have a good calculation about my task. and although the detais are really important, I should pay attention to the whole schedule to guarantee my schedule won't affect others.  

TODO: TA job. or Research Job.

# Most challenging job.
Overview: MIT 6.824
S: My most challenging job is my distributed system project. 
T: It is challenging because I need to implement Raft consensus algorithm that is not easy to learn. I also need to implement a key/value service on top of raft. Besides that, I need to pay attention to some preformance, like performance of log replaying, and I shard the database to avoid being hot spot. Everything was new to me at that time. Besides that, I needed to learn a new language Go. When I came up with a new solution, I just tried it and started to implement. However, it's always forces me to go back to the start point, just because I miscalculated how complex my idea was. Fortunately, I keeping trying and everything has been implemented. So through this experience, I learned that it's important to be curious about something, the most important thing is to keeping trying. the more I tried, the closer I am to the success.

# couldn't finish tasks before deadline. Related to biggest mistake.
OverView: 
S: I still remembered that Last semester, I took a course about Compiler course. 
T: the professor usually propose the homework in advance. like I should finish it in 3 weeks. I was thinking, 3 weeks is too much. I keeping playing until one week bofore the due date. I suddenly received an interview invitaion in that week. which means i need to prepare for the interview while I need to finish the homework. 

R: I got rejected in that interview because I don't have a good preparation. Although I finish my homework by the end of the due date. I got a pretty low score. From that experience, I learned that you should finish what I should do firstly, and thinking others. Since then, I start to make a priority list every two weeks. 

1. customer obsession.
Overview: TA Job.
S: Last semester, I worked as a TA in the database class . my responsibility is to grade the homework and hold the meeting and give a help to the student who has a problem.  
T: I still remembered that One student came to me, like please help me with the installation of a tool. he also sent me a snap about what the problem is.
A1: I took a look at the snap, for me, the problem is really easy because I met this before. I googled some and send the link which I think is really helpful to him. I thought this thing is over. Next day, he came to me again, and sent me another snapshot. I took a look at the snap and found that the problem is almost the same. If he followed the instruction I sent to hom, it would work. The problem is that he didn't follow the instruction and combine all the things together. Then I realised that I tried to help him in my way and didnt think in his way. That's the main cause. Sometimes, some people just focus on how to use the tool and ignore how to install it. Then, I talked to him like we could meet in the library and figuare out the problem. Student need to go to school everyday. 
R: Student sends a good feedback to me, like I spend some of my personal time helping him.  


2. Ownership.  
# Tell me about a time when you had to leave a task unfinished.
S: When I worked as a software engineer in CISDI company. When the internship was close to end. 
T: I received a new job and I was told to finish it in two weeks. I realised that maybe the time is not enough for me to finish it. 
A: Then on the last two days, I just figure out what I did in this project and started to write a document, like the abstract of this project. where it's now. What should be implemented more. What's the plan of the furture. I looked into the code. Although there are comments, sometimes the comment. I just updated the comment.
R: I hope it would be helpful for others who take over my job.

# tell me about a time when you had to work on a project with unclear responsibilities.  
S: When I worked as a software engineer in Schneider company. My boss hire two interns. Our reponsiblity is to implement Software. 
T: One day, My boss gave us a job which needs us to implement a small system.
A: When I took that job. I talked to someone, figure out the requirments, like what does the interface look like. what features do I need to implement. My part went smoothly and I never meet a big difficulties. But for my coworker. Maybe the requiremnt is too much. maybe the feature he was going to add is really challenging. For some reasons, he stuck on something. When my part is finished and got a postive feedback from the member. I step in and decide to help him in my way. He passed me some requirements. during that time. I just talked to the custormer. I am taking over the job. I talked to the customer directly and make clear requirements. 
R: we got a postive feedback from my boss and customers.

3. invent and simplify
# Tell me about a time when you gave a simple solution to a complex problem.  
Overview: project.
When I implemented my distributed system project. Distributed system, the bug could happend anywhere at any time. it is really challenging to debug it. Then I ask myself, like why don't I implement a small log filter. I just implemented it. I need to find where the problem happens. filter system just filter something out. 

4. are right, a lot.


