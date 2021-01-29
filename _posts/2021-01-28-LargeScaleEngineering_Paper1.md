---
layout: post
title:  "Waterfall vs Agile"
date: 2021-01-28 19:10:10 +0800
categories: [Large Scale Software Engineering]
tags: [Large Scale Software Engineering, paper1]
---

# Summary.  
`Waterfall` and `Aigle` are two methologies which are largely used in industry, market and courseworks. Which methology is goint to use is always a question which is needed to be further discuessed. This paper is not going to talk about which one is right and the other one is wrong. This paper is going to focus on the difference between `Waterfall` and `Agile` and focus on the `developing process` of the whole project. Both of them can help a development team produce a high-quality software.  
# What is Waterfall methodology. 
`Waterfall` methodology is a sequential approach that divides the SDLC to distinct phases such as requirements gathering, analysis and design, coding and unit testing, system and user acceptance testing, and deployment. The next phase can only proceed if the previous phase has been completed. In between phases, a deliverable is expected or a document is signed off. All phases are passed through and completed only once, so all requirements are gathered as much as possible at the start to provide the information in creating the plans, schedules, budget, and resources. It is plan-driven, so any changes after the project has started would offset the original plan and require a restart.  
# What is Agile methodology. 
`Agile` is a practice that helps continuous iteration of development and testing in the software development process. Development and testing activities are concurrent, unlike the Waterfall model which means more communications are allowed between customers.  

# Difference. [1]
[Difference reference](https://www.guru99.com/waterfall-vs-agile.html) 
![Agile vs Waterfall](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/Agile_vs_Waterfall.jpg) 
1. `Agile` is a methodology which follows an incremental approach while `Waterfall` is sequential design process.  
2. `Agile` is known for flexibility while `Waterfall` is a solid structured software development methodology.  
3. `Agile` performs testing concurrently with software development whereas in `Waterfall` methodology testing comes after the “Build” phase.  
4. `Agile` allows changes in project development requirement whereas `Waterfall` has no scope of changing the requirements once the project development starts.  

# Advantage. [2]
[Waterfall vs Agile](https://project-management.com/agile-vs-waterfall/)  
For `Waterfall`:
> 1. it is straight planing and designing due to the agreement on deliverables at the start of the project.
2. Better design with whole-system approach.
3. Defined scope of work.
4. Easier costing.
5. Clear measurements of progress.

For `Agile`: 
> 1. Faster software development life cycle
2. Predictable schedule in sprints
3. Customer-focused, resulting in increased customer satisfaction
4. Flexible in accepting changes
5. Empowers teams to manage projects
6. Promotes efficient communications

# Disadvantage. [2]
`Waterfall`: 
> 1. Rigid structure to allow necessary changes  
2. No allowance for uncertainty  
3. Limited customer engagement, resulting in poor satisfaction  
4. Sequential approach is not ideal for a large-sized project where the end result is too far in the future  
5. Testing is done only at the latter phases of the project.   

`Agile`:  
> 1. Agile requires a high degree of customer involvement, which not all customers are comfortable with or prefer to give.
2. Agile assumes every team member is completely dedicated to the project, without which weakens the principle of self-management.
3. A time-boxed iteration may not be enough to accommodate all deliverables, which will require changes in priority and additional sprints that can bring up cost.
4. Agile recommends co-location for efficient communication, which is not always possible.

# Examples. 
`Waterfall`:  
I never worked in a company, so I don't know how does Agile or Waterfall look like in company,but I think Agile or Waterfall support for company is really complex and beyond my imagination. For the following parapragh I just want to take some courseworks as examples.  
In a way, I don't even notice some works I have done is actually using Waterfall methodology. 

For the course about distributed system:    [Link](https://pdos.csail.mit.edu/6.824/schedule.html),  
the whole structure is using waterfall methodology, it makes a schedule that what students should do in each day. (`Advantage 2`). Actually, it was divided into several phases based on weeks. `Advantage 1`. When I firstly see this page, I can realise what I am supposed to learn during this course and there is a clear target in my mind that I know what I can do after taking this course. I think this course is really good for the students who have no knowledge about distributed system.  
![Lecture Scedule](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/large_scale_engieering_paper1_1.png)  
For the figure above, it defined the scope of the lecture, such as `Video` and `Preparation`. I know what I should do before watching the video, I need to read the paper about GFS first. Actually, it use `waterfall` methodology, since if you don't read the paper before you go to the video link, you can't understand the lecture well. (`Advanteage 3`) Moreover, it is really easy for everyone to measure their progress, since you know whether you have read the paper or not and whether you understand well about lecture or not. (`Advantage 5`). 

For the lab part, there are 4 parts: lab1 to lab4.  
The whole lab is to build a key/value storage database and it is divided into 4 labs. the most important thing is that if you do not finish lab1, let's say there is a bug in lab1. There has to be a problem when you go into lab2 if you do not deal with that problem in lab1, which matches the `waterfall` methodology. Each phase should be reviewed and confirmed before you go into the next phase.(`Advantage 5`)  

Each coins have two sides, although everyone can get a lot after taking all the lectures and finishing all the labs, it is really hard to achieve it. Firstly, `Golang` is really new language and maybe no students have a experience about it. This course never takes this into consideration. For me, I feel frustrated when I spend 1 week on the golang. (`Disadvantage 2`), it has no allowance for uncertainty.  
Worsely, only if you write a code without bugs, you can pass all the tests. It means that there is no way for you to find where is the problem. (`Disadvantage 5`).  

I think it would be better if this course combines `Waterfall` and `Agile` into the course design part.  

`Agile`:  
I can't think of a specific example which is only use Agile. I just recall a simple part which include `Agile`. In this course, professor opens a `discussion tabs` and asks if the amount of reading is ok for everyone, I think it a part of `Agile`.  
A popular common example is `Scrum`. 

Scrum is a hands-on system consisting of simple interlocking steps and components:  
> Example: Bill meets with a customer to discuss her company’s needs. Those needs are the product backlog. Bill chooses the most important tasks to work on in the next two weeks. His team meets in a daily scrum to target work for the day ahead and address roadblocks. At the end of the sprint, Bill delivers the work, reviews the backlog, and sets the goal for the next sprint. The cycle repeats until the software is complete. [4]  

# Mixing Agile and Waterfall.
It's rare to see a software that follows a single methodology. Both of them are right or resonable for their organizaions. Agile and Waterfall can not only coexist but also play well together.

# Conclusion.
Although `Agile` and `Waterfall` are two different methodologies which apply to the software projects design and developments. The purposes of them is to ensure the end product of high quality.  
`Waterfall` methodology is mainly used in a situation: the team has specific and straight-forward target, like I need to implement something based on paper, because no customer-involvement is needed in this process.  
`Agile` methodology is mainly used in a situation: the work has some kind of uncertainty, like the team needs some feedback from customers or leaders. 

# Reference. 
[1] [https://project-management.com/agile-vs-waterfall/](https://project-management.com/agile-vs-waterfall/)  
[2] [https://www.guru99.com/waterfall-vs-agile.html](https://www.guru99.com/waterfall-vs-agile.html)  
[3] [https://techbeacon.com/app-dev-testing/managing-agile-waterfall-together](https://techbeacon.com/app-dev-testing/managing-agile-waterfall-together)  
[4] [https://stackify.com/agile-methodology/](https://stackify.com/agile-methodology/)  
