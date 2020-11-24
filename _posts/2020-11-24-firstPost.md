---
layout: post
title:  "6.824 Lab1 MapReduce"
date: 2020-11-24 16:29:10 +0800
categories: [Distributed System, MIT 6824]
tags: [Distributed System,MapReduce]
---
# Preparation
* [MapReduce Paper](http://static.googleusercontent.com/media/research.google.com/zh-CN//archive/mapreduce-osdi04.pdf)
* [Lab1](https://pdos.csail.mit.edu/6.824/labs/lab-mr.html)

# Summary
Lab1 is to implement a **Worker** process and a **Master** process.  
* Whole process:   
`go build -buildmode=plugin ../mrapps/wc.go` first build word-count plugin.  
`go run mrmaster.go pg-*.txt` runs a Master process and takes `pg-*.txt` as input files.  
`go run mrworker.go wc.so` runs a worker process.  
* Jobs:  
Three files that need to be implemented.  
`mr/worker.go` Worker Process calls Map or Reduce functions when Master hands out tasks to it.  
`mr/master.go` check tasks are available, hands out tasks to worker process.  
`mr/rpc.go` Communication between Worker and Master.  

# Implementation
Since I am not allowed to publish my code, I am going to put some hints here.  
`master.go`
```
type Master struct {
	// Your definitions here.
	mu sync.Mutex  // Lock for Master
	mapTask []Task // Map tasks, pg-*.txt.
	reduceTask []Task // Reduce tasks.
	intermediate map[int][]string // intermediate files after Map functions finished,
	                              // but before Reduce functions begins.
	NReduce int
	State string // states
	End int
}
```
* `mapTask`     Holds all files which need to be mapped. Actually, files are pg-*.txt.
* `reduceTask`  Similar to mapTask. in my code, the size of it is equal to `nReduce`.
* `intermediate`Match mapTask to reduceTask. like a bridge connect between them.  The size of it is M * N, M is the size of mapTask and N is equal to `nReduce`. 
* `State`       4 states. "map", "wait", "reduce", "finished".
    
`rpc.go`
```
type Task struct {
	Type string // "UnAssigned, Assigned, Finished"
	Id int
	Filename string // pg-*.txt
	State int    // finished or not
	NReduce int
	Time time.Time // record the time.
	Inter []string // intermiediate files after Map function is finished.
}
```
* `State`       3 states: "UnAssigned", "Assigned", "Finished".
* `Time`        Master should resend the task to Worker if worker fails for some reasons.
* `Inter`       files need to be Reduced.  
# Result
![Result](https://raw.githubusercontent.com/cheng1621/HelloMike.github.io/master/assets/img/sample/lab1_result.png)



