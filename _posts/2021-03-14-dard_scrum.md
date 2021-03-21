---
layout: post
title:  "Dark Scrum"
date: 2021-03-14 19:10:10 +0800
categories: [Large Scale Software Engineering]
tags: [Large Scale Software Engineering, paper3]
---

# What is Dark Scrum.  
A Scrum environment should be fostered like these: 
1. a produce owner orders the work for a complex problem into a Product Backlog.  
2. The Scrum Team turns a selection of the work into an Increment of value during a Sprint.  
3. The Scrum Team and its stakeholders inspect the results and adjust for the next Sprint.  
4. Repeat  
these things are ideal and are designed as a concept, it's a different story when it goes back into the reality. That's when Dark Scrum happens. it happens when all of the concepts of Agile and all the different aspects of teamwork are ridiculed with unreasonable expectations put forth by any number of people associated with the project.[1]  

# Some symptoms of darkness. 
#### people know their old jobs, not their new Scrum job.
> Scrum generally starts with very few people trained, even fewer understanding it, and a lot of people who think they know what they’re supposed to do. It should be no surprise if they do it wrong, and very often they do.[2].  

everyone knows what he is supposed to do, but there are some conflicts between programmars and power holders, like the power holders only care about what jobs need to be done, they decide what the programmars should do and put pressure on them even though programmars thinks they are not capable of doing it in a short time. In that cases, programmars try to find the shortcut to finish the job without required bug testing. the result could be:  

> instead of the team rallying around their joint mission and sorting out a good approach for the day, someone else drags information out of them, processes it in their head, and then tells everyone what to do. Since nothing ever goes quite as we expected yesterday morning, this improper activity often comes with a lot of blame-casting and tension.[2]

#### team doesn't decide how much work to do.
> power holders have little or no idea how to program, and the programmers usually at least have some clue. They have no idea what the state of the code is, and the programmers usually do know.[2].  

In theory, Scrum Produce owner is supposed to meet the team frequently and decide what's needed for the team. Programmar begins to know how to build based on the proposals. Practically, there may be even be a product owner in the team, even if there is, the product owner is not well trained.  

Result could be, programmars try their best to do the infinite missions, because power owner pile up the mission always. It's no surprise that developers fail again.  

#### The team is always reminded of failure. 
> the Dark Sprint Review begins by someone reminding everyone what the team “promised” to do. (That is, what was demanded right before the team said “We’ll try”. That’s a promise, isn’t it?) Then we look at the pitiful failure the team brings us. They make sure the programmers are made fully aware of how badly they’ve done. That will surely inspire everyone to do better next time.[2].  

Instead of doing things better, programmars just want to take shortcut to get all the missions finished. They implement something without bug testing, a complete design.  

# Why Scrum is being abused always.
power owners don't see the future of the product and the only way to release the fear is to put more and more pressure on the developers.  

some cases that would happen.  
If the product has a lot of known defects, power owners assume there would be more defects. They would put pressure on the programmars.  
Features would come out slowly if programmar focus more on the design parts, which could make power owner feel fear.  
Design could fall behind if someone slow down the process.  


# some ways to solve Dark Scrum.  

#### Acceptance Testing. 
Each little example becomes an acceptance test for the story or backlog item in question. After testing, programmars and product owner could know how good is the product. PO can decide the following step based on the test.  

#### Incremental Design. 
A small product does not need the whole design at the beginning. However, as the product grows, a big and complete design is needed. A small incremental design is required after each Sprint process. Although the Design process is really difficult, since it requires skill in design, skill in testing, and skill in refactoring.  

#### Refactoring. 
> Refactoring is a process of transforming the code, usually in very small steps, to make it better.  

Refactoring is not re-writing the code, it expects a better design by the end of the current Sprint.  

#### Programmar Testing. 
Programmar Testing is required in addition to the Acceptance Testing. programmars could aviod mistake by Programmar Testing. The best Programmar Testing is `Test-Driven Development`. The step is like that:
1. Think of some small next step on the way to our feature. Write a test that should run when that step is complete. Run it: make sure it doesn’t work now.  
2. Build the code to make the step complete. Run the test: make sure it works now.  
3. Check the code to see if it looks clear enough. If not, refactor it. Run the test again to be sure everything still works.  
4. Repeat until the feature is done.  

Some design problems cannot be noticed immediately, programmar testing could help us with larger refactorings.  

#### Continuous Integration. 
> Scrum requires a running, thoroughly-tested, usable increment, containing the value of all the backlog items from previous Sprints: a complete, running, tested, operable program. Delayed integration uncovers problems, many of which require substantial debugging.  


# how to do.
> People can’t just click over into Scrum’s new mode of operation. It takes time to unlearn the old ways. It takes time to learn new habits, time to learn to trust the team. It takes time for the team to learn how to be trusted: in a way that’s the underlying message of this article. Scrum’s training begins this learning process for the people who get the training.[2].  

# Some thoughts about Dark Scrum. 
I read another article about someone who was forced to do Dark Scrum.[3]
The summary is the project manager want to know how long it would take to complete the project, so Agile coach directed the team to estimate user story sizes on the existing backlog. The problem is team had no sense of how much time a story point was a proxy is. The result is the team had a target of a certain number of story points per sprint, which they had to meet or work overtime.  
`Goodhart’s Law:` “When a measure becomes a target, it ceases to be a good measure”. This law could describe that situation very precisely.  
The author said that although the leader agreed on every point he listed, and said that actually he wanted to coach the team to do the healthy thing, but that the contract which was in place prevented him from doing so. I think the real problem is everyone has a leader, your leader could have a leader, every leader don't want to take responsible for a failure. instead of doing things right, they choose to do the things based on the old experience and don't want to try new Scrum project. I always think that everyone has understood Scrum well in theory, they dont want to put in in practice just because the contract forced them to do the `Dark Scrum`. I think that's the real problems.  

# Reference.
[1] [https://www.ntaskmanager.com/blog/dark-scrum/](https://www.ntaskmanager.com/blog/dark-scrum/)  
[2] [https://ronjeffries.com/articles/016-09ff/defense/](https://ronjeffries.com/articles/016-09ff/defense/)  
[3] [https://medium.com/@rogersaner/how-i-was-forced-to-do-dark-scrum-d5fdb388df4f](https://medium.com/@rogersaner/how-i-was-forced-to-do-dark-scrum-d5fdb388df4f)  
